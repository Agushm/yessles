part of 'models.dart';

Mapel mapelFromJson(String str) => Mapel.fromJson(json.decode(str));

String mapelToJson(Mapel data) => json.encode(data.toJson());

class Mapel {
  Mapel(
      {this.name,
      this.desc,
      this.rating,
      this.listImage,
      this.teacher,
      this.teachers});

  String? name;
  String? desc;
  double? rating;
  List<String>? listImage;
  Teacher? teacher;
  List<Teacher>? teachers;

  factory Mapel.fromJson(Map<String, dynamic> json) => Mapel(
        name: json["name"],
        desc: json['desc'],
        rating: json["rating"].toDouble() ?? 4.6,
        listImage: List<String>.from(json["listImage"].map((x) => x)),
        teacher: Teacher.fromJson(json["teacher"]),
        teachers: json['teachers'] == null
            ? []
            : List<Teacher>.from(
                json['teachers']!.map((x) => Teacher.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rating": rating,
        "listImage": List<dynamic>.from(listImage!.map((x) => x)),
        "teacher": teacher!.toJson(),
      };
}

class Teacher {
  Teacher({
    this.teacherName,
    this.teacherImage,
    this.teacherRating,
    this.teacherOnline,
    this.teacherAddress,
  });

  String? teacherName;
  String? teacherImage;
  double? teacherRating;
  dynamic teacherOnline;
  String? teacherAddress;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        teacherName: json["teacher_name"],
        teacherImage: json["teacher_image"],
        teacherRating: json["teacher_rating"].toDouble(),
        teacherOnline: json["teacher_online"],
        teacherAddress: json["teacher_address"],
      );

  Map<String, dynamic> toJson() => {
        "teacher_name": teacherName,
        "teacher_image": teacherImage,
        "teacher_rating": teacherRating,
        "teacher_online": teacherOnline,
        "teacher_address": teacherAddress,
      };
}

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
List _listMapel = [
  'Matematika',
  'Bhs.Indonesia',
  'Bhs.Inggris',
  'IPA',
  'Biologi',
  'Kimia',
  'Fisika',
  'Sosiologi',
  'Geografi',
];
var random = Random();
List<Mapel> mockListMapel = List.generate(9, (index) {
  return Mapel(
    name: _listMapel[index],
    desc: mockDesc,
    rating: random.nextInt(5).toDouble(),
    listImage: [
      'https://media.istockphoto.com/photos/mature-man-professor-standing-in-class-picture-id1278976696?b=1&k=6&m=1278976696&s=170667a&w=0&h=eFHHTMKNM3DETJnvM0k2F9v_6uo1et0olLsmukPRrzE=',
      'https://media.istockphoto.com/photos/africanamerican-teacher-reading-to-school-children-picture-id1194312424?k=6&m=1194312424&s=612x612&w=0&h=mlU0lmWE8fg-ZrCFSQVXfZ-6GWUYhkQMzVkzpCIU4mA='
    ],
    teacher: Teacher(
        teacherName: 'Prof. Manshur',
        teacherAddress: 'Solo Baru , Sukoharjo, Jawa Tengah',
        teacherRating: 4,
        teacherImage:
            'https://image.freepik.com/free-photo/half-profile-image-beautiful-young-woman-with-bob-hairdo-posing-gazing-with-eyes-full-reproach-suspicion-human-facial-expressions-emotions-reaction-feelings_343059-4660.jpg'),
    teachers: [
      Teacher(
          teacherName: 'Prof. Manshur',
          teacherAddress: 'Solo Baru , Sukoharjo, Jawa Tengah',
          teacherRating: 4,
          teacherImage:
              'https://media.istockphoto.com/photos/young-woman-wearing-casual-red-sweater-over-isolated-background-away-picture-id1127788799?k=6&m=1127788799&s=612x612&w=0&h=r31i9BV_cKtZ32CAbp3EQLbXRnCWTP_wzAWKhBAei9g='),
      Teacher(
          teacherName: 'Lord Elon',
          teacherAddress: 'Texas, California',
          teacherRating: 1,
          teacherImage:
              'https://image.freepik.com/free-photo/half-profile-image-beautiful-young-woman-with-bob-hairdo-posing-gazing-with-eyes-full-reproach-suspicion-human-facial-expressions-emotions-reaction-feelings_343059-4660.jpg'),
    ],
  );
});
