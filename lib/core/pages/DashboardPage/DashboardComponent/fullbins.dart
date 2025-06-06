import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:trashee_collecter/API/model/fullbinslistinobj.dart';
import 'package:trashee_collecter/API/network%20manager/rest_client.dart';

class Fullbins extends StatefulWidget {
  const Fullbins({super.key});

  @override
  State<Fullbins> createState() => _FullbinsState();
}

class _FullbinsState extends State<Fullbins> {
  bool isLoading = true;
  List<FullBinsListInObj> fullbins = [];
  String errorMessage = "";

  void initState() {
    super.initState();
    FullDustbinList();
  }

  // Fetch Data
  void FullDustbinList() {
    RestClient.getFullDustbinsListInObj().then((value) {
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
          fullbins = value;
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
        title: const Text(" Details Of All Full Dustbins"),
        backgroundColor: Colors.green,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: fullbins.length,
                    itemBuilder: (context, index) {
                      var data = fullbins[index].dustbins![0];
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
