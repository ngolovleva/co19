/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> every(bool test(T element))
 * If this stream reports an error, the Future will report that error.
 * @description Checks that if [test] throws error, then returned future
 * completes with this error.
 * @issue #29652
 * @author a.semenov@unipro.ru
 */
library every_A03_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void test(Stream<T> create(Iterable<T> data)) {
  Object expectedError = new ArgumentError(1);
  Stream s = create([1,2,3]);
  asyncStart();
  s.every((element) => throw expectedError).then(
      (data) {
        Expect.fail("Returned future should copmlete with error");
      },
      onError: (error) {
        Expect.identical(expectedError, error);
        asyncEnd();
      }
  );
}