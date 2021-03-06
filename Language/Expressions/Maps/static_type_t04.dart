/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a map literal of the form
 * const <K, V>{k1: e1...kn: en} or the form <K, V>{k1: e1...kn: en} is
 * Map<K, V>.
 * @description Checks that a static warning occurs when assigning a
 * <String, int> constant map literal to a variable with declared type
 * Map<int, int> (non-constant).
 * @static-warning
 * @author iefremov
 * @reviewer rodionov
 */

import '../../../Utils/dynamic_check.dart';

main() {
  Map<int, int> i;
  checkTypeError( () {
    i = const <String, int> {}; /// static type warning
  });
}
