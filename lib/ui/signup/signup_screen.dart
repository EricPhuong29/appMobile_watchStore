import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mob/blocs/signup/signup_bloc.dart';
import 'package:flutter_mob/blocs/signup/signup_event.dart';
import 'package:flutter_mob/blocs/signup/signup_state.dart';
import 'package:flutter_mob/configs/constants.dart';
import 'package:flutter_mob/configs/images.dart';
import 'package:flutter_mob/configs/themes.dart';
import 'package:flutter_mob/models/account/account.dart';
import 'package:flutter_mob/ui/components/button/button_normal.dart';
import 'package:flutter_mob/ui/components/input/input_field.dart';
import 'package:flutter_mob/configs/colors.dart';
import 'package:flutter_mob/ui/components/input_formatter/no_space_input_formatter.dart';
import 'package:flutter_mob/ui/components/scroll_behavior/scroll_behavior.dart';
import 'package:flutter_mob/ui/components/text/text_normal.dart';
import 'package:flutter_mob/utils/Loading_helper.dart';
import 'package:flutter_mob/utils/dialog_helper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController editingEmailController = TextEditingController();
  final TextEditingController editingPhoneController = TextEditingController();
  final TextEditingController editingUsernameController =
      TextEditingController();
  final TextEditingController editingPasswordController =
      TextEditingController();
  final TextEditingController editingConfirmPasswordController =
      TextEditingController();
  final TextEditingController editingAddressController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) async {
        if (state is SignupLoadingState) {
          LoadingHelper.showLoading(context);
        } else if (state is SignupSuccessState) {
          LoadingHelper.hideLoading(context);
          _formKey.currentState?.reset();
          editingEmailController.clear();
          editingPhoneController.clear();
          editingUsernameController.clear();
          editingPasswordController.clear();
          DialogHelper.showDialogNotify(
            context: context,
            title: StringName.signupSuccess,
            content: StringName.loginNow,
            continueFunction: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Constants.loginScreen,
                (route) => false,
              );
            },
          );
          setState(() {});
        } else if (state is SignupErrorState) {
          LoadingHelper.hideLoading(context);
          DialogHelper.showDialogNotify(
              context: context,
              title: StringName.signupError,
              content: state.message);
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.kPrimaryColor,
        body: Stack(
          alignment: Alignment.topRight,
          children: [
            Image.asset(
              AppImages.imgBackgroundLogin,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: ScrollConfiguration(
                      behavior: CustomScrollBehavior(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextNormal(
                              title: StringName.signUp,
                              size: 36,
                              fontName: AppThemes.italianno,
                              colors: AppColors.bPrimaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InputField(
                                    labelText: StringName.email,
                                    hintText: StringName.fillYourEmail,
                                    controller: editingEmailController,
                                    inputFormatters: [NoSpaceInputFormatter()],
                                    validator: validateEmail,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  InputField(
                                    labelText: StringName.phone,
                                    hintText: StringName.fillYourPhone,
                                    inputFormatters: [
                                      NoSpaceInputFormatter(),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    controller: editingPhoneController,
                                    inputType: TextInputType.phone,
                                    validator: validateEmpty,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  InputField(
                                    labelText: StringName.account,
                                    hintText: StringName.fillYourAccount,
                                    inputFormatters: [NoSpaceInputFormatter()],
                                    controller: editingUsernameController,
                                    validator: validateEmpty,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  InputField(
                                    labelText: StringName.address,
                                    hintText: StringName.fillYourAddress,
                                    controller: editingAddressController,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  InputField(
                                    labelText: StringName.password,
                                    hintText: StringName.fillYourPassword,
                                    inputFormatters: [NoSpaceInputFormatter()],
                                    controller: editingPasswordController,
                                    isObscureText: true,
                                    validator: validateEmpty,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  InputField(
                                    labelText: StringName.confirmPassword,
                                    hintText: StringName.fillYourPassword,
                                    inputFormatters: [NoSpaceInputFormatter()],
                                    controller:
                                        editingConfirmPasswordController,
                                    isObscureText: true,
                                    validator: validateConfirm,
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: handleHadAccount,
                                        child: TextNormal(
                                          title: StringName.hadAccount,
                                          fontName: AppThemes.jaldi,
                                          colors: AppColors.bPrimaryColor,
                                          lineHeight: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  ButtonNormal(
                                    text: StringName.signUp,
                                    onPressed: handleRegister,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String? validateEmail(value) {
    if (value == null || value.isEmpty) {
      return StringName.notAllowEmpty;
    }
    final emailRegExp = RegExp(Regex.email);
    if (!emailRegExp.hasMatch(value)) {
      return StringName.emailNotValid;
    }
    return null;
  }

  String? validateEmpty(value) {
    if (value == null || value.isEmpty) {
      return StringName.notAllowEmpty;
    }
    return null;
  }

  String? validateConfirm(value) {
    if (value == null || value.isEmpty) {
      return StringName.notAllowEmpty;
    }

    if (value != editingPasswordController.text) {
      return StringName.notSamePassword;
    }

    return null;
  }

  handleRegister() {
    if (_formKey.currentState?.validate() ?? false) {
      String name = editingEmailController.text.trim().split('@')[0];
      Account newAccount = Account(
          name: name,
          userName: editingUsernameController.text.trim(),
          email: editingEmailController.text.trim(),
          phoneNumber: editingPhoneController.text.trim(),
          password: editingPasswordController.text.trim(),
          address: editingAddressController.text.trim().isNotEmpty
              ? editingAddressController.text.trim()
              : null);
      BlocProvider.of<SignupBloc>(context)
          .add(RegisterEvent(account: newAccount));
    }
  }

  handleHadAccount() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Constants.loginScreen,
      (route) => false,
    );
  }
}
