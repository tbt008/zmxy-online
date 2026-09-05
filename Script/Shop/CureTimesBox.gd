extends TextureRect
@onready var lpline: LineEdit = $LPDH/lpline
@onready var lhline: LineEdit = $LHDH/lhline
@onready var title_4: Label = $Title4
@onready var title_5: Label = $Title5
@onready var title_6: Label = $Title6

var lpTimes: int = 0
var lhTimes: int = 0
var TotalTimes: int = 0
var Lhdhvalue: int = 50000
func _physics_process(delta: float) -> void:
	TotalTimes = lhTimes + lpTimes
	title_4.text = "令牌可兑换次数：" + str(lpTimes)
	title_5.text = "灵魂可兑换次数：" + str(lhTimes)
	title_6.text = "总次数：" + str(TotalTimes)
func _on_lpline_text_changed(new_text: String) -> void:
	if int(new_text) > 0 and typeof(int(new_text)) == TYPE_INT:
		if int(new_text) <= int(PlayerData.get_item_data("smlp")):
			lpTimes = int(new_text)
		else:
			lpTimes = int(PlayerData.get_item_data("smlp"))


func _on_min_pressed() -> void:
	if int(PlayerData.get_item_data("smlp")) >= 1:
		lpTimes = 1
	else:
		lpTimes = 0


func _on_max_pressed() -> void:
	lpTimes = int(PlayerData.get_item_data("smlp"))


func _on_lhline_text_changed(new_text: String) -> void:
	if int(new_text) > 0 and typeof(int(new_text)) == TYPE_INT:
		if int(new_text) >= int(PlayerData.player_data["coin_num"] / Lhdhvalue):
			lhTimes = int(PlayerData.player_data["coin_num"] / Lhdhvalue)
			
		else:
			lhTimes = int(new_text)


func _on_lhmin_pressed() -> void:
	if int(PlayerData.player_data["coin_num"] / Lhdhvalue) >= 1:
		lhTimes = 1
	else:
		lhTimes = 0


func _on_lhmax_pressed() -> void:
	lhTimes = int(PlayerData.player_data["coin_num"] / Lhdhvalue)


func _on_dh_pressed() -> void:
	
	if TotalTimes > 0:
		
		if int(PlayerData.get_item_data("smlp")) < lpTimes:
			Global.AddMessageShow(Global.Windows_,"令牌不足！！",1.5,Vector2(470,300))
			return
		if int(PlayerData.player_data["coin_num"]) < int(lhTimes * Lhdhvalue):
			Global.AddMessageShow(Global.Windows_,"灵魂不足！！",1.5,Vector2(470,300))
			return
		PlayerData.remove_dj("smlp",PlayerData.get_dj_page("smlp"),lpTimes)
		PlayerData.player_data["coin_num"] -= int(lhTimes * Lhdhvalue)
		PlayerData.player_data["购买次数"] += TotalTimes
		MemoryClass.保存游戏(Global.cd_path)
		Global.AddMessageShow(Global.Windows_,"成功兑换" + str(TotalTimes) + "次购买次数！！",1.5,Vector2(470,300))
	else:
		Global.AddMessageShow(Global.Windows_,"兑换次数为0！！",1.5,Vector2(470,300))


func _on_close_pressed() -> void:
	queue_free()
