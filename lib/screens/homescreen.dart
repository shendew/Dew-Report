import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Map>? data;

  Future<Map> fetchAlbum() async {
    final response = await http.get(
        Uri.parse('https://hpb.health.gov.lk/api/get-current-statistical'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: fetchAlbum(),
          builder: (BuildContext context, AsyncSnapshot<Object> data) {
            if (data.hasData) {
              final Map dd = data.data as Map;
              return Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFF86D980),
                  Color(0xFF2FBE24)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, top: 10),
                              child: Icon(
                                Icons.menu,
                                color: Color(0xFF008300),
                                size: 35,
                              ),
                            ),
                          ),
                          Text(
                            "Covid-19",
                            style: TextStyle(fontSize: 48, fontFamily: "Jaro"),
                          ),
                          Text(
                            "Outbreak",
                            style: TextStyle(fontSize: 36, fontFamily: "Jaro"),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 5, right: 5, top: 35),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE3BB4B),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(60))),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                            dd['data']['local_total_cases']
                                                .toString(),
                                            style: TextStyle(
                                                fontFamily: "Jaro",
                                                fontSize: 36,
                                                height: 0.7,
                                                color: Colors.white)),
                                        Text("Cases",
                                            style: TextStyle(
                                                fontFamily: "Jaro",
                                                fontSize: 20)),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(children: [
                                  Transform.translate(
                                    offset: Offset(0, -30),
                                    child: Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFED5E5E),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(60))),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                                dd['data']['local_deaths']
                                                    .toString(),
                                                style: TextStyle(
                                                    fontFamily: "Jaro",
                                                    fontSize: 36,
                                                    height: 0.7,
                                                    color: Colors.white)),
                                            Text("Deaths",
                                                style: TextStyle(
                                                    fontFamily: "Jaro",
                                                    fontSize: 20)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                        fontFamily: "Jaro", fontSize: 40),
                                  )
                                ]),
                                Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF61C661),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(60))),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                            dd['data']['local_recovered']
                                                .toString(),
                                            style: TextStyle(
                                                fontFamily: "Jaro",
                                                fontSize: 36,
                                                height: 0.7,
                                                color: Colors.white)),
                                        Text("Recovered",
                                            style: TextStyle(
                                                fontFamily: "Jaro",
                                                fontSize: 20)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // height: 300,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(left: 5, right: 5, top: 30),
                            decoration: BoxDecoration(
                                color: Color(0xB3FFFFFF),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 20),
                              child: Column(
                                children: [
                                  Text(
                                    "Local",
                                    style: TextStyle(
                                        fontFamily: "Jaro", fontSize: 24),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("New Cases",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16)),
                                      Text(
                                          dd['data']['local_new_cases']
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Active Cases",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16)),
                                      Text(
                                          dd['data']['local_active_cases']
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total Cases",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16)),
                                      Text(
                                          dd['data']['local_total_cases']
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total Deaths",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16)),
                                      Text(
                                          dd['data']['local_deaths'].toString(),
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total Recovered",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16)),
                                      Text(
                                          dd['data']['local_recovered']
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            // height: 300,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(left: 5, right: 5, top: 30),
                            decoration: BoxDecoration(
                                color: Color(0xB3FFFFFF),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 20),
                              child: Column(
                                children: [
                                  Text(
                                    "Global",
                                    style: TextStyle(
                                        fontFamily: "Jaro", fontSize: 24),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("New Cases",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16)),
                                      Text(
                                          dd['data']['global_new_cases']
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total Cases",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16)),
                                      Text(
                                          dd['data']['global_total_cases']
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total Deaths",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16)),
                                      Text(
                                          dd['data']['global_deaths']
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total Recovered",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16)),
                                      Text(
                                          dd['data']['global_recovered']
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Last refreshed: " + dd['data']['update_date_time'],
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else if (data.hasError) {
              return Center(child: Text('$data.error'));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   fetchAlbum();
      // }),
    );
  }
}
