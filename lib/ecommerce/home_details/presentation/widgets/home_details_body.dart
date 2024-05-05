import 'package:ecommerce/ecommerce/home_details/presentation/bloc/product_details_cubit.dart';
import 'package:ecommerce/ecommerce/home_details/presentation/widgets/product_details_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDetailsBody extends StatefulWidget {
  const HomeDetailsBody({super.key, required this.id, required this.language});

  final int id;
  final String language;

  @override
  State<HomeDetailsBody> createState() => _HomeDetailsBodyState();
}

class _HomeDetailsBodyState extends State<HomeDetailsBody> {
  @override
  void initState() {
    context.read<ProductDetailsCubit>().getProductDetails(widget.id, widget.language);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ProductDetailsBlocBuilder(
              language: widget.language,
            ),
          ),
        ],
      ),
    );
  }
}
