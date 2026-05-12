class DeliveryUser {
  final String id;
  final String name;
  final String email;
  final String phone;

  DeliveryUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory DeliveryUser.fromJson(Map<String, dynamic> json) {
    return DeliveryUser(
      id: json['delivery_id'] ?? '',
      name: json['delivery_name'] ?? '',
      email: json['delivery_email'] ?? '',
      phone: json['delivery_phone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'delivery_id': id,
      'delivery_name': name,
      'delivery_email': email,
      'delivery_phone': phone,
    };
  }
}