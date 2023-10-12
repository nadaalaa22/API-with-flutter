import 'dart:async';

import 'package:advice_app/advice/data/datasource/advice_ds.dart';
import 'package:advice_app/advice/data/model/advice_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceInitial()) {
    on<AdviceEvent>((event, emit) async {
      if (event is GetRandomAdviceEvent) {
        emit(AdviceLoadingState());
        AdviceModel adviceModel =
            await AdviceImp().getAdvice() ;
        emit(AdviceLoadedState(adviceModel: adviceModel));
      }
    });
  }
}
