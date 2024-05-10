import 'package:ecommerce/ecommerce/cart/presentation/widgets/custom_app_bar.dart';
import 'package:ecommerce/ecommerce/cart/presentation/widgets/thank_view_body.dart';
import 'package:flutter/material.dart';

class ThankYouView extends StatefulWidget {
  const ThankYouView({super.key});

  @override
  State<ThankYouView> createState() => _ThankYouViewState();
}

class _ThankYouViewState extends State<ThankYouView> {
  String total = '100';

  @override
  void didChangeDependencies() {
    total = ModalRoute.of(context)!.settings.arguments as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomAppBar(),
      ),
      body: Transform.translate(
        offset: const Offset(0, -16),
        child: ThankYouViewBody(total: total),
      ),
    );
  }
}
