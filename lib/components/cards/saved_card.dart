import 'package:flutter/material.dart';
import 'package:wishes_app/components/cards/default_card.dart';
import 'package:wishes_app/components/icons/card_icon.dart';
import 'package:wishes_app/utils/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedCard extends StatelessWidget {
  final int amount;

  SavedCard({Key key, this.amount = 400}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      height: 230.h,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: CardIcon(
              icon: Icons.star,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'You\'r Saving',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    '\$${this.amount.toString()}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                        fontSize: 32),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text('Every Month',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w300))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
