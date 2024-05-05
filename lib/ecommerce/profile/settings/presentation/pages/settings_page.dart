import 'package:ecommerce/ecommerce/profile/settings/presentation/bloc/dark_theme_cubit.dart';
import 'package:ecommerce/ecommerce/translate/presentation/bloc/translate/translate_cubit.dart';
import 'package:ecommerce/ecommerce/translate/presentation/bloc/translate/translate_state.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          lang.settings,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  BlocBuilder<DarkThemeCubit, DarkThemeState>(
                    builder: (context, state) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SwitchListTile(
                          title: const Text(
                            'Dark Mode',
                            style: TextStyle(
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
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Language',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        BlocBuilder<LocalCubit, LocalState>(
                          builder: (context, state) {
                            String dropdownValue = 'en'; // Default value
                            if (state.language == 'en' ||
                                state.language == 'ar') {
                              dropdownValue = state.language;
                            }
                            return DropdownButton<String>(
                              value: dropdownValue,
                              style: const TextStyle(color: Colors.white),
                              dropdownColor: Colors.deepPurple,
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurple,
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                              items: ['ar', 'en'].map((String items) {
                                return DropdownMenuItem<String>(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  context
                                      .read<LocalCubit>()
                                      .changeLanguage(newValue);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: const Duration(seconds: 10),
                                      backgroundColor: Colors.deepPurple,
                                      content: Text(
                                        'Language Changed to $newValue , please remove item from cart and favorite and add it again to see the changes',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
