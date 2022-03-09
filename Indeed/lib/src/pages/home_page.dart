import 'package:flutter/material.dart';
import 'package:indeed/src/pages/chat.dart';
import 'package:indeed/src/pages/notifications.dart';
import 'package:indeed/src/pages/recent_searches.dart';

import 'job_feed.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/images/SampleLogo.png',
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return const Chat();
                  },
                ));
              },
              icon: const Icon(Icons.chat_rounded, color: Colors.black),
            ),
            const SizedBox(
              width: 35,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return const Notifications();
                  },
                ));
              },
              icon: const Icon(Icons.notifications, color: Colors.black),
            ),
            const SizedBox(
              width: 14,
            ),
            Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(Icons.dehaze_rounded, color: Colors.black));
            }),
            const SizedBox(
              width: 4,
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SafeArea(
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      labelText: "Find a Job",
                      contentPadding: const EdgeInsets.all(16),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
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
                  title: Text(
                    "Find Jobs",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text(
                    "Company reviews",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text(
                    "Salary Guide",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text(
                    "Employers",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text(
                    "Profile",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text(
                    "My jobs",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text(
                    "My reviews",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text(
                    "My subscriptions",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text(
                    "Settings",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text(
                    "Country and language",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Row(
                    children: const [Icon(Icons.flag), Text("India")],
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text(
                    "Help Centre",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text(
                    "Sign out",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text("juzulitry@gmail.com"),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(children: const [
          TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Job feed",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text("Recent searches",
                    style: TextStyle(color: Colors.black)),
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
        ]),
      ),
    );
  }
}
