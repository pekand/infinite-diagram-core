rmdir /S /Q .\files
rmdir /S /Q .\plugins
mkdir .\files
mkdir .\plugins

copy ..\Diagram\diagram.ico .\files\
copy ..\Diagram\bin\x64\Release\netcoreapp3.0\Diagram.exe .\files\
copy ..\Diagram\bin\x64\Release\netcoreapp3.0\Diagram.dll .\files\
copy ..\Diagram\bin\x64\Release\netcoreapp3.0\Diagram.runtimeconfig.json .\files\
copy ..\Diagram\bin\x64\Release\netcoreapp3.0\Interop.Shell32.dll .\files\

mkdir plugins
mkdir plugins\DropPlugin
mkdir plugins\FindUidPlugin
mkdir plugins\CreateDirectoryPlugin
mkdir plugins\NcalcPlugin
mkdir plugins\ScriptingPlugin

copy ..\Diagram\bin\x64\Release\netcoreapp3.0\plugins\CreateDirectoryPlugin\netcoreapp3.0\CreateDirectoryPlugin.dll .\plugins\CreateDirectoryPlugin\

copy ..\Diagram\bin\x64\Release\netcoreapp3.0\plugins\DropPlugin\netcoreapp3.0\DropPlugin.dll .\plugins\DropPlugin\

copy ..\Diagram\bin\x64\Release\netcoreapp3.0\plugins\FindUidPlugin\netcoreapp3.0\FindUidPlugin.dll .\plugins\FindUidPlugin\

copy ..\Diagram\bin\x64\Release\netcoreapp3.0\plugins\NcalcPlugin\netcoreapp3.0\NcalcPlugin.dll .\plugins\NcalcPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.0\plugins\NcalcPlugin\netcoreapp3.0\NCalc.dll .\plugins\NcalcPlugin\

copy ..\Diagram\bin\x64\Release\netcoreapp3.0\plugins\ScriptingPlugin\netcoreapp3.0\ScriptingPlugin.dll .\plugins\ScriptingPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.0\plugins\ScriptingPlugin\netcoreapp3.0\IronPython.zip .\plugins\ScriptingPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.0\plugins\ScriptingPlugin\netcoreapp3.0\IronPython.dll .\plugins\ScriptingPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.0\plugins\ScriptingPlugin\netcoreapp3.0\IronPython.Modules.dll .\plugins\ScriptingPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.0\plugins\ScriptingPlugin\netcoreapp3.0\IronPython.SQLite.dll .\plugins\ScriptingPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.0\plugins\ScriptingPlugin\netcoreapp3.0\Microsoft.Dynamic.dll .\plugins\ScriptingPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.0\plugins\ScriptingPlugin\netcoreapp3.0\Microsoft.Scripting.dll .\plugins\ScriptingPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.0\plugins\ScriptingPlugin\netcoreapp3.0\Microsoft.Scripting.Metadata.dll .\plugins\ScriptingPlugin\

call subscribe "files\Diagram.exe"
call subscribe "files\Diagram.dll"
call subscribe "plugins\CreateDirectoryPlugin\CreateDirectoryPlugin.dll"
call subscribe "plugins\DropPlugin\DropPlugin.dll"
call subscribe "plugins\FindUidPlugin\FindUidPlugin.dll"
call subscribe "plugins\NcalcPlugin\NcalcPlugin.dll"
call subscribe "plugins\ScriptingPlugin\ScriptingPlugin.dll"

iscc /q create-installation-package-64.iss

call subscribe "output\infinite-diagram-install.exe"

pause