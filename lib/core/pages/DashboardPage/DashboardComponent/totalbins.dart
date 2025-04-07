/* import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:trashee_collecter/API/model/allbinslistinobj.dart';
import 'package:trashee_collecter/API/model/fullbinslistinobj.dart';
import 'package:trashee_collecter/API/network%20manager/rest_client.dart';

class Totalbins extends StatefulWidget {
  const Totalbins({super.key});

  @override
  State<Totalbins> createState() => _TotalbinsState();
}

class _TotalbinsState extends State<Totalbins> {
  bool isLoading = true;
  String errorMessage = " ";
  List<AllBinsListInObj> allBins = [];

  void initState() {
    super.initState();
    AllBinsList();
  }

  void AllBinsList() {
    RestClient.getTotalbinsListInObj().then((value) {
      log("✅ API Response: $value");

      if (value == null) {
        log("⚠️ Warning: API returned null or an empty list.");
        setState(() {
          errorMessage = "No data found.";
          isLoading = false;
        });
      } else {
        log("📊 API returned data: ${value.length} items");
        setState(() {
          allBins = value.cast<AllBinsListInObj>();
          isLoading = false;
        });
      }
    }).catchError((error) {
      log("❌ Error fetching API data: $error");
      setState(() {
        errorMessage = "Failed to load data. Please check your network.";
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(" Details Of All Dustbins"),
            backgroundColor: Colors.green),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : errorMessage.isNotEmpty
                ? Center(child: Text(errorMessage))
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                        itemCount: allBins.isNotEmpty
                            ? allBins[0].dustbins!.length
                            : 0, //get the item count from the dustbins list
                        itemBuilder: (context, index) {
                          if (allBins.isNotEmpty &&
                              allBins[0].dustbins != null) {
                            final dustbin = allBins[0].dustbins![
                                index]; //access the dustbin from the dustbins list // Access dustbins list
                            return Card(
                              margin: const EdgeInsets.only(bottom: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.delete,
                                            size: 40, color: Colors.green),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Dustbin ID: ${dustbin.dustbinId}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                "Status: ${dustbin.status}",
                                                style: TextStyle(
                                                  color:
                                                      dustbin.status == "full"
                                                          ? Colors.red
                                                          : Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text("City: ${dustbin.city}",
                                        style: const TextStyle(fontSize: 14)),
                                    Text("Area: ${dustbin.area}",
                                        style: const TextStyle(fontSize: 14)),
                                    Text("Location: ${dustbin.location}",
                                        style: const TextStyle(fontSize: 14)),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              color: Colors.black,
                              child: Text("dustbin is empty!! "),
                            ); // Return an empty container if dustbins is null or empty
                          }
                          ;
                        })));
  }
}
 */

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:trashee_collecter/API/model/fullbinslistinobj.dart';
import 'package:trashee_collecter/API/model/totalemptybinslistinobj.dart';
import 'package:trashee_collecter/API/network%20manager/rest_client.dart';

class Totalbins extends StatefulWidget {
  const Totalbins({super.key});

  @override
  State<Totalbins> createState() => _TotalbinsState();
}

class _TotalbinsState extends State<Totalbins> {
  bool isLoading = true;
  List<TotalEmptyListInObj> emptybins = [];
  String errorMessage = "";

  void initState() {
    super.initState();
    AllDustbinList();
  }

  // Fetch Data
  void AllDustbinList() {
    RestClient.getTotalbinsListInObj().then((value) {
      log("✅ API Response: $value");

      if (value == null) {
        log("⚠️ Warning: API returned null or an empty list.");
        setState(() {
          errorMessage = "No data found.";
          isLoading = false;
        });
      } else {
        log("📊 API returned data: ${value.length} items");
        setState(() {
          emptybins = value.cast<TotalEmptyListInObj>();
          isLoading = false;
        });
      }
    }).catchError((error) {
      log("❌ Error fetching API data: $error");
      setState(() {
        errorMessage = "Failed to load data. Please check your network.";
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(" Details Of All Dustbins"),
          backgroundColor: Colors.green),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: emptybins.length,
                    itemBuilder: (context, index) {
                      var data = emptybins[index].dustbins![0];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.delete,
                                      size: 40, color: Colors.green),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Dustbin ID: ${data.dustbinId}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                        Text("Status: ${data.status}",
                                            style: TextStyle(
                                                color: data.status == "full"
                                                    ? Colors.red
                                                    : Colors.green,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text("City: ${data.city}",
                                  style: const TextStyle(fontSize: 14)),
                              Text("Area: ${data.area}",
                                  style: const TextStyle(fontSize: 14)),
                              Text("Location: ${data.location}",
                                  style: const TextStyle(fontSize: 14)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
