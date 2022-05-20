part of '../widgets.dart';

sendReviewBottomSheet(BuildContext? context, Teacher teacher) {
  return showModalBottomSheet(
    context: context!,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    builder: (context) {
      return Container(
        padding: EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Consumer<TeacherProvider>(
          builder: (context, prov, _) {
            return AddRatingWidget(teacher);
          },
        ),
      );
    },
  );
}

class AddRatingWidget extends StatefulWidget {
  final Teacher teacher;
  AddRatingWidget(this.teacher);
  @override
  _AddRatingWidgetState createState() => _AddRatingWidgetState();
}

class _AddRatingWidgetState extends State<AddRatingWidget> {
  double ratingCount = 0;
  TextEditingController commentController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text('Review Mentor', style: fontBlack)),
          Center(
            child: StarRating(
              rating: ratingCount,
              starCount: 5,
              size: 50,
              color: Colors.yellow,
              mainAxisAlignment: MainAxisAlignment.center,
              onRatingChanged: (value) {
                setState(() {
                  ratingCount = value;
                });
              },
            ),
          ),
          SizedBox(height: 5),
          TextFormField(
            controller: commentController,
            style: fontBlack.copyWith(color: Colors.black, fontSize: 14),
            decoration:
                registerForm.copyWith(hintText: 'Tulis komentarmu disini'),
            textInputAction: TextInputAction.send,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Maaf harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          Center(
            child: MaterialButton(
              elevation: 1,
              color: ColorBase.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Get.back();
                  Provider.of<RatingProvider>(context, listen: false)
                      .addRating(context, {
                    "guru_id": widget.teacher.id,
                    "rating": ratingCount,
                    "komentar": commentController.text
                  });
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text('Kirim Review', style: fontWhite),
                ],
              ),
            ),
          ),
          SizedBox(height: 30)
        ],
      ),
    );
  }
}
