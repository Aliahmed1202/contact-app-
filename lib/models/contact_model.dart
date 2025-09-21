class Contact {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? imagePath;

  Contact({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.imagePath,
  });

}
