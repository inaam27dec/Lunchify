import '../../utilities/utils/constants.dart';

class UserDataModel {
  UserDataModel(
      {required this.id,
      required this.fName,
      required this.lName,
      required this.eMail,
      required this.pNumber,
      required this.address,
      required this.floorNumber,
      required this.team});

  String id;
  String fName;
  String lName;
  String eMail;
  String pNumber;
  String address;
  int floorNumber;
  String team;

  UserDataModel.fromJson(Map<String, Object?> json) : this(
          id: json[UserConstants.id]! as String,
          fName: json[UserConstants.fName]! as String,
          lName: json[UserConstants.lName]! as String,
          eMail: json[UserConstants.eMail]! as String,
          pNumber: json[UserConstants.pNumber]! as String,
          address: json[UserConstants.address]! as String,
          floorNumber: json[UserConstants.floorNumber]! as int,
          team: json[UserConstants.team]! as String,
        );

  Map<String, Object?> toJson() {
    return {
      UserConstants.id: id,
      UserConstants.fName: fName,
      UserConstants.lName: lName,
      UserConstants.eMail: eMail,
      UserConstants.pNumber: pNumber,
      UserConstants.address: address,
      UserConstants.floorNumber: floorNumber,
      UserConstants.team: team,
    };
  }
}
