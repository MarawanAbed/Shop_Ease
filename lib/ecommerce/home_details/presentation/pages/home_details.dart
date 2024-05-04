import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/helpers/cache.dart';
import 'package:ecommerce/core/helpers/helper_methods.dart';
import 'package:ecommerce/core/services/firebase_servies.dart';
import 'package:ecommerce/ecommerce/favorites/presentation/bloc/add_favorite_cubit.dart';
import 'package:ecommerce/ecommerce/favorites/presentation/bloc/remove_favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../favorites/data/models/favorites_entity.dart';
import '../widgets/home_details_body.dart';

class HomeDetailsPage extends StatefulWidget {
  const HomeDetailsPage({
    super.key,
  });

  @override
  State<HomeDetailsPage> createState() => _HomeDetailsPageState();
}

class _HomeDetailsPageState extends State<HomeDetailsPage> {
  late int id;
  late bool isFavorite;
  late String name;
  late String image;
  late double price;
  late int discount;
  late String description;

  late String language;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    id = arguments['id'] as int;
    isFavorite = arguments['isFavorite'] as bool;
    name = arguments['name'] as String;
    image = arguments['image'] as String;
    price = arguments['price'] as double;
    discount = arguments['discount'] as int;
    description = arguments['description'] as String;
    language=arguments['language'] as String;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          title: const Text('Product Details'),
          actions: [
            IconButton(
              onPressed: () async {
                setState(() {
                  isFavorite = !isFavorite;
                });
                final prefs = getIt<SharedPreCacheHelper>();
                final userId=getIt<AuthService>().getCurrentUserId();
                if (isFavorite) {
                  await prefs.saveData(key: 'favorite_${userId}_$id', value: true);
                  HelperMethod.showSuccessToast('added to favorite',
                      gravity: ToastGravity.BOTTOM);
                  context.read<AddFavoriteCubit>().addFavorite(
                        FavoriteModel(
                          id: id,
                          price: price,
                          discount: discount,
                          image: image,
                          name: name,
                          description: description,
                        ),
                      );
                } else {
                  await prefs.removeData(key: 'favorite_${userId}_$id');
                  HelperMethod.showErrorToast('removed from favorite',
                      gravity: ToastGravity.BOTTOM);
                  context.read<RemoveFavoritesCubit>().removeFavorites(id);
                }
              },
              icon: Icon(
                Icons.favorite,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            ),
          ],
        ),
        body: HomeDetailsBody(id: id,language: language),
      ),
    );
  }
}
