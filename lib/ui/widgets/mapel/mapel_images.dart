part of '../widgets.dart';

class MapelImages extends StatefulWidget {
  Mapel? mapel;
  MapelImages(this.mapel);
  @override
  _MapelImagesState createState() => _MapelImagesState();
}

class _MapelImagesState extends State<MapelImages> {
  PageController pageController = PageController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: <Widget>[
            Container(width: deviceWidth(context), height: 300),
            Positioned.fill(
                child: Align(
              alignment: Alignment.center,
              child: LoadingWidget(),
            )),
            Container(
              width: deviceWidth(context),
              height: 300,
              child: PageView(
                pageSnapping: false,
                physics: AlwaysScrollableScrollPhysics(),
                controller: pageController,
                onPageChanged: (i) {
                  setState(() {
                    _currentIndex = i;
                  });
                },
                children: widget.mapel!.listImage!
                    .map((e) => FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: e,
                          fit: BoxFit.scaleDown,
                          height: 300,
                          width: double.infinity,
                        ))
                    .toList(),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    // Box decoration takes a gradient
                    gradient: LinearGradient(
                      // Where the linear gradient begins and ends
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      // Add one stop for each color. Stops should increase from 0 to 1
                      colors: [
                        // Colors are easy thanks to Flutter's Colors class.
                        Colors.black.withOpacity(0.4),
                        Colors.transparent,
                        // Colors.black.withOpacity(0.5),
                        // Colors.black.withOpacity(0.07),
                        // Colors.black.withOpacity(0.05),
                        // Colors.black.withOpacity(0.025),
                      ],
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container())),
            ),
            Positioned(
              left: 0,
              child: Container(
                width: deviceWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(Icons.arrow_back_ios_rounded,
                            color: Colors.black, size: 25)),
                    IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(Icons.more_vert,
                            color: Colors.black, size: 25)),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.mapel!.listImage!.map((e) {
              int i = widget.mapel!.listImage!.indexOf(e);
              return dotIndicator(isActive: _currentIndex == i ? true : false);
            }).toList()),
      ],
    );
  }
}

Widget dotIndicator({bool? isActive}) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    width: isActive! ? 8 : 8,
    height: 8,
    margin: EdgeInsets.symmetric(horizontal: 2.0),
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius:
          isActive ? BorderRadius.circular(5) : BorderRadius.circular(180),
      color: isActive ? ColorBase.primary : Color(0xfff1f1f1),
    ),
  );
}
