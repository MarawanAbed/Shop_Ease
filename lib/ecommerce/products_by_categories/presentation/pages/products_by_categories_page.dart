import 'package:ecommerce/ecommerce/products_by_categories/presentation/widgets/products_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products_by_categories_cubit.dart';

class ProductsByCategoriesPage extends StatefulWidget {
  const ProductsByCategoriesPage({super.key});

  @override
  State<ProductsByCategoriesPage> createState() =>
      _ProductsByCategoriesPageState();
}

class _ProductsByCategoriesPageState extends State<ProductsByCategoriesPage> {
  late int id;
  late String name;
  late String language;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    id = arguments['id'] as int;
    name = arguments['name'] as String;
    language=arguments['language'] as String;
    context.read<ProductsByCategoriesCubit>().getProductsByCategories(id,language);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text(name),
          elevation: 0,
        ),
        body:  Padding(
          padding: EdgeInsets.all(20),
          child: ProductsBLocBuilder(
            language: language,
          ),
        ),
      ),
    );
  }
}
