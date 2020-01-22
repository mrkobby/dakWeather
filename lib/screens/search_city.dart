import 'package:dakweather/screens/loading_page.dart';
import 'package:dakweather/utilities/constants.dart';
import 'package:flutter/material.dart';

class SearchCity extends StatefulWidget {
  @override
  _SearchCityState createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  String typedCityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/weather_man.png'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: kTopContainerDecoration,
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            child: null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Hero(
                tag: 'heroBottomContainer',
                child: Container(
                    decoration: BoxDecoration(
                      color: kDefaultAppColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      border: Border.all(width: 0.0, color: kDefaultAppColor),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            blurRadius: 10,
                            offset: Offset(0, 0),
                            spreadRadius: 5),
                      ],
                    ),
                    child: null),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.0, color: kDefaultAppColor),
                color: kDefaultAppColor,
              ),
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      child: Image(
                        image: AssetImage('assets/images/logo_white.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Text(
                      'Search a location and get weather info:',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      //maxLength: 16,
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                      cursorColor: Colors.black,
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        typedCityName = value;
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: InputBorder.none,
                          hintText: 'enter location name',
                          counterStyle: TextStyle(color: Colors.white54)),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: FlatButton(
                          color: Colors.blueGrey,
                          onPressed: () {
                            Navigator.pop(context, typedCityName);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Get Weather',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 14.0,
                      ),
                      Container(
                        child: FlatButton(
                          color: Colors.blueGrey[700],
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoadingPage(),
                              ),
                            );
                          },
                          child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Icon(
                                Icons.my_location,
                                color: Colors.white,
                                size: 20.0,
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
