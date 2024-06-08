import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:palestine/Widgets/wall_block.dart';
import 'package:palestine/Widgets/wall_description.dart';
import 'package:palestine/Widgets/wall_header.dart';
import 'buttons.dart';

class Wall extends StatefulWidget {
  final List<Map<dynamic, dynamic>> posts;

  const Wall({super.key, required this.posts});

  @override
  State<Wall> createState() => _WallState();
}

class _WallState extends State<Wall> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('firebasePosts')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        var firebaseData = snapshot.data?.docs ?? [];
        return Stack(
          children: [
            firebaseData.isEmpty ? Center(child: Text("No Feeds Yet"))
            :ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: firebaseData.length,
              itemBuilder: (BuildContext context, int index) {
                var firePost = firebaseData[index].data() as Map<dynamic, dynamic>;
                Timestamp timestamp = firePost['timestamp'] ?? Timestamp.now();
                String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(timestamp.toDate());
                return Stack(
                  children: [
                    const WallBlock(),
                    WallHeader(name: firePost['name'], date: formattedDate),
                    WallText(description: firePost['description']),
                   //  Buttons(),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}