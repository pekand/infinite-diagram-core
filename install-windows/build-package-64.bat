rmdir /S /Q .\files
rmdir /S /Q .\plugins
mkdir .\files
mkdir .\plugins

copy ..\Diagram\diagram.ico .\files\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\Diagram.exe .\files\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\Diagram.dll .\files\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\Diagram.runtimeconfig.json .\files\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\Interop.Shell32.dll .\files\

copy ..\Diagram\bin\x64\Release\netcoreapp3.1\Fizzler.dll .\files\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\runtime.osx.10.10-x64.CoreCompat.System.Drawing.dll .\files\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\Svg.dll .\files\

copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\NcalcPlugin\netcoreapp3.1\NCalc.dll .\files\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\ScriptingPlugin\netcoreapp3.1\IronPython.zip .\files\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\ScriptingPlugin\netcoreapp3.1\IronPython.dll .\files\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\ScriptingPlugin\netcoreapp3.1\IronPython.Modules.dll .\files\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\ScriptingPlugin\netcoreapp3.1\IronPython.SQLite.dll .\files\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\ScriptingPlugin\netcoreapp3.1\Microsoft.Dynamic.dll .\files\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\ScriptingPlugin\netcoreapp3.1\Microsoft.Scripting.dll .\files\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\ScriptingPlugin\netcoreapp3.1\Microsoft.Scripting.Metadata.dll .\files\

mkdir plugins
mkdir plugins\DropPlugin
mkdir plugins\FindUidPlugin
mkdir plugins\CreateDirectoryPlugin
mkdir plugins\NcalcPlugin
mkdir plugins\ScriptingPlugin
mkdir plugins\CScriptingPlugin

copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\CreateDirectoryPlugin\netcoreapp3.1\CreateDirectoryPlugin.dll .\plugins\CreateDirectoryPlugin\

copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\DropPlugin\netcoreapp3.1\DropPlugin.dll .\plugins\DropPlugin\

copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\FindUidPlugin\netcoreapp3.1\FindUidPlugin.dll .\plugins\FindUidPlugin\

copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\NcalcPlugin\netcoreapp3.1\NcalcPlugin.dll .\plugins\NcalcPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\NcalcPlugin\netcoreapp3.1\NCalc.dll .\plugins\NcalcPlugin\

copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\ScriptingPlugin\netcoreapp3.1\ScriptingPlugin.dll .\plugins\ScriptingPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\ScriptingPlugin\netcoreapp3.1\IronPython.zip .\plugins\ScriptingPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\ScriptingPlugin\netcoreapp3.1\IronPython.dll .\plugins\ScriptingPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\ScriptingPlugin\netcoreapp3.1\IronPython.Modules.dll .\plugins\ScriptingPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\ScriptingPlugin\netcoreapp3.1\IronPython.SQLite.dll .\plugins\ScriptingPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\ScriptingPlugin\netcoreapp3.1\Microsoft.Dynamic.dll .\plugins\ScriptingPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\ScriptingPlugin\netcoreapp3.1\Microsoft.Scripting.dll .\plugins\ScriptingPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\ScriptingPlugin\netcoreapp3.1\Microsoft.Scripting.Metadata.dll .\plugins\ScriptingPlugin\

copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\CScriptingPlugin\netcoreapp3.1\CScriptingPlugin.dll .\plugins\CScriptingPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\CScriptingPlugin\netcoreapp3.1\Microsoft.CodeAnalysis.dll .\plugins\CScriptingPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\CScriptingPlugin\netcoreapp3.1\Microsoft.CodeAnalysis.CSharp.dll .\plugins\CScriptingPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\CScriptingPlugin\netcoreapp3.1\Microsoft.CodeAnalysis.CSharp.Scripting.dll .\plugins\CScriptingPlugin\
copy ..\Diagram\bin\x64\Release\netcoreapp3.1\plugins\CScriptingPlugin\netcoreapp3.1\Microsoft.CodeAnalysis.Scripting.dll .\plugins\CScriptingPlugin\

call subscribe "files\Diagram.exe"
call subscribe "files\Diagram.dll"
call subscribe "plugins\CreateDirectoryPlugin\CreateDirectoryPlugin.dll"
call subscribe "plugins\DropPlugin\DropPlugin.dll"
call subscribe "plugins\FindUidPlugin\FindUidPlugin.dll"
call subscribe "plugins\NcalcPlugin\NcalcPlugin.dll"
call subscribe "plugins\ScriptingPlugin\ScriptingPlugin.dll"
call subscribe "plugins\CScriptingPlugin\CScriptingPlugin.dll"

iscc /q create-installation-package-64.iss

call subscribe "output\infinite-diagram-install.exe"

pause
