import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pricecompare/viewmodels/product_search_viewmodel.dart';
import 'package:pricecompare/views/product/product_details_view.dart';
import 'package:heroicons/heroicons.dart';

class Product {
  final String title;
  final String description;
  final String image;
  final String price;
  final int productId;

  Product({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.productId,
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
            builder: (context) =>
                DetailsView(productId: product.productId.toString()),
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
                child: Image.network(product.image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Color(0xFF400090),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Poppins',
                      color: Color(0xFF400090),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '${product.price}ETB',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Color(0xFF400090),
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EAFB),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Container(
            height: 50,
            width: 300,
            child: TextField(
              controller: _searchController,
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
                prefixIcon: HeroIcon(HeroIcons.magnifyingGlass),
              ),
              onSubmitted: (query) {
                Provider.of<ProductSearchViewModel>(context, listen: false)
                    .searchForProducts(query);
              },
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: Consumer<ProductSearchViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (viewModel.errorMessage.isNotEmpty) {
                  return Center(
                      child: Text(
                    viewModel.errorMessage,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: Color(0xFF6600B7)),
                  ));
                }

                if (viewModel.products.isEmpty) {
                  return Center(
                      child: Text(
                    'Products will be listed here',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: Color(0xFF6600B7)),
                  ));
                }
                return ListView.builder(
                  itemCount: viewModel.products.length,
                  itemBuilder: (context, index) {
                    final productData = viewModel.products[index];
                    final product = Product(
                      title: productData['title'],
                      description: productData['description'],
                      image: productData['image_urls'][0],
                      price: productData['price'].toString(),
                      productId: productData['id'],
                    );
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductCard(product: product),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(home: SearchPage()),
  );
}
