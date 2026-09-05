extends Node2D
class_name ZLWRound2
@onready var lz_1: AnimatedSprite2D = $LZ_1
@onready var lz_2: AnimatedSprite2D = $LZ_2
@onready var lz_4: AnimatedSprite2D = $LZ_4
@onready var lz_3: AnimatedSprite2D = $LZ_3
@onready var lz_6: AnimatedSprite2D = $LZ_6
@onready var lz_5: AnimatedSprite2D = $LZ_5
@onready var lz_8: AnimatedSprite2D = $LZ_8
@onready var lz_7: AnimatedSprite2D = $LZ_7


var CurrentCount: int = 8:#改变这个，改变显示数量
	set(value):
		CurrentCount = value
		_onroundChange()
var Speed: float = 1:
	set(value):
		Speed = value
		Set_Speed()
var LunziList: Array = []
func _ready() -> void:
	LunziList = [lz_1,lz_2,lz_3,lz_4,lz_5,lz_6,lz_7,lz_8]
func _onroundChange():
	#print(CurrentCount)
	if CurrentCount == 6:
		lz_1.visible = true
		lz_2.visible = true
		lz_3.visible = true
		lz_4.visible = true
		lz_5.visible = true
		lz_6.visible = true
		lz_7.visible = false
		lz_8.visible = false		
	elif CurrentCount == 5:
		lz_1.visible = true
		lz_2.visible = false
		lz_3.visible = true
		lz_4.visible = true
		lz_5.visible = true
		lz_6.visible = true
		lz_7.visible = false
		lz_8.visible = false
	elif CurrentCount == 4:
		lz_1.visible = true
		lz_2.visible = false
		lz_3.visible = false
		lz_4.visible = true
		lz_5.visible = true
		lz_6.visible = true
		lz_7.visible = false
		lz_8.visible = false
	elif CurrentCount == 3:
		lz_1.visible = true
		lz_2.visible = false
		lz_3.visible = false
		lz_4.visible = false
		lz_5.visible = true
		lz_6.visible = true
		lz_7.visible = false
		lz_8.visible = false
	elif CurrentCount == 2:
		lz_1.visible = true
		lz_2.visible = false
		lz_3.visible = false
		lz_4.visible = false
		lz_5.visible = false
		lz_6.visible = true
		lz_7.visible = false
		lz_8.visible = false
	elif CurrentCount == 1:
		lz_1.visible = true
		lz_2.visible = false
		lz_3.visible = false
		lz_4.visible = false
		lz_5.visible = false
		lz_6.visible = false
		lz_7.visible = false
		lz_8.visible = false
	elif CurrentCount == 0:
		lz_1.visible = false
		lz_2.visible = false
		lz_3.visible = false
		lz_4.visible = false
		lz_5.visible = false
		lz_6.visible = false
		lz_7.visible = false
		lz_8.visible = false
	elif CurrentCount == 7:
		lz_1.visible = true
		lz_2.visible = true
		lz_3.visible = true
		lz_4.visible = true
		lz_5.visible = true
		lz_6.visible = true
		lz_7.visible = true
		lz_8.visible = false
	elif CurrentCount == 8:
		lz_1.visible = true
		lz_2.visible = true
		lz_3.visible = true
		lz_4.visible = true
		lz_5.visible = true
		lz_6.visible = true
		lz_7.visible = true
		lz_8.visible = true

func Set_Speed():
	var num: int = 0
	for i in LunziList:
		if Speed != 1:
			i.speed_scale = i.speed_scale * Speed
		else:
			i.speed_scale = 0.7
			num += 1


