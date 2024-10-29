document.addEventListener('DOMContentLoaded', function() {
    const toggleButton = document.getElementById('toggleButton_right_menu_1');
    const popup = document.getElementById('popup_right_menu_1');
    const closeButton = document.getElementById('closeButton_right_menu_1');

    // Функція для оновлення іконки
    const updateToggleButtonIcon = () => {
        if (popup.classList.contains('hidden_right_menu_1')) {
            toggleButton.innerHTML = '<i class="material-icons">arrow_left</i>'; // Стрілка вліво
        } else {
            toggleButton.innerHTML = '<i class="material-icons">arrow_right</i>'; // Стрілка вправо
        }
    };

    // Обробник події для кнопки перемикання
    toggleButton.addEventListener('click', () => {
        popup.classList.toggle('hidden_right_menu_1');
        updateToggleButtonIcon();
    });

    // Обробник події для кнопки закриття
    closeButton.addEventListener('click', () => {
        popup.classList.add('hidden_right_menu_1');
        updateToggleButtonIcon(); // Оновлюємо іконку при закритті
    });

    // Оновлюємо іконку при початковій завантаженні
    updateToggleButtonIcon();
});
