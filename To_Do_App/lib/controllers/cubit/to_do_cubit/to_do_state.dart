part of 'to_do_cubit.dart';

@immutable
abstract class ToDoState {}

class ToDoInitial extends ToDoState {}
class AddTasksState extends ToDoState {}
class RemoverTasksState extends ToDoState {}
class ChangeBottomSheetState extends ToDoState {}
