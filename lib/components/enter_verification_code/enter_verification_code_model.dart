import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'enter_verification_code_widget.dart' show EnterVerificationCodeWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EnterVerificationCodeModel
    extends FlutterFlowModel<EnterVerificationCodeWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for taskCode widget.
  FocusNode? taskCodeFocusNode;
  TextEditingController? taskCodeController;
  late bool taskCodeVisibility;
  String? Function(BuildContext, String?)? taskCodeControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    taskCodeVisibility = false;
  }

  @override
  void dispose() {
    taskCodeFocusNode?.dispose();
    taskCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
