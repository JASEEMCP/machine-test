import 'package:app/presentation/widget/helper_widget.dart';
import 'package:app/resource/utils/common_lib.dart';

class MenuItem {
  final String id;
  final String? model;

  MenuItem(this.id, this.model);
}

class CustomDropDownSearch extends StatefulWidget {
  const CustomDropDownSearch({
    super.key,
    this.controller,
    required this.label,
    this.hintText,
    required this.menu,
    this.radius,
    required this.onSelect,
    this.enableController,
    this.validate = false,
    this.enableFilter,
    this.width,
    this.validator,
    this.enabled,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String label;
  final String? hintText;
  final List<MenuItem> menu;
  final double? radius;
  final Function(MenuItem?) onSelect;
  final bool? enableController;
  final bool? validate;
  final bool? enableFilter;
  final double? width;
  final bool? enabled;
  final Function(String)? onChanged;
  final String Function(String?)? validator;

  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller?.addListener(
      () {
        if (widget.onChanged != null) {
          widget.onChanged!(widget.controller?.text ?? '');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final theme = MediaQuery.of(context).platformBrightness;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          txt: widget.label,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        Gap($style.insets.xxs),
        DropdownMenu<MenuItem>(
          enabled: widget.enabled ?? true,
          initialSelection: null,
          controller: widget.controller,
          expandedInsets: EdgeInsets.zero,
          width: widget.width,
          menuStyle: const MenuStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
              surfaceTintColor: WidgetStatePropertyAll(Colors.white)),
          hintText: widget.label,
          requestFocusOnTap: widget.enableController ?? true,
          enableFilter: widget.enableFilter ?? false,
          selectedTrailingIcon: const Icon(
            Icons.keyboard_arrow_down,
            size: 26,
          ),
          menuHeight: 200,
          trailingIcon: const Icon(
            Icons.keyboard_arrow_down,
            size: 26,
            // size: 15,
          ),
          onSelected: widget.onSelect,
          dropdownMenuEntries:
              widget.menu.map<DropdownMenuEntry<MenuItem>>((MenuItem menu) {
            return DropdownMenuEntry<MenuItem>(
              value: menu,
              label: menu.model ?? '',
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                textStyle: $style.text.textN14.copyWith(),
              ),
            );
          }).toList(),
          inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            hintStyle: $style.text.textN14.copyWith(),
            disabledBorder: _buildInputBorder(context, widget.radius),
            focusedErrorBorder: _buildInputBorder(context, widget.radius),
            focusedBorder: _buildInputBorder(context, widget.radius),
            errorBorder: _buildInputBorder(context, widget.radius),
            enabledBorder: _buildInputBorder(context, widget.radius),
            border: _buildInputBorder(context, widget.radius),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _buildInputBorder(BuildContext context, double? radius) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 8),
      borderSide: const BorderSide(
        color: Colors.black12,
      ),
    );
  }
}
