import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../lunch_portal.dart';
import '../../utilities/customViews/app_buttons.dart';
import '../../utilities/customViews/app_password_field.dart';
import '../../utilities/customViews/app_text_fields.dart';
import '../../utilities/utils/colors.dart';
import '../../utilities/utils/constants.dart';
import '../../utilities/utils/validators.dart';
import 'complete_profile/complete_profile_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => SignUpScreenBody();
}

class SignUpScreenBody extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
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
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.defaultScreenMargins),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Container()),
                renderHeading(),
                renderSignUpForm(),
                renderSimpleDivider(),
                renderLoginTextView(),
                renderOrSeparator(context),
                renderGoogleButton(context, 'Continue with Google'),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget renderHeading() {
    return Expanded(
        child: Column(children: const [
      Text('Create Account',
          style: TextStyle(
            fontSize: AppConstants.headingTextSize,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          )),
    ]));
  }

  Widget renderSignUpForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          renderEmailField(),
          renderSimpleDivider(),
          renderPasswordField(isConfirmPassword: false),
          renderSimpleDivider(),
          renderPasswordField(isConfirmPassword: true),
          renderSimpleDivider(),
          submitButton(text: 'Lets Get Started', onPressed: proceedToSignUp),
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
          //email validation
          if (!Validators.validateEmail(value)) {
            return ValidatorConstants.emailError;
          }
        });
  }

  Widget renderSimpleDivider() {
    return const Divider(color: Colors.transparent);
  }

  Widget renderPasswordField({required bool isConfirmPassword}) {
    if (isConfirmPassword) {
      return PasswordField(
        hint: 'Confirm Password',
        controller: _confirmPasswordController,
        validator: (value) {
          //password validation
          if (!Validators.validateSignupPassword(value, _passwordController.text)) {
            return ValidatorConstants.passwordLengthError;
          }
        },
      );
    } else {
      return PasswordField(
          hint: 'Password',
          controller: _passwordController,
          validator: (value) {
            //password validation
            if (!Validators.validateSignupPassword(value, _confirmPasswordController.text)) {
              return ValidatorConstants.passwordLengthError;
            }
          });
    }
  }

  Widget renderLoginTextView() {
    return Text.rich(TextSpan(
        style: const TextStyle(
          fontSize: AppConstants.buttonTextSize,
        ),
        children: <InlineSpan>[
          const TextSpan(text: 'Already has a Account? '),
          TextSpan(
              text: 'Login',
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = moveToLogin),
          const TextSpan(text: ' instead!'),
        ]));
  }

  void proceedToSignUp() async {
    if (_formKey.currentState!.validate()) {
      var email = _emailController.text;
      var password = _passwordController.text;
      await LunchPortal.authViewModel.signUpWithEmailAndPassword(email, password).whenComplete(() {
        if (LunchPortal.authViewModel.getUserId() != null) {
          ///if Successfully signed up then move to the completion of profile
          Navigator.pushNamed(context, CompleteProfile.routeName);
        }
      });
    }
  }

  void moveToLogin() {
    Navigator.pushNamed(context, RouteConstants.loginRoute);
  }
}
