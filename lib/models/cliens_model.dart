const String clienTable = 'cliens';

class ClienFields {
  static final List<String> values = [
    /// Add all fields
    id, name, dob, nationality, job, address, amount, pay, date, numberlate,
    gender
  ];

  static const String id = '_id';
  static const String name = 'name';
  static const String gender = 'gender';
  static const String dob = 'dob';
  static const String nationality = 'nationality';
  static const String job = 'job';
  static const String address = 'address';
  static const String amount = 'amount';
  static const String pay = 'pay';
  static const String date = 'date';
  static const String numberlate = 'numberlate';
}

class Clien {
  final int? id;
  final String name;
  final String gender;
  final String dob;
  final String nationality;
  final String job;
  final String address;
  final String amount;
  final String pay;
  final String date;
  final String numberlate;

  const Clien({
    this.id,
    required this.name,
    required this.gender,
    required this.dob,
    required this.nationality,
    required this.job,
    required this.address,
    required this.amount,
    required this.pay,
    required this.date,
    required this.numberlate,
  });

  Clien copy({
    int? id,
    String? name,
    String? gender,
    String? dob,
    String? nationality,
    String? job,
    String? address,
    String? amount,
    String? pay,
    String? date,
    String? numberlate,
  }) =>
      Clien(
        id: id ?? this.id,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        dob: dob ?? this.dob,
        nationality: nationality ?? this.nationality,
        job: job ?? this.job,
        address: address ?? this.address,
        amount: amount ?? this.amount,
        pay: pay ?? this.pay,
        date: date ?? this.date,
        numberlate: numberlate ?? this.numberlate,
      );

  static Clien fromJson(Map<String, Object?> json) => Clien(
        id: json[ClienFields.id] as int?,
        name: json[ClienFields.name] as String,
        gender: json[ClienFields.gender] as String,
        dob: json[ClienFields.dob] as String,
        nationality: json[ClienFields.nationality] as String,
        job: json[ClienFields.job] as String,
        address: json[ClienFields.address] as String,
        amount: json[ClienFields.amount] as String,
        pay: json[ClienFields.pay] as String,
        date: json[ClienFields.date] as String,
        numberlate: json[ClienFields.numberlate] as String,
      );

  Map<String, Object?> toJson() => {
        ClienFields.id: id,
        ClienFields.name: name,
        ClienFields.gender: gender,
        ClienFields.dob: dob,
        ClienFields.nationality: nationality,
        ClienFields.job: job,
        ClienFields.address: address,
        ClienFields.amount: amount,
        ClienFields.pay: pay,
        ClienFields.date: date,
        ClienFields.numberlate: numberlate,
      };
}
