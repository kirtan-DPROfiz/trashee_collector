import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:trashee_collecter/API/model/allbinslistinobj.dart';
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
        appBar: AppBar(title: const Text(" Details Of All Dustbins")),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : errorMessage.isNotEmpty
                ? Center(child: Text(errorMessage))
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                      itemCount: allBins.isNotEmpty
                          ? allBins[0].dustbins?.length ?? 0
                          : 0,
                      itemBuilder: (context, index) {
                        var dustbinData =
                            allBins[0].dustbins![index]; // Access dustbins list
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
                                            "Dustbin ID: ${dustbinData.dustbinId}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            "Status: ${dustbinData.status}",
                                            style: TextStyle(
                                              color:
                                                  dustbinData.status == "full"
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
                                Text("City: ${dustbinData.city}",
                                    style: const TextStyle(fontSize: 14)),
                                Text("Area: ${dustbinData.area}",
                                    style: const TextStyle(fontSize: 14)),
                                Text("Location: ${dustbinData.location}",
                                    style: const TextStyle(fontSize: 14)),
                              ],
                            ),
                          ),
                        );
                      },
                    )));
  }
}
