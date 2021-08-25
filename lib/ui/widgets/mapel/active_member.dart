part of '../widgets.dart';

Widget activeMember(Teacher data) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(data.photo!),
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: 60,
          child: Text('${data.nama!}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: fontBlack.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                  fontSize: 12)),
        ),
      ],
    ),
  );
}
