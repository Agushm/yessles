part of 'pages.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text('Jadwal',
              style: fontBlack.copyWith(
                  fontSize: 20,
                  color: ColorBase.primary,
                  fontWeight: FontWeight.bold))),
      body: Consumer<ScheduleProvider>(
        builder: (context, prov, _) {
          if (prov.userSchedulesInit) {
            prov.getScheduleUser(context);
            return Center(child: CircularProgressIndicator());
          } else if (!prov.userSchedulesInit && prov.userSchedules.isNotEmpty) {
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10),
                itemCount: prov.userSchedules.length,
                itemBuilder: (c, i) {
                  var d = prov.userSchedules[i];
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: deviceWidth(context),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(),
                          child: Text(
                            '${d.day}',
                            style: fontBlack.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(DetailMapelPage(mapel: d.mapel));
                          },
                          child: Container(
                            width: deviceWidth(context),
                            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                              color: ColorBase.primary,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://images.pexels.com/photos/5427820/pexels-photo-5427820.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${d.guruId}',
                                          style: fontBlack.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Text('${d.mapel!.nama!}',
                                        style: fontBlack.copyWith(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('Belum ada jadwal', style: fontBlack)),
              ],
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        child: MaterialButton(
          height: 50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
          color: ColorBase.primary,
          onPressed: () {
            Get.to(TransactionTerm());
          },
          child: Text('Order Jadwal', style: fontWhite),
        ),
      ),
    );
  }
}
