import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:attandenceadmin/components/widget.dart';
import 'package:attandenceadmin/const/color_const.dart';
import 'package:attandenceadmin/config/Router/routing_service.dart';

class TextFieldData extends StatefulWidget {
  final int? minLines;
  final bool? enabled;
  final int? maxLines;
  final Color? cursorColor;
  final TextStyle? style;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputDecoration? decoration;
  final bool? readOnly;
  final String? hintText;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? label;
  final Color? labelColor;
  final String? text;
  const TextFieldData({
    super.key,
    this.minLines,
    this.enabled,
    this.maxLines,
    this.cursorColor,
    this.style,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.decoration,
    this.readOnly,
    this.hintText,
    this.onTap,
    this.onChanged,
    this.inputFormatters,
    this.autovalidateMode,
    this.keyboardType,
    this.controller,
    this.label,
    this.text,
    this.validator,
    this.labelColor,
  });

  @override
  State<TextFieldData> createState() => _TextFieldDataState();
}

class _TextFieldDataState extends State<TextFieldData> {
  @override
  Widget build(BuildContext context) {
    final isObscured = widget.obscureText ?? false;
    final adjustedMaxLines = isObscured ? 1 : (widget.maxLines ?? 5);
    return TextFormField(
      cursorWidth: 2,
      cursorHeight: 20,
      cursorColor: widget.cursorColor ?? black,
      onChanged: widget.onChanged,
      enabled: widget.enabled,
      onTap: widget.onTap,
      // autofocus: true,
      minLines: widget.minLines ?? 1,
      maxLines: adjustedMaxLines,
      inputFormatters: widget.inputFormatters,
      onTapOutside: (event) {
        final context = RoutingService.navigatorKey.currentContext;
        if (context == null) {
          log("Context is null!");
        } else {
          log("Context is valid");
        }
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autovalidateMode: widget.autovalidateMode,
      validator: widget.validator,
      obscureText: widget.obscureText ?? false,
      keyboardType: widget.keyboardType,
      readOnly: widget.readOnly ?? false,
      controller: widget.controller,
      style: widget.style ?? TextStyle(color: black),
      decoration:
          widget.decoration ??
          InputDecoration(
            suffixIcon: widget.suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: grey),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.greenAccent),
            ),
            contentPadding: const EdgeInsets.all(10.0),
            labelStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            label: (widget.label != null)
                ? barlowBold(
                    text: widget.label ?? "",
                    color: widget.labelColor ?? black,
                    size: 14,
                  )
                : null,
            prefixIcon: widget.prefixIcon,
            hintText: widget.hintText,
            border: const OutlineInputBorder(),
          ),
    );
  }
}
// class TextFieldData  {
//   static buildField({
//     int? minLines,
//     bool? enabled,
//     int? maxLines,
//     Color? cursorColor,
//     TextStyle? style,
//     bool? obscureText,
//     Widget? suffixIcon,
//     Widget? prefixIcon,
//     InputDecoration? decoration,
//     bool? readOnly,
//     String? hintText,
//     void Function()? onTap,
//     void Function(String)? onChanged,
//     List<TextInputFormatter>? inputFormatters,
//     AutovalidateMode? autovalidateMode,
//     String? Function(String?)? validator,
//     TextInputType? keyboardType,
//     TextEditingController? controller,
//     Widget? label,
//     String? text,
//   }) {
//     final isObscured = obscureText ?? false;
//     final adjustedMaxLines = isObscured ? 1 : (maxLines ?? 5);

//     return TextFormField(
//       cursorWidth: 2,
//       cursorHeight: 20,
//       cursorColor: cursorColor ?? black,
//       onChanged: onChanged,
//       enabled: enabled,
//       onTap: onTap,
//       autofocus: true,
//       minLines: minLines ?? 1,
//       maxLines: adjustedMaxLines,
//       inputFormatters: inputFormatters,
//       onTapOutside: (event) {
//         final context = RoutingService.navigatorKey.currentContext;
//         if (context == null) {
//           log("Context is null!");
//         } else {
//           log("Context is valid");
//         }
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       autovalidateMode: autovalidateMode,
//       validator: validator,
//       obscureText: obscureText ?? false,
//       keyboardType: keyboardType,
//       readOnly: readOnly ?? false,
//       controller: controller,
//       style: style ??
//           const TextStyle(
//             color: Colors.black,
//           ),
//       decoration: decoration ??
//           InputDecoration(
//             suffixIcon: suffixIcon,
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 width: 1,
//                 color: grey,
//               ),
//             ),
//             errorBorder: const OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.red,
//               ),
//             ),
//             disabledBorder: const OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.black,
//               ),
//             ),
//             focusedBorder: const OutlineInputBorder(
//               borderSide: BorderSide(
//                 width: 1,
//                 color: Colors.greenAccent,
//               ),
//             ),
//             contentPadding: const EdgeInsets.all(10.0),
//             labelStyle: const TextStyle(
//               fontSize: 14,
//               color: Colors.grey,
//             ),
//             label: label,
//             prefixIcon: prefixIcon,
//             hintText: hintText,
//             border: const OutlineInputBorder(),
//           ),
//     );
//   }
// }
