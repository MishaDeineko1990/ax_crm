document.addEventListener('DOMContentLoaded', function() {
    const app = {
        data() {
            return {
                hasDistributor: false,
                hasDistributor_futer: false,
                distributorLength: 0
            }
        },
        computed: {
            currentImage() {
                return this.hasDistributor 
                    ? '/assets/chain_conv/ch_conv_2.png'
                    : '/assets/chain_conv/ch_conv_1.jpg';
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
