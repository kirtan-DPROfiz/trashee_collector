import 'dart:developer';

import 'package:get/get.dart';
import 'package:trashee_collecter/API/model/totalemptybinslistinobj.dart';
import 'package:trashee_collecter/API/network%20manager/rest_client.dart';

class Bins extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchAllBins(); // ✅ Fetch data when controller initializes
  }

  void fetchAllBins() {
    AllDustbinList();
    EmptyDustbinList();
    FullDustbinList();
    HalfDustbinList();
  }

  bool isLoading = true;
  //List<TotalEmptyListInObj> emptybins = [];
  var totalbins = 0.obs;
  var fullbins = 0.obs;
  var emptybins = 0.obs;
  var halfbins = 0.obs;
  String errorMessage = "";

  // Fetch Data
  void AllDustbinList() {
    RestClient.getTotalbinsListInObj().then((value) {
      log("✅ API Response: ${value.length}");

      if (value == null) {
        log("⚠️ Warning: API returned null or an empty list.");
        errorMessage = "No data found.";
        isLoading = false;
      } else {
        log("📊 API returned data: ${value.length} items");
        totalbins.value = value.length;
        isLoading = false;
      }
    }).catchError((error) {
      log("❌ Error fetching API data: $error");

      errorMessage = "Failed to load data. Please check your network.";
      isLoading = false;
    });
  }

  void EmptyDustbinList() {
    RestClient.getEmptyDustbinsListInObj().then((value) {
      log("✅ API Response: ${value.length}");

      if (value == null) {
        log("⚠️ Warning: API returned null or an empty list.");

        errorMessage = "No data found.";
        isLoading = false;
      } else {
        log("📊 API returned data: ${value.length} items");

        emptybins.value = value.length;
        isLoading = false;
      }
    }).catchError((error) {
      log("❌ Error fetching API data: $error");

      errorMessage = "Failed to load data. Please check your network.";
      isLoading = false;
    });
  }

  void FullDustbinList() {
    RestClient.getFullDustbinsListInObj().then((value) {
      log("✅ API Response: ${value.length}");

      if (value == null) {
        log("⚠️ Warning: API returned null or an empty list.");

        errorMessage = "No data found.";
        isLoading = false;
      } else {
        log("📊 API returned data: ${value.length} items");

        fullbins.value = value.length;
        isLoading = false;
      }
    }).catchError((error) {
      log("❌ Error fetching API data: $error");

      errorMessage = "Failed to load data. Please check your network.";
      isLoading = false;
    });
  }

  void HalfDustbinList() {
    RestClient.getHalfDustbinsListInObj().then((value) {
      log("✅ API Response: ${value.length}");

      if (value == null) {
        log("⚠️ Warning: API returned null or an empty list.");

        errorMessage = "No data found.";
        isLoading = false;
      } else {
        log("📊 API returned data: ${value.length} items");

        halfbins.value = value.length;
        isLoading = false;
      }
    }).catchError((error) {
      log("❌ Error fetching API data: $error");

      errorMessage = "Failed to load data. Please check your network.";
      isLoading = false;
    });
  }
}
