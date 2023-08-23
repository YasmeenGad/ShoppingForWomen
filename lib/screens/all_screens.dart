import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/cart_page.dart';
import 'package:shoppingapp/screens/favorite_cart.dart';
import 'package:shoppingapp/screens/home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class AllScreens extends StatefulWidget {
  @override
  State<AllScreens> createState() => _AllScreensState();
}

class _AllScreensState extends State<AllScreens> {
  int selectIndex = 0;

  List<Widget> _widgetOptions = [
    HomePage(),
    CartPage(),
    FavoriteCart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(selectIndex),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        height: 70,
        color: Color(0xFF4C53A5),
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(CupertinoIcons.cart_fill, size: 30, color: Colors.white),
          Icon(Icons.favorite_outline, size: 30, color: Colors.white),
        ],
        index: selectIndex,
        onTap: (index) {
          setState(() {
            selectIndex = index;
          });
        },
      ),
    );
  }
}
