extends Node2D
class_name BasicBackPack
@onready var message_text: Label = $background/infomation/message_text
@onready var hp: Label = $background/infomation/hp
@onready var mp: Label = $background/infomation/mp
@onready var att: Label = $background/infomation/att
@onready var lucky: Label = $background/infomation/lucky
@onready var def: Label = $background/infomation/def
@onready var mdef: Label = $background/infomation/mdef
@onready var crit: Label = $background/infomation/crit
@onready var miss: Label = $background/infomation/miss
@onready var ehp: Label = $background/infomation/ehp
@onready var show_backpack: Button = $background/show_backpack
@onready var emp: Label = $background/infomation/emp
@onready var first: TextureButton = $background/infomation/first
@onready var second: TextureButton = $background/infomation/second
@onready var exp_bar: TextureProgressBar = $background/infomation/exp_bar
@onready var wings: AnimatedSprite2D = $background/Wings

@onready var exp_text: Label = $background/infomation/exp_bar/exp_text
@onready var backpack: Node2D = $backpack
@onready var wq: Button = $background/infomation/equ_/HBoxContainer/wq
@onready var fj: Button = $background/infomation/equ_/HBoxContainer/fj
@onready var sp: Button = $background/infomation/equ_/VBoxContainer/sp
@onready var fb: Button = $background/infomation/equ_/VBoxContainer/fb
@onready var zdl: Label = $background/Zdlnc/zdl
@onready var name_1: LineEdit = $background/Zdlnc/name
@onready var Role_body = $background/RoleBody
@onready var Role_Eq = $background/RoleEquipment
@onready var number_1: TextureRect = $background/infomation/leve_background/Level_Show/Number_1
@onready var number_2: TextureRect = $background/infomation/leve_background/Level_Show/Number_2
@onready var tx: Button = $background/infomation/tx
@onready var sz: Button = $background/infomation/sz
@onready var cb: Button = $background/infomation/cb
@onready var wing_show: Label = $background/infomation/WingsShow/WingShow
@onready var head_show: Label = $background/infomation/HeadShow/HeadShow
@onready var WingsShowButton: Button = $background/infomation/WingsShow
@onready var HeadShowButton: Button = $background/infomation/HeadShow

var add_equ_box
var back_pack_jm
var message
var current_pro_page: int = 1
var show_back_pack = true
func _ready() -> void:
	IniShowWingTxButton()
	match int(PlayerData.player_data["Myself"]):
		1:
			$background/Player.play("wait")
		2:
			$background/Player.play("wait2")
		3:
			$background/Player.play("wait3")
		4:
			$background/Player.play("wait4")
		5:
			$background/Player.play("wait5")
	Global.is_in_ldl = false
	MemoryClass.main_dq()
	if int(MemoryClass.get_cd_number()) <= 6:
		name_1.text = str(MainSet.set_data["name" + str(MemoryClass.get_cd_number())])
	else:
		name_1.text = str(MainSet.set_data["其他存档"][str(MemoryClass.get_cd_number())]["name"])
	$background/gy.self_modulate = Color(1,1,1,0.5)
	get_level()
func _physics_process(_delta: float) -> void:
	
	if PlayerData.player_data["翅膀显示"]:
		wings.modulate = Color(1,1,1,1)
	else:
		wings.modulate = Color(1,1,1,0)
	onEqchange()
	SetWingsOffset()
	#set_RoleWwings()
	set_backpack_properies()
	if Global.BoxCount > 0:
		Global.BoxCount -= 1

func get_level():
	var LevelStr = str(RoleProp.baseroleprop.Level)
	var LevelList = LevelStr.split("")
	if LevelList.size() < 2 and LevelList.size() > 0:
		var ll = int(LevelList[0])
		$background/infomation/leve_background/Level_Show.position = Vector2(-15,-15)
		number_1.texture = load("res://Art/AllNumber/Level/Level_" + str(ll) +".png")
	elif LevelList.size() == 2:
		var ll_1 = int(LevelList[0])
		var ll_2 = int(LevelList[1])
		$background/infomation/leve_background/Level_Show.position = Vector2(-35,-15)
		number_1.texture = load("res://Art/AllNumber/Level/Level_" + str(ll_1) +".png")
		number_2.texture = load("res://Art/AllNumber/Level/Level_" + str(ll_2) +".png")
func set_backpack_properies():
	zdl.text = ""
	set_icon()
	if show_back_pack == false:
		show_backpack.text = "展示背包"
	else:
		show_backpack.text = "收起背包"
	if current_pro_page == 1:
		message_text.text = "角色属性详情第一页"
		$background/infomation/hp/Hp_tt.text = "生命"
		$background/infomation/mp/Mp_tt.text = "魔法"
		$background/infomation/att/Att_tt.text = "攻击"
		$background/infomation/def/Def_tt.text = "物防"
		$background/infomation/lucky/Lucky_tt.text = "幸运"
		$background/infomation/mdef/Mdef_tt.text = "魔防"
		$background/infomation/crit/Crit_tt.text = "暴击"
		$background/infomation/miss/misstt.text = "闪避"
		$background/infomation/ehp/ehp_tt.text = "回血"
		$background/infomation/emp/emp_tt.text = "回魔"
		hp.text = str(int(RoleProp.roleprop.Hp)) + '/' + str(int(RoleProp.roleprop.SHp))
		mp.text = str(int(RoleProp.roleprop.Mp)) + '/' + str(int(RoleProp.roleprop.SMp))
		att.text = str(int(RoleProp.roleprop.power))
		def.text = str(int(RoleProp.roleprop.Def)) + '(' + str(snapped(RoleProp.roleprop.Def / float(RoleProp.roleprop.Def + 250),0.001) * 100) + "%)"
		crit.text = str(RoleProp.roleprop.Crit) + '(' + str(snapped(RoleProp.roleprop.Crit / float(RoleProp.roleprop.Crit + 100),0.001) * 100) + "%)"
		miss.text = str(RoleProp.roleprop.Miss) + '(' + str(snapped(RoleProp.roleprop.Miss / float(RoleProp.roleprop.Miss + 100),0.001) * 100) + "%)"
		ehp.text = str(RoleProp.roleprop.R_hp)
		emp.text = str(RoleProp.roleprop.R_mp)
		mdef.text = str(int(RoleProp.roleprop.Mdef)) + '(' + str(snapped(RoleProp.roleprop.Mdef / float(RoleProp.roleprop.Mdef + 250),0.001) * 100) + "%)"
		lucky.text = str(RoleProp.roleprop.Lucky) + '(' + str(snapped(RoleProp.roleprop.Lucky / float(RoleProp.roleprop.Lucky + 50),0.001) * 100) + "%)"
	elif current_pro_page == 2:
		message_text.text = "角色属性详情第二页"
		$background/infomation/hp/Hp_tt.text = "命中"
		$background/infomation/mp/Mp_tt.text = "韧性"
		$background/infomation/att/Att_tt.text = "吸血"
		$background/infomation/def/Def_tt.text = "暴免"
		$background/infomation/lucky/Lucky_tt.text = "破甲"
		$background/infomation/mdef/Mdef_tt.text = "破魔"
		$background/infomation/crit/Crit_tt.text = ""
		$background/infomation/miss/misstt.text = ""
		$background/infomation/ehp/ehp_tt.text = ""
		$background/infomation/emp/emp_tt.text = ""
		hp.text = str(RoleProp.roleprop.Htarget)
		mp.text = str(RoleProp.roleprop.Toughness)
		att.text = str(RoleProp.roleprop.vampirism * 100) + "%"
		def.text = str(RoleProp.roleprop.CritReduce)
		lucky.text = str(RoleProp.roleprop.ar)
		mdef.text = str(RoleProp.roleprop.sp)
		ehp.text = ""
		emp.text = ""
		crit.text = ""
		miss.text = ""
	exp_bar.value = float(RoleProp.baseroleprop.exp) / RoleProp.baseroleprop.max_exp
	exp_text.text = str(RoleProp.baseroleprop.exp) + '/' + str(RoleProp.baseroleprop.max_exp)
func set_icon():
	if PlayerData.player_data["武器"].size() != 0:
		wq.get_item_name = PlayerData.player_data["武器"][0]["名字"]
		wq.set_button_icon(load_(PlayerData.player_data["武器"][0]["名字"]))
		wq.qh_level = PlayerData.player_data["武器"][0]["强化等级"]
		wq.EQ_prop = PlayerData.player_data["武器"][0]["Data"]
	else:
		wq.set_button_icon(load_("wq"))
	if PlayerData.player_data["防具"].size() != 0:
		fj.get_item_name = PlayerData.player_data["防具"][0]["名字"]
		fj.set_button_icon(load_(PlayerData.player_data["防具"][0]["名字"]))
		fj.qh_level = PlayerData.player_data["防具"][0]["强化等级"]
		fj.EQ_prop = PlayerData.player_data["防具"][0]["Data"]
	else:
		fj.set_button_icon(load_("fj"))
	if PlayerData.player_data["饰品"].size() != 0:
		sp.get_item_name = PlayerData.player_data["饰品"][0]["名字"]
		sp.set_button_icon(load_(PlayerData.player_data["饰品"][0]["名字"]))
		sp.qh_level = PlayerData.player_data["饰品"][0]["强化等级"]
		sp.EQ_prop = PlayerData.player_data["饰品"][0]["Data"]
	else:
		sp.set_button_icon(load_("sp"))
	if PlayerData.player_data["头衔"].size() != 0:
		tx.get_item_name = PlayerData.player_data["头衔"][0]["名字"]
		tx.set_button_icon(load_(PlayerData.player_data["头衔"][0]["名字"]))
		tx.qh_level = PlayerData.player_data["头衔"][0]["强化等级"]
		tx.EQ_prop = PlayerData.player_data["头衔"][0]["Data"]
	else:
		tx.set_button_icon(load_("tx"))
	if PlayerData.player_data["时装"].size() != 0:
		sz.get_item_name = PlayerData.player_data["时装"][0]["名字"]
		sz.set_button_icon(load_(PlayerData.player_data["时装"][0]["名字"]))
		sz.qh_level = PlayerData.player_data["时装"][0]["强化等级"]
		sz.EQ_prop = PlayerData.player_data["时装"][0]["Data"]
	else:
		sz.set_button_icon(load_("sz"))
	if PlayerData.player_data["翅膀"].size() != 0:
		cb.get_item_name = PlayerData.player_data["翅膀"][0]["名字"]
		cb.set_button_icon(load_(PlayerData.player_data["翅膀"][0]["名字"]))
		cb.qh_level = PlayerData.player_data["翅膀"][0]["强化等级"]
		cb.EQ_prop = PlayerData.player_data["翅膀"][0]["Data"]
	else:
		cb.set_button_icon(load_("cb"))
	if PlayerData.player_data["法宝"].size() != 0:
		fb.get_item_name = PlayerData.player_data["法宝"][0]["名字"]
		fb.set_button_icon(load_(PlayerData.player_data["法宝"][0]["名字"]))
		fb.qh_level = PlayerData.player_data["法宝"][0]["强化等级"]
		fb.EQ_prop = PlayerData.player_data["法宝"][0]["Data"]
		fb.wx = PlayerData.player_data["法宝"][0]["五行"]
	else:
		fb.set_button_icon(load_("fb"))
func load_(name_):
	#res://Art/BackPack/AllItems/
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc
func _on_first_pressed() -> void:
	current_pro_page = 1


func _on_second_pressed() -> void:
	current_pro_page = 2


func _on_close_pressed() -> void:
	queue_free()

func _on_show_backpack_pressed() -> void:
	if show_back_pack == false:
		show_back_pack = true
	elif show_back_pack == true:
		show_back_pack = false
func add_text(text,parent):
	if message == null:
		message = Global.AddBasicMonmentInfo(backpack,text,get_global_mouse_position() + Vector2(90,40))
func remove_text():
	if message != null:
		message.queue_free()
func _on_hp_mouse_entered() -> void:
	if current_pro_page == 1:
		#Global.AddBasicMonmentInfo(self,"生命：归零后角色死亡。")
		add_text("生命：角色的健康力，归0后角色死亡。",hp)
	else:
		add_text("命中：与闪避以减法相抵扣。",hp)
func _on_hp_mouse_exited() -> void:
	remove_text()
func _on_mp_mouse_entered() -> void:
	if current_pro_page == 1:
		add_text("魔法：角色使用技能所需消耗的能量，低于需求则无法释放技能。",mp)
	else:
		add_text("韧性：与幸运以减法相抵扣。",mp)
func _on_mp_mouse_exited() -> void:
	remove_text()
func _on_att_mouse_entered() -> void:
	if current_pro_page == 1:
		add_text("攻击：角色造成一切伤害的基本来源。",att)
	else:
		add_text("吸血：造成直接伤害时，恢复该倍率×最终伤害的生命值。",att)
func _on_att_mouse_exited() -> void:
	remove_text()
func _on_lucky_mouse_entered() -> void:
	if current_pro_page == 1:
		add_text("幸运：提升角色造成暴击时的暴击伤害。",lucky)
	else:
		add_text("破甲：与物理防御以减法相抵扣。",lucky)
func _on_lucky_mouse_exited() -> void:
	remove_text()
func _on_def_mouse_entered() -> void:
	if current_pro_page == 1:
		add_text("物防：减免角色受到的物理伤害。",def)
	else:
		add_text("暴免：与暴击以减法相抵扣。",def)
func _on_def_mouse_exited() -> void:
	remove_text()
func _on_mdef_mouse_entered() -> void:
	if current_pro_page == 1:
		add_text("魔防：减免角色受到的魔法伤害。",mdef)
	else:
		add_text("破魔：与魔防以减法相抵扣。",mdef)
func _on_mdef_mouse_exited() -> void:
	remove_text()
func _on_crit_mouse_entered() -> void:
	if current_pro_page == 1:
		add_text("暴击：提升角色造成更高伤害的几率。",crit)
	else:
		pass
func _on_crit_mouse_exited() -> void:
	remove_text()
func _on_miss_mouse_entered() -> void:
	if current_pro_page == 1:
		add_text("闪避：提升角色无视伤害的几率（闪避时视为霸体效果）。",miss)
	else:
		pass
func _on_miss_mouse_exited() -> void:
	remove_text()
func _on_ehp_mouse_entered() -> void:
	if current_pro_page == 1:
		add_text("回血：角色每秒恢复该数值的生命。",ehp)
	else:
		pass
func _on_ehp_mouse_exited() -> void:
	remove_text()
func _on_emp_mouse_entered() -> void:
	if current_pro_page == 1:
		add_text("回魔：角色每秒恢复该数值的魔法。",emp)
	else:
		pass
func _on_emp_mouse_exited() -> void:
	remove_text()
func get_icon_name(obj):
	var name_ = str(obj.icon.resource_path.split("AllItems/")[1].split(".")[0])
	return name_


func _on_name_text_changed(new_text: String) -> void:
	if int(MemoryClass.get_cd_number()) <= 6:
		MainSet.set_data["name" + str(MemoryClass.get_cd_number())] = new_text
	else:
		MainSet.set_data["其他存档"][str(MemoryClass.get_cd_number())]["name"] = new_text
	MemoryClass.main_bc()



func set_RoleWwings():
	var WingsList = PlayerData.player_data["翅膀"]
	if WingsList.size() <= 0:
		wings.visible = false
		wings.play("empty")
		return
	var get_WingsName = WingsList[0]["名字"]
	wings.play(get_WingsName)
	return

func onEqchange():
	var WQ: String
	var Fj: String
	
	if PlayerData.player_data["幻化列表"]["武器"] == "":
		if PlayerData.player_data["武器"].size() == 0:
			WQ = "Empty"
		else:
			WQ = str(PlayerData.player_data["武器"][0]["名字"])
	else:
		WQ = str(PlayerData.player_data["幻化列表"]["武器"])
	ChangeEq(WQ)
	if PlayerData.player_data["幻化列表"]["防具"] == "":	
		if PlayerData.player_data["时装"].size() == 0:		
			if PlayerData.player_data["防具"].size() == 0:
				Fj = "Empty"
			else:
				Fj = str(PlayerData.player_data["防具"][0]["名字"])
		else:
			Fj = str(PlayerData.player_data["时装"][0]["名字"])
	else:
		Fj = str(PlayerData.player_data["幻化列表"]["防具"])
	Fj = Global.GetName(Fj)
	ChangeBody(Fj)
	var WingsList
	
	if PlayerData.player_data["幻化列表"]["翅膀"] == "":
		if PlayerData.player_data["翅膀"].size() == 0:
			wings.visible = false
			WingsList = "empty"
		else:
			wings.visible = true
			WingsList = PlayerData.player_data["翅膀"][0]["名字"]
	else:
		print(PlayerData.player_data["幻化列表"]["翅膀"])
		wings.visible = true
		WingsList = PlayerData.player_data["幻化列表"]["翅膀"]
	$background/Wings.play(WingsList)
func ChangeBody(name_):
	Role_body.texture = Global.LoadRole1Body(name_)
func ChangeEq(name_):
	Role_Eq.texture = Global.LoadRole1EQ(name_)

func IniShowWingTxButton():
	if PlayerData.player_data["翅膀显示"]:
		WingsShowButton.set_button_icon(load("res://Art/BackPack/IsChoose.png"))
		wing_show.text = "显示"
	else:
		wing_show.text = "不显示"
		WingsShowButton.set_button_icon(load("res://Art/BackPack/NoChoose.png"))
	if PlayerData.player_data["头衔显示"]:
		head_show.text = "显示"
		HeadShowButton.set_button_icon(load("res://Art/BackPack/IsChoose.png"))
	else:
		head_show.text = "不显示"
		HeadShowButton.set_button_icon(load("res://Art/BackPack/NoChoose.png"))
func _on_wings_show_pressed() -> void:
	if PlayerData.player_data["翅膀显示"]:
		PlayerData.player_data["翅膀显示"] = false
		MemoryClass.保存游戏(Global.cd_path)
		WingsShowButton.set_button_icon(load("res://Art/BackPack/NoChoose.png"))
		wing_show.text = "不显示"
	else:
		PlayerData.player_data["翅膀显示"] = true
		MemoryClass.保存游戏(Global.cd_path)
		wing_show.text = "显示"
		WingsShowButton.set_button_icon(load("res://Art/BackPack/IsChoose.png"))

func _on_head_show_pressed() -> void:
	if PlayerData.player_data["头衔显示"]:
		HeadShowButton.set_button_icon(load("res://Art/BackPack/NoChoose.png"))
		PlayerData.player_data["头衔显示"] = false
		MemoryClass.保存游戏(Global.cd_path)
		head_show.text = "不显示"
		
	else:
		HeadShowButton.set_button_icon(load("res://Art/BackPack/IsChoose.png"))
		PlayerData.player_data["头衔显示"] = true
		MemoryClass.保存游戏(Global.cd_path)
		head_show.text = "显示"
		
func SetWingsOffset():
	var CurrentWingsName: String
	
	if PlayerData.player_data["幻化列表"]["翅膀"] == "":
		if PlayerData.player_data["翅膀"].size() == 0:
			CurrentWingsName = "empty"
		else:
			CurrentWingsName = PlayerData.player_data["翅膀"][0]["名字"]
	else:
		CurrentWingsName = PlayerData.player_data["幻化列表"]["翅膀"]
	match CurrentWingsName:
		"xtzy","ttzy":
			wings.offset = Vector2(0,0)
			wings.scale = Vector2(1.6,1.6) 
		"xqzy":
			wings.offset = Vector2(5,15)
			wings.scale = Vector2(1.2,1.2) 
		"jmzy":
			wings.offset = Vector2(20,15)
			wings.scale = Vector2(1.1,1.1) 
		"xmzy":
			wings.offset = Vector2(20,-15)
			wings.scale = Vector2(1,1) 
		"bszy":
			wings.offset = Vector2(15,15)
			wings.scale = Vector2(1,1) 
