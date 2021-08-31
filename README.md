# overwatch-automated-voiceliner v3
swag

HOW TO USE:
1. Download the latest release Zip file from [Releases](https://github.com/TimCook/overwatch-automated-voiceliner/releases)!
2. Extract the Zip file to its own folder!
3. Run Program!
4. Enjoy!)

---

hotkeys:

To pause/halt program, press the "Pause" key on your keyboard. (No sound effect for un/pausing)

To exit program, press "End"!

To view help message & a bit buggy hotkey mapping pop-up thingy, press "Ctrl + F7"!

```
; Chat Hotkeys (to set mode of communication from 1 to 11)
; The "^" character in front of hotkeys, for example "^Numpad7" basically means, 
; to hold the 'Ctrl' key while pressing Numpad7, e.g. 'Ctrl + Numpad7' to toggle normal mode.

; Chat Number 1 - 'Normal'
^Numpad7::

; Chat Number 2 - 'Yell'
^Numpad8::

; Chat Number 3 - 'Whisper'
^Numpad9::

; Chat Number 4 - 'Radio - Normal'
^Numpad4::

; Chat Number 5 - 'Radio - Yell'
^Numpad5::

; Chat Number 6 - 'Radio - Whisper'
^Numpad6::

; Chat Number 7 - 'Alien - Normal'
^Numpad1::

; Chat Number 8 - 'Alien - Yell'
^Numpad2::

; Chat Number 9 - 'Alien - Whisper'
^Numpad3::

; Chat Number 10 - 'LOOC'
^Numpad0::

; Chat Number 11 - 'OOC'
^NumpadDot::

; OTA Voiceline Hotkeys (to set from group of OTA voiceline(s))

; Number 1 - 'Suppressing, go sharp, prosecuting, engaging, cover'
Numpad2::OTA(1, Chat)

; Number 2 - 'Contact, contact confirm, contact confirm2, target my radial, target 1, go sharp2, viscon'
Numpad1::OTA(2, Chat)

; Number 3 - 'Closing, inbound, move in, cover me, unit closing, unit in'
Numpad3::OTA(3, Chat)

; Number 4 - 'Lost contact, motion check, stay alert, team deployed, cleanup, ready weapons, ready extractors, ready charges, fix sight lines, contain proceed'
NumpadDot::OTA(4, Chat)

; Number 5 - 'One down, heavy resistance, request reinforcement, harden position'
NumpadDiv::OTA(5, Chat)

; Number 6 - 'Extractor away, extractor live, flash flash flash, flush'
Numpad7::OTA(6, Chat)

; Number 7 - 'Displace, ripcord, ripcord 2'
NumpadMult::OTA(7, Chat)

; Number 8 - 'Target compromised, got him now, wrap up'
Numpad8::OTA(8, Chat)

; Number 9 - 'necrotics, infestation zone'
Numpad4::OTA(9, Chat)

; Number 10 - 'infestation zone, parasitics, parasites'
Numpad5::OTA(10, Chat)

; Number 11 - 'Cleaned, contained, sector control, secure, delivered'
NumpadAdd::OTA(11, Chat)

; Number 12 - 'Request reserve, team down, request skyshield, request reinforcement, sector overrun'
Numpad0::OTA(12, Chat)

; Number 13 - 'Possible hostiles, ready weapons, prep contact, weapon off, stay alert'
NumpadSub::OTA(13, Chat)

; Number 14 - 'Affirmative, affirmative2, copy, copy that'
NumpadEnter::OTA(14, Chat)

; Number 15 - 'Sector secure, no movement, position clear, reporting clear, report all radials, no viscon'
Numpad6::OTA(15, Chat)

; Number 16 - 'Bouncer, flare down'
Numpad9::OTA(16, Chat)
```

credits to: https://github.com/TrevorLaneRay/Gmod, https://autohotkey.com/board/topic/3020-list-manipulation-functions/ (Laszlo), 
https://github.com/nickelm/ahkmap (hotkey visualization mapping), 
https://github.com/nickelm/ahkmap (Including files for compilation), 
& https://github.com/shajul/Autohotkey/blob/master/COM/Zip%20Unzip%20Natively.ahk (zip library)
with changes made to be used for automated voicelining


Disclaimer: Software is provided "as is", without any liability or warranty.
There will be no liability for any damages caused direct or indirect from the software.
