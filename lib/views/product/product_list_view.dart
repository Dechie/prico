import 'package:flutter/material.dart';
import 'package:pricecompare/views/product/product_details_view.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  CustomCard({
    required this.imagePath,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsView(title: text2),
            ),
          );
        },
        child: Container(
          width: 160,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 15,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Container(
                    width: 160,
                    height: 110,
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    Text(text1,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins',
                          color: Color(0xFF400090),
                        ),
                        textAlign: TextAlign.left),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5.0),
                  height: 23,
                  width: double.infinity,
                  child: Text(
                    text2,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Color(0xFF400090),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5.0),
                  height: 50,
                  width: double.infinity,
                  child: Text(
                    text3,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Poppins',
                      color: Color(0xFF400090),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5.0),
                  height: 24,
                  width: double.infinity,
                  child: Text(
                    text4,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Color(0xFF6B0090),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CategorySection extends StatelessWidget {
  final String categoryTitle;
  final List<CustomCard> cards;

  CategorySection({
    required this.categoryTitle,
    required this.cards,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            categoryTitle,
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Poppins',
              color: Color(0xFF400090),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: cards
                .map((card) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: card,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EAFB),
      body: ListView(
        children: [
          CategorySection(
            categoryTitle: 'Sponsored',
            cards: [
              CustomCard(
                imagePath: 'assets/sponsored1.png',
                text1: '4.5/5',
                text2: 'Alienware 15',
                text3:
                    'New Laptop Alienware Area-51m 16GB Intel Core I5 SSD 1T',
                text4: 'ETB 190,000',
              ),
              CustomCard(
                imagePath: 'assets/sponsored1.png',
                text1: '4.5/5',
                text2: 'Alienware 15',
                text3:
                    'New Laptop Alienware Area-51m 16GB Intel Core I5 SSD 1T',
                text4: 'ETB 190,000',
              ),
              CustomCard(
                imagePath: 'assets/sponsored1.png',
                text1: '4.5/5',
                text2: 'Alienware 15',
                text3:
                    'New Laptop Alienware Area-51m 16GB Intel Core I5 SSD 1T',
                text4: 'ETB 190,000',
              ),
            ],
          ),
          CategorySection(
            categoryTitle: 'Cosmetics',
            cards: [
              CustomCard(
                imagePath: 'assets/sponsored1.png',
                text1: '4.5/5',
                text2: 'Alienware 15',
                text3:
                    'New Laptop Alienware Area-51m 16GB Intel Core I5 SSD 1T',
                text4: 'ETB 190,000',
              ),
              CustomCard(
                imagePath: 'assets/sponsored1.png',
                text1: '4.5/5',
                text2: 'Alienware 15',
                text3:
                    'New Laptop Alienware Area-51m 16GB Intel Core I5 SSD 1T',
                text4: 'ETB 190,000',
              ),
              CustomCard(
                imagePath: 'assets/sponsored1.png',
                text1: '4.5/5',
                text2: 'Alienware 15',
                text3:
                    'New Laptop Alienware Area-51m 16GB Intel Core I5 SSD 1T',
                text4: 'ETB 190,000',
              ),
            ],
          ),
          CategorySection(
            categoryTitle: 'Wearables',
            cards: [
              CustomCard(
                imagePath: 'assets/sponsored1.png',
                text1: '4.5/5',
                text2: 'Alienware 15',
                text3:
                    'New Laptop Alienware Area-51m 16GB Intel Core I5 SSD 1T',
                text4: 'ETB 190,000',
              ),
              CustomCard(
                imagePath: 'assets/sponsored1.png',
                text1: '4.5/5',
                text2: 'Alienware 15',
                text3:
                    'New Laptop Alienware Area-51m 16GB Intel Core I5 SSD 1T',
                text4: 'ETB 190,000',
              ),
              CustomCard(
                imagePath: 'assets/sponsored1.png',
                text1: '4.5/5',
                text2: 'Alienware 15',
                text3:
                    'New Laptop Alienware Area-51m 16GB Intel Core I5 SSD 1T',
                text4: 'ETB 190,000',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
