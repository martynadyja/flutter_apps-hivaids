import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hivaidsapp/constant.dart';
import 'package:hivaidsapp/info_screen.dart';
import 'package:hivaidsapp/widgets/counter.dart';
import 'package:hivaidsapp/widgets/my_header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HIV/Aids',
        theme: ThemeData(
            scaffoldBackgroundColor: kBackgroundColor,
            fontFamily: "Walkway",
            textTheme: TextTheme(
              bodyText1: TextStyle(color: kBodyTextColor),
            )),
        home: HomeScreen(),);
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          MyHeader(
            image: "assets/icons/doctor.svg",
            textTop: "All you need",
            textBottom: "is go to the doctor.",
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Color(0xFFE5E5E5),
              ),
            ),
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  "assets/icons/localization.svg",
                  height: 25,
                  width: 25,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: DropdownButton(
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                    value: "Poland",
                    items: ['Poland', 'USA', 'Brazil', 'Africa']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Global statistics\n",
                            style: kTitleTextStyle,
                          ),
                          TextSpan(
                            text: "Updates 2021",
                            style: TextStyle(color: kTextLightColor),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      "See details",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white70,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 30,
                        color: kShadowColor,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Counter(
                        color: kInfectedColor,
                        number: 34.8,
                        title: "milion infected",
                      ),
                      Counter(
                        color: kDeathColor,
                        number: 650,
                        title: "thousands deaths",
                      ),
                      Counter(
                        color: kRecoverColor,
                        number: 28.7,
                        title: "milion treated",
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Spread of Virus",
                      style: kTitleTextStyle,
                    ),
                    Text(
                      "See details",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  padding: EdgeInsets.all(
                    20,
                  ),
                  height: 178,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(
                            0,
                            10,
                          ),
                          blurRadius: 30,
                          color: kShadowColor,
                        )
                      ]),
                  child: Image.asset(
                    "assets/images/map.png",
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
