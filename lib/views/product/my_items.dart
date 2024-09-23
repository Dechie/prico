import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:pricecompare/viewmodels/vendor_products_viewmodel.dart';
import 'package:pricecompare/views/product/product_add_dialog.dart';
import 'package:pricecompare/viewmodels/product_add_viewmodel.dart';
import 'package:pricecompare/services/vendor_product_service.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onDelete;

  ProductCard({required this.product, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(19),
            child: Container(
              width: 130,
              height: 175,
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Text('Image not available'));
                },
              ),
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
    );
  }
}

// Main Page that displays products
class MyItemsPage extends StatefulWidget {
  @override
  _MyItemsPageState createState() => _MyItemsPageState();
}

class _MyItemsPageState extends State<MyItemsPage> {
  final AddProductViewModel _addProductViewModel = AddProductViewModel();

  @override
  void initState() {
    super.initState();
    Provider.of<VendorProductViewModel>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EAFB),
      body: Consumer<VendorProductViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (viewModel.errorMessage.isNotEmpty) {
            return Center(child: Text(viewModel.errorMessage));
          } else if (viewModel.products.isEmpty) {
            return Center(child: Text('No products available'));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.products.length,
                  itemBuilder: (context, index) {
                    var product = viewModel.products[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductCard(
                        product: product,
                        onDelete: () {
                          Provider.of<VendorProductViewModel>(context,
                                  listen: false)
                              .deleteProduct(product.productId);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ProductAddDialog(viewModel: _addProductViewModel);
            },
          );
        },
        child: HeroIcon(HeroIcons.plus, style: HeroIconStyle.solid),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(home: MyItemsPage()),
  );
}
