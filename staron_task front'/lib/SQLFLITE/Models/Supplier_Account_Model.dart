class SupplierAccountModel{

  final int? supplierId;
  final int accountNumber;
  final String accountName;
  final String contactName;
  final String email;
  final String phone;
  final String address;

  SupplierAccountModel({
    this.supplierId, required this.accountNumber, required this.accountName, required this.contactName, required this.email, required this.phone, required this.address,
  });

  SupplierAccountModel.fromMap(Map<String,dynamic> res):
        supplierId = res['supplierId'],
        accountNumber = res['accountNumber'],
        accountName = res['accountName'],
        contactName = res['contactName'],
        email = res['email'],
        phone = res['phone'],
        address = res['address'];

  Map<String ,Object?> toMap(){

    return {
      'supplierId':supplierId,
      'accountNumber':accountNumber,
      'accountName':accountName,
      'contactName':contactName,
      'email':email,
      'phone':phone,
      'address':address
    };
  }
}