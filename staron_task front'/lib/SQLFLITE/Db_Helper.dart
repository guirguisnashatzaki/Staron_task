import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:staron_task/SQLFLITE/Models/Account_model.dart';
import 'package:staron_task/SQLFLITE/Models/Customer_Invoice_Model.dart';
import 'package:staron_task/SQLFLITE/Models/Customer_Payments_Terms_model.dart';
import 'package:staron_task/SQLFLITE/Models/Customer_account_model.dart';
import 'package:staron_task/SQLFLITE/Models/Journal_entry_model.dart';
import 'package:staron_task/SQLFLITE/Models/Supplier_Account_Model.dart';
import 'package:staron_task/SQLFLITE/Models/Supplier_Invoice_Model.dart';
import 'package:staron_task/SQLFLITE/Models/Supplier_Payment_Terms_Models.dart';

class DbHelper{
  static Database? _db;

  //Singleton Method
  Future<Database?> get db async{
    if(_db!=null){
      return _db;

    }
    _db=await initDatabase();

    return _db;
  }

  initDatabase() async{
    io.Directory documentDirectory=await getApplicationDocumentsDirectory();
    String path=join(documentDirectory.path,'StaronTask.db');
    var db=await openDatabase(path,version: 1,onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async{
    await db.execute("CREATE TABLE Account (accountId INTEGER PRIMARY KEY AUTOINCREMENT, accountNumber INTEGER NOT NULL ,accountName TEXT NOT NULL ,accountType TEXT NOT NULL ,normalSide TEXT NOT NULL, balance DOUBLE NOT NULL)");
    await db.execute("CREATE TABLE JournalEntries(entryId INTEGER PRIMARY KEY AUTOINCREMENT,date TEXT NOT NULL,accountId INTEGER NOT NULL,debit DOUBLE NOT NULL,credit DOUBLE NOT NULL,description TEXT NOT NULL,FOREIGN KEY (accountId) REFERENCES Account(accountId))");
    await db.execute("CREATE TABLE Customer_Account (customerId INTEGER PRIMARY KEY AUTOINCREMENT, accountNumber INTEGER NOT NULL ,accountName TEXT NOT NULL ,contactName TEXT NOT NULL ,email TEXT NOT NULL, phone TEXT NOT NULL,address TEXT NOT NULL)");
    await db.execute("CREATE TABLE Customer_Payment_Terms(termID INTEGER PRIMARY KEY AUTOINCREMENT,dueDays INTEGER NOT NULL,termName TEXT NOT NULL,discountPercentage DOUBLE NOT NULL)");
    await db.execute("CREATE TABLE Customer_Invoice(invoiceId INTEGER PRIMARY KEY AUTOINCREMENT,customerId INTEGER NOT NULL,invoiceNumber INTEGER NOT NULL UNIQUE,invoiceDate TEXT NOT NULL,totalAmount DOUBLE NOT NULL,status TEXT NOT NULL,dueDate TEXT NOT NULL,FOREIGN KEY (customerId) REFERENCES Customer_Account(customerId))");
    await db.execute("CREATE TABLE Supplier_Account(supplierId INTEGER PRIMARY KEY AUTOINCREMENT,accountNumber INTEGER NOT NULL,accountName TEXT NOT NULL,contactName TEXT NOT NULL,email TEXT NOT NULL,phone TEXT NOT NULL,address TEXT NOT NULL)");
    await db.execute("CREATE TABLE Supplier_Payments_Terms(termID INTEGER PRIMARY KEY AUTOINCREMENT,dueDays INTEGER NOT NULL,termName TEXT NOT NULL,discountPercentage DOUBLE NOT NULL)");
    await db.execute("CREATE TABLE Supplier_Invoice(invoiceId INTEGER PRIMARY KEY AUTOINCREMENT,supplierId INTEGER NOT NULL,invoiceNumber INTEGER NOT NULL UNIQUE,invoiceDate TEXT NOT NULL,totalAmount DOUBLE NOT NULL,status TEXT NOT NULL,FOREIGN KEY (supplierId) REFERENCES Supplier_Account(supplierId))");
  }

  //Account
  Future<AccountModel> insertAccount(AccountModel AccModel) async{
    var database= await db;
    await database!.insert('Account', AccModel.toMap());
    return AccModel;
  }


  Future<List<AccountModel>> getAccounts() async{
    var database= await db;
    final List<Map<String,Object?>> queryResult=await database!.query('Account');
    return queryResult.map((e) => AccountModel.fromMap(e)).toList();
  }


  Future<int> deleteAccount(int id) async{
    var database= await db;
    return await database!.delete(
        'Account',
        where: 'id=?',
        whereArgs: [id]
    );
  }

  Future<int > updateAccount(AccountModel AccModel) async{
    var database= await db;
    return await database!.update(
        'Account',
        AccModel.toMap(),
        where: 'id=?',
        whereArgs: [AccModel.accountId]
    ) ;
  }

  //Journal entries

  Future<JournalEntryModel> insertJournalEntry(JournalEntryModel model) async{
    var database= await db;
    await database!.insert('JournalEntries', model.toMap());
    return model;
  }


  Future<List<JournalEntryModel>> getJournalEntries() async{
    var database= await db;
    final List<Map<String,Object?>> queryResult=await database!.query('JournalEntries');
    return queryResult.map((e) => JournalEntryModel.fromMap(e)).toList();
  }

  Future<JournalEntryModel> getJournalEntry(int id) async{
    var database= await db;
    final List<Map<String,Object?>> queryResult=await database!.query('JournalEntries',where: 'id=?',whereArgs: [id]);
    return queryResult.map((e) => JournalEntryModel.fromMap(e)).first;
  }


  Future<int> deleteJournalEntry(int id) async{
    var database= await db;
    return await database!.delete(
        'JournalEntries',
        where: 'id=?',
        whereArgs: [id]
    );
  }

  Future<int > updateJournalEntry(JournalEntryModel model) async{
    var database= await db;
    return await database!.update(
        'JournalEntries',
        model.toMap(),
        where: 'id=?',
        whereArgs: [model.accountId]
    ) ;
  }

  //Customer Accounts

  Future<CustomerAccountModel> insertCustomerAccount(CustomerAccountModel model) async{
    var database= await db;
    await database!.insert('Customer_Account', model.toMap());
    return model;
  }


  Future<List<CustomerAccountModel>> getCustomerAccounts() async{
    var database= await db;
    final List<Map<String,Object?>> queryResult=await database!.query('Customer_Account');
    return queryResult.map((e) => CustomerAccountModel.fromMap(e)).toList();
  }

  Future<CustomerAccountModel> getCustomerAccount(int id) async{
    var database= await db;
    final List<Map<String,Object?>> queryResult=await database!.query('Customer_Account',where: 'id=?',whereArgs: [id]);
    return queryResult.map((e) => CustomerAccountModel.fromMap(e)).first;
  }


  Future<int> deleteCustomerAccount(int id) async{
    var database= await db;
    return await database!.delete(
        'Customer_Account',
        where: 'id=?',
        whereArgs: [id]
    );
  }

  Future<int > updateCustomerAccount(CustomerAccountModel model) async{
    var database= await db;
    return await database!.update(
        'Customer_Account',
        model.toMap(),
        where: 'id=?',
        whereArgs: [model.customerId]
    ) ;
  }



  //Customer Payments terms

  Future<CustomerPaymentsTermsModel> insertCustomerPaymentTerm(CustomerPaymentsTermsModel model) async{
    var database= await db;
    await database!.insert('Customer_Payment_Terms', model.toMap());
    return model;
  }


  Future<List<CustomerPaymentsTermsModel>> getCustomerPaymentTerms() async{
    var database= await db;
    final List<Map<String,Object?>> queryResult=await database!.query('Customer_Payment_Terms');
    return queryResult.map((e) => CustomerPaymentsTermsModel.fromMap(e)).toList();
  }

  Future<CustomerPaymentsTermsModel> getCustomerPaymentTerm(int id) async{
    var database= await db;
    final List<Map<String,Object?>> queryResult=await database!.query('Customer_Payment_Terms',where: 'id=?',whereArgs: [id]);
    return queryResult.map((e) => CustomerPaymentsTermsModel.fromMap(e)).first;
  }


  Future<int> deleteCustomerPaymentTerm(int id) async{
    var database= await db;
    return await database!.delete(
        'Customer_Payment_Terms',
        where: 'id=?',
        whereArgs: [id]
    );
  }

  Future<int > updateCustomerPaymentTerm(CustomerPaymentsTermsModel model) async{
    var database= await db;
    return await database!.update(
        'Customer_Payment_Terms',
        model.toMap(),
        where: 'id=?',
        whereArgs: [model.termID]
    ) ;
  }



  //Customer invoice

  Future<CustomerInvoiceModel> insertCustomerInvoice(CustomerInvoiceModel model) async{
    var database= await db;
    await database!.insert('Customer_Invoice', model.toMap());
    return model;
  }


  Future<List<CustomerInvoiceModel>> getCustomerInvoices() async{
    var database= await db;
    final List<Map<String,Object?>> queryResult=await database!.query('Customer_Invoice');
    return queryResult.map((e) => CustomerInvoiceModel.fromMap(e)).toList();
  }

  Future<CustomerInvoiceModel> getCustomerInvoice(int id) async{
    var database= await db;
    final List<Map<String,Object?>> queryResult=await database!.query('Customer_Invoice',where: 'id=?',whereArgs: [id]);
    return queryResult.map((e) => CustomerInvoiceModel.fromMap(e)).first;
  }


  Future<int> deleteCustomerInvoice(int id) async{
    var database= await db;
    return await database!.delete(
        'Customer_Invoice',
        where: 'id=?',
        whereArgs: [id]
    );
  }

  Future<int > updateCustomerInvoice (CustomerInvoiceModel model) async{
    var database= await db;
    return await database!.update(
        'Customer_Invoice',
        model.toMap(),
        where: 'id=?',
        whereArgs: [model.invoiceId]
    ) ;
  }




  //Supplier Account

  Future<SupplierAccountModel> insertSupplierAccount(SupplierAccountModel model) async{
    var database= await db;
    await database!.insert('Supplier_Account', model.toMap());
    return model;
  }


  Future<List<SupplierAccountModel>> getSupplierAccounts() async{
    var database= await db;
    final List<Map<String,Object?>> queryResult=await database!.query('Supplier_Account');
    return queryResult.map((e) => SupplierAccountModel.fromMap(e)).toList();
  }

  Future<SupplierAccountModel> getSupplierAccount(int id) async{
    var database= await db;
    final List<Map<String,Object?>> queryResult=await database!.query('Supplier_Account',where: 'id=?',whereArgs: [id]);
    return queryResult.map((e) => SupplierAccountModel.fromMap(e)).first;
  }


  Future<int> deleteSupplierAccount(int id) async{
    var database= await db;
    return await database!.delete(
        'Supplier_Account',
        where: 'id=?',
        whereArgs: [id]
    );
  }

  Future<int > updateSupplierAccount (SupplierAccountModel model) async{
    var database= await db;
    return await database!.update(
        'Supplier_Account',
        model.toMap(),
        where: 'id=?',
        whereArgs: [model.supplierId]
    ) ;
  }



  //Supplier Payment Term

  Future<SupplierPaymentsTermsModel> insertSupplierPaymentTerm(SupplierPaymentsTermsModel model) async{
    var database= await db;
    await database!.insert('Supplier_Payments_Terms', model.toMap());
    return model;
  }


  Future<List<SupplierPaymentsTermsModel>> getSupplierPaymentTerms() async{
    var database= await db;
    final List<Map<String,Object?>> queryResult=await database!.query('Supplier_Payments_Terms');
    return queryResult.map((e) => SupplierPaymentsTermsModel.fromMap(e)).toList();
  }

  Future<SupplierPaymentsTermsModel> getSupplierPaymentTerm(int id) async{
    var database= await db;
    final List<Map<String,Object?>> queryResult=await database!.query('Supplier_Payments_Terms',where: 'id=?',whereArgs: [id]);
    return queryResult.map((e) => SupplierPaymentsTermsModel.fromMap(e)).first;
  }


  Future<int> deleteSupplierPaymentTerm(int id) async{
    var database= await db;
    return await database!.delete(
        'Supplier_Payments_Terms',
        where: 'id=?',
        whereArgs: [id]
    );
  }

  Future<int > updateSupplierPaymentTerm (SupplierPaymentsTermsModel model) async{
    var database= await db;
    return await database!.update(
        'Supplier_Payments_Terms',
        model.toMap(),
        where: 'id=?',
        whereArgs: [model.termID]
    ) ;
  }



  //Supplier Invoice

  Future<SupplierInvoiceModel> insertSupplierInvoice(SupplierInvoiceModel model) async{
    var database= await db;
    await database!.insert('Supplier_Invoice', model.toMap());
    return model;
  }


  Future<List<SupplierInvoiceModel>> getSupplierInvoices() async{
    var database= await db;
    final List<Map<String,Object?>> queryResult=await database!.query('Supplier_Invoice');
    return queryResult.map((e) => SupplierInvoiceModel.fromMap(e)).toList();
  }

  Future<SupplierInvoiceModel> getSupplierInvoice(int id) async{
    var database= await db;
    final List<Map<String,Object?>> queryResult=await database!.query('Supplier_Invoice',where: 'id=?',whereArgs: [id]);
    return queryResult.map((e) => SupplierInvoiceModel.fromMap(e)).first;
  }


  Future<int> deleteSupplierInvoice(int id) async{
    var database= await db;
    return await database!.delete(
        'Supplier_Invoice',
        where: 'id=?',
        whereArgs: [id]
    );
  }

  Future<int > updateSupplierInvoice (SupplierInvoiceModel model) async{
    var database= await db;
    return await database!.update(
        'Supplier_Invoice',
        model.toMap(),
        where: 'id=?',
        whereArgs: [model.invoiceId]
    ) ;
  }


}