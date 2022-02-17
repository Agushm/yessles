part of 'widgets.dart';

class PosterBaner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleProvider>(
      builder: (context, prov, _) {
        if (prov.slideBanner.isEmpty && prov.slideInit) {
          prov.getBanner(context);
          return Container(
            width: deviceWidth(context),
            height: deviceHeight(context) / 4,
            decoration: BoxDecoration(color: ColorBase.grey),
          );
        }
        return CarouselSlider(
          options: CarouselOptions(
            height: deviceHeight(context) / 4,
            viewportFraction: 1,
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: imageSliders(prov.slideBanner),
        );
      },
    );
  }
}

List<Widget> imageSliders(List<Article> slideBanner) {
  return slideBanner
      .map(
        (item) => InkWell(
          onTap: () => Get.to(ArticlePage(item)),
          child: Container(
            child: ClipRRect(
                child: Stack(
              children: <Widget>[
                Image.network(item.thumbnail!,
                    fit: BoxFit.cover, width: 1000.0),
              ],
            )),
          ),
        ),
      )
      .toList();
}
