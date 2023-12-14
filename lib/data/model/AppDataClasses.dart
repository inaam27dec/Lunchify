class CreateEditCategoryArguments {
  String id = "";
  bool isCreate = false;
  String name = "";
  String imageUrl = "";

  CreateEditCategoryArguments(
      {required this.id,
      required this.isCreate,
      required this.name,
      required this.imageUrl});
}