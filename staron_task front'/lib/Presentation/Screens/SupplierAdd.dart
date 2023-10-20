import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../SQLFLITE/Db_Helper.dart';
import '../../constant.dart';
import '../Widgets/CustomTextField.dart';
import 'Home.dart';

class SupplierAdd extends StatefulWidget {
  DbHelper? db;
  bool update;
  Map? object;
  SupplierAdd({Key? key,required this.db,this.object,required this.update}) : super(key: key);

  @override
  State<SupplierAdd> createState() => _SupplierAddState();
}

class _SupplierAddState extends State<SupplierAdd> {

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController normalSideController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String title='Adding Supplier Account';

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      if(widget.update){
        nameController.text = widget.object!['accountName'].toString();
        typeController.text = widget.object!['contactName'].toString();
        numberController.text = widget.object!['accountNumber'].toString();
        normalSideController.text = widget.object!['email'].toString();
        balanceController.text = widget.object!['phone'].toString();
        addressController.text = widget.object!['address'].toString();
      }
      title = widget.update? 'Updating Supplier Account' : 'Adding Supplier Account';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Adding Account",style: TextStyle(color: Colors.white),),
          iconTheme: const IconThemeData(color: Colors.white)
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  label: "Supplier Account Name",
                  controller: nameController,
                  inputType: TextInputType.text,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                  }
                  ,),

                CustomTextField(
                  label: "Supplier Account Number",
                  controller: numberController,
                  inputType: TextInputType.number,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some data';
                    }
                  }
                  ,),
                CustomTextField(
                  label: "Supplier Name",
                  controller: typeController,
                  inputType: TextInputType.text,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some data';
                    }
                  }
                  ,),
                CustomTextField(
                  label: "Email",
                  controller: normalSideController,
                  inputType: TextInputType.text,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some data';
                    }
                  }
                  ,),
                CustomTextField(
                  label: "Phone",
                  controller: balanceController,
                  inputType: TextInputType.phone,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some data';
                    }
                  }
                  ,),
                CustomTextField(
                  label: "Address",
                  controller: addressController,
                  inputType: TextInputType.phone,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some data';
                    }
                  }
                  ,),

                const SizedBox(height: 50,),

                ElevatedButton(
                    onPressed:(){
                      if (_formKey.currentState!.validate()) {

                        final dio = Dio();
                        if(widget.update){
                          dio.put(baseURL+"updateSupplier/"+widget.object!['supplierId'].toString(),data: {
                            "accountNumber": int.parse(numberController.text.toString()),
                            "accountName": nameController.text.toString(),
                            "contactName": typeController.text.toString(),
                            "email": normalSideController.text.toString(),
                            "phone": balanceController.text.toString(),
                            "address": addressController.text.toString()
                          }).whenComplete((){

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> Home(dest: 'S',)));

                            nameController.dispose();
                            numberController.dispose();
                            typeController.dispose();
                            typeController.dispose();
                            normalSideController.dispose();
                            balanceController.dispose();
                            addressController.dispose();

                          }).onError((error, stackTrace){
                            return Response(requestOptions: RequestOptions());
                          });
                        }else{
                          dio.post(baseURL+"supplier_accounts",data: {
                            "accountNumber": int.parse(numberController.text.toString()),
                            "accountName": nameController.text.toString(),
                            "contactName": typeController.text.toString(),
                            "email": normalSideController.text.toString(),
                            "phone": balanceController.text.toString(),
                            "address": addressController.text.toString()
                          }).whenComplete((){

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> Home(dest: 'S',)));

                            nameController.dispose();
                            numberController.dispose();
                            typeController.dispose();
                            typeController.dispose();
                            normalSideController.dispose();
                            balanceController.dispose();
                            addressController.dispose();

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