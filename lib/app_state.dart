import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _tasksCompleted = prefs.getInt('ff_tasksCompleted') ?? _tasksCompleted;
    });
    _safeInit(() {
      _tasksTodo = prefs.getInt('ff_tasksTodo') ?? _tasksTodo;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _filterOpts = [
    'Hello World1',
    'Hello World2',
    'Hello World3',
    'Hello World4'
  ];
  List<String> get filterOpts => _filterOpts;
  set filterOpts(List<String> _value) {
    _filterOpts = _value;
  }

  void addToFilterOpts(String _value) {
    _filterOpts.add(_value);
  }

  void removeFromFilterOpts(String _value) {
    _filterOpts.remove(_value);
  }

  void removeAtIndexFromFilterOpts(int _index) {
    _filterOpts.removeAt(_index);
  }

  void updateFilterOptsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _filterOpts[_index] = updateFn(_filterOpts[_index]);
  }

  void insertAtIndexInFilterOpts(int _index, String _value) {
    _filterOpts.insert(_index, _value);
  }

  List<String> _userSelectedFilters = [];
  List<String> get userSelectedFilters => _userSelectedFilters;
  set userSelectedFilters(List<String> _value) {
    _userSelectedFilters = _value;
  }

  void addToUserSelectedFilters(String _value) {
    _userSelectedFilters.add(_value);
  }

  void removeFromUserSelectedFilters(String _value) {
    _userSelectedFilters.remove(_value);
  }

  void removeAtIndexFromUserSelectedFilters(int _index) {
    _userSelectedFilters.removeAt(_index);
  }

  void updateUserSelectedFiltersAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _userSelectedFilters[_index] = updateFn(_userSelectedFilters[_index]);
  }

  void insertAtIndexInUserSelectedFilters(int _index, String _value) {
    _userSelectedFilters.insert(_index, _value);
  }

  String _apiKey = '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';
  String get apiKey => _apiKey;
  set apiKey(String _value) {
    _apiKey = _value;
  }

  String _assistantid = 'asst_ygunswMQ0TqVgXJIIod3wnOw';
  String get assistantid => _assistantid;
  set assistantid(String _value) {
    _assistantid = _value;
  }

  List<TaskStruct> _taskList = [];
  List<TaskStruct> get taskList => _taskList;
  set taskList(List<TaskStruct> _value) {
    _taskList = _value;
  }

  void addToTaskList(TaskStruct _value) {
    _taskList.add(_value);
  }

  void removeFromTaskList(TaskStruct _value) {
    _taskList.remove(_value);
  }

  void removeAtIndexFromTaskList(int _index) {
    _taskList.removeAt(_index);
  }

  void updateTaskListAtIndex(
    int _index,
    TaskStruct Function(TaskStruct) updateFn,
  ) {
    _taskList[_index] = updateFn(_taskList[_index]);
  }

  void insertAtIndexInTaskList(int _index, TaskStruct _value) {
    _taskList.insert(_index, _value);
  }

  String _verificationcode = '1234';
  String get verificationcode => _verificationcode;
  set verificationcode(String _value) {
    _verificationcode = _value;
  }

  int _tasksCompleted = 0;
  int get tasksCompleted => _tasksCompleted;
  set tasksCompleted(int _value) {
    _tasksCompleted = _value;
    prefs.setInt('ff_tasksCompleted', _value);
  }

  int _tasksTodo = 0;
  int get tasksTodo => _tasksTodo;
  set tasksTodo(int _value) {
    _tasksTodo = _value;
    prefs.setInt('ff_tasksTodo', _value);
  }

  String _logo = 'logo';
  String get logo => _logo;
  set logo(String _value) {
    _logo = _value;
  }

  String _todo = '';
  String get todo => _todo;
  set todo(String _value) {
    _todo = _value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
