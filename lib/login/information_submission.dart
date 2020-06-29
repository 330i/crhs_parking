import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoSubmit extends StatefulWidget {
  @override
  _InfoSubmitState createState() => _InfoSubmitState();
}

class _InfoSubmitState extends State<InfoSubmit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          "Profile",
          style: (TextStyle(fontSize: 22)),
        ),
        backgroundColor: Color.fromRGBO(128, 0, 0, .7),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 10,),
                Icon(Icons.directions_car,
                size: 100),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FieldGen("First Name", TextInputType.text),
                    FieldGen("Last Name", TextInputType.text)
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FieldGen("Grade Level", TextInputType.number),
                    FieldGen("Student Id", TextInputType.text)
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FieldGen("Street Address", TextInputType.text),
                    FieldGen("Zip Code", TextInputType.number)
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FieldGen("Make/Model", TextInputType.text),
                    FieldGen("Color", TextInputType.text)
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FieldGen("Phone Number", TextInputType.number),
                    FieldGen("Date of Birth", TextInputType.datetime)
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FieldGen("License Number", TextInputType.number),
                    FieldGen("Experation Date", TextInputType.number)
                  ],
                ),
                SizedBox(height: 20)
              ],
            ),
          ],
        ),
      ),
    );
  }
}


Widget FieldGen (String hint, TextInputType type) {
  return Container(
    decoration: BoxDecoration(
      color: Color.fromRGBO(128, 0, 0, .6),
      borderRadius: BorderRadius.all(Radius.circular(16))

    ),
    width: 170,
    child: TextFormField(
      keyboardType: type,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
              top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
        hintText: " " + hint,
        hintStyle: TextStyle(
          fontSize: 18,
          color: Colors.black
        ),
        border: InputBorder.none,

      ),
  ));
}
