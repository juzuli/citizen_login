import 'package:flutter/material.dart';
import 'package:indeed/src/pages/fragments/bottom.dart';
import 'package:indeed/src/pages/fragments/bottom_options.dart';

class RecentSearches extends StatefulWidget {
  const RecentSearches({Key? key}) : super(key: key);

  @override
  _RecentSearchesState createState() => _RecentSearchesState();
}

class _RecentSearchesState extends State<RecentSearches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:const [
              Text("Recent searches",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              Text("Edit",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45),),
            ], ),
          const SizedBox(height: 12,),
          const ListTile(
            title: Text("Junior flutter developer"),
            subtitle: Text("in Kochi, Kerala"),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          const SizedBox(height: 12,),
          const ListTile(
            title: Text("Kochi, Kerala"),
            subtitle: Text("934 new in Kochi, Kerala"),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          const BottomOptions(),
          const Bottom(),
        ],
        ),
      ),
    );
  }
}
