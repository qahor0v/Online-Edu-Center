// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

HBox(double h) {
  return SizedBox(
    height: h,
  );
}

WBox(double w) {
  return SizedBox(
    width: w,
  );
}

SBox(double h) {
  return SliverToBoxAdapter(
    child: SizedBox(
      height: h,
    ),
  );
}
