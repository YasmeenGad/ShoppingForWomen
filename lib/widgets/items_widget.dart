import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/App_Images/app_images.dart';
import 'package:shoppingapp/bloc/addFavoriteCart/bloc/add_favorite_cart_bloc.dart';
import 'package:shoppingapp/bloc/authBloc/auth_cart_bloc.dart';

import 'package:shoppingapp/class_detatils/class_details.dart';
import 'package:shoppingapp/screens/item_page.dart';

class ItemsWidget extends StatelessWidget {
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
      image: "${Assets.image3}",
      name: "Handbag",
      discount: "-35%",
      description:
          "Mini Jelly Purse Flap Handbag with Pearls Top Handle Faux Quilted Crossbody Bag",
      price: "\$450",
    ),
    Details(
      image: "${Assets.image4}",
      name: "Fashion Handbag",
      discount: "-60%",
      description:
          "Mini Jelly Purse Flap Handbag with Pearls Top Handle Faux Quilted Crossbody Bag",
      price: "\$390",
    ),
    Details(
      image: "${Assets.image5}",
      name: "Handbag",
      discount: "-30%",
      description:
          "Mini Jelly Purse Flap Handbag with Pearls Top Handle Faux Quilted Crossbody Bag",
      price: "\$250",
    ),
    Details(
      image: "${Assets.image6}",
      name: "Heels",
      discount: "-65%",
      description:
          "finding the perfect heel for an outfit can be a challenging process.",
      price: "\$200",
    ),
    Details(
      image: "${Assets.image7}",
      name: "Smart Watch",
      discount: "-20%",
      description: "Women Watches Fashion Quartz Ladies Watch Female Clock",
      price: "\$180",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: details.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 0.71,
            crossAxisSpacing: 2),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color(0xFF4C53A5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "${details[index].discount}",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<AddFavoriteCartBloc>(context).add(
                            AddFavoriteCart(
                                image: "${details[index].image}",
                                name: "${details[index].name}",
                                price: "${details[index].price}"));
                        final snackBar = SnackBar(
                            content:
                                Text("cart added as a favorite successfully"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      icon: Icon(
                        Icons.favorite_outline,
                        color: Colors.red,
                      ))
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemPage(
                                image: "${details[index].image}",
                                name: "${details[index].name}",
                                description: "${details[index].description}",
                                price: "${details[index].price}",
                              )));
                },
                child: Container(
                  // height: 300,
                  // margin: EdgeInsets.all(10),
                  child: Image.asset(
                    "${details[index].image}",
                    width: 105,
                    height: 105,
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text("${details[index].name}",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5),
                      ))),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${details[index].price}",
                      style: (TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5),
                      )),
                    ),
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<AuthCartBloc>(context).add(AddCart(
                              image: "${details[index].image}",
                              name: "${details[index].name}",
                              price: "${details[index].price}"));
                          final snackBar = SnackBar(
                              content: Text("cart added successfully"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: Color(0xFF4C53A5),
                        ))
                  ],
                ),
              ),
            ]),
          );
        });
    // GridView.count(
    //   physics: NeverScrollableScrollPhysics(),
    //   childAspectRatio: 0.63,
    //   shrinkWrap: true,
    //   crossAxisCount: 2,
    //   children: [
    //     for (int i = 0; i < details.length; i++)

    //   ],
    // );
  }
}
