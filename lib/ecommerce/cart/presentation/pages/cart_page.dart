import 'package:ecommerce/ecommerce/cart/data/models/cart_model.dart';
import 'package:ecommerce/ecommerce/cart/domain/use_cases/get_current_user_id.dart';
import 'package:ecommerce/ecommerce/cart/presentation/widgets/bottom_app.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../core/di/dependancy_injection.dart';
import '../widgets/cart_body.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final formKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var light = theme.brightness == Brightness.light;
    var uId = getIt<GetCurrentUserIdUseCase>().call();
    var valueListenable = Hive.box<CartModel>('cart_$uId').listenable();
    var lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        key: formKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            lang.cart,
          ),
        ),
        body: const CartBody(),
        bottomNavigationBar: BottomApp(
          valueListenable: valueListenable,
          light: light,
          lang: lang,
        ),
      ),
    );
  }
}
