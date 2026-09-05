extends Node2D
@onready var Skill_Icon: Sprite2D = $BG/SkillIcon
@onready var WX_mu: Sprite2D = $BG/SkillIcon/MU
@onready var Wp_name: Label = $BG/SkillIcon/Name_
@onready var Skill_name: Label = $BG/SkillName
@onready var Skill_level: Label = $BG/SkillName/Level
@onready var Skill_Infor: Label = $BG/Skill_Infor
@onready var ChooseIcon: Sprite2D = $BG/isChoose
@onready var ChooseButton = $BG/choose
@onready var no_have: Label = $BG/NoHave

var wp_name: String


func _physics_process(_delta: float) -> void:
	checkISchoose()
	set_infor()
func set_infor():#新增一个法宝就加一个
	match wp_name:
		"dshl":
			Skill_Icon.texture = load("res://Art/MagicWeapon/Skill_Icon/dshl.png")#技能图标
			Wp_name.text = "地煞葫芦"#法宝名
			Skill_name.text = "烈焰火柱"#技能名
			Skill_level.text = "Lv: " + str(PlayerData.get_mostLevel("dshl"))#拥有该法宝的最高等级
			if PlayerData.CheckHaveWX("dshl","木"):#拥有法宝中是否包含木
				WX_mu.visible = true
			else:
				WX_mu.visible = false
			Skill_Infor.text = "释放三道火柱，对范围内的敌人造成多段物理伤害（并令其灼烧）。"	#技能描述
		"tsgj":
			Skill_Icon.texture = load("res://Art/MagicWeapon/Skill_Icon/wjgz.png")
			Wp_name.text = "天煞古剑"
			Skill_name.text = "万剑归宗"
			Skill_level.text = "Lv: " + str(PlayerData.get_mostLevel("tsgj"))
			if PlayerData.CheckHaveWX("tsgj","木"):
				WX_mu.visible = true
			else:
				WX_mu.visible = false
			Skill_Infor.text = "召唤数把巨剑从天而降，造成多段魔法伤害(30%概率冰冻命中的目标)。"	
		"bsyj":
			Skill_Icon.texture = load("res://Art/MagicWeapon/Skill_Icon/bsyj.png")
			Wp_name.text = "白霜妖镜"
			Skill_name.text = "邪灵寄生"
			Skill_level.text = "Lv: " + str(PlayerData.get_mostLevel("bsyj"))
			if PlayerData.CheckHaveWX("bsyj","木"):
				WX_mu.visible = true
			else:
				WX_mu.visible = false
			Skill_Infor.text = "附身到怪物身上偷取生命并令其减速，一段时间后将偷取到的生命给予玩家。"	
		"lsys":
			Skill_Icon.texture = load("res://Art/MagicWeapon/Skill_Icon/lsys.png")
			Wp_name.text = "罗刹妖伞"
			Skill_name.text = "暴雨梨花"
			Skill_level.text = "Lv: " + str(PlayerData.get_mostLevel("lsys"))
			if PlayerData.CheckHaveWX("lsys","木"):
				WX_mu.visible = true
			else:
				WX_mu.visible = false
			Skill_Infor.text = "散出漫天毒针，命中敌人后会造成少量伤害并令其中毒。"
		"xhmt":
			Skill_Icon.texture = load("res://Art/MagicWeapon/Skill_Icon/xhmt.png")
			Wp_name.text = "血海魔童"
			Skill_name.text = "魔童连击"
			Skill_level.text = "Lv: " + str(PlayerData.get_mostLevel("xhmt"))
			if PlayerData.CheckHaveWX("xhmt","木"):
				WX_mu.visible = true
			else:
				WX_mu.visible = false
			Skill_Infor.text = "清除低级负面效果，之后对目标进行多次打击，造成魔法伤害。"	
		"kyl":
			Skill_Icon.texture = load("res://Art/MagicWeapon/Skill_Icon/kyl.png")
			Wp_name.text = "枯叶灵"
			Skill_name.text = "沐浴回春"
			Skill_level.text = "Lv: " + str(PlayerData.get_mostLevel("kyl"))
			if PlayerData.CheckHaveWX("kyl","木"):
				WX_mu.visible = true
			else:
				WX_mu.visible = false
			Skill_Infor.text = "每秒为玩家恢复生命,期间免疫击退，持续10秒。"	
		"xhhl":
			Skill_Icon.texture = load("res://Art/MagicWeapon/Skill_Icon/xhhl.png")
			Wp_name.text = "萱花葫芦"
			Skill_name.text = "万象天引"
			Skill_level.text = "Lv: " + str(PlayerData.get_mostLevel("xhhl"))
			if PlayerData.CheckHaveWX("xhhl","木"):
				WX_mu.visible = true
			else:
				WX_mu.visible = false
			Skill_Infor.text = "将怪物吸引至玩家身边."	
		"qyj":
			Skill_Icon.texture = load("res://Art/MagicWeapon/Skill_Icon/qyj.png")
			Wp_name.text = "青云剑"
			Skill_name.text = "戮天斩击"
			Skill_level.text = "Lv: " + str(PlayerData.get_mostLevel("qyj"))
			if PlayerData.CheckHaveWX("qyj","木"):
				WX_mu.visible = true
			else:
				WX_mu.visible = false
			Skill_Infor.text = "释放剑阵，飞向当前生命最高的敌人，对受到伤害所有目标施加破甲"	
		"zjfyd":
			Skill_Icon.texture = load("res://Art/MagicWeapon/Skill_Icon/zjfyd.png")
			Wp_name.text = "混元伏妖盾"
			Skill_name.text = "不灭神盾"
			Skill_level.text = "Lv: " + str(PlayerData.get_mostLevel("zjfyd"))
			if PlayerData.CheckHaveWX("zjfyd","木"):
				WX_mu.visible = true
			else:
				WX_mu.visible = false
			Skill_Infor.text = "拥有【不灭神盾】技能，使用后获得【不灭】Buff，一段时间内免疫高于当前生命的伤害。"	
		"zjhl":
			Skill_Icon.texture = load("res://Art/MagicWeapon/Skill_Icon/zjhl.png")
			Wp_name.text = "紫金葫芦"
			Skill_name.text = "伏妖神火"
			Skill_level.text = "Lv: " + str(PlayerData.get_mostLevel("zjhl"))
			if PlayerData.CheckHaveWX("zjhl","木"):
				WX_mu.visible = true
			else:
				WX_mu.visible = false
			Skill_Infor.text = "拥有【伏妖神火】技能，朝前方喷出火焰，造成物理伤害,并有10%概率施加一层（灼烧）。"	
func checkISchoose():
	if PlayerData.check_zb(wp_name) != []:
		no_have.text = "已拥有"
		if PlayerData.player_data["实战法宝"] == wp_name:
			ChooseButton.visible = false
			ChooseButton.disabled = true
			ChooseIcon.visible = true
		else:
			ChooseButton.visible = true
			ChooseButton.disabled = false
			ChooseIcon.visible = false
	else:
		no_have.text = "未拥有"
		ChooseButton.visible = true
		ChooseButton.disabled = true
		ChooseIcon.visible = false
func _on_choose_pressed() -> void:
	if Global.FB_CD <= 0:
		PlayerData.player_data["实战法宝"] = wp_name
		Global.should_change = true
		MemoryClass.保存游戏(Global.cd_path)
	else:
		Global.AddMessageShow(get_parent().get_parent(),"当前法宝正在使用，无法更换！！",1.5,Vector2(0,0))
	
