import 'package:flutter/material.dart';
import 'package:pet_adoption_store_challenge/app/models/category.dart';

import 'package:pet_adoption_store_challenge/app/utils/constants.dart';

class CategoriesTile extends StatefulWidget {
  final Category category;
  final int index;

  const CategoriesTile({Key key, this.category, this.index}) : super(key: key);

  @override
  _CategoriesTileState createState() => _CategoriesTileState();
}

class _CategoriesTileState extends State<CategoriesTile> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: w * 0.044),
      child: Column(
        children: [
          Container(
            height: h * 0.09,
            width: w * 0.175,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: widget.index == 0 ? primaryGreen : Colors.white,
              boxShadow: shadow,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: h * 0.008,
                horizontal: w * 0.008,
              ),
              child: Image.asset(
                widget.category.image,
                color: widget.index == 0 ? Colors.white : Colors.black26,
              ),
            ),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Text(
            widget.category.name,
            style: TextStyle(
              fontSize: w * 0.03,
              fontWeight: FontWeight.w700,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
