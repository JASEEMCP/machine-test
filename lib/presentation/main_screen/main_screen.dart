import 'package:app/presentation/widget/helper_widget.dart';
import 'package:app/resource/utils/common_lib.dart';

ValueNotifier<int> tabChangeNotifier = ValueNotifier<int>(0);

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key, required this.child});

  final Widget child;

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(inset.sm),
        height: 85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(inset.sm),
            topRight: Radius.circular(inset.sm),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ValueListenableBuilder(
            valueListenable: tabChangeNotifier,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavIconBtn(
                    index == 0,
                    Icons.home_outlined,
                    Icons.home_rounded,
                    () {
                      tabChangeNotifier.value = 0;
                      if (index != 0) {
                        context.go(ScreenPath.home);
                      }
                    },
                    'Home',
                  ),
                  _buildNavIconBtn(
                    index == 1,
                    Icons.money_outlined,
                    Icons.money,
                    () {
                      tabChangeNotifier.value = 1;
                      if (index != 1) {
                        context.go(ScreenPath.expense);
                      }
                    },
                    'Expenses',
                  ),
                ],
              );
            }),
      ),
      body: widget.child,
    );
  }

  GestureDetector _buildNavIconBtn(
    bool isSelected,
    IconData unSelected,
    IconData selected,
    Function() onTap,
    String? txt,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            isSelected ? selected : unSelected,
            size: 28,
            color: isSelected ? Colors.indigo : Colors.indigo.shade300,
          ),
          Gap($style.insets.xxs),
          CustomText(txt: txt ?? ''),
        ],
      ),
    );
  }
}
