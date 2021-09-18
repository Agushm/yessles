part of 'pages.dart';

class SideMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBase.grey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text("Pengaturan", style: fontAppBarTitle),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Consumer<UserProvider>(builder: (context, prov, _) {
            return Center(
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
            );
          }),
          SizedBox(height: 20),
          buildLabelTitle('Pengaturan'),
          SizedBox(height: 20),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black26,
                ),
              ),
              child: Column(
                children: [
                  menuSetting(
                    onTap: () {
                      var user =
                          Provider.of<UserProvider>(context, listen: false)
                              .user;
                      Get.to(EditProfilePage(user: user),
                          transition: Transition.rightToLeftWithFade);
                    },
                    label: 'Ubah Profil',
                  ),
                  Divider(),
                  menuSetting(
                    onTap: () async {},
                    label: 'Riwayat Berlangganan',
                  ),
                  Divider(),
                  menuSetting(
                    onTap: () async {},
                    label: 'Syarat & Ketentuan',
                  ),
                  Divider(),
                  menuSetting(
                    onTap: () async {},
                    label: 'Tentang Yessles',
                  ),
                  Divider(),
                  menuSetting(
                      onTap: () async {
                        var confirm = await DialogUtils.instance
                            .showConfirmDialog(
                                context, 'Konfirmasi Keluar Akun', '');
                        if (confirm!) {
                          Provider.of<UserProvider>(context, listen: false)
                              .logout(context);
                        }
                      },
                      label: 'Keluar Akun',
                      color: Colors.red),
                ],
              )),
          Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/logo.png',
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Text('Yessles',
                  style: fontBlack.copyWith(
                      fontSize: 18,
                      color: ColorBase.primary,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

Widget menuSetting({Function()? onTap, String? label, Color? color}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label!,
              style: fontBlack.copyWith(
                color: color ?? Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
          Icon(Icons.arrow_forward_ios, color: Colors.black26)
        ],
      ),
    ),
  );
}
