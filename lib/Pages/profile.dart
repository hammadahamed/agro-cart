// import 'package:agro_cart/Custom_routes.dart/bounce.dart';
import 'package:agro_cart/Pages/create_edit_dialog.dart';
import 'package:agro_cart/Pages/temp.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double secContaierSize = orientation == Orientation.portrait
        ? (MediaQuery.of(context).size.height / 2 - 50)
        : (MediaQuery.of(context).size.height / 2 - 100);
    Color iconbg = Colors.grey[200];
    double iconsize = 50;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //  ----------------------------  FIRST HALF CONTAINER   -------------------------
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                boxShadow: [
                  BoxShadow(color: Colors.black12, offset: Offset(0, 6)),
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              height: MediaQuery.of(context).size.height / 2.8,
              child: Stack(
                children: [
                  ListView(
                    children: [
                      SizedBox(height: 50),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    //--------------------  name -------------------
                                    Text(
                                      "hammad ahamed ",
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    //-----------------------------------------------
                                    SizedBox(
                                      height: 15,
                                    ),
                                    //-----------------  phone number  -----------------
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.phone_iphone,
                                          color: Colors.cyan,
                                          size: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4),
                                          child: Text("9080537172",
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ],
                                    ),
                                    // -------------------- location  ------------------------
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.green,
                                          size: 15,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 4),
                                          width: 200,
                                          child: Text("Salem, TamilNadu",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ],
                                    ),
                                    //----------------- mail id  ---------------------------
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.mail,
                                          color: Colors.red[600],
                                          size: 15,
                                        ),
                                        Container(
                                          // color: Colors.red,
                                          padding: EdgeInsets.only(left: 5),
                                          width: 200,
                                          child: Text(
                                              "hammadahamed786@gmail.com",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                    //----------------------------------------------------
                                  ],
                                ),
                              ),
                              //-------------------  PROFILE PICTURE  CIRCLE AVATAR  -----------------------------
                              Hero(
                                tag: "profilepic",
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.blueGrey[50],
                                    minRadius: 80,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.purple,
                                      size: 80,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
//-----------------------------------  3 ICONS editing row  ------------------------
                          Container(
                            width: MediaQuery.of(context).size.width - 20,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                //  -------------   pen  --------------
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: iconbg,
                                      borderRadius: BorderRadius.circular(30)),
                                  height: 50,
                                  width: iconsize,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: IconButton(
                                        splashColor: Colors.white,
                                        color: Colors.cyan[300],
                                        iconSize: 30,
                                        onPressed: () => Fluttertoast.showToast(
                                            msg: "Edit Profile"),
                                        icon: Icon(Icons.edit)),
                                  ),
                                ),
                                //  -------------  moon  -----------------
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: iconbg,
                                      borderRadius: BorderRadius.circular(30)),
                                  height: iconsize,
                                  width: iconsize,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.transparent,
                                    child: Column(
                                      children: <Widget>[
                                        IconButton(
                                          splashColor: Colors.white,
                                          color: Colors.yellow[600],
                                          iconSize: 30,
                                          onPressed: () =>
                                              Fluttertoast.showToast(
                                                  msg: "Dark mode"),
                                          icon: Icon(Ionicons.ios_moon),
                                        ),
                                        SizedBox(
                                          height: 0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //  ---------------  logOut  ------------------
                                // Container(
                                //   margin: EdgeInsets.symmetric(horizontal: 10),
                                //   decoration: BoxDecoration(
                                //       color: iconbg,
                                //       borderRadius: BorderRadius.circular(30)),
                                //   height: iconsize,
                                //   width: iconsize,
                                //   child: Material(
                                //     color: Colors.transparent,
                                //     child: IconButton(
                                //         splashColor: Colors.white,
                                //         color: Colors.red,
                                //         iconSize: 30,
                                //         onPressed: () => Fluttertoast.showToast(
                                //             msg: "Logging out"),
                                //         icon: Icon(Icons.power_settings_new)),
                                //   ),
                                // )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  //----------------------- (stack)  the BACK button  --------------------------------------------
                  Positioned(
                    top: 20,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30,
                      color: Colors.blueGrey,
                    ),
                  )
                  //----------------------------------------------------------------------------------------------
                ],
              ),
            ),

            //  ---------------------  SECOND HALF  ----------------------------------------------
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueGrey[800],
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "MY PRODUCTS",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  //  --------------------  products list  -----------------------------------------
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    height: secContaierSize,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: allStates.length,
                      itemBuilder: (context, i) => Column(
                        children: <Widget>[
                          ListTile(
                            onTap: () {
                              // Navigator.of(context).push(Bounce(alignment: Alignment.center,widget: CreateEditProduct(edit: true,)));
                              Fluttertoast.showToast(msg: "Edit Item");
                              return showDialog(
                                barrierDismissible: false,
                                context: context,
                                child: CreateEditProduct(
                                  edit: true,
                                ),
                              );
                            },
                            subtitle: Text(
                              "created : Feb 18",
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                            title: Text(
                              allStates[i],
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              child: Icon(Icons.image),
                            ),
                            trailing: IconButton(
                              onPressed: () =>
                                  Fluttertoast.showToast(msg: "Deleted"),
                              color: Colors.blueGrey,
                              icon: Icon(Icons.delete),
                            ),
                          ),
                          Divider(
                            indent: 60,
                            endIndent: 60,
                            color: Colors.blueGrey,
                          )
                        ],
                      ),
                    ),
                  ),

                  // --------  instruction  ---------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.touch_app,
                        color: Colors.blueGrey[200],
                      ),
                      Text(
                        "Tap on Item to edit",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
