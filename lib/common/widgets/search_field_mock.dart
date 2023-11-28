import 'package:SportRabbit/common/colors.dart';
import 'package:flutter/material.dart';

class SearchFieldModel extends StatelessWidget {
  final String searchHintText;
  final Function onSearchTap;

  const SearchFieldModel(
      {super.key, required this.searchHintText, required this.onSearchTap});

  @override
  Widget build(BuildContext context) {
// rounded corners search text field
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        decoration: BoxDecoration(
            color: appMainColor, borderRadius: BorderRadius.circular(50)),
        child: TextField(
            readOnly: true,
            onTap: () {
              onSearchTap();
            },
            decoration: InputDecoration(
                hintText: searchHintText,
                hintStyle: TextStyle(color: appSecondaryColor),
                prefixIcon:
                    Icon(Icons.search, size: 35, color: appSecondaryColor),
                border: InputBorder.none)));
  }
}
