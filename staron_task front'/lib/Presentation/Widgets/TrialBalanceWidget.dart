
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class TrialBalance extends StatefulWidget {
  const TrialBalance({Key? key}) : super(key: key);

  @override
  State<TrialBalance> createState() => _TrialBalanceState();
}

class _TrialBalanceState extends State<TrialBalance> {

  final Dio dio = Dio();

  Future<Map> getAccounts()async{
    Response response;
    response = await dio.get(baseURL+'trialBalance');
    Map out = jsonDecode(response.data as String);
    return out;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAccounts(),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        if(snapshot.hasData){
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.fromLTRB(90, 180, 90, 180),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Table(
              border: TableBorder.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 2),
              children: [
                TableRow( children: [
                  const Column(children:[Text('Total Credits', style: TextStyle(fontSize: 20.0,color: Colors.black))]),
                  Column(children:[Text(snapshot.data!['tC'].toString(), style: const TextStyle(fontSize: 20.0,color: Colors.black))]),
                ]),
                TableRow( children: [
                  const Column(children:[Text('Total Debits', style: TextStyle(fontSize: 20.0,color: Colors.black))]),
                  Column(children:[Text(snapshot.data!['tD'].toString(), style: const TextStyle(fontSize: 20.0,color: Colors.black))]),
                ]),
              ],

            )

            // Column(
            //   children: [
            //     Text("Total Credits : "+snapshot.data!['tC'].toString(),style: TextStyle(fontSize: 25,color: Colors.white),),
            //     Text("Total Debits : "+snapshot.data!['tD'].toString(),style: TextStyle(fontSize: 25,color: Colors.white),),
            //   ],
            // ),
          );
        }else{
          return const Center(
            child: Text("No Data Found"),
          );
        }
      },

    );
  }
}
