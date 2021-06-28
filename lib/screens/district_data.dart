import 'package:corona_cases/backend/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DistrictWiseData extends StatefulWidget {
  DistrictWiseData({@required this.districtData});
  final List districtData;
  @override
  _DistrictWiseDataState createState() => _DistrictWiseDataState();
}

class _DistrictWiseDataState extends State<DistrictWiseData> {
  Future<List<DistrictData>> _getDistrictWiseData() async {
    Networking networking = Networking();
    var gotData = await networking.getStateWiseData();
    List<DistrictData> districtWiseData = [];
    for (var swd in gotData) {
      var districtDataKiList = swd['districtData'];
      for (var dwd in districtDataKiList) {
        DistrictData districtData = DistrictData(dwd['confirmed'], dwd['id']);
        districtWiseData.add(districtData);
      }
    }
    return districtWiseData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF110322),
        title: Text(
          'District Wise Data',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFF111328),
        child: FutureBuilder(
          future: _getDistrictWiseData(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return SpinKitFadingCube(
                color: Color(0xFFEB1555),
                size: 80.0,
              );
            } else {
              return SafeArea(
                child: ListView.builder(
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
                                TextSpan(text: 'Confirmed: '),
                                TextSpan(
                                  text: '${snapshot.data[index].confirmed}',
                                  style: TextStyle(color: Color(0xFFEB1555)),
                                ),
                              ],
                            ),
                          ),
                          title: Center(
                            child: Text(
                              snapshot.data[index].id,
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class DistrictData {
  String id;
  int confirmed;
  DistrictData(
    this.confirmed,
    this.id,
  );
}
