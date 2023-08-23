import 'package:flutter/material.dart';
import 'package:shoppingapp/App_Images/app_images.dart';
import 'package:shoppingapp/class_detatils/class_details.dart';

class CategoriesWidget extends StatelessWidget {
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
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          height: 80,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: details.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "${details[index].image}",
                            width: 40,
                            height: 40,
                          ),
                          Text("${details[index].name}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4C53A5),
                              ))
                        ],
                      ),
                    )
                  ],
                );
              }),
        ));
  }
}
