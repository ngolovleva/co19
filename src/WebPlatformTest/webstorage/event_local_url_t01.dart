/**
 * after web-platform-tests/webstorage/event_local_url.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description url property test of local event
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

String path='${testSuiteRoot}/webstorage/iframe/local_set_item_iframe.html';

void main() {
    void onStorageEvent(event) {
        Expect.isTrue(event.url.endsWith(path), path); // TODO extract path from url and compare exactly
        asyncEnd();
    }

    window.localStorage.clear();
    window.addEventListener('storage', onStorageEvent, false);
    asyncStart();
    var el = document.createElement("iframe");
    el.setAttribute('id', 'ifrm');
    el.setAttribute('src', path);
    document.body.append(el);
}
