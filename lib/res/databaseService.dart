import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/userdata.dart';

class DatabaseService{

final String uid;
DatabaseService({required this.uid});

final CollectionReference userCollection= FirebaseFirestore.instance.collection('users');

Future updateUserData( String username,String email, String password,String phone_number,String bio, String category) async
{
    return await userCollection.doc(uid).set({
          'username': username,
          'email':email,
          'password':password,   
           'phone_number':phone_number,
             'bio':bio,
            'category': category,
    });
}

/*User1 _userDataFromSnapshots(DocumentSnapshot snapshot)
{
  return User1(
         uid: uid,
         usernamee: snapshot.data()['username'],
         email:snapshot.data()?['email'],
         password:snapshot.data()?['password'],   
         phonenumber:snapshot.data()?['phone_number'],
         full_name:snapshot.data()?['full_name'],
         category: snapshot.data()?['category'],
  );
}


Stream <List<users>> get users{
  return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
}*/

User1 _userDataFromSnapshots(DocumentSnapshot snapshot, String uid) {
  final data = snapshot.data() as Map<String, dynamic>;
  return User1(
    //uid: uid,
    usernamee: data['username'],
    email: data['email'],
    password: data['password'],
    phonenumber: data['phone_number'],
    bio: data['bio'],
    category: data['category'],

  );
}


/*Stream<User1> get userData{
return userCollection.doc(uid).snapshots().map(_userDataDromSnapshots);

}*/
Stream<User1> get userData {
  return userCollection.doc(uid).snapshots().map((snapshot) => _userDataFromSnapshots(snapshot, uid));
}




}