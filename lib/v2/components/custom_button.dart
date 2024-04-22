import 'package:flutter/material.dart';

class CustomButton {
  Container btnFloating(Color colorBtn, Icon iconBtn, VoidCallback onPressedBtn) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: onPressedBtn,
        backgroundColor: colorBtn,
        child: iconBtn,
      ),
    );
  }

  Container btnAdd(VoidCallback onPressed) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  SizedBox btnEditDelete({
    required Widget firstButton,
    required Widget secondButton,
    VoidCallback? firstOnPressed,
    VoidCallback? secondOnPressed,
  }) {
    return SizedBox(
      width: 140.0,
      height: 60.0,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: FloatingActionButton(
                  onPressed: firstOnPressed ?? () {},
                  backgroundColor: Colors.yellowAccent,
                  child: firstButton,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: FloatingActionButton(
                  onPressed: secondOnPressed ?? () {},
                  backgroundColor: Colors.redAccent,
                  child: secondButton,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
