$defaultDate = "01/01/2020" # The date to set files by default if their date taken or media created date can't be found
$path = "" # Insert the path to your folder. Make sure the path ends with \
$fileName = "" # Add your file name here with no backslashes

$CharWhiteList = '[^: \w\/]'
$Shell = New-Object -ComObject shell.application
$dir = $Shell.Namespace($path)

$file = Get-Item "$($path)$($fileName)" 
$file.CreationTime = Get-Date $defaultDate
$file.LastWriteTime = Get-Date $defaultDate

$dateTaken = $dir.GetDetailsOf($dir.ParseName($fileName), 12) -replace $CharWhiteList

if ($dateTaken -ne "") {
    $dateTime = Get-Date -Date $dateTaken
    "$($fileName) was updated to $($dateTime) (via date taken)"
    $file.CreationTime = $dateTime
    $file.LastWriteTime = $dateTime
    exit
}

$mediaCreated = $dir.GetDetailsOf($dir.ParseName($fileName), 208) -replace $CharWhiteList

if ($mediaCreated -ne "") {
    $dateTime = Get-Date -Date $mediaCreated 
    "$($fileName) was updated to $($dateTime) (via media created)"
    $file.CreationTime = $dateTime
    $file.LastWriteTime = $dateTime
}