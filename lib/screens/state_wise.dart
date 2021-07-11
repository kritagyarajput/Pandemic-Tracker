import 'package:flutter/material.dart';

class StateWiseData {
  String state;
  int active;
  int confirmed;
  int recovered;
  int deaths;
  int todayConfirmed;
  int todayRecovered;
  int todayDeaths;
  Map<String, dynamic> districtData;
  StateWiseData(
      {this.active,
      this.confirmed,
      this.deaths,
      this.recovered,
      this.state,
      this.todayConfirmed,
      this.todayDeaths,
      this.todayRecovered,
      this.districtData});
}
