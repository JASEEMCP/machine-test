import 'package:app/application/auth/login_cubit/login_cubit.dart';
import 'package:app/presentation/widget/custom_button.dart';
import 'package:app/presentation/widget/custom_circle_btn.dart';
import 'package:app/presentation/widget/custom_text_field_widget.dart';
import 'package:app/presentation/widget/helper_widget.dart';
import 'package:app/resource/utils/common_lib.dart';

class ScreenSignup extends StatelessWidget {
  ScreenSignup({super.key});

  final _phnController = TextEditingController();

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
                    txt: 'Enter your phone\nnumber',
                    fontSize: 26,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold,
                    color: context.theme.kBlack,
                  ),
                ),
                Gap(inset.lg),
                CustomTextFieldWidget(
                  label: 'Phone Number',
                  type: TextInputType.phone,
                  controller: _phnController,
                ),
                Gap(inset.xs),
                CustomText(
                  txt: 'Fliq will send you a text with a verification code.',
                  color: context.theme.kBlack.withValues(alpha: 0.6),
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
                  if(_phnController.text.trim().isNotEmpty){
                    context.read<LoginCubit>().loginUser(_phnController.text.trim());
                  }
                  else{
                    context.showCustomSnackBar('Enter Phone Number');
                  }
                  // context.go(ScreenPath.signupOtp(_phnController.text.trim()));
                },
                text: 'Next',
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
