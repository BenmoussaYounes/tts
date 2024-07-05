import 'package:flutter/material.dart';

import '../../../../core/enums/mos_enums.dart';

List<DropdownMenuItem> mosDropDownMenuItems = const [
  DropdownMenuItem(
    value: MOS.bad,
    child: Text('01 - Very poor'),
  ),
  DropdownMenuItem(
    value: MOS.poor,
    child: Text('02 - Poor'),
  ),
  DropdownMenuItem(
    value: MOS.fair,
    child: Text('03 - Average'),
  ),
  DropdownMenuItem(
    value: MOS.good,
    child: Text('04 - Good'),
  ),
  DropdownMenuItem(
    value: MOS.excellent,
    child: Text('05 - Excellent'),
  ),
];
