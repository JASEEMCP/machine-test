import 'package:app/application/auth/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:app/presentation/widget/custom_button.dart';
import 'package:app/presentation/widget/custom_circle_btn.dart';
import 'package:app/presentation/widget/custom_text_field_widget.dart';
import 'package:app/presentation/widget/helper_widget.dart';
import 'package:app/resource/utils/common_lib.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.phone});
  final String phone;

  final List<TextEditingController> _textController =
      List.generate(6, (_) => generateTextController());

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.kWhite,
        surfaceTintColor: context.theme.kWhite,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: CustomCircleBtn(
          onTap: () {
            context.pop();
            // context.go(ScreenPath.login);
          },
        ),
      ),
      backgroundColor: context.theme.kWhite,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: inset.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(inset.lg),
                Center(
                  child: CustomText(
                    txt: 'Enter your Verification\ncode',
                    fontSize: 26,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold,
                    color: context.theme.kBlack,
                  ),
                ),
                Gap(inset.lg),
                RichText(
                  text: TextSpan(
                    text: "+91 $phone",
                    style: $style.text.textN14.copyWith(
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: ' Edit',
                        style: $style.text.textN14.copyWith(
                          color: context.theme.kBlack,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(inset.sm),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: inset.xs,
                  children: [
                    Expanded(
                      child: CustomTextFieldWidget2(
                        label: '',
                        autofocus: true,
                        type: TextInputType.phone,
                        controller: _textController[0],
                      ),
                    ),
                    Expanded(
                      child: CustomTextFieldWidget2(
                        label: '',
                        autofocus: true,
                        type: TextInputType.phone,
                        controller: _textController[1],
                      ),
                    ),
                    Expanded(
                      child: CustomTextFieldWidget2(
                        label: '',
                        autofocus: true,
                        type: TextInputType.phone,
                        controller: _textController[2],
                      ),
                    ),
                    Expanded(
                      child: CustomTextFieldWidget2(
                        label: '',
                        autofocus: true,
                        type: TextInputType.phone,
                        controller: _textController[3],
                      ),
                    ),
                    Expanded(
                      child: CustomTextFieldWidget2(
                        label: '',
                        autofocus: true,
                        type: TextInputType.phone,
                        controller: _textController[4],
                      ),
                    ),
                    Expanded(
                      child: CustomTextFieldWidget2(
                        label: '',
                        autofocus: true,
                        type: TextInputType.phone,
                        controller: _textController[5],
                      ),
                    ),
                  ],
                ),
                Gap(inset.sm),
                CustomText(
                  txt: 'Don\'t get anything? No worries, let\'s try again.',
                  color: context.theme.kBlack.withValues(alpha: 0.6),
                ),
                CustomText(
                  txt: 'Resent',
                  color: Colors.indigoAccent,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.only(
                left: inset.sm,
                right: inset.sm,
                bottom: inset.lg,
              ),
              child: CustomButton(
                onTap: () {
                  String text = '';
                  for (var x in _textController) {
                    text += x.text;
                  }

                  context
                      .read<VerifyOtpCubit>()
                      .verifyOtp(phone.trim(), text.trim());
                  // context.go(ScreenPath.messages);
                },
                text: 'Verify',
                bgColor: context.theme.kPink,
                textColor: context.theme.kWhite,
              ),
            ),
          )
        ],
      ),
    );
  }
}
