import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//  CloudFirestoreClass cloudFirestoreClass = CloudFirestoreClass();

  Future<String> signUpUser(
      {required String name,
      required String email,
      required String category,
      required String address,
      required String phone,
      required String password}) async {
    name.trim();
    phone.trim();
    address.trim();
    category.trim();
    email.trim();
    password.trim();
    
    String output = "Something went wrong";
    if (name != "" &&
        email != "" &&
        password != "" &&
        category != "" &&
        phone != "" &&
        address != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(email: email, password:password
            );
      //   UserDetailsModel user = UserDetailsModel(name: name, address: address);
      //   await cloudFirestoreClass.uploadNameAndAddressToDatabase(user: user);
      output = "success";
       } on FirebaseAuthException catch (e) {
        output = e.message.toString();
     }
    } else {
      output = "Please fill up all the fields.";
    }
    return output;
  }

   Future<String> signInUser(
      {
       
      required String email,
     
      required String password}) async {
   
    email.trim();
    password.trim();
    
    String output = "Something went wrong";
    if (
        email != "" &&
        password != "" 
        ) {
      try {
        await firebaseAuth.signInWithEmailAndPassword(email: email, password:password
            );
      //   UserDetailsModel user = UserDetailsModel(name: name, address: address);
      //   await cloudFirestoreClass.uploadNameAndAddressToDatabase(user: user);
      output = "success";
       } on FirebaseAuthException catch (e) {
        output = e.message.toString();
     }
    } else {
      output = "Please fill up all the fields.";
    }
    return output;
  }



  
}
