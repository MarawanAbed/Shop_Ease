import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/ecommerce/favorites/data/models/favorites_entity.dart';
import 'package:ecommerce/ecommerce/favorites/domain/use_cases/favorite_get_current_user.dart';
import 'package:ecommerce/ecommerce/favorites/presentation/widgets/favorites_items.dart';
import 'package:ecommerce/ecommerce/favorites/presentation/widgets/no_favorites.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

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
    var uId = getIt<FavoriteGetCurrentUserIdUseCase>().call();
    boxListenable = Hive.box<FavoriteModel>('favorite_$uId').listenable();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<FavoriteModel>>(
      valueListenable: boxListenable,
      builder: (context, box, _) {
        return box.isEmpty
            ? const NoFavorites()
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
                              language: favorite.language,
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
