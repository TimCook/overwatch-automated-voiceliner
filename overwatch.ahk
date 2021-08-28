
/*

<:: --- ::>

Overwatch Automated Voiceliner by Tim Cook & GitHub user TrevorLaneRay.
Modified to be compatible with a 1920x1080 game size.

v0.1


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

*/

#SingleInstance,force
#InstallKeybdHook
#InstallMouseHook
Version = 0.1
Menu,Tray,Tip,Overwatch Automated Voiceliner v.%Version%
Menu,Tray,Icon, Sprites/Gmod.ico

/*
	/=======================================================================\
	|Administrator Privilege Check
	\=======================================================================/
*/
if !A_IsAdmin {
	;Ask user if we want to relaunch the script as Administrator.
	MsgBox, 36, Relaunch as admin?, The script needs to be run as administrator in order to send keyboard presses and mouse input.`n`nShall we relaunch the script as administrator for you?`n(If not`, we'll just exit the script. {The source code is literally available to view if you think its a virus lmao, up to u})
	IfMsgBox,Yes
	{
		;Launch a new instance of the script, this time with admin privilege.
		Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
		;Close this unprivileged instance, as it's no longer needed.
		ExitApp
	}
	IfMsgBox,No
	{
		ExitApp
	}
}

/*
	/=======================================================================\
	|Hotkeys
	|Joystick Keys Legend:
	|	Joy1: A
	|	Joy2: B
	|	Joy3: X
	|	Joy4: Y
	|	Joy5: LShoulder
	|	Joy6: RShoulder
	|	Joy7: Select
	|	Joy8: Start
	|	Joy9: LThumbClick
	|	Joy10: RThumbClick
	|	vk07sc000: Guide Button (Does this even work in Windows 10?)
	\=======================================================================/
*/

;~ Function Test Hotkeys:
;~ F12:: MNDecrypt("22decb4e5469a3798b6c51bb5cfefbb2","EroticFartRoleplay") ;Max password length is 19char?
;~ Plaintext: "Plaintext phrase to encode."
;~ Key: "EroticFartRoleplay"
;~ Ciphertext: "22decb4e5469a3798b6c51bb5cfefbb2"

;Global hotkeys.
Pause:: Pause
Home:: Reload
End:: ExitApp
F5:: LaunchGmod()
F6:: PingWillardServer()


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

*/

; make sure OTA() or something else sets this variable
; Default chat variable indicating /r (4: radio normal)
Chat = 4


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

/*
Number 15, burger king footlettuce the last thing you want in your burgerking burger is someone elses foot fungus admittedly he had shoes on

Sector secure, no movement, position clear, reporting clear, report all radials, no viscon
*/
Numpad6::OTA(15, Chat)

; Number 16 - Bouncer, flare down
Numpad9::OTA(16, Chat)


;Game hotkeys.
#IfWinActive:: Garry's Mod ahk_class Valve001 ahk_exe hl2.exe
;NumpadDiv:: HashDecoder()
NumpadSub:: HoldMouseButton("LButton") ;Holds the left mouse button down.
F7:: DropBalance(true) ;Drops currently held /balance, and optionally makes a quick call to cops.
F8:: ReportDeathAsRDM(false) ;Manual hotkey to report RDM.

F10:: BitMinerFueler() ;Keeps bitminer fueled. (This is just a stupid fueler; it won't defend your base for you. Don't run this AFK.)
F11:: VCMinerManager(true,false) ;Triggers a single-use manual restart of VCMiners.
+F11:: VCMinerManager(false,true,"timed") ;Starts AFK management of VCMiners (for extended breaks like laundry, officework, etc).
F12:: AutoReloadWeapon()
^F12:: AutoAmmoBuyer(2000)


/*

	/=======================================================================\
	| The Nexus Armory
	| "I love ERP." -Thomas Newcastle
	|
	| VC [Group] Formatting [.txt, stored in same directory as script]:        | "voiceline,voiceline,voiceline"
	|
	| {if u do "voiceline, voiceline, voiceline", then voicelines will look    | like "/r voiceline          voiceline" lmao}
	|
	\=======================================================================/

*/

/*
	Approach 1 [] - Each line represents a voiceline group, use ", " as delimiting character and parse pre- or curr OTA function cycle

	Approach 2 [] - Parse & create individual voiceline group arrays and using each individual voiceline group as objects of which are stored within a object-oriented group-array, that is then stored inside of the 'master' OOP array that has the group-specific OOP arrays containing voiceline-arrays with each element of index containing exactly one voiceline to be used/parsed

	Approach 3 [alpha] - Make Approach much less complicated by just making voiceline group arrays, specific to group, but not contained within object-oriented program structure because that is mindboggling and butthole poop
*/

OTAVoicelines := [] ; Overwatch Deployment

; VCGroup := [] ; HPR-1

OTAVoicelines[e] := A_LoopField
OTAVoicelines[e, r] := A_LoopReadLine

P := 0 ; could just use OTAVoicelines.MaxIndex() but P is good since it spells out "ERP" haha lmao

Loop, Read, %A_AhkPath%\ota.txt
{
	Loop, parse, A_LoopReadLine, %A_Comma%
	{
		OTAVoicelines[P, %A_Index%] := %A_LoopField%
		P += 1
	}
	
	;OTAVoicelines[P] := A_LoopReadLine
}

; OTAVoicelines[VoicelineGroup, VoicelinesInsideGroup]
; Starts from OTAVoicelines[0, 0] to OTAVoicelines[n, n]

;debug debug debug 
; ---

Loop % P
{
	; VC := OTAVoicelines[A_Index]
	
	For idx, P
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

MMR(Group)
{
	E = OTAVoicelines[Group].MaxIndex(1)
	R = OTAVoicelines[Group].Length(1)
	P = OTAVoicelines[Group].Count(1)

	; ERP haha lmao
	
	; case 1 - empty voiceline array
	If (E < 0)
	{
		MsgBox % "bruh u did not load in any voice lines lmfao moron L L L L L"
		return "[ERROR 1] "
	}

	; case 2 - delimiter issue which is a ','
	If (R != P)
	{
		MsgBox % "bruh u probably double-spaced a line or some shit cause it looks like one or more lines are empty wtf what r u doin u pp head lol"
		return "[ERROR 2] "
	}

	Obama := R
	Obama += -1 

	; case 0 - if there are no voicelines in the specified group lmao
	if (Obama < 0)
	{
		MsgBox % "wtf there are no voicelines in this group wtf what r u smokin bro"
		return "[ERROR 0] "
	}

	; because arrays start from 0

	Random, SlashRoll, 0, Obama

	; debug test

	butt := 5

	For idx69, butt
	{
		SlashRoll2 := 0
		Random, SlashRoll2, 0, Obama
		MsgBox % OTAVoiceline[Group, SlashRoll2]
	}

	Bruh := true
	For each, value in OTAVoiceline[Group, SlashRoll]
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
		MsgBox % "wtf MMR procedure was bad, rogue erotic strider roleplay engaged haha"
		return "[ERROR 3] "
	}

	; else

	return OTAVoiceline[Group, SlashRoll]

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
		MsgBox % "somehow u bypassed the first check for a non-positive chat lmao"
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
		return "/aliy "
	}
	if (Chat == 9)
	{
		return "/aliw "
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
		MsgBox % "bruh chat type higher than eleven"
		return 200
	}
}



/*
	/=======================================================================\
	|Overwatch Functions
	|For automated OTA epic memery.
	|TBA: Modify parameters to OTA(Group, Chat, VoicelineCount)
	\=======================================================================/
*/



OTA(Group, Chat)
{
	
	Menu,Tray,Icon, Sprites/GmodActive.ico
	WinGetActiveStats,gameTitle,gameWidth,gameHeight,gameX,gameY
	;FormatTime, timeString, A_NowUTC,hh:mm:ss tt

	; the core programming
	; ---

	if (Group < 0)
	{
		;ampMessageString=% "[[ brb afk"
		MsgBox % "wtf u somehow entered a fuckin negative number for VC group, u headass"
		return 1
	} 

	if (Chat < 0)
	{
		MsgBox % "wtf u somehow entered a fuckin negative number for chat-type, u headass"
		return 2
	}

	E := Cohesion(Chat)

	R := Group
	R += -1

	P := MMR(R)
	
	/*

		If OTA (1, 1)
			initialize game window structures
			check group/chat < 0 [cases 1 and 2]
			then initialize E.R.P. variables
			then let R equal 1 then minus 1 for 0, since arrays start at 0
			E equals the returned prefix of message with radio/message/[L]OOC commands
			P equals the returned randomly picked voiceline from group (technically) 0 {as stored index-wise in the VC array} [which is 1, the first VC group]
			Let VC equal the full message
			then loop:
				press y
				helpful info that says to stop pressing stuff for voice line
			...until Chatbox-open is confirmed

			then, after chatbox-open is confirmed, input/type the full VC then press enter key
	*/

	VC=% E . P


	; ---
	Loop {
		SendInput,y
		ToolTip,Opening chatbox (Attempt %A_Index%)...,gameWidth/2,0
		Sleep,2000
	} until CheckForChatBox(false)
	SendInput,%VC%{Enter}
	Menu,Tray,Icon, Sprites/Gmod.ico
	ToolTip
	return

}

/*
	/=======================================================================\
	|Civil Protection Functions
	|For automated Civil Protection epic memery.
	\=======================================================================/
*/




/*
	/=======================================================================\
	|Utility Functions
	|For script testing & etc.
	\=======================================================================/
*/

ImageSearchTest(){
	WinGetActiveStats,gameTitle,gameWidth,gameHeight,gameX,gameY
	;Note the "+2" on the coords - this is due to the windowed mode of the game having an offset of 2px on the x-axis...
	;If pulling coordinates from screenshots, make sure to take this into account.
	ImageSearch,blahX,blahY,737+2,467,863+2,483, *150 Sprites/SpriteFileName.fw.png
	if !ErrorLevel
		ToolTip,Found at %blahX%`,%blahY%,gameWidth/2,0
	if ErrorLevel
		ToolTip,NOT FOUND,gameWidth/2,0
	return
}

RepositionGameWindow(){
	LaunchGmod()
	WinMove,0,0
	return
}

SoundTest(){
	SoundPlay,Sounds/InceptionNoise.mp3
	return
}

PingWillardServer(){
	;Fire up a quick command propmpt, pinging the game server until closed.
	;Useful to quickly figure out if the server is reachable from clientside.
	Run,cmd /C "ping 178.239.172.10 -n -1"
	return
}

LaunchGmod(){ ;Checks if Gmod is running, and if not, offers to launch it. If the window is present, but hidden, it will bring it to the front, and snap it to the top-left corner of the screen.
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
			RepositionGameWindow()
			ToolTip
		}
	}
	return
}

CheckIfDisconnected(reconnect:=false,irrelevantDisconnection:=false){
	WinGetActiveStats,gameTitle,gameWidth,gameHeight,gameX,gameY
	ImageSearch,blahX,blahY,631+2,464,776+2,473, *80 Sprites/LostConnectionToServer.fw.png
	if !ErrorLevel {
		SoundPlay,Sounds/InceptionNoise.mp3
		if reconnect {
			Run,steam://connect/178.239.172.10:27015/
			;TODO: Add functionality to determine that we actually make it back into the game after attempting to reconnect
			if !irrelevantDisconnection { ;Return true even if we were able to reconnect.
				return true
			} else {
				return false
			}
		} else {
			return true
		}
	} else {
		return false
	}
	return
}

/*
	/=======================================================================\
	|Main Functions
	\=======================================================================/
*/
HoldMouseButton(mouseButton:="LButton"){
	;Holds down specified mouse button. Great for mining with a pickaxe or repairing a car, since it requires you to hold down the mouse button for a long time.
	SendInput,{%mouseButton% Down}
	Sleep,64
	return
}

CheckForChatBox(closeChat:=true){ ;Checks to see if chat box is active, returning true/false, and optionally closes it. (Returns false once sucessfully closed. Returns true if not able to close.)
	
	/*

	WinGetActiveStats,gameTitle,gameWidth,gameHeight,gameX,gameY
	ImageSearch,blahX,blahY,40+2,741,71+2,752, *80 Sprites/ChatBoxActive.fw.png
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
				ImageSearch,blahX,blahY,40+2,741,71+2,752, *80 Sprites/ChatBoxActive.fw.png
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
	return false
}

CheckIfDead(respawn:=false, irrelevantDeath:=false,reportDeathToAdmins:=false){
	;~ Checks if player is dead, returning true/false. If so, optionally respawn.
	;~ (Returns false once successfully respawned. Returns true if unable to respawn.
	;~ irrelevantDeath argument will optionally return true even if we respawn. Optionally reports death as RDM to admins.)
	WinGetActiveStats,gameTitle,gameWidth,gameHeight,gameX,gameY
	ImageSearch,blahX,blahY,693+2,414,905+2,441, *80 Sprites/YouAreDeadPendingRespawn.fw.png
	if !ErrorLevel {
		;~ Scare the player to get their attention back on the game window.
		SoundPlay,Sounds/InceptionNoise.mp3
		if respawn {
			deathTimestamp:=A_TickCount
			ToolTip,Waiting for respawn timer...,gameWidth/2,0
			Loop { ;Wait for the respawn timer...
				ImageSearch,blahX,blahY,737+2,467,863+2,483, *150 Sprites/YouAreDeadReadyToRespawn.fw.png
			} until !ErrorLevel
			ToolTip,Attempting to respawn...,gameWidth/2,0
			Loop { ;Press Space until we respawn. Bail out if we can't respawn within 30s.
				if ((A_TickCount - deathTimestamp) >= 30000) { ;Just return true if we weren't able to respawn within 30s.
					if reportDeathToAdmins
						ReportDeathAsRDM(false)
					return true
				}
				SendInput,{Space}
				Sleep,2000
				ImageSearch,blahX,blahY,693+2,414,905+2,441, *80 Sprites/YouAreDeadPendingRespawn.fw.png
			} until ErrorLevel
			ToolTip
			if !irrelevantDeath {
				if reportDeathToAdmins
					ReportDeathAsRDM(false)
				return true
			} else {
				if reportDeathToAdmins
					ReportDeathAsRDM(false)
				return false
			}
		} else {
			if reportDeathToAdmins
				ReportDeathAsRDM(false)
			return true
		}
	} else {
		if !irrelevantDeath {
			if reportDeathToAdmins
				ReportDeathAsRDM(false)
			return false
		} else {
			if reportDeathToAdmins
				ReportDeathAsRDM(false)
			return true
		}
	}
	return
}

Amputate(indicateAFK:=true){ ;Initiates a /amputate message automatically, reporting PK.
	;~ Requires that player is not AFK
	
	Menu,Tray,Icon, Sprites/GmodActive.ico
	WinGetActiveStats,gameTitle,gameWidth,gameHeight,gameX,gameY
	FormatTime, timeString, A_NowUTC,hh:mm:ss tt
	if indicateAFK {
		ampMessageString=% "[[ brb afk"
	} else {
		ampMessageString=% "/amputate " . timeString . " UTC by Overwatch"
	}
	Loop {
		SendInput,y
		ToolTip,Opening chatbox (Attempt %A_Index%)...,gameWidth/2,0
		Sleep,2000
	} until CheckForChatBox(false)
	SendInput,%ampMessageString%{Enter}
	Menu,Tray,Icon, Sprites/Gmod.ico
	ToolTip
	return
}

/* Note: might use for something else idk lmao
DropBalance(callPolice:=false){ ;A quick-response money dropper for use in mugging scenarios. Optionally places a quick call to police.
	Menu,Tray,Icon, Sprites/GmodActive.ico
	SendInput,{NumpadDiv}
	Loop { ;Open chatbox.
		if CheckForChatBox(false)
			break
		SendInput,y
		Sleep,1000
	}
	Loop { ;Find our balance in chat. (Note that this uses the first appearance of a /balance message. TODO: rework to use the latest /balance message.)
		ImageSearch,balanceX,balanceY,45+2,576,173+2,705,*80 Sprites/BalanceChatMessage.fw.png
	} until !ErrorLevel
	MouseClick,Left,balanceX+143,balanceY+5,2
	Sleep,256
	SendInput,{LCtrl Down}
	Sleep,64
	SendInput,c
	Sleep,64
	SendInput,{LCtrl Up}
	balanceValue:=SubStr(Clipboard,2)
	MouseClick,Left,100,746
	Sleep,256
	SendInput,/dropmoney %balanceValue%{Enter}
	Sleep,1025
	SendInput,{NumpadDiv}
	if callPolice{
		SendInput,5
		Sleep,64
		MouseClick,Left
		Sleep,128
		MouseClick,Right
		Loop {
			ImageSearch,ePhoneTitleX,ePhoneTitleY,734+2,408,763+2,417, *150 Sprites/PhoneMenuTitle.fw.png
		} until !ErrorLevel
		Sleep,64
		MouseClick,Left,ePhoneTitleX+67,ePhoneTitleY+103
		Sleep,128
		SendInput,2
		Sleep,64
		MouseClick,Left
		return
	}
	Menu,Tray,Icon, Sprites/Gmod.ico
	return
}
*/

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


/*
	/=======================================================================\
	|Beta Functions (Beware - here be dragons.)
	|	Stuff that's currently being thought over, and likely horribly broken in places.
	\=======================================================================/
*/

/*
NOTE: Not gonna use this stuff, so commenting it out lmao

AutoAmmoBuyer(purchaseDelay:=2000){ ;Annoyed by the delay on buying ammo from the F4 menu? ...*slaps roof* This baby can hold up to 100 magazines.
	;~ NOTE: You can use the following command to bind the purchose of a desired ammo from the F4 list:
	;~ bind i "say /buyammo 7"
	;~ (This, for example, would buy the seventh ammo in the F4>Ammo list. (In this case, Big Rifle Ammo.))
	Loop{
		ToolTip,Purchasing Ammo...(x%A_Index%),gameWidth/2,0
		SendInput,i
		ToolTip,Waiting...(x%A_Index%),gameWidth/2,0
		Sleep, purchaseDelay
	}
	return
}

AutoReloadWeapon(){ ;Keeps an eye on our weapon's ammo, immediately triggering a reload if the magazine is empty.
	WinGetActiveStats,gameTitle,gameWidth,gameHeight,gameX,gameY
	WatchAmmoCount:
	ToolTip,Waiting to reload...,gameWidth/2,0
	Loop{
		ImageSearch,blahX,blahY,1300-10,853-10,(1300+165)+10,(853+40)+10, *Trans0xFF00FF *10 Sprites/EmptyMagazine.fw.png
	} until !ErrorLevel
	;~ Problem here is if we check for a "0" immediately to the left of the magazine's count, we would end up thinking we have no ammo when we have a multiple of 10 spare magazines.
	;~ We instead run a looped ImageSearch to make sure we actually reload, and bail out if we couldn't successfully reload within 6 seconds.
	;~ (I assume 6 seconds is the rough average time it takes to reload a weapon. In this case, an M27 IAR. Change if desired.)
	ToolTip,Reloading...,gameWidth/2,0
	SendInput,R
	reloadTime := A_TickCount
	Loop{ ;Wait here until we actually end up with ammo.
		if ((A_TickCount - reloadTime) >= 6000) { ;Bail out if it's been more than six seconds since we've tried to reload.
			MsgBox, 48, Out of ammo?, Looks like we ran out of ammo to reload with.`nWe'll reload the script now.
			Reload
		}
		ImageSearch,blahX,blahY,1300-10,853-10,(1300+165)+10,(853+40)+10, *Trans0xFF00FF *10 Sprites/EmptyMagazine.fw.png
	} until ErrorLevel
	goto,WatchAmmoCount
	return
}

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
	/*
		Subtracts (or does it add?) a key string's characters' values from a ciphertext string, and returns the resulting plaintext.
		How do we wrap the array to make sure our character codes stay within 32-126? Mod()? If <>?
			Hydrogen's MNEncrypt DOES include the control characters like NUL, SOH, STX, ETX, etc in the math. We just don't notice because it's Base64'd output.
			...Was Hydrogen only intending on using MNEncrypt to cipher "." and 0-9 with A-Za-z key phrases?
			...No need to worry about there being control characters? Just Base64 the string, and be done with it?
		The math of adding/subtracting the characters' values to/from each other doesn't add up. Something else, simple, is being done.
			Could there be a stupidly-simple offset somewhere, just to throw us off? Hydrogen's smart like that.
		Will have to expect a Base64 string, decode it directly into a plaintext variable, then run a string parse loop on each character of the string.
			Then we have to figure out the relation between the Key and the Ciphertext.
				We know the key has a RELATIVE effect on the text, but it doesn't explain the irregularity in the pattern of (attempted) decoded text.
			Will need to do additional experimenting with Hydro's MNEncrypt to deduce what the relation is.
	*/
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

/*