import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottomnavigation_event.dart';
part 'bottomnavigation_state.dart';

class BottomnavigationBloc extends Bloc<BottomnavigationEvent, BottomnavigationState> {
  BottomnavigationBloc() : super(BottomnavigationInitial());

  @override
  Stream<BottomnavigationState> mapEventToState(
    BottomnavigationEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
