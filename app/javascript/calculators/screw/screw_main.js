// jQuery-версія логіки калькулятора шнека (простішо для розуміння)
// - Чітко: показує/ховає вибрані форми, читає інпути, оновлює стан
// - Використовує .show() / .hide() та прості обробники подій

(function ($) {
  // Якщо jQuery не підключено — нічого не робимо, щоб уникнути помилок
  if (!$) {
    console.warn('ScrewCalc: потрібен jQuery для цієї простої реалізації');
    return;
  }

  $(function () {
    // Прості селектори та відповідність частин форм
    var selectors = {
      radioName: 'screwType',
      forms: {
        segment: '#segmentForm',
        spiral: '#spiralForm',
        repair: '#repairForm'
      }
    };

    // Стан калькулятора
    var state = {
      type: 'segment',
      segment: { D: null, d: null, P: null, S: null },
      spiral: { D: null, d: null, P: null, S: null },
      repair: { D: null, d: null, P: null, S: null }
    };

    // Перетворення у число або null
    function num(v) {
      var n = parseFloat(v);
      return isFinite(n) ? n : null;
    }

    // Зчитати інпути конкретної форми у стан
    function readForm(part) {
      var $form = $(selectors.forms[part]);
      if (!$form.length) return;
      var keys = ['D', 'd', 'P', 'S'];
      $form.find('.form-group input[type="number"]').each(function (i) {
        state[part][keys[i]] = num($(this).val());
      });
    }

    // Показати одну форму, решту сховати; оновити стан та візуалізацію
    function setActiveForm(part) {
      $.each(selectors.forms, function (p, sel) {
        var $el = $(sel);
        if (!$el.length) return;
        var isActive = (p === part);
        // Робимо сумісним із Bootstrap (.d-none) та native hidden
        $el.toggleClass('d-none', !isActive)
           .prop('hidden', !isActive);
        if (isActive) { $el.show(); } else { $el.hide(); }
      });
      state.type = part;
      readForm(part);
      updateRadioVisual(part);
    }

    // Позначити активну кнопку (для label.btn)
    function updateRadioVisual(active) {
      var $radios = $('input[name="' + selectors.radioName + '"]');
      $radios.each(function () {
        var $label = $(this).closest('label.btn');
        if (!$label.length) return;
        var isActive = $(this).val() === active && this.checked;
        $label.toggleClass('active', isActive);
      });
    }

    // Прив'язати слухачі до інпутів усіх форм
    function bindInputs() {
      $.each(selectors.forms, function (part, sel) {
        var $form = $(sel);
        if (!$form.length) return;
        var keys = ['D', 'd', 'P', 'S'];
        $form.find('.form-group input[type="number"]').each(function (i) {
          $(this).on('input', function () {
            state[part][keys[i]] = num($(this).val());
          });
        });
      });
    }

    // Перемикання типу шнека (radio)
    function bindRadios() {
      $('input[name="' + selectors.radioName + '"]').on('change', function () {
        if (this.checked) setActiveForm($(this).val());
      });
    }

    // Ініціалізація: підписки та встановлення початкової форми
    bindRadios();
    bindInputs();
    var initial = $('input[name="' + selectors.radioName + '"]:checked').val() || 'segment';
    setActiveForm(initial);

    // Простий API для дебагу
    window.ScrewCalc = {
      state: state,
      setActiveForm: setActiveForm,
      readForm: readForm
    };
  });
})(window.jQuery);