import 'package:ecommerce/ecommerce/home_details/presentation/bloc/product_details_cubit.dart';
import 'package:ecommerce/ecommerce/home_details/presentation/widgets/product_details_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDetailsBody extends StatefulWidget {
  const HomeDetailsBody({super.key, required this.id});

  final int id;

  @override
  State<HomeDetailsBody> createState() => _HomeDetailsBodyState();
}

class _HomeDetailsBodyState extends State<HomeDetailsBody> {
  @override
  void initState() {
    context.read<ProductDetailsCubit>().getProductDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ProductDetailsBlocBuilder(),
          ),
        ],
      ),
    );
  }
}
