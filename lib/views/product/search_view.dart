import 'package:flutter/material.dart';
import 'package:pricecompare/views/product/product_details_view.dart';
import 'package:heroicons/heroicons.dart';

class Product {
  final String title;
  final String description;
  final String image;
  final String price;
  final double rating;

  Product({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsView(title: product.title),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(19),
                child: Container(
                  width: 130,
                  height: 175,
                  child: Image.asset(product.image, fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: Color(0xFF400090),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Text(
                          '${product.rating}/5',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Poppins',
                            color: Color(0xFFFF00B8),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Text(
                      product.description,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins',
                        color: Color(0xFF400090),
                      ),
                    ),
                    Text(
                      product.price,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: Color(0xFF400090),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> products = [
      Product(
        title: 'Alien Ware 15',
        description: 'New Laptop Alienware Area-51m 16GB Intel Core I5 SSD 1T',
        image: 'assets/sponsored1.png',
        price: '1,500',
        rating: 4.5,
      ),
      Product(
        title: 'Alien Ware 15',
        description: 'New Laptop Alienware Area-51m 16GB Intel Core I5 SSD 1T',
        image: 'assets/sponsored1.png',
        price: '1,500',
        rating: 4.5,
      ),
      Product(
        title: 'Alien Ware 15',
        description: 'New Laptop Alienware Area-51m 16GB Intel Core I5 SSD 1T',
        image: 'assets/sponsored1.png',
        price: '1,500',
        rating: 4.5,
      ),
      Product(
        title: 'Alien Ware 15',
        description: 'New Laptop Alienware Area-51m 16GB Intel Core I5 SSD 1T',
        image: 'assets/sponsored1.png',
        price: '1,500',
        rating: 4.5,
      ),
    ];

    return Scaffold(
      backgroundColor: Color(0xFFF5EAFB),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10), // Add padding for better spacing
          Container(
            height: 50,
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Poppins',
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF9D6DCD),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF9D6DCD),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF9D6DCD),
                  ),
                ),
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Filters',
                  style: TextStyle(
                    color: Color(0xFF29006C),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  color: Color(0xFF29006C),
                  icon: HeroIcon(HeroIcons.adjustmentsHorizontal),
                  onPressed: () {
                    _showFilterDialog(context);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(product: products[index]),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for barcode icon
        },
        child: HeroIcon(HeroIcons.qrCode),
      ),
    );
  }
  void _showFilterDialog(BuildContext context) {
  double _priceValue = 0;
  double _ratingValue = 0;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFF5EAFB),
        title: Center(child: 
        Text('Filter Options',
        style: TextStyle( 
                    color: Color(0xFF9B1DFF),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
        )
        ),
        content: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Price',
                style: TextStyle(
                    color: Color(0xFF9B1DFF),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Slider(
                  value: _priceValue,
                  min: 0,
                  max: 1000,
                  divisions: 100,
                  label: _priceValue.round().toString(),
                  onChanged: (double value) {
                    _priceValue = value;
                  },
                ),
                Text('Retailer\'s Rating',
                style: TextStyle(
                    color: Color(0xFF9B1DFF),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Slider(
                  value: _ratingValue,
                  min: 0,
                  max: 5,
                  divisions: 5,
                  label: _ratingValue.round().toString(),
                  onChanged: (double value) {
                    _ratingValue = value;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            child: Text('Cancel',
            style: TextStyle(
                    color: Color(0xFF9B1DFF),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Apply',
            style: TextStyle(
                    color: Color(0xFF9B1DFF),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
}

void main() => runApp(MaterialApp(home: SearchPage()));
