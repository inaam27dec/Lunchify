import 'package:flutter/material.dart';
import 'package:lunch_portal/lunch_portal.dart';
import 'package:lunch_portal/data/model/UserOrderDataModel.dart';
import '../../../../../../data/model/UserDataModel.dart';
import '../../../../../../utilities/customViews/app_dialogs.dart';
import '../../edit_user_profile/edit_user_profile_screen.dart';
import 'custom_widgets.dart';
import '../../../../../../utilities/utils/colors.dart';
import '../../../../../../utilities/utils/constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Body();
}

class _Body extends State<Body> {
  late Future<UserDataModel?> fetchedUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fetchedUser = LunchPortal.userViewModel.getUserData();
    return SafeArea(
      child: FutureBuilder(
        future: fetchedUser,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            UserDataModel user = snapshot.data as UserDataModel;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(
                              AppConstants.borderRadius,
                            ),
                            bottomRight: Radius.circular(
                              AppConstants.borderRadius,
                            ),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: AppColors.signupBackgroundGradient,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 9,
                          left: 19,
                          right: 19,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () => showLogoutAlertDialog(context),
                              icon: const Icon(
                                Icons.logout_outlined,
                                color: AppColors.whiteColor,
                                size: AppConstants.iconSize,
                              ),
                            ),
                            IconButton(
                              onPressed: () => Navigator.pushNamed(
                                context,
                                EditUserProfile.routeName,
                              ).then(
                                (_) => setState(() {}),
                              ),
                              icon: const Icon(
                                Icons.edit_outlined,
                                color: AppColors.whiteColor,
                                size: AppConstants.iconSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * .095,
                        left: MediaQuery.of(context).size.width * .025,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.97,
                              child: Text(
                                '${user.fName} ${user.lName}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.035,
                            ),
                            const CircleAvatar(
                              backgroundColor: AppColors.primary,
                              radius: 41,
                              child: CircleAvatar(
                                backgroundColor: AppColors.whiteColor,
                                radius: 40,
                                child: Icon(
                                  size: 70,
                                  Icons.person,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      /*
                      Positioned(
                        top: MediaQuery.of(context).size.height * .165,
                        left: MediaQuery.of(context).size.width * .4,
                        child: const CircleAvatar(
                          backgroundColor: CustomColors.primary,
                          radius: 41,
                          child: CircleAvatar(
                            backgroundColor: CustomColors.profileBg,
                            radius: 40,
                            child: Icon(
                              size: 70,
                              Icons.person,
                            ),
                          ),
                        ),
                      ),
                      */
                    ],
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Divider(
                              color: Colors.transparent,
                            ),
                            profileTile(
                              icon: Icons.person_outline,
                              content: '${user.fName} ${user.lName}',
                            ),
                            profileTile(
                              icon: Icons.email_outlined,
                              content: '${user.eMail}',
                            ),
                            profileTile(
                              icon: Icons.phone_outlined,
                              content: '${user.pNumber}',
                            ),
                            profileTile(
                              icon: Icons.location_city_outlined,
                              content: '${user.address}',
                            ),
                            profileTile(
                              icon: Icons.people_outlined,
                              content: '${user.team} Team',
                            ),
                            profileTile(
                              icon: Icons.countertops_outlined,
                              content: 'Floor # ${user.floorNumber}',
                            ),
                            const Divider(
                              color: Colors.transparent,
                            ),
                            /*
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 25,
                                right: 25,
                                top: 9,
                                bottom: 9,
                              ),
                              child: submitButton(
                                  text: 'Edit Profile',
                                  onPressed: () => Navigator.pushNamed(
                                      context, EditUserProfile.routeName)),
                            ),
                            */
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
