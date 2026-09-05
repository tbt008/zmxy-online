extends MarginContainer
#@onready var skill_hmz = $ScrollContainer/HBoxContainer/sk_lv/hmz
@onready var skill_1_le = $ScrollContainer/HBoxContainer/sk_le/sk_1
@onready var skill_2_le = $ScrollContainer/HBoxContainer/sk_le/sk_2
@onready var skill_3_le = $ScrollContainer/HBoxContainer/sk_le/sk_3
@onready var skill_4_le = $ScrollContainer/HBoxContainer/sk_le/sk_4
@onready var skill_5_le = $ScrollContainer/HBoxContainer/sk_le/sk_5
#
var TargetSkill: int
var SkillInfo
var Skill_list = {
	"角色1":["slz","hytj","lys","lyfb","hmz","zz","qsez","jdy","hyjj","sx"],
	"角色2":["blb","xbz","shy","tjgl","smb","sgq","myhc","jgz","jhsj","sjt"],
	"角色3":["ssp","dj","dgq","zznh","tmc","sd","jsp","xgq","syzq","rj"],
	"角色4":["qlj","dcj","wdzt","tkj","mmw","jdz","lhsq","zq","wdww","mds"],
	"角色5":["xyq","slq","blq","fhf","cxq","llrd","lljy","ygth","tllz","yyb"]
}#按照这个顺序做技能
var Skill_Name = {
	"角色1":["升龙斩","火炎突击","烈焰闪","烈焰风暴","火魔斩","重斩","七十二斩","筋斗云","火眼金睛","嗜血"],
	"角色2":["冰龙波","玄冰阵","水幻影","天降甘露","水魔爆","饥寒冰魂","沐浴回春","紧箍咒","九环圣经","水精通"],
	"角色3":["碎石破","盾击","地滚球","战争怒吼","土魔刺","圣盾","巨石破","旋滚球","圣域之墙","刃甲"],
	"角色4":["强力击","多重击","万毒加护","腾空击","木魔舞","剧毒阵","灵魂摄取","瘴气","巫毒娃娃","猛毒素"],
	"角色5":["心眼枪","升龙枪","奔雷枪","翔龙闪","穿心枪","雷龙入地","雷龙极影","银钩铁画","天龙雷阵","阴阳双生"]
}#按照这个顺序做技能
var Skill_Infor = {
	"角色1":["奋力一击，将敌人击飞至空中，造成魔法伤害。",
	"短距离突刺，将敌人击退，并造成多段魔法伤害。",
	"以无法捕捉的速度快速冲刺，进入无法被命中状态并且造成多段伤害。",
	"快速旋转，震开或吸引周边敌人，造成多段魔法伤害",
	"冲向空中造成多段物理伤害，之后砸向地面造成魔法伤害，期间处于无法被命中状态。",
	"蓄力后用力砸向地面造成伤害并且击退敌人。",
	"向前短距离冲刺，触碰到敌人后进行多次打击，概率打出残影，残影可以模仿角色部分技能（残影数量上限和伤害继承百分比取决于本技能等级）。",
	"腾云驾雾，快速冲，按W可以向上飞行。",
	"眼睛变红，之后在当前面朝方向优先出现的敌人身上召唤六丁神火，造成多次伤害（目标死亡时立即消失）。",
	"孙悟空被动获得一定的暴击和吸血效果。"],
	"角色2":["短暂延迟后释放一道冰龙冲击，造成击退效果。",
	"短暂引导后在前方召唤玄冰刺，（三段，每段都比上一段体积增大一部分），并击退敌人。",
	"释放一个幻影向前方移动，再次使用可以瞬移至幻影位置，幻影可以继承角色某些技能。",
	"短暂引导后恢复自身一定量生命（与角色生命上限有关，根据已损失生命治疗效果至多额外提升60%）",
	"召唤法阵向前移动，再次释放召唤光柱砸向地面，造成巨额伤害。"
	,"召唤一个法球向前移动，移动过程中不断射出冰刺，对敌人造成魔法伤害和击退（击退方向可以通过玩家方向来控制）。",
	"为自身添加一个回血效果，每过一段时间恢复一定量的生命（与角色生命上限有关）。",
	"向前方召唤紧箍咒，将一定范围内的某些怪物聚集在中央，并且提高对其下次攻击的伤害。",
	"唐僧默念圣经，在自身周围召唤佛光，对附近的敌人造成伤害。",
	"学习后，玄冰阵和水魔爆获得概率冰冻效果，升级提高冰冻时长和冰冻概率。"],
	"角色3":[
	"八戒用钉耙猛砸地面，从地面刺出多段突刺，对敌人造成伤害。",
	"幻化出盾牌，之后蓄力一击，造成显著的击退效果（可搭配刃甲的眩晕）",
	"自身化作土球，快速向前翻滚，造成伤害，翻滚期间处于无法被命中状态",
	"发出怒吼，吸引场上所有怪物至自身附近，并提高对其下一次的伤害。",
	"八戒化身为一个尖刺魔球，处于魔球期间，受到攻击将会反弹给敌人，再次使用该技能会释放追踪尖刺，造成伤害。",
	"昂扬斗志，召唤圣盾加护，自身不会被击退，且每秒回复一定量的生命，持续一段时间。",
	"在身旁召唤爆裂巨石，造成多段伤害（配合刃甲概率将敌人震晕一段时间）",
	"自身化作土球在附近区域旋转打击，造成多段物理伤害。",
	"召唤一个不断向前移动的墙壁，触碰到敌人后击退对方（可以搭配刃甲的眩晕，场上最多同时存在一堵圣域之墙）",
	"八戒获得刃甲加护，受到攻击有概率无视伤害并回复一定生命值，令部分技能获得眩晕效果，（回复概率，数值，眩晕概率，时间与该技能等级有关）"],
	"角色4":["强力打飞前方怪物。",
	"对前方怪物造成多次打击",
	"获得毒雾加护，最终伤害减少，免疫部分击退，被攻击时，给攻击者施加一层”巫毒“，并小概率回复减伤部分的生命。",
	"冲向空中造成伤害。"
	,"释放回旋镖在附近不停的移动，造成魔法伤害。",
	"原地释放一个毒阵，怪物进入毒阵会受到伤害，并被减速。",
	"伸出魔爪对前方怪物造成伤害，命中后恢复自身生命,根据已损失生命治疗效率至多提升30%。"
	,"向前方释放瘴气"
	,"释放一个傀儡娃娃向目标(当前生命最高单位)移动，打击娃娃目标也会受到伤害，升级提升传递比率及娃娃生命。"
	,"令部分技能附带”巫毒“效果(每秒扣除生命)，叠加至7层时，将会引爆，造成巨额伤害。"],
	
	"角色5":["举起长枪不断挥舞，造成伤害，之后奋力一击击退目标。（期间无视击退）",
	"高高跃起并将目标击飞至空中。",
	"向前方冲刺，并击退敌人。（期间无视击退）",
	"向前方瞬移一小段距离（期间不会被命中）。"
	,"向前方快速刺击，期间可以左右移动，最后将敌人击退。（期间无视击退）",
	"高高跃起，然后向地面掷出雷枪引发天雷，造成伤害并将目标吸引至中心位置，令其5秒内受伤提高30%。",
	"极速向前冲刺，对触碰到的所有敌人点穴（1.2s僵直），然后残影跟随，造成多段伤害，冲刺期间不会被击中。"
	,"快速挥舞长枪，造成多次打击，最后一击召唤巨型银钩"
	,"向前跃向空中，砸向地面，落地召唤雷阵不断造成伤害，进入雷阵的目标会被减速，持续10s（同时只能存在一个雷阵）。"
	,"白龙的部分攻击概率触发天雷（伤害和恢复生命取决于引发天雷攻击的伤害和本技能等级）。"]
}#按照这个顺序做技能


func _ready() -> void:

	set_skill_Icon()
	set_skill_name()
	set_skill_Level()
	set_skill_Infor()
	set_Skill_LH()
func GetSkillName(Num):
	var RoleID = PlayerData.player_data["Myself"]
	return str(Skill_Name["角色" + str(RoleID)][Num - 1])
func GetNeedMp():
	var Hero = BaseHero.new()
	var Old = Hero.get_need_mp(GetName(TargetSkill - 1),false)
	var New = Hero.get_need_mp(GetName(TargetSkill - 1),true)
	var RoleID = PlayerData.player_data["Myself"]
	return [Old,New]
func set_skill_name():#设置每个技能的名字
	for i in range(10):
		var target = get_node("ScrollContainer/HBoxContainer/Sk_na/skill_" + str(i + 1))
		var RoleID = PlayerData.player_data["Myself"]
		target.text = str(Skill_Name["角色" + str(RoleID)][i])
func set_skill_Icon():#设置每个技能的图标
	for i in range(10):
		var target = get_node("ScrollContainer/HBoxContainer/sk_pi/ski_" + str(i + 1))
		var RoleID = PlayerData.player_data["Myself"]
		var Skill_nbname = Skill_list["角色" + str(RoleID)][i]
		target.set_button_icon(load("res://Art/Skill/SkillIcon/" + str(Skill_nbname) + ".png"))
func set_skill_Level():#设置每个技能的等级
	for i in range(10):
		var target = get_node("ScrollContainer/HBoxContainer/sk_le/sk_" + str(i + 1))
		var SkillLevel = PlayerData.player_data["技能学习"]["技能"+ str(i + 1)]["等级"]
		target.text = "Lv:" + str(SkillLevel)
func set_skill_Infor():#设置每个技能的描述
	for i in range(10):
		var target = get_node("ScrollContainer/HBoxContainer/sk_ms/s_" + str(i + 1))
		var RoleID = PlayerData.player_data["Myself"]
		target.text = str(Skill_Infor["角色" + str(RoleID)][i])

func set_Skill_LH():#设置每个技能当前需要的灵魂
	for i in range(10):
		get_node("ScrollContainer/HBoxContainer/sk_lv/Skill_1/Need")
		var target = get_node("ScrollContainer/HBoxContainer/sk_lv/Skill_" + str(i + 1) + "/Need")
		var SkillLevel = PlayerData.player_data["技能学习"]["技能"+ str(i + 1)]["等级"]
		var Need = 100 + (i * 300) + 500 * SkillLevel
		if i == 9:
			Need = 500 + 500 * SkillLevel
		target.text = "需：" + str(Need) + "灵魂"

func _physics_process(_delta: float) -> void:
	pass
func UpLevel():#目标技能号
	if TargetSkill <= 0:
		Global.AddMessageShow(self,"技能信息获取失败，无法升级！！",1.5,Vector2(395,180))
		return
	if TargetSkill != 10:
		var level = PlayerData.player_data["技能学习"]["技能" + str(TargetSkill)]["等级"]
		
		if level >= 1:
			Global.AddMessageShow(self,"主动技能当前最高为1级，可升级角色被动技能！！",1.5,Vector2(395,180))
			return
		var need = 100 + ((TargetSkill - 1) * 300) + 500 * level
		if PlayerData.player_data["coin_num"] >= need:
			PlayerData.player_data["coin_num"] -= need
			PlayerData.player_data["技能学习"]["技能" + str(TargetSkill)]["等级"] += 1
		else:
			Global.AddMessageShow(self,"灵魂不足！！",1.5,Vector2(395,180))
		#RefreshInfor()
	else:
		var level = PlayerData.player_data["技能学习"]["技能10"]["等级"]
		if level >= 10:
			Global.AddMessageShow(self,"技能已经满级！！",1.5,Vector2(395,180))
			return
		var need = 500 + 500 * level
		if PlayerData.player_data["coin_num"] >= need:
			
			var NeedLevel = Skill10XZ(PlayerData.player_data["技能学习"]["技能10"]["等级"])
			if RoleProp.baseroleprop["Level"] >= NeedLevel:
				PlayerData.player_data["coin_num"] -= need
				PlayerData.player_data["技能学习"]["技能10"]["等级"] += 1
			else:
				Global.AddMessageShow(self,"等级不足，需达到：" + str(NeedLevel) + "级！！",1.5,Vector2(395,180))
		else:
			Global.AddMessageShow(self,"灵魂不足！！",1.5,Vector2(395,180))
	RefreshInfor()

func _on_skill_1_pressed() -> void:
	TargetSkill = 1
	Signals.ConnectChooseBoxSignal(self,"UpLevel")
	Global.add_choose_text(Global.get_parent_(self,4),Vector2(0,0),"确定要升级技能" + str(GetSkillName(TargetSkill)) +"吗？" + '魔耗：' + str(GetNeedMp()[0]) + '→' + str(GetNeedMp()[1]),0)


func _on_skill_2_pressed() -> void:
	TargetSkill = 2
	Signals.ConnectChooseBoxSignal(self,"UpLevel")
	Global.add_choose_text(Global.get_parent_(self,4),Vector2(0,0),"确定要升级技能" + str(GetSkillName(TargetSkill)) +"吗？" + '魔耗：' + str(GetNeedMp()[0]) + '→' + str(GetNeedMp()[1]),0)
func _on_skill_3_pressed() -> void:
	TargetSkill = 3
	Signals.ConnectChooseBoxSignal(self,"UpLevel")
	Global.add_choose_text(Global.get_parent_(self,4),Vector2(0,0),"确定要升级技能" + str(GetSkillName(TargetSkill)) +"吗？" + '魔耗：' + str(GetNeedMp()[0]) + '→' + str(GetNeedMp()[1]),0)
func _on_skill_4_pressed() -> void:
	TargetSkill = 4
	Signals.ConnectChooseBoxSignal(self,"UpLevel")
	Global.add_choose_text(Global.get_parent_(self,4),Vector2(0,0),"确定要升级技能" + str(GetSkillName(TargetSkill)) +"吗？" + '魔耗：' + str(GetNeedMp()[0]) + '→' + str(GetNeedMp()[1]),0)

func _on_skill_5_pressed() -> void:
	TargetSkill = 5
	Signals.ConnectChooseBoxSignal(self,"UpLevel")
	Global.add_choose_text(Global.get_parent_(self,4),Vector2(0,0),"确定要升级技能" + str(GetSkillName(TargetSkill)) +"吗？" + '魔耗：' + str(GetNeedMp()[0]) + '→' + str(GetNeedMp()[1]),0)

func _on_skill_6_pressed() -> void:
	TargetSkill = 6
	Signals.ConnectChooseBoxSignal(self,"UpLevel")
	Global.add_choose_text(Global.get_parent_(self,4),Vector2(0,0),"确定要升级技能" + str(GetSkillName(TargetSkill)) +"吗？" + '魔耗：' + str(GetNeedMp()[0]) + '→' + str(GetNeedMp()[1]),0)

func _on_skill_7_pressed() -> void:
	TargetSkill = 7
	Signals.ConnectChooseBoxSignal(self,"UpLevel")
	Global.add_choose_text(Global.get_parent_(self,4),Vector2(0,0),"确定要升级技能" + str(GetSkillName(TargetSkill)) +"吗？" + '魔耗：' + str(GetNeedMp()[0]) + '→' + str(GetNeedMp()[1]),0)

func _on_skill_8_pressed() -> void:
	TargetSkill = 8
	Signals.ConnectChooseBoxSignal(self,"UpLevel")
	Global.add_choose_text(Global.get_parent_(self,4),Vector2(0,0),"确定要升级技能" + str(GetSkillName(TargetSkill)) +"吗？" + '魔耗：' + str(GetNeedMp()[0]) + '→' + str(GetNeedMp()[1]),0)

func _on_skill_9_pressed() -> void:
	TargetSkill = 9
	Signals.ConnectChooseBoxSignal(self,"UpLevel")
	Global.add_choose_text(Global.get_parent_(self,4),Vector2(0,0),"确定要升级技能" + str(GetSkillName(TargetSkill)) +"吗？" + '魔耗：' + str(GetNeedMp()[0]) + '→' + str(GetNeedMp()[1]),0)

func _on_skill_10_pressed() -> void:
	TargetSkill = 10
	Signals.ConnectChooseBoxSignal(self,"UpLevel")
	Global.add_choose_text(Global.get_parent_(self,4),Vector2(0,0),"确定要升级技能" + str(GetSkillName(TargetSkill)) +"吗？" + '魔耗：' + str(GetNeedMp()[0]) + '→' + str(GetNeedMp()[1]),0)
func RefreshInfor():
	set_skill_Level()
	set_Skill_LH()
	MemoryClass.保存游戏(Global.cd_path)

func Skill10XZ(Level):
	Level = int(Level)
	match Level:
		0:
			return 0 
		1:
			return 8	
		2:
			return 14
		3:
			return 19
		4:
			return 24
		5:
			return 30
		6:
			return 33
		7:
			return 35
		8:
			return 37
		9:
			return 39
		10:
			return 45
	return 0
func _on_ski_1_pressed() -> void:
	var level = PlayerData.player_data["技能学习"]["技能1"]["等级"]
	if level == 0:
		Global.AddMessageShow(self,"先学习技能才能设置按键！！",1.5,Vector2(395,180))
		return
	var RoleID = PlayerData.player_data["Myself"]
	var Skill_nbname = Skill_list["角色" + str(RoleID)][0]
	Global.addSkillKeySet(self,Vector2(350,140),Skill_nbname)


func _on_ski_2_pressed() -> void:
	var level = PlayerData.player_data["技能学习"]["技能2"]["等级"]
	if level == 0:
		Global.AddMessageShow(self,"先学习技能才能设置按键！！",1.5,Vector2(395,180))
		return
	var RoleID = PlayerData.player_data["Myself"]
	var Skill_nbname = Skill_list["角色" + str(RoleID)][1]
	Global.addSkillKeySet(self,Vector2(350,140),Skill_nbname)


func _on_ski_3_pressed() -> void:
	var level = PlayerData.player_data["技能学习"]["技能3"]["等级"]
	if level == 0:
		Global.AddMessageShow(self,"先学习技能才能设置按键！！",1.5,Vector2(395,180))
		return
	var RoleID = PlayerData.player_data["Myself"]
	var Skill_nbname = Skill_list["角色" + str(RoleID)][2]
	Global.addSkillKeySet(self,Vector2(350,140),Skill_nbname)


func _on_ski_4_pressed() -> void:
	var level = PlayerData.player_data["技能学习"]["技能4"]["等级"]
	if level == 0:
		Global.AddMessageShow(self,"先学习技能才能设置按键！！",1.5,Vector2(395,180))
		return
	var RoleID = PlayerData.player_data["Myself"]
	var Skill_nbname = Skill_list["角色" + str(RoleID)][3]
	Global.addSkillKeySet(self,Vector2(350,140),Skill_nbname)


func _on_ski_5_pressed() -> void:
	var level = PlayerData.player_data["技能学习"]["技能5"]["等级"]
	if level == 0:
		Global.AddMessageShow(self,"先学习技能才能设置按键！！",1.5,Vector2(395,180))
		return
	var RoleID = PlayerData.player_data["Myself"]
	var Skill_nbname = Skill_list["角色" + str(RoleID)][4]
	Global.addSkillKeySet(self,Vector2(350,140),Skill_nbname)


func _on_ski_6_pressed() -> void:
	var level = PlayerData.player_data["技能学习"]["技能6"]["等级"]
	if level == 0:
		Global.AddMessageShow(self,"先学习技能才能设置按键！！",1.5,Vector2(395,180))
		return
	var RoleID = PlayerData.player_data["Myself"]
	var Skill_nbname = Skill_list["角色" + str(RoleID)][5]
	Global.addSkillKeySet(self,Vector2(350,140),Skill_nbname)


func _on_ski_7_pressed() -> void:
	var level = PlayerData.player_data["技能学习"]["技能7"]["等级"]
	if level == 0:
		Global.AddMessageShow(self,"先学习技能才能设置按键！！",1.5,Vector2(395,180))
		return
	var RoleID = PlayerData.player_data["Myself"]
	var Skill_nbname = Skill_list["角色" + str(RoleID)][6]
	Global.addSkillKeySet(self,Vector2(350,140),Skill_nbname)


func _on_ski_8_pressed() -> void:
	var level = PlayerData.player_data["技能学习"]["技能8"]["等级"]
	if level == 0:
		Global.AddMessageShow(self,"先学习技能才能设置按键！！",1.5,Vector2(395,180))
		return
	var RoleID = PlayerData.player_data["Myself"]
	var Skill_nbname = Skill_list["角色" + str(RoleID)][7]
	Global.addSkillKeySet(self,Vector2(350,140),Skill_nbname)


func _on_ski_9_pressed() -> void:
	var level = PlayerData.player_data["技能学习"]["技能9"]["等级"]
	if level == 0:
		Global.AddMessageShow(self,"先学习技能才能设置按键！！",1.5,Vector2(395,180))
		return
	var RoleID = PlayerData.player_data["Myself"]
	var Skill_nbname = Skill_list["角色" + str(RoleID)][8]
	Global.addSkillKeySet(self,Vector2(350,140),Skill_nbname)


func _on_ski_10_pressed() -> void:
	Global.AddMessageShow(self,"被动技能不可以设置按键！！",1.5,Vector2(395,180))


func GetName(num):
	var RoleID = PlayerData.player_data["Myself"]
	var Skill_nbname = Skill_list["角色" + str(RoleID)][num]
	
	return Skill_nbname


func _on_ski_1_mouse_entered() -> void:
	var Hero = BaseHero.new()
	var Old = Hero.get_need_mp(GetName(0),false)
	var New =Hero.get_need_mp(GetName(0),true)
	var RoleID = PlayerData.player_data["Myself"]
	SkillInfo = Global.addRoleMagicNeed(self,get_local_mouse_position(),str(Skill_Name["角色" + str(RoleID)][0]),Old,New)
func _on_ski_1_mouse_exited() -> void:
	if SkillInfo != null:
		SkillInfo.queue_free()


func _on_ski_2_mouse_entered() -> void:
	var Hero = BaseHero.new()
	var Old = Hero.get_need_mp(GetName(1),false)
	var New =Hero.get_need_mp(GetName(1),true)
	var RoleID = PlayerData.player_data["Myself"]
	SkillInfo = Global.addRoleMagicNeed(self,get_local_mouse_position(),str(Skill_Name["角色" + str(RoleID)][1]),Old,New)


func _on_ski_2_mouse_exited() -> void:
	if SkillInfo != null:
		SkillInfo.queue_free()


func _on_ski_3_mouse_entered() -> void:
	var Hero = BaseHero.new()
	var Old = Hero.get_need_mp(GetName(2),false)
	var New =Hero.get_need_mp(GetName(2),true)
	var RoleID = PlayerData.player_data["Myself"]
	SkillInfo = Global.addRoleMagicNeed(self,get_local_mouse_position(),str(Skill_Name["角色" + str(RoleID)][2]),Old,New)


func _on_ski_3_mouse_exited() -> void:
	if SkillInfo != null:
		SkillInfo.queue_free()


func _on_ski_4_mouse_entered() -> void:
	var Hero = BaseHero.new()
	var Old = Hero.get_need_mp(GetName(3),false)
	var New =Hero.get_need_mp(GetName(3),true)
	var RoleID = PlayerData.player_data["Myself"]
	SkillInfo = Global.addRoleMagicNeed(self,get_local_mouse_position(),str(Skill_Name["角色" + str(RoleID)][3]),Old,New)


func _on_ski_4_mouse_exited() -> void:
	if SkillInfo != null:
		SkillInfo.queue_free()


func _on_ski_5_mouse_entered() -> void:
	var Hero = BaseHero.new()
	var Old = Hero.get_need_mp(GetName(4),false)
	var New =Hero.get_need_mp(GetName(4),true)
	var RoleID = PlayerData.player_data["Myself"]
	SkillInfo = Global.addRoleMagicNeed(self,get_local_mouse_position(),str(Skill_Name["角色" + str(RoleID)][4]),Old,New)


func _on_ski_5_mouse_exited() -> void:
	if SkillInfo != null:
		SkillInfo.queue_free()


func _on_ski_6_mouse_entered() -> void:
	var Hero = BaseHero.new()
	var Old = Hero.get_need_mp(GetName(5),false)
	var New =Hero.get_need_mp(GetName(5),true)
	var RoleID = PlayerData.player_data["Myself"]
	SkillInfo = Global.addRoleMagicNeed(self,get_local_mouse_position(),str(Skill_Name["角色" + str(RoleID)][5]),Old,New)


func _on_ski_6_mouse_exited() -> void:
	if SkillInfo != null:
		SkillInfo.queue_free()


func _on_ski_7_mouse_entered() -> void:
	var Hero = BaseHero.new()
	var Old = Hero.get_need_mp(GetName(6),false)
	var New = Hero.get_need_mp(GetName(6),true)
	var RoleID = PlayerData.player_data["Myself"]
	SkillInfo = Global.addRoleMagicNeed(self,get_local_mouse_position(),str(Skill_Name["角色" + str(RoleID)][6]),Old,New)


func _on_ski_7_mouse_exited() -> void:
	if SkillInfo != null:
		SkillInfo.queue_free()


func _on_ski_8_mouse_entered() -> void:
	var Hero = BaseHero.new()
	var Old = Hero.get_need_mp(GetName(7),false)
	var New =Hero.get_need_mp(GetName(7),true)
	var RoleID = PlayerData.player_data["Myself"]
	SkillInfo = Global.addRoleMagicNeed(self,get_local_mouse_position(),str(Skill_Name["角色" + str(RoleID)][7]),Old,New)


func _on_ski_8_mouse_exited() -> void:
	if SkillInfo != null:
		SkillInfo.queue_free()


func _on_ski_9_mouse_entered() -> void:
	var Hero = BaseHero.new()
	var Old = Hero.get_need_mp(GetName(8),false)
	var New =Hero.get_need_mp(GetName(8),true)
	var RoleID = PlayerData.player_data["Myself"]
	SkillInfo = Global.addRoleMagicNeed(self,get_local_mouse_position(),str(Skill_Name["角色" + str(RoleID)][8]),Old,New)


func _on_ski_9_mouse_exited() -> void:
	if SkillInfo != null:
		SkillInfo.queue_free()
