import 'package:ecommerce/ecommerce/home/presentation/bloc/banner_cubit.dart';
import 'package:ecommerce/ecommerce/home/presentation/widgets/banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerBlocBuilder extends StatelessWidget {
  const BannerBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit, BannerState>(
      buildWhen: (previous, current) {
        if(previous is Loaded && current is Loaded){
          return previous.banners != current.banners;
        }
        return false;
      },
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (banners)=> BannerLogo(
            banners: banners,
          ),
          error: (message) => Center(
            child: Text(message),
          ),
        );
      },
    );
  }
}
