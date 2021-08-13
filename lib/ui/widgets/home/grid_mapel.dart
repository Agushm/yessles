part of '../widgets.dart';

class GridMapel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 8,
      itemBuilder: (contex, index) {
        var e = mockListMapel[index];
        if (index == (8 - 1)) {
          return InkWell(
            onTap: () {
              Get.to(AllMapelPage());
            },
            child: Container(
                width: deviceWidth(context) / 4,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: ColorBase.primary.withOpacity(0.8),
                      child: Icon(Icons.more_horiz_rounded,
                          color: Colors.white, size: 35),
                    ),
                    SizedBox(height: 3),
                    Container(
                      width: (deviceWidth(context) - 40) / 4,
                      child: Text('Lihat Semua',
                          textAlign: TextAlign.center,
                          style: fontBlack.copyWith(
                            fontSize: 9,
                          )),
                    ),
                  ],
                )),
          );
        }
        return InkWell(
          onTap: () {
            Get.to(MapelPage(index));
          },
          child: Container(
              width: deviceWidth(context) / 4,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundImage: NetworkImage(index % 2 != 0
                        ? 'https://image.flaticon.com/icons/png/512/2232/2232688.png'
                        : 'https://image.flaticon.com/icons/png/512/501/501405.png'),
                  ),
                  SizedBox(height: 3),
                  Container(
                    width: (deviceWidth(context) - 40) / 4,
                    child: Text('${e.name}',
                        textAlign: TextAlign.center,
                        style: fontBlack.copyWith(
                          fontSize: 9,
                        )),
                  ),
                ],
              )),
        );
      },
    );
  }
}
