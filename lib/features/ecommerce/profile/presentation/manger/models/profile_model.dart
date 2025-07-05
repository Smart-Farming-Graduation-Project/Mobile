class ProfileModel {
  final String id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phone;
  final String address;
  final String profileImage;

  ProfileModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.username,
      required this.email,
      required this.phone,
      required this.address,
      required this.profileImage,
      });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['userName'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      profileImage: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'userName': username,
      'phone': phone,
      'address': address,
    };
  }
}
