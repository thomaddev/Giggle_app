import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:giggle_app/models/location.dart';
import 'package:http/http.dart' as http;

import '../models/location.dart';
import '../providers/location_provider.dart';
import '../widgets/molecules/card_location.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
              child: Column(children: [
                carousalImage(),
                const SizedBox(height: 20),
                _buildPopular(),
                _buildEvent(),
                _buildRecommend(),
                _buildNearBy(),
              ])),
        );
  }

  Widget carousalImage() {
    return CarouselSlider(
      options: CarouselOptions(viewportFraction: 1),
      items: imgList
          .map((item) => Center(
          child: Image.network(item, fit: BoxFit.cover, width: 1000)))
          .toList(),
    );
  }

  Widget _buildPopular() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text("Popular", style: TextStyle(fontSize: 25)),
      FutureBuilder<List<Location>>(
          future: LocationProvider().fetchLocations(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Location>> snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return SizedBox(
                height: 228, // card height
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CardLocation(isLoading: true);
                  },
                ),
              );
            }
            return SizedBox(
              height: 228, // card height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  Location location = snapshot.data![index];
                  return CardLocation(location: location, isLoading: false);
                },
              ),
            );
          }),
    ]);
  }

  Widget _buildEvent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text("Events Today", style: TextStyle(fontSize: 25)),
      FutureBuilder<List<Location>>(
          future: LocationProvider().fetchLocations(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Location>> snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return SizedBox(
                height: 228, // card height
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CardLocation(isLoading: true);
                  },
                ),
              );
            }
            return SizedBox(
              height: 228, // card height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  Location location = snapshot.data![index];
                  return CardLocation(location: location, isLoading: false);
                },
              ),
            );
          }),
    ]);
  }

  Widget _buildRecommend() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text("Recommend by Giggle", style: TextStyle(fontSize: 25)),
      FutureBuilder<List<Location>>(
          future: LocationProvider().fetchLocations(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Location>> snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return SizedBox(
                height: 228, // card height
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CardLocation(isLoading: true);
                  },
                ),
              );
            }
            return SizedBox(
              height: 228, // card height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  Location location = snapshot.data![index];
                  return CardLocation(location: location, isLoading: false);
                },
              ),
            );
          }),
    ]);
  }

  Widget _buildNearBy() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text("Near by", style: TextStyle(fontSize: 25)),
      FutureBuilder<List<Location>>(
          future: LocationProvider().fetchLocations(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Location>> snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return SizedBox(
                height: 228, // card height
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CardLocation(isLoading: true);
                  },
                ),
              );
            }
            return SizedBox(
              height: 228, // card height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  Location location = snapshot.data![index];
                  return CardLocation(location: location, isLoading: false);
                },
              ),
            );
          }),
    ]);
  }
}
