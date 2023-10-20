class CustomerAccountModel{

  final int? customerId;
  final int accountNumber;
  final String accountName;
  final String contactName;
  final String email;
  final String phone;
  final String address;

  CustomerAccountModel({
    this.customerId, required this.accountNumber, required this.accountName, required this.contactName, required this.email, required this.phone, required this.address,
  });

  CustomerAccountModel.fromMap(Map<String,dynamic> res):
        customerId = res['customerId'],
        accountNumber = res['accountNumber'],
        accountName = res['accountName'],
        contactName = res['contactName'],
        email = res['email'],
        phone = res['phone'],
        address = res['address'];

  Map<String ,Object?> toMap(){

    return {
      'customerId':customerId,
      'accountNumber':accountNumber,
      'accountName':accountName,
      'contactName':contactName,
      'email':email,
      'phone':phone,
      'address':address
    };
  }
}