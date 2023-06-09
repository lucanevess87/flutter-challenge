import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/stores/marketplace_store.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/fonts.dart';
import 'package:get_it/get_it.dart';

class Product extends StatelessWidget {
  const Product(
      {super.key,
      required this.name,
      required this.price,
      required this.coverImage,
      required this.deliveryFree,
      required this.id,
      required this.description});

  final String id;
  final String name;
  final String price;
  final String coverImage;
  final bool deliveryFree;
  final String description;

  @override
  Widget build(BuildContext context) {
    final MarketPlaceStore _marketplaceStore = GetIt.I.get<MarketPlaceStore>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: InkWell(
        onTap: () {
          _marketplaceStore.changeView(false);
          _marketplaceStore.setSelectedProduct(id);
        },
        child: Container(
          width: 200,
          height: 90,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: CustomColors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: CustomColors.grey.withOpacity(0.4)),
          ),
          child: Row(children: [
            Image.network(coverImage),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(name,
                        style: Fonts.headline5.copyWith(
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("$price", style: Fonts.headline4),
                        deliveryFree
                            ? Container(
                                width: 100,
                                height: 22,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: CustomColors.darkPurple,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text("Entrega grátis",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: CustomColors.black)),
                              )
                            : Container()
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
