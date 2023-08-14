import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footwear/components/explore_card.dart';
import 'package:footwear/model/product_model.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorerScreen extends StatefulWidget {
  List<Product>? lstProduct;
  ExplorerScreen({super.key, this.lstProduct});
  static const routeName = '/explorer';
  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen> {
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
            Text('Explore',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            widget.lstProduct!.isNotEmpty
                ? Text('Products',
                    style: GoogleFonts.poppins(
                        fontSize: 12, color: Colors.black.withOpacity(0.7)))
                : Text('Empty',
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
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                childAspectRatio: 1 / 1,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(widget.lstProduct!.length, (index) {
                  return ExploreCardWidget(data: widget.lstProduct![index]);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
