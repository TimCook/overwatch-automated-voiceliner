/*

<:: --- ::>

Overwatch Automated Voiceliner (Lite) by Tim Cook, GitHub user TrevorLaneRay, AHK User Laszlo, GitHub user NickelM, Rseding91, and GitHub user shajul.
Modified to be compatible with a 1920x1080 game size.

v3.00


                        .8 
                      .888
                    .8888'
                   .8888'
                   888'
                   8'
      .88888888888. .88888888888.
   .8888888888888888888888888888888.
 .8888888888888888888888888888888888.
.&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.
`%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.
 `00000000000000000000000000000000000'
  `000000000000000000000000000000000'
   `0000000000000000000000000000000'
     `###########################'
jgs    `#######################'
         `#########''########'
           `""""""'  `"""""'



GPL-3.0 license.

<:: --- ::>

Disclaimer: Software is provided "as is", without any liability or warranty.
There will be no liability for any damages caused direct or indirect for the software.

references are satirical and only for entertainment

*/

;#Include Extra.ahk had the false positive extraction system thingy smh lmao
;#Include Zip.ahk
#Include List.ahk
#SingleInstance,force
#InstallKeybdHook
#InstallMouseHook
Version = 3.00
Menu,Tray,Tip,Overwatch Automated Voiceliner by Tim Cook - Release v%Version%

/*
IfNotExist, Gmod.ico
{
	; test := A_ScriptFullPath
	Extract_extra1("./off3.wav")
	Extract_extra2("./%A_WorkingDir%\voicelines\ota.txt")
	Extract_extra3("./WindowsXPStartupSoundLOL.mp3")
	Extract_extra4("./WindowsXPShutdownSoundLOL.mp3")
	Extract_extra5("./MacStartup.mp3")
	Extract_extra6("./Error.mp3")
	Extract_extra7("./Bruh.mp3")
	Extract_extra8("./GmodActive.ico")
	Extract_extra9("./Gmod.ico")
	Extract_extra10("./AutoHotKeyMap.exe")
	;Unz("./stuff.zip", "./")
}
*/
IfNotExist, %A_WorkingDir%\files\Gmod.ico
{
	SoundPlay, files\Bruh.mp3
	MsgBox % "[ERROR 001] It appears that either the 'files' folder and/or the 'Gmod.ico' icon file within /files/ is or are missing!`n`nPlease check if you have extracted the program files to a folder!`n`nYou must download & extract the other stuff (the Files and Voicelines folders), not just the .exe lolol"
	Sleep,2000
	ExitApp
}
Menu,Tray,Icon, %A_WorkingDir%\files\Gmod.ico



/*
	/=======================================================================\
	|Administrator Privilege Check | Note: was not needed lmao
	\=======================================================================/
*/


/* Note: was not needed lmao
if !A_IsAdmin {
	SoundPlay,MacStartup.mp3
	MsgBox, 36, Overwatch Automated Voiceliner by Tim Cook,Software is provided 'as is', without any liability or warranty. `nUse at own risk.`n`nRelaunch as admin?, The voiceline script needs to be run as administrator in order to send keyboard presses & mouse input stuff, ya know?`n`nShall we relaunch the script as administrator for you?`n`n(If not`, we'll just exit the script. `n`n`n{The source code is literally available to view if you think its a virus lmao, up to u - smh my head})
	IfMsgBox,Yes
	{
		;Launch a new instance of the script, this time with admin privilege.
		Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
		;Close this unprivileged instance, as it's no longer needed.
		ExitApp
	}
	IfMsgBox,No
	{
		SoundPlay,Bruh.mp3
		Sleep,500
		ExitApp
	}

} else {
	*/

SoundPlay, files\MacStartup.mp3
MsgBox, 36, Overwatch Automated Voiceliner by Tim Cook,Do you understand & agree to the following:`n`nThis software is provided 'as is', without any liability or warranty. `nYou are using at your own risk.`n`n{The source code is literally available to view if you think its a virus lmao, smh my head but up to you})
	IfMsgBox,No
	{
		SoundPlay, files\Bruh.mp3
		Sleep,1000
		ExitApp
	}
	IfMsgBox,Yes
	{

	SoundPlay, files\WindowsXPStartupSoundLOL.mp3
	
	/*
	TheGuide := []
	Loop, Files, *.jpg, R
	{
		TheGuide.Push(LoadPicture(A_LoopFileFullPath))
	}
	*/
		;MsgBox % "<:: Welcome to the Overwatch Automated Voiceliner, v." . Version . "! ::>`n`nSoftware is provided 'as is', without any liability or warranty. `nUse at own risk.`n`nYou should see a GMod icon that is on your Windows taskbar badge area.`n{Probably the bottom-right of your screen}`nIt represents this macro program. `n`nYou can press End to exit the program as well.`n`nHOTKEYS:`nPage Up: Freeze/Unfreeze the Program`nEnd: Self-Explanatory lmao`nCtrl + F5: Launch GMod (and connect to WN)`nCtrl + F7: Display Chat/Voiceline Hotkeys [buggy]"
	}

/*
	/=======================================================================\
	|Initialization
	\=======================================================================/
*/


; Default chat variable indicating /r (4: radio normal)
Chat := 4

; Group := 14

; Default set to Non-Tagline Mode (Press Insert to set OTA mode & Press Del to set Civil Protection mode. Press Home to set non-tagline mode.)

Char := 1
global TagSetting := 0

global tagline1a := "Attention"
global tagline1b := "Overwatch"
global tagline2a := "Attention"
global tagline2b := "Dispatch"

IfNotExist, %A_WorkingDir%\config\OAVSettings.ini
{
		IfNotExist, %A_WorkingDir%\config
		{
			FileCreateDir, %A_WorkingDir%\config
			IfNotExist, %A_WorkingDir%\config
			{
				SoundPlay, files\Error.mp3
				MsgBox % "[ERROR 400] Looks like the program is not able to access or create the config folder.`nPlease make sure you are not running the script directly within a zip file!"
				Sleep,2500
				ExitApp
			}
		}
		IniWrite, Tim Cook, %A_WorkingDir%\config\OAVSettings.ini, OverwatchAutomatedVoiceliner, author

		IniWrite, %Version%, %A_WorkingDir%\config\OAVSettings.ini, OverwatchAutomatedVoiceliner, version

		IniRead, bruh, %A_WorkingDir%\config\OAVSettings.ini, OverwatchAutomatedVoiceliner, author, moment
		if (bruh == moment)
		{
			SoundPlay, files\Error.mp3
			MsgBox % "[ERROR 401] Looks like the program is not able to access the OAVSettings.ini file that should be in the config/ folder.`nPlease make sure that you have extracted all necessary files into a folder & not running the script directly within a zip file!"
			Sleep,2500
			ExitApp
		}
		else
		{
			; Initialization

			; If test1, as it is set to 1, is not turned to a 0 by completing tagline entering process, the if program section below will trigger config reset to have taglines re-entered
			IniWrite, 1, %A_WorkingDir%\config\OAVSettings.ini, Debug, test1
			IniWrite, Attention, %A_WorkingDir%\config\OAVSettings.ini, Taglines, tag1a
			IniWrite, Overwatch, %A_WorkingDir%\config\OAVSettings.ini, Taglines, tag1b
			IniWrite, Attention, %A_WorkingDir%\config\OAVSettings.ini, Taglines, tag2a
			IniWrite, Dispatch, %A_WorkingDir%\config\OAVSettings.ini, Taglines, tag2b
			validtagline := false
			tag1a := ""
			while (!validtagline)
			{
				InputBox, tag1a, OTA SQUAD Tagline (e.g. 'ION'), Please enter your OTA SQUAD NAME ONLY (no numbers just the OTA squad name), , 540, 480
				if ErrorLevel
				{
				  SoundPlay, files\Bruh.mp3
					MsgBox % "please enter a OTA tagline u doofus lmao"
				}
				else if tag1a is not alpha
				{
					SoundPlay, files\Error.mp3
					MsgBox % "bro enter the squad NAME only not the full tagline lmao - like ION"
				}
				else
				{
				  MsgBox % "Your OTA Squad tagline is: " . tag1a . "!"
				  validtagline := true
				}
			}
			validtagline := false
			tag1b := 0
			while (!validtagline)
			{
				InputBox, tag1b, OTA Unit NUMBER e.g. '69', Please enter your OTA Unit DIGITS ONLY (if less than 10 please ONLY enter 1 number - not 09 or something), , 540, 480
				if ErrorLevel
				{
				  SoundPlay, files\Bruh.mp3
					MsgBox % "please enter a OTA unit number doofus bruh"
				}
				else if tag1b is not integer
				{
					SoundPlay, files\Error.mp3
					MsgBox % "please enter ONLY ur OTA unit numberz u big doofus McGee lmao"
				}
				else
				{
				  MsgBox % "Your OTA Unit Digit(s) are/is: " . tag1b . "!"
				  validtagline := true
				}
			}

			MsgBox % "Your full OTA tagline is: " . tag1a . "-" . tag1b . "."
			IniWrite, %tag1a%, %A_WorkingDir%\config\OAVSettings.ini, Taglines, tag1a
			IniWrite, %tag1b%, %A_WorkingDir%\config\OAVSettings.ini, Taglines, tag1b

			validtagline := false
			tag2a := ""
			while (!validtagline)
			{
				InputBox, tag2a, Civil Protection SQUAD name (e.g. 'ROLLER'), Please enter your CIVIL PROTECTION Squad NAME ONLY, , 540, 480
				if ErrorLevel
				{
				  SoundPlay, files\Bruh.mp3
					MsgBox % "please enter a civil protection tagline doofus lolol - if u do not have a tagline, just enter whatever u want, using alphabet only (no spaces), lmao"
				}
				else if tag2a is not alpha
				{
					SoundPlay, files\Error.mp3
					MsgBox % "bro enter the Civil Protection Squad NAME only, not the full tagline lmao - like 'ROLLER'"
				}
				else
				{
				  MsgBox % "Your Civil Protection Squad name is: " . tag2a . "!"
				  validtagline := true
				}
			}
			validtagline := false
			tag2b := 0
			while (!validtagline)
			{
				InputBox, tag2b, Civil Protection Unit NUMBER (e.g. '7'), Please enter your Civil Protection Unit single DIGIT ONLY (please enter a single number not 09 or something), , 540, 480
				if ErrorLevel
				{
				  SoundPlay, files\Bruh.mp3
					MsgBox % "enter a Civil Protection unit number doofus"
				}
				else if tag2b is not integer
				{
					SoundPlay, files\Error.mp3
					MsgBox % "enter ONLY a SINGLE number for ur Civil Protection unit number u absolute bruh kind of bruh poop face haha lol"
				}
				else
				{
				  MsgBox % "Your Civil Protection Unit Digit is: " . tag2b . "!"
				  validtagline := true
				}
			}

			MsgBox % "Your full Civil Protection tagline is: " . tag2a . "-" . tag2b . "."
			IniWrite, %tag2a%, %A_WorkingDir%\config\OAVSettings.ini, Taglines, tag2a
			IniWrite, %tag2b%, %A_WorkingDir%\config\OAVSettings.ini, Taglines, tag2b

			; Confirms that tagline entering process was completed
			IniWrite, 0, %A_WorkingDir%\config\OAVSettings.ini, Debug, test1
			IniWrite, 0, %A_WorkingDir%\config\OAVSettings.ini, Taglines, display
			IniWrite, 1, %A_WorkingDir%\config\OAVSettings.ini, Taglines, defaultchar
			IniWrite, 4, %A_WorkingDir%\config\OAVSettings.ini, Chat, defaultchat
		}
}

initest1 := 0
IniRead, initest1, %A_WorkingDir%\config\OAVSettings.ini, Debug, test1

if (initest1 == 1)
{
	SoundPlay, files\Bruh.mp3
	MsgBox % "[INI DEBUG #1]`n`nLooks like the program was restarted or exited during the tagline entering process.`n`nTherefore, the configuration will be reset & the program will now restart so that correct tagline stuff can be entered!"
	Sleep,5000
	FileDelete, %A_WorkingDir%\config\OAVSettings.ini
	Reload
}

IfExist, %A_WorkingDir%\config\OAVSettings.ini
{
	IniRead, tagline1a, %A_WorkingDir%\config\OAVSettings.ini, Taglines, tag1a
	IniRead, tagline1b, %A_WorkingDir%\config\OAVSettings.ini, Taglines, tag1b
	IniRead, tagline2a, %A_WorkingDir%\config\OAVSettings.ini, Taglines, tag2a
	IniRead, tagline2b, %A_WorkingDir%\config\OAVSettings.ini, Taglines, tag2b

	updatetest = 2.00

	IniRead, updatetest, %A_WorkingDir%\config\OAVSettings.ini, OverwatchAutomatedVoiceliner, version

	if (updatetest != 3.00)
	{
		SoundPlay, files\Bruh.mp3
	MsgBox % "[INI DEBUG #2]`n`nLooks like your current configuration file is outdated!`n`nIt will automatically be updated for compatibility! uwu"
		IniWrite, %Version%, %A_WorkingDir%\config\OAVSettings.ini, OverwatchAutomatedVoiceliner, version
		IniWrite, 0, %A_WorkingDir%\config\OAVSettings.ini, Taglines, display
		IniWrite, 1, %A_WorkingDir%\config\OAVSettings.ini, Taglines, defaultchar
		IniWrite, 4, %A_WorkingDir%\config\OAVSettings.ini, Chat, defaultchat
	}
		
	IniRead, TagSetting, %A_WorkingDir%\config\OAVSettings.ini, Taglines, display
	IniRead, Char, %A_WorkingDir%\config\OAVSettings.ini, Taglines, defaultchar
	IniRead, Chat, %A_WorkingDir%\config\OAVSettings.ini, Chat, defaultchat
}

OTAVoicelines := [] ; Overwatch Deployment
CivilProtectionVoicelines := [] ; Civil Protection Armory

/*
; Approach 3b
Temp := ""
Voicelines := "%A_WorkingDir%\voicelines\ota.txt"
FileRead, Temp, %Voicelines%
OTAVoicelines := StrSplit(Temp, "`n")
/*
Loop, % OTAVoicelines.MaxIndex()
{
	MsgBox % OTAVoicelines[A_Index]
}
*/

; Resuming Approach 3

OTAVCs := 0
CivilProtectionVCs := 0

IfExist, %A_WorkingDir%\voicelines\ota.txt
{
	Loop, Read, %A_WorkingDir%\voicelines\ota.txt
	{
		OTAVCs += 1
		OTAVoicelines%OTAVCs% := A_LoopReadLine
	}
}

IfNotExist, %A_WorkingDir%\voicelines\ota.txt
{
	MsgBox % "[ERROR 300] A OTA Voicelines .txt file was not found in the 'voicelines' folder.`n`nPlease make sure the program can access 'voicelines/ota.txt.'"
}

IfExist, %A_WorkingDir%\voicelines\civilprotection.txt
{
	Loop, Read, %A_WorkingDir%\voicelines\civilprotection.txt
	{
		CivilProtectionVCs += 1
		CivilProtectionVoicelines%CivilProtectionVCs% := A_LoopReadLine
	}
}

IfNotExist, %A_WorkingDir%\voicelines\civilprotection.txt
{
	MsgBox % "[ERROR 301] A Civil Protection Voicelines .txt file was not found in the 'voicelines' folder.`n`nPlease make sure the program can access 'voicelines/civilprotection.txt.'"
}

global Ra1 := tagline1a
global Ra2 := tagline1b
; global Ra3 := "unit"

global Rb1 := tagline2a
global Rb2 := tagline2b
; global Rb3 := "functionary"

; global Prev1 := 0
; global Prev2 := 0

; List of previous OTA voiceline-index numbers for each of the sixteen voiceline-groups
global PrevGen1 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

; List of previous Civil Protection voiceline-index numbers for each of the twenty-three voiceline-groups
global PrevGen2 := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

; Welcome message with tagline(s)!
MsgBox % "<:: Welcome to the Overwatch Automated Voiceliner, v." . Version . "! ::>`n`nSoftware is provided 'as is', without any liability or warranty. `nUse at own risk.`n`nYou should see a GMod icon that is on your Windows taskbar badge area.`n{Probably the bottom-right of your screen}`nIt represents this macro program. `n`nYou can press End to exit the program as well.`n`nHOTKEYS:`n`nPause Key: Freeze/Unfreeze the Program`nEnd: Self-Explanatory lmao`nCtrl + F5: Launch GMod (and connect to WN)`n`nInsert Key: Set OTA VOICELINES Mode.`nDel (Delete) Key: Set Civil Protection VOICELINES Mode.`n`nHome Key: Toggle Tagline DISPLAY Modes.`n`nCtrl + F7: Display Chat/Voiceline Hotkeys [buggy]`n`n`nYour taglines are:`n`n<:: OTA - " . tagline1a . "-" . tagline1b . " ::>`n`n<:: Civil Protection - " . tagline2a . "-" . tagline2b . " ::>"

/*
	/=======================================================================\
	|le high-temperature level indicative 'keys'
	\=======================================================================/
*/


; Pause program
Pause:: Suspend

; Exits program
End:: 
ToolTip,Thank you for using the OAV! Shutting down...,gameWidth/2,0
SoundPlay, files\WindowsXPShutdownSoundLOL.mp3
Sleep,2500
ExitApp
; Launches GMod & connects to WN
^F5:: LaunchGmod()
; Launch Hotkey Mapping

; Set OTA Voicelines Mode
Ins::
SoundPlay, files\off3.wav
Char := 1
IniWrite, 1, %A_WorkingDir%\config\OAVSettings.ini, Taglines, defaultchar
ToolTip,Switching to OTA voicelines...,gameWidth/2,0
Sleep,1500
ToolTip
return

; Set Civil Protection Voicelines Mode
Del::
SoundPlay, files\off3.wav
Char := 2
IniWrite, 2, %A_WorkingDir%\config\OAVSettings.ini, Taglines, defaultchar
ToolTip,Switching to CIVIL PROTECTION voicelines...,gameWidth/2,0
Sleep,1500
ToolTip
return

; Toggle Tagline DISPLAY Mode
Home:: 
SoundPlay, files\off3.wav
; Char := 3
if (TagSetting != 0)
{
	TagSetting := 0
	IniWrite, 0, %A_WorkingDir%\config\OAVSettings.ini, Taglines, display
}
else
{
	TagSetting := 1
	IniWrite, 1, %A_WorkingDir%\config\OAVSettings.ini, Taglines, display
}
ToolTip,Toggling NON-TAGLINE Mode: <%TagSetting%> (1/0) [on/off]...,gameWidth/2,0
Sleep,3000
ToolTip
return


;Roleplay hotkeys.


/*
Functionality: OTA(# voiceline group, # of chat type) [or Protec() TBA]

OTA() (or Protec() Args:
#1 {
	1 through 16
}
,
#2 {
1: normal, 
2: yell, 
3: whisper, 
4: radio normal, 
5: radio yell, 
6: radio normal; 
7: alien lmao, 
8: alien yell lmao, 
9: alien whisper lmao, 
10: LOOC idk why tho
11: OOC
}

E.g. OTA(6, 9) <:: haha lmao ::>
means
from group 6, pick a voiceline to be entered with alien in whisper mode

*/


; Chat Hotkeys (to set mode of communication from 1 to 11)


; Chat Number 1 - 'Normal'
^Numpad7::
Chat := 1
IniWrite, 1, %A_WorkingDir%\config\OAVSettings.ini, Chat, defaultchat
SoundPlay, files\off3.wav
ToolTip,Set chatmode to NORMAL...,gameWidth/2,0
Sleep,1000
ToolTip
return

; Chat Number 2 - 'Yell'
^Numpad8::
Chat := 2
IniWrite, 2, %A_WorkingDir%\config\OAVSettings.ini, Chat, defaultchat
SoundPlay, files\off3.wav
ToolTip,Set chatmode to YELL (y)...,gameWidth/2,0
Sleep,1000
ToolTip
return

; Chat Number 3 - 'Whisper'
^Numpad9::
Chat := 3
IniWrite, 3, %A_WorkingDir%\config\OAVSettings.ini, Chat, defaultchat
SoundPlay, files\off3.wav
ToolTip,Set chatmode to WHISPER (w)...,gameWidth/2,0
Sleep,1000
ToolTip
return

; Chat Number 4 - 'Radio - Normal'
^Numpad4::
Chat := 4
IniWrite, 4, %A_WorkingDir%\config\OAVSettings.ini, Chat, defaultchat
SoundPlay, files\off3.wav
ToolTip,Set chatmode to RADIO NORMAL (r)...,gameWidth/2,0
Sleep,1000
ToolTip
return

; Chat Number 5 - 'Radio - Yell'
^Numpad5::
Chat := 5
IniWrite, 5, %A_WorkingDir%\config\OAVSettings.ini, Chat, defaultchat
SoundPlay, files\off3.wav
ToolTip,Set chatmode to RADIO YELL (ry)...,gameWidth/2,0
Sleep,1000
ToolTip
return

; Chat Number 6 - 'Radio - Whisper'
^Numpad6::
Chat := 6
IniWrite, 6, %A_WorkingDir%\config\OAVSettings.ini, Chat, defaultchat
SoundPlay, files\off3.wav
ToolTip,Set chatmode to RADIO WHISPER (rw)...,gameWidth/2,0
Sleep,1000
ToolTip
return

; Chat Number 7 - 'Alien - Normal'
^Numpad1::
Chat := 7
IniWrite, 7, %A_WorkingDir%\config\OAVSettings.ini, Chat, defaultchat
SoundPlay, files\off3.wav
ToolTip,Set chatmode to ALIEN NORMAL (ali)...,gameWidth/2,0
Sleep,1000
ToolTip
return

; Chat Number 8 - 'Alien - Yell'
^Numpad2::
Chat := 8
IniWrite, 8, %A_WorkingDir%\config\OAVSettings.ini, Chat, defaultchat
SoundPlay, files\off3.wav
ToolTip,Set chatmode to ALIEN YELL (yali)...,gameWidth/2,0
Sleep,1000
ToolTip
return

; Chat Number 9 - 'Alien - Whisper'
^Numpad3::
Chat := 9
IniWrite, 9, %A_WorkingDir%\config\OAVSettings.ini, Chat, defaultchat
SoundPlay, files\off3.wav
ToolTip,Set chatmode to ALIEN WHISPER (wali)...,gameWidth/2,0
Sleep,1000
ToolTip
return

; Chat Number 10 - 'LOOC'
^Numpad0::
Chat := 10
IniWrite, 10, %A_WorkingDir%\config\OAVSettings.ini, Chat, defaultchat
SoundPlay, files\off3.wav
ToolTip,Set chatmode to LOCAL OOC...,gameWidth/2,0
Sleep,1000
ToolTip
return

; Chat Number 11 - 'OOC'
^NumpadDot::
Chat := 11
IniWrite, 11, %A_WorkingDir%\config\OAVSettings.ini, Chat, defaultchat
SoundPlay, files\off3.wav
ToolTip,Set chatmode to GLOBAL OOC...,gameWidth/2,0
Sleep,1000
ToolTip
return



/*

; OTA & Civil Protection Multi-Dimensional Voiceline "Duo-"Hotkeys (to set from group of OTA voiceline(s) AND/OR CIVIL PROTECTION Voiceline(s); Ap#2, A#1, P. - [~222])
; Non-Repeating Self-Canonical Structure Sequence <Vigen??re cipher (le chiffrage ind??chiffrable)>:


; [ 5 5 7 7 13 13 6 6 8 16 9  10 15 2  1  3  3  12 12 4  4  11 14 14 ](
; { 1 2 3 4 5  6  7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 !! 22 23 } 


; Simplified 2nd Pairs:
; [(5, 50), (7, 70), (13, 130), (6, 60), (3, 30), (12, 120), (4, 40), (14, 140)]

; Simplified 2nd Pairs-Key:
; [(50, 2), (70, 4), (130, 6), (60, 8), (30, 17), (120, 19), (40, 21), (140, 23)]


; [  5 5  7 7  13 13  6 6  8 16 9  10 15 2  1  3  3  12 12  4  4  11 14 14  ](
; {  1 50 3 70 5  130 7 60 9 10 11 12 13 14 15 16 30 18 120 20 40 !! 22 140 } 


; NRSCSS Key)
; A#2, A#1, P - [30019]![319##]->?#
; {8} [30]->[31] < ({)21(}) >

*/



; OTA Number #5 & Civil Protection Number #1 - 'One down, heavy resistance, request reinforcement, harden position'
NumpadDiv::Dispatch(5, Chat, Char)

; Civil Protection Number #2
!NumpadDiv::Dispatch(5, Chat, Char)

; OTA Number #7 & Civil Protection Number #3 - 'Displace, ripcord, ripcord 2'
NumpadMult::Dispatch(7, Chat, Char)

; Civil Protection Number #4
!NumpadMult::Dispatch(7, Chat, Char)

; OTA Number #13 & Civil Protection Number #5 - 'Possible hostiles, ready weapons, prep contact, weapon off, stay alert'
NumpadSub::Dispatch(13, Chat, Char)

; Civil Protection Number #6
!NumpadSub::Dispatch(13, Chat, Char)

; OTA Number #6 & Civil Protection Number #7 - 'Extractor away, extractor live, flash flash flash, flush'
Numpad7::Dispatch(6, Chat, Char)

; Civil Protection Number #8
!Numpad7::Dispatch(6, Chat, Char)

; OTA Number #8 & Civil Protection Number #9 - 'Target compromised, got him now, wrap up'
Numpad8::Dispatch(8, Chat, Char)

; OTA Number #16 & Civil Protection Number #10 - 'Bouncer, flare down'
Numpad9::Dispatch(16, Chat, Char)

; OTA Number #9 & Civil Protection Number #11 - 'necrotics, infestation zone'
Numpad4::Dispatch(9, Chat, Char)

; OTA Number #10 & Civil Protection Number #12 - 'infestation zone, parasitics, parasites'
Numpad5::Dispatch(10, Chat, Char)

/*
Number 15, burger king footlettuce the last thing you want in your burgerking burger is someone elses foot fungus admittedly he had shoes on

'Sector secure, no movement, position clear, reporting clear, report all radials, no viscon'
*/
; OTA Number #15 & Civil Protection Number #13 - 'Sector secure, no movement, position clear, reporting clear, report all radials, no viscon'
Numpad6::Dispatch(15, Chat, Char)

; OTA Number #2 & Civil Protection Number #14 - 'Contact, contact confirm, contact confirm2, target my radial, target 1, go sharp2, viscon'
Numpad1::Dispatch(2, Chat, Char)

; OTA Number #1 & Civil Protection Number #15 - 'Suppressing, go sharp, prosecuting, engaging, cover'
Numpad2::Dispatch(1, Chat, Char)

; OTA Number #3 & Civil Protection Number #16 - 'Closing, inbound, move in, cover me, unit closing, unit in'
Numpad3::Dispatch(3, Chat, Char)

; Civil Protection Number #17
!Numpad3::Dispatch(3, Chat, Char)

; OTA Number #12 & Civil Protection Number #18 - 'Request reserve, team down, request skyshield, request reinforcement, sector overrun'
Numpad0::Dispatch(12, Chat, Char)

; Civil Protection Number #19
!Numpad0::Dispatch(12, Chat, Char)

; OTA Number #4 & Civil Protection Number #20 - 'Lost contact, motion check, stay alert, team deployed, cleanup, ready weapons, ready extractors, ready charges, fix sight lines, contain proceed'
NumpadDot::Dispatch(4, Chat, Char)

; OTA Number #4 & Civil Protection Number #21 - 'Lost contact, motion check, stay alert, team deployed, cleanup, ready weapons, ready extractors, ready charges, fix sight lines, contain proceed'
!NumpadDot::Dispatch(4, Chat, Char)

; OTA Number #11 <:: Civil Protection Non-Number! ::> - 'Cleaned, contained, sector control, secure, delivered'
NumpadAdd::Dispatch(11, Chat, Char)

; OTA Number #14 & Civil Protection Number #22 - 'Affirmative, affirmative2, copy, copy that'
NumpadEnter::Dispatch(14, Chat, Char)

; OTA Number #14 & Civil Protection Number #23 - 'Affirmative, affirmative2, copy, copy that'
!NumpadEnter::Dispatch(14, Chat, Char)


; Civil Protection Voiceline Group Hotkeys (Organized by Tim Cook [TOOK THREE HOURS)


/*

---

LEGEND:

CIVIL PROTECTION VOICE-LINE GROUPS [~300 Voicelines] (!NUM# = ALT + NUM#)
1. NUM / {UNIT STATUS: ON-DUTY}
2. !NUM / {UNIT STATIS: OFF-DUTY}

3. NUM * {INQUIRE: REPORT REQUEST <TO OTHERS>}
4. !NUM * {CODE RED ALERT: REPORT EMERGENCY <FOR SELF>}

5. NUM (-) [Dash] {CLEAR STATUS <NON-LOCATION SPECIFIC>}
6. !NUM (-) [Dash or alternatively NUM 9] {CLEAR STATUS <LOCATION SPECIFIC>}

7. !NUM 7 {SITUATIONAL STATUS: UNIT RESPONSE}
8. !NUM 7 {UNIT ARRIVED}

9. !NUM 8 {ANTI-ROBOCOP VOCAL SUPPLEMENTION <CONVERSATIONAL>}

10. NUM 9 {ANTI-ROBOCOP VOCAL SUPPLEMENTATION <REACTIONARY>}

11. !NUM 4 {SUBJECT INSTRUCTION: FIRST WARN}

12. !NUM 5 {SUBJECT INSTRUCTION: SECOND WARN}

13. !NUM 6 {SUBJECT INSTRUCTION: POST-SECOND WARN / ACTION RESPONSES}

14. !NUM 1 {SUBJECT INSTRUCTION: HALT}

15. !NUM 2 {SUBJECT STATUS: EVASION}

16. !NUM 3 {SUBJECT STATUS: EVADED}

17. !NUM 3 {SUBJECT STATUS: UNCOVERED / FOUND}

18. !NUM 0 {SITUATION: DISTURBANCE}
19. !NUM 0 {SITUATION: XEN-BASED DISTURBANCE}

20. !NUM DOT {PRIORITY ALERT: ASSAULT ON FUNCTIONARIES}
21. !NUM DOT {PRIORITY ALERT: HOSTILE FIREFIGHT / ANTI-CIVIL INCURSION}

22. !NUM ADD (+) {REPLY: YES / COPY}
23. !NUM ADD (+) {REPLY: NEGATIVE / ELABORATE}

---

*/

/*

Multi-Dimensional <Of types of voicelines> Voiceline Approaches:

Approach #1: Create unique numpad keys for either and both OTA / Civil Protection
Approach #2: Edit shared numpad keys to differentiate voicelines based on global variable(s), e.g. Char

AA: A #1 - Approach #1, in-progress [206]

*/

/* Approach #1 - Pre-Start Sectionization

; 1. NUM / {UNIT STATUS: ON-DUTY}
Numpad::Dispatch(, Chat, Char)

; 2. !NUM / {UNIT STATIS: OFF-DUTY}
Numpad::Dispatch(, Chat, Char)

; 3. NUM * {INQUIRE: REPORT REQUEST <TO OTHERS>}
Numpad::Dispatch(, Chat, Char)

; 4. !NUM * {CODE RED ALERT: REPORT EMERGENCY <FOR SELF>}
Numpad::Dispatch(, Chat, Char)

; 5. NUM (-) [Dash] {CLEAR STATUS <NON-LOCATION SPECIFIC>}
Numpad::Dispatch(, Chat, Char)

; 6. !NUM (-) [Dash or alternatively NUM 9] {CLEAR STATUS <LOCATION SPECIFIC>}
Numpad::Dispatch(, Chat, Char)

; 7. !NUM 7 {SITUATIONAL STATUS: UNIT RESPONSE}
Numpad::Dispatch(, Chat, Char)

; 8. !NUM 7 {UNIT ARRIVED}
Numpad::Dispatch(, Chat, Char)

; 9. !NUM 8 {ANTI-ROBOCOP VOCAL SUPPLEMENTION <CONVERSATIONAL>}
Numpad::Dispatch(, Chat, Char)

; 10. !NUM 8 {ANTI-ROBOCOP VOCAL SUPPLEMENTATION <REACTIONARY>}
Numpad::Dispatch(, Chat, Char)

; 11. !NUM 4 {SUBJECT INSTRUCTION: FIRST WARN}
Numpad::Dispatch(, Chat, Char)

; 12. !NUM 5 {SUBJECT INSTRUCTION: SECOND WARN}
Numpad::Dispatch(, Chat, Char)

; 13. !NUM 6 {SUBJECT INSTRUCTION: POST-SECOND WARN / ACTION RESPONSES}
Numpad::Dispatch(, Chat, Char)

; 14. !NUM 1 {SUBJECT INSTRUCTION: HALT}
Numpad::Dispatch(, Chat, Char)

; 15. !NUM 2 {SUBJECT STATUS: EVASION}
Numpad::Dispatch(, Chat, Char)

; 16. !NUM 3 {SUBJECT STATUS: EVADED}
Numpad::Dispatch(, Chat, Char)

; 17. !NUM 3 {SUBJECT STATUS: UNCOVERED / FOUND}
Numpad::Dispatch(, Chat, Char)

; 18. !NUM 0 {SITUATION: DISTURBANCE}
Numpad::Dispatch(, Chat, Char)

; 19. !NUM 0 {SITUATION: XEN-BASED DISTURBANCE}
Numpad::Dispatch(, Chat, Char)

; 20. !NUM DOT {PRIORITY ALERT: ASSAULT ON FUNCTIONARIES}
Numpad::Dispatch(, Chat, Char)

; 21. !NUM DOT {PRIORITY ALERT: HOSTILE FIREFIGHT / ANTI-CIVIL INCURSION}
Numpad::Dispatch(, Chat, Char)

; 22. !NUM ADD (+) {REPLY: YES / COPY}
Numpad::Dispatch(, Chat, Char)

; 23. !NUM ADD (+) {REPLY: NEGATIVE / ELABORATE}
Numpad::Dispatch(, Chat, Char)

*/


; Game hotkeys.
; #IfWinActive:: Garry's Mod ahk_class Valve001 ahk_exe hl2.exe
; Insert:: HashDecoder()

; The Hotkey Hotkey
^F7::
/*
	Gui, Add, Pic, w600 h-1 vPic +Border, % "HBITMAP:*" TheGuide.1
	Gui, Show
	
	
	Loop	{
		GuiControl, , Pic, % "HBITMAP:*" TheGuide[Mod(A_Index), Pics.Length())+1]
		Sleep, 10000
	}
	
	
	Sleep, 30000
	
	GuiClose:
	GuiEscape:
*/

	; Looks spooky but all it does is show the Hotkey layout lol

IfNotExist, %A_ScriptDir%\files\AutoHotKeyMap.exe
	{
	MsgBox % "Looks like the AutoHotKeyMap.exe was not found; perhaps you should check that all files from the current release Zip file thingy was properly extracted in their folder(s)!"
	}

IfExist, %A_ScriptDir%\files\AutoHotKeyMap.exe
	{
	Run, %A_ScriptDir%\files\AutoHotKeyMap.exe %A_ScriptFullPath%
	}

; Welcome message with tagline(s)!
MsgBox % "<:: Welcome to the Overwatch Automated Voiceliner, v." . Version . "! ::>`n`nSoftware is provided 'as is', without any liability or warranty. `nUse at own risk.`n`nYou should see a GMod icon that is on your Windows taskbar badge area.`n{Probably the bottom-right of your screen}`nIt represents this macro program. `n`nYou can press End to exit the program as well.`n`nHOTKEYS:`n`nPause Key: Freeze/Unfreeze the Program`nEnd: Self-Explanatory lmao`nCtrl + F5: Launch GMod (and connect to WN)`n`nInsert Key: Set OTA VOICELINES Mode.`nDel (Delete) Key: Set Civil Protection VOICELINES Mode.`n`nHome Key: Toggle Tagline DISPLAY Modes.`n`nCtrl + F7: Display Chat/Voiceline Hotkeys [buggy]`n`n`nYour taglines are:`n`n<:: OTA - " . tagline1a . "-" . tagline1b . " ::>`n`n<:: Civil Protection - " . tagline2a . "-" . tagline2b . " ::>"

return

/*

	/=======================================================================\
	| The Nexus Armory [Contains debug or previous approaches to voiceline parsing lol]
	| "I love ERP." -Thomas Newcastle
	|
	| VC [Group] Formatting [.txt, stored in same directory as script]:        
	| "voiceline,voiceline,voiceline"
	|
	| {if u do "voiceline, voiceline, voiceline", then voicelines will look    
	| like "/r voiceline          voiceline" lmao}
	|
	\=======================================================================/

Example of a good formatted list:

%A_WorkingDir%\voicelines\ota.txt:
apply,affirmative,sightlines
copy,copy that,boomer
bouncer,69 erp

*/

/*
	Approach 1 [] - Each line represents a voiceline group, use ", " as delimiting character and parse pre- or curr OTA function cycle

	Approach 2 [] - Parse & create individual voiceline group arrays and using each individual voiceline group as objects of which are stored within a object-oriented group-array, that is then stored inside of the 'master' OOP array that has the group-specific OOP arrays containing voiceline-arrays with each element of index containing exactly one voiceline to be used/parsed

	{Beta Debug-Run SUCCESS! yayyy} Approach 3 [full-alpha stage - tested, using approach 3b] - Make Approach much less complicated by just making voiceline group arrays, specific to group, but not contained within object-oriented program structure because that is mindboggling and butthole poop

	Approach 3b [alpha-moderate stage - to be tested] - Using a array of comma lists & List.ahk functions [ListItem(pos,list) for view]
*/





; Approaches 1 & 3
; VCGroup := [] ; HPR-1

/*
OTAVoicelines[e] := A_LoopField
OTAVoicelines[e, r] := A_LoopReadLine

P := 0 
; could just use OTAVoicelines.MaxIndex() but P is good since it spells out "ERP" haha lmao


Loop, Read, %A_AhkPath%\%A_WorkingDir%\voicelines\ota.txt
{
	Loop, parse, A_LoopReadLine, %A_Comma%
	{
		OTAVoicelines[P, %A_Index%] := %A_LoopField%
		P += 1
	}
	
	;OTAVoicelines[P] := A_LoopReadLine
}

; Explanation of above thingy lmao:
; OTAVoicelines[VoicelineGroup, VoicelinesInsideGroup]
; Starts from OTAVoicelines[0, 0] to OTAVoicelines[n, n]
*/

; Approach 3 - debug debug debug 
; ---
/*
Loop % P
{
	; VC := OTAVoicelines[A_Index]
	
	For idx, in P
	{
		debugcycle := 0

		For idx2, element in OTAVoicelines[P]
		{
			MsgBox % OTAVoicelines[P, idx2]
		}
		
		obama := idx
		obama += 1
		MsgBox % obama ; first run: ota[0] but obama = 1 as P is default-set to 0
	} 

	; MsgBox % "number " . %A_Index% . " burger king foot lettuce " . OTAVoicelines[A_INDEX] ; debug debug debug
}
*/
; ---

/*

---

For idx, element in OTAVoicelines
{
	; Debug purposes
	MsgBox % "Voiceline group #"
}

---

*/



/*
	/=======================================================================\
	|MMR Procedures & Radio Cohesion
	|"Rank Leader, reminder, 100 sterilized credits qualifies non-mechanical |reproduction simulation."
	\=======================================================================/
*/



MMR(G, Char)
{
	; full array elemental # of group-array
	;E := OTAVoicelines[Group].MaxIndex(1)
	Obama := G
	/*
	Loop %Group%
	{
			Barack := OTAVoicelines%A_Index%
			;MsgBox % "Bruh" . A_Index . OTAVoicelines%A_Index%
	}
	*/
	;OTAVCs = Group
	;Barack := ListItem(OTAVCs, OTAVoicelines.OTAVCs)
	;Obama -= 1
	if (Char == 2)
	{
		Barack := CivilProtectionVoicelines%Obama%
	}
	else
	{
		Barack := OTAVoicelines%Obama%
	}
	;MsgBox % Barack

	E := ListLen(Barack)
	;debug MsgBox % E
; redundant unused variable but its funny lol
; R := OTAVoicelines[Group].Length(1) 
	
; actual array (of actually existing) elemental # of group array
; P := OTAVoicelines[Group].Count(1) 

	; ERP haha lmao
	
	; case 1 - empty voiceline array
	If (E < 0)
	{
		MsgBox % "bruh u did not load in any voice lines lmfao moron L L L L L | Debug: " . E ; . R . P
		SoundPlay, files\Error.mp3
		return "[ERROR 1] "
	}

	/* note: edited out as the main OTAVoicelines array will be multidimensional
	; case 2 - delimiter issue which is a ','
	If (R != P)
	{
		MsgBox % "bruh u probably double-spaced a line or some shit cause it looks like one or more lines are empty wtf what r u doin u pp head lol | Debug: " . E . R . P
		SoundPlay,Error.mp3
		return "[ERROR 2] "
	}
	*/
	/*
	; case 0 - if there are no voicelines in the specified group lmao
	if (Obama < 0)
	{
		MsgBox % "wtf there are no voicelines in this group wtf what r u smokin bro | Debug: " . E ; . R . P
		SoundPlay,Error.mp3
		return "[ERROR 0] "
	}
	*/
	; because AHK arrays start from 1
	SlashRoll := 1
	Random, SlashRoll, 1, E

	; Prev1 is the voiceline group
	; Prev2 is the previous voiceline index number thingyz

	;if (Group == Prev1 and SlashRoll == Prev2) ; If current voiceline is the same as the previous voiceline and 
	
	PrevNum := 0

	;MsgBox % PrevNum
	
	if (Char == 2)
	{
		PrevNum := PrevGen2[G]
	}
	else
	{
		PrevNum := PrevGen1[G]
	}
	
	;MsgBox % PrevNum

	; Checks for consequetive repeats of voicelines per group of voicelines
	if (SlashRoll == PrevNum)
	{
		while (SlashRoll == PrevNum)
		{
			Random, SlashRoll, 1, E
		}
	}

	if (Char == 2)
	{
		; Sets Civil Protection VC group's previous randomly generated voiceline index
		PrevGen2[G] := SlashRoll
	}
	else
	{
		; Sets OTA VC group's previous randomly generated voiceline index
		PrevGen1[G] := SlashRoll
	}

		

	;Prev1 := Group
	;Prev2 := SlashRoll

	;rand debug test
	/*
	X := ListItem(1, Barack)
	MsgBox % X
	MsgBox % SlashRoll

	X := ListItem(0, Barack)
	MsgBox % X
	MsgBox % SlashRoll
	*/
	/* debug test

	butt := 5

	For idx69, in butt
	{
		SlashRoll2 := 0
		Random, SlashRoll2, 0, Obama
		MsgBox % OTAVoiceline[Group, SlashRoll2]
	}
	*/

	/* Redundant homebrew thing 
	Bruh := true
	For each, value in ListItem(SlashRoll, OTAVoiceline[Group])
	{
		if !(value == "")
		{
			bruh := false

			Break
		}
	}


	; case 3 - slashRoll, the randomly generated number for voiceline, does not exist kind of situation lel if (OTAVoiceline[Group, SlashRoll])
	if (Bruh != true)
	{
		ToolTip,wtf MMR procedure was bad rogue erotic strider roleplay engaged haha...,gameWidth/2,0
		SoundPlay,Error.mp3
		return "[ERROR 3] "
	}

	; else
	*/
	Z := ListItem(SlashRoll, Barack)
	return Z

	/*

	--- ignore lol

	; P = OTAVoiceLines[barack].MaxIndex() ; or element in OTAVoiceLines[barack] 
		

	*/
}

/*
1: normal, 
2: yell, 
3: whisper, 
4: radio normal, 
5: radio yell, 
6: radio normal; 
7: alien lmao, 
8: alien yell lmao, 
9: alien whisper lmao, 
10: LOOC idk why tho
11: OOC
*/


Cohesion(Chat)
{
	if (Chat < 0)
	{
		ToolTip,somehow u bypassed the first check for a non-positive chat lmao...,gameWidth/2,0
		SoundPlay, files\Error.mp3
		return 100
	}
	if (Chat == 1)
	{
		return ""
	}
	if (Chat == 2)
	{
		return "/y "
	}
	if (Chat == 3)
	{
		return "/w "
	}
	if (Chat == 4)
	{
		return "/r "
	}
	if (Chat == 5)
	{
		return "/ry "
	}
	if (Chat == 6)
	{
		return "/rw "
	}
	if (Chat == 7)
	{
		return "/ali "
	}
	if (Chat == 8)
	{
		return "/yali "
	}
	if (Chat == 9)
	{
		return "/wali "
	}
	if (Chat == 10)
	{
		return "/looc "
	}
	if (Chat == 11)
	{
		return "/ooc "
	}
	if (Chat > 11)
	{
		ToolTip,bruh chat type higher than eleven...,gameWidth/2,0
		SoundPlay, files\Error.mp3
		return 200
	}
}



/*
	/=======================================================================\
	|Overwatch Functions
	|For automated OTA epic memery.
	|TBA: Modify parameters to Dispatch(Group, Chat, Char, VoicelineCount)
	\=======================================================================/
*/



Dispatch(Group, Chat, Char)
{
	
	Menu,Tray,Icon, files\GmodActive.ico
	WinGetActiveStats,gameTitle,gameWidth,gameHeight,gameX,gameY
	;FormatTime, timeString, A_NowUTC,hh:mm:ss tt

	; the core programming
	; ---

	if (Group < 0)
	{
		ToolTip,wtf u somehow entered a negative number for VC group u headass...,gameWidth/2,0
		SoundPlay, files\Error.mp3
		return 1
	} 

	if (Chat < 0)
	{
		ToolTip,wtf u somehow entered a negative number for chat-type u headass...,gameWidth/2,0
		SoundPlay, files\Error.mp3
		return 2
	}

	E := Cohesion(Chat)

	R := Group

	if (Char == 2)
	{
		if (Group > 22)
		{
			if (Group == 50)
			{
				R := 2
			}
			else if (Group == 70)
			{
				R := 4
			}
			else if (Group == 130)
			{
				R := 6
			}
			else if (Group == 60)
			{
				R := 8
			}
			else if (Group == 30)
			{
				R := 17
			}
			else if (Group == 120)
			{
				R := 19
			}
			else if (Group == 40)
			{
				R := 21
			}
			else if (Group == 140)
			{
				R := 23
			}
		}
		else if (Group >= 5)
		{
			if (Group == 5)
			{
				R := 1
			}
			else if (Group == 7)
			{
				R := 3
			}
			else if (Group == 13)
			{
				R := 5
			}
			else if (Group == 6)
			{
				R := 7
			}
			else if (Group == 8)
			{
				R := 9
			}
			else if (Group == 16)
			{
				R := 10
			}
			else if (Group == 9)
			{
				R := 11
			}
			else if (Group == 10)
			{
				R := 12
			}
			else if (Group == 15)
			{
				R := 13
			}
			else if (Group == 12)
			{
				R := 18
			}
			;else if (Group == 11)
			;{
			;	R := bruh
			;}
			else if (Group == 14)
			{
				R := 22
			}
		}
		else if (Group <= 4)
		{
			if (Group == 2)
			{
				R := 14
			}
			else if (Group == 1)
			{
				R := 15
			}
			else if (Group == 3)
			{
				R := 16
			}
			else if (Group == 4)
			{
				R := 20
			}
		}
	}
	
/*
	;R -= 1
	R1 := "TAGLINE"
	;R2 := "UNIT NUMBER"
	R2 := "unit"
*/

	P := MMR(R, Char)
	
	/*

		i. If OTA (1, 1)
			a. initialize game window structures
			b. check group/chat < 0 [cases 1 and 2]
			c. then initialize E.R.P. variables
			c1. then let R equal 1 then minus 1 for 0, since arrays start at 0
			c2. E equals the returned prefix of message with radio/message/[L]OOC commands
			c3. P equals the returned randomly picked voiceline from group (technically) 0 {as stored index-wise in the VC array} [which is 1, the first VC group]
			d. Let VC equal the full message
			e. then loop:
				e1. press y
				e2. helpful info that says to stop pressing stuff for voice line
			ee....until Chatbox-open is confirmed

			f. then, after chatbox-open is confirmed, input/type the full VC 
			g. then press enter key
	*/

	;VC=% E . R1 . ";" . R2 . ";" . P
	;VC=% P

	if (TagSetting == 1)
	{
		if (Char == 1)
		{
			R1 := Ra1
			R2 := Ra2
			; R3 := Ra3	
		}

		if (Char == 2)
		{
			R1 := Rb1
			R2 := Rb2
			; R3 := Rb3
		}

		VC =% P
	
	; ---

		Loop {
			SendInput,y
			ToolTip,Opening chatbox (Attempt %A_Index%)...,gameWidth/2,0
			Sleep,100
		} until CheckForChatBox(false)
		SendInput,%E%
		SendInput,%R1%
		SendInput,;
		SendInput,%R2%;
		/*
		 SendInput,%R3%
		 SendInput,;
		*/
		SendInput,%VC%
		SendInput,{Enter}
	}
	else
	{
		VC =% E . P
		Loop {
			SendInput,y
			ToolTip,Opening chatbox (Attempt %A_Index%)...,gameWidth/2,0
			Sleep,100
		} until CheckForChatBox(false)
		SendInput,%VC%{Enter}
	}

	/*
	SendInput, %E%
	SendInput, %P%{Enter}
	*/
	
	Menu,Tray,Icon, files\Gmod.ico
	ToolTip
	return

}



/*
	/=======================================================================\
	|Civil Protection Functions
	|For automated Civil Protection epic memery.
	\=======================================================================/
*/

; insert Protec(Group, Chat, Char) thingy here [TBA]


/*
	/=======================================================================\
	|Utility Functions
	|For script testing & etc.
	\=======================================================================/
*/

/*
RepositionGameWindow(){
	LaunchGmod()
	WinMove,0,0
	return
}
*/

/*
SoundTest(){
	SoundPlay, files\Error.mp3
	Sleep,500
	SoundPlay, files\MacStartup.mp3
	Sleep,500
	SoundPlay, files\WindowsXPStartupSoundLOL.mp3
	Sleep,5500
	SoundPlay, files\Bruh.mp3
	return
}
*/

LaunchGmod(){
	IfWinNotExist,Garry's Mod ahk_class Valve001 ahk_exe hl2.exe
	{
		MsgBox, 36, Launch Garry's Mod?, There is no instance of Garry's Mod running.`nShould we launch it and connect to Willard Networks?
		IfMsgBox,Yes
			Run,steam://connect/178.239.172.10:27015/
		IfMsgBox,No
			return
	}
	IfWinExist,Garry's Mod ahk_class Valve001 ahk_exe hl2.exe
	{
		IfWinNotActive,Garry's Mod ahk_class Valve001 ahk_exe hl2.exe
		{
			ToolTip,Activating game window...,0,0
			WinActivate,Garry's Mod ahk_class Valve001 ahk_exe hl2.exe
			WinWaitActive,Garry's Mod ahk_class Valve001 ahk_exe hl2.exe
			;RepositionGameWindow()
			ToolTip
		}
	}
	return
}

/*
	/=======================================================================\
	|Main Functions
	\=======================================================================/
*/

/*
HoldMouseButton(mouseButton:="LButton"){
	;
	SendInput,{%mouseButton% Down}
	Sleep,64
	return
}
*/

CheckForChatBox(closeChat:=true){ ;Checks to see if chat box is active, returning true/false, and optionally closes it. (Returns false once sucessfully closed. Returns true if not able to close.)
	
	/*

	WinGetActiveStats,gameTitle,gameWidth,gameHeight,gameX,gameY
	ImageSearch,blahX,blahY,40+2,741,71+2,752, *80 ChatBoxActive.fw.png
	if !ErrorLevel {
		if closeChat {
			chatPresentTimestamp:=A_TickCount
			Loop {
				if ((A_TickCount - chatPresentTimestamp) > 30000){ ;Just return true if we weren't able to close the chatbox within 30s.
					return true
				}
				SendInput,{Esc}
				ToolTip,Closing chatbox (Attempt %A_Index%)...,gameWidth/2,0
				Sleep,2000
				ImageSearch,blahX,blahY,40+2,741,71+2,752, *80 ChatBoxActive.fw.png
			} until ErrorLevel
			ToolTip
			return false
		} else {
			return true
		}
	} else {
		return false
	}
	return
	
	note: not going to use this since its calibrated for 1600 x 900 and its way too hardcore for a hl2rp macro thing lmao
	
	*/

	; Sleep, 2000
	return true
}


;Initiates a /amputate message automatically, reporting PK.

Amputate()
{ 
	Menu,Tray,Icon, files\GmodActive.ico
	WinGetActiveStats,gameTitle,gameWidth,gameHeight,gameX,gameY
	FormatTime, timeString, A_NowUTC,hh:mm:ss tt

	ampMessageString=% "/amputate TimeStamp: " . timeString . " UTC by Overwatch"
	Loop {
		SendInput,y
		ToolTip,Opening chatbox (Attempt %A_Index%)...,gameWidth/2,0
		Sleep,2000
	} until CheckForChatBox(false)

	SendInput,%ampMessageString%{Enter}
	Menu,Tray,Icon, files\Gmod.ico
	ToolTip
	return
}

/*
	/=======================================================================\
	|TBA Functions
	|	lmao
	\=======================================================================/
*/

/*

;Might be used for encrypted OTA radio chatter

HashDecoder(){
	global ;Necessary to work with clipboard values.
	Clipboard := "" ;Clear the clipboard for use.
	;~ TODO: Work on adding number values to the caesar cipher (they remain unchanged by the process, so just pass them through).
	;~ TODO: Add a check to make sure our MaxNet command prompt is open, so we can actually copy/paste values to/from it. (Immediately do nothing if it's not open.)
	;~ TODO: Add parameter to allow for Caesar cipher shift index. It will always be 28/-1 on CC, but it seems to be random on CG Downtown.
		;~ Could the shift index be relative to some key, like time of hash generation, or unique to a host?
		;~ If a host has its own preset cshift index, what would be a good way to supply the appropriate cshift index for hash decode?
		;~ Would we end up with an InputBox prompting the user for the intended hostname/domain/IP to use an enumerated cshift index?
	encryptedString := "" ;Clear a variable for use.
	;~ Select everything in a text box, and hit Ctrl+C to copy it.
	SendInput,{Ctrl down}
	Sleep,64
	SendInput,a
	Sleep,64
	SendInput,c
	Sleep,64
	SendInput,{Ctrl up}
	ClipWait,2 ;Wait for the copied text to appear in the clipboard.
	
	;If we're just dealing with unicode character codes, jump straight to running it through a Chr().
	UnicodeRegEx := RegExMatch(Clipboard,"([\d]{1,3})+")
	if UnicodeRegEx
		goto UnicodeDecoder

	CaesarDecoder: ;Shift a set of characters by 28 (or -1) positions.
	key = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
	Loop, Parse, Clipboard
	{
		if A_LoopField == "A"
		{
			;Wrap uppercase Z's to A.
			encryptedString .= "Z"
			continue
		}
		if A_LoopField == "a"
		{
			;Wrap lowercase z's to a.
			encryptedString .= "z"
			continue
		}
		;~ Append the letter 28 positions down from the hashed letter to the encryptedString.
		encryptedString .= SubStr(key, Mod(Instr(key, A_LoopField, True) -1, StrLen(key)), 1)
	}
	goto, OutputString
	
	UnicodeDecoder:
	Loop, Parse, Clipboard,`,
	{
		encryptedString .= Chr(A_LoopField)
	}
	
	OutputString:
	;Paste the results of our decoded string, so we can decide what to do with it.
	Clipboard := encryptedString
	Sendinput,{Ctrl down}
	Sleep,64
	Sendinput,v
	Sleep,64
	Sendinput,{Ctrl up}
	Sleep,64
	return
}
*/


/*
NOTE: Not gonna use this stuff, so commenting it out lmao
TBA: For Encrypted OTA Radio Chatter {Maybe}

Base64Decode(ByRef Bin,Code,IsString = 0){ ;Simple Base64 decoding function.
	static CharSet := "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
	StringReplace Code, Code, =,, All
	Length := StrLen(Code), VarSetCapacity(Bin,Ceil((Length / 4) * 3),0), Index := 1, BinPos := 0
	Loop, % Length // 4
	Temp1 := ((InStr(CharSet,SubStr(Code,Index,1),True) - 1) << 18) | ((InStr(CharSet,SubStr(Code,Index + 1,1),True) - 1) << 12) | ((InStr(CharSet,SubStr(Code,Index + 2,1),True) - 1) << 6) | (InStr(CharSet,SubStr(Code,Index + 3,1),True) - 1), NumPut((Temp1 >> 16) | (((Temp1 >> 8) & 255) << 8) | ((Temp1 & 255) << 16),Bin,BinPos,"UInt"), Index += 4, BinPos += 3
	If (Length & 3)
	{
		Temp1 := ((InStr(CharSet,SubStr(Code,Index,1),True) - 1) << 18) | ((InStr(CharSet,SubStr(Code,Index + 1,1),True) - 1) << 12), NumPut(Temp1 >> 16,Bin,BinPos,"UChar")
		If (Length & 1)
			Temp1 |= ((InStr(CharSet,SubStr(Code,Index + 2,1),True) - 1) << 6), NumPut((Temp1 >> 8) & 255,Bin,BinPos + 1,"UChar")
	}
	If IsString
		VarSetCapacity(Bin,-1)
}

MNDecrypt(cipherText:="",key:=""){
	ANSIChars:=["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""
	," ","!","""","#","$","%","&","'","(",")","*","+",",","-",".","/","0","1","2","3","4","5","6","7","8","9",":",";","<","=",">","?"
	,"@","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","[","\","]","^","_"
	,"``","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","{","|","}","~"]
	CipherTextCharacterArray:=Object()
	KeyTextCharacterArray:=Object()
	DecryptedCharacterArray:=Object()
	cipherTextCharPosition:=0
	Loop Parse, cipherText ;Create an array of ANSI character codes from the ciphertext string.
	{
		CipherTextCharacterArray.Push(Asc(A_LoopField))
	}
	Loop Parse, key ;Create an array from the key string
	{
		KeyTextCharacterArray.Push(Asc(A_LoopField))
	}
	DecryptionStart:
	for index, keyIndex in KeyTextCharacterArray {
		cipherTextCharPosition++
		PlaintextANSI .= ANSIChars[(CipherTextCharacterArray[A_Index] + KeyTextCharacterArray[A_Index])] . ","
	}
	MsgBox, 64, Decoded String:, Ciphertext: %cipherText%`nKey: %key%`nPlaintextANSI: %PlaintextANSI%
	return
}

MNEncrypt(plainText:="",key:=""){
	;~ Adds a key string's characters' values to a plaintext string, and returns a ciphertext string.
	PlainTextCharacterArray:=Object()
	KeyTextCharacterArray:=Object()
	
	Loop Parse, plainText ;Create an array from the plaintext string.
	{
		PlainTextCharacterArray.Push(Asc(A_LoopField))
	}
	Loop Parse, key ;Create an array from the key string
	{
		KeyTextCharacterArray.Push(Asc(A_LoopField))
	}
return
}

Note: Above code is not used lol

*/
