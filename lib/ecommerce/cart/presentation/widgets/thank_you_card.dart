import 'package:ecommerce/ecommerce/cart/presentation/widgets/card_info.dart';
import 'package:ecommerce/ecommerce/cart/presentation/widgets/payment_item_info.dart';
import 'package:ecommerce/ecommerce/cart/presentation/widgets/total_price.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
    required this.total,
  });

  final String total;

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                lang.thank_you,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Text(lang.transaction_successful,
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
                title: lang.date,
                value: DateFormat('MM/dd/yyyy').format(DateTime.now()),
              ),
              const SizedBox(
                height: 20,
              ),
              PaymentItemInfo(
                title: lang.time,
                value: DateFormat('hh:mm a').format(DateTime.now()),
              ),
              const SizedBox(
                height: 20,
              ),
              PaymentItemInfo(
                title: lang.from,
                value: lang.marwan_store,
              ),
              const Divider(
                height: 60,
                thickness: 2,
              ),
              TotalPrice(title: lang.total, value: "\$" + total),
              const SizedBox(
                height: 30,
              ),
              const CardInfoWidget(),
              const SizedBox(
                height: 20,
              ),
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
                    child: Center(
                      child: Text(
                        lang.paid,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF34A853),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
