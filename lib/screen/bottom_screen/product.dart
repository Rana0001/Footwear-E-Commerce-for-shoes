import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footwear/app/constants.dart';
import 'package:footwear/components/customer_scaffold.dart';
import 'package:footwear/components/list_tile_with_out_of_stock.dart';
import 'package:footwear/model/product_model.dart';
import 'package:footwear/repository/category_repo.dart';
import 'package:footwear/repository/product_repo.dart';
import 'package:footwear/screen/product_details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  /// toggle value of show search

  bool _isOutOfStock = false;
  int chipIndex = 0;

  /// Currently selected tab index
  int _selectedTabIndex = 0;

  /// Tab titles
  final List<String> _tabNames = [
    'All Products',
    'Male',
    'Female',
    'Casual',
    "Sport"
  ];

  _showProduct(int index) {
    if (_selectedTabIndex == 0) {
      return allProduct();
    } else if (_selectedTabIndex == 1) {
      return allMale();
    } else if (_selectedTabIndex == 2) {
      return allFemale();
    } else if (_selectedTabIndex == 3) {
      return allCasual();
    } else if (_selectedTabIndex == 4) {
      return allSport();
    } else {
      return allProduct();
    }
  }

  /* <-------- Initial state --------> */
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          children: [
            Text('All Products',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            Text('List of products',
                style: GoogleFonts.poppins(
                    fontSize: 12, color: Colors.black.withOpacity(0.5))),
          ],
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        /* <---- Cart item list ----> */
        child: CustomScrollView(
          slivers: [
            // Top extra spaces
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 15,
            )),
            const SliverToBoxAdapter(),
            /* <---- Product category button row ----> */
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _tabNames.map((tabName) {
                      final index = _tabNames.indexOf(tabName);
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: TextButton(
                            onPressed: () =>
                                setState(() => _selectedTabIndex = index),
                            style: TextButton.styleFrom(
                                foregroundColor: _selectedTabIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                elevation: 10,
                                shadowColor: _selectedTabIndex == index
                                    ? HexColor("ffb301").withOpacity(0.25)
                                    : Colors.black.withOpacity(0.05),
                                backgroundColor: _selectedTabIndex == index
                                    ? HexColor("ffb301")
                                    : Colors.white,
                                padding: EdgeInsets.symmetric(
                                    vertical: 9,
                                    horizontal:
                                        _selectedTabIndex == index ? 24 : 20),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)))),
                            child: Text(
                              tabName,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            )),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            /* <---- Product list ----> */
            _showProduct(_selectedTabIndex),
            // Bottom extra spaces
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 30,
            )),
          ],
        ),
      ),
      /* <-------- Floating right side button --------> */
    );
  }

  FutureBuilder<List<Product>?> allProduct() {
    return FutureBuilder(
        future: ProductRepositoryImp().getAllProduct(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
          return SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              final product = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ProductListTileWithOutOfStock(
                    isOutOfStock: _isOutOfStock,
                    productImage: NetworkImage(
                        Constant.userImageUrl + product.images![0]),
                    productName: product.title!,
                    productItemNumber: product.items!,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  ProductDetail(product: product))));
                    },
                    outOfStockGestureOnTap: () {},
                    outOfStockToggleOnTap: (value) {
                      setState(() {
                        _isOutOfStock = value;
                      });
                    }),
              );
            },
            childCount: snapshot.data!.length,
          ));
        });
  }

  FutureBuilder<List<Product>?> allFemale() {
    return FutureBuilder(
        future: CategoryRepositoryImp().getAllFemaleProduct(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
          return SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              final product = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ProductListTileWithOutOfStock(
                    isOutOfStock: _isOutOfStock,
                    productImage: NetworkImage(
                        Constant.userImageUrl + product.images![0]),
                    productName: product.title!,
                    productItemNumber: product.items!,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  ProductDetail(product: product))));
                    },
                    outOfStockGestureOnTap: () {},
                    outOfStockToggleOnTap: (value) {
                      setState(() {
                        _isOutOfStock = value;
                      });
                    }),
              );
            },
            childCount: snapshot.data!.length,
          ));
        });
  }

  FutureBuilder<List<Product>?> allCasual() {
    return FutureBuilder(
        future: CategoryRepositoryImp().getAllCasual(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
          return SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              final product = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ProductListTileWithOutOfStock(
                    isOutOfStock: _isOutOfStock,
                    productImage: NetworkImage(
                        Constant.userImageUrl + product.images![0]),
                    productName: product.title!,
                    productItemNumber: product.items!,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  ProductDetail(product: product))));
                    },
                    outOfStockGestureOnTap: () {},
                    outOfStockToggleOnTap: (value) {
                      setState(() {
                        _isOutOfStock = value;
                      });
                    }),
              );
            },
            childCount: snapshot.data!.length,
          ));
        });
  }

  FutureBuilder<List<Product>?> allSport() {
    return FutureBuilder(
        future: CategoryRepositoryImp().getAllSport(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
          return SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              final product = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ProductListTileWithOutOfStock(
                    isOutOfStock: _isOutOfStock,
                    productImage: NetworkImage(
                        Constant.userImageUrl + product.images![0]),
                    productName: product.title!,
                    productItemNumber: product.items!,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  ProductDetail(product: product))));
                    },
                    outOfStockGestureOnTap: () {},
                    outOfStockToggleOnTap: (value) {
                      setState(() {
                        _isOutOfStock = value;
                      });
                    }),
              );
            },
            childCount: snapshot.data!.length,
          ));
        });
  }

  FutureBuilder<List<Product>?> allMale() {
    return FutureBuilder(
        future: CategoryRepositoryImp().getAllMaleProduct(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
          return SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              final product = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ProductListTileWithOutOfStock(
                    isOutOfStock: _isOutOfStock,
                    productImage: NetworkImage(
                        Constant.userImageUrl + product.images![0]),
                    productName: product.title!,
                    productItemNumber: product.items!,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  ProductDetail(product: product))));
                    },
                    outOfStockGestureOnTap: () {},
                    outOfStockToggleOnTap: (value) {
                      setState(() {
                        _isOutOfStock = value;
                      });
                    }),
              );
            },
            childCount: snapshot.data!.length,
          ));
        });
  }
}
