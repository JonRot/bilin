import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'image_viewr_model.dart';
export 'image_viewr_model.dart';

class ImageViewrWidget extends StatefulWidget {
  const ImageViewrWidget({
    super.key,
    required this.feedbackDoc,
  });

  final BookingFeedbackRecord? feedbackDoc;

  @override
  State<ImageViewrWidget> createState() => _ImageViewrWidgetState();
}

class _ImageViewrWidgetState extends State<ImageViewrWidget> {
  late ImageViewrModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageViewrModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 4.0,
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                dateTimeFormat(
                  "HH:mm \' - \' d \'de\' MMM",
                  widget.feedbackDoc!.bFeedDateTime!,
                  locale: FFLocalizations.of(context).languageCode,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Builder(
                builder: (context) {
                  final imageList =
                      widget.feedbackDoc?.bFeedImages.toList() ?? [];

                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 1.0,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: imageList.length,
                    itemBuilder: (context, imageListIndex) {
                      final imageListItem = imageList[imageListIndex];
                      return Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: FlutterFlowExpandedImageView(
                                  image: CachedNetworkImage(
                                    fadeInDuration: const Duration(milliseconds: 200),
                                    fadeOutDuration:
                                        const Duration(milliseconds: 200),
                                    imageUrl: imageListItem,
                                    fit: BoxFit.contain,
                                  ),
                                  allowRotation: false,
                                  tag: imageListItem,
                                  useHeroAnimation: true,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: imageListItem,
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                fadeInDuration: const Duration(milliseconds: 200),
                                fadeOutDuration: const Duration(milliseconds: 200),
                                imageUrl: imageListItem,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ].divide(const SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
