import 'package:flutter/material.dart';
import 'package:lunch_portal/lunch_portal.dart';
import 'package:lunch_portal/view/user/dashboard/dashboard_screen.dart';
import '../../../../../utilities/utils/basic_function.dart';
import '../../../../../utilities/utils/validators.dart';
import '../../../../data/model/UserDataModel.dart';
import '../../../../utilities/customViews/app_buttons.dart';
import '../../../../../utilities/utils/colors.dart';
import '../../../../../utilities/utils/constants.dart';
import '../../../../utilities/customViews/app_drop_downs.dart';
import '../../../../../data/model/UserOrderDataModel.dart';
import '../../../../utilities/customViews/app_text_fields.dart';

class UserInfoForm extends StatefulWidget {
  const UserInfoForm({Key? key}) : super(key: key);

  @override
  State<UserInfoForm> createState() => _UserInfoForm();
}

class _UserInfoForm extends State<UserInfoForm> {
  late Future<List<Object>> userData;

  @override
  void initState() {
    userData = LunchPortal.userViewModel.getFloorsAndTeams();

    super.initState();
  }

  int? _selectedFloor;
  String? _selectedTeam;

  bool showFloorError = false;
  bool showTeamError = false;

  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final _fNameKey = GlobalKey<FormState>();
  final _lNameKey = GlobalKey<FormState>();
  final _phoneKey = GlobalKey<FormState>();
  final _addressKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var bottom = MediaQuery.of(context)
        .viewInsets
        .bottom; // This ensures complete visibilty of selected textfield

    return FutureBuilder(
      future: userData,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          List<Object> fetchedList = snapshot.data as List<Object>;
          List<int> floorsList = fetchedList[0] as List<int>;
          List<String> teamsList = fetchedList[1] as List<String>;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: bottom, left: 27, right: 27),
              child: Column(
                children: [
                  signinTextFormField(
                    key: _fNameKey,
                    hint: UserInfoFormConstants.firstName,
                    controller: _fNameController,
                    upperCaseTextFormatter: true,
                    textInputType: TextInputType.text,
                    validator: Validators.validateName,
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  signinTextFormField(
                    key: _lNameKey,
                    hint: UserInfoFormConstants.lastName,
                    controller: _lNameController,
                    upperCaseTextFormatter: true,
                    textInputType: TextInputType.text,
                    validator: Validators.validateName,
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  signinTextFormField(
                    key: _phoneKey,
                    controller: _phoneController,
                    textInputType: TextInputType.phone,
                    hint: UserInfoFormConstants.phoneNumber,
                    validator: Validators.validatePhone,
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  signinTextFormField(
                    key: _addressKey,
                    controller: _addressController,
                    textInputType: TextInputType.streetAddress,
                    hint: UserInfoFormConstants.address,
                    validator: Validators.validateAddress,
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  customDropDownTile(
                    title: UserInfoFormConstants.floorLabel,
                    showError: showFloorError,
                    child: DropdownButton<int>(
                      isExpanded: true,
                      hint: const Text(
                        'Please Select Floor',
                        style: TextStyle(
                          fontSize: AppConstants.dropdownHintSize,
                        ),
                      ),
                      value: _selectedFloor,
                      alignment: Alignment.centerRight,
                      elevation: 16,
                      style: const TextStyle(
                        backgroundColor: Colors.white,
                        color: Colors.black,
                      ),
                      underline: const SizedBox(),
                      onChanged: (int? newValue) {
                        setState(
                          () {
                            _selectedFloor = newValue!;
                            showFloorError = false;
                          },
                        );
                      },
                      items: floorsList.map<DropdownMenuItem<int>>(
                        (int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(
                              value.toString(),
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  customDropDownTile(
                    title: UserInfoFormConstants.teamLabel,
                    showError: showTeamError,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _selectedTeam,
                      hint: const Text(
                        'Please Select Team',
                        style: TextStyle(
                          fontSize: AppConstants.dropdownHintSize,
                        ),
                      ),
                      elevation: 16,
                      style: const TextStyle(
                        backgroundColor: Colors.white,
                        color: Colors.black,
                      ),
                      underline: const SizedBox(),
                      onChanged: (String? newValue) {
                        setState(
                          () {
                            _selectedTeam = newValue!;
                            showTeamError = false;
                          },
                        );
                      },
                      items: teamsList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  const Divider(
                    color: Colors.transparent,
                    height: 45,
                  ),
                  submitButton(
                    onPressed: () {
                      if (_fNameKey.currentState!.validate()) {
                        if (_lNameKey.currentState!.validate()) {
                          if (_phoneKey.currentState!.validate()) {
                            if (_addressKey.currentState!.validate()) {
                              if (_selectedFloor == null) {
                                setState(
                                  () {
                                    showFloorError = true;
                                  },
                                );
                              } else {
                                if (_selectedTeam == null) {
                                  setState(
                                    () {
                                      showTeamError = true;
                                    },
                                  );
                                } else {
                                  void upload(UserDataModel user) async {
                                    await LunchPortal.userViewModel
                                        .insertUser(user)
                                        .whenComplete(() {
                                      if (LunchPortal.authViewModel
                                              .getUserId() !=
                                          null) {
                                        Navigator.pushNamed(
                                            context, DashboardScreen.routeName);
                                      } else {
                                        showSnackBar(
                                            context: context,
                                            message:
                                                'Information Can\'t be Stored');
                                      }
                                    });
                                  }

                                  UserDataModel user = UserDataModel(
                                      id: '',
                                      // ID will be changed after fetching Firebase Authentication UID
                                      fName: _fNameController.text,
                                      lName: _lNameController.text,
                                      eMail: '',
                                      // Email will be changed after fetching Email Firebase Authentication ID
                                      pNumber: _phoneController.text,
                                      address: _addressController.text,
                                      floorNumber: _selectedFloor!,
                                      team: _selectedTeam!);

                                  upload(user);
                                }
                              }
                            }
                          }
                        }
                      }
                    },
                    text: UserInfoFormConstants.submitButton,
                  ),
                  const Divider(
                    color: Colors.transparent,
                    thickness: 7,
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
