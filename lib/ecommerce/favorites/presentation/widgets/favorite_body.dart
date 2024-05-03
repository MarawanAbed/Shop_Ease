import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/helpers/cache.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/firebase_servies.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/ecommerce/favorites/data/models/favorites_entity.dart';
import 'package:ecommerce/ecommerce/favorites/presentation/bloc/remove_favorites_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../core/widgets/cached_image.dart';

class FavoriteBody extends StatefulWidget {
  const FavoriteBody({super.key});

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody> {
  late ValueListenable<Box<FavoriteModel>> boxListenable;

  @override
  void initState() {
    super.initState();
    var uId = getIt<AuthService>().getCurrentUserId();
    boxListenable = Hive.box<FavoriteModel>(uId!).listenable();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<FavoriteModel>>(
      valueListenable: boxListenable,
      builder: (context, box, _) {
        return box.isEmpty
            ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    size: 100,
                    color: Colors.red,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'No Favorites Yet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          var favorite = box.getAt(index);
                          return FavoritesItems(
                            categoryProduct: FavoriteModel(
                              id: favorite!.id,
                              name: favorite.name,
                              price: favorite.price,
                              image: favorite.image,
                              description: favorite.description,
                              discount: favorite.discount,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: box.length,
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }
}

class FavoritesItems extends StatelessWidget {
  const FavoritesItems({super.key, required this.categoryProduct});

  final FavoriteModel categoryProduct;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigators.pushNamed(Routes.homeDetails, arguments: {
          'id': categoryProduct.id,
          'isFavorite': true,
          'name': categoryProduct.name,
          'image': categoryProduct.image,
          'price': categoryProduct.price,
          'discount': categoryProduct.discount,
          'description': categoryProduct.description,
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
                          IconButton(
                            onPressed: () async{
                              final userId = getIt<AuthService>().getCurrentUserId();
                              getIt<RemoveFavoritesCubit>()
                                  .removeFavorites(categoryProduct.id);
                              await getIt<SharedPreCacheHelper>().removeData(
                                  key: 'favorite_${userId}_${categoryProduct.id}');
                            },
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          )
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
  }
}
