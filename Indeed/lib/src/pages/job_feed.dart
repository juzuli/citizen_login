import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indeed/src/bloc/contacts/contact_cubit.dart';
import 'package:indeed/src/models/contact_model.dart';
import 'package:indeed/src/pages/fragments/bottom.dart';
import 'package:indeed/src/pages/fragments/bottom_options.dart';

class JobFeed extends StatefulWidget {
  const JobFeed({Key? key}) : super(key: key);

  @override
  _JobFeedState createState() => _JobFeedState();
}

class _JobFeedState extends State<JobFeed> {

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          child: ListView(
            children: [
              BlocBuilder<ContactCubit,ContactState>(
                builder: (context,state){
                  if(state is ContactLoading){
                    return const CircularProgressIndicator();
                  }else if(state is ContactLoaded){
                    List<ContactModel> contacts = state.contacts;
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                        itemBuilder: (context,pos){
                          return Column(
                            children: [
                          Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("new",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 8,),
                                      Text(contacts[pos].name??'',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                      const SizedBox(height: 4,),
                                      Text(contacts[pos].company??'',style: const TextStyle(fontSize: 18),),
                                      const SizedBox(height: 4,),
                                      Text(contacts[pos].address??'',style: const TextStyle(fontSize: 18),),
                                      const SizedBox(height: 8,),
                                      Text(contacts[pos].update??"",style: const TextStyle(color: Colors.black45,fontSize: 12),)
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                      Icon(Icons.favorite_border),
                                      SizedBox(height: 12,),
                                      Icon(Icons.do_disturb),

                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                            ],
                          );
                        },
                        separatorBuilder: (context,pos)=>const Divider(),
                        itemCount: contacts.length,
                    );
                  }else if(state is ContactLoadError){
                    return Text(state.errorMessage);
                  }
                  else{
                    return Container();
                  }
                },
              ),
              const BottomOptions(),
              const Bottom()
            ],
          ),
        ),
      ),
    );
  }
  void fetchData() {
    BlocProvider.of<ContactCubit>(context).loadContacts();
  }

}
