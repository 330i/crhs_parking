import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:url_launcher/url_launcher.dart';

bool _isAgreed = false;
bool _isRead = false;
DateTime _birth;
DateTime _licenseExpiration;
DateTime _insuranceExpiration;
bool _payCash = true;

class InfoSubmit extends StatefulWidget {
  int spot;
  InfoSubmit(this.spot);
  @override
  _InfoSubmitState createState() => _InfoSubmitState();
}

class _InfoSubmitState extends State<InfoSubmit> {
  @override
  Widget build(BuildContext context) {

    TextEditingController first = new TextEditingController();
    TextEditingController last = new TextEditingController();
    TextEditingController grade = new TextEditingController();
    TextEditingController id = new TextEditingController();
    TextEditingController address = new TextEditingController();
    TextEditingController zip = new TextEditingController();
    TextEditingController phone = new TextEditingController();
    TextEditingController model = new TextEditingController();
    TextEditingController color = new TextEditingController();
    TextEditingController year = new TextEditingController();
    TextEditingController plate = new TextEditingController();
    TextEditingController driver = new TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          "Parking Information/Agreement",
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
                Row(
                  children: [
                    Container(
                      width: 10,
                    ),
                    Icon(
                      Icons.person,
                      size: 50,
                    ),
                    Container(
                      width: 5,
                    ),
                    Text(
                      'Personal Info',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FieldGen("First Name", TextInputType.text, first),
                    FieldGen("Last Name", TextInputType.text, last)
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FieldGenMax("Grade Level", TextInputType.number, grade, 2),
                    FieldGen("Student Id", TextInputType.text, id)
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FieldGen('Street Address', TextInputType.streetAddress, address),
                    FieldGenMax("Zip Code", TextInputType.number, zip, 5),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FieldGenMax("Phone Number", TextInputType.number, phone, 10),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      width: 170,
                      child: FlatButton(
                        child: Row(
                          children: [
                            Text(
                              _birth == null ? 'Date of Birth' : '${_birth.month}/${_birth.day}/${_birth.year}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: _birth != null ? _birth : DateTime(DateTime.now().year),
                            firstDate: DateTime(1970),
                            lastDate: DateTime(DateTime.now().year),
                          ).then((date) {
                            setState(() {
                              _birth = date;
                            });
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: 10,
                    ),
                    Icon(
                      Icons.directions_car,
                      size: 50,
                    ),
                    Container(
                      width: 5,
                    ),
                    Text(
                      'Car Info',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FieldGen("Make/Model", TextInputType.text, model),
                    FieldGen("Color", TextInputType.text, color),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FieldGenMax("Year", TextInputType.number, year, 4),
                    FieldGenSmall("License Plate Number", TextInputType.text, plate)
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FieldGenSmall("Driver's License Number", TextInputType.text, driver),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      width: 170,
                      child: FlatButton(
                        child: Row(
                          children: [
                            Text(
                              _licenseExpiration == null ? 'License Exp.' : '${_licenseExpiration.month}/${_licenseExpiration.day}/${_licenseExpiration.year}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: _licenseExpiration != null ? _licenseExpiration : DateTime(DateTime.now().year),
                            firstDate: DateTime(DateTime.now().year),
                            lastDate: DateTime(2070),
                          ).then((licensedate) {
                            setState(() {
                              _licenseExpiration = licensedate;
                            });
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      width: 170,
                      child: FlatButton(
                        child: Row(
                          children: [
                            Text(
                              _insuranceExpiration == null ? 'Insurance Exp.' : '${_insuranceExpiration.month}/${_insuranceExpiration.day}/${_insuranceExpiration.year}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: _insuranceExpiration != null ? _insuranceExpiration : DateTime(DateTime.now().year),
                            firstDate: DateTime(DateTime.now().year),
                            lastDate: DateTime(2050),
                          ).then((insurancedate) {
                            setState(() {
                              _insuranceExpiration = insurancedate;
                            });
                          });
                        },
                      ),
                    ),
                    Container(
                      height: 48,
                      child: ToggleSwitch(
                          minWidth: 85.0,
                          cornerRadius: 5,
                          activeBgColor: Colors.green,
                          activeTextColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveTextColor: Colors.white,
                          labels: ['Cash', 'Check'],
                          activeColors: [Colors.green, Colors.blue],
                          onToggle: (index) {
                            if (index == 0) {
                              _payCash = true;
                            }
                            else {
                              _payCash = false;
                            }
                            print('Cash is ' + _payCash.toString());
                          }
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _isAgreed,
                  onChanged: (agree) {
                    setState(() {
                      _isAgreed = agree;
                    });
                    print(_isAgreed);
                  },
                  title: Text(
                    'I understand that KISD assumes no liability for student parking. Students park at their own risk with regard to accidental damage to vehicles.',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _isRead,
                  onChanged: (read) async {
                    if (await canLaunch('http://www.katyisd.org/campus/CRHS/Documents/PARKING%20PACKET%20%202020-21.pdf')&&read) {
                    await launch('http://www.katyisd.org/campus/CRHS/Documents/PARKING%20PACKET%20%202020-21.pdf');
                    }
                    else {

                    }
                    setState(() {
                      _isRead = read;
                    });
                    print(_isRead);
                  },
                  title: Text(
                    'I acknowledge that I have received and read the KISD & CRHS Parking Rules and Regulations information.',
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: FlatButton(
                    child: Container(
                      height: 48,
                      width: 360,
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(128, 0, 0, .7)
                      ),
                    ),
                  ),
                  onTap: () {
                    if(first!=null&&
                       last!=null&&
                       grade!=null&&
                       id!=null&&
                       address!=null&&
                       zip!=null&&
                       phone!=null&&
                       _birth!=null&&
                       model!=null&&
                       color!=null&&
                       year!=null&&
                       plate!=null&&
                       driver!=null&&
                       _licenseExpiration!=null&&
                       _insuranceExpiration!=null){
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Wait'),
                              content: Text('Did you double check your info? You can\'t change it after you submitted it.'),
                              actions: [
                                FlatButton(
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                    ),
                                  ),
                                  onPressed: () async {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          bool finished = false;
                                          return AlertDialog(
                                            content: FlareActor(
                                              "assets/confirm.flr",
                                              alignment:Alignment.center,
                                              fit:BoxFit.contain,
                                              animation: !finished ? 'Loading' : 'Complete',
                                            ),
                                          );

                                        }
                                    );
                                    FirebaseUser currentUser;
                                    DocumentReference spotDoc = Firestore.instance.collection('spots').document();
                                    spotDoc.setData({
                                      'first': first,
                                      'last': last,
                                      'grade': grade,
                                      'schoolID': id,
                                      'address': address,
                                      'zipCode': zip,
                                      'phone': phone,
                                      'birth': _birth,
                                      'model': model,
                                      'color': color,
                                      'year': year,
                                      'licensePlate': plate,
                                      'driverLicenseNumber': driver,
                                      'licenseExpiration': _licenseExpiration,
                                      'insuranceExpiration': _insuranceExpiration,
                                      'isCash': _payCash,
                                    });
                                    currentUser = await FirebaseAuth.instance.currentUser();
                                    Firestore.instance.collection('users').document(currentUser.uid).setData({
                                      'spotuid': spotDoc.documentID,
                                    }, merge: true);
                                  },
                                ),
                              ],
                            );
                          }
                      );
                    }
                    else{
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text('Please submit all info to continue'),
                          );
                        }
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


Widget FieldGen (String hint, TextInputType type, TextEditingController controller) {
  return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))

      ),
      width: 170,
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
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

Widget FieldGenMax (String hint, TextInputType type, TextEditingController controller, int max) {
  return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))

      ),
      width: 170,
      child: TextField(
        maxLength: max,
        controller: controller,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        keyboardType: type,
        decoration: InputDecoration(
          counterText: '',
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

Widget FieldGenSmall (String hint, TextInputType type, TextEditingController controller) {
  return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))

      ),
      width: 170,
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        keyboardType: type,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
              top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
          hintText: " " + hint,
          hintStyle: TextStyle(
              fontSize: 13,
              color: Colors.black
          ),
          border: InputBorder.none,

        ),
      ));
}