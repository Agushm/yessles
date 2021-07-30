part of '../widgets.dart';

teacherBottomSheet(BuildContext? context, int index) {
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
        child: Consumer<TransactionProvider>(
          builder: (context, prov, _) {
            var mentors = prov.selectedMapel[index]['list_mentor'];
            return Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Text('Pilih Mentor', style: fontBlack)),
                Container(
                  height: deviceWidth(context) / 2,
                  child: ListView.builder(
                      itemCount: mentors.length,
                      itemBuilder: (context, i) {
                        var teacher = mentors[i];
                        return InkWell(
                          onTap: () {
                            prov.addSelectedTeacher(index, teacher);
                            Get.back();
                          },
                          child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: widgetSelectTeacher(teacher)),
                        );
                      }),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
