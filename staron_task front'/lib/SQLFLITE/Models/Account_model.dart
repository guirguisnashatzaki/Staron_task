class AccountModel{

  final int? accountId;
  final int accountNumber;
  final String accountName;
  final String accountType;
  final String normalSide;
  final double balance;

  AccountModel({
  this.accountId, required this.accountNumber, required this.accountName, required this.accountType, required this.normalSide, required this.balance,
  });

  AccountModel.fromMap(Map<String,dynamic> res):
        accountId = res['accountId'],
        accountNumber = res['accountNumber'],
        accountName = res['accountName'],
        accountType = res['accountType'],
        normalSide = res['normalSide'],
        balance = res['balance'];

  Map<String ,Object?> toMap(){

    return {
      'accountId':accountId,
      'accountNumber':accountNumber,
      'accountName':accountName,
      'accountType':accountType,
      'normalSide':normalSide,
      'balance':balance
    };
  }
}