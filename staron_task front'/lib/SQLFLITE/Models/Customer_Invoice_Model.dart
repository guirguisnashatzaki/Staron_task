class CustomerInvoiceModel{

  final int? invoiceId;
  final int customerId;
  final int invoiceNumber;
  final String invoiceDate;
  final double totalAmount;
  final String status;
  final String dueDate;

  CustomerInvoiceModel({
    this.invoiceId, required this.customerId, required this.invoiceNumber, required this.invoiceDate, required this.totalAmount, required this.status, required this.dueDate,

  });

  CustomerInvoiceModel.fromMap(Map<String,dynamic> res):
        invoiceId = res['invoiceId'],
        customerId = res['customerId'],
        invoiceNumber = res['invoiceNumber'],
        invoiceDate = res['invoiceDate'],
        totalAmount = res['totalAmount'],
        status = res['status'],
        dueDate = res['dueDate'];

  Map<String ,Object?> toMap(){

    return {
      'invoiceId':invoiceId,
      'customerId':customerId,
      'invoiceNumber':invoiceNumber,
      'invoiceDate':invoiceDate,
      'totalAmount':totalAmount,
      'status':status,
      'dueDate':dueDate
    };
  }
}