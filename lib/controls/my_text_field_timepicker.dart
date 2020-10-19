import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lincus_maternity/ui/themes/styles.dart';

class MyTextFieldTimePicker extends StatefulWidget {
  final ValueChanged<TimeOfDay> onTimeChanged;
  final TimeOfDay initialTime;
  final TimeOfDayFormat timeFormat;
  final FocusNode focusNode;
  final String labelText;
  final Icon prefixIcon;
  final Icon suffixIcon;

  MyTextFieldTimePicker({
    Key key,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.timeFormat,
    @required this.initialTime,
    @required this.onTimeChanged,
  })  : assert(initialTime != null),
        assert(onTimeChanged != null, 'onTimeChanged must not be null'),
        super(key: key);

  @override
  _MyTextFieldTimePicker createState() => _MyTextFieldTimePicker();
}

class _MyTextFieldTimePicker extends State<MyTextFieldTimePicker> {
  TextEditingController _controllerTime;
  TimeOfDayFormat _timeFormat;
  TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();

    if (widget.timeFormat != null) {
      _timeFormat = widget.timeFormat;
    } else {
      _timeFormat = TimeOfDayFormat.HH_dot_mm;
    }

    _selectedTime = widget.initialTime;

    _controllerTime = TextEditingController();
    _controllerTime.text = formatTimeOfDay(widget.initialTime);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focusNode,
      controller: _controllerTime,
      style: defaultTextFieldTextStyle,
      decoration: InputDecoration(
          border: defaultTextFieldUnderlineBorder,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: widget.prefixIcon,
          labelText: widget.labelText,
          suffixIcon: widget.suffixIcon),
      onTap: () => _selectTime(context),
      readOnly: true,
    );
  }

  @override
  void dispose() {
    _controllerTime.dispose();
    super.dispose();
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay pickedTime = await showTimePicker(
        context: context,
        initialTime: _selectedTime,
        initialEntryMode: TimePickerEntryMode.dial);

    if (pickedTime != null && pickedTime != _selectedTime) {
      _selectedTime = pickedTime;
      _controllerTime.text = formatTimeOfDay(_selectedTime);
      widget.onTimeChanged(_selectedTime);
    }

    if (widget.focusNode != null) {
      widget.focusNode.nextFocus();
    }
  }

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat("HH.mm"); //"6:00 AM"
    return format.format(dt);
  }
}
