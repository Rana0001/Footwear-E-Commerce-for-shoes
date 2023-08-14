import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footwear/app/constants.dart';
import 'package:footwear/components/card_item.dart';
import 'package:footwear/repository/product_repo.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListPage extends StatelessWidget {
  String? brandName;
  ProductListPage({super.key, this.brandName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          children: [
            Text('List of Product',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            Text(brandName!,
                style: GoogleFonts.poppins(
                    fontSize: 12, color: Colors.black.withOpacity(0.7))),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset('assets/icons/Arrow-left.svg'),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (brandName == 'Jordan') ...{
                FutureBuilder(
                    future: ProductRepositoryImp().getAllJordanProduct(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: List.generate(
                              snapshot.data!.length,
                              (index) {
                                
                                return ItemCard(
                                  product: snapshot.data![index],
                                );
                              },
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              } else if (brandName == 'Adidas') ...{
                FutureBuilder(
                    future: ProductRepositoryImp().getAllAdidasProduct(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: List.generate(
                              snapshot.data!.length,
                              (index) => ItemCard(
                                product: snapshot.data![index],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              } else if (brandName == "Nike") ...{
                FutureBuilder(
                    future: ProductRepositoryImp().getAllNikeProduct(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: List.generate(
                              snapshot.data!.length,
                              (index) => ItemCard(
                                product: snapshot.data![index],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              } else ...{
                const CircularProgressIndicator()
              }
            ],
          ),
        ),
      ),
    );
  }
}
