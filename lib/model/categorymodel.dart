
class Categorymodel {
  bool ok;
  List<Datum> data;

  Categorymodel({
    required this.ok,
    required this.data,
  });

  factory Categorymodel.fromJson(Map<String, dynamic> json) => Categorymodel(
        ok: json["ok"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String name;
  String shortDescription;
  String longDescription;
  String primaryImage;
  List<String> detailImages;
  String id;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.name,
    required this.shortDescription,
    required this.longDescription,
    required this.primaryImage,
    required this.detailImages,
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        shortDescription: json["short_description"],
        longDescription: json["long_description"],
        primaryImage: json["primary_image"],
        detailImages: List<String>.from(json["detail_images"].map((x) => x)),
        id: json["id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "short_description": shortDescription,
        "long_description": longDescription,
        "primary_image": primaryImage,
        "detail_images": List<dynamic>.from(detailImages.map((x) => x)),
        "id": id,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
