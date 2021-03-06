import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorBase {
  static final primary = Color(0xFFEC422C);
  static final blue = Color(0xFF0176E8);
  static final grey = Color(0xFFF1F1F1);
  static final green = Color(0xff4E9424);
  static final btnCopy = Color(0xff508DCB);
}

String iconsPath = 'assets/icons/';

TextStyle fontBlack = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
  color: Colors.black,
  fontSize: 15,
);

TextStyle font2Black =
    GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.w300);

TextStyle fontWhite = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
  color: Colors.white,
  fontSize: 15,
);

TextStyle fontAppBarTitle = fontBlack.copyWith(
    fontSize: 16, color: ColorBase.primary, fontWeight: FontWeight.bold);

InputDecoration decorationForm = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(width: 1.5),
  ),
  isDense: true, // Added this
  contentPadding: EdgeInsets.all(10), // Added this
  hintStyle: fontBlack.copyWith(fontSize: 12, color: Colors.black54),
);

InputDecoration registerForm = InputDecoration(
  fillColor: Colors.grey[100],
  filled: true,
  border: OutlineInputBorder(
      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(8)),
  isDense: true, // Added this
  contentPadding: EdgeInsets.all(15), // Added this
  hintStyle: fontBlack.copyWith(fontSize: 12, color: Colors.black54),
);
InputDecoration loginInputDecoration = InputDecoration(
    hintStyle: fontBlack.copyWith(
        fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w500),
    fillColor: Colors.white,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    enabledBorder: loginOutlineBorder,
    focusedBorder: loginOutlineBorder,
    border: loginOutlineBorder);

OutlineInputBorder loginOutlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(60),
    borderSide: BorderSide(color: Colors.white, width: 3.0));
MaterialButton commonButton(
    {String? btnText, Function()? onPressed, Color? btnColor}) {
  return MaterialButton(
    height: 50,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(60),
    ),
    padding: EdgeInsets.symmetric(vertical: 15),
    color: btnColor ?? ColorBase.primary,
    onPressed: onPressed,
    child: Text(btnText!, style: fontWhite),
  );
}

TextButton cancelButton(
    {String? btnText, Function()? onPressed, Color? btnColor}) {
  return TextButton(
    onPressed: onPressed,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.close, size: 15, color: Colors.blue),
        SizedBox(width: 5),
        Text(
          btnText!,
          style: fontBlack.copyWith(
              fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

MaterialButton btnMentor(
    {String? btnText, Function()? onPressed, Color? btnColor}) {
  return MaterialButton(
    height: 20,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: ColorBase.primary,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(60),
    ),
    padding: EdgeInsets.symmetric(vertical: 15),
    color: Colors.white,
    onPressed: onPressed,
    child: Text('+ Pilih Mentor',
        style: fontBlack.copyWith(fontSize: 12, color: ColorBase.primary)),
  );
}

//* Device size
double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Color colorStatus(String status) {
  if (status == 'success') {
    return Colors.green;
  } else if (status == 'process') {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}

LinearGradient loadingGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Colors.black26, Colors.black12]);

Widget buildLabelTitle(String? title) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    constraints: BoxConstraints(
      minWidth: 180,
    ),
    decoration: BoxDecoration(
      color: ColorBase.primary,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    child: Text(
      title!,
      style: fontWhite.copyWith(
          letterSpacing: title.length < 10 ? 6 : 1,
          fontSize: 14,
          fontWeight: FontWeight.bold),
    ),
  );
}
