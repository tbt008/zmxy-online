extends Node2D
@onready var lh_bar: TextureProgressBar = $BG/bg_2/lh_bar
@onready var lh_value: Label = $BG/bg_2/lh_bar/lh_value
@onready var m_level: Label = $BG/bg_2/m_level
@onready var m_czl: Label = $BG/bg_2/m_czl
@onready var m_wx: Label = $BG/bg_2/m_wx
@onready var m_hp: Label = $BG/bg_2/m_Hp
@onready var m_mp: Label = $BG/bg_2/m_Mp
@onready var m_power: Label = $BG/bg_2/m_Power
@onready var m_def: Label = $BG/bg_2/m_Def
@onready var m_m_def: Label = $BG/bg_2/m_MDef
@onready var name_: Label = $BG/Name_
@onready var icon: AnimatedSprite2D = $BG/Icon
@onready var icon_player: AnimationPlayer = $BG/IconPlayer
@onready var magic_weapon_skill_title: Label = $BG/MagicWeaponSkillTitle
@onready var magic_weapon_skill: Label = $BG/ScrollContainer/VBoxContainer/MagicWeaponSkill
@onready var PaTitle_: Label = $BG/ScrollContainer/VBoxContainer/PsTitle
@onready var magic_weapon_skill_2: Label = $BG/ScrollContainer/VBoxContainer/MagicWeaponSkill2
@onready var icon_: Sprite2D = $BG/Icon_


var choosejm_1
var choosejm_2
var choosejm_3
var choosejm_4
func _physics_process(_delta: float) -> void:
	#ChangeFBSX()
	set_skill_info()
	lh_bar.value = float(PlayerData.player_data["coin_num"]) / float(get_need_lh())
	lh_value.text = str(PlayerData.player_data["coin_num"]) + '/' + str(get_need_lh())
	m_level.text = str(PlayerData.player_data["法宝"][0]["强化等级"])
	m_wx.text = str(get_wx())
	var nn_name = PlayerData.player_data["法宝"][0]["名字"]
	name_.text = str(AE.AllEquipment_[nn_name]["名字"])
	m_czl.text = str(get_fb_pro(PlayerData.player_data["法宝"][0]["名字"],"成长率"))
	m_hp.text = str(get_fb_pro(PlayerData.player_data["法宝"][0]["名字"],"SHp"))
	m_mp.text = str(get_fb_pro(PlayerData.player_data["法宝"][0]["名字"],"SMp"))
	m_power.text = str(get_fb_pro(PlayerData.player_data["法宝"][0]["名字"],"power"))
	m_def.text = str(get_fb_pro(PlayerData.player_data["法宝"][0]["名字"],"Def"))
	m_m_def.text = str(get_fb_pro(PlayerData.player_data["法宝"][0]["名字"],"Mdef"))
	icon_player.play(str(nn_name))
func _on_up_level_pressed() -> void:
	if PlayerData.player_data["法宝"][0]["强化等级"] < 10:
		if PlayerData.player_data["coin_num"] >= get_need_lh():	
			PlayerData.player_data["coin_num"] -= get_need_lh()
			PlayerData.player_data["法宝"][0]["强化等级"] += 1
			MemoryClass.保存游戏(Global.cd_path)
		else:
			Global.AddMessageShow(self,"灵魂不足！！",1.5,Vector2(0,0))
			MemoryClass.保存游戏(Global.cd_path)
	else:
		Global.AddMessageShow(self,"法宝已经满级了！",1.5,Vector2(0,0))
		MemoryClass.保存游戏(Global.cd_path)
func set_skill_info():
	if PlayerData.player_data["法宝"].size() != 0:
		match PlayerData.player_data["法宝"][0]["名字"]:
			"dshl":
				icon_.texture = load("res://Art/MagicWeapon/Skill_Icon/dshl.png")
				magic_weapon_skill_title.text = "烈焰火柱"
				magic_weapon_skill.text = "释放三道火柱，对范围内的敌人造成多段物理伤害（并令其灼烧）。"
				PaTitle_.text = "被动技能"
				magic_weapon_skill_2.text = "暂无"
			"tsgj":
				icon_.texture = load("res://Art/MagicWeapon/Skill_Icon/wjgz.png")
				magic_weapon_skill_title.text = "万剑归宗"
				magic_weapon_skill.text = "召唤数把巨剑从天而降，造成多段魔法伤害(30%概率冰冻命中的目标)。"	
				PaTitle_.text = "被动技能"
				magic_weapon_skill_2.text = "暂无"
			"bsyj":
				icon_.texture = load("res://Art/MagicWeapon/Skill_Icon/bsyj.png")
				magic_weapon_skill_title.text = "邪灵寄生"
				magic_weapon_skill.text = "附身到怪物身上偷取生命并令其减速，一段时间后将偷取到的生命给予玩家。"	
				PaTitle_.text = "被动技能"
				magic_weapon_skill_2.text = "暂无"
			"lsys":
				icon_.texture = load("res://Art/MagicWeapon/Skill_Icon/lsys.png")
				magic_weapon_skill_title.text = "暴雨梨花"
				magic_weapon_skill.text = "散出漫天毒针，命中敌人后会造成少量伤害并令其中毒。"	
				PaTitle_.text = "被动技能"
				magic_weapon_skill_2.text = "暂无"
			"xhmt":
				icon_.texture = load("res://Art/MagicWeapon/Skill_Icon/xhmt.png")
				magic_weapon_skill_title.text = "魔童连击邪灵净化"
				magic_weapon_skill.text = "清除低级负面效果，之后对目标进行多次打击，造成魔法伤害。"	
				PaTitle_.text = "被动技能"
				magic_weapon_skill_2.text = "暂无"
			"kyl":
				icon_.texture = load("res://Art/MagicWeapon/Skill_Icon/kyl.png")
				magic_weapon_skill_title.text = "沐浴回春"
				magic_weapon_skill.text = "每秒为玩家恢复生命,期间免疫击退，持续10秒。"	
				PaTitle_.text = "被动技能"
				magic_weapon_skill_2.text = "暂无"
			"xhhl":
				icon_.texture = load("res://Art/MagicWeapon/Skill_Icon/xhhl.png")
				magic_weapon_skill_title.text = "万象天引"
				magic_weapon_skill.text = "将怪物吸引至玩家身边，一段时间内."	
				PaTitle_.text = "被动技能"
				magic_weapon_skill_2.text = "暂无"
			"qyj":
				icon_.texture = load("res://Art/MagicWeapon/Skill_Icon/qyj.png")
				magic_weapon_skill_title.text = "戮天斩击"
				magic_weapon_skill.text = "释放剑阵，飞向当前生命最高的敌人，对受到伤害所有目标施加破甲。"	
				PaTitle_.text = "被动技能"
				magic_weapon_skill_2.text = "暂无"
			"zjfyd":
				icon_.texture = load("res://Art/MagicWeapon/Skill_Icon/zjfyd.png")
				magic_weapon_skill_title.text = "不灭神盾"
				magic_weapon_skill.text = "拥有【不灭神盾】技能，使用后获得【不灭】Buff，一段时间内免疫高于当前生命的伤害。"	
				PaTitle_.text = "被动技能"
				magic_weapon_skill_2.text = "暂无"
			"zjhl":
				icon_.texture = load("res://Art/MagicWeapon/Skill_Icon/zjhl.png")
				magic_weapon_skill_title.text = "紫金葫芦"
				magic_weapon_skill.text = "拥有【伏妖神火】技能，朝前方喷出火焰，造成物理伤害,并有10%概率施加一层（灼烧）。"	
				PaTitle_.text = "被动技能"
				magic_weapon_skill_2.text = "暂无"
			"jcld":
				magic_weapon_skill_title.text = ""
				magic_weapon_skill.text = ""
				PaTitle_.text = ""
				magic_weapon_skill_2.text = ""

func _on_close_pressed() -> void:
	queue_free()

func get_need_lh():
	var current_level: int
	if PlayerData.player_data["法宝"].size() != 0:
		current_level = PlayerData.player_data["法宝"][0]["强化等级"]
	match current_level:
		0:
			return 1000
		1:
			return 4000
		2:
			return 9000
		3:
			return 16000
		4:
			return 25000
		5:
			return 36000
		6:
			return 49000
		7:
			return 64000
		8:
			return 81000		
		9:
			return 100000
		10:
			return 0
			
func get_fb_pro(name__,need):
	var wx = PlayerData.player_data["法宝"][0]["五行"]
	var level_ = PlayerData.player_data["法宝"][0]["强化等级"]
	var Data = PlayerData.player_data["法宝"][0]["Data"]
	var infomation = AE.get_fb_last_equ_pro(name__,level_,wx,Data)[need]
	return infomation			
			
func get_wx():
	var wx = PlayerData.player_data["法宝"][0]["五行"]
	var a = ""
	for i in wx:
		a = a + str(i)
	return a			


func _on_szfb_pressed() -> void:
	Global.addUseMagicWeapon($".",Vector2(0,0))

func _on_tips_pressed() -> void:
	Global.addMagicHelp($".",Vector2(0,0))
func LowWX():
	if PlayerData.get_item_data("wxxls") >= 1:
		PlayerData.player_data["法宝"][0]["五行"] = Global.get_wx(0)
		PlayerData.remove_dj("wxxls",PlayerData.get_dj_page("wxxls"),1)
		Global.AddMessageShow(get_parent(),"法宝五行已重置！！",1.5,Vector2(490,280))
	else:
		Global.AddMessageShow(get_parent(),"五行洗炼石数量不足！",1.5,Vector2(490,280))
func HighWX():
	var wx_num = PlayerData.player_data["法宝"][0]["五行"].size() * 5
	if PlayerData.get_item_data("wxxls") >= wx_num:
		match PlayerData.player_data["法宝"][0]["五行"].size():
			0:
				PlayerData.player_data["法宝"][0]["五行"] = Global.get_wx(0)
			1:
				PlayerData.player_data["法宝"][0]["五行"] = Global.get_wx(2)
			2:
				PlayerData.player_data["法宝"][0]["五行"] = Global.get_wx(3)
			3:
				PlayerData.player_data["法宝"][0]["五行"] = Global.get_wx(3)
		PlayerData.remove_dj("wxxls",PlayerData.get_dj_page("wxxls"),wx_num)
		Global.AddMessageShow(get_parent(),"法宝五行已重置！！",1.5,Vector2(490,280))
	else:
		Global.AddMessageShow(get_parent(),"五行洗炼石数量不足！",1.5,Vector2(490,280))
func CZL():
	if PlayerData.get_item_data("czlxls") >= 1:
		#print(AE.AllEquipment_[PlayerData.player_data["法宝"][0]["名字"]]["成长率"])
		PlayerData.player_data["法宝"][0]["Data"]["成长率"] = MagicWeaponCZL(PlayerData.player_data["法宝"][0]["名字"])
		PlayerData.remove_dj("czlxls",PlayerData.get_dj_page("czlxls"),1)
		Global.AddMessageShow(get_parent(),"法宝成长已重置！！",1.5,Vector2(490,280))
	else:
		Global.AddMessageShow(get_parent(),"成长率洗炼石数量不足！",1.5,Vector2(490,280))

func _on_wxxl_pressed() -> void:
	Signals.ConnectChooseBoxSignal(self,"LowWX")
	Global.add_choose_text(get_parent(),Vector2(0,0),"确定要使用1颗五行洗炼石洗炼法宝的五行吗？",0)

func _on_gjwx_pressed() -> void:
	Signals.ConnectChooseBoxSignal(self,"HighWX")
	var wx_num = PlayerData.player_data["法宝"][0]["五行"].size() * 5
	Global.add_choose_text(get_parent(),Vector2(0,0),"确定要使用" + str(wx_num) + "颗五行洗炼石高级洗炼一次法宝的五行吗？",0)

func _on_czlxl_pressed() -> void:
	Signals.ConnectChooseBoxSignal(self,"CZL")
	Global.add_choose_text(get_parent(),Vector2(0,0),"确定要使用1颗成长率洗炼石洗炼法宝的成长率吗？",0)

func MagicWeaponCZL(name__):
	randomize()
	match name__:
		"dshl":
			return snapped(randf_range(0.6,1),0.1)
		"tsgj":
			return snapped(randf_range(0.8,1.4),0.1)
		"jcld":
			return snapped(randf_range(1,1.8),0.1)
		"bsyj":
			return snapped(randf_range(0.8,1.4),0.1)
		"lsys":
			return snapped(randf_range(1,1.6),0.1)
		"xhmt":
			return snapped(randf_range(1.2,1.8),0.1)
		"xhhl":
			return snapped(randf_range(1.6,2.2),0.1)
		"kyl":
			return snapped(randf_range(1.4,2),0.1)
		"qyj":
			return snapped(randf_range(1.8,2.4),0.1)
		"zjfyd":
			return snapped(randf_range(2,2.5),0.1)
		"zjhl":
			return snapped(randf_range(2,2.5),0.1)
	return 0
