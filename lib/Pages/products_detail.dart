import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProductsDetail extends StatelessWidget {
  final TextStyle titlestyle = TextStyle(
      color: Colors.blueGrey, fontSize: 15, fontWeight: FontWeight.w600);

  final TextStyle subtitlestyle = TextStyle(
      color: Colors.grey[600], fontSize: 14, fontWeight: FontWeight.w400);

  Widget divider() => Divider(
        color: Colors.grey,
        thickness: 1,
        endIndent: 100,
        indent: 100,
      );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                      child:
                          Image.asset("assets/cardimg.jpg", fit: BoxFit.cover),
                    ),
                  ),

                  //-------------------------------------
                  Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 300,
                    color: Colors.white,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                        //--------------------------------  NAME  ---------------------------------------------------
                        ListTile(
                          title: Text(
                            "NAME",
                            style: titlestyle,
                          ),
                          subtitle: Text(
                            "Strawberry",
                            style: subtitlestyle,
                          ),
                        ),
                        divider(),
                        //------------------------------------  DESCRIPTION  -----------------------------------------------
                        ListTile(
                          isThreeLine: true,
                          title: Text(
                            "DESCRIPTION",
                            style: titlestyle,
                          ),
                          subtitle: Text(
                            "Everything that the seller decribes about the product goes here. Help our farmer with agro cart",
                            style: subtitlestyle,
                          ),
                        ),
                        divider(),
                        //----------------------------------------- PRICE  ------------------------------------------
                        ListTile(
                          trailing: Text(
                            "₹  ",
                            style: TextStyle(color: Colors.green, fontSize: 35),
                          ),
                          title: Text(
                            "PRICE",
                            style: titlestyle,
                          ),
                          subtitle: Text(
                            "₹ 1299",
                            style: subtitlestyle,
                          ),
                        ),
                        divider(),
                        //---------------------------------- QUANTITY AVAILABLE-----------------------------
                        ListTile(
                          trailing: IconButton(
                              icon: Icon(
                                MaterialCommunityIcons.weight_kilogram,
                                color: Colors.red,
                                size: 33,
                              ),
                              onPressed: null),
                          title: Text(
                            "QUATITY",
                            style: titlestyle,
                          ),
                          subtitle: Text(
                            "12 Kg",
                            style: subtitlestyle,
                          ),
                        ),
                        divider(),
                        //------------------  QUALITY  ------------------------------
                        ListTile(
                          trailing: IconButton(
                              icon: Icon(
                                MaterialIcons.star,
                                color: Colors.yellow[800],
                                size: 36,
                              ),
                              onPressed: null),
                          title: Text(
                            "QUALITY",
                            style: titlestyle,
                          ),
                          subtitle: Text("★★★★★",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        divider(),
                        //----------------------------  SELLER NAME  ------------------------------------
                        ListTile(
                          trailing: IconButton(
                              icon: Icon(
                                MaterialIcons.person,
                                color: Colors.purple,
                                size: 34,
                              ),
                              onPressed: null),
                          title: Text(
                            "SELLER NAME",
                            style: titlestyle,
                          ),
                          subtitle: Text(
                            "hammad ahamed",
                            style: subtitlestyle,
                          ),
                        ),
                        divider(),
                        //---------------------------  PHONE NUMBER ----------------------------------
                        ListTile(
                          trailing: IconButton(
                              icon: Icon(
                                MaterialIcons.call,
                                color: Colors.cyan,
                                size: 30,
                              ),
                              onPressed: null),
                          title: Text(
                            "MOBILE",
                            style: titlestyle,
                          ),
                          subtitle: Text(
                            "(+91) 9080537172",
                            style: subtitlestyle,
                          ),
                        ),
                        divider(),
                        //-----------------------  LOCATION  ------------------------------------
                        ListTile(
                          trailing: IconButton(
                              icon: Icon(Icons.location_on,
                              size: 35,
                                  color: Colors.lightBlue),
                              onPressed: null),
                          title: Text(
                            "LOCATION",
                            style: titlestyle,
                          ),
                          subtitle: Text(
                            "Salem, TamiNadu",
                            style: subtitlestyle,
                          ),
                        ),
                        divider(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

////////////////////////////////////////
