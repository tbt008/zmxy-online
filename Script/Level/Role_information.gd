extends Node2D
@onready var role_head: Sprite2D = $roleLayer/role_head

@onready var role_level: Label = $roleLayer/role_hp_mp_exp/role_level
@onready var gogo: AnimatedSprite2D = $roleLayer/Gogo
@onready var ws_effect: TextureProgressBar = $roleLayer/role_menu/ws_wk/ws_effect
@onready var max_ws: AnimatedSprite2D = $roleLayer/role_menu/max_ws
@onready var SkillBox: HBoxContainer = $roleLayer/role_menu/SkillBox
@onready var zhen_fa: TextureRect = $roleLayer/role_menu/SkillBox2/ZhenFa

@onready var hp_bar: TextureProgressBar = $roleLayer/role_hp_mp_exp/hp_bar
@onready var hp_text: Label = $roleLayer/role_hp_mp_exp/hp_bar/hp_text
@onready var mp_bar: TextureProgressBar = $roleLayer/role_hp_mp_exp/mp_bar
@onready var mp_text: Label = $roleLayer/role_hp_mp_exp/mp_bar/mp_text
@onready var exp_bar: TextureProgressBar = $roleLayer/role_hp_mp_exp/exp_bar
@onready var exp_text: Label = $roleLayer/role_hp_mp_exp/exp_bar/exp_text
@onready var nature_recovery_mp: Label = $roleLayer/role_hp_mp_exp/mp_bar/nature_recovery_mp
@onready var nature_recovery_hp: Label = $roleLayer/role_hp_mp_exp/hp_bar/nature_recovery_hp
@onready var grey: Sprite2D = $roleLayer/role_menu/grey
@onready var add_effect = $roleLayer/AddMyEffect
@onready var buff_box: HBoxContainer = $roleLayer/role_hp_mp_exp/Buff_box
@onready var role_protect: TextureProgressBar = $roleLayer/role_hp_mp_exp/RoleProtect
@onready var magic_weapon_skill_cd: TextureRect = $roleLayer/role_menu/SkillBox/MagicWeaponSkillCD


var Hp_Change:
	set(a):
		Hp_Change = a
		set_value_Hp(Hp_Change)
var buff_mpo
var buff_po
var buff_ice
var buff_speed_down
var buff_is_stun
var buff_is_Fire
var buff_is_Bleed
var Player: BaseHero
func _ready() -> void:
	Global.MgCdPic = magic_weapon_skill_cd
	Global.zhen_fa = zhen_fa
	match int(PlayerData.player_data["Myself"]):
		1:
			role_head.texture = load("res://Art/HeroPicture/RoleProperiesBox/swk.png")
		2:
			role_head.texture = load("res://Art/HeroPicture/RoleProperiesBox/tsz.png")
		3:
			role_head.texture = load("res://Art/HeroPicture/RoleProperiesBox/zbj.png")
		4:
			role_head.texture = load("res://Art/HeroPicture/RoleProperiesBox/shs.png")
		5:
			role_head.texture = load("res://Art/HeroPicture/RoleProperiesBox/blm.png")
func _physics_process(_delta: float) -> void:
	if PlayerData.player_data["实战法宝"] != "" and PlayerData.player_data["法宝"].size() > 0:
		magic_weapon_skill_cd.visible = true
		magic_weapon_skill_cd.SkillName = PlayerData.player_data["实战法宝"]
	else:
		magic_weapon_skill_cd.visible = false
	for i in Global.AllBuffList:
		SetBuffIconInfo(i)
	if PlayerData.player_data["已佩戴阵法"] == "":
		zhen_fa.visible = false
		zhen_fa.Iszhenfa = true
	else:
		zhen_fa.Iszhenfa = true
		zhen_fa.SkillName = PlayerData.player_data["已佩戴阵法"]
		zhen_fa.visible = true
	set_skill_pic()
	if get_parent().Role_ != null:
		Player = get_parent().Role_ as BaseHero
	if RoleProp.roleprop.Hp < RoleProp.roleprop.SHp and RoleProp.roleprop.R_hp > 0:
		nature_recovery_hp.text = "+" + str(float(RoleProp.roleprop.R_hp)) + "/s * " + str(Player.CureValue)
	else:
		nature_recovery_hp.text = ""
	if RoleProp.roleprop.Mp < RoleProp.roleprop.SMp and RoleProp.roleprop.R_mp > 0:
		nature_recovery_mp.text = "+" + str(float(RoleProp.roleprop.R_mp)) + "/s"
	else:
		nature_recovery_mp.text = ""
	Hp_Change = float(RoleProp.roleprop.Hp) / RoleProp.roleprop.SHp
	role_level.text = str(RoleProp.baseroleprop.Level)
	hp_bar.value = float(RoleProp.roleprop.Hp) / RoleProp.roleprop.SHp
	hp_text.text = str(int(RoleProp.roleprop.Hp)) + '/' + str(int(RoleProp.roleprop.SHp))
	mp_bar.value = float(RoleProp.roleprop.Mp) / RoleProp.roleprop.SMp
	mp_text.text = str(int(RoleProp.roleprop.Mp)) + '/' + str(int(RoleProp.roleprop.SMp))
	exp_bar.value = float(RoleProp.baseroleprop.exp) / RoleProp.baseroleprop.max_exp
	exp_text.text = str(RoleProp.baseroleprop.exp) + '/' + str(RoleProp.baseroleprop.max_exp)
	ws_effect.value = float(RoleProp.ws_value) /  RoleProp.max_ws_value
	if ws_effect.value >= 1 and not RoleProp.is_ws_state:
		max_ws.visible = true
	else:
		max_ws.visible = false
	role_protect.value = float(Player.CurrentProtect) / float(Player.MaxProtect)
func is_full_ws():
	return max_ws.visible == true and not RoleProp.is_ws_state
func set_skill_pic():
	for i in SkillBox.get_children():
		if i != null:
			if not i is mgcd:
				var Name = str(i.name)
				var Tar = PlayerData.player_data["技能学习"]["技能键位"][Name]
				if Tar != "":
					i.SkillName = Tar
				else:
					i.SkillName = "Empty"
func set_value_Hp(value):
	if not MainSet.set_data["HpBarDelay"]:
		$roleLayer/role_hp_mp_exp/hp_bar/hp_bar2.value = 0
		return
	create_tween().tween_property($roleLayer/role_hp_mp_exp/hp_bar/hp_bar2,"value",value,0.6)
func SetBuffIconInfo(Name):
	var IsHave: bool#是否拥有
	var Count: int = 1#拥有个数
	var BuffInfo = {
		"Name": Name,
		"value": 0.0,#伤害值
		"AddTime": 0.0,#添加时间
		"ReduceInterval": 0.0,#扣除伤害间隔
		"AttackKind": "",#伤害类型
		"HaveCount": 0,#拥有次数
	}
	for i in RoleProp.SourcePlayer.buff.get_children():
		for u in i.BuffInfo:
			if not BuffInfo.has(u):
				BuffInfo[u] = i.BuffInfo[u]
		if i.BuffInfo["Name"] == Name:
			IsHave = true
			BuffInfo["HaveCount"] += 1
			if i.BuffInfo.has("CanAdd"):
				if i.BuffInfo["CanAdd"]:
					BuffInfo["value"] += i.BuffInfo["value"]
				else:
					BuffInfo["value"] = i.BuffInfo["value"]
			else:
				BuffInfo["value"] += i.BuffInfo["value"]
			if i.BuffInfo.has("ReduceInterval"):
				BuffInfo["ReduceInterval"] = i.BuffInfo["ReduceInterval"]
			if not i.IsCheck:	
				BuffInfo["AttackKind"] = i.BuffInfo["AttackKind"]
				if i.BuffInfo.has("ReduceInterval"):
					BuffInfo["ReduceInterval"] = i.BuffInfo["ReduceInterval"]
				BuffInfo["AddTime"] = i.BuffInfo["AddTime"]
				buff_box.get_node(Name).buff_icon_remove.start(BuffInfo["AddTime"])
				buff_box.get_node(Name).DataList = BuffInfo
				i.IsCheck = true
			buff_box.get_node(Name).DataList = BuffInfo
	buff_box.get_node(Name).visible = IsHave
