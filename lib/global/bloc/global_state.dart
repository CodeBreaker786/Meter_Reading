part of 'global_bloc.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}
class LoadingState  extends GlobalState {}
class ShowFlushbarState  extends GlobalState {}
