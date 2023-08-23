class Details {
  String image;
  String name;
  String? discount;
  String? description;
  String price;
  Details({
    required this.image,
    required this.name,
    this.discount,
    this.description,
    required this.price,
  });
}
