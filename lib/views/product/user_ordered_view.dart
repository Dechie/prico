import 'package:flutter/material.dart';
import 'package:pricecompare/services/user_order_service.dart';
import 'package:pricecompare/viewmodels/user_order_viewmodel.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(19),
            child: Container(
              width: 140,
              height: 175,
              child: Image.network(product.image, fit: BoxFit.cover),
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
        ],
      ),
    );
  }
}

class UserOrderedPage extends StatefulWidget {
  @override
  _UserOrderedPageState createState() => _UserOrderedPageState();
}

class _UserOrderedPageState extends State<UserOrderedPage> {
  late UserOrdersViewModel ordersViewModel;

  @override
  void initState() {
    super.initState();
    ordersViewModel = Provider.of<UserOrdersViewModel>(context, listen: false);
    ordersViewModel.fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EAFB),
      body: Consumer<UserOrdersViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (viewModel.errorMessage != null) {
            return Center(child: Text('Error: ${viewModel.errorMessage}'));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductCard(product: viewModel.products[index]),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: UserOrderedPage()),
  );
}
