
$start=$pwd

build\build.ps1 "Castle of Spirits.inform"
if ($LastExitCode -ne 0) { exit 1 }
cd $start

build\build.ps1 "Life Boat.inform"
if ($LastExitCode -ne 0) { exit 1 }
cd $start

build\build.ps1 "Ultimate.inform"
if ($LastExitCode -ne 0) { exit 1 }
cd $start

