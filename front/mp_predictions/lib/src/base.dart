import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mp_predictions/src/about/about.dart';
import 'package:mp_predictions/src/references/ref.dart';

import 'prediction/prediction.dart';

class Base extends StatelessWidget {
  final path = Uri.base.fragment;


  final Map textos = {
    "/": ['Prediction', "Microplastics\nPrediction","pred.png", Prediction()],
    '/about': ['About', "About","about.jpg", const About()],
    '/ref': ['References', "References","ref.jpg", const References()],
  };

  Base({Key? key}) : super(key: key);

  TextStyle _textFont(String? key) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: path == key ? FontWeight.w600 : FontWeight.w400,
      ),
    );
  }

  static get _titleFont => GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 75,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            fit: StackFit.loose,
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    constraints: BoxConstraints.expand(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.35,
                    ),
                    child: Image.asset("assets/${textos[path][2]}", fit: BoxFit.cover),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 25),
                    child: Text(
                      textos[path]?[1] ?? "",
                      style: _titleFont,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: textos.keys.map((key) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '$key');
                        },
                        child: Text(
                          textos[key][0],
                          style: _textFont(key),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: textos[path]?[3] ?? Container(),
            ),
          ),
        ],
      ),
    );
  }
}
