// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:base_architecture/base_architecture.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:jinritoutiao/actions/actions.dart';
import 'package:jinritoutiao/models/models.dart';
import 'package:jinritoutiao/presentation/add_edit_screen.dart';

class EditTodo extends StatelessWidget {
  final Todo todo;

  EditTodo({this.todo, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnSaveCallback>(
      converter: (Store<AppState> store) {
        return (task, note) {
          store.dispatch(UpdateTodoAction(
            todo.id,
            todo.copyWith(
              task: task,
              note: note,
            ),
          ));
        };
      },
      builder: (BuildContext context, OnSaveCallback onSave) {
        return AddEditScreen(
          key: ArchSampleKeys.editTodoScreen,
          onSave: onSave,
          isEditing: true,
          todo: todo,
        );
      },
    );
  }
}
