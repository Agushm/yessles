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
      return Consumer<TransactionProvider>(
        builder: (context, prov, _) {
          var mentors = prov.selectedMapel[index].teachers;
          return !prov.isGetTeacherInit && mentors!.isEmpty
              ? Center(
                  child: Text('Maaf, tidak ada data', style: fontBlack),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Pilih Mentor',
                        style: fontBlack.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 300,
                      child: ListView.builder(
                        itemCount: mentors!.length,
                        itemBuilder: (context, i) {
                          var teacher = mentors[i];
                          return InkWell(
                            onTap: () {
                              prov.addSelectedTeacher(context, index, teacher);
                              Get.back();
                            },
                            child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Column(
                                  children: [
                                    widgetSelectTeacher(teacher),
                                    Divider(),
                                  ],
                                )),
                          );
                        },
                      ),
                    ),
                  ],
                );
        },
      );
    },
  );
}
