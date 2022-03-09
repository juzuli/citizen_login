import 'package:flutter/material.dart';

class BottomOptions extends StatelessWidget {
  const BottomOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
