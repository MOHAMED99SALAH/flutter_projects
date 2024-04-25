import 'dart:convert';

Product productModelJson(String str) => Product.fromJson(json.decode(str));
String productTojson(Product data) => json.encode(data.toJson());

class Product {
  int? id;
  String? name;
  double? price;
  double? quantity;
  String? imagePath;
  int? catgID;
  Product(this.id, this.imagePath, this.name, this.price, this.quantity,
      this.catgID);

  void incrementQ() {
    quantity = quantity! + 1;
  }

  void decrementQ() {
    quantity = quantity! - 1;
  }

  Product.fromJson(Map<String, dynamic> list) {
    this.id = list['productID'];
    this.name = list['name'];
    this.price = double.parse(list['price']);
    this.quantity = list['quantity'];
    this.imagePath = list['imagePath'];
    this.catgID = list['cat_id'];
  }

  Map<String, dynamic> toJson() => {
        "productID": this.id,
        "name": this.name,
        "price": this.price,
        "quantity": this.quantity,
        "imagePath": this.imagePath,
        "cat_id": this.catgID
      };
}

class productList {
  final List<Product> list_categ;

  productList(this.list_categ);
}

// items od vegetables

List<Product> list_categ = [
  Product(
      1,
      "https://media.istockphoto.com/id/471359531/photo/carrots.jpg?s=612x612&w=0&k=20&c=1lxMe5r76gW5BNutBOW1QxqU7LT6SCF2kOsf0cSStQM=",
      "carrot",
      9,
      1,
      1),
  Product(
      2,
      "https://media.istockphoto.com/id/466175630/photo/tomato-isolated-on-white-background.jpg?b=1&s=170667a&w=0&k=20&c=zloJA_rdhqA7aJ9O0mDDaBQOzOei3SlW2RCwvH4CxOA=",
      "tomatoe",
      9,
      1,
      1),
  Product(
      3,
      "https://media.istockphoto.com/id/114422641/photo/standing-new-potato-and-green-parsley-with-white-background.jpg?s=612x612&w=0&k=20&c=6ptfwp6TBtuVqeFnDma3N9P_bpmHe8TG2EhKu0DYMw4=",
      "potato",
      5,
      1,
      1),
  Product(
      4,
      "https://media.istockphoto.com/id/1083979276/photo/cucumber-isolated-on-white-background-clipping-path-full-depth-of-field.jpg?s=612x612&w=0&k=20&c=0hBtbtyMHys0FcO1P2QFy7Po3z_FRFaSoZ14-jrHi7E=",
      "cucumber",
      8,
      1,
      1),
  Product(
      5,
      "https://media.istockphoto.com/id/513920379/photo/onion-bulbs.jpg?s=612x612&w=0&k=20&c=EqL8velNKYOIZmWhwZtt_WdWykIcaGBbPPJ4KA_PGOg=",
      "onion",
      5,
      1,
      1),
  Product(
      6,
      "https://media.istockphoto.com/id/183263273/photo/hot-chili-peppers.jpg?s=612x612&w=0&k=20&c=BWFgeeJlRSHablcvqti4TYiKQ8jxNlAn_4t0U_TgRRo=",
      "hot pepper",
      15,
      1,
      1),
  Product(
      7,
      "https://media.istockphoto.com/id/453793059/photo/eggplant-isolated-on-white.jpg?s=612x612&w=0&k=20&c=Tz9DcsK78x0Q1VMujYjGA2NP7SZgojUrpiFbc59_TOE=",
      "eggplant",
      7,
      1,
      1),
  Product(
      8,
      "https://media.istockphoto.com/id/185408964/photo/close-up-of-garlic-clove-on-white-background.jpg?s=612x612&w=0&k=20&c=1tr75fHFJmKbxg2Pzbn37N3QIXL0fCsawOWVi627Msc=",
      "garlic",
      20,
      1,
      1),
];
productList productListItem_vegetables = productList(list_categ);

// items Of fruits

List<Product> list_categ2 = [
  Product(
      9,
      "https://media.istockphoto.com/id/636739634/photo/banana.jpg?b=1&s=170667a&w=0&k=20&c=hIl6w1jCfaRSQZchzDimElFFY9D7BggTT2gZvAnQY9c=",
      "panana",
      16,
      1,
      2),
  Product(
      10,
      "https://media.istockphoto.com/id/1297178576/photo/watermelon-isolated-over-white-background.jpg?b=1&s=170667a&w=0&k=20&c=w30bFVBryQWhWGCMkJKmuKV-N9qxHs2ok3kLMOoliTs=",
      "watermelon",
      20,
      1,
      2),
  Product(
      11,
      "https://media.istockphoto.com/id/1347811814/photo/kiwi-fruit-isolated.jpg?b=1&s=170667a&w=0&k=20&c=hDfPSSxTura0kMrudBIiinrKF5etaUO-0HEuUN07dAQ=",
      "kiwi",
      40,
      1,
      2),
  Product(
      12,
      "https://media.istockphoto.com/id/467328250/photo/mango.jpg?b=1&s=170667a&w=0&k=20&c=CMFzT8V7KqbRzoib0cZaSgEFHUBj54ZK8uzizKNygxU=",
      "mango",
      30,
      1,
      2),
  Product(
      13,
      "https://media.istockphoto.com/id/1186925401/photo/isolated-bunch-of-red-grapes.jpg?s=612x612&w=0&k=20&c=HIsuAmjePc4zNG6V6mv7i2XzURlOULEkXecJkKpuZCE=",
      "grapes",
      20,
      1,
      2),
  Product(
      14,
      "https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?b=1&s=170667a&w=0&k=20&c=aAfiibS9LDxSzOmUvlL1vVIqq7unLny6C6uCnnEh59g=",
      "apple",
      20,
      1,
      2),
  Product(
      15,
      "https://media.istockphoto.com/id/172862474/photo/pineapple-a-ripe-fresh-fruit-food-whole-isolated-on-white.jpg?b=1&s=170667a&w=0&k=20&c=Q-6QrGPdsEzKJlA5XU-UNteXQliog96uS-W1TbnT_Cg=",
      "Pineapple",
      45,
      1,
      2),
  Product(
      16,
      "https://media.istockphoto.com/id/186861864/photo/pear-green-with-leaf.jpg?b=1&s=170667a&w=0&k=20&c=0NpzabgUweSG-dLJzHM6fgYCmzsplD9_HY5ujPp1ncs=",
      "pear",
      15,
      1,
      2),
];

productList productListItem_fruits = productList(list_categ2);
