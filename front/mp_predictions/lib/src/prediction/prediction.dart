import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/mp_field_decoration.dart';

class Predicition extends StatelessWidget {
  const Predicition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTopImage(0),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Olá, vamos prever a quantidade de microplasticos em uma região do oceando:',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                Flexible(fit: FlexFit.loose, child: buildFields()),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildFields() {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildField('Entre com as coordenadas:', 'Latitude'),
              const SizedBox(width: 20),
              buildField('', 'Longitude'),
            ],
          ),
          const SizedBox(height: 40),
          buildField('Entre com a Data:', 'Data'),
        ],
      ),
    );
  }

  buildField(String label, String hint,
      {TextEditingController? controller, ValueChanged<String>? onChanged}) {
    return SizedBox(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            label,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            fit: FlexFit.loose,
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              decoration: MPDecorationField(hintText: hint),
            ),
          ),
        ],
      ),
    );
  }

  Stack buildTopImage(int index) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Image.asset("assets/back.png"),
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Prediction",
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight:
                          index == 0 ? FontWeight.w500 : FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "About",
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight:
                          index == 1 ? FontWeight.w500 : FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "References",
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight:
                          index == 2 ? FontWeight.w500 : FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Text(
                "Microplastics\nPrediction",
                style: GoogleFonts.poppins(
                  fontSize: 75,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
