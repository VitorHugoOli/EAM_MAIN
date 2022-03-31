import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

class PredictionModel {
  double? latitude;
  double? longitude;
  DateTime? date;
  double? microplastic;
  double? u;
  double? v;
  double? ug;
  double? vg;

  PredictionModel({
    this.latitude,
    this.longitude,
    this.date,
    this.microplastic,
    this.u,
    this.v,
    this.ug,
    this.vg,
  });

//  toJson
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'date': date?.toIso8601String(),
      'microplastic': microplastic,
      'u': u,
      'v': v,
      'ug': ug,
      'vg': vg,
    };
  }
}

class Result {
  double? mpMicroplastic;

  Result({
    this.mpMicroplastic,
  });

  fromJson(Map<String, dynamic> json) {
    mpMicroplastic = double.parse(json['mp_microplastic']);
  }
}

class BlocPrediction {
  final StreamController<Result> _predictionsController =
      StreamController<Result>();

  Stream<Result> get predictions => _predictionsController.stream;

  Future<void> sendPredictions(PredictionModel e) async {
    final Response response = await http.post(
      Uri.parse('http://20.62.163.32:5000/prediction'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(e.toJson()),
    );

    if (response.statusCode == 200) {
      final result = Result();
      result.fromJson(json.decode(response.body));
      _predictionsController.add(result);
    } else {
      _predictionsController.addError(
        Exception('Error getting predictions'),
      );
    }

  }



}
