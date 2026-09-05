extends Button
var add_equ_box
var get_item_name
var qh_level: int
var pp
var wx = []
var EQ_prop = {}

func _physics_process(_delta: float) -> void:
	pp = get_tree().get_root().get_mouse_position() - Vector2(430,250)
	if add_equ_box != null:
		add_equ_box.position = pp
func _on_pressed() -> void:
	if PlayerData.CheckCanUsePage("装备列表") == 0:
		Global.AddMessageShow(Global.get_parent_(self,5),"背包已满，无法卸下！！",1.5,Vector2(80,0))			
		return
	match str(self.name):
		"wq":
			if PlayerData.player_data["武器"].size() != 0:
				var name_ = PlayerData.player_data["武器"][0]["名字"]
				var ql = PlayerData.player_data["武器"][0]["强化等级"]
				EQ_prop = PlayerData.player_data["武器"][0]["Data"]
				PlayerData.add_zb(name_,ql,EQ_prop)
			else:
				set_button_icon(load("res://Art/BackPack/wq.png"))
			PlayerData.player_data["武器"].clear()
		"fj":
			if PlayerData.player_data["防具"].size() != 0:
				var name_ = PlayerData.player_data["防具"][0]["名字"]
				var ql = PlayerData.player_data["防具"][0]["强化等级"]
				EQ_prop = PlayerData.player_data["防具"][0]["Data"]
				PlayerData.add_zb(name_,ql,EQ_prop)
			else:
				set_button_icon(load("res://Art/BackPack/fj.png"))
			PlayerData.player_data["防具"].clear()
		"sp":
			if PlayerData.player_data["饰品"].size() != 0:
				var name_ = PlayerData.player_data["饰品"][0]["名字"]
				var ql = PlayerData.player_data["饰品"][0]["强化等级"]
				EQ_prop = PlayerData.player_data["饰品"][0]["Data"]
				PlayerData.add_zb(name_,ql,EQ_prop)
			else:
				set_button_icon(load("res://Art/BackPack/sp.png"))
			PlayerData.player_data["饰品"].clear()
		"tx":
			if PlayerData.player_data["头衔"].size() != 0:
				var name_ = PlayerData.player_data["头衔"][0]["名字"]
				var ql = PlayerData.player_data["头衔"][0]["强化等级"]
				EQ_prop = PlayerData.player_data["头衔"][0]["Data"]
				PlayerData.add_zb(name_,ql,EQ_prop)
			else:
				set_button_icon(load("res://Art/BackPack/tx.png"))
			PlayerData.player_data["头衔"].clear()
		"sz":
			if PlayerData.player_data["时装"].size() != 0:
				var name_ = PlayerData.player_data["时装"][0]["名字"]
				var ql = PlayerData.player_data["时装"][0]["强化等级"]
				EQ_prop = PlayerData.player_data["时装"][0]["Data"]
				PlayerData.add_zb(name_,ql,EQ_prop)
			else:
				set_button_icon(load("res://Art/BackPack/sz.png"))
			PlayerData.player_data["时装"].clear()
		"cb":
			if PlayerData.player_data["翅膀"].size() != 0:
				var name_ = PlayerData.player_data["翅膀"][0]["名字"]
				var ql = PlayerData.player_data["翅膀"][0]["强化等级"]
				EQ_prop = PlayerData.player_data["翅膀"][0]["Data"]
				PlayerData.add_zb(name_,ql,EQ_prop)
			else:
				set_button_icon(load("res://Art/BackPack/cb.png"))
			PlayerData.player_data["翅膀"].clear()
		"fb":
			if Global.FB_CD <= 0:
				if PlayerData.player_data["法宝"].size() != 0:
					var name_ = PlayerData.player_data["法宝"][0]["名字"]
					var ql = PlayerData.player_data["法宝"][0]["强化等级"]
					var wx = PlayerData.player_data["法宝"][0]["五行"]
					EQ_prop = PlayerData.player_data["法宝"][0]["Data"]
					PlayerData.add_fb(name_,ql,wx,EQ_prop)
				else:
					set_button_icon(load("res://Art/BackPack/fb.png"))
				PlayerData.player_data["法宝"].clear()
			else:
				Global.AddMessageShow(Global.get_parent_(self,5),"当前法宝正在使用，无法更换！！",1.5,Vector2(80,0))			
	qh_level = 0
	RoleProp.get_equ_last_pro()
	RoleProp.get_last_prop()
	MemoryClass.保存游戏(Global.cd_path)

func _on_mouse_entered() -> void:
	var path_name = icon.resource_path.split("/AllItems/")[1].split(".")[0]
	if  path_name == "sp" or path_name == "wq" or path_name == "fj" or path_name == "fb" or path_name == "sz"  or path_name == "cb"  or path_name == "tx" :
		return
	if str(self.name) == "cb" or str(self.name) == "sz" or str(self.name) == "tx":
		if Global.get_parent_(self,3).get_icon_name(self) != "empty" and add_equ_box == null:
			pp = get_tree().get_root().get_mouse_position()
			add_equ_box = Global.add_equ_propeties_box(Global.get_parent_(self,3),pp,get_item_name,qh_level,wx,EQ_prop)
			add_equ_box.position = pp
	else:	
		if Global.get_parent_(self,5).get_icon_name(self) != "empty" and add_equ_box == null:
			pp = get_tree().get_root().get_mouse_position() - Vector2(420,110)
			add_equ_box = Global.add_equ_propeties_box(Global.get_parent_(self,5),pp,get_item_name,qh_level,wx,EQ_prop)
			add_equ_box.position = pp

func _on_mouse_exited() -> void:
	if add_equ_box != null :
		add_equ_box.queue_free()
