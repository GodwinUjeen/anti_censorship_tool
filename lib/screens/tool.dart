import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class Tool extends StatefulWidget {
  Tool({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Tool createState() => _Tool();
}

class _Tool extends State<Tool> {
  final _controller = TextEditingController();
  String url2 = "";
  var url = 'https://www.googleweblight.com/i?u=https://';

  _launchURL() async {
    url2 = _controller.text.toString();

    var link = url + url2;

    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exitApp();

        return null;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Anti CensorShip Tool"),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "  Anti Censorship Tool",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
                width: 25,
              ),
              Container(
                padding: EdgeInsets.all(5),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 350.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),

                      color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            helperStyle:
                                TextStyle(color: Colors.grey.withOpacity(0.8)),
                            hintText: "Enter The Url",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  width: 140.0,
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.black54)),
                    color: Colors.yellowAccent,
                    child: Text(
                      "Go!",
                      style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    elevation: 25.0,
                    onPressed: () => {
                      url2 = _controller.text,
                      _launchURL(),
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void choiceAction(String choice) {
    //print(choice);
    if (choice == Constants.web) {
      url = "http://www.googleweblight.com/i?u=https://";
      Fluttertoast.showToast(
        msg: "Google Web Light Selected",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 13.0,
      );
    } else if (choice == Constants.hypothes) {
      url = "https://via.hypothes.is/https://";
      Fluttertoast.showToast(
        msg: "Hypothes.is Selected",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 13.0,
      );
    } else if (choice == Constants.cache) {
      url = "https://webcache.googleusercontent.com/search?q=cache:https://";
      Fluttertoast.showToast(
        msg: "Google Cache Selected",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 13.0,
      );
    } else if (choice == Constants.archive) {
      url = "https://web.archive.org/save/https://";
      Fluttertoast.showToast(
        msg: "Web Archive Selected",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 13.0,
      );
    } else if (choice == Constants.onion) {
      url = "https://proxy-02.onionsearchengine.com/index.php?q=https://";
      Fluttertoast.showToast(
        msg: "Onion Search Selected",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 13.0,
      );
    }
  }

  void exitApp() {
    SystemNavigator.pop();
  }
}
