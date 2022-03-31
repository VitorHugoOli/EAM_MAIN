import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mp_predictions/src/prediction/bloc.dart';

import '../../resources/mp_field_decoration.dart';

class Prediction extends StatelessWidget {
  Prediction({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final BlocPrediction _bloc = BlocPrediction();
  final PredictionModel prediction = PredictionModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xf1f1f1f1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Hello, let\'s predict the amount of microplastics in an ocean region:',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          Expanded(child: buildFields()),
                          const SizedBox(width: 20),
                          Expanded(child: buildResults())
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildFields() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildField(
                        'Enter the coordinates:',
                        'Latitude(-180 , 180)',
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          prediction.latitude = double.parse(value);
                        },
                      ),
                      const SizedBox(width: 20),
                      _buildField('', 'Longitude(-37 , 37)', validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Please enter a valid longitude';
                        }
                        return null;
                      }, onChanged: (value) {
                        prediction.longitude = double.parse(value);
                      }),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildField(
                            'Enter the speeds:',
                            'u',
                            validator: _getnumvalidate,
                            onChanged: (value) =>
                                prediction.u = double.parse(value),
                          ),
                          _buildField('', 'v',
                              validator: _getnumvalidate,
                              onChanged: (value) =>
                                  prediction.v = double.parse(value)),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildField('', 'ug',
                              validator: _getnumvalidate,
                              onChanged: (value) =>
                                  prediction.ug = double.parse(value)),
                          _buildField(
                            '',
                            'vg',
                            validator: _getnumvalidate,
                            onChanged: (value) =>
                                prediction.vg = double.parse(value),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  _buildField(
                    'Enter the amount of microplastic numbers:',
                    '123.40',
                    validator: _getnumvalidate,
                    onChanged: (value) =>
                        prediction.microplastic = double.parse(value),
                  ),
                  // const SizedBox(height: 30),
                  // _buildField(
                  //   'Enter the Date:',
                  //   'Data',
                  //   validator: _getValidatorDate,
                  //   onChanged: (value) =>
                  //       prediction.date = DateTime.parse(value),
                  // ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _bloc.sendPredictions(prediction);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff125c63),
                  ),
                  child: Text(
                    'Prever',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? _getValidatorDate(value) {
    if (value != null && value.isEmpty) {
      return 'Please enter some text';
    } else if (value != null &&
        !RegExp(r'^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$')
            .hasMatch(value)) {
      return 'Please enter a valid date';
    }

    return null;
  }

  String? _getnumvalidate(value) {
    if (value != null && value.isEmpty && double.tryParse(value) == null) {
      return 'Please enter some value';
    }
    return null;
  }

  _buildField(String label, String hint,
      {TextEditingController? controller,
      ValueChanged<String>? onChanged,
      FormFieldValidator<String>? validator}) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400, minWidth: 100),
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
              validator: validator,
              decoration: MPDecorationField(hintText: hint),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildResults() {
    return StreamBuilder<Result>(
        stream: _bloc.predictions,
        builder: (context, snapshot) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: _getChildResult(snapshot)),
          );
        });
  }

  _getChildResult(AsyncSnapshot<Result> snapshot) {
    if (snapshot.hasError) {
      return Text('Ow no! ${snapshot.error}',
          style:
              GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500));
    }
    if (snapshot.hasData) {
      return Text(
          "The value predict is: \n" +
              (snapshot.data?.mpMicroplastic?.toStringAsFixed(2) ?? ''),
          textAlign: TextAlign.center,
          style:
              GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500));
    }
    // if (snapshot.connectionState == ConnectionState.waiting) {
    //   return const Center(child: CircularProgressIndicator());
    // }
    return Text('Waiting for data...',
        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500));
  }
}
