part of 'widgets.dart';

Widget htmlWidget(String htmlData) {
  return Html(
    data: htmlData,
    style: {
      "table": Style(
        backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
      ),
      "tr": Style(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      "th": Style(
        padding: EdgeInsets.all(6),
        backgroundColor: Colors.grey,
      ),
      "td": Style(
        padding: EdgeInsets.all(6),
        alignment: Alignment.topLeft,
      ),
      'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
    },
  );
}
