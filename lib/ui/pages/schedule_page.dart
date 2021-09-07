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
                        width: deviceWidth(context),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(),
                        child: Text(
                          '${d.tanggal}',
                          style: fontBlack.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w500),
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
                                        radius: 30,
                                        backgroundImage:
                                            NetworkImage(d.guru!.photo!),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 150,
                                        child: Text(
                                          '${d.guru!.nama!}',
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: fontBlack.copyWith(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text('Mapel Name',
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
