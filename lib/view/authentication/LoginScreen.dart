import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../lunch_portal.dart';
import '../../utilities/customViews/app_buttons.dart';
import '../../utilities/customViews/app_password_field.dart';
import '../../utilities/customViews/app_text_fields.dart';
import '../../utilities/utils/colors.dart';
import '../../utilities/utils/constants.dart';
import '../../utilities/utils/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginBody();
}

class LoginBody extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(AppConstants.defaultScreenMargins),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(),
                ),
                renderHeading(),
                renderLoginForm(),
                renderSimpleDivider(),
                renderSignUpText(),
                renderOrSeparator(context),
                renderGoogleButton(context, 'Sign In with Google'),
                Expanded(child: Container()),
              ],
            ),
          )),
    );
  }

  Widget renderHeading() {
    return Expanded(
      child: Column(
        children: const [
          Text(AppConstants.appName, style: TextStyle(fontSize: AppConstants.headingTextSize, fontWeight: FontWeight.bold, color: AppColors.primary))
        ],
      ),
    );
  }

  Widget renderLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          renderEmailField(),
          renderSimpleDivider(),
          renderPasswordField(),
          renderSimpleDivider(),
          submitButton(text: 'Login', onPressed: proceedToLogin)
        ],
      ),
    );
  }

  Widget renderEmailField() {
    return signinTextField(
      hint: 'Email Address',
      controller: _emailController,
      textInputType: TextInputType.emailAddress,
      validator: (value) {
        if (!Validators.validateEmail(value)) {
          return ValidatorConstants.emailError;
        }
      },
    );
  }

  Widget renderPasswordField() {
    return PasswordField(hint: 'Password', controller: _passwordController, validator: Validators.validatePassword);
  }

  Widget renderSimpleDivider() {
    return const Divider(color: Colors.transparent);
  }

  Widget renderSignUpText() {
    return Text.rich(
      TextSpan(
        style: const TextStyle(fontSize: AppConstants.buttonTextSize),
        children: <InlineSpan>[
          const TextSpan(text: 'New User? '),
          TextSpan(
              text: 'Sign Up',
              style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()..onTap = gotoSignUpScreen),
          const TextSpan(text: ' Now!')
        ],
      ),
    );
  }

  void proceedToGoogleLogin() {
    LunchPortal.loginHelper.onClickLogin(context: context, isGoogle: true);
  }

  void proceedToLogin() async {
    if (_formKey.currentState!.validate()) {
      var email = _emailController.text;
      var password = _passwordController.text;
      LunchPortal.loginHelper.onClickLogin(context: context, isGoogle: false, email: email, password: password);
    }
  }

  void gotoSignUpScreen() {
    Navigator.pushNamed(context, RouteConstants.signUpRoute);
  }
}
