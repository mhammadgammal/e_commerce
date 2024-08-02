import 'package:e_commerce/core/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/screen_utils.dart';

class HomeBodyLoading extends StatelessWidget {
  const HomeBodyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        const SizedBox(
          height: 15.0,
        ),
        SizedBox(
          height: 300.0,
          child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ShimmerLoading(
                  width: ScreenUtils.getScreenWidth(context) * 0.9,
                  height: 100.0,
                );
              }),
        ),
        const SizedBox(
          height: 15.0,
        ),
        ShimmerLoading(
          width: double.infinity,
          height: 200.0,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.all(
            10.0,
          ),
          child: ShimmerLoading(
            height: 300.0,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        const SizedBox(
            
            child: Card(
                child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: 12.0,
                top: 12.0,
                end: 12.0,
              
              ),child: ShimmerLoading(width: 183.6, height: 200.0,),
            )))
      ],
    );
  }
}
