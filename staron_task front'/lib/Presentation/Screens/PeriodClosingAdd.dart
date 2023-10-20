import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../SQLFLITE/Db_Helper.dart';
import '../../constant.dart';
import '../Widgets/CustomTextField.dart';
import 'Home.dart';
import 'journalForiegnKeyChoose.dart';

class PeriodClosingAdd extends StatefulWidget {
  String forien;
  bool update;
  Map? object;
  PeriodClosingAdd({Key? key,required this.forien,required this.update,this.object}) : super(key: key);

  @override
  State<PeriodClosingAdd> createState() => _PeriodClosingAddState();
}

class _PeriodClosingAddState extends State<PeriodClosingAdd> {

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String title='Adding Period Closing';

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      if(widget.update){
        nameController.text = widget.object?['startDate'];
        typeController.text = widget.object?['endDate'];
        numberController.text = widget.object?['status'];
      }
      title = widget.update? 'Updating Period Closing' : 'Adding Period Closing';
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
                  label: "Start Date",
                  controller: nameController,
                  inputType: TextInputType.text,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                  }
                  ,),

                CustomTextField(
                  label: "End Date",
                  controller: typeController,
                  inputType: TextInputType.text,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some data';
                    }
                  }
                  ,),
                CustomTextField(
                  label: "Status",
                  controller: numberController,
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
                          dio.put(baseURL+"updatePeriodClosing/"+widget.object!['closingId'].toString(),data: {
                            "startDate": nameController.text.toString(),
                            "endDate": typeController.text.toString(),
                            "status": numberController.text.toString()
                          }).whenComplete((){

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> Home(dest: 'PC',)));

                            nameController.dispose();
                            numberController.dispose();
                            typeController.dispose();
                            typeController.dispose();

                          }).onError((error, stackTrace){
                            return Response(requestOptions: RequestOptions());
                          });
                        }else{
                          dio.post(baseURL+"periodClosing",data: {
                            "startDate": nameController.text.toString(),
                            "endDate": typeController.text.toString(),
                            "status": numberController.text.toString()
                          }).whenComplete((){

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> Home(dest: 'PC',)));

                            nameController.dispose();
                            numberController.dispose();
                            typeController.dispose();
                            typeController.dispose();

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