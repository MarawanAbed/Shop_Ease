import 'package:ecommerce/core/widgets/app_text_form.dart';
import 'package:ecommerce/ecommerce/search/presentation/bloc/search_cubit.dart';
import 'package:ecommerce/ecommerce/search/presentation/widgets/search_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: const Text('Search Products'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                AppTextFormField(
                  controller: _searchController,
                  hintText: 'Search Products',
                  hintStyle: const TextStyle(color: Colors.black),
                  inputTextStyle: const TextStyle(color: Colors.black),
                  suffixIcon: const Icon(Icons.search),
                  onEditingComplete: () {
                    context
                        .read<SearchCubit>()
                        .searchProducts(_searchController.text);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const SearchBlocBuilder(),
              ],
            ),
          )),
    );
  }
}
