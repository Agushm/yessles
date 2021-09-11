part of 'pages.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _LandingBanner()),
          Container(
            width: 250,
            child: MaterialButton(
              height: 50,
              color: ColorBase.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
              onPressed: () {
                Get.to(LoginPage());
              },
              child: Text('Login Dengan Handphone', style: fontWhite),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: 250,
            child: MaterialButton(
              elevation: 5,
              height: 50,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
              onPressed: () {
                Provider.of<UserProvider>(context, listen: false)
                    .login(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(180)),
                    child: SvgPicture.asset(
                      'assets/icons/google.svg',
                      width: 25,
                      height: 25,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('Login Dengan Google',
                          style: fontBlack.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _LandingBanner extends StatefulWidget {
  @override
  __LandingBannerState createState() => __LandingBannerState();
}

class __LandingBannerState extends State<_LandingBanner> {
  List<Map> images = [
    {
      'image':
          'https://image.freepik.com/free-vector/focused-tiny-people-reading-books_74855-5836.jpg',
      'title': 'Find best deal',
      'message':
          'Find deals for any season from cosy country homes to city flats'
    },
    {
      'image':
          'https://image.freepik.com/free-vector/happy-diverse-students-celebrating-graduation-from-school_74855-5853.jpg',
      'title': 'Find best deal 2',
      'message':
          'Find deals for any season from cosy country homes to city flats'
    },
  ];
  PageController _pageController = PageController();
  double currentPage = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 400,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              var d = images[index];
              return Column(
                children: [
                  Image.network(d['image'], width: 300, height: 300),
                  Text(
                    d['title'],
                    style: fontBlack.copyWith(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 250,
                    child: Text(
                      d['message'],
                      textAlign: TextAlign.center,
                      style: fontBlack.copyWith(
                          fontSize: 14, color: Colors.black54),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildPageIndicator(),
        ),
      ],
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < images.length; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return Container(
      height: 10,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 50),
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 10 : 8.0,
        width: isActive ? 12 : 8.0,
        decoration: BoxDecoration(
          // boxShadow: [
          //   isActive
          //       ? BoxShadow(
          //           color: Color(0XFF2FB7B2).withOpacity(0.72),
          //           blurRadius: 4.0,
          //           spreadRadius: 1.0,
          //           offset: Offset(
          //             0.0,
          //             0.0,
          //           ),
          //         )
          //       : BoxShadow(
          //           color: Colors.transparent,
          //         )
          // ],
          shape: BoxShape.circle,
          color: isActive ? ColorBase.primary : Color(0XFFEAEAEA),
        ),
      ),
    );
  }
}
