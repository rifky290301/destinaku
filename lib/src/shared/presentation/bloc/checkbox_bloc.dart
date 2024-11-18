import 'package:bloc/bloc.dart';

// Event
class CheckboxToggled {
  final bool isChecked;
  CheckboxToggled(this.isChecked);
}

// Bloc
class CheckboxBloc extends Bloc<CheckboxToggled, bool> {
  CheckboxBloc() : super(false) {
    on<CheckboxToggled>((event, emit) {
      emit(event.isChecked);
    });
  }
}
