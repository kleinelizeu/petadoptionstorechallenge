import 'package:flutter/material.dart';

import 'package:pet_adoption_store_challenge/app/models/pet.dart';
import 'dart:math' as math;

import 'package:pet_adoption_store_challenge/app/utils/constants.dart';

class PetDetail extends StatefulWidget {
  const PetDetail({
    Key key,
  }) : super(key: key);

  @override
  _PetDetailState createState() => _PetDetailState();
}

class _PetDetailState extends State<PetDetail> {
  bool _favorite = false;

  @override
  Widget build(BuildContext context) {
    final pet = ModalRoute.of(context).settings.arguments as Pet;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Container(
                  height: h * 0.6,
                  color: Colors.blueGrey[300],
                ),
                Container(
                  color: Colors.white,
                ),
              ],
            ),
          ),
          _appBar(context),
          _petImage(pet),
          _infoPet(pet, w, h),
          _bottomWidget(h, w),
          _body(pet, w, h)
        ],
      ),
    );
  }

  Widget _appBar(context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black38,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            IconButton(
                icon: Icon(
                  Icons.ios_share,
                  color: Colors.black38,
                  size: 30,
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }

  Widget _petImage(pet) {
    return Container(
      margin: EdgeInsets.only(top: 22),
      child: Align(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: pet.id,
          child: Image.asset(pet.image),
        ),
      ),
    );
  }

  Widget _infoPet(pet, w, h) {
    return Padding(
      padding: EdgeInsets.only(top: h * 0.2),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: h * 0.18,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: shadow,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: h * 0.02,
              horizontal: w * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pet.name,
                      style: TextStyle(
                        fontSize: h * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    pet.gender == "female"
                        ? Transform.rotate(
                            angle: -math.pi / 1.3,
                            child: Image.asset(
                              'images/female.png',
                              height: 30,
                              color: Colors.black26,
                            ),
                          )
                        : Image.asset(
                            'images/male.png',
                            height: 25,
                            color: Colors.black26,
                          ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pet.breed,
                      style: TextStyle(
                        fontSize: h * 0.015,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      '${pet.age} years old',
                      style: TextStyle(
                        fontSize: h * 0.015,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: primaryGreen,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '5 Bulvarno-Kudriavska Street, Kyiv',
                      style: TextStyle(
                        fontSize: w * 0.035,
                        fontWeight: FontWeight.bold,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _body(pet, w, h) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(top: h * 0.65),
        padding: EdgeInsets.symmetric(horizontal: w * 0.055),
        height: h * 0.22,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  maxRadius: 20,
                  minRadius: 20,
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
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                        fontSize: w * 0.04,
                      ),
                    ),
                    Text(
                      "Owner",
                      style: TextStyle(
                        fontSize: w * 0.03,
                        color: Colors.black26,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.2),
                  child: Text(
                    "May 25, 2019",
                    style: TextStyle(
                      fontSize: w * 0.03,
                      color: Colors.black26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: h * 0.02),
            Text(
              'My job requires moving to another country. I dont have the oportunity to take the cat with me. I am looking for good people who will shelter my ${pet.name}.',
              style: TextStyle(
                fontSize: w * 0.032,
                color: Colors.black26,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomWidget(h, w) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          boxShadow: shadow,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(42),
            topRight: Radius.circular(42),
          ),
        ),
        height: h * 0.13,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: _toggleFavorite,
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    boxShadow: shadow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: h * 0.08,
                  width: w * 0.2,
                  child: Icon(
                    _favorite ? Icons.favorite : Icons.favorite_border,
                    color: _favorite ? Colors.red : Colors.white,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    boxShadow: shadow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: h * 0.08,
                  width: w * 0.6,
                  child: Center(
                    child: Text(
                      "Adoption",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      _favorite = !_favorite;
    });
  }
}
