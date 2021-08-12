part of '../widgets.dart';

class GridMapel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: mapel.map((e) {
        var index = mapel.indexOf(e);
        return InkWell(
          onTap: () {
            Get.to(MapelPage());
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
                    child: Text('${e['nama_mapel']}',
                        textAlign: TextAlign.center,
                        style: fontBlack.copyWith(
                          fontSize: 9,
                        )),
                  ),
                ],
              )),
        );
      }).toList(),
    );
  }
}
