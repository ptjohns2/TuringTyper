#RequireAdmin
#region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Run_Tidy=y
#endregion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <String.au3>
#include <ziggurat.au3>	;available at http://www.autoitscript.com/forum/topic/107301-ziggurat-method-for-normal-random-numbers/
;credits to andybiochem

$HotKeyStart_0 = 0
$HotKeyPause_0 = 0

$HotKeyStart_1 = "["
$HotKeyPause_1 = "]"

HotKeySet($HotKeyStart_1, "Start")
HotKeySet($HotKeyPause_1, "Pause")

#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

$default_input = ""

$default_sv_SendKeyDownDelay_mean = 40
$default_sv_SendKeyDownDelay_std_dev = 15

$default_sv_SendKeyDelay_mean = 25
$default_sv_SendKeyDelay_std_dev = 10

$default_sv_BetweenMessagesDelay_mean = 1000
$default_sv_BetweenMessagesDelay_std_dev = 100

$default_sv_TableSize = 10 * 1000

$default_h_omission_percent = 0.3
$default_h_omission_correction_percent = 80

$default_h_repeat_percent = 0.3
$default_h_repeat_correction_percent = 80

$default_h_correction_low = 0
$default_h_correction_high = 5

$default_h_pause_low = 100
$default_h_pause_high = 10 * 1000
$default_h_pause_percent = 2



#region ### START Koda GUI section ### Form=
$Form = GUICreate("TuringTyper", 255, 403, 483, 225)
$Input = GUICtrlCreateInput($default_input, 4, 4, 245, 21)
GUICtrlSetCursor(-1, 5)
$Label1 = GUICtrlCreateLabel("Hotkeys", 8, 32, 43, 17)
GUICtrlSetColor(-1, 0x0066CC)
$Label2 = GUICtrlCreateLabel("Start", 64, 32, 26, 17)
$input_hk_start = GUICtrlCreateInput($HotKeyStart_1, 90, 30, 119, 21)
GUICtrlSetCursor(-1, 5)
$Label3 = GUICtrlCreateLabel("Pause", 54, 56, 34, 17)
$input_hk_pause = GUICtrlCreateInput($HotKeyPause_1, 90, 54, 119, 21)
GUICtrlSetCursor(-1, 5)
$Label12 = GUICtrlCreateLabel("Speed and Variation (ms)", 8, 84, 122, 17)
GUICtrlSetColor(-1, 0x0066CC)
$Label5 = GUICtrlCreateLabel("Keypress Length", 8, 106, 83, 17)
$Label6 = GUICtrlCreateLabel("Delay between keys", 8, 130, 100, 17)
$Label7 = GUICtrlCreateLabel("Delay between messages", 8, 154, 125, 17)
$Label8 = GUICtrlCreateLabel("Average:", 142, 84, 47, 17)
$Label9 = GUICtrlCreateLabel("Std dev:", 198, 84, 44, 17)
$input_sv_SendKeyDownDelay_mean = GUICtrlCreateInput($default_sv_SendKeyDownDelay_mean, 136, 102, 53, 21)
$input_sv_SendKeyDownDelay_std_dev = GUICtrlCreateInput($default_sv_SendKeyDownDelay_std_dev, 192, 102, 53, 21)
$input_sv_SendKeyDelay_mean = GUICtrlCreateInput($default_sv_SendKeyDelay_mean, 136, 126, 53, 21)
$input_sv_SendKeyDelay_std_dev = GUICtrlCreateInput($default_sv_SendKeyDelay_std_dev, 192, 126, 53, 21)
$input_sv_BetweenMessagesDelay_mean = GUICtrlCreateInput($default_sv_BetweenMessagesDelay_mean, 136, 150, 53, 21)
$input_sv_BetweenMessagesDelay_std_dev = GUICtrlCreateInput($default_sv_BetweenMessagesDelay_std_dev, 192, 150, 53, 21)
$button_set_hotkeys = GUICtrlCreateButton("set", 216, 38, 33, 27)
$button_generate = GUICtrlCreateButton("generate", 192, 174, 55, 21)
$Label10 = GUICtrlCreateLabel("Humanization", 8, 224, 73, 17)
GUICtrlSetColor(-1, 0x0066CC)
$Label13 = GUICtrlCreateLabel("Size of random table", 8, 178, 100, 17)
$input_sv_TableSize = GUICtrlCreateInput($default_sv_TableSize, 136, 174, 53, 21)
$Label14 = GUICtrlCreateLabel("- Omissions", 8, 246, 57, 17)
$input_h_omission_percent = GUICtrlCreateInput($default_h_omission_percent, 68, 244, 29, 21)
$Label11 = GUICtrlCreateLabel("%", 98, 246, 12, 17)
$Label15 = GUICtrlCreateLabel("Corrections", 128, 246, 57, 17)
$input_h_omission_correction_percent = GUICtrlCreateInput($default_h_omission_correction_percent, 184, 244, 29, 21)
$Label16 = GUICtrlCreateLabel("%", 214, 246, 12, 17)
$Label17 = GUICtrlCreateLabel("- Repeats", 8, 272, 50, 17)
$input_h_repeat_percent = GUICtrlCreateInput($default_h_repeat_percent, 68, 270, 29, 21)
$Label18 = GUICtrlCreateLabel("%", 98, 272, 12, 17)
$Label19 = GUICtrlCreateLabel("Corrections", 128, 272, 57, 17)
$input_h_repeat_correction_percent = GUICtrlCreateInput($default_h_repeat_correction_percent, 184, 270, 29, 21)
$Label20 = GUICtrlCreateLabel("%", 214, 272, 12, 17)
$Label21 = GUICtrlCreateLabel("-- Corrected", 8, 298, 59, 17)
$input_h_correction_low = GUICtrlCreateInput($default_h_correction_low, 68, 296, 33, 21)
$Label22 = GUICtrlCreateLabel("to", 108, 298, 13, 17)
$input_h_correction_high = GUICtrlCreateInput($default_h_correction_high, 120, 296, 31, 21)
$Label23 = GUICtrlCreateLabel("chars after mistake", 160, 298, 93, 17)
$Label24 = GUICtrlCreateLabel("- Pause for", 8, 324, 58, 17)
$input_h_pause_low = GUICtrlCreateInput($default_h_pause_low, 68, 322, 31, 21)
$Label25 = GUICtrlCreateLabel("to", 104, 322, 13, 17)
$input_h_pause_high = GUICtrlCreateInput($default_h_pause_high, 116, 322, 39, 21)
$Label26 = GUICtrlCreateLabel("ms", 160, 324, 17, 17)
$input_h_pause_percent = GUICtrlCreateInput($default_h_pause_percent, 68, 346, 29, 21)
$Label27 = GUICtrlCreateLabel("% of messages", 100, 348, 74, 17)
$Label28 = GUICtrlCreateLabel("after", 38, 348, 25, 17)
$Progress = GUICtrlCreateProgress(6, 202, 242, 13)
$Label4 = GUICtrlCreateLabel("Status : ", 8, 378, 43, 17)
GUICtrlSetColor(-1, 0x0066CC)


$GUI_status_label = GUICtrlCreateLabel("", 52, 378, 196, 17)
GUICtrlSetColor(-1, 0x0066CC)

GUISetState(@SW_SHOW)
#endregion ### END Koda GUI section ###

GUICtrlSetData($GUI_status_label, "initializing")

$opt_sv_TableSize = GUICtrlRead($input_sv_TableSize)
Dim $arr_SendKeyDelay_sleep[$opt_sv_TableSize]
Dim $arr_SendKeyDownDelay_sleep[$opt_sv_TableSize]
Dim $arr_BetweenMessagesDelay_sleep[$opt_sv_TableSize]

$opt_sv_SendKeyDownDelay_mean = 0
$opt_sv_SendKeyDownDelay_st_dev = 0
$opt_sv_SendKeyDownDelay_min = 0 ;non-GUI

$opt_sv_SendKeyDelay_mean = 0
$opt_sv_SendKeyDelay_st_dev = 0

$opt_sv_BetweenMessagesDelay_mean = 0
$opt_sv_BetweenMessagesDelay_st_dev = 0

$GLOBAL_action_time = 5 * 600 ;non-GUI

$opt_GLOBAL_sleep_before_error_fix_MIN = 50 ;non-GUI
$opt_GLOBAL_sleep_before_error_fix_MAX = 200 ;non-GUI

$opt_h_omission_percent = 0
$opt_h_omission_correction_percent = 0

$opt_h_repeat_percent = 0
$opt_h_repeat_correction_percent = 0

$opt_h_correction_low = 0
$opt_h_correction_high = 0

$opt_h_pause_low = 0
$opt_h_pause_high = 0
$opt_h_pause_percent = 0

$rand_test_size = 0
$fix_length = 0

$Str = 0
Dim $arr_str[1]

Pause()


Func Start()
	GUISetState(@SW_ENABLE)
	GUICtrlSetData($Progress, 0)
	GUICtrlSetData($GUI_status_label, "Started")
	$opt_sv_SendKeyDownDelay_mean = GUICtrlRead($input_sv_SendKeyDownDelay_mean)
	$opt_sv_SendKeyDownDelay_st_dev = GUICtrlRead($input_sv_SendKeyDownDelay_std_dev)

	$opt_sv_SendKeyDelay_mean = GUICtrlRead($input_sv_SendKeyDelay_mean)
	$opt_sv_SendKeyDelay_st_dev = GUICtrlRead($input_sv_SendKeyDelay_std_dev)

	$opt_sv_BetweenMessagesDelay_mean = GUICtrlRead($input_sv_BetweenMessagesDelay_mean)
	$opt_sv_BetweenMessagesDelay_st_dev = GUICtrlRead($input_sv_BetweenMessagesDelay_std_dev)


	$opt_h_omission_percent = GUICtrlRead($input_h_omission_percent)
	$opt_h_omission_correction_percent = GUICtrlRead($input_h_omission_correction_percent)

	$opt_h_repeat_percent = GUICtrlRead($input_h_repeat_percent)
	$opt_h_repeat_correction_percent = GUICtrlRead($input_h_repeat_correction_percent)

	$opt_h_correction_low = GUICtrlRead($input_h_correction_low)
	$opt_h_correction_high = GUICtrlRead($input_h_correction_high)

	$opt_h_pause_low = GUICtrlRead($input_h_pause_low)
	$opt_h_pause_high = GUICtrlRead($input_h_pause_high)
	$opt_h_pause_percent = GUICtrlRead($input_h_pause_percent)


	$opt_sv_TableSize = GUICtrlRead($input_sv_TableSize)

	Gauss()
	GUICtrlSetData($GUI_status_label, "Started")
	$Str = GUICtrlRead($Input)
	$arr_str = _StringExplode($Str, "")

	$rand_test_size = 10 * 1000
	$fix_length = 0
	While 1
		Local $start = GetTime()
		For $i = 0 To (UBound($arr_str) - 1)
			;send next character from string

			;check if char or num is part of hotkey, if so disable temporarily
			Switch $arr_str[$i]
				Case $HotKeyStart_1
					HotKeySet($HotKeyStart_1)
				Case $HotKeyPause_1
					HotKeySet($HotKeyPause_1)
			EndSwitch

			;send char
			If Random(0, 1, 1) = 0 Then
				Start_omit($i)
			Else
				Start_repeat($i)
			EndIf

			Switch $arr_str[$i]
				Case $HotKeyStart_1
					HotKeySet($HotKeyStart_1, "Start")
				Case $HotKeyPause_1
					HotKeySet($HotKeyPause_1, "Pause")
			EndSwitch

		Next
		SendChar("{ENTER}")
		GUICtrlSetData($GUI_status_label, "Started - sleeping")
		Local $end = GetTime()
		Local $duration = $end - $start
		If $duration < $GLOBAL_action_time Then
			Sleep($GLOBAL_action_time - $duration)
		EndIf
		Sleep($arr_BetweenMessagesDelay_sleep[Random(0, $opt_sv_TableSize, 1)])
		GUICtrlSetData($GUI_status_label, "Started")
		Humanize()
		GUICtrlSetData($GUI_status_label, "Started")

	WEnd

EndFunc   ;==>Start

Func Start_omit($i)
	;omission
	$count = 0
	If Random(0, $rand_test_size) < (2 * $opt_h_omission_percent / 100) * $rand_test_size Then
		$fix_length = Random($opt_h_correction_low, $opt_h_correction_high, 1)

		;FIX ERROR
		If Random(0, $rand_test_size) < ($opt_h_omission_correction_percent / 100) * $rand_test_size Then
			GUICtrlSetData($GUI_status_label, "Started - fixing error")
			Sleep(Random($opt_GLOBAL_sleep_before_error_fix_MIN, $opt_GLOBAL_sleep_before_error_fix_MAX, 1))
			;send chars after omitted char
			For $j = 1 To $fix_length
				If $i + $j < UBound($arr_str) Then
					SendChar($arr_str[$i + $j])
					$count = $count + 1
				Else
					ExitLoop
				EndIf
			Next

			;backspace to fix omitted char
			Local $b
			For $b = 1 To $count
				SendChar("{BACKSPACE}")
			Next

			;send omitted char
			SendChar($arr_str[$i])
			GUICtrlSetData($GUI_status_label, "Started")
		EndIf

	Else ;;;;;SEND CHAR NORMALLY
		SendChar($arr_str[$i])
	EndIf
EndFunc   ;==>Start_omit


Func Start_repeat($i)
	;repeat
	$count = 0
	If Random(0, $rand_test_size) < (2 * $opt_h_repeat_percent / 100) * $rand_test_size Then
		$fix_length = Random($opt_h_correction_low, $opt_h_correction_high, 1)
		;repeat current char
		SendChar($arr_str[$i])
		SendChar($arr_str[$i])

		;FIX ERROR
		If Random(0, $rand_test_size) < ($opt_h_repeat_correction_percent / 100) * $rand_test_size Then
			;send chars after repeated char
			GUICtrlSetData($GUI_status_label, "Started - fixing error")
			Sleep(Random($opt_GLOBAL_sleep_before_error_fix_MIN, $opt_GLOBAL_sleep_before_error_fix_MAX, 1))
			For $j = 1 To $fix_length
				If $i + $j < UBound($arr_str) Then
					SendChar($arr_str[$i + $j])
					$count = $count + 1
				Else
					ExitLoop
				EndIf
			Next

			;backspace to remove chars after repeat
			Local $b
			For $b = 1 To $count
				SendChar("{BACKSPACE}")
			Next

			;remove repeated char
			SendChar("{BACKSPACE}")
			GUICtrlSetData($GUI_status_label, "Started")
		EndIf

	Else ;;;;;SEND CHAR NORMALLY
		SendChar($arr_str[$i])
	EndIf
EndFunc   ;==>Start_repeat


Func SendChar($char)
	AutoItSetOption("SendKeyDelay", Abs($arr_SendKeyDelay_sleep[Random(0, $opt_sv_TableSize - 1, 1)]))
	AutoItSetOption("SendKeyDownDelay", Abs($arr_SendKeyDownDelay_sleep[Random(0, $opt_sv_TableSize - 1, 1)]))
	Send($char, 0)
EndFunc   ;==>SendChar

Func GetTime()
	Return (@MSEC) + (@SEC * 1000) + (@MIN * 60 * 1000) + (@HOUR * 60 * 60 * 1000)
EndFunc   ;==>GetTime

Func Pause()
	GUISetState(@SW_ENABLE)
	GUICtrlSetData($GUI_status_label, "Paused")
	GUICtrlSetData($Progress, 0)

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $button_set_hotkeys
				Set_hotkeys()
				GUICtrlSetData($GUI_status_label, "Paused")
			Case $button_generate
				Gauss()
				GUICtrlSetData($GUI_status_label, "Paused")
		EndSwitch
	WEnd
EndFunc   ;==>Pause


Func Set_hotkeys()
	GUICtrlSetData($GUI_status_label, "Paused - setting hotkeys")
	GUISetState(@SW_DISABLE)

	$HotKeyStart_0 = $HotKeyStart_1
	$HotKeyPause_0 = $HotKeyPause_1

	$HotKeyStart_1 = GUICtrlRead($input_hk_start)
	$HotKeyPause_1 = GUICtrlRead($input_hk_pause)

	HotKeySet($HotKeyStart_0)
	HotKeySet($HotKeyPause_0)

	HotKeySet($HotKeyStart_1, "Start")
	HotKeySet($HotKeyPause_1, "Pause")

	GUISetState(@SW_ENABLE)
	ToolTip("Hotkeys set")
	Sleep(1000)
	ToolTip("")
EndFunc   ;==>Set_hotkeys

Func Gauss()
	GUICtrlSetData($GUI_status_label, "Generating random number table...")
	GUISetState(@SW_DISABLE)
	$opt_sv_TableSize = GUICtrlRead($input_sv_TableSize)
	Dim $arr_SendKeyDelay_sleep[$opt_sv_TableSize]
	Dim $arr_SendKeyDownDelay_sleep[$opt_sv_TableSize]
	Dim $arr_BetweenMessagesDelay_sleep[$opt_sv_TableSize]
	$progress_counter = 0
	$progress_check = 0
	$tmp = 0

	For $i = 0 To $opt_sv_TableSize - 1
		$progress_counter = Round($i / $opt_sv_TableSize * 100, 0)

		If $progress_counter > $progress_check Then
			GUICtrlSetData($Progress, $progress_counter)
		EndIf

		;SendKeyDelay
		$arr_SendKeyDelay_sleep[$i] = Round(_Random_Gaussian_Zig($opt_sv_SendKeyDelay_mean, $opt_sv_SendKeyDelay_st_dev), 0)

		;SendKeyDownDelay
		$tmp = -1
		While $tmp < $opt_sv_SendKeyDownDelay_min
			$tmp = Round(_Random_Gaussian_Zig($opt_sv_SendKeyDownDelay_mean, $opt_sv_SendKeyDownDelay_st_dev), 0)
		WEnd
		$arr_SendKeyDownDelay_sleep[$i] = $tmp

		;BetweenMessagesDelay_sleep
		$arr_BetweenMessagesDelay_sleep[$i] = Round(_Random_Gaussian_Zig($opt_sv_BetweenMessagesDelay_mean, $opt_sv_BetweenMessagesDelay_st_dev), 0)

		$progress_check = $progress_counter
	Next
	GUICtrlSetData($Progress, 0)

	GUISetState(@SW_ENABLE)
EndFunc   ;==>Gauss

Func Humanize()
	GUICtrlSetData($GUI_status_label, "Started - humanizing")
	If Random(0, $rand_test_size, 1) < ($opt_h_pause_percent / 100) * $rand_test_size Then
		Sleep(Random($opt_h_pause_low, $opt_h_pause_high, 1))
	EndIf
EndFunc   ;==>Humanize