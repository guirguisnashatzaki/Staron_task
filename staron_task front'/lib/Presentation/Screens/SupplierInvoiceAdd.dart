import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../SQLFLITE/Db_Helper.dart';
import '../../constant.dart';
import '../Widgets/CustomTextField.dart';
import 'Home.dart';
import 'journalForiegnKeyChoose.dart';

class SupplierInvoiceAdd extends StatefulWidget {
  String forien;
  bool update;
  Map? object;
  SupplierInvoiceAdd({Key? key,required this.forien,this.object,required this.update}) : super(key: key);

  @override
  State<SupplierInvoiceAdd> createState() => _SupplierInvoiceAddState();
}

class _SupplierInvoiceAddState extends State<SupplierInvoiceAdd> {

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController normalSideController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String title='Adding Supplier Invoice';

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      if(widget.update){
        nameController.text = widget.object!['invoiceNumber'].toString();
        typeController.text = widget.object!['invoiceDate'].toString();
        normalSideController.text = widget.object!['totalAmount'].toString();
        balanceController.text = widget.object!['status'].toString();
        dueDateController.text = widget.object!['dueDate'].toString();

      }
      title = widget.update? 'Updating Supplier Invoice' : 'Adding Supplier Invoice';
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
                  label: "Invoice Number",
                  controller: nameController,
                  inputType: TextInputType.number,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                  }
                  ,),

                InkWell(
                  onTap: (){
                    if(!widget.update)
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> ChooseForiegn(path: "supplier_accounts")));
                  },
                  child: Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(

                      ),
                      child: Text(widget.update? widget.object!['invoiceId'].toString():widget.forien,style: TextStyle(fontSize: 20),)
                  ),
                ),
                Divider(),
                CustomTextField(
                  label: "Invoice Date",
                  controller: typeController,
                  inputType: TextInputType.text,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some data';
                    }
                  }
                  ,),
                CustomTextField(
                  label: "Total Amount",
                  controller: normalSideController,
                  inputType: TextInputType.number,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some data';
                    }
                  }
                  ,),
                CustomTextField(
                  label: "Status",
                  controller: balanceController,
                  inputType: TextInputType.text,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some data';
                    }
                  }
                  ,),
                CustomTextField(
                  label: "Due Date",
                  controller: dueDateController,
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
                      if (_formKey.currentState!.validate() && widget.forien != "Click me to choose the supplier id Start filling that first") {
                        final dio = Dio();

                        if(widget.update){
                          dio.put(baseURL+"updateSupplierInvoice/"+widget.object!['invoiceId'].toString(),data: {
                            "supplierId": int.parse(widget.forien),
                            "invoiceNumber": int.parse(nameController.text.toString()),
                            "invoiceDate": typeController.text.toString(),
                            "totalAmount": double.parse(normalSideController.text.toString()),
                            "status": balanceController.text.toString(),
                          }).whenComplete((){

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> Home(dest: 'SI',)));



                          }).onError((error, stackTrace){
                            return Response(requestOptions: RequestOptions());
                          });
                        }else{
                          dio.post(baseURL+"supplier_invoices",data: {
                            "supplierId": int.parse(widget.forien),
                            "invoiceNumber": int.parse(nameController.text.toString()),
                            "invoiceDate": typeController.text.toString(),
                            "totalAmount": double.parse(normalSideController.text.toString()),
                            "status": balanceController.text.toString(),
                            "dueDate": dueDateController.text.toString()
                          }).whenComplete((){

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> Home(dest: 'SI',)));

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