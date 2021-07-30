part of '../widgets.dart';

Widget widgetTeacher(Teacher data) {
  return Row(
    children: [
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(data.teacherImage!),
          ),
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250,
              child: Text('${data.teacherName}',
                  maxLines: 1,
                  style: fontBlack.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 12)),
            ),
            Text('Aktif 23 menit lalu | ${data.teacherAddress}',
                style: fontBlack.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    fontSize: 10)),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 12),
                Text(' ${data.teacherRating} rating pengajar',
                    style: fontBlack.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                        fontSize: 10)),
              ],
            ),
          ],
        ),
      ),
      Container(
        width: 50,
        height: 25,
        child: MaterialButton(
            padding: EdgeInsets.all(4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: ColorBase.primary, width: 2),
            ),
            onPressed: () {},
            child: Text('Ikuti',
                style: fontBlack.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorBase.primary,
                    fontSize: 12))),
      ),
    ],
  );
}

Widget widgetSelectTeacher(Teacher data) {
  return Row(
    children: [
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(data.teacherImage!),
          ),
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250,
              child: Text('${data.teacherName}',
                  maxLines: 1,
                  style: fontBlack.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 12)),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 12),
                Text(' ${data.teacherRating} rating pengajar',
                    style: fontBlack.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                        fontSize: 10)),
              ],
            ),
          ],
        ),
      ),
      Icon(Icons.arrow_forward_ios_rounded),
    ],
  );
}
