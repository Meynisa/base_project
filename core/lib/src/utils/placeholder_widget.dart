import 'package:flutter/material.dart';
import '../../core.dart';

class PlaceholderWidget extends StatelessWidget {
  final String? imgAssets;
  final double? borderRadius;
  final double? size;

  const PlaceholderWidget(
      {Key? key, this.imgAssets, this.borderRadius = 100.0, this.size = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: FadeInImage(
            width: size!.w,
            height: size!.w,
            image:
                NetworkImage(imgAssets ?? AssetsCollection.img_placeholder_url),
            placeholder: NetworkImage(AssetsCollection.img_placeholder_url),
            imageErrorBuilder: (context, error, stackTrace) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  child: Image.network(AssetsCollection.img_placeholder_url,
                      fit: BoxFit.cover, height: size!.w, width: size!.w));
            },
            fit: BoxFit.cover));
  }
}
