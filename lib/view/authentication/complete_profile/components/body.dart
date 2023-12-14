import 'package:flutter/material.dart';
import 'user_info_form.dart';
import '../../../../../utilities/utils/colors.dart';
import '../../../../../utilities/utils/constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _Body();
}

class _Body extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.signupBackgroundGradient,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 29),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'User Information',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppConstants.normalHeadingTextSize,
                      ),
                    ),
                    Text(
                      'Please fill out the following details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppConstants.buttonTextSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      AppConstants.borderRadius,
                    ),
                    topRight: Radius.circular(
                      AppConstants.borderRadius,
                    ),
                  ),
                ),
                child: Column(
                  children: const [
                    Divider(
                      color: Colors.transparent,
                    ),
                    Expanded(
                      child: UserInfoForm(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
