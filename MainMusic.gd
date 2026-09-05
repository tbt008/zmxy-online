extends Node
var MyMainMusic
func RemoveMusic():
	if MyMainMusic != null:
		MyMainMusic.queue_free()
func ADDMusic():
	if MainSet.set_data["music"] == 1:
		if MyMainMusic != null:
			MyMainMusic.queue_free()
		MyMainMusic = Global.addBGM_(self,"res://Music/MainSceneMusic/zmxy_1BGM.mp3")
	elif MainSet.set_data["music"] == 2:
		if MyMainMusic != null:
			MyMainMusic.queue_free()
		MyMainMusic = Global.addBGM_(self,"res://Music/MainSceneMusic/zmxy_2BGM.ogg")
	elif MainSet.set_data["music"] == 3:
		if MyMainMusic != null:
			MyMainMusic.queue_free()
		MyMainMusic = Global.addBGM_(self,"res://Music/MainSceneMusic/44_begin.mp3")
	elif MainSet.set_data["music"] == 4:
		if MyMainMusic != null:
			MyMainMusic.queue_free()
		MyMainMusic = Global.addBGM_(self,"res://Music/MainSceneMusic/zmxy4bg.mp3")
