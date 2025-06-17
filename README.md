# Windows Photo Date Fixer

## The issue
Windows by default sets the creation and modified date of a file to the current date even when the image is downloaded from the web. This removes the file's original creation date which can cause issues when later uploading these files to an online drive. Fortunately, photos store either a 'date taken' or 'media created' property that keeps track of the original date the file was made.

## Solution
The following scripts can be downloaded, modified to your needs and then ran to solve the issue:

⚠️ Note: Upon downloading you must edit the script to include your paths ⚠️

`file-fix.ps1`

Takes a path to a specific file and will update its creation and modified date to match its date taken or media created date.

`folder-fix.ps1`

Takes a path to a folder and fixes its creation and modified date (same as described previously)

`creation-to-modified.ps1`

Takes a path to a folder and updates every file's modified date to match its creation date. This is a fix for the modified date unintentionally being updated after already running one of the previous scripts.