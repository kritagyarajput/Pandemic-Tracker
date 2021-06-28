import 'package:corona_cases/backend/networking.dart';
import 'package:corona_cases/screens/state_wise.dart';
import 'package:corona_cases/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SecondNavigationScreen extends StatefulWidget {
  @override
  _SecondNavigationScreenState createState() => _SecondNavigationScreenState();
}

class _SecondNavigationScreenState extends State<SecondNavigationScreen> {
  _getStateWiseData() async {
    Networking networking = Networking();
    var gotData = await networking.getStateWiseData();
    List<StateWiseData> stateWiseData = [];
    var data = gotData['state_wise'];
    data.forEach((key, element) {
      StateWiseData swd = StateWiseData(
          active: int.parse(element['active']),
          confirmed: int.parse(element['confirmed']),
          deaths: int.parse(element['deaths']),
          recovered: int.parse(element['recovered']),
          state: element['state'],
          todayConfirmed: int.parse(element['deltaconfirmed']),
          todayDeaths: int.parse(element['deltadeaths']),
          todayRecovered: int.parse(element['deltarecovered']));
      stateWiseData.add(swd);
    });
    return stateWiseData;
  }

  List states = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getStateWiseData(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return SpinKitFadingCube(
            color: Color(0xFFEB1555),
            size: 80.0,
          );
        } else {
          return SafeArea(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      color: Color(0xFF1D1E33),
                    ),
                    child: ListTile(
                      subtitle: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white54,
                          ),
                          children: [
                            TextSpan(text: 'Active: '),
                            TextSpan(
                              text: '${snapshot.data[index].active}',
                              style: TextStyle(color: Color(0xFFEB1555)),
                            ),
                          ],
                        ),
                      ),
                      title: Center(
                        child: Text(
                          snapshot.data[index].state,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return DetailPage(snapshot.data[index]);
                          }),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
