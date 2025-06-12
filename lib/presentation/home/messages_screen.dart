import 'package:app/presentation/widget/custom_circle_btn.dart';
import 'package:app/presentation/widget/custom_text_field_widget.dart';
import 'package:app/presentation/widget/helper_widget.dart';
import 'package:app/resource/utils/common_lib.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
          spacing: inset.sm,
          children: [
            CustomCircleBtn(
              onTap: () {
                context.go(ScreenPath.login);
              },
            ),
            CustomText(
              txt: 'Messages',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(inset.sm),
            SingleChildScrollView(
              controller: ScrollController(initialScrollOffset: 0),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: inset.sm),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: inset.sm,
                children: [
                  for (int i = 0; i < 6; i++)
                    Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blueAccent,
                          ),
                        ),
                        CustomText(
                          txt: 'Name',
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                ],
              ),
            ),
            Gap(inset.sm),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: inset.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFieldWidget2(
                    label: 'Search',
                    textAlign: TextAlign.start,
                    radius: 30,
                    suffix: Icon(Icons.search),
                  ),
                  Gap(inset.sm),
                  CustomText(
                    txt: 'Chat',
                    fontWeight: FontWeight.bold,
                  ),
                  Gap(inset.xs),
                  SizedBox(
                    //height: 100,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.black12,
                        height: 30,
                      ),
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          onTap: () {},
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blueAccent,
                          ),
                          horizontalTitleGap: 5,
                          contentPadding: EdgeInsets.zero,
                          title: CustomText(
                            txt: 'User Name',
                            fontWeight: FontWeight.w700,
                          ),
                          trailing: CustomText(
                            txt: '10:00 AM',
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
