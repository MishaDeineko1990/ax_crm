new Vue({
  el: '#distributorApp',
  data: {
    hasDistributor: false,
    distributorLength: null,
    data_shkr: [],
    tables: [
      {
        name: "MR",
        url: "https://script.google.com/macros/s/AKfycbzMg_jaGqQkMSqjXQAbhsvaCc16n-Cn2513om5-vNgU-uFJL4Z-gFpoXSkQgev5stsB/exec"
      },
      {
        name: "tsh_parts_price",
        url: "https://script.google.com/macros/s/AKfycbwgvuaBSBb-EEkWGwFCV0gYjOcJ7e94Lko8qmCh2qrniXMVFpAomypQJQvjSBCm6q4L/exec"
      },
      {
        name: "tsh_leangth_kWt",
        url: "https://script.google.com/macros/s/AKfycbxNZn_bJqPj7QuhZJC-gkzEWW3NauE5cAySfQ_nhEoX3kB0dRGatP3i_0m_qd7fWbQIhA/exec"
      }
    ]
  },
  computed: {
    currentImage() {
      return this.hasDistributor ? '/images/Scraper_conveyor2.svg' : '/images/banner22.svg';
    }
  },
  methods: {
    processData() {
      this.tables.forEach(item => {
        $.ajax({
          url: item.url,
          dataType: "json",
          success: (data) => {
            this.data_shkr.push(item.name, data);
            console.log('Отримані дані:', this.data_shkr);
          },
          error: (xhr, status, error) => {
            console.error("Помилка при отриманні даних:", status, error);
          }
        });
      });
    },
    calculateChainConveyor(params) {
      // Логіка розрахунку
      console.log('Параметри для розрахунку:', params);
      // Додайте власну логіку розрахунку тут
    },
    updateImage() {
      // Оновлення зображення в залежності від наявності розподільного механізму
      const imageElement = document.querySelector('.chain-conv-image');
      if (imageElement) {
        imageElement.src = this.currentImage;
      }
    }
  },
  watch: {
    hasDistributor(newVal) {
      this.updateImage();
      if (!newVal) {
        this.distributorLength = null;
      }
    }
  },
  mounted() {
    this.processData();
    this.updateImage();
  }
});