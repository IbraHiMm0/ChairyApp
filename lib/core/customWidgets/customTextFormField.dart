import 'package:chairy_app/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {

  final String? hintText;
  final Function(String)? onChanged;
  final Icon? prefixIcon;
  final double width;
  final IconButton? suffix;
  final bool? obscureText;
  final Color? backgroundColor;
  final Color? hintColor;
  final Color? textColor;
  final int? numForm;
  final String? Function(String?)? valid;
  final TextEditingController? controller;
  final TextInputType keyboardType;


  CustomTextFormField({super.key,
    this.hintText,
    required this.width,
    this.numForm,
    this.valid,
    this.controller,
    this.onChanged,
    this.suffix,
    this.prefixIcon,
    required this.keyboardType,
    this.obscureText = false,
    this.backgroundColor,
    this.hintColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width),
          child: Container(
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(32.r),
                ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Builder(
                builder: (context) {
                  final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

                  return TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(numForm),
                    ],
                    keyboardType: keyboardType,
                    controller: controller,
                    obscureText: obscureText!,
                    validator: valid,
                    cursorColor: ColorManager.primary,
                    style:  TextStyle(
                      fontFamily: 'Montserrat',
                      color: textColor,
                      fontSize: 16,
                    ),
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      prefixIcon: prefixIcon,
                      hintText: hintText,
                      hintStyle:  TextStyle(
                        color: hintColor,
                        fontSize: 16,
                      ),
                      prefixText: '    ',
                      enabledBorder:  UnderlineInputBorder(borderSide: BorderSide(strokeAlign: 1,color:isDarkMode? ColorManager.white:ColorManager.backgroundDark,
                      ),),
                      focusedBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(strokeAlign: 1,color: ColorManager.redAccent,),
                      ),
                      suffixIcon: suffix,
                    ),
                  );
                }
              ),
            ),
          ),
        ),
      ],
    );
  }
}
