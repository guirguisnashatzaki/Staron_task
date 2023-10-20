import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staron_task/Presentation/Screens/CustomerInvoiceAdd.dart';
import 'package:staron_task/Presentation/Screens/JournalEntryAdd.dart';
import 'package:staron_task/Presentation/Screens/SupplierInvoiceAdd.dart';

import '../../constant.dart';

class ChooseForiegn extends StatefulWidget {
  String path;
  ChooseForiegn({Key? key,required this.path}) : super(key: key);

  @override
  State<ChooseForiegn> createState() => _ChooseForiegnState();
}

class _ChooseForiegnState extends State<ChooseForiegn> {

  String index = "accountId";

  Future<List> getAccounts()async{
    if(widget.path == "accounts")index = "accountId";
    if(widget.path == "customer_accounts") index = "customerId";
    if(widget.path == "supplier_accounts") index = "supplierId";
    final Dio dio = Dio();
    Response response;
    response = await dio.get(baseURL+widget.path);
    Map js = response.data as Map;
    var i = js['data'];
    List out = [];
    for (final data in i) {
      out.add(data[index]);
    }
    return out;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose one of Them"),
      ),
      body: FutureBuilder(
        future: getAccounts(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if(snapshot.hasData){
            return Container(
              alignment: Alignment.center,
              child: ListView(
                children: List.generate(snapshot.data!.length, (index) => ListTile(
                  onTap: (){
                    if(widget.path == "accounts")
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> JournalEntryAdd(forien: snapshot.data![index].toString(), update: false)));
                    if(widget.path == "customer_accounts")
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> CustomerInvoiceAdd(forien: snapshot.data![index].toString(), update: false,)));
                    if(widget.path == "supplier_accounts")
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> SupplierInvoiceAdd(forien: snapshot.data![index].toString(), update: false)));

                  },
                  title: Text(snapshot.data![index].toString(),style: TextStyle(fontSize: 20,color: Colors.black),),
                )),
              ),
            );
          }else{
            return Center(child: Text("No data found"),);
          }

        },

      ),
    );
  }
}
