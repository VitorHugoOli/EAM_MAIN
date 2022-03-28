import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mp_predictions/main.dart';

class Alert {
  BuildContext? context;
  final String mensg;
  bool boolean;

  Alert(this.mensg,
      {this.context, this.boolean = false, bool autoStart = true}) {
    context ??= navigatorKey.currentContext;
    if (autoStart) dialog();
  }

  Future<dynamic> dialog() {
    return showDialog(
      context: context!,
      builder: (context) => AlertDialog(
        content: Container(
          width: 400,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                mensg,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff222614),
                ),
              ),
              const SizedBox(height: 18),
              boolean
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Create a ElevatedButton
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text(
                            'OK',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff222614),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff222614),
                            ),
                          ),
                        ),
                      ],
                    )
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Fechar',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff222614),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
