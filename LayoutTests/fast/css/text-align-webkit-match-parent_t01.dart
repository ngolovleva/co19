/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div id=test_body>
      <h3>
        Test that verifies the behavior of text-align:-webkit-match-parent.
      </h3>

      <div>
      The test passes if all the lines containing the text "Left Align" are aligned to the left and vice-versa for "Right Align".
      </div>

      <h4>Cases where the outermost div is LTR.</h4>
      <div style="text-align:start">
      <div style="text-align:-webkit-match-parent" dir=rtl class=l><span>Left Aligned</span></div>
      </div>

      <div style="text-align:start" dir=ltr>
      <div style="text-align:-webkit-match-parent" dir=rtl class=l><span>Left Aligned</span></div>
      </div>

      <div style="text-align:end" dir=ltr>
      <div style="text-align:-webkit-match-parent" dir=rtl class=r><span>Right Aligned</span></div>
      </div>

      <h4>Cases where the outermost div is RTL.</h4>

      <div style="text-align:start" dir=rtl>
      <div style="text-align:-webkit-match-parent" dir=ltr class=r><span>Right Aligned</span></div>
      </div>

      <div style="text-align:end" dir=rtl>
      <div style="text-align:-webkit-match-parent" dir=ltr class=l><span>Left Aligned</span></div>
      </div>

      <h4>Changing text-align programmatically</h4>

      <div id=programmatic_change_div style="text-align:end" dir=ltr>
          <div style="text-align:-webkit-match-parent" dir=rtl class=l><span>Left Aligned</span></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var top_div = document.getElementById('programmatic_change_div');
  top_div.style.setProperty('text-align', 'start', 'important');

  document.body.append(new DocumentFragment.html('''
      <h4>check -webkit-match-parent in a nested div</h4>

      <div style="text-align:end" dir=ltr>
        <div>
          <div style="text-align:-webkit-match-parent" dir=rtl class=r><span>Right Aligned</span></div>
        </div>
      </div>

      <div style="text-align:start" dir=ltr>
        <div style="text-align:-webkit-match-parent" dir=rtl>
          <div style="text-align:-webkit-match-parent" dir=rtl class=l><span>Left Aligned</span></div>
        </div>
      </div>
      </div>

      <pre id="console">
      ''', treeSanitizer: new NullTreeSanitizer()));

  // Checks that the given element is left aligned if expectedAlignment is 'left', or right aligned if
  // expectedAlignment is 'right'.
  // Our check for right alignment is just !isLeftAligned at the moment, but this is
  // enough for our purposes.
  assertAlignment(element, i, expectedAlignment)
  {
    var enclosingDiv = element;
    var computedStyle = getComputedStyle(enclosingDiv, null);
    var innerSpan = enclosingDiv.children[0];
    var leftAlign = expectedAlignment == 'left';
    var isLeftAligned = (enclosingDiv.offsetLeft == innerSpan.offsetLeft);

    shouldBeTrue(leftAlign && isLeftAligned && computedStyle.textAlign == 'left'
        || !leftAlign && !isLeftAligned && computedStyle.textAlign == 'right');
  }

  // Actual test.
  var leftAlignedDivs = document.querySelectorAll(".l");
  for (var i = 0; i < leftAlignedDivs.length; i++)
    assertAlignment(leftAlignedDivs[i], i, 'left');

  var rightAlignedDivs = document.querySelectorAll(".r");
  for (var i = 0; i < rightAlignedDivs.length; i++)
    assertAlignment(rightAlignedDivs[i], i, 'right');
}

