import 'package:ambiez/base/blocs/task/task_bloc.dart';
import 'package:ambiez/design/foundations/colors.dart';
import 'package:ambiez/design/foundations/spacing.dart';
import 'package:ambiez/design/foundations/typo.dart';
import 'package:ambiez/design/tokens/typography.dart';
import 'package:core/api/task/request/task.dart';
import 'package:core/di/core_di.dart';
import 'package:flutter/material.dart';

class TitleInput extends StatelessWidget {
  TitleInput({
    Key? key,
  }) : super(key: key);

  final TextEditingController titleTaskEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: titleTaskEditingController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (newValue) {
        if (newValue.isNotEmpty) {
          getIt<TaskBloc>().add(
            AddTaskAllEvent(
              taskRequest: TaskRequest(
                title: newValue,
              ),
            ),
          );
          titleTaskEditingController.clear();
        }
      },
      style: TextStyle(fontSize: AmbiezTypographyFoundation.fontSizeH6),
      decoration: InputDecoration(
        fillColor: Colors.white70,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 28, horizontal: 10),
        prefixIcon: Container(
          padding: const EdgeInsets.all(AmbiezSpacingFoundation.spaceSmall),
          margin: const EdgeInsets.symmetric(
              horizontal: AmbiezSpacingFoundation.spaceSmall),
          decoration: BoxDecoration(
              color: AmbiezColorsFoundation.bgLightGray.withOpacity(0.7),
              borderRadius: BorderRadius.circular(22)),
          child: const Icon(
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
          borderSide: const BorderSide(
            color: AmbiezColorsFoundation.bgBlack,
            width: 0.75,
          ),
        ),
      ),
    );
  }
}
