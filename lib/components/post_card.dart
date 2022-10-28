import 'package:flutter/material.dart';

import '../constants.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.amount,
    required this.borderColor,
  }) : super(key: key);

  final String imagePath;
  final String name;
  final String amount;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    var customSize1 = MediaQuery.of(context).size.width;
    if(customSize1 > 720){
      textWidthOFCard = 150;
    };

    if(customSize1 < 720){
      textWidthOFCard = 110;
    };
// print(textWidthOFCard);
    return Expanded(
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.only(right: 2),
        padding: EdgeInsets.only(left: 18, right: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: borderColor, width: 3),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, 10),
                blurRadius: 5,
                spreadRadius: 2),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imagePath,
              height: 33,
            ),
            Container(
             width: textWidthOFCard,
              child: Text(
                name,
                style: TextStyle(fontSize: 13),
              ),
            ),
            Text(amount)
          ],
        ),
      ),
    );
  }
}
