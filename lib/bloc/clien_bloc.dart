import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_to_pdf/models/cliens_model.dart';
import 'package:image_to_pdf/service/database.dart';

part 'clien_event.dart';
part 'clien_state.dart';

class ClienBloc extends Bloc<ClienEvent, ClienState> {
  ClienBloc() : super(ClienInitial()) {
    List<Clien> cliens = [];
    on<AddClient>((event, emit) async {
      // TODO: implement event handler
      await DatabaseService.instance.create(Clien(
        name: event.name,
        gender: event.gender,
        dob: event.dob,
        nationality: event.nationality,
        job: event.job,
        address: event.address,
        amount: event.amount,
        pay: event.pay,
        date: event.date,
        numberlate: event.numberlate,
      ));
    });

    on<UpdateClien>((event, emit) async {
      await DatabaseService.instance.update(clien: event.clien);
    });
    on<FetchCliens>((event, emit) async {
      cliens = await DatabaseService.instance.readAllCliens();
      emit(DisplayCliens(cliens: cliens));
    });
    on<DeleteClien>((event, emit) async {
      await DatabaseService.instance.delete(id: event.id);
    });
  }
}
