import 'package:flutter/material.dart';
import 'package:pet_adoption_store_challenge/app/data/dummy_data.dart';
import 'package:pet_adoption_store_challenge/app/utils/constants.dart';
import 'package:pet_adoption_store_challenge/app/widgets/categories_tile.dart';
import 'package:pet_adoption_store_challenge/app/widgets/pets_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double x = 0;
  double y = 0;
  double scale = 1;

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      transform: Matrix4.translationValues(x, y, 0)..scale(scale),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isOpen ? 40 : 0),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: h * 0.05),
            _appBar(w),
            _body(w, h),
          ],
        ),
      ),
    );
  }

  Widget _appBar(w) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: w * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isOpen
              ? IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    setState(() {
                      x = 0;
                      y = 0;
                      scale = 1;
                      isOpen = false;
                    });
                  })
              : IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    setState(() {
                      x = 230;
                      y = 150;
                      scale = 0.6;
                      isOpen = true;
                    });
                  },
                ),
          Column(
            children: [
              Text(
                'Location',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: primaryGreen,
                  ),
                  Row(
                    children: [
                      Text(
                        'Kyiv, ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        'Ukraine',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          color: Colors.black54,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('images/perfil.jpg'),
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _body(w, h) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(42),
            topRight: Radius.circular(42),
            bottomLeft: Radius.circular(isOpen ? 42 : 0),
          ),
        ),
        child: Column(
          children: [
            _searchBar(w, h),
            Container(
              height: h * 0.12,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: DUMMY_CATEGORIES.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: CategoriesTile(
                        category: DUMMY_CATEGORIES[index],
                        index: index,
                      ),
                    );
                  }),
            ),
            Container(
              height: h * 0.62,
              child: ListView.builder(
                  itemCount: DUMMY_PETS.length,
                  itemBuilder: (context, index) {
                    return PetsTile(pet: DUMMY_PETS[index]);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchBar(w, h) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: w * 0.03, vertical: h * 0.02),
      margin: EdgeInsets.symmetric(vertical: h * 0.04, horizontal: w * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.search,
            color: Colors.grey[400],
          ),
          Padding(
            padding: EdgeInsets.only(
              right: w * 0.35,
            ),
            child: Text(
              'Search pet to adopt',
              style: TextStyle(
                fontSize: w * 0.035,
                fontWeight: FontWeight.w700,
                color: Colors.grey[500],
              ),
            ),
          ),
          Image.asset(
            'images/setting.png',
            height: h * 0.03,
            color: Colors.black26,
          ),
        ],
      ),
    );
  }
}
