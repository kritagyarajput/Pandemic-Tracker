import 'package:covi_tracker/backend/constants.dart';
import 'package:covi_tracker/screens/district_data.dart';
import 'package:covi_tracker/screens/state_wise.dart';
import 'package:flutter/material.dart';
import 'package:expandable_group/expandable_group_widget.dart';

class DetailPage extends StatefulWidget {
  final StateWiseData stateWiseData;
  DetailPage(this.stateWiseData);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  final Function mathFunc = (Match match) => '${match[1]},';
  List<Item> districtData = [];
  generateListOfDistrictdata() {
    widget.stateWiseData.districtData.forEach(
      (key, value) {
        Item item = Item(
          headerValue: key,
          expandedValue: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white54,
                  ),
                  children: [
                    TextSpan(text: 'Today\'s Cases: '),
                    TextSpan(
                      text: '${value['delta']['confirmed']}'
                          .replaceAllMapped(reg, mathFunc),
                      style: TextStyle(color: Color(0xFFEB1555)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white54,
                  ),
                  children: [
                    TextSpan(text: 'Today\'s Recovered: '),
                    TextSpan(
                      text: '${value['delta']['recovered']}'
                          .replaceAllMapped(reg, mathFunc),
                      style: TextStyle(color: Color(0xFFEB1555)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white54,
                  ),
                  children: [
                    TextSpan(text: 'Today\'s Deaths: '),
                    TextSpan(
                      text: '${value['delta']['deceased']}'
                          .replaceAllMapped(reg, mathFunc),
                      style: TextStyle(color: Color(0xFFEB1555)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white54,
                  ),
                  children: [
                    TextSpan(text: 'Total Active: '),
                    TextSpan(
                      text:
                          '${value['active']}'.replaceAllMapped(reg, mathFunc),
                      style: TextStyle(color: Color(0xFFEB1555)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white54,
                  ),
                  children: [
                    TextSpan(text: 'Total Recovered: '),
                    TextSpan(
                      text: '${value['recovered']}'
                          .replaceAllMapped(reg, mathFunc),
                      style: TextStyle(color: Color(0xFFEB1555)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white54,
                  ),
                  children: [
                    TextSpan(text: 'Total Deaths: '),
                    TextSpan(
                      text: '${value['deceased']}'
                          .replaceAllMapped(reg, mathFunc),
                      style: TextStyle(color: Color(0xFFEB1555)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white54,
                  ),
                  children: [
                    TextSpan(text: 'Total Cases: '),
                    TextSpan(
                      text: '${value['confirmed']}'
                          .replaceAllMapped(reg, mathFunc),
                      style: TextStyle(color: Color(0xFFEB1555)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
        key != 'Other State' ? districtData.add(item) : null;
      },
    );
    return districtData;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateListOfDistrictdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF110322),
        centerTitle: true,
        title: Text(
          widget.stateWiseData.state,
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
                        "Today\'s Confirmed",
                        style: kMainTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        '${widget.stateWiseData.todayConfirmed}'
                            .replaceAllMapped(reg, mathFunc),
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
                        "Today\'s Deaths",
                        style: kMainTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        '${widget.stateWiseData.todayDeaths}'
                            .replaceAllMapped(reg, mathFunc),
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
                        "Today\'s Recovered",
                        style: kMainTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        '${widget.stateWiseData.todayRecovered}'
                            .replaceAllMapped(reg, mathFunc),
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
                        '${widget.stateWiseData.active}'
                            .replaceAllMapped(reg, mathFunc),
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
                        '${widget.stateWiseData.confirmed}'
                            .replaceAllMapped(reg, mathFunc),
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
                        '${widget.stateWiseData.recovered}'
                            .replaceAllMapped(reg, mathFunc),
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
                        "Total Deaths",
                        style: kMainTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        '${widget.stateWiseData.deaths}'
                            .replaceAllMapped(reg, mathFunc),
                        style: kMainNumberTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 200),
                        elevation: 3,
                        expansionCallback: (int index, bool isExpanded) {
                          setState(() {
                            districtData[index].isExpanded = !isExpanded;
                          });
                        },
                        children: districtData.map<ExpansionPanel>((Item item) {
                          return ExpansionPanel(
                              canTapOnHeader: true,
                              backgroundColor: Color(0xFF1D1E35),
                              isExpanded: item.isExpanded,
                              headerBuilder: (context, isExpanded) {
                                return Center(
                                  child: Text(
                                    item.headerValue,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                );
                              },
                              body: Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: item.expandedValue,
                              ));
                        }).toList(),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  Widget expandedValue;
  String headerValue;
  bool isExpanded;
}
