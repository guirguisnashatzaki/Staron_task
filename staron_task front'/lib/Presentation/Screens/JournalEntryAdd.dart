import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:staron_task/Presentation/Screens/journalForiegnKeyChoose.dart';
import 'package:staron_task/constant.dart';

import '../../SQLFLITE/Db_Helper.dart';
import '../Widgets/CustomTextField.dart';
import 'Home.dart';

class JournalEntryAdd extends StatefulWidget {
  String forien;
  bool update;
  Map? object;
  JournalEntryAdd({Key? key,required this.forien,this.object,required this.update}) : super(key: key);

  @override
  State<JournalEntryAdd> createState() => _JournalEntryAddState();
}

class _JournalEntryAddState extends State<JournalEntryAdd> {

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController normalSideController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String title='Adding Journal Entry';

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      if(widget.update){
        nameController.text = widget.object!['date'].toString();
        typeController.text = widget.object!['debit'].toString();
        normalSideController.text = widget.object!['credit'].toString();
        balanceController.text = widget.object!['description'].toString();
      }
      title = widget.update? 'Updating Journal Entry' : 'Adding Journal Entry';
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(title,style: TextStyle(color: Colors.white),),
          iconTheme: const IconThemeData(color: Colors.white)
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  label: "Date",
                  controller: nameController,
                  inputType: TextInputType.text,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                  }
                ,),

                InkWell(
                  onTap: (){
                    if(!widget.update)
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> ChooseForiegn(path: "accounts")));
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(

                    ),
                      child: Text(widget.update? widget.object!['entryId'].toString():widget.forien,style: TextStyle(fontSize: 20),)
                  ),
                ),
                Divider(),
                CustomTextField(
                  label: "Debit",
                  controller: typeController,
                  inputType: TextInputType.number,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some data';
                    }
                  }
                  ,),
                CustomTextField(
                  label: "Credit",
                  controller: normalSideController,
                  inputType: TextInputType.number,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some data';
                    }
                  }
                  ,),
                CustomTextField(
                  label: "Description",
                  controller: balanceController,
                  inputType: TextInputType.text,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some data';
                    }
                  }
                  ,),

                const SizedBox(height: 50,),

                ElevatedButton(
                    onPressed:(){
                      if (_formKey.currentState!.validate() && widget.forien != "Click me to choose the account id Start filling that first") {
                        final dio = Dio();

                        if(widget.update){
                          dio.put(baseURL+"updateJournalEntry/"+widget.object!['entryId'].toString(),data: {
                            "accountId": int.parse(widget.forien),
                            "date": nameController.text.toString(),
                            "debit": double.parse(typeController.text.toString()),
                            "credit": double.parse(normalSideController.text.toString()),
                            "description": balanceController.text.toString()
                          }).whenComplete((){

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> Home(dest: 'J',)));

                            nameController.dispose();
                            numberController.dispose();
                            typeController.dispose();
                            typeController.dispose();
                            normalSideController.dispose();
                            balanceController.dispose();

                          }).onError((error, stackTrace){
                            return Response(requestOptions: RequestOptions());
                          });
                        }else{
                          dio.post(baseURL+"journal_entries",data: {
                            "accountId": int.parse(widget.forien),
                            "date": nameController.text.toString(),
                            "debit": double.parse(typeController.text.toString()),
                            "credit": double.parse(normalSideController.text.toString()),
                            "description": balanceController.text.toString()
                          }).whenComplete((){

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> Home(dest: 'J',)));

                            nameController.dispose();
                            numberController.dispose();
                            typeController.dispose();
                            typeController.dispose();
                            normalSideController.dispose();
                            balanceController.dispose();

                          }).onError((error, stackTrace){
                            return Response(requestOptions: RequestOptions());
                          });
                        }


                      }
                    },
                    child: const Text("Submit")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}