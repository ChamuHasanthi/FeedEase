import 'package:feeding_application/core/themeData/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required this.controller,
    required this.labelName,
    this.validatorFucntion,
    this.hintText,
    this.focusNode,
    this.textInputType,
    this.nextFocusNode,
    this.isPasswordField = false,
    this.isPasswordVisible = false,
    this.onTogglePasswordVisibility,
  });

  final TextEditingController controller;
  final String labelName;
  final String? Function(String?)? validatorFucntion;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputType? textInputType;
  final String? hintText;
  final bool isPasswordField;
  final bool isPasswordVisible;
  final VoidCallback? onTogglePasswordVisibility;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              labelName,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.deepBlue),
            ),
          ),
          TextFormField(
            controller: controller,
            validator: validatorFucntion,
            focusNode: focusNode,
            obscureText: isPasswordField && !isPasswordVisible,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: isPasswordField
                  ? IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: onTogglePasswordVisibility,
                    )
                  : null,
            ),
            onTapOutside: (event) {
              if (focusNode != null) {
                focusNode!.unfocus();
              }
            },
            textInputAction: TextInputAction.next,
            keyboardType: textInputType,
            onEditingComplete: () {
              if (nextFocusNode != null) {
                FocusScope.of(context).requestFocus(nextFocusNode);
              } else {
                FocusScope.of(context).unfocus();
              }
            },
          ),
        ],
      ),
    );
  }
}
