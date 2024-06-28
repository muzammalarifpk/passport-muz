import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../common/base_scaffold.dart';
import '../common/styles.dart';
import '../common/values.dart';
import '../common/widgets.dart';

class MainComponents extends StatefulWidget {
  const MainComponents({super.key});

  @override
  State<MainComponents> createState() => _MainComponentsState();
}

class _MainComponentsState extends State<MainComponents> {
  final TextEditingController sampleController = TextEditingController();

  bool isChecked = false;
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppLogo(),
              PPValues.mediumSpacing,
              Text('Standard Components', style: PPStyle.titleStyle),
              PPValues.largeSpacing,

              // // Text Field
              // InputField(
              //   label: 'Sample Input',
              //   textController: sampleController,
              //   hintText: 'Enter text here',
              //   validator: requiredValidator, registerField: (GlobalKey<FormFieldState<dynamic>> ) {  },
              // ),
              // PPValues.mediumSpacing,

              // Primary Button
              PrimaryButton(
                text: 'Primary Button',
                onPressed: () {
                  if (kDebugMode) {
                    print('Primary Button Pressed');
                  }
                },
              ),
              PPValues.mediumSpacing,

              // Text Link
              TextLink(
                textLabel: 'This is a text link',
                onTap: () {
                  if (kDebugMode) {
                    print('Text Link Pressed');
                  }
                },
                style: PPStyle.textLinkStyle,
              ),
              PPValues.mediumSpacing,

              // Checkbox
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  const Text('Checkbox'),
                ],
              ),
              PPValues.mediumSpacing,

              // Switch
              Row(
                children: [
                  Switch(
                    value: isSwitchOn,
                    onChanged: (bool value) {
                      setState(() {
                        isSwitchOn = value;
                      });
                    },
                  ),
                  const Text('Switch'),
                ],
              ),
              PPValues.mediumSpacing,

              // Dropdown
              DropdownButton<String>(
                value: 'Option 1',
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      // Handle change
                    });
                  }
                },
                items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              PPValues.mediumSpacing,

              // Radio Buttons
              Column(
                children: [
                  ListTile(
                    title: const Text('Radio 1'),
                    leading: Radio<String>(
                      value: 'Radio 1',
                      groupValue: 'Radio 1',
                      onChanged: (String? value) {
                        setState(() {
                          // Handle change
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Radio 2'),
                    leading: Radio<String>(
                      value: 'Radio 2',
                      groupValue: 'Radio 1',
                      onChanged: (String? value) {
                        setState(() {
                          // Handle change
                        });
                      },
                    ),
                  ),
                ],
              ),
              PPValues.mediumSpacing,

              // Slider
              Column(
                children: [
                  const Text('Slider'),
                  Slider(
                    value: 50,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: '50',
                    onChanged: (double value) {
                      setState(() {
                        // Handle change
                      });
                    },
                  ),
                ],
              ),
              PPValues.mediumSpacing,

              // Icon
              const Icon(Icons.star, size: 50, color: Colors.amber),
              PPValues.mediumSpacing,

              // Progress Indicator
              const CircularProgressIndicator(),
              PPValues.mediumSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
