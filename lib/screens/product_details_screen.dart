import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:manula_perera_flutter_interview/components/animated_image.dart';
import '../components/features_widget.dart';


class ProductDetailsPage extends StatelessWidget {
  final dynamic product;

  const ProductDetailsPage({super.key, required this.product});

  final Color desFontColor = const Color(0xFF4C4C4D);

  final Color priceFontColor = const Color(0xFF727273);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            //----- Navigate back when the back button is pressed
            Navigator.pop(context);
          },
          icon: const Icon(
            Ionicons.arrow_back_outline,
            color: Colors.white,
            weight: 700,
            size: 27,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Ionicons.bag_handle_outline,
              color: Colors.white,
              weight: 700,
              size: 27,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg3.png"),
                fit: BoxFit.contain,
              ),
            ),
            height: MediaQuery.of(context).size.height * .35,
            padding: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            child: Transform.scale(
              scale: .80,
              child: AnimatedMovingImage(
                imagePath: NetworkImage(product['images'],),
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 40, right: 14, left: 14),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product['title'],
                                      style: GoogleFonts.openSans(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.star_border_purple500_rounded,
                                          color: Colors.orange,
                                          size: 30,
                                        ),
                                        const Icon(
                                          Icons.star_border_purple500_rounded,
                                          color: Colors.orange,
                                          size: 30,
                                        ),
                                        const Icon(
                                          Icons.star_border_purple500_rounded,
                                          color: Colors.orange,
                                          size: 30,
                                        ),
                                        const Icon(
                                          Icons.star_border_purple500_rounded,
                                          color: Colors.orange,
                                          size: 30,
                                        ),
                                        const Icon(
                                          Icons.star_border_purple500_rounded,
                                          color: Colors.orange,
                                          size: 30,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            '5 ',
                                            style: GoogleFonts.openSans(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            '(28 Reviews)',
                                            style: GoogleFonts.openSans(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                product['price'],
                                style: GoogleFonts.openSans(
                                    fontSize: 17,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            product['description'],
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black54,
                                //   color: Colors.black,

                                fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                FeaturesWidget(
                                  icon: Icons.remove_red_eye_outlined,
                                  text: "Improved Optics",
                                ),
                                FeaturesWidget(
                                  icon: Icons.wb_sunny_outlined,
                                  text: "Clear Brightness",
                                ),
                                FeaturesWidget(
                                  icon: Icons.wifi_outlined,
                                  text: "Wifi Controllers",
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 250,
                                height: 60,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Checkout',
                                    style: GoogleFonts.openSans(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
