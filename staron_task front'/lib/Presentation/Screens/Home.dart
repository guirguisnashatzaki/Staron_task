import 'package:flutter/material.dart';
import 'package:staron_task/Presentation/Screens/AccountAdd.dart';
import 'package:staron_task/Presentation/Screens/CustomerInvoiceAdd.dart';
import 'package:staron_task/Presentation/Screens/CustomerPaymentTermAdd.dart';
import 'package:staron_task/Presentation/Screens/JournalEntryAdd.dart';
import 'package:staron_task/Presentation/Screens/PeriodClosingAdd.dart';
import 'package:staron_task/Presentation/Screens/SupplierAdd.dart';
import 'package:staron_task/Presentation/Screens/SupplierInvoiceAdd.dart';
import 'package:staron_task/Presentation/Screens/SupplierPaymentTermAdd.dart';
import 'package:staron_task/Presentation/Widgets/AccountWidget.dart';
import 'package:staron_task/Presentation/Widgets/CustomerAccountWidget.dart';
import 'package:staron_task/Presentation/Widgets/CustomerInvoiceWidget.dart';
import 'package:staron_task/Presentation/Widgets/CustomerPaymentTermWidget.dart';
import 'package:staron_task/Presentation/Widgets/JournalEntryWidget.dart';
import 'package:staron_task/Presentation/Widgets/PeriodClosingWidget.dart';
import 'package:staron_task/Presentation/Widgets/SupplierInvoiceWidget.dart';
import 'package:staron_task/Presentation/Widgets/SupplierPaymentTermWidget.dart';
import 'package:staron_task/Presentation/Widgets/SupplierWidget.dart';
import 'package:staron_task/Presentation/Widgets/TrialBalanceWidget.dart';
import 'package:staron_task/SQLFLITE/Db_Helper.dart';
import '../Widgets/ListTileDrawerItem.dart';
import 'CustomerAccountAdd.dart';

class Home extends StatefulWidget {
  String dest;
  Home({Key? key,required this.dest}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Widget body;
  DbHelper?  dbHelper;
  String title="Account part";

  @override
  void initState() {
    // TODO: implement initState

    switch (widget.dest){
      case 'A':
        setState(() {
          body = AccountWidget(db: dbHelper);
          title = "Account part";
        });
        break;
      case 'CA':
        setState(() {
          body = CustomerAccountWidget(db: dbHelper);
          title = 'Customer Account part';
        });
        break;
      case 'CI':
        setState(() {
          body = CustomerInvoiceWidget(db: dbHelper);
          title = 'Customer Invoice Part';
        });
        break;
      case 'CP':
        setState(() {
          body = CustomerPaymentTermWidget(db: dbHelper);
          title = 'Customer Payment Term';
        });
        break;
      case 'J':
        setState(() {
          body = JournalEntryWidget(db: dbHelper);
          title = 'Journal Entry part';
        });
        break;
      case 'S':
        setState(() {
          body = SupplierWidget(db: dbHelper);
          title = 'Supplier Account part';
        });
        break;
      case 'SI':
        setState(() {
          body = SupplierInvoiceWidget(db: dbHelper);
          title = 'Supplier Invoice part';
        });
        break;
      case 'SP':
        setState(() {
          body = SupplierPaymentWidget(db: dbHelper);
          title = 'Supplier Payment Term part';
        });
        break;
      case 'PC':
        setState(() {
          body = PeriodClosingWidget();
          title = 'Period Closing part';
        });
        break;
    }

    dbHelper = DbHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(body is AccountWidget){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> AccountAdd(db: dbHelper,update: false,)));
          }

          if(body is JournalEntryWidget){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=> JournalEntryAdd(forien: "Click me to choose the account id Start filling that first",update: false,)));
          }

          if(body is CustomerAccountWidget){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=> CustomerAccountAdd(update: false,)));
          }

          if(body is CustomerPaymentTermWidget){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=> CustomerPaymentTermAdd(db: dbHelper,update: false,)));
          }

          if(body is CustomerInvoiceWidget){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=> CustomerInvoiceAdd(forien: "Click me to choose the customer id Start filling that first",update: false,)));
          }

          if(body is SupplierWidget){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=> SupplierAdd(db: dbHelper,update: false,)));
          }

          if(body is SupplierPaymentWidget){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=> SupplierPaymentTermAdd(db: dbHelper,update: false,)));
          }

          if(body is SupplierInvoiceWidget){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=> SupplierInvoiceAdd(forien: "Click me to choose the supplier id Start filling that first",update: false,)));
          }

          if(body is PeriodClosingWidget){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=> PeriodClosingAdd(forien: "Click me to choose the closing id Start filling that first",update: false)));
          }
        },
        child: const Icon(Icons.add),
      ),
      drawerScrimColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            const SizedBox(height: 50,),
            ListTileDrawerItem(data: 'Account',onPress: (){
              setState(() {
                body = AccountWidget(db: dbHelper);
                title = "Account part";
              });
              Navigator.pop(context);
            }),
            const Divider(),
            ListTileDrawerItem(data: 'Journal Entry',onPress: (){
              setState(() {
                body = JournalEntryWidget(db: dbHelper);
                title = 'Journal Entry part';
              });
              Navigator.pop(context);
            }),
            const Divider(),
            ListTileDrawerItem(data: 'Customer Account',onPress: (){
              setState(() {
                body = CustomerAccountWidget(db: dbHelper);
                title = 'Customer Account part';
              });
              Navigator.pop(context);
            }),
            const Divider(),
            ListTileDrawerItem(data: 'Customer Payment Term',onPress: (){
              setState(() {
                body = CustomerPaymentTermWidget(db: dbHelper);
                title = 'Customer Payment Term';
              });
              Navigator.pop(context);
            }),
            const Divider(),
            ListTileDrawerItem(data: 'Customer Invoice',onPress: (){
              setState(() {
                body = CustomerInvoiceWidget(db: dbHelper);
                title = 'Customer Invoice part';
              });
              Navigator.pop(context);
            }),
            const Divider(),
            ListTileDrawerItem(data: 'Supplier Account',onPress: (){
              setState(() {
                body = SupplierWidget(db: dbHelper);
                title = 'Supplier part';
              });
              Navigator.pop(context);
            }),
            const Divider(),
            ListTileDrawerItem(data: 'Supplier Payment Term',onPress: (){
              setState(() {
                body = SupplierPaymentWidget(db: dbHelper);
                title = "Supplier Payment Term";
              });
              Navigator.pop(context);
            }),
            const Divider(),
            ListTileDrawerItem(data: 'Supplier Invoice',onPress: (){
              setState(() {
                body = SupplierInvoiceWidget(db: dbHelper);
                title = 'Supplier Invoice part';
              });
              Navigator.pop(context);
            }),
            ListTileDrawerItem(
                data: "Trial Balance",
                onPress: (){
                  setState(() {
                    body = TrialBalance();
                    title = 'Trial Balance';
                  });
                  Navigator.pop(context);
                }
            ),
            ListTileDrawerItem(
                data: "Period Closing",
                onPress: (){
                  setState(() {
                    body = PeriodClosingWidget();
                    title = 'Period Closing';
                  });
                  Navigator.pop(context);
                }
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(title,style: const TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white)
      ),
      body: body,
    );
  }
}