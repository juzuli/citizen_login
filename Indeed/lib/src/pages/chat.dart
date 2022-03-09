import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  String dropdownvalue = 'Inbox';
  var items = ['Inbox','Archive','Spam'];

  @override
  Widget build(BuildContext context) {
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
  }
}

