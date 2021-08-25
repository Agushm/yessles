part of '../widgets.dart';

Widget widgetReviewMapel(Teacher? teacher) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Review Teacher',
              style: fontBlack.copyWith(fontWeight: FontWeight.bold)),
          TextButton(
              onPressed: () {},
              child: Text('Lihat Semua',
                  style: fontBlack.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: ColorBase.primary))),
        ],
      ),
      Row(
        children: [
          StarRating(
              rating: teacher!.totalRating,
              starCount: 5,
              size: 20,
              color: Colors.yellow),
          SizedBox(width: 5),
          Text('${teacher.totalRating}',
              style: fontBlack.copyWith(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
          SizedBox(width: 5),
          Text('(${teacher.totalRating} Review)',
              style: fontBlack.copyWith(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: FontWeight.w500)),
        ],
      ),
      SizedBox(height: 10),
      Consumer<RatingProvider>(builder: (context, prov, _) {
        if (prov.ratings.isEmpty && !prov.reviewsInit) {
          return Text('Belum ada data');
        }
        return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: prov.ratings.length,
          separatorBuilder: (c, i) {
            return Divider();
          },
          itemBuilder: (c, i) {
            var review = prov.ratings[i];
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(review.user!.photoProfile!),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text('${review.user!.namaLengkap}',
                                style: fontBlack.copyWith(
                                    fontSize: 10, fontWeight: FontWeight.bold)),
                            StarRating(
                                rating: review.rating,
                                starCount: 5,
                                size: 12,
                                color: Colors.yellow),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text('${review.komentar!}',
                        style: fontBlack.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w300)),
                  ),
                  // Row(
                  //   children: review.review!.images!
                  //       .map((e) => Container(
                  //             margin: EdgeInsets.only(right: 10),
                  //             decoration: BoxDecoration(
                  //               border:
                  //                   Border.all(width: 1, color: Colors.black12),
                  //             ),
                  //             child: Image.network(e, width: 72, height: 72),
                  //           ))
                  //       .toList(),
                  // ),
                  SizedBox(height: 10),
                  Text('${tanggalInvoice(review.createdAt!)}',
                      style: fontBlack.copyWith(
                          color: Colors.black54,
                          fontSize: 10,
                          fontWeight: FontWeight.w300)),
                  SizedBox(height: 10),
                ],
              ),
            );
          },
        );
      }),
    ],
  );
}
