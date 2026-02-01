# 📦 PowerShell QR-Code Generator

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue) ![License](https://img.shields.io/badge/License-GPL-green) ![Release](https://img.shields.io/badge/Release-1.0-blueviolet)

**Get-QRCode** ist ein PowerShell-Skript, das automatisch QR-Codes aus einer Textdatei generiert. Jede Zeile der TXT-Datei wird in einen separaten QR-Code umgewandelt. Das benötigte Modul **QRCodeGenerator** wird bei Bedarf automatisch installiert.

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

## 📄 Lizenz

GPL v3 – siehe `LICENSE` Datei

