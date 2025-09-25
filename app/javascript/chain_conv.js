document.addEventListener('DOMContentLoaded', function() {
    const app = {
        data() {
            return {
                hasDistributor: false,
                hasDistributor_futer: false,
                distributorLength: 0,
                lengthTrans: 0,
                selectedTransType: '25'
            }
        },
        computed: {
            currentImage() {
                return this.hasDistributor 
                    ? '/assets/chain_conv/ch_conv_2.png'
                    : '/assets/chain_conv/ch_conv_1.jpg';
            }
        },
        watch: {
            lengthTrans(newValue) {
                // Обмеження довжини транспортера від 0 до 100
                if (newValue < 0) this.lengthTrans = 0;
                if (newValue > 100) this.lengthTrans = 100;
                
                // Перевірка довжини розподільного механізму
                if (this.distributorLength > (newValue - 2) && newValue > 2) {
                    this.distributorLength = newValue - 2;
                }
            },
            distributorLength(newValue) {
                // Обмеження довжини розподільного механізму
                const maxLength = this.lengthTrans > 2 ? this.lengthTrans - 2 : 0;
                if (newValue < 0) this.distributorLength = 0;
                if (newValue > maxLength) this.distributorLength = maxLength;
            },
            selectedTransType(newValue) {
                console.log('Вибрано тип транспортера:', newValue);
                alert('Вибрано тип транспортера: ТШ ' + newValue);
                alert(' перевірка змінної Вибрано тип транспортера: ТШ ' + this.selectedTransType);
            }
        },
        mounted() {
            // Add event listener for the hasDistributor_futer checkbox
            const futerCheckbox = document.getElementById('hasDistributor_futer');
            if (futerCheckbox) {
                futerCheckbox.addEventListener('change', (event) => {
                    this.hasDistributor_futer = event.target.checked;
                    alert('Футерування: ' + (this.hasDistributor_futer ? 'Увімкнено' : 'Вимкнено'));
                });
            }
        }
    };

    Vue.createApp(app).mount('#distributorApp');
});
