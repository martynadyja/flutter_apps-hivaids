import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hivaidsapp/constant.dart';
import 'package:hivaidsapp/widgets/my_header.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyHeader(
            image: "assets/icons/drdoctor.svg",
            textTop: "Get to know",
            textBottom: "about HIV.",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Symptoms",
                  style: kTitleTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SymptomCard(
                      image: "assets/images/fever.png",
                      title: "Fever",
                      isActive: true,
                    ),
                    SymptomCard(
                      image: "assets/images/headache.png",
                      title: "Headache",
                    ),
                    SymptomCard(
                      image: "assets/images/muscleache.png",
                      title: "Muscle ache",
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Prevantion",
                  style: kTitleTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                PreventCard(
                  text:
                      "Talk to your partner about HIV testing and get tested before you have sex.",
                  image: "assets/images/test.png",
                  title: "Get tested for HIV",
                ),
                PreventCard(
                  text:
                      "HIV is mainly spread by having anal or vaginal sex without a condom.",
                  image: "assets/images/risk.png",
                  title: "Less risky sexual behaviors",
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;

  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(
                          0,
                          8,
                        ),
                        blurRadius: 24,
                        color: kShadowColor)
                  ]),
            ),
            Image.asset(
              image,
              width: 130,
            ),
            Positioned(
                left: 130,
                child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    height: 136,
                    width: MediaQuery.of(context).size.width - 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          title,
                          style: kTitleTextStyle.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          text,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset(
                            "assets/icons/forward.svg",
                            height: 22,
                          ),
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;

  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15,
          ),
          color: Colors.white,
          boxShadow: [
            isActive
                ? BoxShadow(
                    offset: Offset(
                      0,
                      10,
                    ),
                    blurRadius: 20,
                    color: kActiveShadowColor,
                  )
                : BoxShadow(
                    offset: Offset(
                      0,
                      3,
                    ),
                    blurRadius: 6,
                    color: kShadowColor,
                  )
          ]),
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            height: 90,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
