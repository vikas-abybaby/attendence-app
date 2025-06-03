import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:attandenceadmin/const/color_const.dart';
import 'package:attandenceadmin/components/widget.dart';

// ignore: must_be_immutable
class DropdownView<T> extends StatefulWidget {
  DropdownView({
    super.key,
    this.hintText,
    required this.items,
    required this.itemAsString,
    required this.onChanged,
    this.validator,
    this.hintTextName,
    this.selectedItem,
    this.popupProps,
  });

  final String? hintText;
  final String? hintTextName;
  final List<T> items;
  final PopupProps<T>? popupProps;
  final T? selectedItem;
  final String Function(T)? itemAsString;
  final String? Function(T? value)? validator;
  void Function(T? value)? onChanged;
  @override
  State<DropdownView<T>> createState() => _DropdownViewState<T>();
}

class _DropdownViewState<T> extends State<DropdownView<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      popupProps:
          widget.popupProps ??
          PopupProps.dialog(
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
      // selectedItem: selectedClient.clientCompany,
      onChanged: widget.onChanged,
      selectedItem: widget.selectedItem,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      clickProps: ClickProps(),
      items: (filter, loadProps) => widget.items,
      itemAsString: widget.itemAsString,
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
    );
  }
}
