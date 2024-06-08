import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:palestine/utils/dimensions.dart';

import '../../Widgets/buttons.dart';
import '../../Widgets/wall_block.dart';
import '../../Widgets/wall_description.dart';
import '../../Widgets/wall_header.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List <Map<String,dynamic>> searchResults=[];

  void searchPosts(String query) async {
    if (query.isEmpty) {
      setState(() {
        searchResults.clear();
      });
      return;
    }

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('firebasePosts')
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: query + '\uf8ff')
        .get();

    setState(() {
      searchResults = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Posts'),
      ),
      body: Padding(
        padding:  EdgeInsets.all(Dimensions.height16),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                searchPosts(query);
              },
            ),
             SizedBox(height: Dimensions.height16),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  var result = searchResults[index];
                  return Stack(
                    children: [
                      const WallBlock(),
                      WallHeader(name: result['name'], date: ''),
                      WallText(description: result['description']),
                    //  Buttons(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
