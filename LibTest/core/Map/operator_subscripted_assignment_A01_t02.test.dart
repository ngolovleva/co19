/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Associates the [key] with the given [value].
 * @description Checks that null key is allowed.
 * @author msyabro
 * @reviewer varlax
 */
library operator_subscripted_assignment_A01_t01;
 
import "../../../Utils/expect.dart";
 
test(Map create([Map content])) {
  Map<String, Object> map = create();  
  Expect.isFalse(map.containsKey(null));
  map[null] = null;
  Expect.isTrue(map.containsKey(null));
}
