import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:staron_task/Presentation/Screens/Home.dart';

import '../../SQLFLITE/Db_Helper.dart';
import '../../constant.dart';
import '../Widgets/CustomTextField.dart';

class AccountAdd extends StatefulWidget {
  DbHelper? db;
  bool update;
  Map? object;
  AccountAdd({Key? key,required this.db,this.object,required this.update}) : super(key: key);

  @override
  State<AccountAdd> createState() => _AccountAddState();
}

class _AccountAddState extends State<AccountAdd> {

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController normalSideController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String title='Adding Account';

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      if(widget.update){
        nameController.text = widget.object!['accountName'].toString();
        numberController.text = widget.object!['accountNumber'].toString();
        typeController.text = widget.object!['accountType'].toString();
        normalSideController.text = widget.object!['normalSide'].toString();
        balanceController.text = widget.object!['balance'].toString();
      }
      title = widget.update? 'Updating Account' : 'Adding Account';
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
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
                  label: "Account Name",
                  controller: nameController,
                  inputType: TextInputType.text,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  }
                ,),

                CustomTextField(
                  label: "Account Number",
                  controller: numberController,
                  inputType: TextInputType.number,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some data';
                    }
                    return null;
                  }
                  ,),
                CustomTextField(
                  label: "Account Type",
                  controller: typeController,
                  inputType: TextInputType.text,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some data';
                    }
                    return null;
                  }
                  ,),
                CustomTextField(
                  label: "Normal side",
                  controller: normalSideController,
                  inputType: TextInputType.text,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some data';
                    }
                    return null;
                  }
                  ,),
                CustomTextField(
                  label: "Balance",
                  controller: balanceController,
                  inputType: TextInputType.number,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some data';
                    }
                    return null;
                  }
                  ,),

                const SizedBox(height: 50,),

                ElevatedButton(
                    onPressed:(){
                      if (_formKey.currentState!.validate()) {
                        final dio = Dio();

                        if(widget.update){
                          dio.put(baseURL+"updateaccount/"+widget.object!['accountId'].toString(),data: {
                            "accountNumber": int.parse(numberController.text.toString()),
                            "accountName": nameController.text.toString(),
                            "accountType": typeController.text.toString(),
                            "normalSide": normalSideController.text.toString(),
                            "balance": double.parse(balanceController.text.toString())
                          }).whenComplete((){

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> Home(dest: 'A',)));

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
                          dio.post(baseURL+"accounts",data: {
                            "accountNumber": int.parse(numberController.text.toString()),
                            "accountName": nameController.text.toString(),
                            "accountType": typeController.text.toString(),
                            "normalSide": normalSideController.text.toString(),
                            "balance": double.parse(balanceController.text.toString())
                          }).whenComplete((){

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> Home(dest: 'A',)));

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