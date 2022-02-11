import 'package:flutter/material.dart';
import 'package:pet_adoption_store_challenge/app/utils/constants.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      color: primaryGreen,
      padding: EdgeInsets.only(top: 50, left: 10, bottom: 50),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _perfilStatus(w),
        _drawerItems(w),
        _settings(w, h),
      ]),
    );
  }

  Widget _perfilStatus(w) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('images/perfil.jpg'),
          backgroundColor: Colors.transparent,
        ),
        SizedBox(
          width: w * 0.02,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kendall Jenner",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Text(
              "Active status",
              style: TextStyle(
                color: Colors.white24,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _drawerItems(w) {
    return Column(
      children: drawerItems
          .map((i) => Container(
                padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
                child: Row(
                  children: [
                    Icon(
                      i['icon'],
                      size: 20,
                      color: i['title'] == 'Adoption'
                          ? Colors.white
                          : Colors.white24,
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Text(
                      i['title'],
                      style: TextStyle(
                        color: i['title'] == 'Adoption'
                            ? Colors.white
                            : Colors.white24,
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.045,
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget _settings(w, h) {
    return Container(
      margin: EdgeInsets.only(
        right: w * 0.35,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.settings,
            color: Colors.white38,
          ),
          Text(
            "Settings",
            style: TextStyle(
              color: Colors.white38,
              fontWeight: FontWeight.w500,
              fontSize: w * 0.045,
            ),
          ),
          Container(
            height: h * 0.02,
            child: VerticalDivider(
              color: Colors.white38,
              thickness: 1,
            ),
          ),
          Text(
            'Log out',
            style: TextStyle(
              color: Colors.white38,
              fontWeight: FontWeight.w500,
              fontSize: w * 0.045,
            ),
          )
        ],
      ),
    );
  }
}
