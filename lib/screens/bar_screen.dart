import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/location.dart';
import '../providers/location_provider.dart';
import '../widgets/molecules/card_bar.dart';

class BarScreen extends StatefulWidget {
  const BarScreen({Key? key}) : super(key: key);

  @override
  _BarScreenState createState() => _BarScreenState();
}

class _BarScreenState extends State<BarScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Bar",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              _buildRecommend(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecommend() {
    return FutureBuilder<List<Location>>(
        future: LocationProvider().fetchLocations(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Location>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                    child: CardBar(),
                  );
                },
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              Location location = snapshot.data![index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                child: CardBar(location: location),
              );
            },
          );
        });
  }
}
