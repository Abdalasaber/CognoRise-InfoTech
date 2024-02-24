import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'to_do_state.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(ToDoInitial());

  static ToDoCubit get(context) => BlocProvider.of(context);

  var isBottom= false;
  final TextEditingController taskController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final List<Map<String, String>> entriesTasks = [];

  void changeBottomSheet({required bool isShow , required Icon icon}){
    isBottom = isShow;
    emit(ChangeBottomSheetState());
  }

  addTasks() {
    entriesTasks.add({
      'ToDo': taskController.text,
      'Details': detailsController.text,
    });
    emit(AddTasksState());
  }

  void removeTasks(int index) {
    entriesTasks.removeAt(index);
    emit(RemoverTasksState());
  }


}
