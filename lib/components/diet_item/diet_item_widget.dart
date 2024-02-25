import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'diet_item_model.dart';
export 'diet_item_model.dart';

class DietItemWidget extends StatefulWidget {
  const DietItemWidget({
    super.key,
    required this.filterName,
    required this.selectedFilter,
    required this.action,
  });

  final String? filterName;
  final List<String>? selectedFilter;
  final Future Function()? action;

  @override
  State<DietItemWidget> createState() => _DietItemWidgetState();
}

class _DietItemWidgetState extends State<DietItemWidget> {
  late DietItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DietItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('DIET_ITEM_COMP_Container_f58tyizj_ON_TAP');
          logFirebaseEvent('Container_execute_callback');
          await widget.action?.call();
        },
        child: Container(
          width: double.infinity,
          height: 44.0,
          decoration: BoxDecoration(
            color: widget.selectedFilter!.contains(widget.filterName)
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(8.0),
          ),
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.filterName,
                      '\"\"',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: widget.selectedFilter!
                                  .contains(widget.filterName)
                              ? FlutterFlowTheme.of(context).primaryBackground
                              : FlutterFlowTheme.of(context).primaryText,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
