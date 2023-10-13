import 'package:flutter/material.dart';
import 'package:get/get.dart';

Scaffold defaultLayoutScaffold({appBar, body, bottomNavigationBar}) => Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height - kBottomNavigationBarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: body,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );

TextButton secondaryBtn({func, label}) => TextButton(
      onPressed: func,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: ThemeData().primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: ThemeData().primaryColor,
          ),
        ),
      ),
    );

TextButton primaryBtn({func, label}) => TextButton(
      onPressed: func,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: ThemeData().primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(25),
          color: ThemeData().primaryColor,
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );

TextButton submitBtn({formKey, func, label}) => TextButton(
      child: Container(
        width: Get.width * 0.6,
        decoration: BoxDecoration(
          color: ThemeData().primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          func();
        }
      },
    );

TextButton linkBtn({func, label}) => TextButton(
      onPressed: func,
      child: Text(
        label,
        style: const TextStyle(
          decoration: TextDecoration.underline,
          color: Colors.black,
        ),
      ),
    );

AppBar appBar({title, action = const SizedBox(width: 60)}) => AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.chevron_left_rounded,
          size: 30,
        ),
        onPressed: () => Get.back(),
      ),
      title: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      actions: [action],
    );

InputDecoration inputDecoration({hintText, label, icon, suffixIcon}) =>
    InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      hintText: hintText,
      label: Text(label),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeData().primaryColor, width: 2.0),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      hintStyle: const TextStyle(fontSize: 14),
      labelStyle: const TextStyle(fontSize: 14),
      prefixIcon: Icon(icon),
      suffixIcon: suffixIcon,
    );
