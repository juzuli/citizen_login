import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indeed/src/bloc/contacts/contact_cubit.dart';
import 'package:indeed/src/models/contact_model.dart';

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
      body: SafeArea(
        child: BlocBuilder<ContactCubit,ContactState>(
          builder: (context,state){
            if(state is ContactLoading){
              return const CircularProgressIndicator();
            }else if(state is ContactLoaded){
              List<ContactModel> contacts = state.contacts;
              return ListView.separated(
                  itemBuilder: (context,pos){
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                      Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Material(
                                color: Colors.white,
                                elevation: 4,
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("new",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
                                          SizedBox(height: 8,),
                                          Text(contacts[pos].name??'',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                          SizedBox(height: 4,),
                                          Text(contacts[pos].company??'',style: TextStyle(fontSize: 18),),
                                          SizedBox(height: 4,),
                                          Text(contacts[pos].address??'',style: TextStyle(fontSize: 18),),
                                          SizedBox(height: 8,),
                                          Text(contacts[pos].update??"",style: TextStyle(color: Colors.black45,fontSize: 12),)
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Icon(Icons.favorite_border),
                                          SizedBox(height: 12,),
                                          Icon(Icons.do_disturb),

                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context,pos)=>const Divider(),
                  itemCount: contacts.length
              );
            }else if(state is ContactLoadError){
              return Text(state.errorMessage);
            }
            else{
              return Container();
            }
          },
        ),
      ),
    );
  }
  void fetchData() {
    BlocProvider.of<ContactCubit>(context).loadContacts();
  }

}
