import 'package:OnlineStudyApp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Color(0xFFF5F4EF),
            image: DecorationImage(
              image: AssetImage("assets/images/ux_big.png"),
              alignment: Alignment.topRight,
            )),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 50.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/arrow-left.svg"),
                      SvgPicture.asset("assets/icons/more-vertical.svg")
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ClipPath(
                    clipper: BestSellerClipper(),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 10.0, top: 5.0, right: 20.0, bottom: 5.0),
                      color: kBestSellerColor,
                      child: Text(
                        'BestSeller'.toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Text(
                    'Design Thinking',
                    style: kHeadingextStyle,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/person.svg"),
                      SizedBox(
                        width: 5,
                      ),
                      Text('18K'),
                      SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset("assets/icons/star.svg"),
                      SizedBox(
                        width: 5,
                      ),
                      Text('4.8'),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: '\$50 ',
                        style: kHeadingextStyle.copyWith(fontSize: 32),
                      ),
                      TextSpan(
                          text: '\$70 ',
                          style: TextStyle(
                            color: kTextColor.withOpacity(.5),
                            decoration: TextDecoration.lineThrough,
                          ))
                    ]),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white,
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Course Content',
                            style: kTitleTextStyle,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          CourseList(
                            number: '01',
                            minText: '5.35 mins',
                            titleText: 'Welcome to the course',
                          ),
                          CourseList(
                            number: '02',
                            minText: '19.04 mins',
                            titleText: 'Design Thinking - Intro',
                          ),
                          CourseList(
                            number: '03',
                            minText: '15.35 mins',
                            titleText: 'Design Thinking Process',
                          ),
                          CourseList(
                            number: '04',
                            minText: '5.35 mins',
                            titleText: 'Customer Percepective',
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40.0),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 50,
                                color: kTextColor.withOpacity(.1),
                              )
                            ]),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              padding: EdgeInsets.all(14),
                              width: 80,
                              height: 56,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFEDEE),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: SvgPicture.asset(
                                  "assets/icons/shopping-bag.svg"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: kBlueColor,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Text(
                                    'Buy Now',
                                    style: kSubtitleTextSyule.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var w = size.width;
    var h = size.height;
    path.lineTo(w - 20, 0);
    path.lineTo(w, h / 2);
    path.lineTo(w - 20, h);
    path.lineTo(0, h);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return null;
  }
}

class CourseList extends StatelessWidget {
  final String number;
  final String minText;
  final String titleText;

  const CourseList({this.number, this.minText, this.titleText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        children: <Widget>[
          Text(
            '$number',
            style: kHeadingextStyle.copyWith(
              color: kTextColor.withOpacity(.15),
              fontSize: 32,
            ),
          ),
          SizedBox(
            width: 30.0,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: '$minText\n',
                  style: TextStyle(
                      color: kTextColor.withOpacity(.5), fontSize: 18)),
              TextSpan(
                  text: '$titleText',
                  style: kSubtitleTextSyule.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ))
            ]),
          ),
          Spacer(),
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(left: 20.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kGreenColor,
            ),
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
