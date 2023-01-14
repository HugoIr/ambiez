import 'package:ambiez/base/blocs/task/task_bloc.dart';
import 'package:ambiez/base/components/atoms/spacer.dart';
import 'package:ambiez/design/foundations/colors.dart';
import 'package:ambiez/design/foundations/spacing.dart';
import 'package:ambiez/design/foundations/themes/ambiez_themes.dart';
import 'package:ambiez/base/components/molecules/task.dart';
import 'package:ambiez/di/di.dart';
import 'package:core/api/task/request/task.dart';
import 'package:core/config/config.dart';
import 'package:core/config/flavor.dart';
import 'package:core/feature/task/impl/get_all_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:core/di/core_di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const String flavor = String.fromEnvironment(
    'flavor',
    defaultValue: staging,
  );
  print("FLAVOR $flavor");
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
  TextEditingController titleTaskEditingController = TextEditingController();

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
                  GetTaskAllEvent(getTaskAllType: GetTaskAllType.todo),
                ),
            ),
          ],
          child: Scaffold(
            bottomNavigationBar: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 12, right: 60, bottom: 12),
                  padding:
                      EdgeInsets.only(top: 9, bottom: 9, left: 14, right: 34),
                  decoration: BoxDecoration(
                    // color: Color.fromARGB(255, 235, 235, 235),
                    color: Color(0xFFebebeb).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: GNav(
                    gap: 8,
                    haptic: false,
                    padding: EdgeInsets.all(16),
                    rippleColor: Colors.grey[200]!,
                    hoverColor: Colors.grey[100]!,
                    iconSize: 30,
                    duration: Duration(milliseconds: 500),
                    color: Colors.grey[600],
                    activeColor: AmbiezColorsFoundation.bgBlack,
                    tabs: const [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.timer,
                        text: 'Timer',
                      ),
                      GButton(
                        icon: Icons.person,
                        text: 'Profile',
                      )
                    ],
                  ),
                ),
                Positioned(
                    right: 20,
                    top: 8,
                    child: SizedBox(
                      width: 62,
                      height: 62,
                      child: FittedBox(
                        child: FloatingActionButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          backgroundColor: AmbiezColorsFoundation.bgBlack,
                          child: Icon(
                            Icons.add,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ))
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     color: Colors.black87,
                //   ),
                //   child: ,
                // )
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "My tasks",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const Space(
                      gap: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        controller: titleTaskEditingController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (newValue) {
                          print("NEWVALUE $newValue");
                          getIt<TaskBloc>().add(
                            AddTaskAllEvent(
                              taskRequest: TaskRequest(
                                title: newValue,
                              ),
                            ),
                          );
                          titleTaskEditingController.clear();
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 28, horizontal: 10),
                          prefixIcon: Container(
                            padding: EdgeInsets.all(12),
                            margin: EdgeInsets.only(left: 12, right: 12),
                            decoration: BoxDecoration(
                                color: Color(0xFFebebeb).withOpacity(0.7),
                                borderRadius: BorderRadius.circular(22)),
                            child: Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.grey[300]!,
                              style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AmbiezColorsFoundation.bgBlack,
                              width: 0.75,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal:
                            AmbiezSpacingFoundation.spacePaddingHorizontal,
                        vertical: AmbiezSpacingFoundation.spacePaddingVertical,
                      ),
                      child: BlocBuilder<TaskBloc, TaskState>(
                        builder: (context, state) {
                          print("STATE $state");
                          if (state is TaskAllLoaded) {
                            print("dalem loadedtask ${state.tasksData.length}");
                            return ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: state.tasksData.length,
                                separatorBuilder: (context, index) {
                                  return SizedBox();
                                },
                                itemBuilder: (context, index) {
                                  return Task(taskData: state.tasksData[index]);
                                });
                          } else if (state is TaskError) {
                            return Text(state.failure.message);
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
