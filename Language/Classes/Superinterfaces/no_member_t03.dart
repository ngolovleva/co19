/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let C be a concrete class that does not declare its own
 * noSuchMethod().
 * It is a static warning if the implicit interface
 * of C includes an instance member m of type F and C does not declare or
 * inherit a corresponding instance member m of type F' such that F' <: F.
 * @description Checks that there are no warnings if the type F' of
 * inherited instance member m is in fact a subtype of F.
 * @static-clean
 * @author ilya
 */

abstract class I {
  foo(var x);
}

class S {
  foo(int x) {}
}

class C extends S implements I {}

main () {
  new C();
}