import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/stores/marketplace_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/store/components/bottom_navbar.dart';
import 'dart:math' as math;

import 'package:loomi_flutter_boilerplate/src/presentation/views/store/components/product.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/fonts.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.id});

  final int id;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final MarketPlaceStore _marketplaceStore = GetIt.I.get<MarketPlaceStore>();
  late PageController _pageController;
  late int initialPage =
      _marketplaceStore.storeList.indexWhere((item) => item.id == widget.id);

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(viewportFraction: 0.9, initialPage: initialPage);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                CustomColors.brandPurple.withOpacity(0.25),
                CustomColors.lightGrey
              ],
              center: Alignment.center,
              radius: 0.7,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BackButton(
                    color: CustomColors.black,
                    onPressed: () {
                      _marketplaceStore.changeView(true);
                    },
                  ),
                  Text(
                    "Opções de tintas",
                    style: Fonts.headline3.copyWith(
                      color: CustomColors.black,
                    ),
                  ),
                  const SizedBox(width: 32.0),
                ],
              ),
              AspectRatio(
                aspectRatio: 0.85,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      initialPage = value;
                    });
                  },
                  controller: _pageController,
                  physics: const ClampingScrollPhysics(),
                  itemCount: _marketplaceStore.storeList.length,
                  itemBuilder: (context, index) => buildSlider(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSlider(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            final page = _pageController.page;
            value = index - page!;
            value = (value * 0.038).clamp(-1, 1);
          }
          return Detail(product: _marketplaceStore.storeList[index]);
        },
      );
}

class Detail extends StatelessWidget {
  const Detail({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final MarketPlaceStore _marketplaceStore = GetIt.I.get<MarketPlaceStore>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 40, bottom: 20),
                child: Text(product.name, style: Fonts.headline2),
              ),
              Container(
                width: 340,
                height: 200,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: CustomColors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: CustomColors.grey.withOpacity(0.4)),
                ),
                child: Image.network(
                    "https://casatoni.vteximg.com.br/arquivos/ids/161038-1000-1000/Tinta-Latex-PVA-Suvinil-Classica-Premium-Fosco-900ml.jpg?v=637279390174000000"),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 160,
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: CustomColors.grey.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0),
                          ),
                        ),
                        child: Text(
                          "Como pintar",
                          style: Fonts.headline5.copyWith(
                              color: CustomColors.lightGrey,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 160,
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: CustomColors.grey.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                          ),
                        ),
                        child: Text(
                          "Tirar dúvidas",
                          style: Fonts.headline5.copyWith(
                              color: CustomColors.lightGrey,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 340,
                height: 80,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: CustomColors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: CustomColors.grey.withOpacity(0.4),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Diferenciais",
                      style: Fonts.headline5.copyWith(
                          color: CustomColors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}