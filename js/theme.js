(function () {
  var d = document.documentElement;
  d.classList.add('js');
  try {
    var t = localStorage.getItem('theme');
    if (t === 'light' || t === 'dark') d.dataset.theme = t;
  } catch (e) {}
  // Prices in naira for visitors in Nigeria (device time zone or language region), dollars for everyone else.
  // Runs before the page paints, so there is no flash of the other currency. Nothing is sent anywhere.
  // Override for testing: ?currency=ngn or ?currency=usd (remembered on this device).
  var cur = null;
  try {
    var q = new URLSearchParams(location.search).get('currency');
    if (q === 'ngn' || q === 'usd') { cur = q; localStorage.setItem('currency', q); }
    else cur = localStorage.getItem('currency');
  } catch (e) {}
  if (cur !== 'ngn' && cur !== 'usd') {
    var tz = '';
    try { tz = Intl.DateTimeFormat().resolvedOptions().timeZone || ''; } catch (e) {}
    var langs = navigator.languages || [navigator.language || ''];
    var ng = tz === 'Africa/Lagos';
    for (var i = 0; i < langs.length; i++) if (/-NG$/i.test(langs[i] || '')) ng = true;
    cur = ng ? 'ngn' : 'usd';
  }
  if (cur === 'ngn') d.classList.add('ngn');
})();
