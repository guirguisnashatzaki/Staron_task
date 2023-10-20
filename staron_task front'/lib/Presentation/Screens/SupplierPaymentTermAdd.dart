import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../SQLFLITE/Db_Helper.dart';
import '../../constant.dart';
import '../Widgets/CustomTextField.dart';
import 'Home.dart';

class SupplierPaymentTermAdd extends StatefulWidget {
  DbHelper? db;
  bool update;
  Map? object;
  SupplierPaymentTermAdd({Key? key,required this.db,this.object,required this.update}) : super(key: key);

  @override
  State<SupplierPaymentTermAdd> createState() => _SupplierPaymentTermAddState();
}

class _SupplierPaymentTermAddState extends State<SupplierPaymentTermAdd> {

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController normalSideController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String title='Adding Supplier Payment Term';

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      if(widget.update){
        numberController.text = widget.object!['dueDays'].toString();
        nameController.text = widget.object!['termName'].toString();
        balanceController.text = widget.object!['discountPercentage'].toString();
      }
      title = widget.update? 'Updating Supplier Payment Term' : 'Adding Supplier Payment Term';
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
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                label: "Term Name",
                controller: nameController,
                inputType: TextInputType.text,
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                }
                ,),

              CustomTextField(
                label: "Due Days",
                controller: numberController,
                inputType: TextInputType.number,
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter some data';
                  }
                }
                ,),
              CustomTextField(
                label: "discount Percentage",
                controller: balanceController,
                inputType: TextInputType.number,
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
                        dio.put(baseURL+"updateSupplierPaymentTerms/"+widget.object!['termId'].toString(),data: {
                          "dueDays": int.parse(numberController.text.toString()),
                          "termName": nameController.text.toString(),
                          "discountPercentage": double.parse(balanceController.text.toString())
                        }).whenComplete((){

                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> Home(dest: 'SP',)));

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
                        dio.post(baseURL+"supplier_payment_terms",data: {
                          "dueDays": int.parse(numberController.text.toString()),
                          "termName": nameController.text.toString(),
                          "discountPercentage": double.parse(balanceController.text.toString())
                        }).whenComplete((){

                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> Home(dest: 'SP',)));

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
    );
  }
}