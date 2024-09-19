import 'package:flutter/material.dart';
import 'package:pricecompare/views/product/product_list_view.dart';
import 'package:pricecompare/views/product/wishlist_view.dart';
import 'package:pricecompare/views/product/ordered_view.dart';
import 'package:pricecompare/views/product/search_view.dart';
import 'package:pricecompare/views/profile/profile_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    WishlistPage(),
    SearchPage(),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'ordered',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF29006C),
        backgroundColor: Color(0xFFF5EAFB),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(
            fontSize: 15, fontFamily: 'Poppins', color: Color(0xFF6600B7)),
        iconSize: 30,
        onTap: _onItemTapped,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeView(),
  ));
}
