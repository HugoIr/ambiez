import 'package:ambiez/base/blocs/task/task_bloc.dart';
import 'package:ambiez/base/components/atoms/spacer.dart';
import 'package:ambiez/base/components/molecules/title_input.dart';
import 'package:ambiez/base/components/organisms/navbar.dart';
import 'package:ambiez/base/cubits/counter/counter_cubit.dart';
import 'package:ambiez/base/cubits/toggle/toggle_cubit.dart';
import 'package:ambiez/design/foundations/spacing.dart';
import 'package:ambiez/design/foundations/themes/ambiez_themes.dart';
import 'package:ambiez/base/components/molecules/task.dart';
import 'package:ambiez/design/foundations/typo.dart';
import 'package:ambiez/di/di.dart';
import 'package:core/config/config.dart';
import 'package:core/config/flavor.dart';
import 'package:core/feature/task/impl/get_all_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:core/di/core_di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const String flavor = String.fromEnvironment(
    'flavor',
    defaultValue: staging,
  );
  await CoreConfig.init(getFlavor(flavor));
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ligthThemeAmbiez,
      debugShowCheckedModeBanner: false,
      home: TaskPage(),
    );
  }
}

class TaskPage extends StatelessWidget {
  TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<TaskBloc>()
                ..add(
                  GetTaskAllEvent(getTaskAllType: GetTaskAllType.all),
                ),
            ),
            BlocProvider(
              create: (context) => getIt<ToggleCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<CounterCubit>(),
            ),
          ],
          child: Scaffold(
            // bottomNavigationBar: const Navbar(),
            body: SafeArea(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.w, vertical: 36.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "My tasks",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 2.w, top: 8.h),
                              child: BlocBuilder<CounterCubit, int>(
                                builder: (context, counterTodo) {
                                  return Text(
                                    'Need to ambiez on $counterTodo ${counterTodo > 1 ? "tasks" : "task"}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            fontSize: AmbiezTypographyFoundation
                                                .fontSizeBodyText),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: TitleInput(),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 242.h),
                    child: SingleChildScrollView(
                      // physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AmbiezSpacingFoundation
                                  .spacePaddingHorizontal.w,
                            ),
                            child: BlocBuilder<TaskBloc, TaskState>(
                              builder: (context, state) {
                                getIt<CounterCubit>().reset();

                                print("state $state");
                                if (state is TaskAllLoaded) {
                                  print("dalem TaskAllLoaded $state");
                                  if (state.tasksData.isEmpty) {
                                    return const Text('Let\'s Ambiez!');
                                  }
                                  return Container(
                                    height: 404.h,
                                    child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        // physics: const BouncingScrollPhysics(),
                                        itemCount: state.tasksData.length,
                                        itemBuilder: (context, index) {
                                          if (!state
                                              .tasksData[index].completed) {
                                            print("masuk");
                                            getIt<CounterCubit>().add();
                                            return Task(
                                                taskData:
                                                    state.tasksData[index]);
                                          }
                                          return const SizedBox();
                                        }),
                                  );
                                } else if (state is TaskError) {
                                  return Text(state.failure.message);
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ),
                          ),
                          const Space(),
                          TextButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.r)))),
                            onPressed: () {
                              getIt<ToggleCubit>().toggle();
                            },
                            child: const Text(
                              "Show completed task",
                            ),
                          ),
                          const Space(),
                          BlocBuilder<ToggleCubit, bool>(
                            builder: (context, show) {
                              if (show) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AmbiezSpacingFoundation
                                        .spacePaddingHorizontal.w,
                                  ),
                                  decoration: BoxDecoration(
                                    // color: AmbiezColorsFoundation.bgLightGray
                                    //     .withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: BlocBuilder<TaskBloc, TaskState>(
                                    builder: (context, state) {
                                      if (state is TaskAllLoaded) {
                                        return Container(
                                          height: 430.h,
                                          child: ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              // physics:
                                              //     const BouncingScrollPhysics(),
                                              itemCount: state.tasksData.length,
                                              itemBuilder: (context, index) {
                                                if (state.tasksData[index]
                                                    .completed) {
                                                  return Task(
                                                      taskData: state
                                                          .tasksData[index]);
                                                }
                                                return const SizedBox();
                                              }),
                                        );
                                      } else if (state is TaskError) {
                                        return Text(state.failure.message);
                                      } else {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                    },
                                  ),
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Align(
                      alignment: Alignment.bottomCenter, child: Navbar())
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
