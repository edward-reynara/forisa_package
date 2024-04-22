import 'package:flutter/material.dart';

import '../../v1/widgets/buttons.dart';

Center emptyDataWidget({String? msg, void Function()? callback, String? btnText}) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              msg ?? 'Data tidak ditemukan',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          if(callback != null)
          buttonCompact(onPressed: callback, text: btnText ?? 'Ulangi'),
        ],
      ),
    );
