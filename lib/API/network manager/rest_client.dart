//import 'package:http_clear_architec/models/post_api_model.dart';
import 'package:http/http.dart';
import 'package:trashee_collecter/API/model/allbinslistinobj.dart';
import 'package:trashee_collecter/API/model/fullbinslistinobj.dart';
import 'package:trashee_collecter/API/model/halfbinsListinobj.dart';
import 'package:trashee_collecter/API/model/totalemptybinslistinobj.dart';
import 'package:trashee_collecter/API/network%20manager/http_helper.dart';

class RestClient {
  static final HttpHelper httpHelper = HttpHelper();

  // Login- fucntion:
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    try {
      // Your API endpoint
      const String url =
          'https://intervein.dprofiz.com/Trashee_Collector/Auth/login.php';

      // Request body with the provided parameters
      final Map<String, dynamic> requestBody = {
        'login': email,
        'password': password,
      };

      // Make the POST request
      final response = await HttpHelper.post(url, requestBody: requestBody);
      print("Login response from Api : $response");

      // Check if the response contains the success message
      if (response.containsKey('message') &&
          response['message'] == 'Login successful') {
        return {
          'success': true,
          'message': response['message'],
          'data': response, // Include any additional data from the response
        };
      } else {
        // Handle other messages or errors from the API
        return {
          'success': false,
          'message': response['message'] ?? 'Login failed',
        };
      }
    } catch (e) {
      // Handle any exceptions
      return {
        'success': false,
        'message': 'An error occurred: ${e.toString()}',
      };
    }
  }

  // signin- fucntion:
  static Future<Map<String, dynamic>> signup(String role, String fullname,
      String email, String phone, String password, String Cpassword) async {
    try {
      const String url =
          'https://intervein.dprofiz.com/Trashee_Collector/Auth/signup.php';

      // Request body with the provided parameters
      final Map<String, dynamic> requestBody = {
        "full_name": fullname,
        "email": email,
        "phone_number": phone,
        "password": password,
        "confirm_password": Cpassword,
        "role": role,
      };

      // Make the POST request
      final response = await HttpHelper.post(url, requestBody: requestBody);
      print("SignUp response from Api : $response");

      // Check if the response contains the success message
      if (response.containsKey('message')) {
        if (response['message'] == "User registered successfully") {
          return {
            'success': true,
            'message': response['message'],
            'data': response,
          };
        } else {
          return {
            'success': false,
            'message': response['message'] ?? 'Registration failed',
            'error': response['error'] ?? '',
          };
        }
      } else if (response.containsKey('error')) {
        return {
          'success': false,
          'message': response['error'] ?? 'Registration failed',
        };
      }
      return {
        'success': false,
        'message': 'Unexpected response from server',
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'An error occurred: ${e.toString()}',
      };
    }
  }

  // total Dustbin:
  static Future<List<TotalEmptyListInObj>> getTotalbinsListInObj() async {
    print("Starting getTotalbinsListInObj...");
    try {
      const String apiUrl =
          "https://intervein.dprofiz.com/Trashee_Collector/Home/dustbins.php";
      print("Fetching data from API: $apiUrl");

      // Call httpHelper.get
      Map<String, dynamic> response = await httpHelper.get(
        url: apiUrl,
      );
      print("API request completed. Response received.");
      print("API Response: $response");

      if (response['dustbins'] != null) {
        List<TotalEmptyListInObj> data = [];
        response['dustbins'].forEach((v) {
          data.add(TotalEmptyListInObj.fromJson({
            'dustbins': [v]
          }));
        });
        print("Parsed Data: $data");
        return data;
      } else {
        print("No assignments found in the response.");
        return [];
      }
    } catch (e, stackTrace) {
      print("Error fetching data: $e");
      print("Stack trace: $stackTrace");
      throw Exception("Error fetching data: $e");
    }
  }

// full Dustbin:
  static Future<List<FullBinsListInObj>> getFullDustbinsListInObj() async {
    print("Starting getFullDustbinsListInObj...");
    try {
      const String apiUrl =
          "https://intervein.dprofiz.com/Trashee_Collector/Home/fulldustbins.php";
      print("Fetching data from API: $apiUrl");

      // Call httpHelper.get
      Map<String, dynamic> response = await httpHelper.get(
        url: apiUrl,
      );
      print("API request completed. Response received.");
      print("API Response: $response");

      if (response['dustbins'] != null) {
        List<FullBinsListInObj> data = [];
        response['dustbins'].forEach((v) {
          data.add(FullBinsListInObj.fromJson({
            'dustbins': [v]
          }));
        });
        print("Parsed Data: $data");
        return data;
      } else {
        print("No assignments found in the response.");
        return [];
      }
    } catch (e, stackTrace) {
      print("Error fetching data: $e");
      print("Stack trace: $stackTrace");
      throw Exception("Error fetching data: $e");
    }
  }

  //total emptyDustbin:
  static Future<List<TotalEmptyListInObj>> getEmptyDustbinsListInObj() async {
    print("Starting getFullDustbinsListInObj...");
    try {
      const String apiUrl =
          "https://intervein.dprofiz.com/Trashee_Collector/Home/emptydustbins.php";
      print("Fetching data from API: $apiUrl");

      // Call httpHelper.get
      Map<String, dynamic> response = await httpHelper.get(
        url: apiUrl,
      );
      print("API request completed. Response received.");
      print("API Response: $response");

      if (response['dustbins'] != null) {
        List<TotalEmptyListInObj> data = [];
        response['dustbins'].forEach((v) {
          data.add(TotalEmptyListInObj.fromJson({
            'dustbins': [v]
          }));
        });
        print("Parsed Data: $data");
        return data;
      } else {
        print("No assignments found in the response.");
        return [];
      }
    } catch (e, stackTrace) {
      print("Error fetching data: $e");
      print("Stack trace: $stackTrace");
      throw Exception("Error fetching data: $e");
    }
  }

  // halfDustbin:
  static Future<List<HalfBinsListInObj>> getHalfDustbinsListInObj() async {
    print("Starting getFullDustbinsListInObj...");
    try {
      const String apiUrl =
          "https://intervein.dprofiz.com/Trashee_Collector/Home/Halfdustbins.php";
      print("Fetching data from API: $apiUrl");

      // Call httpHelper.get
      Map<String, dynamic> response = await httpHelper.get(
        url: apiUrl,
      );
      print("API request completed. Response received.");
      print("API Response: $response");

      if (response['dustbins'] != null) {
        List<HalfBinsListInObj> data = [];
        response['dustbins'].forEach((v) {
          data.add(HalfBinsListInObj.fromJson({
            'dustbins': [v]
          }));
        });
        print("Parsed Data: $data");
        return data;
      } else {
        print("No assignments found in the response.");
        return [];
      }
    } catch (e, stackTrace) {
      print("Error fetching data: $e");
      print("Stack trace: $stackTrace");
      throw Exception("Error fetching data: $e");
    }
  }

// get data in object: https://fakestoreapi.in/api/products

/*   static Future<UserListInObj> getUserListInObj() async {
    print("Fetching data from API..."); // Debugging log
    Map<String, dynamic> response = await httpHelper.get(
      url: "https://intervein.dprofiz.com/rfid_api/employees/fetch.php",
    );
    print("API Response: $response"); // Debugging log
    return UserListInObj.fromJson(response);
    
  } */

//get data in Array
/*
  static Future<List<UserListInArray>> getUserListInArray() async {
    print("Fetching data from API..."); // Debugging log
    List<dynamic> response = await httpHelper.get(
      url: 'https://jsonplaceholder.typicode.com/todos',
    );
    print("API Response: $response"); // Debugging log
    return List<UserListInArray>.from(
        response.map((x) => UserListInArray.fromJson(x)));
  }
  */
// post api :
/*   static Future<dynamic> registration(Object requestbody) async {
    print("Fetching data from API..."); // Debugging log
    var response = await httpHelper.post(
        url: 'https://reqres.in/api/register', requestBody: requestbody);
    print("API Response: $response"); // Debugging log
    return response;
  } */

  //put api :
/*   static Future<UpdateUserModel> UpdateUserPut(Object requestbody) async {
    print("Fetching data from API..."); // Debugging log
    var response = await httpHelper.put(
        url: 'https://reqres.in/api/users/2', requestBody: requestbody);
    print("API Response: $response"); // Debugging log
    return UpdateUserModel.fromJson(response); */
}

  //patch api :
/*   static Future<UpdateUserModel> UpdateUserPatch(Object requestbody) async {
    print("Fetching data from API..."); // Debugging log
    var response = await httpHelper.put(
        url: 'https://reqres.in/api/users/2', requestBody: requestbody);
    print("API Response: $response"); // Debugging log
    return UpdateUserModel.fromJson(response); 
  }*/

  //delete api :
/*   static Future<dynamic> Userdelete(String id) async {
    print("Fetching data from API..."); // Debugging log
    var response = await httpHelper.delete(
      url: 'https://fakestoreapi.com/users/$id',
    );
    print("API Response: $response"); // Debugging log
    return response;
  } */


/*   Future<PostApiModel> postApi(Object model) async {
    Map params = {'email': '', 'password': ''};
    Map<String, dynamic> response =
        await httpHelper.post(url: "  ", requestBody: params);
    return PostApiModel.fromJson(response);
  } */

