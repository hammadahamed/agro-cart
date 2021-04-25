import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:agro_cart/Pages/create_edit_dialog.dart';
import 'package:agro_cart/Pages/products_card.dart';
import 'package:agro_cart/Pages/profile.dart';

import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class HomePg extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePgState();
}

class HomePgState extends State<HomePg> with SingleTickerProviderStateMixin {
//------------------------------------------------------  VARIABLES  ------------------------------------------------------------------//

  List<String> dummy = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20"
  ];

  List<String> allStates = [
    "Andaman and Nicobar Islands",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam	Dispur",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand	Ranchi",
    "Karnataka",
    "Kerala",
    "Lakshadweep",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Puducherry",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal"
  ];

  var allStatesss;

  List<String> carouselList = <String>[
    "https://cdn.mos.cms.futurecdn.net/4czy53an9L6fjMZjfX2pfV-650-80.jpg.webp",
    "https://store-images.s-microsoft.com/image/apps.58021.69011092827716296.e9190db7-6f4c-478c-8555-3edad4336a39.de8bb314-af23-4670-9343-fa78251591c8?mode=scale&q=90&h=1080&w=1920",
    "https://www.bosshunting.com.au/wp-content/uploads/2020/03/acr-1-1027x560.jpg",
    "https://img.cinemablend.com/filter:scale/quill/6/d/4/3/c/f/6d43cf2f88bf7c1dac71958808089a20f46ddd98.jpg?mw=600",
    "https://cdn.vox-cdn.com/thumbor/5-8Mt5HzNasqYIaYpA5PJYatvsc=/0x0:1020x638/920x613/filters:focal(429x238:591x400):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/55576065/assassins_creed_3.0.jpg",
  ];

  String appbarimg =
      "https://www.keengamer.com/wp-content/uploads/2020/04/Assassin%E2%80%99s-Creed-Symphony1.jpg";

  int carouselindex = 0;
  int categoryAvatarIndex = 2;

  FocusNode _searchFocus = FocusNode();

  Color purple = Colors.purple;
  Color deeppurple = Colors.purple[800];
  Color customBlack = Color(0xFF121212);

  bool searching = false;

  ScrollController bodySrollController;
  ScrollController tabScrollController;

  TabController tabController;

  int currentTabIndex;

  GlobalKey<ScaffoldState> drawerkey = GlobalKey();

  //  ------   NODE VARIABLES   -------
  static String host = "192.168.43.138";
  static String port = "3000";
  String url = "http://$host:$port/flutterlist";

  var stateList;

//  ASYNC function to fetch data
  Future nodelist() async {
    var list;
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // list = json.decode(response.body);
      // decoding again ., becuase it still returns a string
      // list = json.decode(list) as List;
      list = jsonDecode(response.body) as List;
      print(list);
      return list;
    } else {
      print("---------------- error -------------- \n ${response.body}");
    }
  }

// --------------- the below function is useful as NOTES  ---------------

  // bodyScrollListerner() {
  //   if (bodySrollController.offset >=
  //       bodySrollController.position.maxScrollExtent &&
  //       !bodySrollController.position.outOfRange) {
  //     Fluttertoast.showToast(msg: "bottom");
  //   }
  //   if (bodySrollController.offset <= bodySrollController.position.minScrollExtent &&
  //       !bodySrollController.position.outOfRange) {
  //     Fluttertoast.showToast(msg: "top");
  //   }
  // }

  //  -----------------  this is created to retrieve the index of the current tab   --------------

  tabListener() {
    setState(() {
      currentTabIndex = tabController.index;
      categoryAvatarIndex = currentTabIndex + 1;
    });
  }

//   -----------------   this is created to scroll the carousel up as the PRODUCTS PAGE IS SCROLLED   -----------------------

  tabScrollListener() {
    if (tabScrollController.offset > 10 && tabScrollController.offset < 50) {
      bodySrollController.animateTo(300,
          duration: Duration(milliseconds: 200), curve: Curves.linear);
    }
    if (tabScrollController.offset >= 0 && tabScrollController.offset < 10) {
      bodySrollController.animateTo(-300,
          duration: Duration(milliseconds: 800), curve: Curves.linear);
    }
  }

  @override
  void initState() {
    // initializing body controller
    bodySrollController = ScrollController();
    tabScrollController = ScrollController();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(tabListener);
    tabController.index = 1;
    tabScrollController.addListener(tabScrollListener);

    // intializing the list of states
    nodelist().then((value) => stateList = value);

    super.initState();
  }

//------------------------------------------------------  VARIABLES  ------------------------------------------------------------------//

//-------APP BAR DEFENITION  ------------------
  Widget customAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
          splashColor: Colors.red,
          icon: Icon(Icons.favorite, color: Colors.red),
          onPressed: () {}),
      //----------------  SWAP TITLE AND TEXTFIELD PART  -----------------------
      title: searching
          ? Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: searchField(),
            )
          : RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Agro",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500)),
                TextSpan(
                    text: "Cart",
                    style: TextStyle(
                        color: purple,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700))
              ]),
            ),
      //---------------------  ICONS FOLLOWING THE TITLE  ---------------------
      actions: <Widget>[
        IconButton(
            splashColor: Colors.purple[300],
            icon: searchIcon(),
            onPressed: () {
              setState(() => searching = !searching);
            }),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
              searching = false;
            },
            child: Hero(
              tag: "profilepic",
              child: CircleAvatar(
                  child: Icon(Icons.person, color: purple),
                  backgroundColor: Colors.white),
            ),
          ),
        ),
      ],
      backgroundColor: Colors.white,
    );
  }

//--------- TEXT FIELD STYLING ----------------
  Widget searchField() {
    return TextField(
      style: TextStyle(color: Colors.black),
      focusNode: _searchFocus,
      autofocus: true,
      enabled: true,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: purple, width: 1),
        ),
        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        hintText: "search for items",
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.blueGrey,
        ),
      ),
    );
  }

//----------  SEARCH ICON AND CANCEL ICON SWAP  -------------
  Widget searchIcon() {
    if (searching) {
      _searchFocus.requestFocus();

      return Icon(Icons.clear, color: Colors.blueGrey);
    } else {
      // FocusScope.of(context).requestFocus(FocusNode());
      // _searchFocus.unfocus();
      return Icon(Icons.search, color: Colors.blueGrey);
    }
  }

//---------  FLOATING ACTION BUTTON  ---------------

  Widget sellFAB() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: FloatingActionButton.extended(
        splashColor: Colors.white,
        foregroundColor: Colors.white,
        onPressed: () {
          Fluttertoast.showToast(msg: "Create the product");
          setState(() {
            searching = false;
          });
          return showDialog(
            barrierDismissible: false,
            context: context,
            child: CreateEditProduct(),
          );
          // Navigator.of(context).push(
          //     Decent(widget: CreateProductPage(), alignment: Alignment.center));
        },
        backgroundColor: purple,
        icon: Icon(Icons.add),
        label: Text("SELL"),
      ),
    );
  }

//--------  CAROUSEL SETU WITH INDICATOR ----------------
  Widget carouselSetUp() {
    return ListView(
      physics: PageScrollPhysics(),
      children: <Widget>[
        //-----------------  CAROUSEL SCROLLING IMAGES  ---------------------
        CarouselSlider(
          items: carouselList.map((e) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                e,
                // filterQuality: FilterQuality.none,
                // errorBuilder: (BuildContext context, Object exception,
                //     StackTrace stackTrace) {
                //   return Center(
                //       child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: <Widget>[
                //       Text(
                //         '😢',
                //         style: TextStyle(fontSize: 20),
                //       ),
                //       SizedBox(
                //         height: 20,
                //       ),
                //       Text(
                //         "No network. Try restarting the app",
                //         style: TextStyle(color: Colors.purple, fontSize: 10),
                //       )
                //     ],
                //   ));
                // },
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
                fit: BoxFit.cover,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            autoPlayInterval: Duration(milliseconds: 2300),
            onPageChanged: (index, reason) {
              setState(() => carouselindex = index);
            },
          ),
        ),
        //-----------------  CAROUSEL SCROLLING IMAGES  ---------------------

        // ----------------   CAROUSEL  INDICATOR  SETUP  ---------------
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: carouselList.map((url) {
            int index = carouselList.indexOf(url);
            return Container(
              width: carouselindex == index ? 10.0 : 8.0,
              height: carouselindex == index ? 10.0 : 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: carouselindex == index ? purple : customBlack),
            );
          }).toList(),
        )
        // ----------------   CAROUSEL  INDICATOR  SETUP  ---------------
      ],
    );
  }

// ----------  CATEGORY ROW FOR STICKY HEADER  ---------------
  Widget categoryAvatar(int index, String title, String imageLocation) {
    return GestureDetector(
      onTap: () {
        setState(() {
          categoryAvatarIndex = index;
          tabController.animateTo(index - 1,
              duration: Duration(milliseconds: 800), curve: Curves.bounceIn);
        });
        bodySrollController.animateTo(300,
            duration: Duration(milliseconds: 500), curve: Curves.linear);
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5.0, top: 5),
          child: Column(
            children: <Widget>[
              //-----------  AVATAR  -------------
              AnimatedContainer(
                margin: EdgeInsets.symmetric(
                    horizontal: categoryAvatarIndex == index ? 14 : 7),
                height: categoryAvatarIndex == index ? 68 : 50,
                width: categoryAvatarIndex == index ? 68 : 50,
                duration: Duration(milliseconds: 500),
                curve: Curves.linear,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        categoryAvatarIndex == index ? 34 : 25),
                    color: categoryAvatarIndex == index
                        ? Colors.purple[50]
                        : Colors.grey[200]),
                child: Image.asset(imageLocation),
              ),

              //-----------  AVATAR  DESCRIPTION  -------------

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  title,
                  style: TextStyle(
                      color: purple,
                      fontWeight: categoryAvatarIndex == index
                          ? FontWeight.w900
                          : FontWeight.w800,
                      fontSize: categoryAvatarIndex == index ? 14 : 10),
                ),
              ),
              //----------------  BASE-LINE --------------------

              categoryAvatarIndex != index
                  ? AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                      height: 2,
                      width: 60,
                      color: purple,
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget categoriesHeader() {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        color: Colors.white,
      ),
      child: Stack(children: [
        //  ------------  sort icon  ------------------------------
        Positioned(
          top: 10,
          left: 15,
          child: Material(
            color: Colors.transparent,
            child: IconButton(
                splashColor: Colors.white,
                tooltip: "Category",
                iconSize: 30,
                icon: Icon(
                  Icons.sort,
                  color: Colors.blueGrey,
                ),
                onPressed: () => drawerkey.currentState.openDrawer()),
          ),
        ),
        //  ------------  ( see all ) ICON  ------------------------
        Positioned(
            top: 25,
            right: 15,
            child: Tooltip(
              message: "All Items",
              child: GestureDetector(
                onTap: () => Fluttertoast.showToast(msg: "all Items"),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "See all",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.blueGrey,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //-------------------  AVATAR 1
            categoryAvatar(1, "VEGGIE", "assets/carrot.png"),
            //------------------  AVATAR 2
            categoryAvatar(2, "FRUITS", "assets/apple.png"),

            //-------------------  AVATAR 3
            categoryAvatar(3, "CROPS", "assets/paddy.png"),
          ],
        ),
      ]),
    );
  }

//-----------  # MAIN_BODY WITH CAROUSEL BANNER & STICKY BODY DECLARATION  ------------
  Widget customScaffoldBody() {
    return ListView(
      // physics: BouncingScrollPhysics(),
      controller: bodySrollController,
      children: <Widget>[
        //-------------  BANNER PART  -------------------
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            height: 270,
            child: carouselSetUp(),
          ),
        ),

        //------------- STICKY BODY PART  -------------------
        StickyHeader(
          overlapHeaders: true,
          header: categoriesHeader(),
          // ************* this is mandatory - to maintain the sticky head, it should have a dummy body of HEIGHT-100  ************************//
          content: Container(
            height: 114,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
          ),
        ),
        // SizedBox(height: 2,),

        // **************************  THIS CONTAINER SHOULD PROBABLY ACT AS THE WORKABLE* BODY  ***************************************
        productsBody(),
        // **************************  THIS IS CONTAINER SHOULD PROBABLY ACT AS THE WORKABLE* BODY  ***************************************
      ],
    );
  }

//  ---------------  sub BODY of custom-SCAFFOLD-BODY  (or)   PRODUCTS BODY ***   --------------------------------

  Widget productsBody() {
    return Container(
      height: MediaQuery.of(context).size.height - 190,
      color: Colors.white,
      child: TabBarView(
        controller: tabController,
        children: [
          tabOne(),
          tabOne(),
          tabOne(),
        ],
      ),
    );
  }

// ==============================      TAB-ONE       =====================================

  Widget tabOne() {
    Orientation orientation = MediaQuery.of(context).orientation;

    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, bottom: 20),
      color: Colors.white,
      child: GridView.builder(
        physics: ClampingScrollPhysics(),
        controller: tabScrollController,
        itemCount: dummy.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          return ProductsCard();
        },
      ),
    );
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//--------------------------    CUSTOM DRAWER   ----------------------------------------

  Widget customDrawer() {
    return Drawer(
      child: Container(
        color: Colors.grey[100],
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 0, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.sort_by_alpha,
                    color: Colors.purple[900],
                    size: 35,
                  ),
                  Text(
                    "   |   SEARCH BY CATEGORY   |   ",
                    style: TextStyle(
                        color: Colors.purple[700],
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            Divider(
              height: 2,
              color: purple,
              indent: 20,
              endIndent: 20,
            ),

            //------- states  ----------
            ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                "States",
                style: TextStyle(color: Colors.blueGrey, fontSize: 18),
              ),
              trailing: Icon(Icons.keyboard_arrow_down, color: Colors.blueGrey),
              //   -------------   RENDERING THE STATE LIST AS WIDGET <TILES>   ----------------
              children: stateList == null
                  ? [
                      SizedBox(
                        height: 20,
                      ),
                      CircularProgressIndicator(
                        backgroundColor: Colors.purple,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "wait baby",
                        style: TextStyle(color: Colors.purple),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ]
                  //   HERE , IT IS MORE IMPORTANT TO MENTION THE GENERIC TYPE OF map as <Widget>
                  : stateList
                      .map<Widget>((e) => Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: ListTile(
                              onTap: () =>
                                  Fluttertoast.showToast(msg: "selected " + e),
                              title: Text(
                                e,
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                          ))
                      .toList(),
            ),
            //----------  item type  -------------------------
            ExpansionTile(
              initiallyExpanded: false,
              title: Text(
                "Item Type",
                style: TextStyle(color: Colors.blueGrey, fontSize: 18),
              ),
              trailing: Icon(Icons.keyboard_arrow_down, color: Colors.blueGrey),
              children: allStates
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: ListTile(
                          onTap: () =>
                              Fluttertoast.showToast(msg: "selected " + e),
                          title: Text(
                            e,
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            //----------------------  Goto wishlist  ----------------------
            Divider(
              height: 2,
              color: purple,
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.blueGrey,
              ),
              title: Text(
                "Wishlist",
                style: TextStyle(color: Colors.blueGrey, fontSize: 18),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.power_settings_new,
                color: Colors.blueGrey,
              ),
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.blueGrey, fontSize: 18),
              ),
            ),
            ListTile(
              onTap: () => showAboutDialog(
                applicationVersion: "v1.0.0",
                context: context,
                applicationIcon: Icon(Icons.shop),
                applicationName: "AgroCart",
              ),
              trailing: Icon(
                Icons.info,
                color: Colors.blueGrey,
              ),
              title: Text(
                "About",
                style: TextStyle(color: Colors.blueGrey, fontSize: 18),
              ),
            ),

            //--------------------------  copyright  -----------------
            Container(
              // color: Colors.red,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "FROM",
                    style: TextStyle(
                        color: purple,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("© hmd cyberspace", style: TextStyle(color: customBlack))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(" test list: $stateList - type: ${stateList.runtimeType}");

    return SafeArea(
        child: Scaffold(
      key: drawerkey,
      drawer: Drawer(
        child: customDrawer(),
      ),
      floatingActionButton: sellFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.white,
      appBar: customAppBar(),
      body: GestureDetector(
          onTap: () {
            setState(() {
              searching = false;
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            });
          },
          child: customScaffoldBody()),
    ));
  }
}
