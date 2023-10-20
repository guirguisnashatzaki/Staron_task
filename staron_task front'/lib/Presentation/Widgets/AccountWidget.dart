
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:staron_task/Presentation/Screens/AccountAdd.dart';
import 'package:staron_task/SQLFLITE/Db_Helper.dart';
import 'package:staron_task/SQLFLITE/Models/Account_model.dart';
import 'package:staron_task/constant.dart';

import '../Screens/Home.dart';

class AccountWidget extends StatefulWidget {
  DbHelper? db;
  AccountWidget({Key? key,required this.db}) : super(key: key);

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {

  late Future<List<AccountModel>> list;
  final dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getAccounts();
    super.initState();
  }

  Future<List> getAccounts()async{
    Response response;
    response = await dio.get(baseURL+'accounts').onError((error, stackTrace){
      print(error.toString());
      return Response(requestOptions: RequestOptions());
    });
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
            children: List.generate(snapshot.data!.length, (index) => AccountListItem(model: snapshot.data![index],)),
          );
        }else{
          return const Center(child: Text("No data Found"));
        }

      },
      future: getAccounts(),
    );
  }
}


class AccountListItem extends StatefulWidget {
  Map model;
  AccountListItem({Key? key,required this.model}) : super(key: key);

  @override
  State<AccountListItem> createState() => _AccountListItemState();
}

class _AccountListItemState extends State<AccountListItem> {

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
                Text("Account Name : "+widget.model['accountName']),
                Text("Account Type : "+widget.model['accountType']),
                Text("Normal Side : "+widget.model['normalSide']),
                Text("Account Number : "+widget.model['accountNumber'].toString()),
                Text("Balance : "+widget.model['balance'].toString()),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=> AccountAdd(update: true,object: widget.model, db: DbHelper(),)));


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

                        dio.delete(baseURL+"delAcc/"+widget.model['accountId'].toString()).whenComplete((){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> Home(dest: 'A',)));
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