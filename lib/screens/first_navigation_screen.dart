import 'package:covi_tracker/backend/constants.dart';
import 'package:covi_tracker/backend/networking.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstNavigationScreen extends StatefulWidget {
  @override
  _FirstNavigationScreenState createState() => _FirstNavigationScreenState();
}

class _FirstNavigationScreenState extends State<FirstNavigationScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  String totalCases = '';
  String totalDeaths = '';
  String totalRecovered = '';
  String active = '';
  String todaysCases = '';
  int activeChanges;
  int totalChanges;
  int deathChanges;
  int recoveredChanges;
  double pieActive;
  double pieRecovered;
  double pieDeaths;
  double pietotal;
  double radius = 60;
  bool touched = false;
  void getData() async {
    Networking networking = Networking();
    var gotData = await networking.getData();
    int todaysCasesData = gotData['data']['timeline'][0]['new_confirmed'];
    int tC = gotData['data']['timeline'][0]['confirmed'];
    int tD = gotData['data']['timeline'][0]['deaths'];
    int tR = gotData['data']['timeline'][0]['recovered'];
    int a = gotData['data']['timeline'][0]['active'];
    int ac = gotData['data']['timeline'][0]['new_confirmed'];
    int tchanges = gotData['data']['timeline'][0]['new_confirmed'];
    int dc = gotData['data']['timeline'][0]['new_deaths'];
    int rc = gotData['data']['timeline'][0]['new_recovered'];
    setState(() {
      todaysCases = todaysCasesData.toString();
      totalCases = tC.toString();
      totalDeaths = tD.toString();
      totalRecovered = tR.toString();
      active = a.toString();
      activeChanges = ac;
      totalChanges = tchanges;
      deathChanges = dc;
      recoveredChanges = rc;
      pieActive = a.toDouble();
      pieRecovered = tR.toDouble();
      pieDeaths = tD.toDouble();
      pietotal = tC.toDouble();
      pieActive = (pieActive / pietotal) * 100;
      pieRecovered = (pieRecovered / pietotal) * 100;
      pieDeaths = (pieDeaths / pietotal) * 100;
      pieActive = double.parse(pieActive.toStringAsFixed(2));
      pieRecovered = double.parse(pieRecovered.toStringAsFixed(2));
      pieDeaths = double.parse(pieDeaths.toStringAsFixed(2));
    });
  }

  _launchURL() async {
    const url = 'https://selfregistration.cowin.gov.in/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (totalCases == '' &&
        totalRecovered == '' &&
        totalDeaths == '' &&
        active == '') {
      return Center(
        child: SpinKitFadingCube(
          color: Color(0xFFEB1555),
          size: 80.0,
        ),
      );
    } else {
      return SafeArea(
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1.6,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFF111328),
                    child: Row(
                      children: [
                        PieChart(
                          PieChartData(
                            pieTouchData: PieTouchData(
                                enabled: touched,
                                touchCallback: (PieTouchResponse p) {}),
                            centerSpaceRadius: 45.0,
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sections: [
                              PieChartSectionData(
                                radius: radius,
                                showTitle: false,
                                value: pieActive,
                                color: Color(0xFFEB1555),
                              ),
                              PieChartSectionData(
                                radius: radius,
                                showTitle: false,
                                value: pieRecovered,
                                color: Colors.green,
                              ),
                              PieChartSectionData(
                                radius: radius,
                                showTitle: false,
                                value: pieDeaths,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 10,
                                        width: 10,
                                        color: Color(0xFFEB1555),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        'Active',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 10,
                                        width: 10,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        'Recovered',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 10,
                                        width: 10,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        'Deaths',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                  ),
                                  Text(
                                    'Percentage',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Color(0xFFEB1555),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      'Active:$pieActive%',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      'Recovered:$pieRecovered%',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      'Deaths:$pieDeaths%',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ReusableCard(
                  cases: todaysCases,
                  message: 'Today\'s Cases',
                ),
                ReusableCard(
                  cases: recoveredChanges.toString(),
                  message: 'Today\'s Recoveries',
                ),
                ReusableCard(
                  cases: deathChanges.toString(),
                  message: 'Today\'s Deaths',
                ),
                ReusableCard(
                  cases: active,
                  message: 'Active Cases',
                ),
                ReusableCard(
                  cases: totalCases,
                  message: 'Total Cases',
                ),
                ReusableCard(
                  cases: totalDeaths,
                  message: 'Total Deaths',
                ),
                ReusableCard(
                  cases: totalRecovered,
                  message: 'Total Recovered',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have you got vaccinated yet?',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      color: Color(0xFF1D1E33),
                      onPressed: _launchURL,
                      child: Text(
                        'Get Vaccinated',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // Container(
                //   height: MediaQuery.of(context).size.height * 1.5,
                //   child: StaggeredGridView(
                //     scrollDirection: Axis.vertical,
                //     shrinkWrap: true,
                //     gridDelegate:
                //         SliverStaggeredGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2,
                //       staggeredTileBuilder: (int index) =>
                //           new StaggeredTile.count(1, index.isEven ? 3 : 2),
                //       // mainAxisSpacing: 8.0,
                //       // crossAxisSpacing: 2.0,
                //     ),
                //     children: [
                //       ReusableCard(
                //         cases: todaysCases,
                //         message: 'TODAY CASES',
                //       ),
                //       ReusableCard(
                //         cases: recoveredChanges.toString(),
                //         message: 'TODAY RECOVERED',
                //       ),
                //       ReusableCard(
                //         cases: deathChanges.toString(),
                //         message: 'TODAY DEATHS',
                //       ),
                //       ReusableCard(
                //         cases: active,
                //         message: 'ACTIVE CASES',
                //       ),
                //       ReusableCard(
                //         cases: totalCases,
                //         message: 'TOTAL CASES',
                //       ),
                //       ReusableCard(
                //         cases: totalDeaths,
                //         message: 'DEATHS',
                //       ),
                //       ReusableCard(
                //         cases: totalRecovered,
                //         message: 'RECOVERED',
                //       ),
                //     ],
                //   ),
                // )
              ],
            )),
      );
    }
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.cases, @required this.message, this.change});
  final String cases;
  final String message;
  final int change;
  final RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  final Function mathFunc = (Match match) => '${match[1]},';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: Color(0xFF1D1E33),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    message,
                    style: kMainTextStyle,
                  ),
                ),
                Divider(
                  indent: 50.0,
                  endIndent: 50.0,
                  thickness: 3.0,
                  height: 30.0,
                  color: Color(0xFFEB1555),
                ),
                Text(
                  cases.replaceAllMapped(reg, mathFunc),
                  style: kMainNumberTextStyle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// SafeArea(
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ReusableCard(
//                 cases: active,
//                 message: 'ACTIVE CASES',
//                 change: activeChanges,
//               ),
//               ReusableCard(
//                 cases: totalCases,
//                 message: 'TOTAL CASES',
//                 change: totalChanges,
//               ),
//               ReusableCard(
//                 cases: totalRecovered,
//                 message: 'RECOVERED',
//                 change: recoveredChanges,
//               ),
//               ReusableCard(
//                 cases: totalDeaths,
//                 message: 'DEATHS',
//                 change: deathChanges,
//               ),
//             ],
//           ),
//         ),
//       );
