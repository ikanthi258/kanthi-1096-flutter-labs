class User {
  final int id;
  final String name;
  final String company;

  const User({required this.name, required this.company, required this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      company: json['company']['name'],
    );
  }
}
