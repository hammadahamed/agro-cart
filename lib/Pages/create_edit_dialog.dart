import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateEditProduct extends StatefulWidget {
  final bool edit;
  CreateEditProduct({this.edit = false});
  @override
  State<StatefulWidget> createState() => CreateEditProductState();
}

class CreateEditProductState extends State<CreateEditProduct> {
  //-------------------   text input decoration VARIABLE  --------------

  UnderlineInputBorder focusedborder = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.cyan[700], width: 3),
  );

  UnderlineInputBorder enabledborder = UnderlineInputBorder(
    borderSide:
        BorderSide(color: Colors.cyan, style: BorderStyle.solid, width: 2),
  );
  Color fillcolor = Colors.grey[50];

  TextStyle hintstyle = TextStyle(
    color: Colors.cyan[400],
    fontSize: 13,
  );
  TextStyle labelstyle = TextStyle(
    color: Colors.blueGrey,
    fontWeight: FontWeight.w600,
    fontSize: 17,
  );

  TextStyle helperstyle = TextStyle(
    color: Colors.grey[600],
  );
  String dropdownval = "kg";
  //--------------------  text input decoration VARIABLE  -------------------

  Widget title() {
    return TextFormField(
        cursorColor: Colors.blueGrey,
        cursorWidth: 2,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: "Name",
          labelStyle: labelstyle,
          filled: true,
          hintText: "common name",
          hintStyle: hintstyle,
          helperText: "recommended to avoid local names",
          helperStyle: helperstyle,
          focusedBorder: focusedborder,
          enabledBorder: enabledborder,
          fillColor: fillcolor,
        ));
  }

  Widget description() {
    return TextFormField(
        cursorColor: Colors.blueGrey,
        cursorWidth: 2,
        maxLines: 3,
        maxLength: 50,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan, width: 0.8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan[700], width: 2)),
          labelText: "Description",
          labelStyle: labelstyle,
          hintText: "describe the product",
          hintStyle: hintstyle,
          helperText: "less than 50 characters",
          helperStyle: helperstyle,
          suffixIcon: Icon(
            Icons.edit,
            color: Colors.teal[400],
            size: 17,
          ),
          filled: true,
          // focusedBorder: focusedborder,
          // enabledBorder: enabledborder,
          fillColor: fillcolor,
        ));
  }

  Widget price() {
    return TextFormField(
        keyboardType: TextInputType.number,
        cursorColor: Colors.blueGrey,
        cursorWidth: 2,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: "Price",
          labelStyle: labelstyle,
          prefix: Text("₹  "),
          prefixStyle: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontSize: 20),
          suffix: Text("/"),
          hintText: "Quote a price",
          hintStyle: hintstyle,
          filled: true,
          focusedBorder: focusedborder,
          enabledBorder: enabledborder,
          fillColor: fillcolor,
        ));
  }

  Widget quantity() {
    return TextFormField(
        cursorColor: Colors.blueGrey,
        cursorWidth: 2,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: "Quantity",
          labelStyle: labelstyle,
          hintText: "quantity available",
          hintStyle: hintstyle,
          helperText: "Scale in Kg/g will be inferred from the above dropdown",
          helperMaxLines: 2,
          helperStyle: helperstyle,
          suffixIcon: Icon(
            MaterialCommunityIcons.weight_kilogram,
            color: Colors.lime[700],
            size: 20,
          ),
          filled: true,
          focusedBorder: focusedborder,
          enabledBorder: enabledborder,
          fillColor: fillcolor,
        ));
  }

  Widget quality() {
    return TextFormField(
        keyboardType: TextInputType.number,
        cursorColor: Colors.blueGrey,
        cursorWidth: 2,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: "Quality",
          labelStyle: labelstyle,
          suffixIcon: Icon(
            FontAwesome.star,
            size: 17,
            color: Colors.yellow[700],
          ),
          hintText: "rate for 5",
          hintStyle: hintstyle,
          helperText: "This will appear as Star in the post",
          helperStyle: helperstyle,
          filled: true,
          focusedBorder: focusedborder,
          enabledBorder: enabledborder,
          fillColor: fillcolor,
        ));
  }

  Widget location() {
    return TextFormField(
        cursorColor: Colors.blueGrey,
        cursorWidth: 2,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: "location",
          labelStyle: labelstyle,
          hintText: "enter location of stock",
          hintStyle: hintstyle,
          filled: true,
          helperText: "Format : <district>,<State>",
          helperStyle: helperstyle,
          suffixIcon: Icon(
            FontAwesome.location_arrow,
            color: Colors.lightBlue,
            size: 20,
          ),
          focusedBorder: focusedborder,
          enabledBorder: enabledborder,
          fillColor: fillcolor,
        ));
  }

  Widget dropDownSetup() {
    return DropdownButton(
      style: hintstyle,
      value: dropdownval,
      iconEnabledColor: Colors.blueGrey,
      dropdownColor: Colors.grey[50],
      items: [
        DropdownMenuItem(
          value: "kg",
          child: Text(
            "Kg",
          ),
        ),
        DropdownMenuItem(
          value: "g",
          child: Text(
            "g",
          ),
        ),
      ],
      onChanged: (value) {
        setState(() {
          dropdownval = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: MediaQuery.of(context).size.height - 250,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Container(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[200],
                        child: IconButton(
                          icon: Icon(Icons.add_a_photo),
                          iconSize: 30,
                          onPressed: () => Fluttertoast.showToast(
                              msg: "upload photo of the product"),
                        ),
                      ),
                    ],
                  ),
                ),
                //---------------------------  FORM  STARTS----------------------------------------

                Form(
                  child: Column(
                    children: <Widget>[
                      title(),
                      SizedBox(
                        height: 20,
                      ),
                      description(),
                      SizedBox(
                        height: 20,
                      ),
                      //
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 50),
                        title: price(),
                        trailing: dropDownSetup(),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      quantity(),
                      SizedBox(
                        height: 20,
                      ),
                      quality(),
                      SizedBox(
                        height: 20,
                      ),
                      location(),
                      // --------------------------------  BUTTON BAR  -------------------------------------
                      ButtonBar(
                          buttonPadding: EdgeInsets.symmetric(horizontal: 25),
                          alignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                              color: Colors.cyan,
                              child: Text("CANCEL",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            RaisedButton(
                              color: Colors.cyan,
                              child: Text(!widget.edit ?"  POST  " : "  SAVE  " ,
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () => !widget.edit?
                                  Fluttertoast.showToast(msg: "posting ..."):Fluttertoast.showToast(msg: "saved"),
                            ),
                          ])
                    ],
                  ),
                ),

                //------------------------------------------------------------------
                // Container(height: 1500, color: purple)
              ],
            ),
          )),
    );
  }
}
