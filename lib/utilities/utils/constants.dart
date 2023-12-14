class UserConstants {
  static const String id = 'userId';
  static const String fName = 'firstName';
  static const String lName = 'lastName';
  static const String eMail = 'eMail';
  static const String pNumber = 'phoneNumber';
  static const String address = 'address';
  static const String floorNumber = 'floorNumber';
  static const String team = 'team';
}

class CategoryConstants {
  static const String id = "id";
  static const String name = "name";
  static const String image = "imageUrl";
  static const String searchHint = "Search";
  static const topHeading = "Please select category";
}

class FoodItemConstants{
  static const String id="id";
  static const String name="name";
  static const String imageUrl="imageUrl";
  static const String price="price";
}

class UserInfoFormConstants {
  static const String firstName = 'First Name*';
  static const String lastName = 'Last Name*';
  static const String address = 'Address*';
  static const String phoneNumber = 'Phone Number*';
  static const String floorLabel = 'Select Floor*';
  static const String teamLabel = 'Select Team*';
  static const String submitButton = 'Save';
}

class LoginFormConstants {
  static const String emailAddress = 'Email Address';
  static const String password = 'Password';
  static const String signin = 'Signin';
}

class AppConstants {
  static const String appName = "Lunchify";
  static const String googleLogoPath = "assets/images/googlelogo.png";
  static const String appLogoPath = "assets/images/Lunchify.png";
  static const String bgImagePath = "assets/images/bg_main_screen.jpeg";
  static const double buttonSize = 55;
  static const double dropdownHintSize = 15;
  static const double buttonWideSize = 115;
  static const double buttonTextSize = 18;
  static const double smallTextSize = 16;
  static const double headingTextSize = 40;
  static const double normalHeadingTextSize = 30;
  static const double borderRadius = 50;
  static const double borderWidth = 1.5;
  static const double iconSize = 32;
  static const double cartItemBorderRadius = 10;
  static const categoryCardRadius = 10.00;
  static const categoryCardBottomLeftRadius = 20.00;
  static const categoryImageTopRadius = 8.00;
  static const categoryImageHeight = 180.00;
  static const categoryCardMargin = 8.0;
  static const headingSize2 = 25.0;
  static const bottomSheetCorners = 20.0;
  static const bottomSheetHeight = 150.0;
  static const isAdmin = 1;
  static const isUserExist = 2;
  static const isUserNotExist = 3;
  static const wrongCredentials = -1;
  static const defaultScreenMargins = 20.0;
}

class AppAlerts {
  static const alertTitle = "Alert";
  static const deleteDesc = "Are you sure, want to delete this category?";
  static const invalidCredentials = "Wrong email or password";
}

class FirebaseConstants {
  static const userCollection = "users";
  static const emailOfUser = 'eMail';
  static const adminCollection = 'admin';
  static const emailOfAdmin = 'email';
  static const orderCollection ="orders";

  static const appDataCollection = 'appData';
  static const floorsDocument = 'floors';
  static const teamsDocument = 'teams';
  static const categoryCollection = "categories";
  static const itemsCollection = "items";
  static const isEnabled="isEnabled";
  static const orderUserCollection="user";
  static const orderFoodItemCollection="orderItems";
}

class ValidatorConstants {
  static const passwordLengthError = "Length must be greater than 6";
  static const emailError = "Email is not correct";
}

class RouteConstants {
  ///Authentication Route Name
  static const loginRoute = "Login_Screen";
  static const signUpRoute = "Sign_Up_Screen";

  static const adminDashboardRoute = "Admin_Dashboard_Screen";
  static const createEditCategoryRoute = "Create_Edit_Category_Screen";
}

class SharedPreferenceConstants{
  static const isUserAdmin="is_User_Admin";
}
