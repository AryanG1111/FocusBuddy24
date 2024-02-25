import '/backend/schema/structs/index.dart';
import '/components/new_task_form/new_task_form_widget.dart';
import '/components/task_item/task_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'task_manager_widget.dart' show TaskManagerWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskManagerModel extends FlutterFlowModel<TaskManagerWidget> {
  ///  Local state fields for this page.

  List<String> selectedFilters = [];
  void addToSelectedFilters(String item) => selectedFilters.add(item);
  void removeFromSelectedFilters(String item) => selectedFilters.remove(item);
  void removeAtIndexFromSelectedFilters(int index) =>
      selectedFilters.removeAt(index);
  void insertAtIndexInSelectedFilters(int index, String item) =>
      selectedFilters.insert(index, item);
  void updateSelectedFiltersAtIndex(int index, Function(String) updateFn) =>
      selectedFilters[index] = updateFn(selectedFilters[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for ListView widget.
  ScrollController? listViewController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    listViewController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
