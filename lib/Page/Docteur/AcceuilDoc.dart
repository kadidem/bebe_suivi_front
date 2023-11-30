import 'package:bebe_suivi/Page/header.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AcceuilDoc extends StatefulWidget {
  const AcceuilDoc({super.key});

  @override
  State<AcceuilDoc> createState() => _AcceuilDocState();
}

class _AcceuilDocState extends State<AcceuilDoc> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Stack(children: [
      Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Header(),
          ),
          const Text(
            'Bonjour Docteur Mohamed ',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
              height: 300,
              child: ListView(children: [
                CarouselSlider(
                  items: [
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Image.asset('assets/image/slider.png'),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Image.asset('assets/image/slider1.png'),
                    ),
                    Container(
                      height: 200,
                      width: 150,
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Image.asset(
                        'assets/image/slider2.png',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Image.asset('assets/image/slider4.png'),
                    ),
                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    // height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ])),
          const Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
              ),
              Text(
                'Mes Rendez-vous ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                'Mes patients',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/image/rdvdoc.png'),
              const SizedBox(
                width: 10,
              ),
              Image.asset('assets/image/patientdoc.png'),
            ],
          ),
        ],
      ),
    ]))));
  }
}
