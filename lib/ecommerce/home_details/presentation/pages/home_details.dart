import 'package:flutter/material.dart';

import '../widgets/home_details_body.dart';


class HomeDetailsPage extends StatefulWidget {
  const HomeDetailsPage({super.key,});

  @override
  State<HomeDetailsPage> createState() => _HomeDetailsPageState();
}

class _HomeDetailsPageState extends State<HomeDetailsPage> {

  late int id;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    id = ModalRoute.of(context)?.settings.arguments as int;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          title: const Text('Product Details'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline_sharp),
            ),
          ],
        ),
        body:  HomeDetailsBody(id:id),
      ),
    );
  }
}

