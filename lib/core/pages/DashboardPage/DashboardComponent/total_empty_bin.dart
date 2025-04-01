import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:trashee_collecter/API/model/fullbinslistinobj.dart';
import 'package:trashee_collecter/API/model/totalemptybinslistinobj.dart';
import 'package:trashee_collecter/API/network%20manager/rest_client.dart';

class EmptyDustbinsScreen extends StatefulWidget {
  const EmptyDustbinsScreen({super.key});

  @override
  State<EmptyDustbinsScreen> createState() => _EmptyDustbinsScreenState();
}

class _EmptyDustbinsScreenState extends State<EmptyDustbinsScreen> {
  bool isLoading = true;
  List<TotalEmptyListInObj> emptybins = [];
  String errorMessage = "";

  void initState() {
    super.initState();
    EmptyDustbinList();
  }

  // Fetch Data
  void EmptyDustbinList() {
    RestClient.getEmptyDustbinsListInObj().then((value) {
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
      appBar: AppBar(title: const Text(" Details Of All Empty Dustbins")),
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
