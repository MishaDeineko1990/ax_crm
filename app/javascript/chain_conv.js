document.addEventListener('DOMContentLoaded', function() {
    const app = {
        data() {
            return {
                hasDistributor: false,
                distributorLength: 0
            }
        },
        computed: {
            currentImage() {
                return this.hasDistributor 
                    ? '/assets/chain_conv/ch_conv_2.jpg'
                    : '/assets/chain_conv/ch_conv_1.jpg';
            }
        }
    };

    Vue.createApp(app).mount('#distributorApp');
});
