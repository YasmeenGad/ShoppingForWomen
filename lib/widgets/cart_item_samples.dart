import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/App_Images/app_images.dart';
import 'package:shoppingapp/bloc/authBloc/auth_cart_bloc.dart';

import 'package:shoppingapp/class_detatils/class_details.dart';

class CartItemSamples extends StatelessWidget {
  List<Details> details = [
    Details(
      image: "${Assets.image1}",
      name: "Heels",
      discount: "-50%",
      description:
          "finding the perfect heel for an outfit can be a challenging process.",
      price: "\$150",
    ),
    Details(
      image: "${Assets.image2}",
      name: "Watch",
      discount: "-40%",
      description: "Women Watches Fashion Quartz Ladies Watch Female Clock",
      price: "\$399",
    ),
    Details(
      image: "${Assets.image4}",
      name: "Handbag",
      discount: "-60%",
      description:
          "Mini Jelly Purse Flap Handbag with Pearls Top Handle Faux Quilted Crossbody Bag",
      price: "\$390",
    ),
    Details(
      image: "${Assets.image5}",
      name: "Handbag",
      discount: "-30%",
      description: "description",
      price: "\$250",
    ),
    Details(
      image: "${Assets.image6}",
      name: "Heels",
      discount: "-65%",
      description: "description",
      price: "\$200",
    ),
    Details(
      image: "${Assets.image7}",
      name: "Smart Watch",
      discount: "-20%",
      description: "description",
      price: "\$180",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCartBloc, AuthCartState>(builder: (context, state) {
      if (state is AddCartSuccess) {
        return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: BlocProvider.of<AuthCartBloc>(context).carts.length,
            itemBuilder: (context, index) {
              return Container(
                height: 110,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(children: [
                  Radio(
                      value: "",
                      groupValue: "",
                      activeColor: Color(0xFF4C53A5),
                      onChanged: (index) {}),
                  Container(
                    height: 70,
                    width: 70,
                    // margin: EdgeInsets.only(left: 15),
                    child: Image.asset(
                      "${BlocProvider.of<AuthCartBloc>(context).carts[index].image}",
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${BlocProvider.of<AuthCartBloc>(context).carts[index].name}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C53A5),
                          ),
                        ),
                        Text(
                          "${BlocProvider.of<AuthCartBloc>(context).carts[index].price}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C53A5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<AuthCartBloc>(context).add(
                                  RemoveCart(
                                      image: "${details[index].image}",
                                      name: "${details[index].name}",
                                      price: "${details[index].price}"));
                            },
                            icon: Icon(Icons.delete, color: Colors.red)),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 10,
                                        spreadRadius: 1)
                                  ]),
                              child: Icon(CupertinoIcons.minus, size: 18),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: Text("01",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4C53A5),
                                    ))),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 10,
                                        spreadRadius: 1)
                                  ]),
                              child: Icon(
                                CupertinoIcons.plus,
                                size: 18,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ]),
              );
            });
      }
      return Center();
    }, listener: (context, state) {
      if (state is RemoveCartSuccess) {
        final snackBar = SnackBar(content: Text("cart removed successfully"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }
}
