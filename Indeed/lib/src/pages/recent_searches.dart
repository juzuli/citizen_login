import 'package:flutter/material.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(22.0),
                child: Text("Create your profile",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
              Icon(Icons.keyboard_arrow_right_sharp,color: Colors.black26,)
            ],
          ),
          const Divider(),
          const ListTile(
            title: Text("juzulitry@gmail.com",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            trailing: Icon(Icons.keyboard_arrow_right_sharp),
          ),
          const Divider(),
          const ListTile(
            title: Text("job Seekers",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            trailing: Icon(Icons.keyboard_arrow_down_sharp),
          ),
          const Divider(),
          const ListTile(
            title: Text("Employers",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            trailing: Icon(Icons.keyboard_arrow_down_sharp),
          ),
          const Divider(),
          const ListTile(
            title: Text("About",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            trailing: Icon(Icons.keyboard_arrow_down_sharp),
          ),
          const Divider(),
          const SizedBox(height: 18),
          const Text("©2022 Indeed"),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              Text("Accessibility at Indeed"),
              Text("Privacy Center"),
              Text("Cookies"),
              Text("Privacy"),
              Text("Terms"),
            ],
          ),
          const SizedBox(height: 12),
        ],
        ),
      ),
    );
  }
}
