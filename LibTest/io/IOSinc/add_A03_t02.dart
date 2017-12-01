/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(List<int> data)
 * This function must not be called when a stream is currently being added using
 * [addStream].
 * @description Checks that calling the [add] function after [addStream] does
 * not cause error if stream adding is finished before the [add] method call.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:async";
import "dart:io";
import "dart:typed_data";

bool called = false;

class MyStreamConsumer<List> extends StreamConsumer<List> {
  MyStreamConsumer() {}

  Future addStream(Stream<List> stream) {
    stream.toList().then((x) { called = true; });
    return new Future(() => "ADD");
  }

  Future close() { return new Future(() => "CLOSED"); }
}

main() async {
  Stream<List> aStream = new Stream<List>.fromIterable([[1, 2, 3, 4, 5]]);
  Int32List list2 = new Int32List.fromList([10, 20, 30, 40, 50]);
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  await sink.addStream(aStream);
  Expect.isTrue(called);
  await sink.add(list2);
  await sink.close();
}
