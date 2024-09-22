import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_config.dart';
import '../../navigation/nav.dart';
import '../../theme/text_theme_styles.dart';

Future<String?> showEnterNameDialog(
  String title, {
  bool preventSpecialCharacter = false,
  String? initData,
  int? maxLines,
}) {
  return showDialog<String?>(
    context: AppConfig.appNavigatorKey.currentContext!,
    builder: (context) => EnterNameDialog(
      title: title,
      initData: initData,
      maxLines: maxLines,
      preventSpecialCharacter: preventSpecialCharacter,
    ),
  );
}

class EnterNameDialog extends StatefulWidget {
  const EnterNameDialog({
    super.key,
    required this.title,
    required this.maxLines,
    required this.initData,
    required this.preventSpecialCharacter,
  });
  final String title;
  final int? maxLines;
  final String? initData;
  final bool preventSpecialCharacter;

  @override
  State<EnterNameDialog> createState() => _EnterNameDialogState();
}

class _EnterNameDialogState extends State<EnterNameDialog> {
  final _controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final specialCharacters = ["<", ">", ":", "/", "\\", "|", "?", "*"];

  @override
  void initState() {
    super.initState();
    if (widget.initData != null) {
      _controller.text = widget.initData!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 50.h),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: TextThemeStyles.text_18_Regular.copyWith(
                  color: Colors.black,
                ),
              ),
              TextFormField(
                maxLines: widget.maxLines,
                controller: _controller,
                onChanged: (value) => formKey.currentState?.validate(),
                validator: (value) {
                  if (value != null && value.isEmpty) return "Required";
                  if (widget.preventSpecialCharacter &&
                      value!.contains(RegExp(r"<|>|:|/|\\|\||\?|\*"))) {
                    return "Not allowed use [${specialCharacters.join(" ")}]";
                  }
                  return null;
                },
              ),
              50.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextButton(onPressed: Nav.pop, child: Text("Cancel")),
                  FilledButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        Nav.pop(null, _controller.text);
                      }
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
