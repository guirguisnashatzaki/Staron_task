import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:staron_task/Presentation/Screens/CustomerAccountAdd.dart';

import '../../SQLFLITE/Db_Helper.dart';
import '../../constant.dart';
import '../Screens/Home.dart';

class CustomerAccountWidget extends StatefulWidget {
  DbHelper? db;
  CustomerAccountWidget({Key? key,required this.db}) : super(key: key);

  @override
  State<CustomerAccountWidget> createState() => _CustomerAccountWidgetState();
}

class _CustomerAccountWidgetState extends State<CustomerAccountWidget> {

  final Dio dio = Dio();

  Future<List> getAccounts()async{
    Response response;
    response = await dio.get(baseURL+'customer_accounts');
    Map js = response.data as Map;
    var i = js['data'];
    List out = [];
    for (final data in i) {
      out.add(data);
    }
    return out;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, AsyncSnapshot<List> snapshot){

        if(snapshot.hasData){
          return ListView(
            children: List.generate(snapshot.data!.length, (index) => CustomerAccountListItem(model: snapshot.data![index],)),
          );
        }else{
          return const Center(child: Text("No data Found"));
        }

      },
      future: getAccounts(),
    );
  }
}


class CustomerAccountListItem extends StatefulWidget {
  Map model;
  CustomerAccountListItem({Key? key,required this.model}) : super(key: key);

  @override
  State<CustomerAccountListItem> createState() => _CustomerAccountListItemState();
}

class _CustomerAccountListItemState extends State<CustomerAccountListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.black),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 4,
              offset: Offset(4, 8), // Shadow position
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text("Account Name : "+widget.model['accountName'].toString()),
              Text("Account Type : "+widget.model['accountNumber'].toString()),
              Text("contactName : "+widget.model['contactName'].toString()),
              Text("Email : "+widget.model['email'].toString()),
              Text("Phone : "+widget.model['phone'].toString()),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (builder)=> CustomerAccountAdd(update: true,object: widget.model,)));


                    },
                    icon: const Icon(Icons.edit),
                    color: Colors.white,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue)
                    ),
                  ),
                  IconButton(
                    onPressed: (){

                      final Dio dio=Dio();

                      dio.delete(baseURL+"delCusAcc/"+widget.model['customerId'].toString()).whenComplete((){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> Home(dest: 'CA',)));
                      });

                    },
                    icon: const Icon(Icons.delete),
                    color: Colors.white,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)
                    ),
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}




