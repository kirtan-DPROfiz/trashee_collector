import 'package:get/get.dart';
import 'package:trashee_collecter/core/Routes/routes.dart';
import 'package:trashee_collecter/core/auth/login_screen.dart';
import 'package:trashee_collecter/core/auth/signin_screen.dart';
import 'package:trashee_collecter/core/pages/DashboardPage/DashboardComponent/fullbins.dart';
import 'package:trashee_collecter/core/pages/DashboardPage/DashboardComponent/half.dart';
import 'package:trashee_collecter/core/pages/DashboardPage/DashboardComponent/total_empty_bin.dart';
import 'package:trashee_collecter/core/pages/DashboardPage/DashboardComponent/totalbins.dart';
import 'package:trashee_collecter/core/pages/DashboardPage/dashboard_screen.dart';

class RouteNames {
  static final List<GetPage> Pages = [
    GetPage(name: Routes.loginScreen, page: () => LoginScreen()),
    GetPage(name: Routes.signScreen, page: () => SignupScreen()),
    GetPage(name: Routes.dashboardScreen, page: () => HomeScreen()),
    GetPage(name: Routes.fullbins, page: () => Fullbins()),
    GetPage(name: Routes.allbins, page: () => Totalbins()),
    GetPage(name: Routes.emptydustbins, page: () => EmptyDustbinsScreen()),
    GetPage(name: Routes.halfdustbins, page: () => HalfFullDustbinsScreen()),
  ];
}
