import 'package:app/presentation/widget/custom_circle_btn.dart';
import 'package:app/presentation/widget/helper_widget.dart';
import 'package:app/resource/utils/common_lib.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color.fromARGB(0, 180, 180, 180),
        automaticallyImplyLeading: false,
        title: Row(
          spacing: inset.sm,
          children: [
            CustomCircleBtn(
              onTap: () {
                context.pop();
              },
            ),
            Row(
              spacing: inset.xs,
              children: [
                CircleAvatar(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      txt: 'User Name',
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      spacing: inset.xxs,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          txt: 'Online',
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.greenAccent,
                          size: 12,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          /// Messages Area
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(-2, -2),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(inset.sm),
                  topRight: Radius.circular(inset.sm),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(inset.sm),
                // important for chat scroll behavior
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(inset.xxs),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[200],
                      ),
                      child: CustomText(
                        txt: 'Today',
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(inset.xs),
                              decoration: BoxDecoration(
                                color: context.theme.kPink,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                              ),
                              child: CustomText(
                                txt: 'HAi',
                                color: context.theme.kWhite,
                                fontSize: 13,
                              ),
                            ),
                            CustomText(
                              txt: '10:00 AM',
                              fontSize: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Text Input at Bottom
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.black12,
                  ),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: inset.sm,
                vertical: inset.xs,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        filled: true,
                        fillColor: Colors.grey[200],
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.send,
                            color: context.theme.kPink,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
