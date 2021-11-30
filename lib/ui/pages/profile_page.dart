part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBase.grey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text('Profil', style: fontAppBarTitle),
        actions: [
          IconButton(
            color: ColorBase.primary,
            icon: Icon(Icons.menu),
            iconSize: 25,
            onPressed: () {
              Get.to(SideMenuPage(),
                  transition: Transition.rightToLeftWithFade);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<UserProvider>(
          builder: (context, prov, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 8,
                        ),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(prov.user!.photoProfile!),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                buildLabelTitle('Biodata'),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          bottom: 30, left: 10, right: 10, top: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          detailItemBio(context,
                              label: 'Nama', data: prov.user!.namaLengkap),
                          detailItemBio(context,
                              label: 'Tanggal Lahir',
                              data: fDate.format(prov.user!.tanggalLahir!)),
                          detailItemBio(context,
                              label: 'Jenis Kelamin',
                              data: prov.user!.kelamin!),
                          detailItemBio(context,
                              label: 'Alamat', data: prov.user!.alamat!),
                          detailItemBio(context,
                              label: 'Sekolah', data: prov.user!.sekolah!),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
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
