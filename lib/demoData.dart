// It contains all our demo data that we used
final List<String> demoRestaurantNames = [
  "Emilis",
  "Garagem",
  "Chik-Chik restaurante",
  "Abel gerra Paulo",
  "Flamingo",
  "Vitoria"
  // Add more restaurant names here as needed
];

final Map<String, String> restaurantImages = {
  "Emilis": "assets/images/emilis.jpg",
  "Garagem": "assets/images/garagem.jpg",
  "Chik-Chik restaurante": "assets/images/chik_chik.jpg",
  "Abel gerra Paulo": "assets/images/abel_gerra.png",
  "Vitoria": "assets/images/victoria.jpg"
  // Add more restaurant names and images here as needed
};

List<String> demoBigImages = [
  "assets/images/garagem.jpg",
  "assets/images/emilis.jpg",
  "assets/images/chik_chik.jpg",
  "assets/images/abel_gerra.png",
  "assets/images/frangos.png",
  "assets/images/menu7.jpg",
  "assets/images/panados.jpg",
  "assets/images/colher.jpg",
  "assets/images/milhos.jpg"
];

List<Map<String, dynamic>> demoMediumCardData = [
  {
    "name": "Garagem",
    "image": "assets/images/menu1.jpg",
    "location": "Cuito, Bié",
    "rating": 8.6,
    "delivertTime": 20,
  },
  {
    "name": "Emilis",
    "image": "assets/images/menu2.jpg",
    "location": "Cuito, Bié",
    "rating": 9.1,
    "delivertTime": 35,
  },
  {
    "name": "Chik-Chik restaurante",
    "image": "assets/images/menu3.jpg",
    "location": "Cuito, Bié",
    "rating": 7.3,
    "delivertTime": 25,
  },
  {
    "name": "Abel gerra Paulo",
    "image": "assets/images/menu4.jpg",
    "location": "Cuito, Bié",
    "rating": 8.4,
    "delivertTime": 30,
  },
  {
    "name": "Flamingo",
    "image": "assets/images/menu5.jpg",
    "location": "Cuito, Bié",
    "rating": 9.5,
    "delivertTime": 15,
  }
];

final Map<String, List<Map<String, dynamic>>> restaurantMenu = {
  "Garagem": [
    {
      "name": "Costelas de porco",
      "location": "Cuito, Bié",
      "image": "assets/images/menu2.jpg",
      "foodType": "frango",
      "price": 2557,
      "priceRange": "\$ \$",
    },
    {
      "name": "Frango panado",
      "location": "Cuito, Bié",
      "image": "assets/images/menu3.jpg",
      "foodType": "frango",
      "price": 4500,
      "priceRange": "\$ \$",
    },
    // เมนูอาหารอื่นๆ ของร้าน "Garagem" ไปต่อที่นี่
  ],
  "Emilis": [
    {
      "name": "Costelas de porco",
      "location": "Cuito, Bié",
      "image": "assets/images/menu4.jpg",
      "foodType": "frango",
      "price": 2557,
      "priceRange": "\$ \$",
    },
    {
      "name": "Frango panado",
      "location": "Cuito, Bié",
      "image": "assets/images/menu5.jpg",
      "foodType": "frango",
      "price": 4500,
      "priceRange": "\$ \$",
    },
  ],
};
