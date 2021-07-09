import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Revoke extends StatefulWidget {
  @override
  _RevokeState createState() => _RevokeState();
}

class _RevokeState extends State<Revoke> {

  TextEditingController searchController = new TextEditingController(text: '');
  String query = '';

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('spots').snapshots(),
          builder: (context, snapshots) {
            if(!snapshots.hasData) {
              return Scaffold(
                body: Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }
            else {
              QuerySnapshot documents = (snapshots.data as QuerySnapshot);
              return Scaffold(
                body: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 40,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width-20,
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 20,
                            ),
                            Icon(Icons.search),
                            Container(
                              width: 10,
                            ),
                            Expanded(
                              child: TextField(
                                controller: searchController,
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                                onChanged: (String input) async {
                                  query = input;
                                  setState(() {

                                  });
                                  print('search $query');
                                },
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: documents.docs.length,
                          itemBuilder: (context, i) {
                            if(documents.docs[i]['spot']!=0&&documents.docs[i]['completed']&&documents.docs[i]['confirmed']&&'${documents.docs[i]['first'].toLowerCase()} ${documents.docs[i]['last'].toLowerCase()}'.contains(query.toLowerCase())) {
                              return Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  width: 20,
                                                ),
                                                Text(
                                                  '${documents.docs[i]['first']} ${documents.docs[i]['last']}',
                                                  style: TextStyle(
                                                    fontSize: 26,
                                                  ),
                                                ),
                                                Spacer(
                                                  flex: 1,
                                                ),
                                                Text(
                                                  '${documents.docs[i]['spot']}',
                                                  style: TextStyle(
                                                    fontSize: 26,
                                                  ),
                                                ),
                                                Container(
                                                  width: 20,
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 48,
                                            child: Row(
                                              children: <Widget>[
                                                Spacer(
                                                  flex: 1,
                                                ),
                                                Container(
                                                  width: (MediaQuery.of(context).size.width-50)/2,
                                                  child: InkWell(
                                                    child: Padding(
                                                      padding: EdgeInsets.all(10),
                                                      child: Center(
                                                        child: Text(
                                                          'Revoke',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              title: Row(
                                                                children: <Widget>[
                                                                  Icon(
                                                                    Icons.warning,
                                                                    color: Colors.red,
                                                                  ),
                                                                  Text(
                                                                    ' Alert',
                                                                    style: TextStyle(
                                                                      color: Colors.red,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              content: Text('Are You Sure You Want to Revoke This Person From the Database'),
                                                              actions: <Widget>[
                                                                FlatButton(
                                                                  child: Text('No'),
                                                                  onPressed: () {
                                                                    Navigator.pop(context);
                                                                  },
                                                                ),
                                                                FlatButton(
                                                                  child: Text('Yes'),
                                                                  onPressed: () async {
                                                                    bool gotError = false;
                                                                    FirebaseFirestore.instance.collection('admin').doc(FirebaseAuth.instance.currentUser!.uid).collection('history').doc('${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}${DateTime.now().second}${DateTime.now().millisecond}').update({
                                                                      'time': DateTime.now(),
                                                                      'documentID': documents.docs[i].id,
                                                                      'action': 'revoke',
                                                                    }).catchError((onError) {
                                                                      gotError = true;
                                                                      showDialog(
                                                                          context: context,
                                                                          builder: (context) {
                                                                            return AlertDialog(
                                                                              title: Text('Error'),
                                                                              content: Text('Access Denied'),
                                                                            );
                                                                          }
                                                                      );
                                                                    });
                                                                    FirebaseFirestore.instance.collection('spots').doc(documents.docs[i].id).update({
                                                                      'confirmed': false,
                                                                    }).catchError((onError) {
                                                                      if(!gotError) {
                                                                        gotError = true;
                                                                        showDialog(
                                                                            context: context,
                                                                            builder: (context) {
                                                                              return AlertDialog(
                                                                                title: Text('Error'),
                                                                                content: Text('Access Denied'),
                                                                              );
                                                                            }
                                                                        );
                                                                      }
                                                                    });
                                                                    if(!gotError) {
                                                                      Navigator.pop(context);
                                                                    }
                                                                  },
                                                                ),
                                                              ],
                                                            );
                                                          }
                                                      );
                                                    },
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Color.fromRGBO(255, 183, 77, 1),
                                                  ),
                                                ),
                                                Spacer(
                                                  flex: 1,
                                                ),
                                                Container(
                                                  width: (MediaQuery.of(context).size.width-50)/2,
                                                  child: InkWell(
                                                    child: Padding(
                                                      padding: EdgeInsets.all(10),
                                                      child: Center(
                                                        child: Text(
                                                          'Delete',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              title: Row(
                                                                children: <Widget>[
                                                                  Icon(
                                                                    Icons.warning,
                                                                    color: Colors.red,
                                                                  ),
                                                                  Text(
                                                                    ' Alert',
                                                                    style: TextStyle(
                                                                      color: Colors.red,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              content: Text('Are You Sure You Want to Delete This Person\'s Spot From the Database'),
                                                              actions: <Widget>[
                                                                FlatButton(
                                                                  child: Text('No'),
                                                                  onPressed: () {
                                                                    Navigator.pop(context);
                                                                  },
                                                                ),
                                                                FlatButton(
                                                                  child: Text('Yes'),
                                                                  onPressed: () async {
                                                                    bool gotError = false;
                                                                    FirebaseFirestore.instance.collection('admin').doc(FirebaseAuth.instance.currentUser!.uid).collection('history').doc('${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}${DateTime.now().second}${DateTime.now().millisecond}').update({
                                                                      'time': DateTime.now(),
                                                                      'documentID': documents.docs[i].id,
                                                                      'action': 'delete',
                                                                    }).catchError((onError) {
                                                                      gotError = true;
                                                                      showDialog(
                                                                          context: context,
                                                                          builder: (context) {
                                                                            return AlertDialog(
                                                                              title: Text('Error'),
                                                                              content: Text('Access Denied'),
                                                                            );
                                                                          }
                                                                      );
                                                                    });
                                                                    FirebaseFirestore.instance.collection('spots').doc(documents.docs[i].id).delete().catchError((onError) {
                                                                      if(!gotError) {
                                                                        gotError = true;
                                                                        showDialog(
                                                                            context: context,
                                                                            builder: (context) {
                                                                              return AlertDialog(
                                                                                title: Text('Error'),
                                                                                content: Text('Access Denied'),
                                                                              );
                                                                            }
                                                                        );
                                                                      }
                                                                    });
                                                                    FirebaseFirestore.instance.collection('users').doc(documents.docs[i]['userid']).update({
                                                                      'spotuid': 'none',
                                                                    }).catchError((onError) {
                                                                      if(!gotError) {
                                                                        gotError = true;
                                                                        showDialog(
                                                                            context: context,
                                                                            builder: (context) {
                                                                              return AlertDialog(
                                                                                title: Text('Error'),
                                                                                content: Text('Access Denied'),
                                                                              );
                                                                            }
                                                                        );
                                                                      }
                                                                    });
                                                                    if(!gotError) {
                                                                      Navigator.pop(context);
                                                                    }
                                                                  },
                                                                ),
                                                              ],
                                                            );
                                                          }
                                                      );
                                                    },
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Color.fromRGBO(255, 23, 68, 1),
                                                  ),
                                                ),
                                                Spacer(
                                                  flex: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      indent: 15,
                                      endIndent: 15,
                                      thickness: 3,
                                    ),
                                  ],
                                ),
                              );
                            }
                            else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
