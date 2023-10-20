class JournalEntryModel{

  final int? entryId;
  final String date;
  final int accountId;
  final double debit;
  final double credit;
  final String description;

  JournalEntryModel({
    this.entryId, required this.date, required this.accountId, required this.debit, required this.credit, required this.description,
  });

  JournalEntryModel.fromMap(Map<String,dynamic> res):
        entryId = res['entryId'],
        date = res['date'],
        accountId = res['accountId'],
        debit = res['debit'],
        credit = res['credit'],
        description = res['description'];

  Map<String ,Object?> toMap(){

    return {
      'entryId':entryId,
      'date':date,
      'accountId':accountId,
      'debit':debit,
      'credit':credit,
      'description':description
    };
  }
}