/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isDirectory
 * final
 * Is true if the event target was a directory.
 * @description Checks that this property returns true if the event target was a
 * directory. Test File
 * @issue 30429
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory dir = getTempDirectorySync();
  asyncStart();
  StreamSubscription s = dir.watch().listen((FileSystemEvent event) {
    if (event is FileSystemModifyEvent) {
      Expect.isFalse(event.isDirectory);
      asyncEnd();
    }
  });
  File f = getTempFileSync(parent: dir);
  f.writeAsStringSync("File modified");
  new Future.delayed(new Duration(seconds: 1), () {
    s.cancel().then((_) {
      dir.delete(recursive: true);
    });
  });
}