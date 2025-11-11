// Логіка калькулятора шнека (сегмент / спіраль / ремонт)
// - Зчитує значення з інпутів та оновлює змінні через методи
// - Ховає форми, які не вибрані (radio)
// - Організовано як модуль з методами для керування станом

(() => {
  'use strict';

  // Селектори для форм
  const selectors = {
    radioName: 'screwType',
    forms: {
      segment: '#segmentForm',
      spiral: '#spiralForm',
      repair: '#repairForm'
    }
  };

  // Стан калькулятора (усі змінні в одному об'єкті)
  const state = {
    type: 'segment',
    segment: { D: null, d: null, P: null, S: null },
    spiral:  { D: null, d: null, P: null, S: null },
    repair:  { D: null, d: null, P: null, S: null }
  };

  // Допоміжні функції
  const parseNum = (v) => {
    const n = parseFloat(v);
    return Number.isFinite(n) ? n : null;
  };

  // Оновити одну змінну у стані
  function updateField(part, key, value) {
    if (!state[part]) return;
    state[part][key] = value;
  }

  // Прочитати всі інпути форми та оновити стан
  function updateFromForm(part) {
    const form = document.querySelector(selectors.forms[part]);
    if (!form) return;
    const inputs = form.querySelectorAll('.form-group input[type="number"]');
    const keys = ['D', 'd', 'P', 'S'];
    keys.forEach((key, idx) => {
      const input = inputs[idx];
      if (input) updateField(part, key, parseNum(input.value));
    });
  }

  // Показати вибрану форму та приховати інші
  function showForm(part) {
    Object.keys(selectors.forms).forEach(p => {
      const el = document.querySelector(selectors.forms[p]);
      if (!el) return;
      if (p === part) {
        el.classList.remove('d-none');
      } else {
        el.classList.add('d-none');
      }
    });
    state.type = part;
    updateFromForm(part);
    updateRadioStyles(part);
  }

  // Візуально позначити активну кнопку у групі радіо
  function updateRadioStyles(activeValue) {
    const radios = document.querySelectorAll(`input[name="${selectors.radioName}"]`);
    radios.forEach(radio => {
      const label = radio.closest('label.btn');
      if (!label) return;
      if (radio.value === activeValue && radio.checked) {
        label.classList.add('active');
      } else {
        label.classList.remove('active');
      }
    });
  }

  // Підписати обробники на всі інпути для всіх форм
  function bindInputListeners() {
    Object.keys(selectors.forms).forEach(part => {
      const form = document.querySelector(selectors.forms[part]);
      if (!form) return;
      const inputs = form.querySelectorAll('.form-group input[type="number"]');
      const keys = ['D', 'd', 'P', 'S'];
      keys.forEach((key, idx) => {
        const input = inputs[idx];
        if (!input) return;
        input.addEventListener('input', (e) => {
          updateField(part, key, parseNum(e.target.value));
        });
      });
    });
  }

  // Підписати обробники на перемикання типу шнека (radio)
  function bindRadio() {
    const radios = document.querySelectorAll(`input[name="${selectors.radioName}"]`);
    radios.forEach(r => {
      r.addEventListener('change', (e) => {
        if (e.target.checked) {
          showForm(e.target.value);
        }
      });
    });
  }

  // Ініціалізація модуля
  function init() {
    bindRadio();
    bindInputListeners();
    // Встановити початково активну форму
    const checked = document.querySelector(`input[name="${selectors.radioName}"]:checked`);
    const initial = checked ? checked.value : 'segment';
    showForm(initial);
  }

  // Експортуємо методи для можливого використання ззовні (debug/розширення)
  window.ScrewCalc = {
    state,
    updateField,
    updateFromForm,
    showForm
  };

  document.addEventListener('DOMContentLoaded', init);
})();