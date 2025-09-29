// Password visibility toggle functionality
document.addEventListener('DOMContentLoaded', function() {
  // Find all password toggle buttons
  const toggleButtons = document.querySelectorAll('.password-toggle-btn');
  
  toggleButtons.forEach(function(button) {
    button.addEventListener('click', function(e) {
      e.preventDefault();
      
      // Find the associated password input
      const passwordInput = button.parentElement.querySelector('input[type="password"], input[type="text"]');
      const icon = button.querySelector('.toggle-icon');
      
      if (passwordInput) {
        if (passwordInput.type === 'password') {
          // Show password
          passwordInput.type = 'text';
          icon.textContent = '🙈'; // Hide icon
          button.setAttribute('aria-label', 'Приховати пароль');
          button.title = 'Приховати пароль';
        } else {
          // Hide password
          passwordInput.type = 'password';
          icon.textContent = '👁️'; // Show icon
          button.setAttribute('aria-label', 'Показати пароль');
          button.title = 'Показати пароль';
        }
      }
    });
  });
});