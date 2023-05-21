@echo off
cls

set DOC_FX_PATH=%docfx%
set PORT=8082
%DOC_FX_PATH%/docfx build ./lang/en/docfx-en.json
%DOC_FX_PATH%/docfx build ./lang/tw/docfx-tw.json
%DOC_FX_PATH%/docfx build ./docfx.json --serve -p %PORT%