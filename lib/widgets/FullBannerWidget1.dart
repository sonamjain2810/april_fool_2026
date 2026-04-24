import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/SizeConfig.dart';

class FullBannerWidget1 extends StatelessWidget {
  const FullBannerWidget1({
    Key? key,
    this.ontap,
    this.assetsImagePath,
    this.imageUrl,
    required this.headingText,
  }) : super(key: key);

  final Function? ontap;
  final String? assetsImagePath, imageUrl;
  final String headingText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (ontap != null) {
          ontap!();
        }
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(
                SizeConfig.height(20),
              ),
              child: assetsImagePath != null
                  ? Image.asset(
                      assetsImagePath!,
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.width < 450
                          ? SizeConfig.height(200)
                          : SizeConfig.height(400),
                      width: MediaQuery.of(context).size.width,
                    )
                  : CachedNetworkImage(
                      imageUrl: imageUrl!,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fadeOutDuration: const Duration(seconds: 1),
                      fadeInDuration: const Duration(seconds: 3),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  headingText,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Icon(
                  Icons.arrow_forward,
                  size: SizeConfig.height(26),
                  color: Theme.of(context).primaryIconTheme.color,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
