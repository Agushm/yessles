part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.pexels.com/photos/4350057/pexels-photo-4350057.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      )),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Text('Biodata',
                      style: fontBlack.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold))),
              detailItemBio(context, label: 'Nama', data: 'Mawar'),
              detailItemBio(context,
                  label: 'Tempat, Tanggal Lahir',
                  data: 'Mars, ${DateTime.now()}'),
              detailItemBio(context, label: 'Jenis Kelamin', data: 'Perempuan'),
              detailItemBio(context,
                  label: 'Alamat', data: 'Los Angles, California'),
            ],
          ),
        ),
      ),
    );
  }
}

Widget detailItemBio(BuildContext context, {String? label, String? data}) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$label',
            style: fontBlack.copyWith(
              fontSize: 16,
              color: Colors.black54,
            )),
        Text('$data',
            style:
                fontBlack.copyWith(fontSize: 16, fontWeight: FontWeight.w500)),
      ],
    ),
  );
}
