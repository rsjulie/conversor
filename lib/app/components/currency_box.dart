// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:conversor/app/models/currency_model.dart';

class CurrencyBox extends StatelessWidget {
  const CurrencyBox({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  final List<CurrencyModel> items;
  final CurrencyModel selectedItem;
  final TextEditingController controller;
  final void Function(CurrencyModel? model)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 55,
              child: DropdownButton<CurrencyModel>(
                  iconEnabledColor: Colors.amber,
                  isExpanded: true,
                  elevation: 16,
                  value: selectedItem,
                  style: const TextStyle(color: Colors.white),
                  underline: Container(
                    height: 2,
                    color: Colors.amber,
                  ),
                  onChanged: onChanged,
                  items: items
                      .map((e) =>
                          DropdownMenuItem(value: e, child: Text(e.name)))
                      .toList()),
            )),
        const SizedBox(
          width: 15,
        ),
        Expanded(
            flex: 2,
            child: SizedBox(
                height: 58,
                child: TextField(
                  controller: controller,
                  keyboardType: const TextInputType.numberWithOptions(),
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.amber, width: 2)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.amber, width: 2))),
                )))
      ],
    );
  }
}
