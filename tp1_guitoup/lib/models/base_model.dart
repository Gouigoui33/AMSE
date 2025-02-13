class BaseModel {
  final int hdv;
  final String name;
  final String type;
  final String image;
  final String date;

  BaseModel(
      {required this.hdv,
      required this.name,
      required this.type,
      required this.image,
      required this.date});

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return BaseModel(
      hdv: json['hdv'],
      name: json['name'],
      type: json['type'],
      image: json['image'],
      date: json['date'],
    );
  }
}
