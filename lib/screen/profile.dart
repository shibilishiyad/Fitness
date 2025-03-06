import 'package:fitness/utils/screen_util.dart';
import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: ScreenUtil.hight,
          width: ScreenUtil.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/asset/images/back.jpg"),
                  fit: BoxFit.cover)),
        ),
        Center(
          child: Container(
            height: 600,
            width: 700,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 70, left: 60),
                  child: CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.black,
                    ),
                    radius: 60,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, top: 15),
                  child: Row(
                    children: [
                      Text(
                        "SHIBILI",
                        style: TextStyle(fontSize: 20, color: Colors.white54),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: FractionalTranslation(
                    translation: const Offset(0, 0.5),
                    child: Container(
                      color: Colors.white24,
                      height: 120,
                      width: ScreenUtil.width / 2,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 60,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'age',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "23",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
