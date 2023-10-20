class SupplierInvoiceModel{

  final int? invoiceId;
  final int supplierId;
  final int invoiceNumber;
  final String invoiceDate;
  final double totalAmount;
  final String status;

  SupplierInvoiceModel({
    this.invoiceId, required this.supplierId, required this.invoiceNumber, required this.invoiceDate, required this.totalAmount, required this.status

  });

  SupplierInvoiceModel.fromMap(Map<String,dynamic> res):
        invoiceId = res['invoiceId'],
        supplierId = res['supplierId'],
        invoiceNumber = res['invoiceNumber'],
        invoiceDate = res['invoiceDate'],
        totalAmount = res['totalAmount'],
        status = res['status'];

  Map<String ,Object?> toMap(){

    return {
      'invoiceId':invoiceId,
      'supplierId':supplierId,
      'invoiceNumber':invoiceNumber,
      'invoiceDate':invoiceDate,
      'totalAmount':totalAmount,
      'status':status,
    };
  }
}