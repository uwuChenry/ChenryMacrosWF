#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to asist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
#Persistent
#InstallKeybdHook
#InstallMouseHook
#KeyHistory 0
ListLines Off
SetBatchLines -1
SetKeyDelay, -1, -1
SetMouseDelay, -1, -1
SetControlDelay -1
SetWinDelay -1
#MaxHotkeysPerInterval 100000
Process, Priority,, High

