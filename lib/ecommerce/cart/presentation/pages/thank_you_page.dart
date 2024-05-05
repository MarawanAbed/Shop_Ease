import 'package:ecommerce/core/assets/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ThankYouView extends StatefulWidget {
  const ThankYouView({super.key});

  @override
  State<ThankYouView> createState() => _ThankYouViewState();
}

class _ThankYouViewState extends State<ThankYouView> {
  late String total;

  @override
  void didChangeDependencies() {
    total=ModalRoute.of(context)!.settings.arguments as String;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Transform.translate(
          offset: const Offset(0, -16), child:  ThankYouViewBody(
        total: total
      )),
    );
  }
}

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key, required this.total});
  final String total;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
           ThankYouCard(
            total: total,
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            left: 20 + 8,
            right: 20 + 8,
            child: const CustomDashedLine(),
          ),
          Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          const Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        30,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              color: const Color(0xffB8B8B8),
              height: 2,
            ),
          ),
        ),
      ),
    );
  }
}

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key, required this.total,
  });

  final String total;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
        child: Column(
          children: [
            const Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            Text('Your transaction was successful',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.699999988079071),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                )),
            const SizedBox(
              height: 42,
            ),
             PaymentItemInfo(
              title: 'Date',
              value:  DateFormat('MM/dd/yyyy').format(DateTime.now()),
             ),
            const SizedBox(
              height: 20,
            ),
             PaymentItemInfo(
              title: 'Time',
               value: DateFormat('hh:mm a').format(DateTime.now()),
            ),
            const SizedBox(
              height: 20,
            ),
            const PaymentItemInfo(
              title: 'From',
              value: 'Marwan Store',
            ),
            const Divider(
              height: 60,
              thickness: 2,
            ),
            TotalPrice(title: 'Total', value: "\$"+total),
            const SizedBox(
              height: 30,
            ),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 64,
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1.50, color: Color(0xFF34A853)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF34A853),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: SvgPicture.asset(
              AppImages.visaCard,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 23,
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Visa Card ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'Mastercard **78',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.699999988079071),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.black.withOpacity(0.699999988079071),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        )
      ],
    );
  }
}

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        )
      ],
    );
  }
}

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Color(0xFFD9D9D9),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Color(0xff34A853),
        child: Icon(
          Icons.check,
          size: 50,
        ),
      ),
    );
  }
}

AppBar buildAppBar({final String? title}) {
  return AppBar(
    leading: Center(
      child: SvgPicture.asset(
        'assets/images/arrow.svg',
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        height: 0,
      ),
    ),
  );
}
