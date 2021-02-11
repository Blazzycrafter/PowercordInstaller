


clear
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
# die lehhren echos sind da damit der text nicht verdekt wird von der process anzeige




#
# Test ob DiscordCanary installiert ist... wenn nicht laden wir es herrunter und installieren es!
#

if (Get-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\DiscordCanary' -ErrorAction SilentlyContinue) {

    Write-Warning 'Discord canary is installed: Skipping...'


} Else {

    Write-Warning 'Discord canary is NOT installed: Installing...'
        Wait-Event -SourceIdentifier 001 -Timeout 2
        $url = "https://discord.com/api/download/canary?platform=win"
        $output = "DiscordCanarySetup.exe"
        $start_time = Get-Date

        mkdir C:\pstemp -ErrorAction SilentlyContinue
        set-location -path C:\pstemp
        Invoke-WebRequest -Uri $url -OutFile $output
        Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
        Invoke-Item "C:\pstemp\DiscordCanarySetup.exe"
        Write-Warning "Press any key when DiscordCanary installed"
        $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        Stop-Process -Name DiscordCanary -Force


}






#
# Test ob Node.js installiert ist... wenn nicht laden wir es herrunter und installieren es!
#

$software = "Node.js";
$installed = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -eq $software }) -ne $null

if ($installed) {

            Write-Warning 'Node JS is installed: Skipping...'




            } Else {

            Write-Warning 'Node-JS is NOT installed: Installing...'
            Wait-Event -SourceIdentifier 001 -Timeout 2
            $url = "https://nodejs.org/dist/v14.15.4/node-v14.15.4-x64.msi"
            $output = "Node-jsSetup.msi"
            $start_time = Get-Date

            mkdir C:\pstemp -ErrorAction SilentlyContinue
            set-location -path C:\pstemp
            Invoke-WebRequest -Uri $url -OutFile $output
            Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
            .\Node-jsSetup.msi
            Write-Warning "Press any key when Node.js installed"
            $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

            
}



#
# Test ob Git in version 2.30.1 installiert ist... wenn nicht laden wir es herrunter und installieren es!
# PS die version ist eigendlich egal ... nur ich habe auf anhieb keine lösung gefunden (gesucht :D)!
#

$software = "Git version 2.30.1";
$installed = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -eq $software }) -ne $null

if ($installed) {

            Write-Warning 'Git Version 2.30.1 is installed: Skipping...'




            } Else {

            Write-Warning 'Git Version 2.30.1 is NOT installed: Installing...'
            Wait-Event -SourceIdentifier 001 -Timeout 2
            $url = "https://github.com/git-for-windows/git/releases/download/v2.30.1.windows.1/Git-2.30.1-64-bit.exe"
            $output = "Git.exe"
            $start_time = Get-Date

            mkdir C:\pstemp -ErrorAction SilentlyContinue
            set-location -path C:\pstemp
            Invoke-WebRequest -Uri $url -OutFile $output
            Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
            .\Git.exe
            Write-Warning "Press any key when Node.js installed"
            $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

            
}



#
# da ja neue programme wie git und node.js dazu kommen könnten... lade ich einmal alle einträge aus 'Path'
#

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 



#
# Hier ist der code zum installieren von Powercord itself...
# da ich diesen code über discord teile und powercord GEGEN die TOS von Discord ist.
# habe ich den teil auskommentiert somit Technisch KEINEN PowercordInstaller verbreitet :D 
#

# set-location -path C:\
# git clone https://github.com/powercord-org/powercord
# set-location -path C:\powercord
# npm i
# npm run plug
