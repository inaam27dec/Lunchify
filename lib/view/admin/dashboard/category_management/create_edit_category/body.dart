import 'package:flutter/material.dart';
import '../../../../../data/model/AppDataClasses.dart';
import '../../../../../utilities/customViews/app_text_fields.dart';
import '../../../../../utilities/utils/colors.dart';
import '../../../../../utilities/utils/constants.dart';
import '../../../../../data/model/UserOrderDataModel.dart';
import '../../../../../utilities/utils/validators.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Body();
}

class _Body extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _fNameController = TextEditingController();

    final _fNameKey = GlobalKey<FormState>();

    final model = ModalRoute.of(context)!.settings.arguments
        as CreateEditCategoryArguments;
    _fNameController.text = model.name;
    String title = model.isCreate ? "Create Category" : "Edit Category";
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.signupBackgroundGradient,
        ),
      ),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 25.0, left: 15.0, right: 15.0, bottom: 25.0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 20.0,
                          color: AppColors.whiteColor,
                        )),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: AppConstants.normalHeadingTextSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppConstants.borderRadius),
                        topRight: Radius.circular(AppConstants.borderRadius))),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 35.0, left: 15.0, right: 15.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: GestureDetector(
                          onTap: onImageClick,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: AppColors.searchColor,
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppConstants.bottomSheetCorners))),
                            height: 200,
                            child: Stack(
                              children: [
                                if (model.imageUrl.isNotEmpty)
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(AppConstants
                                                  .bottomSheetCorners)),
                                          child: Image.network(model.imageUrl,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ],
                                  )
                                else
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        // add this
                                        children: const <Widget>[
                                          Icon(
                                            Icons.add,
                                            color: AppColors.whiteColor,
                                            size: 45,
                                          ),
                                          Text(
                                            "Add Category Image",
                                            style: TextStyle(
                                                color: AppColors.whiteColor,
                                                fontSize:
                                                    AppConstants.buttonTextSize,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: signinTextFormField(
                          hint: "Enter Category Name",
                          controller: _fNameController,
                          upperCaseTextFormatter: true,
                          textInputType: TextInputType.name,
                          validator: Validators.validateName,
                          key: _fNameKey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  onImageClick() {}
}
