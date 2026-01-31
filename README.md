# .DESCRIPTION
        Die Funktion Get-QRCode liest eine angegebene TXT-Datei ein und erstellt
        für jede nicht-leere Zeile einen separaten QR-Code als PNG-Datei.
        Die QR-Code-Dateien werden fortlaufend nummeriert im angegebenen Zielordner gespeichert.
        Falls das benötigte PowerShell-Modul "QRCodeGenerator" nicht installiert ist,
        wird es automatisch aus der PowerShell Gallery installiert und importiert.

  # .PARAMETER Path
      Gibt das Zielverzeichnis an, in dem die generierten QR-Code-PNG-Dateien
      gespeichert werden. Existiert der Ordner nicht, wird er automatisch erstellt.

  # .PARAMETER PayloadFile
      Pfad zu einer Textdatei (TXT), deren Inhalt verarbeitet wird.
      Jede nicht-leere Zeile der Datei wird als separater QR-Code codiert.

  # .EXAMPLE
      Get-QRCode -Path "C:\Temp\QR" -PayloadFile "C:\Temp\payload.txt"
      Erstellt QR-Codes für jede Zeile der Datei payload.txt und speichert
      sie im Ordner C:\Temp\QR.

  # .EXAMPLE
      Get-QRCode `
          -Path "C:\QRcodes" `
          -PayloadFile ".\data.txt"

      Relativer Pfad zur Textdatei, Ausgabe im Verzeichnis C:\QRcodes.
