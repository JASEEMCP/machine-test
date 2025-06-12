//import 'package:app/presentation/widget/helper_widget.dart';
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
    //final inset = $style.insets;
    return Scaffold(
      
      body: widget.child,
    );
  }

//   GestureDetector _buildNavIconBtn(
//     bool isSelected,
//     IconData unSelected,
//     IconData selected,
//     Function() onTap,
//     String? txt,
//   ) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Icon(
//             isSelected ? selected : unSelected,
//             size: 28,
//             color: isSelected ? Colors.indigo : Colors.indigo.shade300,
//           ),
//           Gap($style.insets.xxs),
//           CustomText(txt: txt ?? ''),
//         ],
//       ),
//     );
//   }
// }
}