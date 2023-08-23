import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shoppingapp/widgets/cart_app_bar.dart';
import 'package:shoppingapp/widgets/cart_buttom_nav_bar.dart';
import 'package:shoppingapp/widgets/cart_item_samples.dart';

import '../bloc/authBloc/auth_cart_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCartBloc, AuthCartState>(
      builder: (context, state) {
        if (state is AddCartSuccess) {
          return Scaffold(
            body: ListView(
              children: [
                CartAppBar(),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      color: Color(0xFFEDECF2),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  child: Column(children: [
                    CartItemSamples(),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF4C53A5),
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Add Coupun Code",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4C53A5),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                )
              ],
            ),
            bottomNavigationBar: CartBottomNavBar(),
          );
        }
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: Text("Carts",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF4C53A5),
                    )),
                elevation: 0,
                backgroundColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 5),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ),
                actions: [
                  Icon(Icons.more_vert, color: Color(0xFF4C53A5), size: 25)
                ],
              ),
              body: Center(
                child: Text(
                  "No Cart Added !",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF4C53A5),
                  ),
                ),
              )),
        );
      },
    );
  }
}
