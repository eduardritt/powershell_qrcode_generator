# 📦 PowerShell QR-Code Generator

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue) ![License](https://img.shields.io/badge/License-MIT-green) ![Release](https://img.shields.io/badge/Release-1.0-blueviolet)

**Get-QRCode** ist ein PowerShell-Skript, das automatisch QR-Codes aus einer Textdatei generiert. Jede Zeile der TXT-Datei wird in einen separaten QR-Code umgewandelt. Das benötigte Modul **QRCodeGenerator** wird bei Bedarf automatisch installiert.

---

## 🚀 Features

- QR-Codes aus jeder Textdatei generieren  
- Automatische Modulinstallation (`QRCodeGenerator`)  
- Zielordner wird automatisch erstellt  
- Dateien werden fortlaufend nummeriert (`qrcode_1.png`, `qrcode_2.png`, …)  
- Einfacher Funktionsaufruf – keine Adminrechte nötig  

---

## 📥 Installation

1. **PowerShell 5.1 oder PowerShell 7+** installieren  
2. Dieses Repository klonen oder Skript herunterladen:

```powershell
git clone https://github.com/DEIN_USERNAME/QRCodeGenerator.git
cd QRCodeGenerator
```

> Hinweis: Bei der ersten Ausführung wird das Modul `QRCodeGenerator` automatisch installiert.

---

## ⚙️ Nutzung

### Funktionsaufruf

```powershell
Get-QRCode -Path "C:\Temp\QR" -PayloadFile "C:\Temp\payload.txt"
```

**Parameter:**

| Parameter     | Beschreibung |
|---------------|--------------|
| `-Path`       | Zielordner für die QR-Codes. Wird automatisch erstellt, falls er nicht existiert. |
| `-PayloadFile`| Pfad zur Textdatei (.txt), jede Zeile wird als QR-Code generiert. |

---

### Beispiel

**TXT-Datei (`payload.txt`):**

```
https://example.com
Hallo Welt
123-456-789
```

**PowerShell-Befehl:**

```powershell
Get-QRCode -Path "C:\QRcodes" -PayloadFile ".\payload.txt"
```

**Ergebnis:**

- `C:\QRcodes\qrcode_1.png` → `https://example.com`  
- `C:\QRcodes\qrcode_2.png` → `Hallo Welt`  
- `C:\QRcodes\qrcode_3.png` → `123-456-789`  

---

## 🖼 Screenshot / Vorschau

> Optional: Füge hier einen Screenshot ein, z.B. Vorschau eines erzeugten QR-Codes oder Ordners mit den PNG-Dateien.

```markdown
![QR-Code Vorschau](images/qr_preview.png)
```

*(Lege die Datei `qr_preview.png` im Ordner `images` ab)*

---

## 💡 Hinweise

- Internetverbindung nötig, falls Modul noch nicht installiert ist  
- Modul wird im Scope `CurrentUser` installiert  
- Leere Zeilen in der TXT-Datei werden ignoriert  
- Dateien werden fortlaufend nummeriert  

---

## 🛠 Weiterentwicklung

- Pipeline-Support hinzufügen  
- Dateiname aus Inhalt generieren  
- Fortschrittsanzeige (`Write-Progress`)  
- Logging und Verbose-Ausgaben  

---

## 📄 Lizenz

MIT License – siehe `LICENSE` Datei

