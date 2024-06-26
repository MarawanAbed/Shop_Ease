import 'package:ecommerce/ecommerce/profile/my_account/presentation/bloc/get_single_user_cubit.dart';
import 'package:ecommerce/ecommerce/profile/my_account/presentation/widgets/user_data_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'change_profile_image.dart';

class MyAccountBlocBuilder extends StatelessWidget {
  const MyAccountBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var lang=S.of(context);
    return BlocBuilder<GetSingleUserCubit, GetSingleUserState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Loaded || current is Error,
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: Expanded(child: CircularProgressIndicator())),
          loading: () => const Center(child: Expanded(child: CircularProgressIndicator())),
          loaded: (user) {
            var cubit = context.read<GetSingleUserCubit>();
            cubit.myAccountModel = user;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ChangeProfileImage(
                    image: user.image ??
                        'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
                    viewOnly: true,
                  ),
                ),
                 Text(
                  lang.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                UserDataItems(
                  text: user.name,
                ),
                const SizedBox(height: 16),
                 Text(
                  lang.email,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                UserDataItems(
                  text: user.email,
                ),
                const SizedBox(height: 16),
                 Text(
                  lang.password,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                UserDataItems(
                  text: user.password,
                ),
                const SizedBox(height: 16),
                 Text(
                  lang.phone,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                UserDataItems(
                  text: user.phone,
                ),
                const SizedBox(height: 16),
                 Text(
                  lang.address,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                UserDataItems(
                  text: user.address,
                ),
                const SizedBox(height: 40),
              ],
            );
          },
          error: (message) => Text(message),
        );
      },
    );
  }
}

