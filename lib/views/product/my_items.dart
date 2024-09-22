import 'package:flutter/material.dart';
import 'package:pricecompare/views/product/product_details_view.dart';

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
  final VoidCallback onDelete;

  ProductCard({required this.product, required this.onDelete});

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
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

class MyItemsPage extends StatefulWidget {
  @override
  _MyItemsPageState createState() => _MyItemsPageState();
}

class _MyItemsPageState extends State<MyItemsPage> {
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

  void _deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EAFB),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10), // Add padding for better spacing
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(
                    product: products[index],
                    onDelete: () => _deleteProduct(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: MyItemsPage()));
