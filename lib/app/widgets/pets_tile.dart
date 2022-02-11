import 'package:flutter/material.dart';
import 'package:pet_adoption_store_challenge/app/models/pet.dart';
import 'package:pet_adoption_store_challenge/app/utils/app_routes.dart';
import 'dart:math' as math;
import 'package:pet_adoption_store_challenge/app/utils/constants.dart';

class PetsTile extends StatelessWidget {
  final Pet pet;
  const PetsTile({Key key, this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.PET_DETAIL,
          arguments: pet,
        );
      },
      child: Container(
        height: h * 0.3,
        margin: EdgeInsets.symmetric(horizontal: w * 0.04),
        child: Row(
          children: [
            _petImage(h),
            _infoPet(w, h),
          ],
        ),
      ),
    );
  }

  Widget _petImage(h) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: pet.cardColor == 'blue'
                  ? Colors.blueGrey[200]
                  : Colors.orange[200],
              borderRadius: BorderRadius.circular(20),
              boxShadow: shadow,
            ),
            margin: EdgeInsets.only(top: h * 0.06),
          ),
          Align(
              child: Hero(
            tag: pet.id,
            child: Image.asset(
              pet.image,
            ),
          ))
        ],
      ),
    );
  }

  Widget _infoPet(w, h) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.only(top: h * 0.08, bottom: h * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: shadow,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pet.name,
                  style: TextStyle(
                    fontSize: w * 0.05,
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
            Text(
              pet.breed,
              style: TextStyle(
                fontSize: w * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            Text(
              ' ${pet.age} years old',
              style: TextStyle(
                fontSize: w * 0.03,
                fontWeight: FontWeight.bold,
                color: Colors.black26,
              ),
            ),
            SizedBox(
              height: h * 0.01,
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
                  'Distance ${pet.distance} km',
                  style: TextStyle(
                    fontSize: w * 0.03,
                    fontWeight: FontWeight.bold,
                    color: Colors.black26,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
