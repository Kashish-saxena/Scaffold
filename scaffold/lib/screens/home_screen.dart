import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexSelected = 0;
  int drawerPageIndex = 0;
  static const List<Widget> screens = <Widget>[
    Text('Settings'),
    Text('Archived chats'),
    Text('Profile'),
  ];

  static const List<Widget> drawers = <Widget>[
    Text('Settings'),
    Text('Profile'),
    Text('Archived'),
    Text('status'),
  ];

  void itemTapped(int index) {
    setState(() {
      indexSelected = index;
    });
  }

  void drawerPage(int index) {
    setState(() {
      drawerPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        drawer: Drawer(
            child: ListView(
          children: [
            const DrawerHeader(child: Text("Welcome")),
            ListTile(
              title: const Text('Settings'),
              selected: drawerPageIndex == 0,
              onTap: () {
                drawerPage(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              selected: drawerPageIndex == 1,
              onTap: () {
                drawerPage(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Archived'),
              selected: drawerPageIndex == 2,
              onTap: () {
                drawerPage(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('status'),
              selected: drawerPageIndex == 3,
              onTap: () {
                drawerPage(3);
                Navigator.pop(context);
              },
            ),
          ],
        )),
        appBar: AppBar(
          title: const Text('WhatsApp'),
          actions: const [
            Icon(Icons.camera_alt_outlined),
            Icon(Icons.search),
            Icon(Icons.more_vert_rounded),
          ],
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.groups_2_rounded)),
            Tab(text: 'Chats'),
            Tab(text: 'Updates'),
            Tab(text: 'Calls'),
          ]),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BottomNavigationBar',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.green,
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: screens.elementAt(indexSelected),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Drawer',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.blue,
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: drawers.elementAt(drawerPageIndex),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: itemTapped,
          currentIndex: indexSelected,
          selectedItemColor: Colors.amber,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
