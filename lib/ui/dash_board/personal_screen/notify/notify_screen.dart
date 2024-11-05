import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mob/blocs/notify/notify_bloc.dart';
import 'package:flutter_mob/blocs/notify/notify_event.dart';
import 'package:flutter_mob/blocs/notify/notify_state.dart';
import 'package:flutter_mob/configs/colors.dart';
import 'package:flutter_mob/configs/constants.dart';
import 'package:flutter_mob/configs/themes.dart';
import 'package:flutter_mob/ui/components/app_bar/app_bar_title.dart';
import 'package:flutter_mob/ui/components/card/card_notification.dart';
import 'package:flutter_mob/ui/components/scroll_behavior/scroll_behavior.dart';
import 'package:flutter_mob/models/notify/notification.dart' as model;
import 'package:flutter_mob/ui/components/text/text_normal.dart';
import 'package:flutter_mob/utils/Loading_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotifyScreen extends StatefulWidget {
  const NotifyScreen({super.key});

  @override
  State<NotifyScreen> createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  List<model.Notification> listNotification = [];

  @override
  void initState() {
    BlocProvider.of<NotifyBloc>(context).add(GetListNotifyEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotifyBloc, NotifyState>(
      listener: (context, state) async {
        if (state is NotifyLoadingState) {
          LoadingHelper.showLoading(context);
        } else if (state is GetListNotifySuccessState) {
          LoadingHelper.hideLoading(context);
          setState(() {
            listNotification = state.listNotify;
          });
        } else if (state is NotifyErrorState) {
          LoadingHelper.hideLoading(context);
          Fluttertoast.showToast(
              msg: state.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: SafeArea(
          child: Column(
            children: [
              AppBarTitle(
                  appTitle: StringName.notification,
                  fontName: AppThemes.jaldi,
                  fontSize: 20),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: CustomScrollBehavior(),
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      Column(
                        children: [
                          if (listNotification.isNotEmpty)
                            ...listNotification
                                .map((e) => CardNotification(
                                      notification: e,
                                      onClick: () {
                                        Navigator.pushNamed(context,
                                            Constants.detailNotifyScreen,
                                            arguments: e);
                                      },
                                    ))
                                .toList(),
                          if (listNotification.isEmpty)
                            Container(
                              margin: EdgeInsets.only(top: 80),
                              child: TextNormal(
                                title: StringName.noNotify,
                                colors: AppColors.bPrimaryColor,
                                fontName: AppThemes.spectral,
                                size: 18,
                              ),
                            )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
