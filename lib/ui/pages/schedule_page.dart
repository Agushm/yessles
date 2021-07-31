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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Belum ada jadwal', style: fontBlack),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: commonButton(
              btnText: 'Beli Paket Pembelajaran',
              onPressed: () {
                Get.to(FormTransaction1());
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10),
              itemCount: mockSchedule.length,
              itemBuilder: (c, i) {
                var d = mockSchedule[i];
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
                          '${d.day}',
                          style: fontBlack.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w500),
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
                                            d.mapel!.teacher!.teacherImage!),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${d.mapel!.teacher!.teacherName}',
                                        style: fontBlack.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Text('${d.mapel!.name}',
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
          ),
        ],
      ),
    );
  }
}
