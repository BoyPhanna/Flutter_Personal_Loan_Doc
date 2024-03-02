part of 'clien_bloc.dart';

abstract class ClienState extends Equatable {
  const ClienState();
}

class ClienInitial extends ClienState {
  @override
  List<Object> get props => [];
}

class DisplayCliens extends ClienState {
  final List<Clien> cliens;
  const DisplayCliens({required this.cliens});
  @override
  List<Object> get props => [cliens];
}

class DisplaySpecificClien extends ClienState {
  final Clien clien;
  const DisplaySpecificClien({required this.clien});
  @override
  List<Object> get props => [clien];
}
