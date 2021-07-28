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
        return Container(
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
                Text('${e['nama_mapel']}',
                    textAlign: TextAlign.center,
                    style: fontBlack.copyWith(
                      fontSize: 10,
                    )),
              ],
            ));
      }).toList(),
    );
  }
}