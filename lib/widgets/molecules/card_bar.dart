import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../../models/location.dart';

class CardBar extends StatefulWidget {
  final Location? location;
  const CardBar({Key? key, this.location}) : super(key: key);

  @override
  _CardBarState createState() => _CardBarState();
}

class _CardBarState extends State<CardBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 25),
      decoration: BoxDecoration(
          color: AppColors.BG_EXAMPLE_COLOR,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.location?.firstName ?? ""),
              Text("Fav"),
            ],
          ),
          const SizedBox(height: 20),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.EXAMPLE_COLOR,
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Date: Monday - Sunday"),
                          Text("Time: 6: 00 am - 11:00 am"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("rate"),
                            Text("6 km"),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
