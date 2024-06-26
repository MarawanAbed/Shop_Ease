import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/helpers/cache.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/core/widgets/cached_image.dart';
import 'package:ecommerce/ecommerce/favorites/data/models/favorites_entity.dart';
import 'package:ecommerce/ecommerce/favorites/domain/use_cases/favorite_get_current_user.dart';
import 'package:ecommerce/ecommerce/favorites/presentation/bloc/remove_favorites_cubit.dart';
import 'package:ecommerce/ecommerce/translate/presentation/bloc/translate/translate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesItems extends StatelessWidget {
  const FavoritesItems({super.key, required this.categoryProduct});

  final FavoriteModel categoryProduct;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var light = theme.brightness == Brightness.light;
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
          'language': context.read<LocalCubit>().state.language,
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
                          overflow: TextOverflow.ellipsis,
                          color: light ? Colors.black : Colors.white,
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
                            onPressed: () async {
                              final userId =
                                  getIt<FavoriteGetCurrentUserIdUseCase>()
                                      .call();
                              getIt<RemoveFavoritesCubit>()
                                  .removeFavorites(categoryProduct.id);
                              await getIt<SharedPreCacheHelper>().removeData(
                                  key:
                                      'favorite_${userId}_${categoryProduct.id}');
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
