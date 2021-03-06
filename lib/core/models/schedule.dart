part of 'models.dart';

Schedule scheduleFromJson(String str) => Schedule.fromJson(json.decode(str));

String scheduleToJson(Schedule data) => json.encode(data.toJson());

class Schedule {
  Schedule(
      {this.id,
      this.guruId,
      this.hariId,
      this.day,
      this.jamMulai,
      this.jamSelesai,
      this.tanggal,
      this.status,
      this.duration,
      this.mapel,
      this.guru});

  int? id;
  int? guruId;
  int? hariId;
  String? day;
  String? jamMulai;
  String? jamSelesai;
  String? tanggal;
  String? status;
  int? duration;
  Mapel? mapel;
  Teacher? guru;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
      id: json["id"],
      guruId: json["guruId"],
      hariId: json["hariId"],
      day: json['hariId'] == null ? '' : days[json['hariId'] - 1],
      jamMulai: json["jamMulai"],
      jamSelesai: json["jamSelesai"],
      tanggal: json["tanggal"],
      status: json["status"],
      guru: json['guru'] == null ? null : Teacher.fromJson(json['guru']));

  Map<String, dynamic> toJson() => {
        "id": id,
        "guruId": guruId,
        "hariId": hariId,
        "jamMulai": jamMulai,
        "jamSelesai": jamSelesai,
        "status": status,
      };
}

List<String?> days = ['senin', 'selasa', 'rabu', 'kamis', "jum'at", 'sabtu'];

List<Schedule> mockSchedule = [
  Schedule(
    day: 'Senin',
    duration: 90,
    mapel: Mapel(
      name: 'Matematika',
      desc: '''
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
        ''',
      rating: 3.4,
      listImage: [
        'https://images.pexels.com/photos/5428011/pexels-photo-5428011.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
        'https://images.pexels.com/photos/5427820/pexels-photo-5427820.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
      ],
    ),
  ),
  Schedule(
    day: 'Kamis',
    duration: 90,
    mapel: Mapel(
      name: 'Kimia',
      desc: '''
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
        ''',
      rating: 3.4,
      listImage: [
        'https://images.pexels.com/photos/5427820/pexels-photo-5427820.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
      ],
    ),
  ),
  Schedule(
    day: 'Sabtu',
    duration: 90,
    mapel: Mapel(
      name: 'Fisika',
      desc: '''
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
        ''',
      rating: 3.4,
      listImage: [
        'https://images.pexels.com/photos/5428011/pexels-photo-5428011.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
        'https://images.pexels.com/photos/5427820/pexels-photo-5427820.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
      ],
    ),
  ),
];
