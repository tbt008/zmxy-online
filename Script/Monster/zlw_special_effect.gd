extends Node2D
class_name ZLWRound
@onready var lunzi_4: AnimatedSprite2D = $Lunzi_4
@onready var lunzi_3: AnimatedSprite2D = $Lunzi_3
@onready var lunzi_1: AnimatedSprite2D = $Lunzi_1
@onready var lunzi_2: AnimatedSprite2D = $Lunzi_2
@onready var lunzi_5: AnimatedSprite2D = $Lunzi_5
@onready var lunzi_6: AnimatedSprite2D = $Lunzi_6

var CurrentCount: int = 6:#改变这个，改变显示数量
	set(value):
		CurrentCount = value
		_onroundChange()
var State: bool = false:#改变这个，改变显示位置false为走，true为其他
	set(value):
		State = value
		ChangePOSITION()
var Speed: float = 1:
	set(value):
		Speed = value
		Set_Speed()
var RoundPosition_1 = [Vector2(0,0),Vector2(0,0),Vector2(35,0),Vector2(60,0),Vector2(35,-100),Vector2(60,60)]
var RoundPosition_2 = [Vector2(0,-90),Vector2(0,-90),Vector2(50,-85),Vector2(-45,-135),Vector2(65,-130),Vector2(35,-160)]
var LunziList: Array = []
func _ready() -> void:
	LunziList = [lunzi_1,lunzi_2,lunzi_3,lunzi_4,lunzi_5,lunzi_6]
func _onroundChange():
	if CurrentCount == 6:
		lunzi_1.visible = true
		lunzi_2.visible = true
		lunzi_3.visible = true
		lunzi_4.visible = true
		lunzi_5.visible = true
		lunzi_6.visible = true
	elif CurrentCount == 5:
		lunzi_1.visible = true
		lunzi_2.visible = false
		lunzi_3.visible = true
		lunzi_4.visible = true
		lunzi_5.visible = true
		lunzi_6.visible = true
	elif CurrentCount == 4:
		lunzi_1.visible = true
		lunzi_2.visible = false
		lunzi_3.visible = false
		lunzi_4.visible = true
		lunzi_5.visible = true
		lunzi_6.visible = true
	elif CurrentCount == 3:
		lunzi_1.visible = true
		lunzi_2.visible = false
		lunzi_3.visible = false
		lunzi_4.visible = false
		lunzi_5.visible = true
		lunzi_6.visible = true
	elif CurrentCount == 2:
		lunzi_1.visible = true
		lunzi_2.visible = false
		lunzi_3.visible = false
		lunzi_4.visible = false
		lunzi_5.visible = false
		lunzi_6.visible = true
	elif CurrentCount == 1:
		lunzi_1.visible = true
		lunzi_2.visible = false
		lunzi_3.visible = false
		lunzi_4.visible = false
		lunzi_5.visible = false
		lunzi_6.visible = false
	elif CurrentCount == 0:
		lunzi_1.visible = false
		lunzi_2.visible = false
		lunzi_3.visible = false
		lunzi_4.visible = false
		lunzi_5.visible = false
		lunzi_6.visible = false
func ChangePOSITION():
	var count: int = 0
	var List: Array
	if State:
		List = RoundPosition_1
	else:
		List = RoundPosition_2
	for i in LunziList:
		i.position = List[count]
		count += 1

func Set_Speed():
	var num: int = 0
	var SpeedList = [-0.8,1.5,1.2,-1.4,1.8,3]
	for i in LunziList:
		if Speed != 1:
			i.speed_scale = i.speed_scale * Speed
		else:
			i.speed_scale = SpeedList[num]
			num += 1

