import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lunch_portal/data/model/UserOrderDataModel.dart';
import 'package:lunch_portal/viewModel/AdminViewModel.dart';

import '../../../../../../../lunch_portal.dart';
import '../../../../../data/model/AppDataClasses.dart';
import '../../../../../data/model/CategoryDataModel.dart';
import '../../../../../utilities/customViews/app_dialogs.dart';
import '../../../../../utilities/utils/colors.dart';
import '../../../../../utilities/utils/constants.dart';
import '../create_edit_category/create_edit_category_screen.dart';
import 'category_card_item_admin.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<List<CategoryDataModel>> categoryData;
  List<CategoryDataModel> categoriesList = [];
  List<CategoryDataModel> filteredList = [];
  String searchQuery = "";

  @override
  void initState() {
    categoryData = LunchPortal.userViewModel.getCategoriesFromFireStore();
    super.initState();
    categoriesList.insert(0, CategoryDataModel(id: "", name: "", imageUrl: ""));
    onSearch(searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 200) / 2;
    final double itemWidth = size.width / 2;
    final double topMargin = size.height * 0.07;

    return FutureBuilder(
        future: categoryData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            categoriesList = snapshot.data as List<CategoryDataModel>;
            onSearch(searchQuery);

            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: topMargin),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Manage Categories",
                              style: TextStyle(
                                  fontSize: AppConstants.headingSize2,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                hintText: CategoryConstants.searchHint,
                                fillColor: AppColors.searchColor,
                                filled: true,
                                isDense: true,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(
                                    AppConstants.categoryCardRadius),
                                hoverColor: Colors.white),
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value;
                                onSearch(searchQuery);
                              });
                            },
                            textAlign: TextAlign.justify,
                            textAlignVertical: TextAlignVertical.center,
                          ),
                        ]),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: AppConstants.categoryCardRadius,
                          left: AppConstants.categoryCardRadius,
                          right: AppConstants.categoryCardRadius),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // childAspectRatio: (itemWidth / itemHeight),
                          mainAxisExtent: 250,
                        ),
                        itemCount: filteredList.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          final item = filteredList[index];
                          return GestureDetector(
                            onTap: () {
                              onCardTap(item.id, index);
                            },
                            child: CategoryCardItemAdmin(
                                image: item.imageUrl,
                                categoryName: item.name,
                                imageHeight: itemHeight / 1.8,
                                index: index),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return const Center();
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  onCardTap(String id, int index) {
    if (kDebugMode) {
      if (index == 0) {
        Navigator.pushNamed(context, CreateEditCategoryScreen.routeName,
            arguments: CreateEditCategoryArguments(
                id: "", isCreate: true, name: "", imageUrl: ""));
      } else {
        showSheet(index);
      }
    }
  }

  showSheet(int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: AppConstants.bottomSheetHeight,
            color: AppColors.appTransparentColor,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppConstants.bottomSheetCorners),
                      topRight:
                          Radius.circular(AppConstants.bottomSheetCorners))),
              child: buildBottomNavigationMenu(index),
            ),
          );
        });
  }

  Column buildBottomNavigationMenu(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListTile(
          leading: const Icon(
            Icons.edit,
            color: AppColors.textColor,
          ),
          title: const Text(
            'Edit Category',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.textColor),
          ),
          onTap: () => gotoNextScreen(index, false),
        ),
        ListTile(
          leading: const Icon(
            Icons.delete,
            color: AppColors.errorColor,
          ),
          title: const Text(
            'Delete Category',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.errorColor),
          ),
          onTap: () => gotoNextScreen(index, true),
        ),
      ],
    );
  }

  gotoNextScreen(int index, bool isDelete) {
    Navigator.pop(context);
    if (isDelete) {
      showConfirmationDialog(context, AppAlerts.alertTitle,
          AppAlerts.deleteDesc, index, (index) => onPressedYes(index));
    } else {
      //edit Category
      Navigator.pushNamed(context, CreateEditCategoryScreen.routeName,
          arguments: CreateEditCategoryArguments(
            id: categoriesList[index - 1].id,
            isCreate: false,
            name: categoriesList[index - 1].name,
            imageUrl: categoriesList[index - 1].imageUrl,
          ));
    }
  }

  onPressedYes(int index) async {
    showHideDialog(context, true);
    if (await LunchPortal.adminViewModel
        .isCategoryDeleted(categoriesList[index - 1].id)) {
      showHideDialog(context, false);
      setState(() {
        categoriesList.removeAt(index - 1);
        filteredList.removeAt(index - 1);
      });
    } else {
      showHideDialog(context, false);
    }
  }

  onSearch(String query) {
    final filtered = categoriesList.where((category) {
      final categoryName = category.name.toLowerCase();
      final input = query.toLowerCase();
      return categoryName.contains(input);
    }).toList();
    filteredList.clear();
    filteredList.insert(0, CategoryDataModel(id: "", name: "", imageUrl: ""));
    filteredList.addAll(filtered);
  }
}

class Category {
  late String image;
  late String text;

  Category(this.image, this.text);
}
