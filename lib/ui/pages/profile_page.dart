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
          title: Text('Profil',
              style: fontBlack.copyWith(
                  fontSize: 20,
                  color: ColorBase.primary,
                  fontWeight: FontWeight.bold))),
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
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(prov.user!.photoProfile!),
                        )),
                  ),
                ),
                buildLabelTitle('Biodata'),
                Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.only(bottom: 30, left: 10, right: 10, top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                          label: 'Jenis Kelamin', data: prov.user!.kelamin!),
                      detailItemBio(context,
                          label: 'Alamat', data: prov.user!.alamat!),
                      detailItemBio(context,
                          label: 'Sekolah', data: prov.user!.sekolah!),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                      width: 200,
                      child: commonButton(
                          btnText: 'Keluar Akun',
                          onPressed: () async {
                            var confirm = await DialogUtils.instance
                                .showConfirmDialog(
                                    context, 'Konfirmasi Keluar Akun', '');
                            if (confirm!) {
                              Provider.of<UserProvider>(context, listen: false)
                                  .logout(context);
                            }
                          })),
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
