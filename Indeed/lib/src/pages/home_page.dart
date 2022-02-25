import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:indeed/src/pages/recent_searches.dart';

import 'job_feed.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String dropdownvalue = 'Inbox';
  var items = ['Inbox','Archive','Spam'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Image.asset('assets/images/Indeed_logo.png',scale: 30,),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 0,
                      actions: [
                        IconButton(onPressed: (){}, icon: const Icon(Icons.home))
                      ],
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(80.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SafeArea(
                            child:
                            DropdownButton(
                              isDense: true,
                              borderRadius: BorderRadius.circular(16),
                              alignment: Alignment.center,
                              isExpanded: true,

                              // Initial Value
                              value: dropdownvalue,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Builder(
                                    builder: (context) {
                                      return Text(items);
                                    }
                                  ),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                            // TextFormField(
                            //   item
                            //   decoration: InputDecoration(
                            //       prefixIcon: Icon(Icons.search),
                            //       labelText: "Find a Job",
                            //       contentPadding: EdgeInsets.all(16),
                            //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
                            // ),
                          ),
                        ),
                      ),
                        ),
                    body: Center(
                      child: Image.asset('assets/images/messages.jpg',scale: 1,),
                    )
                  );
                },
              ));
            }, icon: const Icon(Icons.chat_rounded,color: Colors.black),),
            const SizedBox(width: 35,),
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return DefaultTabController(
                        initialIndex: 1,
                        length: 3,
                        child: Scaffold(
                          appBar: AppBar(
                            elevation: 0,
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              title: const Image(image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Indeed_logo.svg/2560px-Indeed_logo.svg.png",scale: 30)),
                              actions: [
                                IconButton(
                                    onPressed: (){

                                    },
                                    icon: const Icon(Icons.home))
                              ],
                            bottom: TabBar(
                              tabs: <Widget>[
                                const Tab(
                                  child: Icon(Icons.chat_rounded,color: Colors.black),
                                ),
                                const Tab(
                                  child: Icon(Icons.notifications,color: Colors.black),
                                ),
                                Tab(
                                  child: Builder(
                                      builder: (context) {
                                        return IconButton(
                                            onPressed: (){
                                              Scaffold.of(context).openEndDrawer();
                                            },
                                            icon: const Icon(Icons.dehaze_rounded,color: Colors.black));
                                      }
                                  ),
                                ),
                              ],
                            ),
                          ),
                          body: TabBarView(
                            children: <Widget>[
                              const Center(
                                child: Text("It's cloudy here"),
                              ),
                              Center(
                                child: ListView(
                                  children: [
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(24.0),
                                      child: Text("Notifications",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 500,
                                          color: Colors.white,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset('assets/images/notification.jpg',scale: 3,),
                                                const SizedBox(
                                                  width: 250,
                                                    child: Text("Welcome to your notification box!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)
                                                ),
                                                const SizedBox(height: 8,),
                                                const Text("Once you begin a job search,we'll notify you here about maching jobs, the application status, resume tips, and helpful interview advice.",
                                                textAlign: TextAlign.center,style: TextStyle(fontSize: 16),
                                                ),
                                                const SizedBox(height: 16,),
                                                Center(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: const [
                                                      Text("Find jobs",style: TextStyle(color: Colors.indigo,fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                                      Icon(Icons.arrow_forward,color: Colors.indigo,)
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 16,),
                                              ],
                                            ),
                                          ),
                                      ),
                                    ),
                                    const SizedBox(height: 230,),
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
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("©2022 Indeed"),
                                    ),
                                    const SizedBox(height: 12),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Wrap(
                                        alignment: WrapAlignment.center,
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
                                    ),
                                    const SizedBox(height: 12),
                                  ],
                                ),
                              ),
                              const Center(
                                child: Text("It's sunny here"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ));
                },
                icon: const Icon(Icons.notifications,color: Colors.black),),
            const SizedBox(width: 14,),
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: (){
                      Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(Icons.dehaze_rounded,color: Colors.black));
              }
            ),
            const SizedBox(width: 4,)
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SafeArea(
                child:
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      labelText: "Find a Job",
                      contentPadding: const EdgeInsets.all(16),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
                ),
              ),
            ),
          ),
        ),
        endDrawer: Drawer(
          child: SafeArea(
            child: ListView(
              children: [
                const ListTile(
                  title: Text("Find Jobs",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Company reviews",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Salary Guide",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Employers",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
                ),
                const Divider(),
                const ListTile(
                  title: Text("My jobs",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
                ),
                const Divider(),
                const ListTile(
                  title: Text("My reviews",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
                ),
                const Divider(),
                const ListTile(
                  title: Text("My subscriptions",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Settings",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
                ),
                const Divider(),
                ListTile(
                  title: const Text("Country and language",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  subtitle: Row(
                    children: const [
                      Icon(Icons.flag),
                      Text("India")
                    ],
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right,color: Colors.black,),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Help Centre",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Sign out",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  subtitle: Text("juzulitry@gmail.com"),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
                ),
                const Divider(),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
            children :const [TabBar(
              tabs: <Widget>[
                Tab(
                  child: Text("Job feed",style: TextStyle(color: Colors.black),),
                ),
                Tab(
                  child: Text("Recent searches",style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
              Expanded(
                child: TabBarView(
                  children: [
                    JobFeed(),
                    RecentSearches(),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}