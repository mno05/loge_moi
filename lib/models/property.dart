class Property {
  int? id;
  int? userId;
  String? title;
  String? description;
  int? surface;
  int? rooms;
  int? bedrooms;
  int? floor;
  int? price;
  String? city;
  String? address;
  String? postalCode;
  int? sold;
  String? type;

  Property(
      {this.id,
      this.userId,
      this.title,
      this.description,
      this.surface,
      this.rooms,
      this.bedrooms,
      this.floor,
      this.price,
      this.city,
      this.address,
      this.postalCode,
      this.sold,
      this.type});

  Property.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    surface = json['surface'];
    rooms = json['rooms'];
    bedrooms = json['bedrooms'];
    floor = json['floor'];
    price = json['price'];
    city = json['city'];
    address = json['address'];
    postalCode = json['postal_code'];
    sold = json['sold'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['surface'] = this.surface;
    data['rooms'] = this.rooms;
    data['bedrooms'] = this.bedrooms;
    data['floor'] = this.floor;
    data['price'] = this.price;
    data['city'] = this.city;
    data['address'] = this.address;
    data['postal_code'] = this.postalCode;
    data['sold'] = this.sold;
    data['type'] = this.type;
    return data;
  }
}
