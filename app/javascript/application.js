// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "./home/header"
import "./password_toggle"

//= require rails-ujs

import Rails from "rails-ujs"
Rails.start()