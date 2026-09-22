#!/bin/bash

cd lessons || exit 1

# Slide backdrop (letterbox) colour for the exported HTML present view.
# marp-core scopes theme.css to the slide, so the bespoke template's black
# html/body backdrop can't be set from theme.css — we inject it here instead.
# Keep in sync with --paper in theme.css.
BACKDROP="#f4f1ee"

# Top-align slides. The slide SVG has NO preserveAspectRatio attribute, so it uses
# the SVG default "xMidYMid meet" (vertically centred) — on a non-16:9 viewport
# (portrait phone) the slide floats to the middle. This shim SETS it to
# "xMidYMin meet" (top-aligned; horizontal kept centred). Verified: it persists
# across resizes (nothing re-sets it), so a one-time set is enough; the
# MutationObserver only covers any slide SVGs added later (presenter/overview clones).
PIN_SCRIPT=$(cat <<'JS'
<script>
(function () {
  var PAR = 'xMidYMin meet';
  function fix(s){ s.setAttribute('preserveAspectRatio', PAR); }
  function start(){
    document.querySelectorAll('svg[data-marpit-svg]').forEach(fix);
    new MutationObserver(function(muts){
      muts.forEach(function(m){
        if (!m.addedNodes) return;
        m.addedNodes.forEach(function(n){
          if (!n.querySelectorAll) return;
          if (n.matches && n.matches('svg[data-marpit-svg]')) fix(n);
          n.querySelectorAll('svg[data-marpit-svg]').forEach(fix);
        });
      });
    }).observe(document.documentElement, { subtree:true, childList:true });
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', start); else start();
})();
</script>
JS
)

for dir in */; do
  echo "Processing $dir"
  cd "$dir" || continue

  shopt -s nullglob
  for mdfile in *.md; do
    echo " - Generating HTML and PPTX for $mdfile"
    base="${mdfile%.md}"
    marp --no-stdin "$mdfile" -o "${base}.html" --theme ../../theme.css
    marp --no-stdin "$mdfile" -o "${base}.pptx" --theme ../../theme.css --allow-local-files
    # override the bespoke template's black backdrop, incl. the overview grid (HTML only)
    perl -0777 -pi -e "s!</head>!<style>html,body{background:${BACKDROP}}html body[data-bespoke-view=overview]{background:${BACKDROP}}</style></head>!" "${base}.html"
    # top-align slides (HTML only)
    PIN="$PIN_SCRIPT" perl -0777 -pi -e 's{</body>}{$ENV{PIN}</body>}' "${base}.html"
  done
  shopt -u nullglob

  cd ..
done
