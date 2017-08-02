#Variables
$databaseserver = 'localhost';
$Databasename = 'Demo Dynamics NAV (10-0)';
$OutputFolder = 'C:\Users\Wesley\Documents\Export\Compile';
$importPath = 'C:\Git\Wesley\NAVW110.0\Codeunits\';
$Path = '';

#Import Script
Import-NAVApplicationObject -Path $importPath -DatabaseName $Databasename