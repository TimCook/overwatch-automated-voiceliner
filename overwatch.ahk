
/*

<:: --- ::>

Overwatch Automated Voiceliner by Tim Cook & GitHub user TrevorLaneRay.
Modified to be compatible with a 1920x1080 game size.

v0.55


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

*/

#Include List.ahk
#SingleInstance,force
#InstallKeybdHook
#InstallMouseHook
Version = 0.55
Menu,Tray,Tip,Overwatch Automated Voiceliner by Tim Cook - Alpha v.%Version%
Menu,Tray,Icon, Sprites/Gmod.ico

/*
	/=======================================================================\
	|Administrator Privilege Check
	\=======================================================================/
*/
if !A_IsAdmin {
	SoundPlay,Sounds/AOLError.mp3
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
		SoundPlay,Sounds/Bruh.mp3
		ExitApp
	}

} else {
	MsgBox % "<:: Welcome to the Overwatch Automated Voiceliner, v." . Version . "! ::>`n`nSoftware is provided 'as is', without any liability or warranty. `nUse at own risk.`n`nYou should see a GMod icon that is on your Windows taskbar badge area.`n{Probably the bottom-right of your screen}`nIt represents this macro program. `nYou can press End to exit the program as well."
	SoundPlay,Sounds/WindowsXPStartupSoundLOL.mp3
}



/*
	/=======================================================================\
	|Initialization
	\=======================================================================/
*/



; Default chat variable indicating /r (4: radio normal)
Chat := 4
OTAVCs := 0
; Group := 14


OTAVoicelines := [] ; Overwatch Deployment

/*
; Approach 3b
Temp := ""
Voicelines := "ota.txt"
FileRead, Temp, %Voicelines%
OTAVoicelines := StrSplit(Temp, "`n")
/*
Loop, % OTAVoicelines.MaxIndex()
{
	MsgBox % OTAVoicelines[A_Index]
}
*/

; Resuming Approach 3

Loop, Read, ota.txt
{
	OTAVoicelines%OTAVCs% := A_LoopReadLine
	OTAVCs += 1
}

/*
	/=======================================================================\
	|le high-temperature level indicative 'keys'
	\=======================================================================/
*/


;~Global hotkeys.
Pause:: Pause
Home:: Reload
End:: ExitApp
^F5:: LaunchGmod()
^F6:: PingWillardServer()


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
+Numpad7::Chat := 1

; Chat Number 2 - 'Yell'
+Numpad8::Chat := 2

; Chat Number 3 - 'Whisper'
+Numpad9::Chat := 3

; Chat Number 4 - 'Radio - Normal'
+Numpad4::Chat := 4

; Chat Number 5 - 'Radio - Yell'
+Numpad5::Chat := 5

; Chat Number 6 - 'Radio - Whisper'
+Numpad6::Chat := 6

; Chat Number 7 - 'Alien - Normal'
+Numpad1::Chat := 7

; Chat Number 8 - 'Alien - Yell'
+Numpad2::Chat := 8

; Chat Number 9 - 'Alien - Whisper'
+Numpad3::Chat := 9

; Chat Number 10 - 'LOOC'
+Numpad0::Chat := 10

; Chat Number 11 - 'OOC'
+NumpadDot::Chat := 11


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

/*
Number 15, burger king footlettuce the last thing you want in your burgerking burger is someone elses foot fungus admittedly he had shoes on

Sector secure, no movement, position clear, reporting clear, report all radials, no viscon
*/
Numpad6::OTA(15, Chat)

; Number 16 - Bouncer, flare down
Numpad9::OTA(16, Chat)


;Game hotkeys.
;#IfWinActive:: Garry's Mod ahk_class Valve001 ahk_exe hl2.exe
;Insert:: HashDecoder()



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

*/

/*
	Approach 1 [] - Each line represents a voiceline group, use ", " as delimiting character and parse pre- or curr OTA function cycle

	Approach 2 [] - Parse & create individual voiceline group arrays and using each individual voiceline group as objects of which are stored within a object-oriented group-array, that is then stored inside of the 'master' OOP array that has the group-specific OOP arrays containing voiceline-arrays with each element of index containing exactly one voiceline to be used/parsed

	Approach 3 [full-alpha stage - tested, using approach 3b] - Make Approach much less complicated by just making voiceline group arrays, specific to group, but not contained within object-oriented program structure because that is mindboggling and butthole poop

	Approach 3b [alpha-moderate stage - to be tested] - Using a array of comma lists & List.ahk functions [ListItem(pos,list) for view]
*/





; Approaches 1 & 3
; VCGroup := [] ; HPR-1

/*
OTAVoicelines[e] := A_LoopField
OTAVoicelines[e, r] := A_LoopReadLine

P := 0 
; could just use OTAVoicelines.MaxIndex() but P is good since it spells out "ERP" haha lmao


Loop, Read, %A_AhkPath%\ota.txt
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



MMR(Group)
{
	; full array elemental # of group-array
	;E := OTAVoicelines[Group].MaxIndex(1)
	Obama := Group

	Loop %Group%
	{
			Barack := OTAVoicelines%A_Index%
			;MsgBox % "Bruh" . A_Index . OTAVoicelines%A_Index%
	}

	Obama -= 1
	;Barack := OTAVoicelines.Obama

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
		SoundPlay,Sounds/Error.mp3
		return "[ERROR 1] "
	}

	/* note: edited out as the main OTAVoicelines array will be multidimensional
	; case 2 - delimiter issue which is a ','
	If (R != P)
	{
		MsgBox % "bruh u probably double-spaced a line or some shit cause it looks like one or more lines are empty wtf what r u doin u pp head lol | Debug: " . E . R . P
		SoundPlay,Sounds/Error.mp3
		return "[ERROR 2] "
	}
	*/
	/*
	; case 0 - if there are no voicelines in the specified group lmao
	if (Obama < 0)
	{
		MsgBox % "wtf there are no voicelines in this group wtf what r u smokin bro | Debug: " . E ; . R . P
		SoundPlay,Sounds/Error.mp3
		return "[ERROR 0] "
	}
	*/
	; because arrays start from 0
	SlashRoll := 0
	Random, SlashRoll, 0, E

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
		SoundPlay,Sounds/Error.mp3
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
		SoundPlay,Sounds/Error.mp3
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
		ToolTip,bruh chat type higher than eleven...,gameWidth/2,0
		SoundPlay,Sounds/Error.mp3
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
		ToolTip,wtf u somehow entered a negative number for VC group u headass...,gameWidth/2,0
		SoundPlay,Sounds/Error.mp3
		return 1
	} 

	if (Chat < 0)
	{
		ToolTip,wtf u somehow entered a negative number for chat-type u headass...,gameWidth/2,0
		SoundPlay,Sounds/Error.mp3
		return 2
	}

	E := Cohesion(Chat)

	R := Group
	;R -= 1

	P := MMR(R)
	
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

	VC=% E . P


	; ---
	Loop {
		SendInput,y
		ToolTip,Opening chatbox (Attempt %A_Index%)...,gameWidth/2,0
		Sleep,100
	} until CheckForChatBox(false)
	;SendInput,%VC%{Enter}
	SendInput, %E%
	SendInput, %P%{Enter}
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

; insert Protec(Group, Chat) thingy here [TBA]


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

SoundTest(){
	SoundPlay,Sounds/Error.mp3
	Sleep,500
	SoundPlay,Sounds/AOLError.mp3
	Sleep,500
	SoundPlay,Sounds/WindowsXPStartupSoundLOL.mp3
	Sleep,5500
	SoundPlay,Sounds/Bruh.mp3
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
	return true
}


;Initiates a /amputate message automatically, reporting PK.

Amputate()
{ 
	Menu,Tray,Icon, Sprites/GmodActive.ico
	WinGetActiveStats,gameTitle,gameWidth,gameHeight,gameX,gameY
	FormatTime, timeString, A_NowUTC,hh:mm:ss tt

	ampMessageString=% "/amputate TimeStamp: " . timeString . " UTC by Overwatch"
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