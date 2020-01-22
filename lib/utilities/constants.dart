
import 'package:flutter/material.dart';

const Color kDefaultAppColor = Color(0xff2B275F);

final BoxDecoration kTopContainerDecoration = BoxDecoration(
                  color: kDefaultAppColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 5,
                        offset: Offset(0, 7),
                        spreadRadius: 1),
                  ],
                );
