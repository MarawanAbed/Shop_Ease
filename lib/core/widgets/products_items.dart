import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/helpers/cache.dart';
import 'package:ecommerce/core/helpers/helper_methods.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/core/widgets/cached_image.dart';
import 'package:ecommerce/ecommerce/home/data/models/product.dart';
import 'package:ecommerce/ecommerce/products_by_categories/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductsItems extends StatefulWidget {
  const ProductsItems({
    super.key,
    required this.product,
  });

  final Object product;

  @override
  State<ProductsItems> createState() => _ProductsItemsState();
}

class _ProductsItemsState extends State<ProductsItems> {
  bool isFavorite = false;
  final _prefs = getIt<SharedPreCacheHelper>();

  loadFavorite() async {
    final productId = widget.product is HomeProductModel
        ? (widget.product as HomeProductModel).id
        : (widget.product as ProductsByCategoriesProductsModel).id;
    bool favorite = await _prefs.getData(key: 'favorite_$productId') ?? false;
    setState(() {
      isFavorite = favorite;
    });
  }

  void toggleFavorite() async {
    final productId = widget.product is HomeProductModel
        ? (widget.product as HomeProductModel).id
        : (widget.product as ProductsByCategoriesProductsModel).id;

    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      await _prefs.saveData(key: 'favorite_$productId', value: true);
      HelperMethod.showSuccessToast('Added to favorite',
          gravity: ToastGravity.BOTTOM);
    } else {
      await _prefs.removeData(key: 'favorite_$productId');
      HelperMethod.showErrorToast('Removed from favorite',
          gravity: ToastGravity.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.product is ProductsByCategoriesProductsModel) {
      final categoryProduct =
          widget.product as ProductsByCategoriesProductsModel;
      return GestureDetector(
        onTap: () {
          Navigators.pushNamed(Routes.homeDetails, arguments: {
            'id': categoryProduct.id,
            'isFavorite': isFavorite,
          });
        },
        child: Stack(
          children: [
            Container(
              height: 210,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CachedImage(image: categoryProduct.image),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categoryProduct.name,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          categoryProduct.description,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${categoryProduct.price.toInt()}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            FutureBuilder(
                              future: loadFavorite(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return IconButton(
                                    onPressed: toggleFavorite,
                                    icon: Icon(
                                      Icons.favorite,
                                      color:
                                          isFavorite ? Colors.red : Colors.grey,
                                    ),
                                  );
                                } else {
                                  return IconButton(
                                    onPressed: toggleFavorite,
                                    icon: Icon(
                                      Icons.favorite,
                                      color:
                                          isFavorite ? Colors.red : Colors.grey,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (categoryProduct.discount != 0)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    '${categoryProduct.discount}%',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    } else if (widget.product is HomeProductModel) {
      final homeProduct = widget.product as HomeProductModel;
      return GestureDetector(
        onTap: () {
          Navigators.pushNamed(Routes.homeDetails, arguments: {
            'id': homeProduct.id,
            'isFavorite': isFavorite,
          });        },
        child: Stack(
          children: [
            Container(
              height: 210,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CachedImage(image: homeProduct.image),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          homeProduct.name,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          homeProduct.description,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${homeProduct.price.toInt()}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            FutureBuilder(
                              future: loadFavorite(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return IconButton(
                                    onPressed: toggleFavorite,
                                    icon: Icon(
                                      Icons.favorite,
                                      color:
                                          isFavorite ? Colors.red : Colors.grey,
                                    ),
                                  );
                                } else {
                                  return IconButton(
                                    onPressed: toggleFavorite,
                                    icon: Icon(
                                      Icons.favorite,
                                      color:
                                          isFavorite ? Colors.red : Colors.grey,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (homeProduct.discount != 0)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    '${homeProduct.discount}%',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    }
    return const SizedBox();
  }
}
