import 'package:flutter/material.dart';
import 'package:flutter_mob/configs/constants.dart';
import 'package:flutter_mob/models/brand/brand.dart';
import 'package:flutter_mob/models/filter.dart';
import 'package:flutter_mob/models/models.dart';
import 'package:flutter_mob/models/watch/watch.dart';
import 'package:flutter_mob/ui/dash_board/dash_board_screen.dart';
import 'package:flutter_mob/ui/dash_board/detail_order/detail_order_screen.dart';
import 'package:flutter_mob/ui/dash_board/discount/apply_discount_screen.dart';
import 'package:flutter_mob/ui/dash_board/home/outstanding_watch/all_outstanding_watch.dart';
import 'package:flutter_mob/ui/dash_board/home/search_brand/all_brand.dart';
import 'package:flutter_mob/ui/dash_board/home/search_brand/watch_by_brand.dart';
import 'package:flutter_mob/ui/dash_board/home/top_deels/all_top_deels.dart';
import 'package:flutter_mob/ui/dash_board/payment_method/payment_method_screen.dart';
import 'package:flutter_mob/ui/dash_board/personal_screen/change_password_screen/change_password_screen.dart';
import 'package:flutter_mob/ui/dash_board/personal_screen/notify/detail_notify_screen.dart';
import 'package:flutter_mob/ui/dash_board/personal_screen/notify/notify_screen.dart';
import 'package:flutter_mob/ui/dash_board/personal_screen/order_screen/order_screen.dart';
import 'package:flutter_mob/ui/dash_board/personal_screen/profile_screen/profile_screen.dart';
import 'package:flutter_mob/ui/dash_board/personal_screen/transaction_screen/transaction_screen.dart';
import 'package:flutter_mob/ui/dash_board/search/filter_screen.dart';
import 'package:flutter_mob/ui/dash_board/shipping_address/new_shipping_address_screen.dart';
import 'package:flutter_mob/ui/dash_board/shipping_address/shipping_address_screen.dart';
import 'package:flutter_mob/ui/dash_board/watch_detail/watch_detail_screen.dart';
import 'package:flutter_mob/ui/dash_board/webview/webview_screen.dart';
import 'package:flutter_mob/ui/forgot_password/forgot_password_screen.dart';
import 'package:flutter_mob/ui/login/login_screen.dart';
import 'package:flutter_mob/ui/onboarding/onboarding_screen.dart';
import 'package:flutter_mob/ui/signup/signup_screen.dart';
import 'package:flutter_mob/ui/splash/splash_screen.dart';
import 'package:flutter_mob/models/notify/notification.dart' as model;

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case Constants.splashScreen:
      return generateRouter(widget: const SplashScreen());
    case Constants.onBoardingScreen:
      return generateRouter(widget: const OnBoardingScreen());
    case Constants.loginScreen:
      return generateRouter(widget: const LoginScreen());
    case Constants.signupScreen:
      return generateRouter(widget: const SignupScreen());
    case Constants.forgotPasswordScreen:
      return generateRouter(widget: const ForgotPasswordScreen());
    case Constants.dashBoardScreen:
      return generateRouter(widget: const DashBoardScreen());
    case Constants.watchDetailScreen:
      return generateRouter(
          widget: WatchDetailScreen(
        watch: args as Watch,
      ));
    case Constants.detailOrderScreen:
      return generateRouter(
          widget: DetailOrderScreen(
        data: args,
      ));
    case Constants.profileScreen:
      return generateRouter(widget: const ProfileScreen());
    case Constants.changePasswordScreen:
      return generateRouter(widget: const ChangePasswordScreen());
    case Constants.notifyScreen:
      return generateRouter(widget: const NotifyScreen());
    case Constants.detailNotifyScreen:
      return generateRouter(
          widget: DetailNotifyScreen(notification: args as model.Notification));
    case Constants.orderScreen:
      return generateRouter(widget: const OrderScreen());
    case Constants.transactionScreen:
      return generateRouter(widget: const TransactionScreen());
    case Constants.allTopDeelsScreen:
      return generateRouter(widget: const AllTopDeelsScreen());
    case Constants.allBrandScreen:
      return generateRouter(widget: const AllBrandScreen());
    case Constants.allOutstandingScreen:
      return generateRouter(widget: const AllOutstandingWatchScreen());
    case Constants.watchByBrandScreen:
      return generateRouter(widget: WatchByBrandScreen(brand: args as Brand));
    case Constants.shippingAddressScreen:
      return generateRouter(widget: ShippingAddressScreen());
    case Constants.newShippingAddressScreen:
      return generateRouter(
          widget: NewShippingAddressScreen(
        shippingAddress: args as ShippingAddress?,
      ));
    case Constants.applyDiscountScreen:
      return generateRouter(
          widget: ApplyDiscountScreen(
        discount: args as Discount?,
      ));
    case Constants.paymentMethodScreen:
      return generateRouter(
          widget: PaymentMethodScreen(
        paymentMethod: args as String?,
      ));
    case Constants.webviewScreen:
      return generateRouter(
          widget: WebviewScreen(
        uri: args as String,
      ));
    case Constants.filterScreen:
      return generateRouter(
          widget: FilterScreen(
        listSelectedFilter: args as List<Filter>,
      ));
    default:
      throw ('This route name does not exit');
  }
}

generateRouter({required Widget widget}) {
  return MaterialPageRoute(builder: (context) => widget);
}
