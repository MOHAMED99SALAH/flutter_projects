class location {
  final int ID;
  final String address;

  location({
    required this.ID,
    required this.address,
  });

  factory location.fromJson(Map<String, dynamic> json) {
    return location(
      ID: json['id'],
      address: json['address'],
    );
  }
}
