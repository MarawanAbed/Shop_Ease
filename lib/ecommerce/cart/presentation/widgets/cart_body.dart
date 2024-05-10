import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/services/firebase_servies.dart';
import 'package:ecommerce/core/widgets/cached_image.dart';
import 'package:ecommerce/ecommerce/cart/data/models/cart_model.dart';
import 'package:ecommerce/ecommerce/cart/presentation/bloc/remove_cart_cubit.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  late ValueListenable<Box<CartModel>> valueListenable;

  @override
  void initState() {
    var uId = getIt<AuthService>().getCurrentUserId();
    valueListenable = Hive.box<CartModel>('cart_$uId').listenable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang=S.of(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ValueListenableBuilder<Box<CartModel>>(
        valueListenable: valueListenable,
        builder: (context, box, _) {
          return box.isEmpty
              ?  Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shopping_cart,
                        size: 100,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        lang.no_items_in_cart,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final cartModel = box.getAt(index) as CartModel;
                    return CartItems(
                      index: index,
                      cartModel: cartModel,
                    );
                  },
                );
        },
      ),
    );
  }
}

class CartItems extends StatefulWidget {
  const CartItems({super.key, required this.cartModel, required this.index});

  final CartModel cartModel;
  final int index;

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  late int counter;

  @override
  void initState() {
    counter = widget.cartModel.quantity;
    super.initState();
  }

  void updateQuantity(int newQuantity) async {
    var uId = getIt<AuthService>().getCurrentUserId();
    var box = Hive.box<CartModel>('cart_$uId');
    widget.cartModel.quantity = newQuantity;
    print(widget.cartModel.quantity);
    await box.putAt(widget.index, widget.cartModel);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var light = theme.brightness == Brightness.light;
    return Container(
      height: 210,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: light ? Colors.white : Colors.grey[800],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CachedImage(
                    image: widget.cartModel.image,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.cartModel.name,
                        maxLines: 4,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            "\$ ${(widget.cartModel.price * counter).toInt()}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  counter++;
                                  updateQuantity(counter);
                                },
                                icon: Icon(
                                  Icons.add,
                                  color:
                                      light ? Colors.deepPurple : Colors.white,
                                ),
                              ),
                              Text(
                                '$counter',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: light ? Colors.grey : Colors.white,
                                ),
                              ),
                              counter > 1
                                  ? IconButton(
                                      onPressed: () async {
                                        counter--;
                                        updateQuantity(counter);
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        color: light
                                            ? Colors.deepPurple
                                            : Colors.white,
                                      ),
                                    )
                                  : IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color:
                                            light ? Colors.grey : Colors.white,
                                      ),
                                      onPressed: () {
                                        context
                                            .read<RemoveCartCubit>()
                                            .removeCart(widget.cartModel.id);
                                      },
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
