import 'package:ecommerce/ecommerce/auth/login/presentation/bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/widgets/custom_text_navigator.dart';
import '../../../../../generated/l10n.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.routes,
  });

  final String title;
  final String subTitle;
  final String routes;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    var lang = S.of(context);
    return Column(
      children: [
        CustomMultiTextNavigator(
          title: title,
          subTitle: subTitle,
          routes: routes,
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        Text(
          lang.or,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                cubit.signInWithGoogle();
              },
              icon: const Icon(FontAwesomeIcons.google),
              color: Colors.red,
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                cubit.signInWithTwitter();
              },
              icon: const Icon(FontAwesomeIcons.twitter),
              color: Colors.blue,
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                cubit.signInWithGitHub(context);
              },
              icon: const Icon(FontAwesomeIcons.github),
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}
