import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pricecompare/views/product/product_details_view.dart';
import 'package:pricecompare/viewmodels/product_viewmodel.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String price;
  final int productId; 

  CustomCard({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.productId, 
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsView(productId: productId.toString()),
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
                  child: Image.network(imagePath, fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5.0),
                height: 23,
                width: double.infinity,
                child: Text(
                  title,
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
                  description,
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
                  price,
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
      ),
    );
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
              fontSize: 18,
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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final List<String> categorySlugs = [
    "animals-pet-supplies",
    "arts-entertainment",
    "baby-toddler",
    "business-industrial",
    "cameras-optics",
    "clothing-accessories",
    "electronics",
    "food-beverages-tobacco",
    "furniture",
    "hardware",
    "health-beauty",
    "home-garden",
    "luggage-bags",
    "mature",
    "media",
    "office-supplies",
    "religious-ceremonial",
    "software",
    "sporting-goods",
    "toys-games",
    "vehicles-parts"
  ];

  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<ProductViewModel>(context, listen: false);
    viewModel.fetchProductsForCategories(categorySlugs);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProductViewModel>(context);

    return Scaffold(
  backgroundColor: Color(0xFFF5EAFB),
  body: viewModel.isLoading
      ? Center(child: CircularProgressIndicator())
      : viewModel.errorMessage.isNotEmpty
          ? Center(child: Text(viewModel.errorMessage,
                  style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Color(0xFF6600B7)
                              ),
          ))
          : ListView(
              children: categorySlugs.map((slug) {
                final products = viewModel.categoryProducts[slug] ?? [];
                return products.isNotEmpty
                    ? CategorySection(
                        categoryTitle: slug.replaceAll("-", " ").toUpperCase(),
                        cards: products.map((product) {
                          return CustomCard(
                            imagePath: product.imageUrl,
                            title: product.title,
                            description: product.description,
                            price: '${product.price.toStringAsFixed(2)} ETB',
                            productId: product.productId,
                          );
                        }).toList(),
                      )
                    : Container();
              }).toList(),
            ),
);

  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
