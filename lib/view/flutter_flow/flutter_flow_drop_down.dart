import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';

class FlutterFlowDropDown extends StatefulWidget {
  const FlutterFlowDropDown({
    this.value,
    this.hintText,
    required this.options,
    required this.onChanged,
    this.buildItem,
    this.icon,
    this.width,
    this.height,
    this.fillColor,
    this.textStyle,
    this.elevation,
    this.borderWidth,
    this.borderRadius,
    this.borderColor,
    this.margin,
    this.hidesUnderline = false,
    this.checkItemInList,
  });

  final dynamic value;
  final String? hintText;
  final List<dynamic> options;
  final Function(dynamic) onChanged;
  final Function(dynamic)? buildItem;
  final Widget? icon;
  final double? width;
  final double? height;
  final Color? fillColor;
  final TextStyle? textStyle;
  final double? elevation;
  final double? borderWidth;
  final double? borderRadius;
  final Color? borderColor;
  final EdgeInsetsGeometry? margin;
  final bool? hidesUnderline;
  final Function? checkItemInList;

  @override
  State<FlutterFlowDropDown> createState() => _FlutterFlowDropDownState();
}

class _FlutterFlowDropDownState extends State<FlutterFlowDropDown> {
  // dynamic dropDownValue;
  List<dynamic> get effectiveOptions =>
      widget.options.isEmpty ? [] : widget.options;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('widget.value===${widget.value}');
    print(
        'effectiveOptions.contains(widget.value)===${effectiveOptions.contains(widget.value)}');
    final dropdownWidget = DropdownButton<dynamic>(
      value: widget.checkItemInList != null
          ? widget.checkItemInList!(effectiveOptions, widget.value)
              ? widget.value
              : null
          : effectiveOptions.contains(widget.value)
              ? widget.value
              : null,
      hint: widget.hintText != null
          ? Text(widget.hintText!, style: widget.textStyle)
          : null,
      items: effectiveOptions
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  widget.buildItem == null ? e : widget.buildItem!(e),
                  style: widget.textStyle,
                ),
              ))
          .toList(),
      elevation: widget.elevation!.toInt(),
      onChanged: (value) {
        widget.onChanged(value);
      },
      icon: widget.icon,
      isExpanded: true,
      dropdownColor: Colors.grey.shade300,
      focusColor: Colors.transparent,
    );
    final childWidget = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 28),
        border: Border.all(
          color: widget.borderColor!,
          width: widget.borderWidth!,
        ),
        color: widget.fillColor,
      ),
      child: Padding(
        padding: widget.margin!,
        child: widget.hidesUnderline!
            ? DropdownButtonHideUnderline(child: dropdownWidget)
            : dropdownWidget,
      ),
    );
    if (widget.height != null || widget.width != null) {
      return Container(
          width: widget.width, height: widget.height, child: childWidget);
    }
    return childWidget;
  }
}
