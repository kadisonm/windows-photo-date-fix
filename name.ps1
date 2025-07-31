# Sets the creation and modified date to the date present in the file name (exl. time) e.g "2025-01-01-11-25-31.jpg"

$path = "" # Insert the path to your folder. Make sure the path ends with \

$files = Get-ChildItem $path

for ($i=0; $i -lt $files.Count; $i++) {
    $fileName = $files[$i].Name
    $file = Get-Item "$($path)$($fileName)" 

    $date = $fileName.Substring(0, 10)

    $file.CreationTime = Get-Date $date
    $file.LastWriteTime = Get-Date $date

    "$($i + 1)/$($files.Count) - $($fileName) -> $($date) (via name)"
}