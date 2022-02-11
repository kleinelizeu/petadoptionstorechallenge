import 'package:flutter/cupertino.dart';

class Pet {
  final String id;
  final String name;
  final String breed;
  final double age;
  final double distance;
  final String cardColor;
  final String image;
  final String gender;

  const Pet({
    @required this.id,
    @required this.name,
    @required this.breed,
    @required this.age,
    @required this.distance,
    @required this.cardColor,
    @required this.image,
    @required this.gender,
  });
}
