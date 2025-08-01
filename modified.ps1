# Sets the creation date of an entire folder to the modified date

$path = "" # Insert the path to your folder. Make sure the path ends with \

$files = Get-ChildItem $path

$Shell = New-Object -ComObject shell.application
$dir = $Shell.Namespace($path)

for ($i=0; $i -lt $files.Count; $i++) {
    $fileName = $files[$i].Name
    $file = Get-Item "$($path)$($fileName)" 

    $file.CreationTime = $file.LastWriteTime

    "$($i + 1)/$($files.Count) - $($fileName) -> $($file.LastWriteTime) (via modified date)"
}