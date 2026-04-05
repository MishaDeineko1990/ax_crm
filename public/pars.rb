require 'json'
require 'optparse'
require 'cgi'

options = {
  dir: File.expand_path(File.dirname(__FILE__)),
  min: 1,
  max: 2,
  out: '1.txt',
  oblast: '',
  raion: ''
}

OptionParser.new do |opt|
  opt.on('--dir DIR', String) { |v| options[:dir] = v }
  opt.on('--min N', Integer) { |v| options[:min] = v }
  opt.on('--max N', Integer) { |v| options[:max] = v }
  opt.on('--out FILE', String) { |v| options[:out] = v }
  opt.on('--oblast NAME', String) { |v| options[:oblast] = v }
  opt.on('--raion NAME', String) { |v| options[:raion] = v }
end.parse!(ARGV)

results = []

(options[:min]..options[:max]).each do |i|
  path = File.join(options[:dir], "#{i}.html")
  next unless File.exist?(path)
  html = File.read(path, encoding: 'UTF-8')
  cards = html.scan(/<a[^>]*class="[^"]*flex[^"]*flex-col[^"]*h-full[^"]*"[^>]*>(.*?)<\/a>/m).map { |m| m[0] }
  cards.each do |card|
    name = (card[/<h1[^>]*>(.*?)<\/h1>/m, 1] || '').strip
    name = CGI.unescapeHTML(name)
    next if name.empty?
    edrpou = (card(/[> ](?:Є|Е)ДРПОУ\s*([0-9]{5,10})</m, 1) rescue nil) || ''
    edrpou = edrpou.strip
    manager = (card[/<h3[^>]*>[^<]*Керівник[^<]*<\/h3>.*?<div[^>]*class="[^"]*font-semibold[^"]*"[^>]*>(.*?)<\/div>/m, 1] || '').strip
    address = ''
    addr_match = card.scan(/<div[^>]*class="[^"]*text-gray43[^"]*"[^>]*>(.*?)<\/div>/m).map { |x| x[0] }
    address = CGI.unescapeHTML(addr_match.first.to_s.strip) if addr_match.any?
    acts = card.scan(/<div[^>]*class="[^"]*mx-1[^"]*"[^>]*>(.*?)<\/div>/m).map { |x| CGI.unescapeHTML(x[0].strip) }.select { |t| !t.empty? }.map { |t| { 'опис' => t, 'додаткові_дані' => '' } }
    emails = card.scan(/<a[^>]*href="mailto:([^"]+)"/m).map { |x| x[0].strip }.map { |e| { 'опис' => 'Електронна пошта', 'додаткові_дані' => e } }
    land = []
    land_val = (card[/>\s*([0-9]{1,6})\s*га\b/m, 1] || '').strip
    land = [{ 'опис' => 'Площа', 'додаткові_дані' => land_val }] unless land_val.empty?
    phones = card.scan(/<a[^>]*href="tel:[^"]+"[^>]*>.*?<div[^>]*class="[^"]*text-gray43[^"]*"[^>]*>(.*?)<\/div>/m).map { |x| CGI.unescapeHTML(x[0].strip) }.map do |txt|
      label = 'Телефон'
      if txt =~ /\(.*вайбер.*\)/i
        label = 'Мобільний (вайбер)'
      elsif txt =~ /\(\d+.*\)/ || txt =~ /^0\(\d+\)/
        label = 'Стаціонарний'
      end
      { 'опис' => label, 'додаткові_дані' => txt.gsub(/\s+/, ' ').strip }
    end
    extras = []
    extra_text = (card[/<h3[^>]*>[^<]*Сільська рада[^<]*<\/h3>.*?<div[^>]*class="[^"]*mx-2[^"]*"[^>]*>(.*?)<\/div>/m, 1] || '').strip
    extras << CGI.unescapeHTML(extra_text) unless extra_text.empty?
    obj = {
      'Область' => options[:oblast],
      'Район' => options[:raion],
      'Назва' => name,
      'ЕГРПОУ' => edrpou,
      'Керівник' => manager.empty? ? [] : [{ 'опис' => 'Керівник', 'додаткові_дані' => manager }],
      'Адреса' => address.empty? ? [] : [{ 'опис' => 'Адреса', 'додаткові_дані' => address }],
      'Види_діяльності' => acts,
      'Імейл' => emails,
      'Земельний_банк' => land,
      'Номери_телефонів' => phones,
      'Додаткові_дані' => extras
    }
    results << obj
  end
end

out_path = File.join(options[:dir], options[:out])
File.open(out_path, 'w:UTF-8') { |f| f.write(JSON.pretty_generate(results)) }