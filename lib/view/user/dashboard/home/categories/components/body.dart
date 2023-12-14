import 'package:flutter/material.dart';
import 'package:lunch_portal/data/model/UserOrderDataModel.dart';


import '../../../../../../data/model/CategoryDataModel.dart';
import '../../../../../../lunch_portal.dart';
import '../../../../../../utilities/utils/colors.dart';
import '../../../../../../utilities/utils/constants.dart';
import '../../list_items/list_screen.dart';
import 'custom_widget.dart';

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

            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    //TODO: make a constant for padding
                    padding: EdgeInsets.only(
                        left: AppConstants.categoryCardBottomLeftRadius,
                        right: AppConstants.categoryCardBottomLeftRadius,
                        top: topMargin),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              CategoryConstants.topHeading,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
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
                          mainAxisExtent: 250,
                        ),
                        itemCount: filteredList.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          final item = filteredList[index];
                          return GestureDetector(
                            onTap: () {
                              onCardTap(item.id);

                              Navigator.pushNamed(
                                  context, ListItemsScreen.routeName,
                                  arguments: ListItemsScreenArguments(item));
                            },
                            child: CategoryCardItem(
                                image: item.imageUrl,
                                categoryName: item.name,
                                imageHeight: itemHeight / 1.8),
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

  onCardTap(String id) {
    print("card tapped id=${id}");
  }

  onSearch(String query) {
    final filtered = categoriesList.where((category) {
      final categoryName = category.name.toLowerCase();
      final input = query.toLowerCase();
      return categoryName.contains(input);
    }).toList();
    filteredList = filtered;
  }
}
