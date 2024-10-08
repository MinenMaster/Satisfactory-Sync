# Define variables
$repoPath = "C:\Path\To\Your\Repo"  # Path where the GitHub repository is cloned
$savePath = "C:\Users\<YourUsername>\AppData\Local\FactoryGame\Saved\SaveGames\<YourSteamID>"
$saveFile = "YourSaveFileName.sav"

# Pull the latest save file
cd $repoPath
git pull origin main
Copy-Item "$repoPath\$saveFile" "$savePath\$saveFile" -Force

# Launch Satisfactory
Start-Process "steam://rungameid/526870" # Satisfactory Steam ID

# Wait for the game to exit
$game = Get-Process -Name "FactoryGame" -ErrorAction SilentlyContinue
while ($game -ne $null) {
    Start-Sleep -Seconds 5
    $game = Get-Process -Name "FactoryGame" -ErrorAction SilentlyContinue
}

# After game exit, push the save file back to GitHub
Copy-Item "$savePath\$saveFile" "$repoPath\$saveFile" -Force
cd $repoPath

# Get the current date and time
$currentDate = Get-Date -Format "yyyy-MM-dd"

# Create the commit message with the date
$commitMessage = "Updated save file on $currentDate"

# Commit and push the changes
git add $saveFile
git commit -m "$commitMessage"
git push origin main
