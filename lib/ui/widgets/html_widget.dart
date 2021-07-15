part of 'widgets.dart';

Widget htmlWidget(String htmlData) {
  return Html(
      data: htmlData,
      onLinkTap: (url, _, __, ___) {},
      onImageTap: (src, _, __, ___) {
        print(src);
      },
      onImageError: (exception, stackTrace) {
        print(exception);
      },
      style: {
        "p": Style(fontFamily: 'Raleway', fontSize: FontSize.large),
      });
}
