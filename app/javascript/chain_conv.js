document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('.chain-conv-form');
    
    if (form) {
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Отримання значень з форми
            const coating = document.querySelector('input[name="coating"]:checked')?.value;
            const chainType = document.querySelector('input[name="chain_type"]:checked')?.value;
            const length = document.querySelector('input[name="length"]')?.value;
            const width = document.querySelector('input[name="width"]')?.value;
            
            // Валідація
            if (!coating || !chainType || !length || !width) {
                alert('Будь ласка, заповніть всі поля');
                return;
            }
            
            // Тут можна додати логіку розрахунку
            calculateChainConveyor({
                coating,
                chainType,
                length: parseFloat(length),
                width: parseFloat(width)
            });
        });
    }
});

function calculateChainConveyor(params) {
    // Логіка розрахунку
    console.log('Параметри для розрахунку:', params);
    // Додайте власну логіку розрахунку тут
}

// Додаткові допоміжні функції можна додати тут