import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../screens/product_details_screen.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<dynamic> products = [];
  Color cardBackground = const Color(0xFFE5E3E3);
  Color priceFontColor = const Color(0xFF727273);

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://api.npoint.io/a907f54f4d95e9e31711'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      setState(() {
        products = jsonList;
      }); // Print the received API data
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: false,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsPage(product: product),
              ),
            );
          },
          child: Card(
            color: cardBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(20)),
              width: 200,
              height: 290,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    product['images'],
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 90,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product['title'],
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            product['price'],
                            style: GoogleFonts.openSans(
                                color: priceFontColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                            color: Colors.black,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: InkWell(
                              onTap: () => debugPrint("Add Button Clicked!"),
                              child: const Icon(
                                Icons.add_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      );
  }
}
