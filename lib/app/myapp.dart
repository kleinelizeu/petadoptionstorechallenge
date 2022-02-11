import 'package:flutter/material.dart';
import 'package:pet_adoption_store_challenge/app/utils/app_routes.dart';
import 'package:pet_adoption_store_challenge/app/view/home_page.dart';
import 'package:pet_adoption_store_challenge/app/view/pet_detail_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Circular',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        AppRoutes.HOME: (ctx) => HomePage(),
        AppRoutes.PET_DETAIL: (ctx) => PetDetail(),
      },
    );
  }
}
