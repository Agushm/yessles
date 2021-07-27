part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorBase.grey,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stack(
              //   children: [
              //     Container(
              //       width: deviceWidth(context),
              //       height: 150,
              //     ),
              //     Container(
              //       width: deviceWidth(context),
              //       height: 140,
              //       padding: EdgeInsets.symmetric(horizontal: 20),
              //       decoration: BoxDecoration(
              //           color: ColorBase.primary,
              //           borderRadius: BorderRadius.only(
              //             bottomLeft: Radius.circular(60),
              //             bottomRight: Radius.circular(60),
              //           )),
              //       child: Row(
              //         children: [
              //           Container(
              //             width: 60,
              //             height: 60,
              //             decoration: BoxDecoration(
              //                 border: Border.all(
              //                   color: Colors.white,
              //                   width: 3,
              //                 ),
              //                 boxShadow: [
              //                   BoxShadow(
              //                     color: Colors.grey,
              //                     offset: Offset(0.0, 1.0), //(x,y)
              //                     blurRadius: 6.0,
              //                   ),
              //                 ],
              //                 shape: BoxShape.circle,
              //                 image: DecorationImage(
              //                   fit: BoxFit.cover,
              //                   image: NetworkImage(
              //                       'https://images.pexels.com/photos/4350057/pexels-photo-4350057.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
              //                 )),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Positioned(
              //       top: 110,
              //       child: Container(
              //         width: deviceWidth(context) - 40,
              //         margin: EdgeInsets.symmetric(horizontal: 20),
              //         padding:
              //             EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(20),
              //           color: Colors.white,
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.grey,
              //               offset: Offset(0.0, 1.0), //(x,y)
              //               blurRadius: 6.0,
              //             ),
              //           ],
              //         ),
              //         child: Row(
              //           children: [
              //             Icon(Icons.search),
              //             Text('Coba cari materi belajarmu di sini')
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              PosterBaner(),
              Container(
                width: deviceWidth(context),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Wajib kamu coba',
                            style: fontBlack.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('Lihat semua',
                            style: fontBlack.copyWith(
                                fontSize: 12, color: Colors.blue))
                      ],
                    ),
                    SizedBox(height: 10),
                    GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 4 / 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemCount: mapel.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                            width: deviceWidth(context) / 4,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                ),
                                SizedBox(height: 5),
                                Text('Menu $index',
                                    style: fontBlack.copyWith(
                                      fontSize: 10,
                                    )),
                              ],
                            ));
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Ada yang baru nih',
                      style: fontBlack.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(),
                            ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 80),
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: listBerita.length,
                        itemBuilder: (BuildContext context, int index) {
                          var data = listBerita[index];
                          return Container(
                            margin: EdgeInsets.all(5),
                            width: 300,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Container(
                                  width: 320,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(data['gambar']))),
                                )),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${data['judul']}',
                                          style: fontBlack.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Container(
                                          width: 300,
                                          child: Text(
                                            '${data['deskripsi']}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: fontBlack.copyWith(
                                              color: Colors.black54,
                                              fontSize: 12,
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: Text('Mata Pelajaran',
                      style: fontBlack.copyWith(fontSize: 18))),
              GridMapel()
            ],
          ),
        ));
  }
}
