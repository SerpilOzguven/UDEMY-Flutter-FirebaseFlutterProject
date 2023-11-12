class Product {
  int id;
  String name;
  String description;
  double unitPrice;

  Product(this.id, this.name, this.description, this.unitPrice);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = this.name;
    map["description"] = this.description;
    map["unitPrice"] = this.unitPrice;
    if (map["id"] != null) {
      map["id"] = this.id;
    }
    return map;
  }

  Product.fromObject(
      dynamic o, this.id, this.name, this.description, this.unitPrice) {
    this.id = o["id"];
    this.name = o["name"];
    this.description = o["description"];
    this.unitPrice = double.tryParse(o["unitPrice"].toString())!;
  }

  static withId(
      {required int id,
      required String name,
      required String description,
      required double unitPrice}) {}
}
