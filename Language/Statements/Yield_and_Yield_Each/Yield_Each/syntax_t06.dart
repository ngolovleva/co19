/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The yield-each statement adds a series of values to the result
 * of a generator function.
 *  yieldEachStatement:
 *    yield* expression ‘;’
 *  ;
 *
 * @description Check correct usage of yield-each statement in asynchronous
 * generator method
 *
 * @author a.semenov@unipro.ru
 */

import 'dart:async';
import '../../../../Utils/expect.dart';
import '../../../../Utils/async_utils.dart';

class A {
  Stream<int> test() async* {
    yield* new Stream<int>.fromIterable('abcdefghij'.codeUnits);
  }
}

main() {
  asyncStart();
  int k = 0;
  new A().test().forEach((int i) => k++).then(
      (_) {
        Expect.equals(10, k);
        asyncEnd();
      }
  );
}
