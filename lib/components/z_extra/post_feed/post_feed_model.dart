import '/components/z_extra/add_post_feed/add_post_feed_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_feed_widget.dart' show PostFeedWidget;
import 'package:flutter/material.dart';

class PostFeedModel extends FlutterFlowModel<PostFeedWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for addPostFeed component.
  late AddPostFeedModel addPostFeedModel;

  @override
  void initState(BuildContext context) {
    addPostFeedModel = createModel(context, () => AddPostFeedModel());
  }

  @override
  void dispose() {
    addPostFeedModel.dispose();
  }
}
