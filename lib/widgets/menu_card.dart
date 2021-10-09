import 'package:flutter/material.dart';
import 'package:foodsapp/models/menu.dart';
import 'package:foodsapp/screens/detail_screen.dart';
import 'package:foodsapp/theme.dart';

class MenuCard extends StatelessWidget {
  final Menu menu;
  const MenuCard(this.menu, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(menu.id, menu.image, menu.name,
                menu.price, menu.pricePromo, menu.note, menu.isPromo),
          ),
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                child: Container(
                  width: 130,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: Image.network(
                    menu.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  menu.isPromo
                      ? Image.asset(
                          'assets/promo.png',
                          width: 47,
                          height: 16,
                        )
                      : Image.asset(
                          'assets/terlaris.png',
                          width: 47,
                          height: 16,
                        ),
                  const SizedBox(height: 4),
                  Text(
                    menu.name,
                    style: poppinsTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        'Rp ${menu.price}',
                        style: poppinsTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: greyColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Rp ${menu.price}',
                        style: poppinsTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: yellowColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Free Delivery',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: greyColor,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
