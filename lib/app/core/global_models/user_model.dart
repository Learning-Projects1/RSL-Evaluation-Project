

class UserGlobalModel {
  final String email;
  final String hashedPassword;
  final String name;
  final double latitude;
  final double longitude;

  UserGlobalModel({
    required this.email,
    required this.hashedPassword,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory UserGlobalModel.fromJson(Map<String, dynamic> json) {
    return UserGlobalModel(
      email: json['email'],
      hashedPassword: json['hashedPassword'],
      name: json['name'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'hashedPassword': hashedPassword,
    'name': name,
    'latitude': latitude,
    'longitude': longitude,
  };
}
