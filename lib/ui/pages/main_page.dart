part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SchedulePage(),
    NotificationPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons
                .home), //Image.asset(iconsPath + 'house.png', width: 20, height: 20),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons
                .list_alt_outlined), //Image.asset(iconsPath + 'completed-task.png', width: 20, height: 20),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons
                .notifications), //Image.asset(iconsPath + 'notification.png',width: 20, height: 20),
            label: 'Informasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons
                .person), //Image.asset(iconsPath + 'user.png', width: 20, height: 20),
            label: 'Akun',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: ColorBase.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
