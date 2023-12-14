import '../../utilities/utils/constants.dart';

class CategoryDataModel {
  late String id;
  late String name;
  late String imageUrl;

  CategoryDataModel(
      {required this.id, required this.name, required this.imageUrl});

  CategoryDataModel.fromJson(Map<String, Object?> json)
      : id = json[CategoryConstants.id]! as String,
        name = json[CategoryConstants.name]! as String,
        imageUrl = json[CategoryConstants.image]! as String;

  CategoryDataModel.fromSnapshot(snapshot, this.id)
      : name = snapshot.data()[CategoryConstants.name],
        imageUrl = snapshot.data()[CategoryConstants.image];
}
