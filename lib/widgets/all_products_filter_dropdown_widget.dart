import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/screens/all_products_screen.dart';
import 'package:flutter_ecom_app/widgets/all_products_screen_filters_widget.dart';

class AllProductDropDownFilter extends StatefulWidget {
  const AllProductDropDownFilter({Key? key}) : super(key: key);

  @override
  State<AllProductDropDownFilter> createState() =>
      _AllProductDropDownFilterState();
}

class _AllProductDropDownFilterState extends State<AllProductDropDownFilter> {
  var _sortDropDownValue = sortFilterIndex['sortPriceLowestFirst'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
/*          Expanded(
            child: DropdownButton(
              items: [
                DropdownMenuItem(
                  value: sortFilterIndex[sortPriceLowestFirst],
                  child: const Text(sortPriceLowestFirst),
                ),
                DropdownMenuItem(
                  value: sortIndex[sortPriceHighestFirst],
                  child: const Text(sortPriceHighestFirst),
                ),
                DropdownMenuItem(
                  value: sortIndex[sortHighRatedFirst],
                  child: const Text(sortHighRatedFirst),
                ),
                DropdownMenuItem(
                  value: sortIndex[sortLowRatedFirst],
                  child: const Text(sortLowRatedFirst),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _sortDropDownValue = value;
                });
              },
              value: _sortDropDownValue,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: DropdownButton(
              items: [
                DropdownMenuItem(
                  value: sortIndex[sortPriceLowestFirst],
                  child: const Text(sortPriceLowestFirst),
                ),
                DropdownMenuItem(
                  value: sortIndex[sortPriceHighestFirst],
                  child: const Text(sortPriceHighestFirst),
                ),
                DropdownMenuItem(
                  value: sortIndex[sortHighRatedFirst],
                  child: const Text(sortHighRatedFirst),
                ),
                DropdownMenuItem(
                  value: sortIndex[sortLowRatedFirst],
                  child: const Text(sortLowRatedFirst),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _sortDropDownValue = value;
                });
              },
              value: _sortDropDownValue,
            ),
          )*/
        ],
      ),
    );
  }
}
