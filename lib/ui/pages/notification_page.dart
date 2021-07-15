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
                    margin: d['isRead']
                        ? EdgeInsets.fromLTRB(20, 5, 0, 5)
                        : EdgeInsets.fromLTRB(0, 5, 20, 5),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: d['isRead'] ? Colors.grey[200] : ColorBase.primary,
                      borderRadius: d['isRead']
                          ? BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))
                          : BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                    ),
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
