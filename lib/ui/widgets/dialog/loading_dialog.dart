part of '../widgets.dart';

class LoadingDialog extends StatelessWidget {
  final String? text;

  LoadingDialog({
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 5),
            LoadingWidget(),
            SizedBox(height: 5),
            Text(text!,
                style: fontBlack.copyWith(
                  color: Colors.black87,
                  fontSize: 12,
                )),
          ]),
    );
  }
}
