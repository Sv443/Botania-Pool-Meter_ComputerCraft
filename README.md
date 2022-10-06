# CC-Botania-Pool-Meter
Displays the level of mana from multiple Botania mana pools on a ComputerCraft monitor  

<br>

[image]

<br>

---

<br>

### Install
1. Craft a computer and six monitors in-game
2. Place the monitors in a 3x2 (w x h) and make sure the computer touches one of the monitors
3. Hook up comparators to the mana pools and make sure all signals touch the computer
4. Open the computer and enter these commands:
```
label set botania-pool-meter
pastebin get 3ubh3LVb startup
edit startup.lua
```
5. Edit settings found at the top to your needs
6. Change the sides of the redstone inputs just below, in the `function readVals()`
7. Press <kbd>Ctrl</kbd>, select [Save], <kbd>Return</kbd>, <kbd>Ctrl</kbd> again, select [Exit], then <kbd>Return</kbd>
8. Run `reboot` to start the program
