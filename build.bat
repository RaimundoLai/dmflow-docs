@echo off
cls

set DOC_FX_PATH=%docfx%
FOR /D %%G IN (docs\*) DO RD /S /Q "%%G"
DEL /Q docs\*.* /F

%DOC_FX_PATH%/docfx build ./lang/en/docfx-en.json
%DOC_FX_PATH%/docfx build ./lang/tw/docfx-tw.json
%DOC_FX_PATH%/docfx build ./docfx.json