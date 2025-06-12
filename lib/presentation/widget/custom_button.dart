import 'package:app/presentation/widget/helper_widget.dart';
import 'package:app/resource/utils/common_lib.dart';
import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.child,
    required this.onTap,
    this.bgColor,
    this.textColor,
    this.width,
    this.text,
  });
  final Widget? child;
  final Function() onTap;
  final Color? bgColor;
  final Color? textColor;
  final double? width;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: bgColor ?? Colors.indigo.shade100,
          width: 1.5,
        ),
      ),
      width: width ?? double.maxFinite,
      child: CupertinoButton(
          borderRadius: BorderRadius.circular(30),
          color: bgColor ?? Colors.indigo.shade600,
          padding: EdgeInsets.all(15),
          onPressed: onTap,
          child: child ??
              CustomText(
                txt: text ?? '',
                color: textColor ?? Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              )),
    );
  }
}
