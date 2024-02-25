import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/blank_list_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import 'chat_widget.dart' show ChatWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  List<ContentStruct> chatHistory = [];
  void addToChatHistory(ContentStruct item) => chatHistory.add(item);
  void removeFromChatHistory(ContentStruct item) => chatHistory.remove(item);
  void removeAtIndexFromChatHistory(int index) => chatHistory.removeAt(index);
  void insertAtIndexInChatHistory(int index, ContentStruct item) =>
      chatHistory.insert(index, item);
  void updateChatHistoryAtIndex(int index, Function(ContentStruct) updateFn) =>
      chatHistory[index] = updateFn(chatHistory[index]);

  String? threadid;

  String? runId;

  String? status;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (threads)] action in chat widget.
  ApiCallResponse? apiResultpcx;
  // State field(s) for ScollingChatColumn widget.
  ScrollController? scollingChatColumn;
  // State field(s) for ChatListView widget.
  ScrollController? chatListView;
  // State field(s) for QuestionTestField widget.
  FocusNode? questionTestFieldFocusNode;
  TextEditingController? questionTestFieldController;
  String? Function(BuildContext, String?)? questionTestFieldControllerValidator;
  // Stores action output result for [Backend Call - API (message)] action in SubmitIconButton widget.
  ApiCallResponse? apiMessageCreateResult;
  // Stores action output result for [Backend Call - API (run)] action in SubmitIconButton widget.
  ApiCallResponse? apiAssistantRunResult;
  // Stores action output result for [Backend Call - API (retrieverun)] action in SubmitIconButton widget.
  ApiCallResponse? apiRetrieveRunResult;
  // Stores action output result for [Backend Call - API (messages)] action in SubmitIconButton widget.
  ApiCallResponse? apiGetMessagesResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    scollingChatColumn = ScrollController();
    chatListView = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    scollingChatColumn?.dispose();
    chatListView?.dispose();
    questionTestFieldFocusNode?.dispose();
    questionTestFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
