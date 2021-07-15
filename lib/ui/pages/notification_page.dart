part of 'pages.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 1,
            title: Text('Informasi', style: fontWhite.copyWith(fontSize: 18))),
        body: ListView.builder(
            itemCount: listNotif.length,
            itemBuilder: (c, i) {
              var d = listNotif[i];
              return Stack(
                children: [
                  Container(
                    width: deviceWidth(context),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        color:
                            d['isRead'] ? Colors.grey[200] : ColorBase.primary,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${d['title']}',
                          style: fontBlack.copyWith(
                              color:
                                  d['isRead'] ? Colors.black38 : Colors.white,
                              fontWeight: d['isRead']
                                  ? FontWeight.w300
                                  : FontWeight.w500),
                        ),
                        Text('${d['message']}',
                            style: fontBlack.copyWith(
                                color:
                                    d['isRead'] ? Colors.black38 : Colors.white,
                                fontWeight: d['isRead']
                                    ? FontWeight.w300
                                    : FontWeight.w500)),
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
                          return Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: Colors.blue, shape: BoxShape.circle),
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
