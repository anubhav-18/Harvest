import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocers/constants/colour.dart';
import 'package:grocers/views/home_view/home.dart';
import 'package:grocers/views/wishList_view/wishList.dart';

class BtmNavBar extends StatefulWidget {
  const BtmNavBar({super.key});

  @override
  State<BtmNavBar> createState() => _BtmNavBarState();
}

// int selectedIndex = 0 ;

// List screenList = [
//   const HomePage(),
//   Container(
//     color: Colors.red,
//   ),
//   Container(
//     color: Colors.blue,
//   ),
//   Container(
//     color: Colors.green,
//   ),
// ];

class _BtmNavBarState extends State<BtmNavBar> {
  int _btmnavindex = 0;
  void _onItemTapped(int index) {
    if (index != 2) {
      setState(() {
        _btmnavindex = index;
      });
    } else {
      Get.toNamed('/loginPage');
    }
  }

  Widget pageCaller(int index) {
    switch (index) {
      case 0:
        {
          return const HomePage();
        }
      case 1:
        {
          return const WishList();
        }
      case 3:
        {
          return Container(
            color: Colors.blue,
          );
        }
    }
    return Container(
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageCaller(_btmnavindex),
      // screenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          iconSize: 30,
          selectedItemColor: mainBckgrnd,
          unselectedItemColor: blackclr.withOpacity(0.7),
          selectedLabelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          unselectedLabelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: nuetralBck,
          elevation: 8,
          currentIndex: _btmnavindex,
          onTap: _onItemTapped,
          // (value) {
          //   setState(() {
          //     selectedIndex = value ;
          //   });
          // },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart), label: 'WishList'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                ),
                label: 'Orders'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.shopping_cart), label: 'Cart'),
          ]),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}
