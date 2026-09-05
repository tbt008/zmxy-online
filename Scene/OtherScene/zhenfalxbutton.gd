extends Button
#阵法左侧列表
@onready var pd: Label = $pd
var RealName
var zhenfaName: String
var Father
func _physics_process(delta: float) -> void:
	self.set_button_icon(load("res://Art/TwentyEightConstellations/" +str(zhenfaName) + ".png"))
	if PlayerData.player_data["已佩戴阵法"] == "":
		pd.visible = false
	else:
		if PlayerData.player_data["已佩戴阵法"] == zhenfaName:
			pd.visible = true
		else:
			pd.visible = false
func _on_pressed() -> void:
	match zhenfaName:
		"slz":
			RealName = "森罗阵"
		"lpz":
			RealName = "落魄阵"
		"tsz":
			RealName = "腾蛇阵"
		"tqz":
			RealName = "太清阵"
	var List = PlayerData.player_data[RealName]
	var Num: int = 0
	for i in List:
		if typeof(List[i]) == TYPE_DICTIONARY:
			Num += 1
	if Father != null:
		Father.CurrentZhenFaName = zhenfaName
		if Father.CurrentNum > Num:
			Father.CurrentNum = 1
		Father.OnChangeName()
		Father.AddZhenyanButton()
		
