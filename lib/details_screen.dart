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
        child: Padding(
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
              )
            ],
          ),
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
