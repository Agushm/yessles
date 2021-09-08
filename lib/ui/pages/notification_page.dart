part of 'pages.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorBase.grey,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 1,
            backgroundColor: Colors.white,
            title: Text('Informasi',
                style: fontBlack.copyWith(
                    fontSize: 20,
                    color: ColorBase.primary,
                    fontWeight: FontWeight.bold))),
        body: ListView.builder(
            padding: EdgeInsets.only(top: 20),
            itemCount: listNotif.length,
            itemBuilder: (c, i) {
              var d = listNotif[i];
              return Stack(
                children: [
                  Container(
                    width: deviceWidth(context),
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${d['title']}',
                          style: fontBlack.copyWith(
                              color:
                                  d['isRead'] ? Colors.black38 : Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('${d['message']}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: fontBlack.copyWith(
                                color:
                                    d['isRead'] ? Colors.black38 : Colors.black,
                                fontSize: 12,
                                fontWeight: d['isRead']
                                    ? FontWeight.w300
                                    : FontWeight.w500)),
                        Text(
                            '${tanggal(DateTime.now(), shortMonth: true, withTime: true)}',
                            style: fontBlack.copyWith(
                                color:
                                    d['isRead'] ? Colors.black38 : Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: 30,
                    child: Builder(
                      builder: (context) {
                        if (d['isRead']) {
                          return SizedBox();
                        } else {
                          return Icon(
                            Icons.star,
                            color: Colors.blue,
                            size: 15,
                          );
                        }
                      },
                    ),
                  ),
                ],
              );
            }));
  }
}
