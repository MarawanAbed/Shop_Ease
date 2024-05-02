import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/helpers/cache.dart';
import 'package:ecommerce/core/helpers/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    id = arguments['id'] as int;
    isFavorite = arguments['isFavorite'] as bool;
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
                if (isFavorite) {
                  await prefs.saveData(key: 'favorite_$id', value: true);
                  HelperMethod.showSuccessToast('added to favorite',gravity: ToastGravity.BOTTOM);
                } else {
                  await prefs.removeData(key: 'favorite_$id');
                  HelperMethod.showErrorToast('removed from favorite',gravity: ToastGravity.BOTTOM);
                }
              },
              icon: Icon(
                Icons.favorite,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            ),
          ],
        ),
        body: HomeDetailsBody(id: id),
      ),
    );
  }
}
