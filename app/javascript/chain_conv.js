document.addEventListener('DOMContentLoaded', function() {
    const app = {
        data() {
            return {
                currentImage: '/assets/chain_conv/ch_conv_1.jpg',
                hasDistributor: false,
                distributorLength: 0
            }
        }
    };

    Vue.createApp(app).mount('#distributorApp');
});
