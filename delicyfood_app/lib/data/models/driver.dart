class driver {
  int? ID;
  String? email;
  String? phone;

  driver({
    required this.ID,
    required this.email,
    required this.phone,
  });

  driver.fromJson(Map<String, dynamic> list) {
    this.ID = list['id'];
    this.email = list['email'];
    this.phone = list['phone'];
  }
}
