# Variables
$databaseserver = 'localhost';
$GitFolder = 'C:\Git\nicbartie\Lincza\OAKVALLEY';
$GitFolderWorkingObjectTextFile = $GitFolder + '\Objects.txt';
$NAVVersion = '100';
$NAVFolderVersion = 'NAVW110.0';
$Database = 'Demo Database NAV (10-0)';
#$NAVServer = 'DynamicsNAV100';

# General Variables
$TablesFolder = $GitFolder + '\' + $NAVFolderVersion + '\Tables';
$PagesFolder = $GitFolder + '\' + $NAVFolderVersion + '\Pages';
$ReportsFolder = $GitFolder + '\' + $NAVFolderVersion + '\Reports';
$CodeunitsFolder = $GitFolder + '\' + $NAVFolderVersion + '\Codeunits';
$QueriesFolder = $GitFolder + '\' + $NAVFolderVersion + '\Queries';
$MenusuitesFolder = $GitFolder + '\' + $NAVFolderVersion + '\MenuSuites';
$XMLPortFolder = $GitFolder + '\' + $NAVFolderVersion +'\XMLPorts';
$NAVPowershellModuleFolder = ${env:ProgramFiles(x86)} + '\Microsoft Dynamics NAV\' + $NAVVersion + '\RoleTailored Client\Microsoft.Dynamics.Nav.Model.Tools.psd1'

# Set Permissions
#Set-ExecutionPolicy "RemoteSigned" -Scope Process -Force

# Create missing paths
IF(!(Test-Path $TablesFolder)) {MD $TablesFolder}
IF(!(Test-Path $PagesFolder)) {MD $PagesFolder}
IF(!(Test-Path $ReportsFolder)) {MD $ReportsFolder}
IF(!(Test-Path $CodeunitsFolder)) {MD $CodeunitsFolder}
IF(!(Test-Path $QueriesFolder)) {MD $QueriesFolder}
IF(!(Test-Path $MenusuitesFolder)) {MD $MenusuitesFolder}
IF(!(Test-Path $XMLPOrtFolder)) {MD $XMLPOrtFolder}

# Import NAV Module
Import-Module $NAVPowershellModuleFolder -force

# Export objects out of NAV and Split
Export-NAVApplicationObject $GitFolderWorkingObjectTextFile -DatabaseName $Database -Filter "Type=Table;Modified=Yes" -ExportTxtSkipUnlicensed -force | Split-NAVApplicationObjectFile -Destination $TablesFolder -Force
Export-NAVApplicationObject $GitFolderWorkingObjectTextFile -DatabaseName $Database -Filter "Type=Page;Modified=Yes" -ExportTxtSkipUnlicensed -force | Split-NAVApplicationObjectFile -Destination $PagesFolder -Force
Export-NAVApplicationObject $GitFolderWorkingObjectTextFile -DatabaseName $Database -Filter "Type=Report;Modified=Yes" -ExportTxtSkipUnlicensed -force | Split-NAVApplicationObjectFile -Destination $ReportsFolder -Force
Export-NAVApplicationObject $GitFolderWorkingObjectTextFile -DatabaseName $Database -Filter "Type=Codeunit;Modified=Yes" -ExportTxtSkipUnlicensed -force | Split-NAVApplicationObjectFile -Destination $CodeunitsFolder -Force
Export-NAVApplicationObject $GitFolderWorkingObjectTextFile -DatabaseName $Database -Filter "Type=Query;Modified=Yes" -ExportTxtSkipUnlicensed -force | Split-NAVApplicationObjectFile -Destination $QUeriesFolder -Force
Export-NAVApplicationObject $GitFolderWorkingObjectTextFile -DatabaseName $Database -Filter "Type=XMLPort;Modified=Yes" -ExportTxtSkipUnlicensed -force | Split-NAVApplicationObjectFile -Destination $XMLPortFolder -Force
Export-NAVApplicationObject $GitFolderWorkingObjectTextFile -DatabaseName $Database -Filter "Type=MenuSuite;Modified=Yes" -ExportTxtSkipUnlicensed -force | Split-NAVApplicationObjectFile -Destination $MenusuitesFolder -Force

# Cleanup
DEL $GitFolderWorkingObjectTextFile 