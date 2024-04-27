import 'package:ecommerce/core/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeDetailsBody extends StatefulWidget {
  const HomeDetailsBody({super.key});

  @override
  State<HomeDetailsBody> createState() => _HomeDetailsBodyState();
}

class _HomeDetailsBodyState extends State<HomeDetailsBody> {

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.brown,
    Colors.grey,
    Colors.black,
    Colors.white,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/product.jpg',
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            children: [
              const Text(
                'Product Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  //counter
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('1'),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Product describiotn Product describiotn Product describiotn Product describiotn Product description',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Color:',
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                spacing: 5.0, // gap between adjacent chips
                runSpacing: 5.0, // gap between lines
                children: List<Widget>.generate(colors.length, (int index) {
                  return CircleAvatar(
                    backgroundColor: colors[index],
                    radius: 20, // adjust this value as needed
                    child: InkWell(
                      onTap: () {
                        // handle color selection
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Price: \$100',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomElevatedButton(
                title: '+ Add to Cart',
                onPressed: () {},
                width: 170.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
