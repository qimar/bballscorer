import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  const CachedNetworkImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                        Colors.red, BlendMode.colorBurn)))),
        placeholder: (context, url) {
          return const Center(
              child: SizedBox(
                  height: 20, width: 20, child: CircularProgressIndicator()));
        },
        errorWidget: (context, url, error) {
          print(error);
          return const Center(
              child: SizedBox(height: 20, width: 20, child: Icon(Icons.error)));
        });
  }
}
