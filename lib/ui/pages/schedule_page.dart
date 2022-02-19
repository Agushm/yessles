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
        title: Text('Jadwal', style: fontAppBarTitle),
        actions: [Icon(Icons.history)],
      ),
      body: Consumer<ScheduleProvider>(
        builder: (context, prov, _) {
          if (prov.userSchedulesInit) {
            prov.reload(context);
            return Center(child: CircularProgressIndicator());
          } else if (!prov.userSchedulesInit && prov.userSchedules.isNotEmpty) {
            return ListSchedule();
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

class ListSchedule extends StatefulWidget {
  @override
  _ListScheduleState createState() => _ListScheduleState();
}

class _ListScheduleState extends State<ListSchedule> {
  bool isLoadingMore = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleProvider>(
      builder: (context, prov, _) {
        return Builder(
          builder: (context) {
            if (prov.userSchedulesInit && prov.userSchedules.isEmpty) {
              prov.getUserSchedulesMore(context);
              return buildLoadingArticle();
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  return await prov.reload(context);
                },
                child: prov.userSchedulesInit == false &&
                        prov.userSchedules.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(iconsPath + 'soon.png',
                              width: 100, height: 100),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Nanti jadwal akan tampil disini',
                              style: fontBlack),
                        ],
                      )
                    : NotificationListener<ScrollNotification>(
                        onNotification: (ScrollNotification scrollInfo) {
                          if (scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent) {
                            setState(() {
                              isLoadingMore = true;
                            });
                            prov.getUserSchedulesMore(context).then((_) async {
                              setState(() {
                                isLoadingMore = false;
                              });
                            });
                            return true;
                          }
                          return false;
                        },
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: isLoadingMore
                              ? prov.userSchedules.length + 1
                              : prov.userSchedules.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index >= prov.userSchedules.length) {
                              return Center(
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  margin: EdgeInsets.only(bottom: 100),
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            var d = prov.userSchedules[index];
                            return Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(right: 20),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: ColorBase.primary,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Text(
                                      '${tanggal(DateTime.parse(d.tanggal!))}',
                                      style: fontWhite.copyWith(
                                          fontWeight: FontWeight.w500),
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
                                      margin:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundImage:
                                                NetworkImage(d.guru!.photo),
                                          ),
                                          SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: deviceWidth(context) / 2,
                                                child: Text(
                                                  '${d.guru!.nama}',
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: fontBlack.copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Text('SMA / X / Matematika',
                                                  style: fontBlack.copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              Text(
                                                  'Sesi ${d.jamMulai} - ${d.jamSelesai}',
                                                  style: fontBlack.copyWith(
                                                      color: Colors.black54,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w300)),
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
              );
            }
          },
        );
      },
    );
  }
}
