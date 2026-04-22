@echo off
:: Do not use setlocal to make variables global
set "OSGeo4W_PATH=D:/OSGeo4W64_qgis4_dev_deps/OSGeo4W64"

echo Searching for OSGeo4W directory...

:endsearch
echo OSGeo4W directory: %OSGeo4W_PATH%
if not defined OSGeo4W_PATH (
    echo OSGeo4W directory not found
)
    