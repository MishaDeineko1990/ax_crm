document.addEventListener('DOMContentLoaded', function() {
    const app = {
        data() {
            return {
                currentImage: '/assets/chain_conv/conveyor.svg',
                hasDistributor: false,
                distributorLength: 0
            }
        }
    };

    Vue.createApp(app).mount('#distributorApp');
});
