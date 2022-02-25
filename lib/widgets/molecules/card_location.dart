import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/location.dart';

class CardLocation extends StatelessWidget {
  const CardLocation(
      {Key? key, this.paramStr, this.location
        ,required this.isLoading
      })
      : super(key: key);
  final String? paramStr;
  final Location? location;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: SizedBox(
            width: 300,
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        " Picture ",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(location?.firstName ?? "",
                              style: (const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold))),
                          const Text("Bar and Bistro",
                              style: (TextStyle(fontSize: 10))),
                        ],
                      ),
                      const Text("12/02/2565",
                          style: (TextStyle(fontSize: 10))),
                    ],
                  ),
                )
              ],
            )),
      );
    }
    else {
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          alignment: Alignment.centerLeft,
          height: 200, // card height
          child: Shimmer.fromColors(
              baseColor: Color(0xFFEBEBF4),
              highlightColor: Color(0xFFF4F4F4),
              child: Container(
                  width: 300,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey[400]!,
                  ))),
        ),
      );
    }
  }
}
