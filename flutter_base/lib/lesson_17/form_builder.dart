import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MaterialApp(
    localizationsDelegates: [
      FormBuilderLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      Locale('en', ''),
      // Locale('ru', ''),
    ],
    home: FormBuilderDemo(),
  ));
}

final _formKey = GlobalKey<FormBuilderState>();

// Form
class FormBuilderDemo extends StatefulWidget {
  const FormBuilderDemo({Key? key}) : super(key: key);

  @override
  State<FormBuilderDemo> createState() => _FormBuilderDemoState();
}

class _FormBuilderDemoState extends State<FormBuilderDemo> {
  var genderOptions = ['Male', 'Female', 'Other'];

  void _onChanged(dynamic val) => log(val.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Builder'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  children: <Widget>[
                    FormBuilderCheckbox(
                      name: 'checkbox',
                      decoration: const InputDecoration(
                        labelText: 'Чекбокс',
                      ),
                      title: const Text('Простой чекбокс')
                    ),

                    FormBuilderCheckboxGroup(
                      name: 'checkbox_group',
                      decoration: const InputDecoration(
                        labelText: 'Группа чекбоксов',
                      ),
                      options: const[
                        FormBuilderFieldOption(value: 'v_1', child: Text('Value 1')),
                        FormBuilderFieldOption(value: 'v_2', child: Text('Value 2')),
                        FormBuilderFieldOption(value: 'v_3', child: Text('Value 3')),
                      ],
                    ),

                    // FormBuilderChoiceChip(
                    //   name: 'choice_chip',
                    //   decoration: const InputDecoration(
                    //     labelText: 'Чипы',
                    //   ),
                    //   options: const [
                    //     FormBuilderFieldOption(value: 'Test', child: Text('Test')),
                    //     FormBuilderFieldOption(value: 'Test 1', child: Text('Test 1')),
                    //   ],
                    // ),

                    // FormBuilderDateRangePicker(
                    //   name: 'date_range',
                    //   firstDate: DateTime(1970),
                    //   lastDate: DateTime(2030),
                    //   format: DateFormat('yyyy-MM-dd'),
                    //   onChanged: _onChanged,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Пикер даты',
                    //   ),
                    // ),

                    // FormBuilderDateTimePicker(
                    //   name: 'date',
                    //   onChanged: _onChanged,
                    //   inputType: InputType.time,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Пикер времени',
                    //   ),
                    //   initialTime: const TimeOfDay(hour: 8, minute: 0),
                    //   initialValue: DateTime.now(),
                    // ),

                    // FormBuilderDropdown(
                    //   name: 'gender',
                    //   decoration: const InputDecoration(
                    //     labelText: 'Меню',
                    //   ),
                    //   // initialValue: 'Male',
                    //   allowClear: true,
                    //   hint: const Text('Выбрать значение'),
                    //   validator: FormBuilderValidators.compose([
                    //     FormBuilderValidators.required()
                    //   ]),
                    //   items: genderOptions
                    //     .map((gender) => DropdownMenuItem(value: gender,child: Text(gender.toString()),))
                    //     .toList(),
                    // ),

                    // FormBuilderFilterChip(
                    //   name: 'chips',
                    //   // backgroundColor: Colors.green,
                    //   // selectedColor: Colors.yellow,
                    //   // checkmarkColor: Colors.red,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Чип с индикатором',
                    //   ),
                    //   options: const [
                    //     FormBuilderFieldOption(value: 'Test', child: Text('Test')),
                    //     FormBuilderFieldOption(value: 'Test 1', child: Text('Test 1')),
                    //   ],
                    // ),

                    // FormBuilderRadioGroup(
                    //   name: 'radio',
                    //   decoration: const InputDecoration(
                    //     labelText: 'Радио кнопки',
                    //   ),
                    //   options: const [
                    //     FormBuilderFieldOption(value: 'Test', child: Text('Test')),
                    //     FormBuilderFieldOption(value: 'Test 1', child: Text('Test 1')),
                    //   ],
                    // ),

                    // FormBuilderRangeSlider(
                    //   decoration: const InputDecoration(
                    //     labelText: 'Диапазон значений',
                    //   ),
                    //   name: 'range',
                    //   initialValue: const RangeValues(0.2, 10),
                    //   min: 0,
                    //   max: 10,
                    // ),

                    // FormBuilderSegmentedControl(
                    //   name: 'segment',
                    //   initialValue: 'Test',
                    //   decoration: const InputDecoration(
                    //     labelText: 'Сегмент пикер',
                    //   ),
                    //   options: const [
                    //     FormBuilderFieldOption(value: 'Test', child: Text('Test')),
                    //     FormBuilderFieldOption(value: 'Test 1', child: Text('Test 1')),
                    //     FormBuilderFieldOption(value: 'Test 2', child: Text('Test 2')),
                    //     FormBuilderFieldOption(value: 'Test 3', child: Text('Test 3')),
                    //   ],
                    // ),

                    // FormBuilderSlider(
                    //   name: 'slider',
                    //   validator: FormBuilderValidators.compose([
                    //     FormBuilderValidators.min(6),
                    //   ]),
                    //   onChanged: _onChanged,
                    //   min: 0.0,
                    //   max: 10.0,
                    //   initialValue: 7.0,
                    //   divisions: 20,
                    //   activeColor: Colors.red,
                    //   inactiveColor: Colors.pink[100],
                    //   decoration: const InputDecoration(
                    //     labelText: 'Слайдер',
                    //   ),
                    // ),

                    // FormBuilderSwitch(
                    //   name: 'switch',
                    //   initialValue: false,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Переключатель',
                    //   ),
                    //   title: const Text('Вкл/Выкл'),
                    // ),

                    // FormBuilderTextField(
                    //   name: 'text',
                    //   decoration: const InputDecoration(
                    //     labelText: 'Поле ввода',
                    //   ),
                    //   validator: FormBuilderValidators.compose([
                    //     FormBuilderValidators.required(),
                    //     FormBuilderValidators.email(),
                    //   ]),
                    // ),

                    // FormBuilderSearchableDropdown<String>(
                    //   name: 'searchable_dropdown_online',
                    //   // items: allCountries,
                    //   onChanged: _onChanged,
                    //   showSearchBox: true,
                    //   isFilteredOnline: true,
                    //   compareFn: (item, selectedItem) =>
                    //       item!.toLowerCase() == selectedItem!.toLowerCase(),
                    //   onFind: (text) async {
                    //     await Future.delayed(const Duration(seconds: 1));
                    //     return allCountries
                    //         .where((element) =>
                    //             element.toLowerCase().contains(text!.toLowerCase()))
                    //         .toList();
                    //   },
                    //   decoration: const InputDecoration(
                    //       labelText: 'Searchable Dropdown Online'),
                    // ),

                    // FormBuilderColorPickerField(
                    //   name: 'color_picker',
                    //   initialValue: Colors.yellow,
                    //   // readOnly: true,
                    //   colorPickerType: ColorPickerType.materialPicker,
                    //   decoration: const InputDecoration(labelText: 'Пикер цвета'),
                    // ),

                    // FormBuilderCupertinoDateTimePicker(
                    //   name: 'date_time',
                    //   initialValue: DateTime.now(),
                    //   inputType: CupertinoDateTimePickerInputType.both,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Cupertino DateTime Picker',
                    //   ),
                    //   locale: const Locale.fromSubtags(languageCode: 'en_GB'),
                    // ),

                    // FormBuilderCupertinoDateTimePicker(
                    //   name: 'date',
                    //   initialValue: DateTime.now(),
                    //   inputType: CupertinoDateTimePickerInputType.date,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Cupertino DateTime Picker - Date Only',
                    //   ),
                    //   locale: const Locale.fromSubtags(languageCode: 'en_GB'),
                    // ),

                    // FormBuilderCupertinoDateTimePicker(
                    //   name: 'time',
                    //   initialValue: DateTime.now(),
                    //   inputType: CupertinoDateTimePickerInputType.time,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Cupertino DateTime Picker - Time Only',
                    //   ),
                    //   locale: const Locale.fromSubtags(languageCode: 'en_GB'),
                    // ),

                    // FormBuilderTouchSpin(
                    //   decoration: const InputDecoration(labelText: 'TouchSpin'),
                    //   name: 'touch_spin',
                    //   initialValue: 10,
                    //   step: 1,
                    //   iconSize: 48.0,
                    //   addIcon: const Icon(Icons.arrow_right),
                    //   subtractIcon: const Icon(Icons.arrow_left),
                    //   onChanged: _onChanged,
                    // ),

                    // FormBuilderRatingBar(
                    //   decoration: const InputDecoration(labelText: 'Rating Bar'),
                    //   name: 'rate',
                    //   // enabled: false,
                    //   itemSize: 32.0,
                    //   initialValue: 1.0,
                    //   maxRating: 5.0,
                    //   onChanged: _onChanged,
                    // ),

                    // FormBuilderSignaturePad(
                    //   decoration: const InputDecoration(
                    //     labelText: 'Signature Pad',
                    //   ),
                    //   name: 'signature',
                    //   border: Border.all(color: Colors.green),
                    //   onChanged: _onChanged,
                    // ),

                  
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      color: Theme.of(context).colorScheme.secondary,
                      child: const Text(
                        "Валидировать",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          log(_formKey.currentState!.value.toString());
                        } else {
                          log("validation failed");
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: MaterialButton(
                      color: Theme.of(context).colorScheme.secondary,
                      child: const Text(
                        "Сбросить форму",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

const allCountries = [
  'Azerbaijan',
  'Bermuda'
];