import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarRentalApp {
  // static const String appName = 'e-Shop';
  static const String appName = 'car-rental-app';

  static SharedPreferences? sharedPreferences;
  static FirebaseUser? user;
  static FirebaseAuth? auth;
  static Firestore? firestore;

  static String collectionUser = "users";
  static String collectionOrders = "orders";
  //userCollection is the list of cars he/she selected
  static String userCollectionList = 'userCollection';
  static String subCollectionAddress = 'userAddress';

  static final String userName = 'name';
  static final String userEmail = 'email';
  static final String userPhotoUrl = 'photoUrl';
  static final String userUID = 'uid';
  static final String userAddress = 'address';
  static final String userPhone = 'phone';
  static final String userAvatarUrl = 'url';

  static final String addressID = 'addressID';
  static final String totalAmount = 'totalAmount';
  static final String productID = 'productIDs';
  static final String paymentDetails = 'paymentDetails';
  static final String orderTime = 'orderTime';
  static final String isSuccess = 'isSuccess';
}
