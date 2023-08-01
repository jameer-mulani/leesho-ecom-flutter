import 'package:flutter/material.dart';

class FilterRadioModalBottomSheet extends StatefulWidget {
  const FilterRadioModalBottomSheet(
      {Key? key, required this.titleList, required this.indexMap, this.checkedIndex = 0})
      : super(key: key);

  final List<String> titleList;
  final Map<String, int> indexMap;
  final int checkedIndex;

  @override
  State<FilterRadioModalBottomSheet> createState() => _FilterRadioModalBottomSheetState();
}

class _FilterRadioModalBottomSheetState extends State<FilterRadioModalBottomSheet> {

  var _groupValue = 0;

  @override
  void initState() {
    _groupValue = widget.checkedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "sort".toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 2,
            color: Colors.black26,
          ),
          const SizedBox(
            height: 20,
          ),
          // for (final item in SortCategory.values)
          
          StatefulBuilder(
            builder: (context, _setState) {
              return ListView(
                shrinkWrap: true,
                children: [
                  for (final item in widget.titleList)
                    RadioListTile<int>(
                      activeColor: Theme.of(context).primaryColor,
                      value: widget.indexMap[item]!,
                      groupValue: _groupValue,
                      onChanged: (value) => _setState(() {
                        _groupValue = value!;
                      }),
                      title: Text(item),
                    ),
                ],
              );
            },
          )
        ],
      ),
    ]);
    ;
  }
}
