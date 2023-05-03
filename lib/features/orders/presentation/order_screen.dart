import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderScreen extends HookWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var addressController = useTextEditingController();
    var numberController = useTextEditingController();

    return Scaffold(
      body: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
            ),
          ),
          const SizedBox(height: AppDimensions.defaultSize),
          Container(
            height: context.height * .5,
            width: context.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.mediumSize),
            ),
            padding: const EdgeInsets.all(AppDimensions.defaultSize),
            child: Column(
              children: [
                FilledTextField(
                  controller: addressController,
                  hintText: '10th Avenue, Lekki State, Lagos',
                  label: 'Delivery address',
                ),
                const SizedBox(
                  height: AppDimensions.mediumSize,
                ),
                FilledTextField(
                  controller: numberController,
                  hintText: '0901238293838',
                  label: 'Number we can call',
                ),
                const SizedBox(
                  height: AppDimensions.mediumSize,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Confirm Order'),
                ),
              ],
            ),
          ).expand(),
        ],
      ),
    );
  }
}

class FilledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;

  const FilledTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.titleMedium,
        ),
        const SizedBox(
          height: AppDimensions.defaultSize,
        ),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                AppDimensions.defaultSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
