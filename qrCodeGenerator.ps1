<#
    .SYNOPSIS
        Erzeugt QR-Codes aus einer Textdatei.

    .DESCRIPTION
        Die Funktion Get-QRCode liest eine angegebene TXT-Datei ein und erstellt
        für jede nicht-leere Zeile einen separaten QR-Code als PNG-Datei.
        Die QR-Code-Dateien werden fortlaufend nummeriert im angegebenen Zielordner gespeichert.

        Falls das benötigte PowerShell-Modul "QRCodeGenerator" nicht installiert ist,
        wird es automatisch aus der PowerShell Gallery installiert und importiert.

    .PARAMETER Path
        Gibt das Zielverzeichnis an, in dem die generierten QR-Code-PNG-Dateien
        gespeichert werden. Existiert der Ordner nicht, wird er automatisch erstellt.

    .PARAMETER PayloadFile
        Pfad zu einer Textdatei (TXT), deren Inhalt verarbeitet wird.
        Jede nicht-leere Zeile der Datei wird als separater QR-Code codiert.

    .EXAMPLE
        Get-QRCode -Path "C:\Temp\QR" -PayloadFile "C:\Temp\payload.txt"

        Erstellt QR-Codes für jede Zeile der Datei payload.txt und speichert
        sie im Ordner C:\Temp\QR.

    .EXAMPLE
        Get-QRCode `
            -Path "C:\QRcodes" `
            -PayloadFile ".\data.txt"

        Relativer Pfad zur Textdatei, Ausgabe im Verzeichnis C:\QRcodes.

    .NOTES
        Autor: Eduard Ritt
        License: GPL v.3
        Voraussetzungen:
        - Internetverbindung (für Erstinstallation des Moduls)
        - PowerShell 5.1 oder PowerShell 7+

        Das Modul "QRCodeGenerator" wird im Scope CurrentUser installiert.
#>

function Get-QRCode {

    param (
        [Parameter(Mandatory = $true)]
        [string]$Path,

        [Parameter(Mandatory = $true)]
        [ValidateScript({ Test-Path $_ })]
        [string]$PayloadFile
    )

    $ModuleName = "QRCodeGenerator"

    if (-not (Get-Module -ListAvailable -Name $ModuleName)) {
        Write-Host "Modul '$ModuleName' nicht gefunden. Wird installiert..."
        Install-Module -Name $ModuleName -Repository PSGallery -Scope CurrentUser -Force
    }

    Import-Module $ModuleName -ErrorAction Stop

    if (-not (Test-Path $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
    }

    $lines = Get-Content -Path $PayloadFile

    $counter = 1

    foreach ($line in $lines) {

        if ([string]::IsNullOrWhiteSpace($line)) {
            continue
        }

        $fileName = Join-Path $Path "qrcode_$counter.png"
        New-PSOneQRCodeText -Text $line -OutPath $fileName
        $counter++
    }
}


