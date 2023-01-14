import 'package:ambiez/base/components/atoms/spacer.dart';
import 'package:ambiez/base/cubits/toggle/toggle_cubit.dart';
import 'package:ambiez/design/foundations/colors.dart';
import 'package:ambiez/design/foundations/spacing.dart';
import 'package:core/feature/task/domain/task_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class Task extends StatelessWidget {
  TaskData taskData;
  Task({
    required this.taskData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggleCubit(taskData.completed),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                BlocBuilder<ToggleCubit, bool>(
                  builder: (context, state) {
                    return MSHCheckbox(
                      // shape: CircleBorder(),
                      size: 30,
                      value: state,
                      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                          checkedColor: AmbiezColorsFoundation.primaryColor),
                      style: MSHCheckboxStyle.fillScaleCheck,
                      onChanged: (_) => context.read<ToggleCubit>().toogle(),
                    );
                  },
                ),
                const Space(
                  gap: AmbiezSpacingFoundation.spaceCheckbox,
                  isHorizontal: true,
                ),
                BlocBuilder<ToggleCubit, bool>(
                  builder: (context, state) {
                    return Stack(alignment: Alignment.centerLeft, children: [
                      Text(
                        taskData.title,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              decoration:
                                  state ? TextDecoration.lineThrough : null,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      // state ? const Line() : const SizedBox()
                    ]);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Divider(
              thickness: 1.2,
            ),
          )
        ],
      ),
    );
  }
}
