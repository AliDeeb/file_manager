import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_config.dart';
import '../../navigation/nav.dart';
import '../../theme/text_theme_styles.dart';

Future<String?> showEnterNameDialog() {
  return showDialog<String?>(
    context: AppConfig.appNavigatorKey.currentContext!,
    builder: (context) => const EnterNameDialog(),
  );
}

class EnterNameDialog extends StatefulWidget {
  const EnterNameDialog({super.key});

  @override
  State<EnterNameDialog> createState() => _EnterNameDialogState();
}

class _EnterNameDialogState extends State<EnterNameDialog> {
  final _controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 50.h),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Enter folder name:",
                style: TextThemeStyles.text_18_Regular.copyWith(
                  color: Colors.black,
                ),
              ),
              TextFormField(
                controller: _controller,
                validator: (value) {
                  if (value != null && value.isNotEmpty) return null;
                  return "Required";
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
