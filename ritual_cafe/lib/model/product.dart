class Product {
  int id;
  String name;
  String description;
  String collection;
  String image;
  double price;
  bool isSelected;
  Product(
      {this.id,
      this.name,
      this.collection,
      this.price,
      this.isSelected = false,
      this.image});
}
