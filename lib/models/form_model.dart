class FormPageModel {
  String? name;
  String? sectionId;
  String? status;
  String? version;
  Properties? properties;
  List<Fields>? fields;
  int? typeOfDataRequired;
  int? requestExpectedStatus;

  FormPageModel(
      {this.name,
      this.sectionId,
      this.status,
      this.version,
      this.properties,
      this.fields,
      this.typeOfDataRequired,
      this.requestExpectedStatus});

  FormPageModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sectionId = json['sectionId'];
    status = json['status'];
    version = json['version'];
    properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
    if (json['fields'] != null) {
      fields = <Fields>[];
      json['fields'].forEach((v) {
        fields!.add(Fields.fromJson(v));
      });
    }
    typeOfDataRequired = json['typeOfDataRequired'];
    requestExpectedStatus = json['requestExpectedStatus'];
  }
}

class Properties {
  String? headerIconUrl;
  String? headerSubtitle;
  String? headerTitle;

  Properties({this.headerIconUrl, this.headerSubtitle, this.headerTitle});

  Properties.fromJson(Map<String, dynamic> json) {
    headerIconUrl = json['headerIconUrl'];
    headerSubtitle = json['headerSubtitle'];
    headerTitle = json['headerTitle'];
  }
}

class Fields {
  String? name;
  String? fieldId;
  String? status;
  String? value;
  FieldPropertiesNew? properties;
  String? version;

  Fields(
      {this.name,
      this.fieldId,
      this.status,
      this.value,
      this.properties,
      this.version});

  Fields.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fieldId = json['fieldId'];
    status = json['status'];
    value = json['value'];
    String inputType = json['properties']['inputType'];
    switch (inputType) {
      case 'text-name':
        properties = InputTextFieldProperty.fromJson(json['properties']);

        break;
      case 'date':
        properties = InputDatePickerProperty.fromJson(json['properties']);
        break;
      case 'single-selection':
        properties = InputTypeSingleSelection.fromJson(json['properties']);
        break;
      default:
        throw Exception('Unknown input type: $inputType');
    }
    version = json['version'];
  }
}

class Selections {
  String? name;
  String? iconUrl;
  Null selectionModule;
  Null fields;
  String? title;
  Null subtitle;
  Null ctaText;
  Null suggestionTextStartIconUrl;
  Null suggestionText;
  Null deeplink;
  Null additionalData;

  Selections(
      {this.name,
      this.iconUrl,
      this.selectionModule,
      this.fields,
      this.title,
      this.subtitle,
      this.ctaText,
      this.suggestionTextStartIconUrl,
      this.suggestionText,
      this.deeplink,
      this.additionalData});

  Selections.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iconUrl = json['iconUrl'];
    selectionModule = json['selectionModule'];
    fields = json['fields'];
    title = json['title'];
    subtitle = json['subtitle'];
    ctaText = json['ctaText'];
    suggestionTextStartIconUrl = json['suggestionTextStartIconUrl'];
    suggestionText = json['suggestionText'];
    deeplink = json['deeplink'];
    additionalData = json['additionalData'];
  }
}

abstract class FieldPropertiesNew {
  final String? errorText;
  final String title;
  final bool isEditable;
  final String inputType;

  FieldPropertiesNew({
    required this.errorText,
    required this.title,
    required this.isEditable,
    required this.inputType,
  });
}

class InputTextFieldProperty extends FieldPropertiesNew {
  final int? maxLength;
  final int? minLength;
  final String? hint;
  final String? subTitle;

  InputTextFieldProperty({
    required super.errorText,
    required super.title,
    required super.isEditable,
    required super.inputType,
    this.subTitle,
    this.maxLength,
    this.minLength,
    this.hint,
  });

  factory InputTextFieldProperty.fromJson(Map<String, dynamic> json) {
    return InputTextFieldProperty(
      subTitle: json['subtitle'],
      errorText: json['errorText'],
      title: json['title'],
      isEditable: json['isEditable'],
      inputType: json['inputType'],
      maxLength: json['maxLength'],
      minLength: json['minLength'],
      hint: json['hint'],
    );
  }
}

class InputDatePickerProperty extends FieldPropertiesNew {
  final String hintText;

  InputDatePickerProperty({
    required super.errorText,
    required super.title,
    required super.isEditable,
    required super.inputType,
    required this.hintText,
  });

  factory InputDatePickerProperty.fromJson(Map<String, dynamic> json) {
    return InputDatePickerProperty(
      errorText: json['errorText'],
      title: json['title'],
      isEditable: json['isEditable'],
      inputType: json['inputType'],
      hintText: json['hint'],
    );
  }
}

class InputTypeSingleSelection extends FieldPropertiesNew {
  List<Selections> options;

  InputTypeSingleSelection({
    super.errorText,
    required super.title,
    required super.isEditable,
    required super.inputType,
    required this.options,
  });

  factory InputTypeSingleSelection.fromJson(Map<String, dynamic> json) {
    var options = (json['selections'] as List)
        .map((selection) => Selections.fromJson(selection))
        .toList();

    return InputTypeSingleSelection(
      errorText: json['errorText'],
      title: json['title'],
      isEditable: json['isEditable'],
      inputType: json['inputType'],
      options: options,
    );
  }
}
