import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bitslaundry/Authentication/phone_auth.dart';
import 'package:bitslaundry/Authentication/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bitslaundry/Authentication/signup.dart' as prefix0;
import 'package:bitslaundry/Pages/home_page.dart';
import 'package:bitslaundry/Authentication/signup.dart';
import 'package:bitslaundry/Pages/home_page.dart' as prefix1;

import 'package:provider/provider.dart';
import 'package:bitslaundry/Components/cartItemBottomSheet.dart';
import 'pages/home_page.dart';
import 'Model/cartModel.dart';
import 'pages/home_page.dart';
import 'package:bitslaundry/Payment_gatway/payment_gateway.dart';
import 'Pages/Address/select_address.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var firebaseApp = await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var phone = prefs.getString('phone');
  var password = prefs.getString('password');

  runApp(MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => CartModel(0)),

              Provider(create: (context) => prefix1.HomePage()),
             
              Provider(create: (context) => CartItemBottomSheet()),
              Provider(create: (context) => prefix1.ClothCardBuilder()),
               Provider(create: (context) => PaymentGateway()),
               Provider(create: (context) => SelectAddress()),

            ],

            child: MaterialApp(home: phone == null && password==null ? SignUp() : prefix1.HomePage())
        ));
}



