import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palestine/Widgets/circle_avatar_home.dart';
import 'package:palestine/utils/dimensions.dart';

import '../../Widgets/circle_avatar.dart';
import '../../Widgets/wall.dart';
import '../searchscreen/search_screen.dart';
import '../signin_screen/sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String screenRoute='homescreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<dynamic,dynamic>> posts =[];
  List<QueryDocumentSnapshot> firebaseData=[];
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  CollectionReference firebasePosts = FirebaseFirestore.instance.collection('firebasePosts');
  final _auth=FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;





  Future<void> addFirebasePost() {
    // Call the user's CollectionReference to add a new user
    return firebasePosts
        .add({
      'name': nameController.text, // John Doe
      'description': descriptionController.text, // Stokes and Sons
      'timestamp': FieldValue.serverTimestamp(),
    })
        .then((value) => print("Post Added"))
        .catchError((error) => print("Failed to add post: $error"));
  }
  void addPost(String name, String description) {
    setState(() {
      posts.add({
        'name': name,
        'description': description,
      });
    });
  }
  void _openAddPostSheet(BuildContext context) {

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
            height: Dimensions.height610,
            child: postSheet(nameController, descriptionController,context));
      },
    );
  }
  Padding postSheet(TextEditingController nameController, TextEditingController descriptionController,BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name - 30 max char'),
              inputFormatters: [
                LengthLimitingTextInputFormatter(30)
              ],
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description - 425 max char'),
              inputFormatters: [
                LengthLimitingTextInputFormatter(425),

              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String description = descriptionController.text;

                if (name.isNotEmpty && description.isNotEmpty&&FirebaseAuth.instance.currentUser!=null) {
                  addPost(name, description);
                  addFirebasePost();
                  Navigator.pop(context);
                  nameController.clear();
                  descriptionController.clear();
                  return;
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Warning'),
                        content: Text(
                            'Please Login so you can add Posts.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context, LoginScreen.screenRoute,(Route<dynamic> route) => false);
                            },
                            child: Text('Login'),
                          ),
                          TextButton(
                            onPressed: () {
                             Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                          ),
                        ],
                      );
                    },
                      );

                }
              },
              child: Text('Post'),
            ),
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 40, 49,1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatarHome(),
            SizedBox(height: Dimensions.height40),
            Wall(posts: posts,),
          ],
        ),
      ),
      floatingActionButton: FLoatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
  Padding FLoatingActionButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Adjust the value to control circularity
            ),
            onPressed: () {
              _openAddPostSheet(context);
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),

          FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Adjust the value to control circularity
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );                },
            backgroundColor: Colors.green,
            child: const Icon(Icons.search),
          ),
          FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Adjust the value to control circularity
            ),
            onPressed: ()async {
              if(user!=null){
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(context, LoginScreen.screenRoute,(Route<dynamic> route) => false);
              }
              else
                return;
              },
            backgroundColor: Colors.green,
            child: const Icon(Icons.logout),
          ),

        ],
      ),
    );
  }

}






