class SootradharPojo {

  final String name,image,url;

  SootradharPojo({
    required this.name,
    required this.image,
    required this.url,
  });

  factory SootradharPojo.fromMap(Map<String, dynamic> json) => SootradharPojo(
    name: json["name"],
    image: json["image"],
    url: json["url"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": name,
    "user_name": image,
    "password": url,
  };
}
