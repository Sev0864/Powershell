﻿
#Variables
$databaseserver = 'localhost';
$Databasename = 'Demo Dynamics NAV (10-0)';
$OutputFolder = 'C:\Users\Wesley\Documents\Export\Compile';
$Path = '';

#Export script
Export-NAVApplicationObject $OutputFolder -DatabaseName $Databasename -Filter "Type=CodeUnit;ID=1" -ExportTxtSkipUnlicensed -force

#Import Script
Import-NAVApplicationObject -Path "C:\Git\Wesley\NAVW110.0\Codeunits\COD1" -DatabaseName "Demo Dynamics NAV (10-0)"

#Compile Script
Compile-NAVApplicationObject -path $Path -DatabaseServer $databaseserver -DatabaseName $DatabaseName -LogPath $OutputFolder -Recompile -SynchronizeSchemaChanges No 