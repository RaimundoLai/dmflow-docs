@echo off
cls

set DOC_FX_PATH=%docfx%
%DOC_FX_PATH%/docfx build ./lang/en/docfx-en.json
%DOC_FX_PATH%/docfx build ./lang/tw/docfx-tw.json
%DOC_FX_PATH%/docfx build ./docfx.json