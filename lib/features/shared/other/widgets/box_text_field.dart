import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BoxTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obsecure;
  final bool readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final bool isMulti;
  final bool autofocus;
  final bool enabled;
  final String? errorText;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? prefixWdget;
  final String? hint;
  final List<TextInputFormatter> formatters;
  final EdgeInsets margin;

  const BoxTextField(
      {Key? key,
      this.controller,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.obsecure = false,
      this.onTap,
      this.hint,
      this.formatters = const [],
      this.isMulti = false,
      this.readOnly = false,
      this.autofocus = false,
      this.errorText,
      this.label,
      this.suffix,
      this.prefix,
      this.enabled = true,
      this.prefixWdget,
      this.onEditingCompleted,
      this.margin = const EdgeInsets.symmetric(vertical: 10),
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextFormField(
          onChanged: onChanged,
          onEditingComplete: onEditingCompleted,
          autofocus: autofocus,
          minLines: isMulti ? 4 : 1,
          maxLines: isMulti ? null : 1,
          onTap: onTap,
          enabled: enabled,
          readOnly: readOnly,
          obscureText: obsecure,
          keyboardType: keyboardType,
          controller: controller,
          inputFormatters: formatters,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.grey),
            errorText: errorText,
            prefixIcon: prefix,
            prefix: prefixWdget,
            hintText: hint,
            suffixIcon: suffix,
            labelText: label,
          ),
          validator: validator),
    );
  }
}
