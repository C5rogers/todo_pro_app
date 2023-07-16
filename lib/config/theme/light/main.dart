import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app_pro/config/constants/ui.dart';
import 'package:todo_app_pro/config/theme/light/text.dart';

ThemeData mainLightTheme() => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Circular",
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: UiConstants.primaryColor,
        secondary: UiConstants.accentColor,
      ),
      textTheme: lightTextTheme,
      iconTheme: const IconThemeData(color: UiConstants.primaryColor, size: 20),
      disabledColor: UiConstants.grayAccent,
      switchTheme: SwitchThemeData(
        thumbColor: const MaterialStatePropertyAll(UiConstants.primaryColor),
        trackColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? UiConstants.primaryColor
              : Colors.blueGrey,
        ),
      ),
      radioTheme: const RadioThemeData(
          fillColor: MaterialStatePropertyAll(UiConstants.primaryColor),
          overlayColor: MaterialStatePropertyAll(Colors.blueGrey),
          splashRadius: 24),
      checkboxTheme: CheckboxThemeData(
        checkColor: const MaterialStatePropertyAll(Colors.white),
        fillColor: const MaterialStatePropertyAll(UiConstants.primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        splashRadius: 24,
        visualDensity: VisualDensity.compact,
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIconColor: Colors.blueGrey,
        suffixIconColor: Colors.blueGrey,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: UiConstants.accentColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: UiConstants.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: UiConstants.accentColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: lightTextTheme.labelSmall
            ?.copyWith(fontWeight: FontWeight.normal, color: Colors.blueGrey),
        hintStyle: lightTextTheme.labelSmall?.copyWith(
            color: Colors.blueGrey.withOpacity(.5),
            fontWeight: FontWeight.normal),
        floatingLabelStyle: lightTextTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.normal, fontStyle: FontStyle.normal),
        isDense: true,
        contentPadding: const EdgeInsets.all(15),
      ),
      snackBarTheme: SnackBarThemeData(
        actionTextColor: UiConstants.primaryColor,
        backgroundColor: UiConstants.primaryColor,
        contentTextStyle: lightTextTheme.labelMedium
            ?.copyWith(color: UiConstants.primaryColor),
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: true,
          statusBarColor:
              UiConstants.accentColor.withOpacity(0.6), // <-- SEE HERE
          statusBarIconBrightness:
              Brightness.light, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness:
              Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        backgroundColor: Colors.white,
        titleTextStyle: lightTextTheme.bodyLarge?.copyWith(color: Colors.white),
        iconTheme: const IconThemeData(
          size: 20,
          color: Colors.white,
        ),
        actionsIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
        elevation: 0.2,
        centerTitle: true,
      ),
      dividerColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedIconTheme: const IconThemeData(
            color: UiConstants.primaryColor, size: 24, fill: 1),
        selectedLabelStyle: lightTextTheme.labelSmall
            ?.copyWith(color: UiConstants.primaryColor),
        unselectedIconTheme: const IconThemeData(
          color: Colors.blueGrey,
          size: 24,
        ),
        selectedItemColor: UiConstants.primaryColor,
        unselectedItemColor: Colors.blueGrey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedLabelStyle:
            lightTextTheme.labelSmall?.copyWith(color: Colors.blueGrey),
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        childrenPadding: EdgeInsets.symmetric(horizontal: 20),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        elevation: 0,
        modalBackgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
      ),
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        indicatorColor: const Color(0xffECF3FF),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        unselectedLabelStyle:
            lightTextTheme.labelMedium?.copyWith(color: Colors.blueGrey),
        labelStyle: lightTextTheme.labelMedium?.copyWith(color: Colors.white),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: UiConstants.accentColor,
        iconTheme: const IconThemeData(
          color: UiConstants.primaryColor,
          size: 20,
        ),
        labelStyle: lightTextTheme.labelSmall,
        deleteIconColor: UiConstants.primaryColor,
        disabledColor: Colors.grey,
        showCheckmark: true,
        side: const BorderSide(color: UiConstants.primaryColor),
        labelPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      ),
      badgeTheme: const BadgeThemeData(
        backgroundColor: Colors.red,
      ),
    );
