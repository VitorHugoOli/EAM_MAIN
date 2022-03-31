import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF1F1F1),
      width: double.maxFinite,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Background', style: _getsubtitleStyle()),
            Text("""
            
            This project was created as a work for the Engenharia de Aprendizado de
            Máquina course of Universidade Federal de Viçosa. The main purpose was
            to study the potential of machine learning aplicate in real scenarios
            with a lot of data.
            """, style: _getNormalStyle()),
            Text('Proposal', style: _getsubtitleStyle()),
            Text("""
            
            Thereby, we create a machine learning model, based on 2 dataset captured
             at Earthdata, one of microplastics and other of ocean currents, to 
             predict the amount of microplastics that may be in some area of 
             the ocean.
             
             With this model we believe that scientists and ONGs can use this 
             information to improve ocean life. An make organizations to improve the clean of Oceans  
            """, style: _getNormalStyle()),
            Text('Limits', style: _getsubtitleStyle()),
            const Text("""
            
            
            The microplastics dataset was limited by the latitude, 
            so we just create predictions to the boundaries: (37.125°, -180.0°; -37.125°, 180.0°).

            The model was trained just within February and March.
            """),
          ],
        ),
      ),
    );
  }

  TextStyle _getsubtitleStyle() {
    return GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _getNormalStyle() {
    return GoogleFonts.poppins(
      fontSize: 16,
    );
  }
}
