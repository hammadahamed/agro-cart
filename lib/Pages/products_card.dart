import 'package:agro_cart/Custom_routes.dart/bounce.dart';
import 'package:agro_cart/Pages/products_detail.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductsCard extends StatefulWidget {
  @override
  _ProductsCardState createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  var carddetails = {
    "productname": "Strawberry",
    "image_url": "assets/cardimg.jpg",
    "Seller": "hammad",
    "location": "Salem, TamilNadu",
    "quantity_kg": 2,
    "price_rs": 50,
    "seller_mobile": 9080537172,
    "liked": true,
  };

  bool liked = false;

  Widget front() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Center(
          child: Stack(
            children: <Widget>[
//  ------------------  description  ----------------------

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[50],
                  ),
                  height: 130,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            //------------  line - 1  ------------------------
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  child: Container(
                                    width: 110,
                                    child: Text(
                                      carddetails["productname"],
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //-------------  line - 2  -----------------------
                            // SizedBox(
                            //   height: 0,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "★★★★★",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.green),
                                ),
                              ],
                            ),
                            //----------------  line - 3  -------------------
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                        //  --------------- second stack element (i.e) price TAG  --------------
                        Positioned(
                          bottom: 15,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              // Icon(
                              //   Icons.attach_money,
                              //   color: Colors.green,
                              //   size: 20,
                              // ),
                              Text(
                                "₹" + carddetails["price_rs"].toString(),
                                style: TextStyle(
                                    color: Colors.green, fontSize: 25),
                              ),
                              Text(
                                "/ Kg ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: Colors.grey,
                                size: 14,
                              ),
                              Text(carddetails["location"],
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              //  -------------- end description  -----------------------

//  -------------  image ------------------------------
              Container(
                margin: EdgeInsets.all(2),
                height: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 6),
                          blurRadius: 1),
                    ]),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                        carddetails["image_url"],
                        fit: BoxFit.fill,
                      )),
              ),
              //  -------------------- end image  -------------------

//  ------------------------------  like button  ------------------------------------
              Positioned(
                right: 4,
                top: 1,
                child: Container(
                  child: IconButton(
                    onPressed: ()
                    {
                      setState((){
                        liked = !liked;
                      });
                      Fluttertoast.showToast(msg: "liked");
                      },
                    icon: Icon(liked ? Icons.favorite : Icons.favorite_border),
                    color: Colors.red,
                    iconSize: 20,
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget back() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Divider(
          indent: 20,
          endIndent: 20,
          color: Colors.blueGrey,
          thickness: 2,
        ),
        ListTile(
          // leading: Icon(Icons.edit),
          title: Text(
            "Description",
            style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500),
          ),
          trailing: Icon(Icons.edit, color: Colors.blueGrey),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "The description that the user enters about the product comes here. Help your famers with AgroCart",
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.black),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          indent: 20,
          endIndent: 20,
          color: Colors.blueGrey,
          thickness: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.touch_app,
              color: Colors.blueGrey[100],
              size: 15,
            ),
            Text(
              "Double Tap for More",
              style: TextStyle(color: Colors.grey[400]),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: ()=>Navigator.of(context).push(Bounce(alignment: Alignment.center,widget: ProductsDetail())),
      child: Card(
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.transparent,
        elevation: 2,
        child: FlipCard(
          speed: 200,
          front: front(),
          back: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFf5f6f7),
            ),
            child: back(),
          ),
        ),
      ),
    );
  }
}
