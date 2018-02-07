#!/bin/sh
sass -C --sourcemap=none scss/style.scss style.css
cp node_modules/jquery/dist/jquery.min.js js/jquery.min.js
cp node_modules/popper.js/dist/popper.min.js js/popper.min.js
cp node_modules/bootstrap/dist/js/bootstrap.min.js js/bootstrap.min.js