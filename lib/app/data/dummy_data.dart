import 'package:pet_adoption_store_challenge/app/models/category.dart';
import 'package:pet_adoption_store_challenge/app/models/pet.dart';

const DUMMY_CATEGORIES = const [
  Category(
    id: 'c1',
    name: 'Cats',
    image: 'images/cat.png',
  ),
  Category(
    id: 'c2',
    name: 'Dogs',
    image: 'images/dog.png',
  ),
  Category(
    id: 'c3',
    name: 'Parrots',
    image: 'images/parrot.png',
  ),
  Category(
    id: 'c2',
    name: 'Brunnies',
    image: 'images/rabbit.png',
  ),
  Category(
    id: 'c5',
    name: 'Horses',
    image: 'images/horse.png',
  ),
];

const DUMMY_PETS = const [
  Pet(
      id: 'p1',
      name: 'Sola',
      breed: 'Absyssian cat',
      age: 2,
      distance: 3.6,
      cardColor: 'blue',
      image: 'images/cat2.png',
      gender: 'female'),
  Pet(
    id: 'p2',
    name: 'Orion',
    breed: 'Absyssian cat',
    age: 1.5,
    distance: 7.8,
    cardColor: 'orange',
    image: 'images/cat1.png',
    gender: 'male',
  ),
];
