$path = "" # Insert the path to your folder. Make sure the path ends with \
$files = Get-ChildItem $path

for ($i=0; $i -lt $files.Count; $i++) {
    $fileName = $files[$i].Name
    $file = Get-Item "$($path)$($fileName)"

    $file.LastWriteTime = $file.CreationTime

    "$($i + 1) / $($files.Count) - $($fileName) (via creation date)"
}