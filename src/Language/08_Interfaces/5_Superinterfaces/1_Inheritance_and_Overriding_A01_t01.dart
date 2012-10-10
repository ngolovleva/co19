/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface I inherits any members of its superinterfaces that 
 * are not overridden by members declared in I.
 * @description Checks that there're no static warnings produced when attempting to access
 * the inherited non-static members of a null variable whose static type is an interface
 * extending another interface that declares those members. This should indirectly prove
 * that they're indeed inherited by the subinterface.
 * @author rodionov
 * @note Only makes sense when dartc is used - uncomment the commented out lines
 * and see if it fails in VM mode.
 * reviewer kaigorodov
 */

interface I1 {
  int foo;
  String bar;
  void m();
  int get gett0r();
  void set sett0r(int v);
  I1 operator+(int i);
}

interface I2 extends I1 {}

interface I3 extends I2 {}

main() {
  I2 i2 = null;
  I3 i3 = null;
  
//  try {i2.nonexistent;} on NullPointerException catch(npe) {}

  try {i2.foo;} on NullPointerException catch(npe) {}

  try {i2.bar;} on NullPointerException catch(npe) {}

  try {i2.m();} on NullPointerException catch(npe) {}

  try {i2.gett0r;} on NullPointerException catch(npe) {}

  try {i2.sett0r = 1;} on NullPointerException catch(npe) {}

  try {i2 + 1;} on NullPointerException catch(npe) {}

  try {i3.foo;} on NullPointerException catch(npe) {}

  try {i3.bar;} on NullPointerException catch(npe) {}

  try {i3.m();} on NullPointerException catch(npe) {}

  try {i3.gett0r;} on NullPointerException catch(npe) {}

  try {i3.sett0r = 1;} on NullPointerException catch(npe) {}

  try {i3 + 1;} on NullPointerException catch(npe) {}
}