import 'package:curie/common/utils/extensions.dart';
import 'package:curie/models/form_model.dart';
import 'package:flutter/material.dart';

class DynamicForm extends StatefulWidget {
  // final FormPageModel data;
  final List<FormPageModel> dataList;

  const DynamicForm({
    super.key,
    // required this.data,
    required this.dataList,
  });

  @override
  State<DynamicForm> createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int currentPage = 0;
  List<FormPageModel> formPages = [];

  Map<String, dynamic> formValues = {};

  @override
  void initState() {
    super.initState();
    formPages = widget.dataList;
  }

  @override
  Widget build(BuildContext context) {
    // final FormPageModel formData = widget.data;

    return Scaffold(
        appBar: AppBar(
          title: Text(formPages[currentPage].name ?? ""),
        ),
        body: formPages.isEmpty
            ? const Center(
                child: Text("No fields for this form page!"),
              )
            : _buildFormFields(formPages[currentPage].fields!),
        floatingActionButton: Row(
          children: [
            30.whitespaceWidth,
            currentPage > 0
                ? FloatingActionButton(
                    onPressed: () => setState(() {
                      currentPage--;
                    }),
                    child: const Icon(Icons.navigate_before),
                  )
                : const SizedBox.shrink(),
            const Spacer(),
            currentPage < formPages.length - 1
                ? FloatingActionButton(
                    onPressed: () => setState(() {
                      currentPage++;
                    }),
                    child: const Icon(Icons.navigate_next),
                  )
                : FloatingActionButton(
                    backgroundColor: Colors.green[200],
                    onPressed: () {},
                    child: const Icon(Icons.save),
                  ),
          ],
        )
        /* 
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: formData.fields!.map<Widget>((fieldData) {
                return _buildFormField(fieldData);
              }).toList(),
            ),
          ),
        ),
      ),
      */
        );
  }

  // using a switch case to create different widgets based on the input type
  Widget _buildFormField(Fields fieldData) {
    String inputType = fieldData.properties!.inputType;

    switch (inputType) {
      case 'text-name':
        return _buildTextFormField(fieldData);
      case 'date':
        return _buildDatePickerField(fieldData);
      case 'single-selection':
        return _buildRadioField(fieldData);
      default:
        return const SizedBox.shrink();
    }
  }

  // using ListView builder for dynamic page change
  Widget _buildFormFields(List<Fields> fields) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: fields.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _buildFormField(fields.elementAt(index));
        },
      ),
    );
  }

  // UI for the text field
  Widget _buildTextFormField(Fields fieldData) {
    final properties = fieldData.properties as InputTextFieldProperty;

    String fieldId = fieldData.fieldId ?? "Field Id";
    String title = properties.title;

    String subtitle = properties.subTitle ?? "Sub Title";
    int? maxLength = properties.maxLength;
    String errorText = properties.errorText ?? "Error!";

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          TextFormField(
            decoration: InputDecoration(
              hintText: subtitle,
            ),
            maxLength: maxLength,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return errorText;
              }
              return null;
            },
            onSaved: (value) {
              formValues[fieldId] = value;
            },
          ),
        ],
      ),
    );
  }

  // UI for the date picker
  Widget _buildDatePickerField(dynamic fieldData) {
    final properties = fieldData.properties as InputDatePickerProperty;

    String fieldId = fieldData.fieldId;
    String title = properties.title;
    String errorText = properties.errorText ?? "Error";
    String dateSelected = formValues[fieldId] ?? "YYYY/MM/DD";

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          TextFormField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: dateSelected,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return errorText;
              }

              return null;
            },
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                setState(() {
                  formValues[fieldId] = pickedDate.toString().split(" ")[0];
                });
              }
            },
          ),
        ],
      ),
    );
  }

  // Ui for single selection radio buttons
  Widget _buildRadioField(dynamic fieldData) {
    final properties = fieldData.properties as InputTypeSingleSelection;

    String fieldId = fieldData.fieldId;
    String title = properties.title;
    List<Selections> selections = properties.options;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Column(
            children: selections.map((Selections option) {
              return RadioListTile<String>(
                title: Text(option.name ?? "title"),
                value: option.name ?? "value",
                groupValue: formValues[fieldId],
                onChanged: (String? value) {
                  setState(() {
                    formValues[fieldId] = value;
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
