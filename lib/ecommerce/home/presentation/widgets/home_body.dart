import 'package:ecommerce/ecommerce/home/presentation/bloc/categories_cubit.dart';
import 'package:ecommerce/ecommerce/home/presentation/widgets/banner_bloc_builder.dart';
import 'package:ecommerce/ecommerce/home/presentation/widgets/product_bloc_builder.dart';
import 'package:ecommerce/ecommerce/translate/presentation/bloc/translate/translate_cubit.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/product_by_categories_cubit.dart';
import 'categories_bloc_builder.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late String language;

  @override
  void initState() {
    language = context.read<LocalCubit>().state.language;
    context.read<CategoriesCubit>().getCategories(language);
    context.read<ProductByCategoriesCubit>().getProductByCategories(language);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var light = theme.brightness == Brightness.light;
    var lang=S.of(context);
    return PopScope(
      canPop: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0,top: 10),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BannerBlocBuilder(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    lang.categories,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: light ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CategoriesBlocBuilder(
                    language: language,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    lang.new_products,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: light ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ProductBlocBuilder(
                    language: language,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
