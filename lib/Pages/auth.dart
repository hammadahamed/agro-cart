import 'package:agro_cart/Custom_routes.dart/decent.dart';
import 'package:agro_cart/Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Authpg extends StatefulWidget {
  final bool signup;
  bool visible = true;
  bool visible2 = true;
  Authpg({this.signup = false});
  @override
  AuthpgState createState() => AuthpgState();
}

class AuthpgState extends State<Authpg> {
  String name;
  String email;
  String pass;
  String confpass;
  int phonenum;
  final _formKey = GlobalKey<FormState>();

  Widget buildFlareHi() {
    return Container(
      height: 100,
      width: 300,
      child: FlareActor(
        "assets/hitext.flr",
        fit: BoxFit.contain,
        alignment: Alignment.centerLeft,
        animation: 'hi',
      ),
    );
  }

  Widget buildName() {
    return TextFormField(
      // key: _formKey,
      // autovalidate: true,
      // validator: (val) => (val.isEmpty) ? 'username *' : null,
      validator: (value) {
        if (value.isEmpty) {
          return 'username*';
        }
        return null;
      },
      onSaved: (value) => name = value,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          labelText: "Username",
          // fillColor: Colors.white30,
          border: OutlineInputBorder(),
          helperText: "Fullname",
          filled: true,
          icon: Icon(
            Icons.person,
            color: Theme.of(context).primaryColor,
          )),
    );
  }

  Widget buildEmail() {
    return widget.signup
        ? TextFormField(
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value.isEmpty) {
                return 'Email ID*';
              }
              return null;
            },
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
                labelText: "Email id",
                // fillColor: Colors.black,
                border: OutlineInputBorder(),
                filled: true,
                icon: Icon(
                  Icons.mail,
                  color: Theme.of(context).primaryColor,
                )),
          )
        : SizedBox(
            height: 0,
          );
  }

  Widget buildPhoneNum() {
    return widget.signup
        ? TextFormField(
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return 'Phone number*';
              }
              return null;
            },
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
                labelText: "Phone Number",
                // fillColor: Colors.white,
                border: OutlineInputBorder(),
                filled: true,
                // helperText: "password must be the same",
                helperMaxLines: 2,
                hintText: "+(country code)-Num",
                icon: Icon(
                  Icons.lock,
                  color: Theme.of(context).primaryColor,
                )),
          )
        : SizedBox(
            height: 0,
          );
  }

  Widget buildPassword() {
    return TextFormField(
      obscureText: widget.visible,
      validator: (value) {
        if (value.isEmpty) {
          return 'password must provided*';
        }
        return null;
      },
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          labelText: "Password",
          // fillColor: Colors.white12,
          border: OutlineInputBorder(),
          filled: true,
          suffixIcon: IconButton(
              color: widget.visible
                  ? Theme.of(context).primaryColor
                  : Colors.white,
              icon: widget.visible
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off),
              onPressed: () {
                setState(() => widget.visible = !widget.visible);
              }),
          helperText: "atleast 8 characters* ( alphanumeric )",
          helperMaxLines: 2,
          hintText: "enter password",
          icon: Icon(
            Icons.lock,
            color: Theme.of(context).primaryColor,
          )),
    );
  }

  Widget buildConfirmPass() {
    return widget.signup
        ? TextFormField(
            obscureText: widget.visible2,
            validator: (value) {
              if (value.isEmpty) {
                return 'passwords must match*';
              }
              return null;
            },
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
                labelText: "Confirm Password",
                // fillColor: Colors.white,
                border: OutlineInputBorder(),
                filled: true,
                suffixIcon: IconButton(
                    color: widget.visible2
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                    icon: widget.visible2
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() => widget.visible2 = !widget.visible2);
                    }),
                helperText: "password must be the same",
                helperMaxLines: 2,
                hintText: "confirm password",
                icon: Icon(
                  Icons.lock,
                  color: Theme.of(context).primaryColor,
                )),
          )
        : SizedBox(
            height: 0,
          );
  }

  Widget myFAB() {
    return FloatingActionButton(
        splashColor: Colors.purple[900],
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF2b2a2b),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Fluttertoast.showToast(
                msg: widget.signup ? "Registering..." : "Siging in...",
                gravity: ToastGravity.CENTER);
            Navigator.push(
                context, Decent(widget: HomePg(), alignment: Alignment.center));
          } else {
            Fluttertoast.showToast(msg: "enter valid credentials");
          }
        },
        child: Text(widget.signup ? "next" : 'GO'));
    //
  }

  Widget form() {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            buildName(),
            SizedBox(
              height: 20.0,
            ),
            buildEmail(),
            SizedBox(
              height: widget.signup ? 30.0 : 0,
            ),
            buildPhoneNum(),
            SizedBox(
              height: widget.signup ? 30.0 : 0,
            ),
            buildPassword(),
            SizedBox(
              height: 20.0,
            ),
            buildConfirmPass(),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 150,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.arrow_forward_ios),
                  myFAB(),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  buildFlareHi(),
                  SizedBox(
                    height: 35.0,
                  ),
                  form(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//---------------------------------------------------------------------------------------------------
