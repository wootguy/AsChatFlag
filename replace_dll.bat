cd "C:\Games\Steam\steamapps\common\Sven Co-op\svencoop\addons\metamod\dlls"

if exist AsChatFlag_old.dll (
    del AsChatFlag_old.dll
)
if exist AsChatFlag.dll (
    rename AsChatFlag.dll AsChatFlag_old.dll 
)

exit /b 0