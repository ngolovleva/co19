/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../../testharness.dart";

const String htmlEL2 = r'''
<p>
    Test for <i><a href="rdar://problem/5962118">rdar://problem/5962118</a> Crash in RenderBlock::calcColumnWidth()</i>.
</p>
<p>
    This tests that the <tt>column-gap</tt> property does not allow negative values.
</p>
<p id = "result"></p>
<div id="target" style="-webkit-column-count: 4; -webkit-column-gap: -10px;"></div>
''';

void main() {
    document.body.attributes["style"]="-webkit-writing-mode:vertical-lr";
    document.body.setInnerHtml(htmlEL2, treeSanitizer:new NullTreeSanitizer());
    var style = document.getElementById("target").getComputedStyle();
    var columnGap = style.getPropertyValue("-webkit-column-gap");
    Expect.isTrue(columnGap == "0" || columnGap == "normal");
}
