import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/bloc/authBloc/auth_cart_bloc.dart';

import 'package:shoppingapp/screens/cart_page.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(children: [
        Icon(
          Icons.sort,
          size: 30,
          color: Color(0xFF4C53A5),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text("DP Shop",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5),
              )),
        ),
        Spacer(),
        badges.Badge(
          position: badges.BadgePosition.topEnd(top: -4, end: 2),
          badgeContent: Text(
            "${BlocProvider.of<AuthCartBloc>(context).counter}",
            style: TextStyle(color: Colors.white),
          ),
          child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  size: 30,
                  color: Color(0xFF4C53A5),
                ),
              )),
        )
      ]),
    );
  }
}
