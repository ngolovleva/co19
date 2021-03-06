/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that adding and removing class names only updates the
 * elements that are affected.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
        div { width: 100px }
        .outer .inner { width: 200px }
        .outer2 { width: 150px }
        .outer3.nomatch {}
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="outer">
          <div id="mid">
              <div id="inner" class="inner">
                  <div id="innerChild">
                  </div>
              </div>
              <div id="inner2">
              </div>
          </div>
      </div>
      <div id="outer2">
          <div id="inner3"></div>
      </div>
      <div id="outer3">
          <div class="nomatch"></div>
          <div class="outer3"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var outer = document.getElementById('outer');
  var inner = document.getElementById('inner');
  var outer2 = document.getElementById('outer2');
  var outer3 = document.getElementById('outer3');

  // Style recalc should happen on "inner" and "outer", but not "inner2" or "mid".
  outer.offsetTop;
  outer.className = 'outer';
  shouldBe(getComputedStyle(inner).width, '200px');

  // Style recalc should happen on "inner", but not "innerChild".
  inner.offsetTop;
  inner.className = '';
  shouldBe(getComputedStyle(inner).width, '100px');

  // Style recalc should happen on "outer2", but not "inner3".
  outer2.offsetTop;
  outer2.className = 'outer2';
  shouldBe(getComputedStyle(outer2).width, '150px');
}
