class Member {
  String id;
  String name;
  String email;
  String address;
  String phone;
  String membershipStatus;

  Member({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.membershipStatus,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      membershipStatus: json['membership_status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'phone': phone,
      'membership_status': membershipStatus,
    };
  }
}

