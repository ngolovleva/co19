/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a declaration d named n is in the namespace induced by a 
 * scope S, then d hides any declaration named n that is available in the 
 * lexically enclosing scope of S.
 * @description Checks that a hidden class name can't be used as a type. 
 * An error should be thrown as this class is not defined.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 * @needsreview dart issue #21092
 */
import "../../../Utils/expect.dart";

class C {}

main() {
  var C = 1;
  Expect.throws(() {
    new C(); /// static type warning
  }, (e) => e is Error);
}
