import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shoppingapp/bloc/addFavoriteCart/bloc/add_favorite_cart_bloc.dart';
import 'package:shoppingapp/bloc/authBloc/auth_cart_bloc.dart';
import 'package:shoppingapp/widgets/cart_app_bar.dart';

class FavoriteCart extends StatelessWidget {
  const FavoriteCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFavoriteCartBloc, AddFavoriteCartState>(
      builder: (context, state) {
        if (state is AddFavoriteCartSuccess) {
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
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              BlocProvider.of<AddFavoriteCartBloc>(context)
                                  .addFav
                                  .length,
                          itemBuilder: (context, index) {
                            return Container(
                              // height: 110,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(children: [
                                Container(
                                  height: 80,
                                  width: 100,
                                  // margin: EdgeInsets.only(left: 15),
                                  child: Image.asset(
                                    "${BlocProvider.of<AddFavoriteCartBloc>(context).addFav[index].image}",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${BlocProvider.of<AddFavoriteCartBloc>(context).addFav[index].name}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF4C53A5),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "${BlocProvider.of<AddFavoriteCartBloc>(context).addFav[index].price}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF4C53A5),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      RatingBar.builder(
                                          initialRating: 3,
                                          maxRating: 1,
                                          direction: Axis.horizontal,
                                          itemCount: 4,
                                          itemSize: 15,
                                          itemBuilder: ((context, _) {
                                            return Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            );
                                          }),
                                          onRatingUpdate: (value) {}),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF4C53A5),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        blurRadius: 10,
                                                        spreadRadius: 1)
                                                  ]),
                                              child: MaterialButton(
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30)),
                                                            title: Text(
                                                              "Add Cart",
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                            content: Text(
                                                              "Are you sure that you want to add this cart?",
                                                              style: TextStyle(
                                                                fontSize: 22,
                                                              ),
                                                            ),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                child:
                                                                    const Text(
                                                                  'No',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                              TextButton(
                                                                child:
                                                                    const Text(
                                                                  'Yes',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  BlocProvider.of<
                                                                              AuthCartBloc>(
                                                                          context)
                                                                      .add(AddCart(
                                                                          image:
                                                                              "${BlocProvider.of<AddFavoriteCartBloc>(context).addFav[index].image}",
                                                                          name:
                                                                              "${BlocProvider.of<AddFavoriteCartBloc>(context).addFav[index].name}",
                                                                          price:
                                                                              "${BlocProvider.of<AddFavoriteCartBloc>(context).addFav[index].price}"));
                                                                  Navigator.pop(
                                                                      context);
                                                                  final snackBar =
                                                                      SnackBar(
                                                                          content:
                                                                              Text("cart added successfully"));
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                          snackBar);
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  },
                                                  child: Text("Add To Cart",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color:
                                                              Colors.white)))),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          })
                    ])),
              ],
            ),
          );
        }
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: Text("Favorite Carts",
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
                  "No Favorite Cart Added !",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFF4C53A5),
                  ),
                ),
              )),
        );
      },
    );
  }
}
