class Base {
  final int hdv; // Numéro de l’HDV
  final String name;
  final String type;
  final String image;
  final String date;

  Base({
    required this.hdv,
    required this.name,
    required this.type,
    required this.image,
    required this.date,
  });

  factory Base.fromJson(Map<String, dynamic> json) {
    return Base(
      hdv: json['hdv'],
      name: json['name'],
      type: json['type'],
      image: json['image'],
      date: json['date'],
    );
  }
}
