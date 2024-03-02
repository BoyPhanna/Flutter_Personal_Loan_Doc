part of 'clien_bloc.dart';

abstract class ClienEvent extends Equatable {
  const ClienEvent();
}

class AddClient extends ClienEvent {
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

  const AddClient(
      {required this.name,
      required this.gender,
      required this.dob,
      required this.nationality,
      required this.job,
      required this.address,
      required this.amount,
      required this.pay,
      required this.date,
      required this.numberlate});
  @override
  List<Object?> get props => [
        name,
        gender,
        dob,
        nationality,
        job,
        address,
        amount,
        pay,
        date,
        numberlate
      ];
}

class UpdateClien extends ClienEvent {
  final Clien clien;
  const UpdateClien({required this.clien});
  @override
  List<Object?> get props => [clien];
}

class FetchCliens extends ClienEvent {
  const FetchCliens();
  @override
  List<Object?> get props => [];
}

class DeleteClien extends ClienEvent {
  final int id;

  const DeleteClien({required this.id});

  @override
  List<Object?> get props => [id];
}
