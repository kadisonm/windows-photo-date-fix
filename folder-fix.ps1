# Sets the creation date and modified date of an entire folder to either the date taken, media created or the default date set

$defaultDate = "01/01/2025" # The date to set files by default if their date taken or media created date can't be found
$path = "" # Insert the path to your folder. Make sure the path ends with \

$CharWhiteList = '[^: \w\/]'
$Shell = New-Object -ComObject shell.application
$dir = $Shell.Namespace($path)

$files = Get-ChildItem $path

for ($i=0; $i -lt $files.Count; $i++) {
    $fileName = $files[$i].Name
    $file = Get-Item "$($path)$($fileName)" 
    $file.CreationTime = Get-Date $defaultDate
    $file.LastWriteTime = Get-Date $defaultDate

    $dateTaken = $dir.GetDetailsOf($dir.ParseName($fileName), 12) -replace $CharWhiteList

    if ($dateTaken -ne "") {
         $dateTime = Get-Date -Date $dateTaken
         $file.CreationTime = $dateTime
         $file.LastWriteTime = $dateTime
         "$($i + 1)/$($files.Count) - $($fileName) -> $($dateTime) (via date taken)"
        continue
    }

    $mediaCreated = $dir.GetDetailsOf($dir.ParseName($fileName), 208) -replace $CharWhiteList

    if ($mediaCreated -ne "") {
        $dateTime = Get-Date -Date $mediaCreated 
        $file.CreationTime = $dateTime
        $file.LastWriteTime = $dateTime
        "$($i + 1)/$($files.Count) - $($fileName) -> $($dateTime) (via media created)"
        continue
    }

    "$($i + 1)/$($files.Count) - $($fileName) -> $($defaultDate) (via default date)"
}