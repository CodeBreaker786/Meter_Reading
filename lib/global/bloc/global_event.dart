part of 'global_bloc.dart';

@immutable
abstract class GlobalEvent {}

class ShowLoadingIndicator extends GlobalEvent {}

class HideLoadingIndicator extends GlobalEvent {}

class ShowFlushBar extends GlobalEvent {}

class SetToInitial extends GlobalEvent {}
