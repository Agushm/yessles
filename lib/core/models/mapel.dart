part of 'models.dart';

Mapel mapelFromJson(String str) => Mapel.fromJson(json.decode(str));

String mapelToJson(Mapel data) => json.encode(data.toJson());

class Mapel {
  Mapel(
      {this.id,
      this.nama,
      this.ikon,
      this.name,
      this.desc,
      this.rating,
      this.listImage,
      this.teachers});

  int? id;
  String? nama;
  String? ikon;
  String? name;
  String? desc;
  double? rating;
  List<String>? listImage;
  List<Teacher>? teachers;

  factory Mapel.fromJson(Map<String, dynamic> json) => Mapel(
        id: json["id"],
        nama: json['nama'],
        ikon: json['ikon'],
        name: json["name"],
        desc: json['desc'],
        rating: json["rating"] ?? 4.6,
        listImage: json["listImage"] == null
            ? []
            : List<String>.from(json["listImage"].map((x) => x)),
        teachers: json['teachers'] == null
            ? []
            : List<Teacher>.from(
                json['teachers']!.map((x) => Teacher.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rating": rating,
        "listImage": List<dynamic>.from(listImage!.map((x) => x)),
      };
}

var jsonMapel = {
  "id": 16,
  "nama": "TK",
  "ikon": "",
  "createdAt": "2022-01-20T03:14:06.000Z",
  "updatedAt": "2022-01-20T03:14:06.000Z",
  "deletedAt": null,
  "guru": [
    {
      "id": 27,
      "nama": "Fitria Anugrahini",
      "photo": null,
      "deskripsi": "",
      "rating": null
    },
    {
      "id": 37,
      "nama": "Utami Octavianti",
      "photo": null,
      "deskripsi": "",
      "rating": null
    },
    {
      "id": 48,
      "nama": "Senja Dwi Pradini",
      "photo": null,
      "deskripsi": "",
      "rating": null
    }
  ]
};
String mockDesc = '''
        <h1>HTML Ipsum Presents</h1>

<p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href="#">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>

<h2>Header Level 2</h2>

<ol>
   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
   <li>Aliquam tincidunt mauris eu risus.</li>
</ol>

<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue. Ut a est eget ligula molestie gravida. Curabitur massa. Donec eleifend, libero at sagittis mollis, tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est.</p></blockquote>

<h3>Header Level 3</h3>

<ul>
   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
   <li>Aliquam tincidunt mauris eu risus.</li>
</ul>
        ''';

var random = Random();
