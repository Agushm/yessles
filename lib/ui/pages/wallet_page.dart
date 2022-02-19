part of 'pages.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: ColorBase.primary,
      child: Stack(
        children: <Widget>[
          //Container for top data
          CardWallet(),

          //draggable sheet
          DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 245, 248, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Riwayat",
                              style: fontBlack.copyWith(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 24,
                                  color: Colors.black),
                            ),
                            Text(
                              "Lihat Semua",
                              style: fontBlack.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.grey[800]),
                            )
                          ],
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 32),
                      ),
                      SizedBox(
                        height: 24,
                      ),

                      //Container for buttons
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Semua",
                                  style: fontBlack.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Colors.grey[900]),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[200]!,
                                          blurRadius: 10.0,
                                          spreadRadius: 4.5)
                                    ]),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Colors.green,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Topup",
                                      style: fontBlack.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Colors.grey[900]),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[200]!,
                                          blurRadius: 10.0,
                                          spreadRadius: 4.5)
                                    ]),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              // Container(
                              //   child: Row(
                              //     children: <Widget>[
                              //       CircleAvatar(
                              //         radius: 8,
                              //         backgroundColor: Colors.orange,
                              //       ),
                              //       SizedBox(
                              //         width: 8,
                              //       ),
                              //       Text(
                              //         "Donasi",
                              //         style: fontBlack.copyWith(
                              //             fontWeight: FontWeight.w700,
                              //             fontSize: 14,
                              //             color: Colors.grey[900]),
                              //       ),
                              //     ],
                              //   ),
                              //   decoration: BoxDecoration(
                              //       color: Colors.white,
                              //       borderRadius:
                              //           BorderRadius.all(Radius.circular(20)),
                              //       boxShadow: [
                              //         BoxShadow(
                              //             color: Colors.grey[200]!,
                              //             blurRadius: 10.0,
                              //             spreadRadius: 4.5)
                              //       ]),
                              //   padding: EdgeInsets.symmetric(
                              //       horizontal: 20, vertical: 10),
                              // )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 16,
                      ),
                      //Container Listview for expenses and incomes
                      Container(
                        child: Text(
                          "Hari Ini",
                          style: fontBlack.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[500]),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 32),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.fromLTRB(32, 0, 32, 10),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Topup",
                                        style: fontBlack.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[900]),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      formatRupiah(50000),
                                      style: fontBlack.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.lightGreen),
                                    ),
                                    Text(
                                      tanggal(DateTime.now()),
                                      style: fontBlack.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey[500]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                        itemCount: 2,
                        padding: EdgeInsets.all(0),
                        controller: ScrollController(keepScrollOffset: false),
                      ),

                      //now expense
                      SizedBox(
                        height: 16,
                      ),

                      Container(
                        child: Text(
                          "Kemarin",
                          style: fontBlack.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[500]),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 32),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      // ListView.builder(
                      //   itemBuilder: (context, index) {
                      //     return Container(
                      //       margin: EdgeInsets.fromLTRB(32, 0, 32, 10),
                      //       padding: EdgeInsets.all(16),
                      //       decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(20))),
                      //       child: Row(
                      //         children: <Widget>[
                      //           Expanded(
                      //             child: Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: <Widget>[
                      //                 Text(
                      //                   "Donasi",
                      //                   style: fontBlack.copyWith(
                      //                       fontSize: 18,
                      //                       fontWeight: FontWeight.w700,
                      //                       color: Colors.grey[900]),
                      //                 ),
                      //                 Text(
                      //                   "Peduli Gunung Semeru",
                      //                   maxLines: 1,
                      //                   overflow: TextOverflow.ellipsis,
                      //                   style: fontBlack.copyWith(
                      //                       fontSize: 12,
                      //                       fontWeight: FontWeight.w700,
                      //                       color: Colors.grey[500]),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           Column(
                      //             crossAxisAlignment: CrossAxisAlignment.end,
                      //             children: <Widget>[
                      //               Text(
                      //                 formatRupiah(100000),
                      //                 style: fontBlack.copyWith(
                      //                     fontSize: 18,
                      //                     fontWeight: FontWeight.w700,
                      //                     color: Colors.orange),
                      //               ),
                      //               Text(
                      //                 tanggal(DateTime.now()),
                      //                 style: fontBlack.copyWith(
                      //                     fontSize: 12,
                      //                     fontWeight: FontWeight.w700,
                      //                     color: Colors.grey[500]),
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     );
                      //   },
                      //   shrinkWrap: true,
                      //   itemCount: 2,
                      //   padding: EdgeInsets.all(0),
                      //   controller: ScrollController(keepScrollOffset: false),
                      // ),
                      SizedBox(height: 60),
                      //now expense
                    ],
                  ),
                  controller: scrollController,
                ),
              );
            },
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 1,
          )
        ],
      ),
    );
  }
}

class CardWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "${formatRupiah(245000)}",
                style: fontBlack.copyWith(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w700),
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.network(
                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ],
          ),
          Text(
            "Total Dompet",
            style: fontBlack.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: ColorBase.primary),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(243, 245, 248, 1),
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      child: Icon(
                        Icons.add,
                        color: ColorBase.primary,
                        size: 30,
                      ),
                      padding: EdgeInsets.all(12),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Topup",
                      style: fontBlack.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
