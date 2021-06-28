import 'package:corona_cases/backend/constants.dart';
import 'package:corona_cases/screens/district_data.dart';
import 'package:corona_cases/screens/state_wise.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final StateWiseData stateWiseData;
  DetailPage(this.stateWiseData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF110322),
        centerTitle: true,
        title: Text(
          stateWiseData.state,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: Color(0xFF111328),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                color: Color(0xFF1D1E33),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Center(
                      child: Text(
                        "Today Confirmed",
                        style: kMainTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        '${stateWiseData.todayConfirmed}',
                        style: kMainNumberTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      indent: 50.0,
                      endIndent: 50.0,
                      thickness: 3.0,
                      height: 60.0,
                      color: Color(0xFFEB1555),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text(
                        "Today Deaths",
                        style: kMainTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        '${stateWiseData.todayDeaths}',
                        style: kMainNumberTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      indent: 50.0,
                      endIndent: 50.0,
                      thickness: 3.0,
                      height: 60.0,
                      color: Color(0xFFEB1555),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text(
                        "Today Recovered",
                        style: kMainTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        '${stateWiseData.todayRecovered}',
                        style: kMainNumberTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      indent: 50.0,
                      endIndent: 50.0,
                      thickness: 3.0,
                      height: 60.0,
                      color: Color(0xFFEB1555),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text(
                        "Active Cases",
                        style: kMainTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        '${stateWiseData.active}',
                        style: kMainNumberTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      indent: 50.0,
                      endIndent: 50.0,
                      thickness: 3.0,
                      height: 60.0,
                      color: Color(0xFFEB1555),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text(
                        "Total Confirmed",
                        style: kMainTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        '${stateWiseData.confirmed}',
                        style: kMainNumberTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      indent: 50.0,
                      endIndent: 50.0,
                      thickness: 3.0,
                      height: 60.0,
                      color: Color(0xFFEB1555),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text(
                        "Total Recovered",
                        style: kMainTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        '${stateWiseData.recovered}',
                        style: kMainNumberTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      indent: 50.0,
                      endIndent: 50.0,
                      thickness: 3.0,
                      height: 60.0,
                      color: Color(0xFFEB1555),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text(
                        "Deaths",
                        style: kMainTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        '${stateWiseData.deaths}',
                        style: kMainNumberTextStyle,
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
