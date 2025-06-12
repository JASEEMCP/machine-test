import 'package:app/presentation/widget/custom_button.dart';
import 'package:app/presentation/widget/helper_widget.dart';
import 'package:app/resource/utils/common_lib.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// Background image fills entire screen
          Positioned.fill(
            child: Opacity(
              opacity: 0.9,
              child: Image.asset(
                'assets/bg.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Black overlay with opacity
          Positioned.fill(
            child: Container(
              color: Colors.black
                  .withValues(alpha: 0.5), // Adjust opacity (0.0 - 1.0)
            ),
          ),

          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(inset.customSize(130)),
                Image.asset(
                  'assets/img_01.png',
                ),
                CustomText(
                  txt: 'Connect.Meet.Love.\nWith Fliq Dating',
                  fontSize: 26,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w900,
                  color: context.theme.kWhite,
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
                  left: inset.sm, right: inset.sm, bottom: inset.lg),
              child: Column(
                spacing: inset.sm,
                children: [
                  CustomButton(
                    bgColor: context.theme.kWhite,
                    textColor: context.theme.kBlack,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: inset.xs,
                      children: [
                        Image.asset(
                          'assets/google.png',
                          height: 22,
                        ),
                        CustomText(
                          txt: 'Sign with Google',
                          fontSize: 16,
                          color: context.theme.kBlack,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  CustomButton(
                    bgColor: Colors.indigo.shade600,
                    textColor: context.theme.kWhite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: inset.xs,
                      children: [
                        Image.asset(
                          'assets/facebook.png',
                          height: 25,
                        ),
                        CustomText(
                          txt: 'Sign with Facebook',
                          fontSize: 16,
                          color: context.theme.kWhite,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  CustomButton(
                    bgColor: context.theme.kPink,
                    textColor: context.theme.kWhite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: inset.xs,
                      children: [
                        Icon(
                          Icons.call,
                          color: context.theme.kWhite,
                        ),
                        CustomText(
                          txt: 'Sign with phone number',
                          fontSize: 16,
                          color: context.theme.kWhite,
                        ),
                      ],
                    ),
                    onTap: () {
                      context.go(ScreenPath.register());
                    },
                  ),
                  Gap(inset.sm),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'By signing up, you agree to our ',
                      style: TextStyle(
                        color: context.theme.kWhite,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: context.theme.kWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '. See how we use your data in our ',
                          style: TextStyle(
                            color: context.theme.kWhite,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: context.theme.kWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
