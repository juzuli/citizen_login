import 'package:flutter/material.dart';
import 'package:indeed/src/models/contact_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final res= ModalRoute.of(context)!.settings.arguments as ContactModel;
    return Scaffold(
      appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              res.name!,
              style: const TextStyle(
                fontSize: 20
              ),
            ),
            Text(
                res.company!,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Text(res.address!)
          ],
        ),
      ),
    );
  }
}
