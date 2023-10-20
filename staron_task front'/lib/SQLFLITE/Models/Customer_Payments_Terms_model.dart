class CustomerPaymentsTermsModel{

  final int? termID;
  final int dueDays;
  final String termName;
  final double discountPercentage;

  CustomerPaymentsTermsModel({
    this.termID, required this.dueDays, required this.termName, required this.discountPercentage,

  });

  CustomerPaymentsTermsModel.fromMap(Map<String,dynamic> res):
        termID = res['termID'],
        dueDays = res['dueDays'],
        termName = res['termName'],
        discountPercentage = res['discountPercentage'];

  Map<String ,Object?> toMap(){

    return {
      'termID':termID,
      'dueDays':dueDays,


      'termName':termName,
      'discountPercentage':discountPercentage,
    };
  }
}