import 'package:ecommerce/ecommerce/translate/presentation/bloc/translate/translate_cubit.dart';
import 'package:ecommerce/ecommerce/translate/presentation/bloc/translate/translate_state.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            lang.language,
            style: const TextStyle(
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
                    String languageCode = lang.language_changed
                        .replaceFirst('%s', newValue);

                    context
                        .read<LocalCubit>()
                        .changeLanguage(newValue);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 10),
                        backgroundColor: Colors.deepPurple,
                        content: Text(
                          languageCode,
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
    );
  }
}
