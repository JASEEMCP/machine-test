import 'package:app/presentation/widget/helper_widget.dart';
import 'package:app/resource/utils/common_lib.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    this.obscureText,
    this.controller,
    this.validator,
    required this.label,
    this.suffix,
    this.type,
    this.inputFormatters,
  });

  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String? p1)? validator;
  final String label;
  final Widget? suffix;
  final TextInputType? type;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          inputFormatters: inputFormatters,
          keyboardType: type,
          obscureText: obscureText ?? false,
          controller: controller,
          validator: validator,
          style: $style.text.textN14.copyWith(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            //hintText: 'Enter email',
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: inset.xxs,
              children: [
                Gap(inset.xxs),
                Icon(Icons.phone_android),
                CustomText(txt: '+91'),
                Icon(Icons.arrow_drop_down, color: Colors.black87),
                Container(
                  height: 17,
                  width: 1,
                  color: Colors.black12,
                )
              ],
            ),
            // prefixIconConstraints: const BoxConstraints(
            //   minWidth: 100,
            //   minHeight: 40,
            // ),

            filled: true,
            suffixIcon: suffix,
            hintText: label,
            fillColor: Colors.white,
            hintStyle: $style.text.textN14.copyWith(
              color: Colors.black54,
            ),
            contentPadding: const EdgeInsets.all(12),
            border: _applyBorder(context),
            focusedBorder: _applyBorder(context),
            enabledBorder: _applyBorder(context),
            errorBorder: _applyBorder(context),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _applyBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black12,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}

class CustomTextFieldWidget2 extends StatelessWidget {
  const CustomTextFieldWidget2({
    super.key,
    this.obscureText,
    this.controller,
    this.validator,
    required this.label,
    this.suffix,
    this.type,
    this.inputFormatters,
    this.autofocus,
  });

  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String? p1)? validator;
  final String label;
  final Widget? suffix;
  final TextInputType? type;
  final List<TextInputFormatter>? inputFormatters;
  final bool? autofocus;

  @override
  Widget build(BuildContext context) {
    //final inset = $style.insets;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // CustomText(
        //   txt: label,
        //   fontSize: 14,
        //   fontWeight: FontWeight.w400,
        //   color: Colors.black,
        // ),
        // Gap(inset.xxs),
        TextFormField(
          textAlign: TextAlign.center,
          autofocus: autofocus ?? false,
          inputFormatters: inputFormatters,
          keyboardType: type ?? TextInputType.number,
          obscureText: obscureText ?? false,
          controller: controller,
          validator: validator,
          style: $style.text.textN14.copyWith(),
          onChanged: (value) {
            if (value.length == 1 && value.isNotEmpty) {
              FocusScope.of(context).nextFocus();
              // Perform any action when the text changes
            } else if (value.isEmpty) {
              FocusScope.of(context).previousFocus();
            }
          },
          decoration: InputDecoration(
            filled: true,
            suffixIcon: suffix,
            hintText: label,
            fillColor: Colors.white,
            hintStyle: $style.text.textN14.copyWith(),
            contentPadding: const EdgeInsets.all(12),
            border: _applyBorder(context),
            focusedBorder: _applyBorder(context),
            enabledBorder: _applyBorder(context),
            errorBorder: _applyBorder(context),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _applyBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black12,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
