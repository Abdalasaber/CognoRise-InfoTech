import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_app/controllers/cubit/to_do_cubit/to_do_cubit.dart';
import 'package:to_do_app/style/app_colors.dart';
import 'package:to_do_app/views/widgets/default_form_field_login.dart';
import '../../../controllers/cubit/theme_cubit/theme_cubit.dart';
import '../../widgets/default_text.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  TextEditingController toDoController = TextEditingController();
  late ToDoCubit cubit;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    cubit = ToDoCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          // resizeToAvoidBottomInset: false,
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: ThemeCubit.get(context).isDark
                ? AppTheme.primaryColor
                : AppTheme.basieColor,
            elevation: 0.0,
            leading: const SizedBox(),
            title: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 5.0.w),
                child: DefaultText(
                  text: 'To Do',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: ThemeCubit.get(context).isDark
                      ? AppTheme.white
                      : AppTheme.darkMood,
                ),
              ),
            ),
            actions: [
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return Switch(
                      activeColor: AppTheme.white,
                      inactiveThumbColor: AppTheme.darkMood,
                      value: ThemeCubit.get(context).isDark,
                      onChanged: (value) {
                        ThemeCubit.get(context).changeTheme();
                      });
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: BlocBuilder<ToDoCubit, ToDoState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      BlocBuilder<ToDoCubit, ToDoState>(
                        builder: (context, state) {
                          return ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 3.h,
                                  ),
                              itemCount: cubit.entriesTasks.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppTheme.red,
                                  ),
                                  child: Dismissible(
                                    background: Padding(
                                      padding: EdgeInsets.only(left: 75.0.w),
                                      child: Icon(
                                        Icons.delete,
                                        color: AppTheme.white,
                                        size: 5.h,
                                      ),
                                    ),
                                    key: UniqueKey(),
                                    direction: DismissDirection.endToStart,
                                    onDismissed: (dismissed) async {
                                      cubit.removeTasks(index);
                                      IconSnackBar.show(
                                          context: context,
                                          snackBarType: SnackBarType.fail,
                                          label: 'Deleted successfully');
                                    },
                                    child: Container(
                                        height: 15.h,
                                        width: 150.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: ThemeCubit.get(context).isDark
                                              ? AppTheme.primaryColor
                                              : AppTheme.basieColor,

                                          // color: AppTheme.basieColor,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 3.5.h,
                                              right: 1.w,
                                              left: 1.w),
                                          child: ListTile(
                                            leading:
                                                const Icon(Icons.tag_sharp),
                                            title: Padding(
                                              padding:
                                                  EdgeInsets.only(top: 1.5.h),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  DefaultText(
                                                    text:
                                                        '${cubit.entriesTasks[index]['ToDo']}',
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        ThemeCubit.get(context)
                                                                .isDark
                                                            ? AppTheme.white
                                                            : AppTheme.darkMood,
                                                  ),
                                                  DefaultText(
                                                    text:
                                                        '${cubit.entriesTasks[index]['Details']}',
                                                    fontSize: 10.sp,
                                                    color:
                                                        ThemeCubit.get(context)
                                                                .isDark
                                                            ? AppTheme.white
                                                            : AppTheme.darkMood,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                );
                              });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              backgroundColor: ThemeCubit.get(context).isDark
                  ? AppTheme.primaryColor
                  : AppTheme.basieColor,
              onPressed: () {
                if (cubit.isBottom) {
                  if (formKey.currentState!.validate()) {
                    cubit.addTasks();
                    IconSnackBar.show(
                        context: context,
                        snackBarType: SnackBarType.save,
                        label: 'Added successfully');
                    Navigator.pop(context);
                  }
                } else {
                  cubit.changeBottomSheet(
                      isShow: true, icon: const Icon(Icons.padding));
                  scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 30.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  DefaultFormFieldLogin(
                                    controller: cubit.taskController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'cant be empty';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                    hintText: 'Task title',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  DefaultFormFieldLogin(
                                    controller: cubit.detailsController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'cant be empty';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                    hintText: 'Task details',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // backgroundColor: ThemeCubit.get(context).isDark ? AppTheme.darkMood : AppTheme.secondColor,
                      )
                      .closed
                      .then((value) {
                    cubit.changeBottomSheet(
                        isShow: false, icon: const Icon(Icons.camera));
                  });
                }
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Icon(
                Icons.add,
                color: ThemeCubit.get(context).isDark
                    ? AppTheme.white
                    : AppTheme.darkMood,
              ),
            ),
          ),
        );
      },
    );
  }
}
