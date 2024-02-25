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
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> with TickerProviderStateMixin {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'chat'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_PAGE_chat_ON_INIT_STATE');
      logFirebaseEvent('chat_backend_call');
      _model.apiResultpcx = await ThreadsCall.call(
        apiKey: FFAppState().apiKey,
      );
      if ((_model.apiResultpcx?.succeeded ?? true)) {
        logFirebaseEvent('chat_update_page_state');
        setState(() {
          _model.threadid = ThreadsCall.threadid(
            (_model.apiResultpcx?.jsonBody ?? ''),
          ).toString();
        });
      }
    });

    _model.questionTestFieldController ??= TextEditingController();
    _model.questionTestFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/blur_bg@1x.png',
                ).image,
              ),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 770.0,
                ),
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                              ))
                                Container(
                                  width: 100.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        child: Image.asset(
                                          'assets/images/owlerica.jpg',
                                          width: 90.0,
                                          height: 90.0,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Academic Assistant',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium,
                                        ),
                                        Text(
                                          'Your friendly owl available at all times',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 12.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 12.0, 12.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 5.0,
                                        sigmaY: 4.0,
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: SingleChildScrollView(
                                          controller: _model.scollingChatColumn,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final chat = _model
                                                          .chatHistory
                                                          .toList();
                                                      if (chat.isEmpty) {
                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          child:
                                                              BlankListComponentWidget(),
                                                        );
                                                      }
                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                          0,
                                                          16.0,
                                                          0,
                                                          16.0,
                                                        ),
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: chat.length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 16.0),
                                                        itemBuilder: (context,
                                                            chatIndex) {
                                                          final chatItem =
                                                              chat[chatIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              if (chatIndex %
                                                                      2 !=
                                                                  0)
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                () {
                                                                              if (MediaQuery.sizeOf(context).width >= 1170.0) {
                                                                                return 700.0;
                                                                              } else if (MediaQuery.sizeOf(context).width <= 470.0) {
                                                                                return 330.0;
                                                                              } else {
                                                                                return 530.0;
                                                                              }
                                                                            }(),
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 3.0,
                                                                                color: Color(0x33000000),
                                                                                offset: Offset(0.0, 1.0),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              width: 1.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(12.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                SelectionArea(
                                                                                    child: AutoSizeText(
                                                                                  chatItem.text.value,
                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 14.0,
                                                                                        lineHeight: 1.5,
                                                                                      ),
                                                                                )),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ).animateOnPageLoad(
                                                                            animationsMap['containerOnPageLoadAnimation1']!),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              6.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('CHAT_PAGE_CopyRow_ON_TAP');
                                                                              logFirebaseEvent('CopyRow_copy_to_clipboard');
                                                                              await Clipboard.setData(ClipboardData(text: chatIndex.toString()));
                                                                              logFirebaseEvent('CopyRow_show_snack_bar');
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    'Response copied to clipboard.',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: Color(0x00000000),
                                                                                          fontSize: 12.0,
                                                                                        ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 2000),
                                                                                  backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.content_copy,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 10.0,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Copy response',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 10.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              if (chatIndex %
                                                                      2 ==
                                                                  0)
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Container(
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            () {
                                                                          if (MediaQuery.sizeOf(context).width >=
                                                                              1170.0) {
                                                                            return 700.0;
                                                                          } else if (MediaQuery.sizeOf(context).width <=
                                                                              470.0) {
                                                                            return 330.0;
                                                                          } else {
                                                                            return 530.0;
                                                                          }
                                                                        }(),
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(12.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              chatItem.text.value,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation2']!),
                                                                  ],
                                                                ),
                                                            ],
                                                          );
                                                        },
                                                        controller:
                                                            _model.chatListView,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 1.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 300.0,
                                  child: TextFormField(
                                    controller:
                                        _model.questionTestFieldController,
                                    focusNode:
                                        _model.questionTestFieldFocusNode,
                                    autofocus: true,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'How can I help you today ...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    maxLines: 8,
                                    minLines: 1,
                                    keyboardType: TextInputType.multiline,
                                    validator: _model
                                        .questionTestFieldControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                icon: Icon(
                                  Icons.send_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                                showLoadingIndicator: true,
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'CHAT_PAGE_SubmitIconButton_ON_TAP');
                                  // Create a message
                                  logFirebaseEvent(
                                      'SubmitIconButton_Createamessage');
                                  _model.apiMessageCreateResult =
                                      await MessageCall.call(
                                    apiKey: FFAppState().apiKey,
                                    threadid: _model.threadid,
                                    content:
                                        _model.questionTestFieldController.text,
                                  );
                                  if ((_model
                                          .apiMessageCreateResult?.succeeded ??
                                      true)) {
                                    // Add Message to Chat History
                                    logFirebaseEvent(
                                        'SubmitIconButton_AddMessagetoChatHistory');
                                    setState(() {
                                      _model.addToChatHistory(
                                          ContentStruct.maybeFromMap(
                                              getJsonField(
                                        (_model.apiMessageCreateResult
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.content[0]''',
                                      ))!);
                                    });
                                    // Clear TextField
                                    logFirebaseEvent(
                                        'SubmitIconButton_ClearTextField');
                                    setState(() {
                                      _model.questionTestFieldController
                                          ?.clear();
                                    });
                                    // Wait for UI to catchup
                                    logFirebaseEvent(
                                        'SubmitIconButton_WaitforUItocatchup');
                                    await Future.delayed(
                                        const Duration(milliseconds: 500));
                                    // Scroll to bottom
                                    logFirebaseEvent(
                                        'SubmitIconButton_Scrolltobottom');
                                    await _model.scollingChatColumn?.animateTo(
                                      _model.scollingChatColumn!.position
                                          .maxScrollExtent,
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.ease,
                                    );
                                    // Run the assistant
                                    logFirebaseEvent(
                                        'SubmitIconButton_Runtheassistant');
                                    _model.apiAssistantRunResult =
                                        await RunCall.call(
                                      threadid: _model.threadid,
                                      apiKey: FFAppState().apiKey,
                                      assistantid: FFAppState().assistantid,
                                    );
                                    if ((_model
                                            .apiAssistantRunResult?.succeeded ??
                                        true)) {
                                      // Store the runid
                                      logFirebaseEvent(
                                          'SubmitIconButton_Storetherunid');
                                      setState(() {
                                        _model.runId = RunCall.runid(
                                          (_model.apiAssistantRunResult
                                                  ?.jsonBody ??
                                              ''),
                                        ).toString();
                                      });
                                      while (_model.status != 'completed') {
                                        logFirebaseEvent(
                                            'SubmitIconButton_backend_call');
                                        _model.apiRetrieveRunResult =
                                            await RetrieverunCall.call(
                                          threadid: _model.threadid,
                                          runid: _model.runId,
                                          apiKey: FFAppState().apiKey,
                                        );
                                        if ((_model.apiRetrieveRunResult
                                                ?.succeeded ??
                                            true)) {
                                          logFirebaseEvent(
                                              'SubmitIconButton_update_page_state');
                                          setState(() {
                                            _model.status =
                                                RetrieverunCall.status(
                                              (_model.apiRetrieveRunResult
                                                      ?.jsonBody ??
                                                  ''),
                                            );
                                          });
                                          if (RetrieverunCall.status(
                                                (_model.apiRetrieveRunResult
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              'completed') {
                                            // Delay 3 seconds before next check
                                            logFirebaseEvent(
                                                'SubmitIconButton_Delay3secondsbeforenext');
                                            await Future.delayed(const Duration(
                                                milliseconds: 3000));
                                          }
                                        }
                                      }
                                      // Get latest message
                                      logFirebaseEvent(
                                          'SubmitIconButton_Getlatestmessage');
                                      _model.apiGetMessagesResult =
                                          await MessagesCall.call(
                                        threadid: _model.threadid,
                                        apiKey: FFAppState().apiKey,
                                      );
                                      if ((_model.apiGetMessagesResult
                                              ?.succeeded ??
                                          true)) {
                                        // Add message to chat history
                                        logFirebaseEvent(
                                            'SubmitIconButton_Addmessagetochathistory');
                                        setState(() {
                                          _model.addToChatHistory(
                                              ContentStruct.maybeFromMap(
                                                  MessagesCall.data(
                                            (_model.apiGetMessagesResult
                                                    ?.jsonBody ??
                                                ''),
                                          ))!);
                                        });
                                        // Wait for UI to catchup
                                        logFirebaseEvent(
                                            'SubmitIconButton_WaitforUItocatchup');
                                        await Future.delayed(
                                            const Duration(milliseconds: 500));
                                        // Scroll to bottom
                                        logFirebaseEvent(
                                            'SubmitIconButton_Scrolltobottom');
                                        await _model.scollingChatColumn
                                            ?.animateTo(
                                          _model.scollingChatColumn!.position
                                              .maxScrollExtent,
                                          duration: Duration(milliseconds: 100),
                                          curve: Curves.ease,
                                        );
                                        // Reset completed status
                                        logFirebaseEvent(
                                            'SubmitIconButton_Resetcompletedstatus');
                                        setState(() {
                                          _model.status = null;
                                        });
                                      }
                                    }
                                  }

                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      Container(
                        width: 100.0,
                        height: 60.0,
                        decoration: BoxDecoration(),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
