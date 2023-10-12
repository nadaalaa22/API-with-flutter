part of 'advice_bloc.dart';

@immutable
abstract class AdviceState {}

class AdviceInitial extends AdviceState {}
class AdviceLoadingState extends AdviceState {}
class AdviceLoadedState extends AdviceState{
  final AdviceModel adviceModel ;

  AdviceLoadedState({required this.adviceModel});

}

