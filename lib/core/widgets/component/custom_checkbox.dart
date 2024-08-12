import 'package:flutter/material.dart';
import 'package:mackenzie_academy/core/utils/theme/color.dart';

class CustomCheckbox extends StatefulWidget {
  final bool isRememberMe;
  final ValueChanged<bool?> onChanged;

  CustomCheckbox({
    required this.isRememberMe,
    required this.onChanged,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isRememberMe = false;

  @override
  void initState() {
    super.initState();
    _isRememberMe = widget.isRememberMe;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text('Remember me', style: TextStyle(color: Colors.white)),
      value: _isRememberMe,
      onChanged: (bool? value) {
        setState(() {
          _isRememberMe = value ?? false;
        });
        widget.onChanged(_isRememberMe);
      },
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: AppColors.white,
      checkColor: AppColors.blue20,
    );
  }
}
