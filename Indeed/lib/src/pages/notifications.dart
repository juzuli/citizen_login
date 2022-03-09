import 'package:flutter/material.dart';
import 'package:indeed/src/pages/chat.dart';
import 'package:indeed/src/pages/fragments/bottom.dart';
import 'package:indeed/src/pages/fragments/bottom_options.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Image(
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Indeed_logo.svg/2560px-Indeed_logo.svg.png",
                  scale: 30)),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.home))
          ],
          bottom: TabBar(
            tabs: <Widget>[
              const Tab(
                child: Icon(Icons.chat_rounded,
                    color: Colors.black),
              ),
              const Tab(
                child: Icon(Icons.notifications,
                    color: Colors.black),
              ),
              Tab(
                child: Builder(builder: (context) {
                  return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: const Icon(Icons.dehaze_rounded,
                          color: Colors.black));
                }),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            const Chat(),
            Center(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text(
                      "Notifications",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: 500,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/notification.jpg',
                              scale: 3,
                            ),
                            const SizedBox(
                                width: 250,
                                child: Text(
                                  "Welcome to your notification box!",
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight.bold,
                                      fontSize: 30),
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Once you begin a job search,we'll notify you here about maching jobs, the application status, resume tips, and helpful interview advice.",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Find jobs",
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontSize: 18,
                                        fontWeight:
                                        FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.indigo,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 230,
                  ),
                  const BottomOptions(),
                  const Bottom(),
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
  }
}

