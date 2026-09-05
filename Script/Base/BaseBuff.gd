extends Node
class_name BaseBuff
#添加到怪物或者玩家的buff节点下面
@onready var BuffTime: Timer = $BuffLastTime
@onready var BuffReduceTime: Timer = $BuffValueReduceTime
@onready var Specialeffectaddtime: Timer = $SpecialEffectAddTime
@onready var one_second: Timer = $OneSecond

var LastTime: float
var GetObj: BaseObject
var GetAllBuff: Node
var BuffInfo = {
	"Name": "",#Buff 名字
	"value": 0.0,#伤害值
	"AddTime": 0.0,#添加时间
	"ReduceInterval": 0.0,#扣除伤害间隔
	"AttackKind": "",
	"SpecialEffectAddInterval": 0.0,
	"CanAdd":false
}
var IniBuff = {
	"Name": "",
	"value": 0.0,
	"AddTime": 0.0,
	"AttackKind": "",
	"CanRemove":false
}
var NeedRemove: bool
var TotalTimes: int = 1
var InterTime: float
var IsSet: bool = false
var on_set: bool = false
var BuffEffectList = []
var BuffArray = []
var OldPosition
var NewPosition
var IniSpeed
var IsCheck: bool = false
var LastValue: float
func _physics_process(_delta: float) -> void:
	
	if not IsSet:
		LastValue = BuffInfo["value"]
		LastTime = BuffInfo["AddTime"]
		GetObj = get_parent().get_parent()
		GetAllBuff = get_parent()
		if not GetObj is BaseMonster and not GetObj is BaseHero:
			self.queue_free() 
		SetValue()
		AddBuffEffectFirst()
		StartBuff()
		IsSet = true
	SetSpecialBuffTime()
func SetValue():
	for i in GetAllBuff.get_children():
		if i != null:
			if i is BaseBuff:
				match BuffInfo["Name"]:
					"speed_down","DefeReduce","nlls","slzbuff","lpzbuff","tszbuff":#按照比率的
						if i != self and i.BuffInfo["Name"] == BuffInfo["Name"]:
							if i.BuffInfo.has("CanAdd"):
								if i.BuffInfo["CanAdd"]:
									LastValue += i.LastValue
									i.queue_free()
								else:
									if i.LastValue > LastValue:
										LastValue = i.LastValue
							else:
								if i.LastValue > LastValue:
									LastValue = i.LastValue
					"Ice","stun","EyeFix","DeadLink","Boundground","silent","Immobilize","BloodFix","Scary","SuperArmor","DoubleFallPro","PoisionBody","lljybuff","NoDeBuff":#只有生效时长的
						if i != self and i.BuffInfo["Name"] == BuffInfo["Name"]:
							if i.BuffInfo.has("CanAdd"):#如果可以叠加，那么直接增加时长，否则删除掉时间少的
								if i.BuffInfo.has("CanAdd"):
									if i.BuffInfo["CanAdd"]:
										BuffInfo["AddTime"] += i.LastTime
										i.queue_free()

func AddBuffEffectFirst():
	match BuffInfo["Name"]:
		"flls":
			InterTime = 1
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,0),"flls",Vector2(1,1),false,1))
		"lljybuff":
			if GetObj is BaseMonster:
				GetObj.velocity = Vector2(0,0)
				
		"lpzbuff":
			if GetObj is BaseMonster:
				var Levellpz = PlayerData.player_data["落魄阵"]["Level"]
				GetObj.lpzjs = Levellpz * 0.02
			elif GetObj is BaseHero:
				GetObj.xrbl =  1 - LastValue
			InterTime = 0.5
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,5),"lpzbuff",Vector2(1,1),false,1))
		"tszbuff":
			if GetObj is BaseHero:
				var Levellpz = PlayerData.player_data["腾蛇阵"]["Level"]
				GetObj.tszzs = Levellpz * 0.015
			InterTime = 0.6
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,5),"tszbuff",Vector2(1,1),false,1))
		"Scary":
			InterTime = 1
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,-35),"Scary",Vector2(1,1),false,1))
		"Ice":# > 持续时长
			InterTime = 1.29
			BuffEffectList.push_back(Global.add_Bullet("bd",GetObj,false,1,Vector2(0,10),"",""))
		"BloodFix":# > 持续时长
			InterTime = 1
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,15),"ThreeEyesFix",Vector2(1,1),false,1))
		"DefeReduce":
			InterTime = 0.49
			if GetObj is BaseMonster:
				GetObj.DefeReduce = LastValue
			elif GetObj is BaseHero:
				GetObj.DefeReduce = LastValue
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(-5,-45),"DefeReduce",Vector2(1,1),false,1))
		"Bleed":# > 0.35
			InterTime = 0.36
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,25),"BloodReduce",Vector2(0.5,0.5),false,1))
		"poision":# > 1.06
			InterTime = 1
			BuffEffectList.push_back(Global.add_Bullet("poision",GetObj,false,1,Vector2(-20,-55),"",""))
			BuffEffectList.push_back(Global.add_Bullet("posion_fire",GetObj,false,1,Vector2(10,-40),"",""))
		"Fire":
			InterTime = 0.81
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(10,-35),"Fire",Vector2(1,1),false,1))
		"stun":
			InterTime = 0.81
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,- 50),"Stun",Vector2(0.7,0.7),false,1))
		"EyeFix":
			InterTime = 0.45
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,-35),"EyeFix",Vector2(1,1),false,1))
		"DeadLink":
			InterTime = 1.39
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,0),"DeadLink_2",Vector2(1,1),false,1))
		"nlls":
			InterTime = 1.01
			OldPosition = GetObj.position.x
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(40,35),"nlls",Vector2(1,1),false,1))
		"silent":
			InterTime = 0.99
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(40,-35),"silent",Vector2(1,1),false,1))
		"Boundground":
			InterTime = 0.99
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(-5,55),"GroundFloor",Vector2(1,1),false,1))
		"speed_down":
			InterTime = 0.61
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,20),"SpeedDown",Vector2(1,1),false,1))
			var Bl = (1 - LastValue)
			if Bl < 0:
				Bl = 0
			if GetObj is BaseMonster:
				GetObj.speed = GetObj.iniSpeed * Bl
			elif GetObj is BaseHero:
				GetObj.walk_speed = 240 * Bl
		"slzbuff":
			if GetObj is BaseHero:
				var Levelslz = PlayerData.player_data["森罗阵"]["Level"]
				GetObj.slzjs2 = Levelslz * 0.02
			InterTime = 0.875
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,0),"slzbuff",Vector2(0.5,1),false,1))
		"Immobilize":
			InterTime = 0.69
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,0),"Immobilize",Vector2(1,1),false,1))
		"SuperArmor":
			pass
		"Indestructible":
			InterTime = 1
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,0),"Indestructible",Vector2(1,1),false,1))
		"Voodoo":
			InterTime = 0.9
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,-35),"Voodoo",Vector2(1,1),false,1))
		"DoubleFallPro":
			pass
		"PoisionBody":
			InterTime = 0.5
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,-20),"wdzt",Vector2(1,1),false,1))
func _on_buff_last_time_timeout() -> void:#buff结束时调用
	if BuffInfo["AttackKind"] == "SpecialBuff_1":
		for i in PlayerData.player_data["初始Buff"]:
			if i["Name"] == BuffInfo["Name"]:
				PlayerData.player_data["初始Buff"].erase(i)
	if BuffInfo["AddTime"] < 99999:
		RemoveBuff()

func _on_buff_value_reduce_time_timeout() -> void:#每次扣血调用
	match BuffInfo["Name"]:
		"Ice","stun","EyeFix","DeadLink","speed_down","Boundground","silent","Immobilize","Scary","SuperArmor","Indestructible":#不需要每过多长时间扣除什么的
			return
		"DefeReduce","DoubleFallPro","slzbuff","lpzbuff","tszbuff","tszbuff":
			return
		"Bleed","poision","Fire","Voodoo":#常态扣除
			if GetObj is BaseHero:
				GetObj.effect_reducehp(LastValue,BuffInfo["AttackKind"])
			elif GetObj is BaseMonster:
				if LastValue > 0:
					var Hurt = GetObj.get_Role_last_hurt(self)
					GetObj.HurtReduceHp(Hurt,self)
		"flls":
			if GetObj is BaseHero:
				if LastValue > 0:
					GetObj.reduce_Mp(LastValue)
		"nlls":#特殊类
			NewPosition = GetObj.position.x
			if GetObj is BaseHero:
				var get_value_hp = int(abs(NewPosition - OldPosition) * LastValue * 0.3)
				var get_value_mp = int(abs(NewPosition - OldPosition) * LastValue * 0.3)
				GetObj.effect_reducehp(get_value_hp,"real")
				RoleProp.roleprop.Mp -= get_value_mp
			elif GetObj is BaseMonster:
				var get_value_hp = abs(NewPosition - OldPosition) * LastValue
				GetObj.reduce_hp(get_value_hp)
			OldPosition = GetObj.position.x
func _on_special_effect_add_time_timeout() -> void:#每次添加特效调用
	match BuffInfo["Name"]:
		"flls":
			InterTime = 1
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,0),"flls",Vector2(1,1),false,1))
		"tszbuff":
			InterTime = 0.6
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,5),"tszbuff",Vector2(1,1),false,1))
		"lpzbuff":
			InterTime = 0.5
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,5),"lpzbuff",Vector2(1,1),false,1))
		"Ice":# > 4
			BuffEffectList.push_back(Global.add_Bullet("bd",GetObj,false,1,Vector2(0,10),"",""))
		"BloodFix":# > 持续时长
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,15),"ThreeEyesFix2",Vector2(1,1),false,1))
		"Bleed":# > 0.35
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,25),"BloodReduce",Vector2(0.5,0.5),false,1))
		"poision":# > 1.06
			BuffEffectList.push_back(Global.add_Bullet("posion_fire",GetObj,false,1,Vector2(10,-40),"",""))
		"Fire":# > 0.8
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(10,-35),"Fire",Vector2(1,1),false,1))
		"stun":# > 0.8
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,- 50),"Stun",Vector2(0.7,0.7),false,1))
		"EyeFix":# > 0.44
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,-35),"EyeFix",Vector2(1,1),false,1))
		"DeadLink":# > 0.45
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,0),"DeadLink_2",Vector2(1,1),false,1))
		"nlls":# > 1
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(40,35),"nlls",Vector2(1,1),false,1))
		"speed_down":
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,20),"SpeedDown",Vector2(1,1),false,1))
		"silent":
			InterTime = 1.01
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(40,-35),"silent",Vector2(1,1),false,1))
		"Boundground":
			InterTime = 1.01
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(-5,55),"GroundFloor",Vector2(1,1),false,1))
		"Immobilize":
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,0),"Immobilize",Vector2(1,1),false,1))
		"Scary":
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,-35),"Scary",Vector2(1,1),false,1))
		"DefeReduce":
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(-5,-45),"DefeReduce",Vector2(1,1),false,1))
		"SuperArmor":
			pass
		"Indestructible":
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,0),"Indestructible",Vector2(1,1),false,1))
		"DoubleFallPro":pass
		"Voodoo":
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,-35),"Voodoo",Vector2(1,1),false,1))
		"PoisionBody":
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,-20),"wdzt",Vector2(1,1),false,1))
		"slzbuff":
			InterTime = 0.875
			BuffEffectList.push_back(Global.add_SpecialEffect(GetObj,Vector2(0,0),"slzbuff",Vector2(0.5,1),false,1))
func AddBuffIcon():

	if GetObj is BaseHero:
		for i in Global.buff_box.get_children():
			if i.BuffName == BuffInfo["Name"]:
				i.queue_free()
		var Icon = Global.AddBuffIcon(Global.buff_box,BuffInfo)
		Icon.FatherBuff = self
		Icon.TotalTimes = TotalTimes
		Icon.LastHurt = LastValue
	elif GetObj is BaseMonster:
		return
		if GetObj.MyBlood != null:
			for i in GetObj.MyBlood.buff_list.get_children():
				if i.BuffName == BuffInfo["Name"]:
					i.queue_free()
			var Icon = Global.AddBuffIcon(GetObj.MyBlood.buff_list,BuffInfo)
			Icon.FatherBuff = self
			Icon.TotalTimes = TotalTimes
			Icon.LastHurt = LastValue
func RemoveBuff():
	for i in BuffEffectList:
		if i != null:
			i.queue_free()
	self.queue_free()
func StartBuff():
	BuffTime.start(float(BuffInfo["AddTime"]))
	if BuffInfo.has("ReduceInterval"):
		BuffReduceTime.start(float(BuffInfo["ReduceInterval"]))
	Specialeffectaddtime.start(InterTime)

func SetSpecialBuffTime():
	if PlayerData.player_data["初始Buff"].size() <= 0:
		return
	for i in PlayerData.player_data["初始Buff"]:

		if i["Name"] == BuffInfo["Name"]:
			i["AddTime"] = BuffTime.time_left

func _on_one_second_timeout() -> void:
	pass
#	if PlayerData.player_data["初始Buff"].size() <= 0:
#		return
#	for i in PlayerData.player_data["初始Buff"]:
#		i["AddTime"] -= 1
			
