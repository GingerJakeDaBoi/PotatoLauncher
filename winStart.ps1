<# script for starting The Legend of the Crying Potato on Windows OSes. THIS IS ONLY TESTED ON WINDOWS 10. #>

# set the path to the place where the script is located
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# check for the jre folder in the same directory as the script
Write-Output($scriptPath)
if (Test-Path -Path $scriptPath".\jre")
{
    # if it exists, start the game
    Start-Process -FilePath $scriptPath".\jre\jdk-18.0.2.1\bin\javaw.exe" -ArgumentList "-jar .\TheLegendOfTheCryingPotato.jar"
}
else
{
    # if it doesn't exist, download the latest version of the jre
    Write-Output "Downloading the latest version of the Java Runtime Environment..."
    Invoke-WebRequest -Uri "https://download.java.net/java/GA/jdk18.0.2.1/db379da656dc47308e138f21b33976fa/1/GPL/openjdk-18.0.2.1_windows-x64_bin.zip" -OutFile $scriptPath".\jre.zip"
    # extract the jre
    Write-Output "Extracting the Java Runtime Environment..."
    Expand-Archive -Path $scriptPath".\jre.zip" -DestinationPath $scriptPath".\jre"
    # delete the zip file
    Write-Output "Cleaning up..."
    Remove-Item -Path $scriptPath".\jre.zip"
}