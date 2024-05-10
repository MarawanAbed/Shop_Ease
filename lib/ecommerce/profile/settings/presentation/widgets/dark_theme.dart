import 'package:ecommerce/ecommerce/profile/settings/presentation/bloc/dark_theme_cubit.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DarkTheme extends StatelessWidget {
  const DarkTheme({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return BlocBuilder<DarkThemeCubit, DarkThemeState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SwitchListTile(
            title: Text(
              lang.dark_mode,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            value: state.isDark,
            activeTrackColor: Colors.white,
            onChanged: (bool value) async {
              context.read<DarkThemeCubit>().changeTheme(value);
            },
            activeColor: Colors.deepPurple,
          ),
        );
      },
    );
  }
}
