# https://gist.github.com/timsneath/19867b12eee7fd5af2ba

$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = New-Object Security.Principal.WindowsPrincipal $identity
$isAdmin = $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# Write-Output "$isAdmin ist admin"

# $FormatEnumerationLimit = -1

if (($host.Name -match "ConsoleHost") -and ($isAdmin)) {
	$host.UI.RawUI.BackgroundColor = "Darkblue"
	$host.PrivateData.ErrorBackgroundColor = "White"
	$host.PrivateData.ErrorForegroundColor = "DarkRed"
}
$wsl = '\\wsl$\debian'
$home_wsl = "$wsl/home/tk"

$zsh_cu = "$home_wsl/.oh-my-zsh/custom"

$ca = "$zsh_cu/plugins/common-aliases/common-aliases.plugin.zsh"
$cf = "$PSScriptRoot/common_functions.ps1"
# $bs = "$up\AppData\Roaming\Brackets\"
# $cs = "$up\AppData\Roaming\Code\User\"

$dat = $MyInvocation.MyCommand.Definition
$gim = "$PSScriptRoot/gitmanager.ps1"

# $doks = "$home_wsl/doks"
# $lw = '\\Laptopweiss\c'
# $myd = [Environment]::GetFolderPath("MyDocuments")
$mym = [Environment]::GetFolderPath("Mymusic")

$plu = "$zsh_cu/plugins"
$up = $env:userprofile
$prof_home = $PSScriptRoot

function cv { Set-Location z:/home/tk/cv }

# code
function co { code $args }
function gim { code $gim }

# choco
function ch { choco -? | more }
function chi { choco install $args }
function coi { choco list --local-only }
function coo { choco outdated ; choco upgrade all }
function cr { choco uninstall $args }

function bg() { Start-Process -NoNewWindow @args }

function c { get-content $args }

function chr { Start-Process chrome.exe $args }
function com { wmic computersystem get model, name, manufacturer, systemtype }

function cu {
	$url = 'http://192.168.178.36/cgit/doks.git/tree/arbeiten_haus.md'
	$url = $args
	Invoke-WebRequest  -UseBasicParsing $url
}

function d { (Get-Command $args).Definition }
function dela { Remove-Item alias:$args }
function driv {	Get-PSDrive -PSProvider FileSystem | Select-Object name, @{n = "Root"; e = { if ($null -eq $_.DisplayRoot ) { $_.Root } else { $_.DisplayRoot } } } }

function ds { displayswitch.exe /external } # 2 verwenden
function e { . $profile }
function ec { Write-Output $args }

function get_reg {
	$reg = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters/"
	$reg = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" # .ReleaseId
	Get-ItemProperty -Path $reg
}

function fin {	Get-ChildItem c:/ -Filter $args[0] -Recurse | Select-Object -First 1 }

function finstr { Get-ChildItem -Recurse | Select-String -Pattern $args | Select-Object -Unique Path }

function gimo {	Get-InstalledModule | Format-List | more }

function lo { Get-ChildItem | Sort-Object name }
function map_net { net use z: $wsl }
 
function map { New-PSrive -Name 'y' -Root $lw -Persist -PSProvider "FileSystem" }

function mem { Get-CimInstance win32_physicalmemory | Select-Object -ExpandProperty }

function mo { more $args }

function n { c:/notepad++/notepad++ $args }

function pa { [System.Environment]::GetEnvironmentVariable("Path", "Machine") }

function pand_cv {	pandoc.exe -s "$cv\.md" -o "$cv\output\cv_.html" ; chr "$cv\output\cv_.html" }

function pm { shutdown.exe /h }

function prompt {
	$gl = Get-Location
	$verbindung = $(Get-NetConnectionProfile).name
	write-host "PS $gl - $verbindung >" -NoNewline
	return " "
}

function q {
	$dat_te = 'http://speedtest.wdc01.softlayer.com/downloads/test10.zip'
	$a = Get-Date
	Invoke-WebRequest $dat_te -UseBasicParsing | Out-Null; "$((10/((Get-Date)-$a).TotalSeconds)*8) Mbps"
}
function res {
	$video = Get-WmiObject -Class CIM_VideoControllerResolution
	$video[-1] | Select-Object Caption
}
function run_adm { Start-Process "powershell" -Verb RunAs }

function ser { Get-Service | Where-Object { $_.status -eq 'running' } | findstr $args }
function sf {
	[enum]::GetNames( [System.Environment+SpecialFolder] ) | 
	Select-object @{ n = "Name"; e = { $_ } },
	@{ n = "Pfad"; e = { [environment]::getfolderpath( $_ ) } } | sort-object name
}
function spr { Get-Process $args | Stop-Process }

function us { ec $env:USERNAME }
function x { exit }


set-alias gr findstr

. $PSScriptRoot\git.ps1
. $cf

Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'
