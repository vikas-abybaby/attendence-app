import "package:shimmer/shimmer.dart";
import "package:flutter/material.dart";
import "package:flutter/foundation.dart";
import "package:attandenceadmin/components/widget.dart";
import "package:cached_network_image/cached_network_image.dart";

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    required this.imageUrl,
    super.key,
    this.fit = BoxFit.cover,
    this.errorWidget,
    this.placeholder,
    this.width,
    this.color,
    this.height,
    this.imageBuilder,
    this.alignment = Alignment.center,
    this.httpHeaders,
    this.progressIndicatorBuilder,
    this.filterQuality = FilterQuality.low,
  });
  final String imageUrl;
  final BoxFit fit;
  final Widget Function(BuildContext, String, Object)? errorWidget;
  final Widget Function(BuildContext, String)? placeholder;
  final double? width;
  final double? height;
  final Color? color;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final Widget Function(BuildContext, String, DownloadProgress)?
  progressIndicatorBuilder;
  final Map<String, String>? httpHeaders;
  final Alignment alignment;
  final FilterQuality filterQuality;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
    color: color,
    alignment: alignment,
    imageUrl: imageUrl,
    fit: fit,
    httpHeaders: httpHeaders,
    width: width,
    height: height,
    imageBuilder: imageBuilder,
    filterQuality: filterQuality,
    placeholder: progressIndicatorBuilder != null
        ? null
        : placeholder ??
              (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.white,
                child: Container(
                  width: fullWidth(context),
                  height: fullHeight(context) / 3,
                  color: Colors.white,
                ),
              ),
    progressIndicatorBuilder: progressIndicatorBuilder,
    errorWidget:
        errorWidget ??
        (context, url, error) =>
            Image.asset("assets/icons/app-store.png", fit: BoxFit.cover),
  );
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty("imageUrl", imageUrl))
      ..add(
        ObjectFlagProperty<
          Widget Function(BuildContext p1, String p2, Object p3)?
        >.has("errorWidget", errorWidget),
      )
      ..add(EnumProperty<BoxFit>("fit", fit))
      ..add(
        ObjectFlagProperty<Widget Function(BuildContext p1, String p2)?>.has(
          "placeholder",
          placeholder,
        ),
      )
      ..add(DoubleProperty("width", width))
      ..add(DoubleProperty("height", height))
      ..add(ColorProperty("color", color))
      ..add(
        ObjectFlagProperty<
          Widget Function(BuildContext p1, ImageProvider<Object> p2)?
        >.has("imageBuilder", imageBuilder),
      )
      ..add(
        ObjectFlagProperty<
          Widget Function(BuildContext p1, String p2, DownloadProgress p3)?
        >.has("progressIndicatorBuilder", progressIndicatorBuilder),
      )
      ..add(
        DiagnosticsProperty<Map<String, String>?>("httpHeaders", httpHeaders),
      )
      ..add(DiagnosticsProperty<Alignment>("alignment", alignment))
      ..add(EnumProperty<FilterQuality>("filterQuality", filterQuality));
  }
}
