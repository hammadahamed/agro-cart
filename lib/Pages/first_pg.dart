import 'package:agro_cart/Custom_routes.dart/decent.dart';
import 'package:agro_cart/Pages/home_page.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agro_cart/Pages/auth.dart';
import 'package:agro_cart/Custom_routes.dart/bounce.dart';

class FirstPg extends StatefulWidget {
  @override
  _FirstPgState createState() => _FirstPgState();
}

class _FirstPgState extends State<FirstPg> {
  Color padcolor = Colors.black;

  var hasInternet;

  void internetChecker() {
    DataConnectionChecker()
        .hasConnection
        .then((result) => result ? hasInternet = true : hasInternet = false);
  }

  List<Widget> pgContent() {
    return <Widget>[
      Expanded(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Material(
            color: padcolor,
            child: InkWell(
              splashColor: Theme.of(context).primaryColor,
              onTap: () {
                // Fluttertoast.showToast(msg: "Welcome");
                Navigator.push(context,
                    Bounce(widget: Authpg(), alignment: Alignment.topCenter));
              },
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'already a member !',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'SIGN IN',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
      SizedBox(height: 1.0),
      Expanded(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Material(
            color: padcolor,
            child: InkWell(
              splashColor: Theme.of(context).primaryColor,
              onTap: () {
                // Fluttertoast.showToast(msg: "Welcome");
                Navigator.push(
                    context,
                    Bounce(
                        widget: Authpg(signup: true),
                        alignment: Alignment.bottomCenter));
              },
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'new user ?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'SIGN UP',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              )),
            ),
          ),
        ),
      )
    ];
  }

  Widget onInternetError() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "No Internet Access !",
            style: GoogleFonts.muli(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Connect to internet and click retry.",
            style: GoogleFonts.muli(
                color: Colors.blueGrey,
                decoration: TextDecoration.none,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 15,
          ),
          RaisedButton(
            color: Colors.purple[700],
            onPressed: () {
              // if (!mounted) return;
              setState(internetChecker);
            },
            child: Text("RETRY"),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    internetChecker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Orientation orien = MediaQuery.of(context).orientation;
    Widget authpads = orien == Orientation.portrait
        ? Column(
            children: pgContent(),
          )
        : Row(
            children: pgContent(),
          );
    return (hasInternet == true && hasInternet != null)
        ? SafeArea(
            child: Scaffold(
              body: Material(
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
                    authpads,
                    Container(
                      alignment: Alignment.center,
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 130,
                          height: 50,
                          child: FloatingActionButton.extended(
                            label: Text("GUEST"),
                            onPressed: () => Navigator.of(context).push(Decent(
                                widget: HomePg(), alignment: Alignment.center)),
                            backgroundColor: Color(0xFF2b2a2b),
                            splashColor: Colors.purple,
                            foregroundColor: Colors.white,
                            icon: Row(
                              children: <Widget>[Icon(Icons.arrow_forward_ios)],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : onInternetError();
  }
}
