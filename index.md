# Specifikáció

## Bevezetés

### Projekt ötlet

Saját időpontok és edzéstervek megtekintése a [PTMA](https://ptma-test.herokuapp.com/) alkalmazásból (időpontfoglaló
webes alkalmazás, amit az önlabon készítettem).

### Legfontosabb cél

4 képernyő: 2 listázó, egy részletező és egy bejelentkező nézet. PTMA publikus API-jának használata, és adatok lokális tárolása.

### Platform

Android-ot és iOS-t támogató alkalmazás, flutter nyelven.

### Támogatott nyelv

Angol

## Általános követelmények

### Online/Offline

Offline megtekinthetők a korábban betöltött adatok.

### Backend kapcsolat

Kommunikáció a PTMA szerverrel, JWT tokennel, https-en keresztül.

## Specifikus követelmények

### Képernyők részletes leírása

#### Login

A bejelentkező felület, ahol az email cím és jelszó megadásával lehet belépni.

#### Appointment list

A Trainer időpontjait jeleníti meg egy listában. A lista elemei tartalmazzák a helyszínt, a vendéget, az időpont státuszát és a pontos időintervallumot.

#### Workout plan list

Az edzéstervek megjelenítése egy listában. Az elemekben megtalálható az edzésterv elnevezése, hozzá tartozó izomcsoportok és az időtartam.

#### Workout plan detail

Az edzésterv részletező nézetének fejlécében megjelennek az edzésterv adatai (név, izomcsoportok, időtartam), és egy listában a hozzá tartozó gyakorlatok. A gyakorlatok tartalmaznak egy elnevezést, leírást és időtartamot, illetve tartalmazhatnak sorozat és ismétlés számot is.

### Navigáció

Az alkalmazás megnyitásakor a login képernyő jelenik meg. A belépés után az oldalsó menüból választhatjuk ki a képernyőket (Appointments, Workout plans), amik között szabadon lépegethetünk.
Az edzéstervek listájából egy elemre kattintva a részletező képernyőre navigálhatunk, ahonnan csak visszanavigálással térhetünk vissza a listázó oldalra.
A Logout gombra kattintva visszatérünk a bejelentkező képernyőre.
