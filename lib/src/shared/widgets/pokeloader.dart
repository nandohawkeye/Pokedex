import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PokeLoader extends StatelessWidget {
  const PokeLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 130,
            height: 130,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[400]!,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
              ),
            ),
          ),
          SizedBox(
            width: 123,
            height: 123,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[100]!,
              highlightColor: Colors.grey[200]!,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
              ),
            ),
          ),
          SizedBox(
            width: 128,
            height: 15,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[400]!,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[400]!,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
              ),
            ),
          ),
          SizedBox(
            width: 30,
            height: 30,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[100]!,
              highlightColor: Colors.grey[200]!,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
