import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import 'app_profile.dart';
import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Overview(),
    );
  }
}

class Overview extends StatelessWidget {
  Overview({Key key}) : super(key: key);

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flutter FormBuilder 😎')),
        body: FormBuilder(
          key: _fbKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //* ----------------------------------------------------
                //* Input widgets
                //* ----------------------------------------------------
                //_buildCheckboxWidgets(),
                //_buildChipsWidgets(),
                //_buildPickerWidgets(),
                //_buildSliderWidgets(),
                _buildRadioDropdownAndSwitchWidgets(),
                //_buildTextInputWidgets(context),
                //_buildOtherWidgets(),
                //* ----------------------------------------------------
                //* Form buttons
                //* ----------------------------------------------------
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        child: Text('Submit'),
                        onPressed: () {
                          if (_fbKey.currentState.saveAndValidate()) {
                            final formInputs = _fbKey.currentState.value;
                            print(formInputs);
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: Text("Form inputs"),
                                      content: Text("$formInputs"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('Close'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    ));
                          }
                        },
                      ),
                      RaisedButton(
                        child: Text('Reset'),
                        onPressed: () {
                          _fbKey.currentState.reset();
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildCheckboxWidgets() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //* ----------------------------------------------------
              //* SINGLE CHECKBOX
              //* ----------------------------------------------------
              Text('Single Checkbox',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              FormBuilderCheckbox(
                attribute: 'checkbox',
                label: Text('Accept conditions & terms'),
              ),
              SizedBox(height: 20),
              //* ----------------------------------------------------
              //* CHECKBOX LIST
              //* ----------------------------------------------------
              Text('Checkbox List',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              FormBuilderCheckboxList(
                decoration: InputDecoration(
                    labelText: "What do you think about this video?"),
                attribute: 'checkbox_list',
                options: [
                  FormBuilderFieldOption(value: "Awesome"),
                  FormBuilderFieldOption(value: "Great"),
                  FormBuilderFieldOption(value: "Wonderful"),
                ],
              ),
              SizedBox(height: 20),
              //* ----------------------------------------------------
              //* CHECKBOX GROUP
              //* ----------------------------------------------------
              Text('Checkbox Group',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              FormBuilderCheckboxGroup(
                attribute: 'checkboxGroup',
                decoration: InputDecoration(
                    labelText: "What will you do after watching?"),
                options: [
                  FormBuilderFieldOption(value: "Like"),
                  FormBuilderFieldOption(value: "Share"),
                  FormBuilderFieldOption(value: "Subscribe"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChipsWidgets() {
    const mockResults = <AppProfile>[
      AppProfile('John Doe', 'jdoe@flutter.io',
          'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX4057996.jpg'),
      AppProfile('Paul', 'paul@google.com',
          'https://mbtskoudsalg.com/images/person-stock-image-png.png'),
      AppProfile('Fred', 'fred@google.com',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Brian', 'brian@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('John', 'john@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Thomas', 'thomas@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Nelly', 'nelly@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Marie', 'marie@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Charlie', 'charlie@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Diana', 'diana@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Ernie', 'ernie@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Gina', 'fred@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
    ];

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //* ----------------------------------------------------
              //* CHOICE CHIP
              //* ----------------------------------------------------
              Text('Choice Chip',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              FormBuilderChoiceChip(
                spacing: 4,
                alignment: WrapAlignment.spaceEvenly,
                attribute: "choice_chip",
                decoration: InputDecoration(
                    labelText: "What is your favorite ice cream?",
                    labelStyle: TextStyle(color: Colors.black)),
                options: [
                  FormBuilderFieldOption(
                      child: Text("Vanilla"), value: "vanilla"),
                  FormBuilderFieldOption(
                      child: Text("Chocolate"), value: "chocolate"),
                  FormBuilderFieldOption(
                      child: Text("Strawberry"), value: "strawberry"),
                  FormBuilderFieldOption(child: Text("Peach"), value: "peach"),
                ],
              ),
              SizedBox(height: 20),
              //* ----------------------------------------------------
              //* FILTER CHIP
              //* ----------------------------------------------------
              Text('Filter Chip',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              FormBuilderFilterChip(
                spacing: 4,
                alignment: WrapAlignment.spaceEvenly,
                attribute: "filter_chip",
                decoration: InputDecoration(
                    labelText:
                        "In which kind of animals are you interested in?",
                    labelStyle: TextStyle(color: Colors.black)),
                options: [
                  FormBuilderFieldOption(child: Text("Cats"), value: "cats"),
                  FormBuilderFieldOption(child: Text("Dogs"), value: "dogs"),
                  FormBuilderFieldOption(child: Text("Birds"), value: "birds"),
                ],
              ),
              SizedBox(height: 20),
              //* ----------------------------------------------------
              //* CHIPS INPUT
              //* ----------------------------------------------------
              Text('Chips Input',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              FormBuilderChipsInput(
                attribute: 'chips_input',
                decoration: InputDecoration(
                    labelText: "Select people",
                    labelStyle: TextStyle(color: Colors.black)),
                chipBuilder: (context, state, profile) {
                  return InputChip(
                    key: ObjectKey(profile),
                    label: Text(profile.name),
                    avatar: CircleAvatar(
                      backgroundImage: NetworkImage(profile.imageUrl),
                    ),
                    onDeleted: () => state.deleteChip(profile),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  );
                },
                suggestionBuilder: (context, state, profile) {
                  return ListTile(
                    key: ObjectKey(profile),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(profile.imageUrl),
                    ),
                    title: Text(profile.name),
                    subtitle: Text(profile.email),
                    onTap: () => state.selectSuggestion(profile),
                  );
                },
                findSuggestions: (String query) {
                  // print("Query: '$query'");
                  if (query.length != 0) {
                    var lowercaseQuery = query.toLowerCase();
                    return mockResults.where((profile) {
                      return profile.name
                              .toLowerCase()
                              .contains(query.toLowerCase()) ||
                          profile.email
                              .toLowerCase()
                              .contains(query.toLowerCase());
                    }).toList(growable: false)
                      ..sort((a, b) => a.name
                          .toLowerCase()
                          .indexOf(lowercaseQuery)
                          .compareTo(
                              b.name.toLowerCase().indexOf(lowercaseQuery)));
                  }
                  return <AppProfile>[];
                  //return mockResults;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPickerWidgets() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //* ----------------------------------------------------
              //* COLOR PICKER
              //* ----------------------------------------------------
              Text('Color Picker',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              FormBuilderColorPicker(
                attribute: 'color_picker',
                //* Default color picker type
                colorPickerType: ColorPickerType.ColorPicker,
              ),
              SizedBox(height: 20),
              //* ----------------------------------------------------
              //* COUNTRY PICKER
              //* ----------------------------------------------------
              Text('Country Picker',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              FormBuilderCountryPicker(
                attribute: 'country_picker',
                initialValue: 'Germany',
              ),
              SizedBox(height: 20),
              //* ----------------------------------------------------
              //* DATETIME PICKER
              //* ----------------------------------------------------
              Text('Datetime Picker',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              FormBuilderDateTimePicker(attribute: 'datetime_picker'),
              SizedBox(height: 20),
              //* ----------------------------------------------------
              //* DATE RANGE PICKER
              //* ----------------------------------------------------
              Text('Date Range Picker',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              FormBuilderDateRangePicker(
                attribute: 'daterange_picker',
                firstDate: DateTime.now().subtract(Duration(days: 356)),
                lastDate: DateTime.now().add(Duration(days: 365)),
                format: DateFormat('yyyy-MM-dd'),
              ),
              SizedBox(height: 20),
              //* ----------------------------------------------------
              //* IMAGE PICKER
              //* ----------------------------------------------------
              Text('Image Picker',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              FormBuilderImagePicker(attribute: 'image_picker'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliderWidgets() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            //* ----------------------------------------------------
            //* SLIDER
            //* ----------------------------------------------------
            Text('Slider', style: TextStyle(fontSize: 20, color: Colors.black)),
            FormBuilderSlider(
              attribute: 'slider',
              min: 0,
              max: 100,
              initialValue: 0,
            ),
            SizedBox(height: 20),
            //* ----------------------------------------------------
            //* RANGE SLIDER
            //* ----------------------------------------------------
            Text('Range Slider',
                style: TextStyle(fontSize: 20, color: Colors.black)),
            FormBuilderRangeSlider(
              attribute: 'range_slider',
              min: 0.0,
              max: 100.0,
              initialValue: RangeValues(0.0, 100.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioDropdownAndSwitchWidgets() {
    var options = ["Option 1", "Option 2", "Option 3"];

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //* ----------------------------------------------------
              //* RADIO
              //* ----------------------------------------------------
              Text('Radio',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              FormBuilderRadio(
                decoration: InputDecoration(labelText: 'Your feedback:'),
                validators: [FormBuilderValidators.required()],
                attribute: 'radio',
                options: [
                  FormBuilderFieldOption(value: 'Awesome'),
                  FormBuilderFieldOption(value: 'Good'),
                  FormBuilderFieldOption(value: 'Bad'),
                ],
              ),
              SizedBox(height: 20),
              FormBuilderTextField(
                attribute: 'reason',
                decoration: InputDecoration(labelText: 'If bad, why?'),
                validators: [
                  (val) {
                    if (_fbKey.currentState.fields['radio'].currentState
                                .value ==
                            'Bad' &&
                        (val == null || val.toString().isEmpty)) {
                      return 'Please tell us why it\'s bad';
                    }
                  }
                ],
              ),
              FormBuilderCustomField(
                attribute: 'mycustomfield',
                formField: FormField(builder: (FormFieldState<dynamic> field) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      labelText: "Select option",
                      contentPadding: EdgeInsets.only(top: 10.0, bottom: 0.0),
                      border: InputBorder.none,
                      errorText: field.errorText,
                    ),
                    child: Container(
                      height: 200,
                      child: CupertinoPicker(
                        itemExtent: 30,
                        children: options.map((c) => Text(c)).toList(),
                        onSelectedItemChanged: (index) {
                          field.didChange(options[index]);
                        },
                      ),
                    ),
                  );
                }),
              ),

              //* ----------------------------------------------------
              //* RADIO GROUP
              //* ----------------------------------------------------
              // Text('Radio Group',
              //     style: TextStyle(fontSize: 20, color: Colors.black)),
              // FormBuilderRadioGroup(
              //   attribute: 'radio_group',
              //   options: [
              //     FormBuilderFieldOption(value: 'Option A'),
              //     FormBuilderFieldOption(value: 'Option B'),
              //     FormBuilderFieldOption(value: 'Option C'),
              //   ],
              // ),
              // SizedBox(height: 20),
              //* ----------------------------------------------------
              //* DROPDOWN
              //* ----------------------------------------------------
              // Text('Dropdown',
              //     style: TextStyle(fontSize: 20, color: Colors.black)),
              // FormBuilderDropdown(
              //   hint: Text('Select Gender'),
              //   attribute: 'dropdown',
              //   items: ['Male', 'Female', 'Other']
              //       .map((gender) =>
              //           DropdownMenuItem(value: gender, child: Text("$gender")))
              //       .toList(),
              // ),
              // SizedBox(height: 20),
              //* ----------------------------------------------------
              //* SWITCH
              //* ----------------------------------------------------
              // Text('Switch',
              //     style: TextStyle(fontSize: 20, color: Colors.black)),
              // FormBuilderSwitch(attribute: 'switch', label: Text('On or off')),
              // SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextInputWidgets(context) {
    final TextEditingController _typeAheadController = TextEditingController();
    String _selectedCity;
    String _emailPattern =
        r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Text Input',
                style: TextStyle(fontSize: 20, color: Colors.black)),
            //* ----------------------------------------------------
            //* TEXT INPUT
            //* ----------------------------------------------------
            FormBuilderTextField(
              maxLines: 1,
              obscureText: false,
              attribute: 'textfield',
              readOnly: false,
              validators: [
                //* General
                // FormBuilderValidators.required(),
                //* Numeric
                // FormBuilderValidators.numeric(),
                // FormBuilderValidators.min(0),
                // FormBuilderValidators.max(100),
                //* Strings
                // FormBuilderValidators.minLength(10),
                // FormBuilderValidators.maxLength(15),
                // FormBuilderValidators.pattern(_emailPattern),
                // FormBuilderValidators.email(),
                // FormBuilderValidators.url(),
                //FormBuilderValidators.IP(),
                // FormBuilderValidators.creditCard(),
                // 4137868152556047 16-digits
                //* Date
                // FormBuilderValidators.date(),
                //* Boolean
                //FormBuilderValidators.requiredTrue(),
                //* Custom validator
                // (val) {
                //   if (val.toLowerCase() != "yes")
                //     return "The answer must be Yes";
                // }
              ],
            ),
            SizedBox(height: 20),
            Text('Phone Field',
                style: TextStyle(fontSize: 20, color: Colors.black)),
            //* ----------------------------------------------------
            //* PHONE FIELD
            //* ----------------------------------------------------
            FormBuilderPhoneField(attribute: 'phone'),
            SizedBox(height: 20),
            Text('Type Ahead',
                style: TextStyle(fontSize: 20, color: Colors.black)),
            //* ----------------------------------------------------
            //* TYPE AHEAD
            //* ----------------------------------------------------
            FormBuilderTypeAhead(
              attribute: 'type_ahead',
              textFieldConfiguration: TextFieldConfiguration(
                  controller: _typeAheadController,
                  decoration: InputDecoration(labelText: 'City')),
              suggestionsCallback: (pattern) {
                return CitiesService.getSuggestions(pattern);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              onSuggestionSelected: (suggestion) {
                _typeAheadController.text = suggestion;
              },
              onSaved: (value) => _selectedCity = value,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtherWidgets() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Touch Spin',
                style: TextStyle(fontSize: 20, color: Colors.black)),
            //* ----------------------------------------------------
            //* Touch Spin
            //* ----------------------------------------------------
            FormBuilderTouchSpin(
              attribute: 'touch_spin',
              initialValue: 10,
              step: 1,
            ),
            SizedBox(height: 20),
            Text('Rate', style: TextStyle(fontSize: 20, color: Colors.black)),
            //* ----------------------------------------------------
            //* Rate
            //* ----------------------------------------------------
            FormBuilderRate(attribute: 'rate'),
            SizedBox(height: 20),
            Text('Segmented Control',
                style: TextStyle(fontSize: 20, color: Colors.black)),
            //* ----------------------------------------------------
            //* Segmented Control
            //* ----------------------------------------------------
            FormBuilderSegmentedControl(
              attribute: 'segmented_control',
              options: List.generate(5, (i) => i + 1)
                  .map((number) => FormBuilderFieldOption(value: number))
                  .toList(),
            ),
            SizedBox(height: 20),
            Text('Signature Pad',
                style: TextStyle(fontSize: 20, color: Colors.black)),
            //* ----------------------------------------------------
            //* Signature Pad
            //* ----------------------------------------------------
            FormBuilderSignaturePad(attribute: 'signature_pad'),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  //   Widget _nextBuildMethod() {
  //   return Container(
  //     color: Colors.white,
  //     child: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         children: <Widget>[
  //           Text('Name', style: TextStyle(fontSize: 20, color: Colors.black)),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
