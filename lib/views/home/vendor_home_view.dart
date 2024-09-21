import 'package:flutter/material.dart';
import 'package:pricecompare/views/product/wishlist_view.dart';
import 'package:pricecompare/views/product/ordered_view.dart';
import 'package:pricecompare/views/profile/profile_view.dart';
import 'package:heroicons/heroicons.dart';

class VendorHomeView extends StatefulWidget {
  @override
  _VendorHomeViewState createState() => _VendorHomeViewState();
}

class _VendorHomeViewState extends State<VendorHomeView> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    WishlistPage(),
    OrderedPage(),
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
      backgroundColor: Color(0xFFF5EAFB),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFF5EAFB),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icon.png', height: 30),
                Text(
                  'PRICO',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Jersey10',
                    color: Color(0xFF9B1DFF),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          Expanded(
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2, 
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.rectangleStack),
            label: 'my items',
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.clipboardDocumentList),
            label: 'orders',
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.userCircle),
            label: 'profile',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor:Color(0xFFF5EAFB),
        selectedItemColor: Color(0xFF29006C),
        unselectedItemColor: Color(0xFFC6C6C6),
        selectedLabelStyle: TextStyle(
            fontSize: 15, fontFamily: 'Poppins', color: Color(0xFF6600B7)),
        iconSize: 30,
        onTap: _onItemTapped,
      ),
    ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: VendorHomeView(),
  ));
}
