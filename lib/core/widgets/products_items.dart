import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/helpers/cache.dart';
import 'package:ecommerce/core/helpers/helper_methods.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/firebase_servies.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/core/widgets/cached_image.dart';
import 'package:ecommerce/ecommerce/favorites/data/models/favorites_entity.dart';
import 'package:ecommerce/ecommerce/favorites/presentation/bloc/add_favorite_cubit.dart';
import 'package:ecommerce/ecommerce/favorites/presentation/bloc/remove_favorites_cubit.dart';
import 'package:ecommerce/ecommerce/home/data/models/product.dart';
import 'package:ecommerce/ecommerce/products_by_categories/data/models/product.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductsItems extends StatefulWidget {
  const ProductsItems({
    super.key,
    required this.product,
    required this.language,
  });

  final Object product;
  final String language;

  @override
  State<ProductsItems> createState() => _ProductsItemsState();
}

class _ProductsItemsState extends State<ProductsItems> {
  bool isFavorite = false;
  final _prefs = getIt<SharedPreCacheHelper>();

  loadFavorite() async {
    final userId = getIt<AuthService>().getCurrentUserId();
    final productId = widget.product is HomeProductModel
        ? (widget.product as HomeProductModel).id
        : (widget.product as ProductsByCategoriesProductsModel).id;
    bool favorite =
        await _prefs.getData(key: 'favorite_${userId}_$productId') ?? false;
    setState(() {
      isFavorite = favorite;
    });
  }

  void toggleFavorite(FavoriteModel favoriteModel) async {
    var lang=S.of(context);
    final userId = getIt<AuthService>().getCurrentUserId();
    final productId = widget.product is HomeProductModel
        ? (widget.product as HomeProductModel).id
        : (widget.product as ProductsByCategoriesProductsModel).id;

    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      await _prefs.saveData(key: 'favorite_${userId}_$productId', value: true);
      context.read<AddFavoriteCubit>().addFavorites(
            favoriteModel,
          );
      HelperMethod.showSuccessToast(lang.added_to_favorite,
          gravity: ToastGravity.BOTTOM);
    } else {
      await _prefs.removeData(key: 'favorite_${userId}_$productId');
      context.read<RemoveFavoritesCubit>().removeFavorites(productId);
      HelperMethod.showErrorToast(lang.removed_from_favorite,
          gravity: ToastGravity.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var light = theme.brightness == Brightness.light;
    if (widget.product is ProductsByCategoriesProductsModel) {
      final categoryProduct =
          widget.product as ProductsByCategoriesProductsModel;
      return GestureDetector(
        onTap: () {
          Navigators.pushNamed(Routes.homeDetails, arguments: {
            'id': categoryProduct.id,
            'isFavorite': isFavorite,
            'name': categoryProduct.name,
            'price': categoryProduct.price,
            'image': categoryProduct.image,
            'discount': categoryProduct.discount,
            'description': categoryProduct.description,
            'language': widget.language,
          });
        },
        child: Stack(
          children: [
            Container(
              height: 220,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: light ? Colors.white : Colors.grey,
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
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: light ? Colors.black : Colors.white,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          categoryProduct.description,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            color: light ? Colors.black : Colors.white,
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
                                    onPressed: () {
                                      toggleFavorite(
                                        FavoriteModel(
                                          id: categoryProduct.id,
                                          price: categoryProduct.price,
                                          discount: categoryProduct.discount,
                                          image: categoryProduct.image,
                                          name: categoryProduct.name,
                                          description:
                                              categoryProduct.description,
                                          language: widget.language,
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: isFavorite
                                          ? Colors.red
                                          : light
                                              ? Colors.grey
                                              : Colors.white,
                                    ),
                                  );
                                } else {
                                  return IconButton(
                                    onPressed: () {
                                      toggleFavorite(
                                        FavoriteModel(
                                          id: categoryProduct.id,
                                          price: categoryProduct.price,
                                          discount: categoryProduct.discount,
                                          image: categoryProduct.image,
                                          name: categoryProduct.name,
                                          description:
                                              categoryProduct.description,
                                          language: widget.language,
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: isFavorite
                                          ? Colors.red
                                          : light
                                              ? Colors.grey
                                              : Colors.white,
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
            'name': homeProduct.name,
            'price': homeProduct.price,
            'image': homeProduct.image,
            'discount': homeProduct.discount,
            'description': homeProduct.description,
            'language': widget.language,
          });
        },
        child: Stack(
          children: [
            Container(
              height: 220,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: light ? Colors.white : Colors.grey,
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
                    child: CachedImage(
                      image: homeProduct.image,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          homeProduct.name,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: light ? Colors.black : Colors.white,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          homeProduct.description,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            color: light ? Colors.black : Colors.white,
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
                                    onPressed: () {
                                      toggleFavorite(
                                        FavoriteModel(
                                          id: homeProduct.id,
                                          price: homeProduct.price,
                                          discount: homeProduct.discount,
                                          image: homeProduct.image,
                                          name: homeProduct.name,
                                          description: homeProduct.description,
                                          language: widget.language,
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: isFavorite
                                          ? Colors.red
                                          : light
                                              ? Colors.grey
                                              : Colors.white,
                                    ),
                                  );
                                } else {
                                  return IconButton(
                                    onPressed: () {
                                      toggleFavorite(
                                        FavoriteModel(
                                          id: homeProduct.id,
                                          price: homeProduct.price,
                                          discount: homeProduct.discount,
                                          image: homeProduct.image,
                                          name: homeProduct.name,
                                          description: homeProduct.description,
                                          language: widget.language,
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: isFavorite
                                          ? Colors.red
                                          : light
                                              ? Colors.grey
                                              : Colors.white,
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
