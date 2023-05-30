import 'package:dnd_app/values/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BestiaryLoading extends StatefulWidget {
  const BestiaryLoading({Key? key}) : super(key: key);

  @override
  State<BestiaryLoading> createState() => _BestiaryLoadingState();
}

class _BestiaryLoadingState extends State<BestiaryLoading> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              _listItem(),
              const SizedBox(height: AppDimensions.marginDefault)
            ],
          );
        },
        itemCount: 15,
        shrinkWrap: true,
      ),
    );
  }

  Widget _listItem() {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFDEE2E6),
      highlightColor: const Color(0xFFF8F9FA),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        margin:
            const EdgeInsets.symmetric(horizontal: AppDimensions.marginDefault),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.radiusDefault),
          ),
        ),
      ),
    );
  }
}
