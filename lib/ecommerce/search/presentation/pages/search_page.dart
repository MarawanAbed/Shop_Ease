import 'package:ecommerce/core/widgets/app_text_form.dart';
import 'package:ecommerce/ecommerce/search/presentation/bloc/search_cubit.dart';
import 'package:ecommerce/ecommerce/search/presentation/widgets/search_bloc_builder.dart';
import 'package:ecommerce/ecommerce/translate/presentation/bloc/translate/translate_cubit.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;
  late String language;
  @override
  void initState() {
    _searchController = TextEditingController();
    language=context.read<LocalCubit>().state.language;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var light = theme.brightness == Brightness.light;
    var lang=S.of(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title:  Text(lang.search_products),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                AppTextFormField(
                  controller: _searchController,
                  hintText: lang.search_products,
                  hintStyle:  TextStyle(color: light? Colors.black:Colors.white),
                  inputTextStyle:  TextStyle(color: light? Colors.black:Colors.white),
                  suffixIcon: const Icon(Icons.search,size: 30,),
                  onEditingComplete: () {
                    context
                        .read<SearchCubit>()
                        .searchProducts(_searchController.text,language);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                 SearchBlocBuilder(
                  language: language,
                ),
              ],
            ),
          )),
    );
  }
}
