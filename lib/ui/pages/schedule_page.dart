part of 'pages.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBase.grey,
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
            return ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: prov.userSchedules.length,
              itemBuilder: (c, i) {
                var d = prov.userSchedules[i];
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(right: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: ColorBase.primary,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Text(
                          '${tanggal(DateTime.parse(d.tanggal!))}',
                          style:
                              fontWhite.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(DetailMentorPage(
                            teacher: d.guru,
                          ));
                        },
                        child: Container(
                          width: deviceWidth(context),
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(d.guru!.photo!),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      '${d.guru!.nama!}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: fontBlack.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text('Mapel Name',
                                      style: fontBlack.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                      'Sesi ${formatJam(DateTime.parse(d.tanggal! + ' ' + d.jamMulai!))} - ${formatJam(DateTime.parse(d.tanggal! + ' ' + d.jamSelesai!))}',
                                      style: fontBlack.copyWith(
                                          color: Colors.black54,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300)),
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
            );
          } else {
            return Center(child: Text('Belum ada jadwal', style: fontBlack));
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Consumer<ScheduleProvider>(
        builder: (context, prov, _) {
          if (!prov.userSchedulesInit && prov.userSchedules.isEmpty) {
            return Container(
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
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
