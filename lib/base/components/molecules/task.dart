import 'package:ambiez/base/blocs/task/task_bloc.dart';
import 'package:ambiez/base/components/atoms/spacer.dart';
import 'package:ambiez/design/foundations/colors.dart';
import 'package:ambiez/design/foundations/spacing.dart';
import 'package:core/di/core_di.dart';
import 'package:core/feature/task/domain/task_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class Task extends StatelessWidget {
  TaskData taskData;
  Task({
    required this.taskData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Row(
            children: [
              MSHCheckbox(
                size: 30,
                value: taskData.completed,
                colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                    checkedColor: AmbiezColorsFoundation.primaryColor,
                    uncheckedColor: Colors.black),
                style: MSHCheckboxStyle.fillScaleCheck,
                onChanged: (_) {
                  getIt<TaskBloc>().add(
                    ToggleTaskEvent(
                      taskId: taskData.id,
                    ),
                  );
                  // context.read<ToggleCubit>().toggle();
                },
              ),
              Space(
                gap: AmbiezSpacingFoundation.spaceCheckbox.h,
                isHorizontal: true,
              ),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Text(
                    taskData.title,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          decoration: taskData.completed
                              ? TextDecoration.lineThrough
                              : null,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 50.0),
          child: Divider(
            thickness: 1.2,
          ),
        )
      ],
    );
  }
}
