import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

PreferredSize prefAppBar(BuildContext context, String text) {
  return PreferredSize(
      child: SafeArea(
        child: Container(
            padding: EdgeInsets.only(left: 15, bottom: 15, top: 15, right: 15),
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Spacer(),
                    Text(text,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Spacer(),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.only(left: 4),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Icon(
                            CupertinoIcons.play,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            )),
      ),
      preferredSize:
          Size(double.infinity, MediaQuery.of(context).size.height * 0.12));
}

PreferredSize homeAppBar(BuildContext context, String url) {
  return PreferredSize(
      child: SafeArea(
        child: Container(
            padding: EdgeInsets.only(left: 15, bottom: 15, top: 15, right: 15),
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('Home',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 25,
                      backgroundImage: NetworkImage(url),
                    ),
                  ],
                ),
              ],
            )),
      ),
      preferredSize:
          Size(double.infinity, MediaQuery.of(context).size.height * 0.12));
}

PreferredSize waveAppBar(BuildContext context) {
  return PreferredSize(
      child: SafeArea(
        child: ClipPath(
          clipper: BackgroundWaveClipper(),
          child: Container(
              padding:
                  EdgeInsets.only(left: 15, bottom: 40, top: 10, right: 15),
              color: Color.fromRGBO(54, 113, 90, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 25,
                        backgroundImage: AssetImage('assets/image/tom.jpg'),
                      ),
                      Spacer(),
                      Text(getFormatedDate(DateTime.now().toString()),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Spacer(),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.only(left: 1),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(107, 166, 143, 1),
                              border: Border.all(
                                  color: Color.fromRGBO(107, 166, 143, 1)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Icon(
                              //Icons.notifications_outlined,
                              CupertinoIcons.bell,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
      preferredSize:
          Size(double.infinity, MediaQuery.of(context).size.height * 0.19));
}

class BackgroundWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 30);

    path.quadraticBezierTo(
        size.width / 2, size.height - 90, size.width, size.height);

    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(BackgroundWaveClipper oldClipper) => oldClipper != this;
}

getFormatedDate(String dates) {
  DateTime date = DateTime.parse(dates);
  String formattedDate = DateFormat('dd-MMM-yyyy').format(date);
  return formattedDate;
}
