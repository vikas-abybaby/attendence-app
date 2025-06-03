import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:attandenceadmin/const/color_const.dart';
import 'package:attandenceadmin/components/widget.dart';

class DropdownMultiplleSelect<T> extends StatefulWidget {
  final String? hintText;
  final List<T> selectedItems;
  final List<T> items;
  final void Function(List<T>)? onChanged;
  final String Function(T)? itemAsString;
  final PopupPropsMultiSelection<T>? popupProps;
  final String? Function(List<T>?)? validator;
  final AutovalidateMode? autoValidateMode;
  final bool enabled;
  const DropdownMultiplleSelect({
    super.key,
    this.hintText,
    this.selectedItems = const [],
    this.items = const [],
    this.onChanged,
    this.itemAsString,
    this.popupProps,
    this.validator,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.enabled = true,
  });

  @override
  State<DropdownMultiplleSelect<T>> createState() =>
      _DropdownMultiplleSelectState<T>();
}

class _DropdownMultiplleSelectState<T>
    extends State<DropdownMultiplleSelect<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>.multiSelection(
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          hintText: widget.hintText,
          label: barlowBold(text: widget.hintText ?? "", size: 14),
          hintStyle: TextStyle(color: grey, fontSize: 14),
          hintMaxLines: 1,
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
          contentPadding: const EdgeInsets.all(10),
          border: const OutlineInputBorder(),
        ),
      ),

      enabled: widget.enabled,
      autoValidateMode: widget.autoValidateMode,
      validator: widget.validator,
      popupProps:
          widget.popupProps ??
          PopupPropsMultiSelection.dialog(
            fit: FlexFit.loose,
            showSelectedItems: false,
            showSearchBox: true,
            searchFieldProps: TextFieldProps(
              maxLines: 1,
              style: TextStyle(color: black),
              decoration: InputDecoration(
                hintText: widget.hintText,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
              cursorColor: Colors.blue,
            ),
          ),
      selectedItems: widget.selectedItems,
      items: (filter, loadProps) => widget.items,
      itemAsString: widget.itemAsString,
      onChanged: widget.onChanged,
    );
  }
}
