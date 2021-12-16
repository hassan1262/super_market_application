import 'package:flutter/material.dart';
import 'package:super_market_application/shared/constants.dart';

class Cards extends StatelessWidget {
  String? image;
  String? categoryName;
  Cards(this.image, this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/products',
            arguments: {'categoryName': this.categoryName},
          );
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/${this.image}'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 1,
              child: Container(
                color: Colors.black45,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  '${this.categoryName}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSizeM,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
