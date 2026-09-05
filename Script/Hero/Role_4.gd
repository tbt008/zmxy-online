extends BaseHero
class_name role4
var WDWW: Monster138
@onready var hurt_box = $base_damagebox/HurtBox/HurtBox
var Interv: int
var IsFly: bool
var JDZ
func _ready() -> void:
	super._ready()
	super.onEqchange()
	Role_4()
func Role_4():
	RoleProp.Role1SXBJ = 0
	RoleProp.Role1SXxx = 0
	super.onEqchange()
	var level_1 = PlayerData.player_data["技能学习"]["技能1"]["等级"] + 1
	var level_2 = PlayerData.player_data["技能学习"]["技能2"]["等级"] + 1
	var level_3 = PlayerData.player_data["技能学习"]["技能3"]["等级"] + 1
	var level_4 = PlayerData.player_data["技能学习"]["技能4"]["等级"] + 1
	var level_5 = PlayerData.player_data["技能学习"]["技能5"]["等级"] + 1
	var level_6 = PlayerData.player_data["技能学习"]["技能6"]["等级"] + 1
	var level_7 = PlayerData.player_data["技能学习"]["技能7"]["等级"] + 1
	var level_8 = PlayerData.player_data["技能学习"]["技能8"]["等级"] + 1
	var level_9 = PlayerData.player_data["技能学习"]["技能9"]["等级"] + 1
	var level_10 = PlayerData.player_data["技能学习"]["技能10"]["等级"]
	self.objattackDic["hit1"] = {
		"power": RoleProp.roleprop.power * randf_range(1,1.2),
		"hurtBack":[2,0],
		"attackKind": "physics",
		"HitInterv":1,
		"WSValue": randi_range(3,5)
	}
	self.objattackDic["hit2"] = {
		"power": RoleProp.roleprop.power * randf_range(0.9,1.1),
		"hurtBack":[2,0],
		"attackKind": "physics",
		"HitInterv":1,
		"WSValue": randi_range(3,5)
	}
	self.objattackDic["hit3"] = {
		"power": RoleProp.roleprop.power * randf_range(0.9,1.1),
		"hurtBack":[2,-2],
		"attackKind": "physics",
		"HitInterv":1,
		"WSValue": randi_range(3,5)
	}
	self.objattackDic["qlj"] = {
		"power": RoleProp.roleprop.power * (2.5 + (level_1 * 0.4)),
		"hurtBack":[20,-8],
		"attackKind": "physics",
		"WSValue": randi_range(30,34)
	}
	self.objattackDic["dcj"] = {
		"power": RoleProp.roleprop.power * (0.6 + (level_2 * 0.3)),
		"hurtBack":[8,-6],
		"attackKind": "magic",
		"WSValue": randi_range(12,15)
	}
	self.objattackDic["tkj"] = {
		"power": 35 + RoleProp.roleprop.power * (3 + (level_4 * 0.5)),
		"hurtBack":[1,1],
		"attackKind": "physics",
		"WSValue": randi_range(15,20)
	}
	self.objattackDic["mmw"] = {
		"power": RoleProp.roleprop.power * (2 + (level_5 * 0.2)),
		"hurtBack":[-4,-2],
		"attackKind": "magic",
		"WSValue": randi_range(10,12)
	}
	if PlayerData.player_data["技能学习"]["技能10"]["等级"] > 0:
		self.objattackDic["jdz"] = {
			"power": RoleProp.roleprop.power * (1.5 + (level_6 * 0.1)),
			"hurtBack":[0,0],
			"attackKind": "magic",
			"WSValue": randi_range(6,8),
			"addeffect":{
				"Name": "Voodoo",
				"AddTime": 5,
				"ReduceInterval": 1,
				"value": int(RoleProp.roleprop.power * 0.1),
				"CanAdd":true,
				"AttackKind": "real",
				"DeBuff": true
			}
		}
		self.objattackDic["zq"] = {
			"power": RoleProp.roleprop.power * (0.7 + (level_8 * 0.2)),
			"hurtBack":[2,-6],
			"attackKind": "magic",
			"WSValue": randi_range(8,10),
			"addeffect":{
				"Name": "Voodoo",
				"AddTime": 5,
				"ReduceInterval": 1,
				"value": int(RoleProp.roleprop.power * 0.1),
				"CanAdd":true,
				"AttackKind": "real",
				"DeBuff": true
			}
		}
		self.objattackDic["lhsq"] = {
			"power": RoleProp.roleprop.power * (1.35 + (level_7 * 0.1)),
			"hurtBack":[-12,-6],
			"attackKind": "magic",
			"WSValue": randi_range(8,10),
			"addeffect":{
				"Name": "Voodoo",
				"AddTime": 5,
				"ReduceInterval": 1,
				"value": int(RoleProp.roleprop.power * 0.1),
				"CanAdd":true,
				"AttackKind": "real",
				"DeBuff": true
			}
		}
	else:
		self.objattackDic["jdz"] = {
				"power": RoleProp.roleprop.power * (1 + (level_6 * 0.1)),
				"hurtBack":[0,0],
				"attackKind": "magic",
				"WSValue": randi_range(6,8),
			}
		self.objattackDic["zq"] = {
				"power": RoleProp.roleprop.power * (1 + (level_8 * 0.1)),
				"hurtBack":[2,-6],
				"attackKind": "magic",
				"WSValue": randi_range(8,10),
			}
		self.objattackDic["lhsq"] = {
				"power": RoleProp.roleprop.power * (1.35 + (level_7 * 0.1)),
				"hurtBack":[-12,-6],
				"attackKind": "magic",
				"WSValue": randi_range(8,10),
			}
func _physics_process(delta: float) -> void:
	if IsFly:
		gravity = 0
	else:
		gravity = -980.0
	Role_4()
	super._physics_process(delta)
	if NoLimitBuff() :
		if Input.is_action_pressed("normalhit") and not is_be_attacking and not is_using_skills and Interv <= 0:
			match hit_count:
				0:
					ShovelHit_1()
				1:
					ShovelHit_2()
				2:
					ShovelHit_3()
				
func ShovelHit_1():
	super.get_hit_data("hit1")
	get_action = "hit1"
	velocity.x = 0
	is_attacking = true
	role_action_player.play("hit1_1")
	await role_action_player.animation_finished
	turn_to_wait()
	hit_count = 1
	is_attacking = false
	return
func ShovelHit_2():
	super.get_hit_data("hit2")
	get_action = "hit2"
	is_can_move_attack_in_sky()
	is_attacking = true
	role_action_player.play("hit2_1")
	await role_action_player.animation_finished
	turn_to_wait()
	hit_count = 2
	is_attacking = false
	return
func ShovelHit_3():
	super.get_hit_data("hit3")
	get_action = "hit3"
	if PlayerDir:
		velocity.x = 180
	else:
		velocity.x = -180
	is_attacking = true
	role_action_player.play("hit3_1")
	await role_action_player.animation_finished
	turn_to_wait()
	hit_count = 0
	is_attacking = false
	return

func ShovelQLJ():
	self.Role1SkillInter["qlj"] = 4.8
	velocity.x = 0
	get_action = "qlj"
	is_using_skills = true
	super.get_hit_data("qlj")
	is_attacking = true
	role_action_player.play("qlj_1")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
	
func ShovelDCJ():
	self.Role1SkillInter["dcj"] = 4.8
	velocity.x = 0
	get_action = "dcj"
	is_using_skills = true
	super.get_hit_data("dcj")
	is_attacking = true
	role_action_player.play("dcj_1")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	

func ShovelTKJ():
	self.Role1SkillInter["tkj"] = 2.4
	get_action = "tkj"
	is_using_skills = true
	super.get_hit_data("tkj")
	is_attacking = true
	role_action_player.play("tkj_1")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	

func ShovelMMW():
	self.Role1SkillInter["mmw"] = 3
	velocity.x = 0
	get_action = "mmw"
	is_using_skills = true
	super.get_hit_data("mmw")
	is_attacking = true
	role_action_player.play("mmw_1")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	

func ShovelZQ():
	self.Role1SkillInter["zq"] = 4.8
	velocity.x = 0
	get_action = "zq"
	is_using_skills = true
	super.get_hit_data("zq")
	is_attacking = true
	role_action_player.play("zq_1")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	

func ShovelWDWW():
	self.Role1SkillInter["wdww"] = 4.8
	if is_on_floor():
		velocity.x = 0
	get_action = "wdww"
	is_using_skills = true
	is_attacking = true
	role_action_player.play("wdww_2")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func ShovelMBYJ():
	self.Role1SkillInter["lhsq"] = 4.8
	velocity.x = 0
	get_action = "lhsq"
	is_using_skills = true
	super.get_hit_data("lhsq")
	is_attacking = true
	role_action_player.play("mbyj")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false			
func ShovelJDZ():
	self.Role1SkillInter["jdz"] = 6
	velocity.x = 0
	get_action = "jdz"
	is_using_skills = true
	super.get_hit_data("jdz")
	is_attacking = true
	role_action_player.play("jdz")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func ShovelWDZT():
	self.Role1SkillInter["wdzt"] = 4
	if is_on_floor():
		velocity.x = 0
	get_action = "wdzt"
	is_using_skills = true
	is_attacking = true
	role_action_player.play("wdzt")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func AddShovelEffect1():
	var Position = Vector2()
	if PlayerDir:
		Position = Vector2(35,0)
	else:
		Position = Vector2(-35,0)
	Global.addRoleBullet_(self.Bullet,Position + position,!PlayerDir,"Role4Bullet3",objattackDic["mmw"])
func ADDMBYJ():
	Global.AddRole4Bullet(self.Bullet,self,position)
func CallWDWW():
	var Position: Vector2
	if PlayerDir:
		Position = Vector2(30,-30)
	else:
		Position = Vector2(-30,-30)
	if WDWW != null:
		WDWW.queue_free()
	var Target = GetMonster()
	if Target == null:
		return
	WDWW = Global.Create_Monster(138,get_parent().get_parent().monster,position + Position) as Monster138
	WDWW.SHp = Target.SHp * (0.25 + PlayerData.player_data["技能学习"]["技能9"]["等级"] * 0.02)
	WDWW.Hp = WDWW.SHp
	WDWW.MyTarget = Target
func CallJDZ():
	if JDZ != null:
		JDZ.queue_free()
	JDZ = Global.addRoleBullet_(self.Bullet,position + Vector2(0,30),false,"Role4Bullet6",objattackDic["jdz"])
	JDZ.queue_timer.start(10)
func AddWDZT():
	for i in buff.get_children():
		if i != null:
			if i.BuffInfo["Name"] == "PoisionBody":
				i.queue_free()
	Global.AddBuff(self.buff,{
	"Name": "PoisionBody",
	"AddTime": 6,
	"ReduceInterval": 0,
	"value": 0,
	"CanAdd":false,
	"CanRemove":false,
	"AttackKind": "",
	
})
func GetMonster():
	var MaxHp = 0
	var TT: BaseMonster
	var MonsterList = get_parent().get_parent().monster.get_children()
	if MonsterList.size() <= 0:
		return null
	for i in MonsterList:
		if i != null:
			if not i.NoTarget:
				if i is BaseMonster:
					if i.Hp >= MaxHp and not i is Monster138 and not i is Monster133:
						if i is Monster49 or i is Monster50:
							if not i.is_stop:
								TT = i
								MaxHp = i.Hp
						else:
								TT = i
								MaxHp = i.Hp
	return TT	
func ADDMusic(num: int):
	match int(num):
		1:#铲1
			Global.addSound_(self,"res://Music/Hero/Role4/ShovelHit1.mp3")
		2:#铲2
			Global.addSound_(self,"res://Music/Hero/Role4/ShovelHit2.mp3")
		3:#铲3
			Global.addSound_(self,"res://Music/Hero/Role4/ShovelHit3.mp3")
		4:#弓1
			Global.addSound_(self,"res://Music/Hero/Role4/ArrowHit1.mp3")			
		5:#弓2
			Global.addSound_(self,"res://Music/Hero/Role4/ArrowHit2.mp3")	
		6:#铲强力击
			Global.addSound_(self,"res://Music/Hero/Role4/Shovelqlj.mp3")	
		7:#弓强力击
			Global.addSound_(self,"res://Music/Hero/Role4/Arrowqlj.mp3")	
		8:#铲多重击
			Global.addSound_(self,"res://Music/Hero/Role4/Shoveldcj.mp3")	
		9:#弓多重击
			Global.addSound_(self,"res://Music/Hero/Role4/Arrowdcj.mp3")	
		10:#铲木魔舞
			Global.addSound_(self,"res://Music/Hero/Role4/Shovelmmw.mp3")
		11:#弓木魔舞
			Global.addSound_(self,"res://Music/Hero/Role4/Arrowmmw.mp3")
		12:#铲瘴气
			Global.addSound_(self,"res://Music/Hero/Role4/Shovelzq.mp3")
		13:#弓瘴气
			Global.addSound_(self,"res://Music/Hero/Role4/Arrowzq.mp3")
		14:#弓腾空击
			Global.addSound_(self,"res://Music/Hero/Role4/Arrowtkj.mp3")
		15:#剧毒阵
			Global.addSound_(self,"res://Music/Hero/Role4/jdz.mp3")
		16:#灵魂摄取
			Global.addSound_(self,"res://Music/Hero/Role4/lhsq.mp3")
		17:#猛毒素
			Global.addSound_(self,"res://Music/Hero/Role4/mds.mp3")
		18:#巫毒娃娃
			Global.addSound_(self,"res://Music/Hero/Role4/wdww.mp3")
		19:#万毒加护
			Global.addSound_(self,"res://Music/Hero/Role4/effect6_repeat.mp3")
func _on_nor_mal_hit_interv_timeout() -> void:
	Interv -= 1
func ToTop():
	if PlayerDir:
		velocity = Vector2(-750,-800)
	else:
		velocity = Vector2(750,-800)
func RemoveSpeed():
	
	velocity = Vector2(0,0)
func Rush():
	if PlayerDir:
		velocity.x = 600
	else:
		velocity.x = -600
func FlyTop():
	velocity.y = 0
	velocity.y = -600
func ToTop2():
	IsFly = true
	if PlayerDir:
		velocity = Vector2(0,-1800)
	else:
		velocity = Vector2(0,-1800)
func _on_hurt_box_area_entered(area: Area2D) -> void:
	IsInSky = false
	CUreCureCount = 0
	CureValue = 1
	IdleCount = 0
	#获取属性获取的是放出该伤害的怪物，获取到的伤害和类型以及击退则为该造成伤害的东西,该东西只需要有该伤害的名字即可
	Global.TotalHurtCount += 1
	var Target = area.get_parent().get_parent()#造成该伤害的目标
	var MonsterTarget: BaseMonster
	MonsterTarget = checkMonster(area)#获取到哪个怪物，放出该伤害的怪物
	if Target == null or MonsterTarget == null:
		return
	if Target.objattackDic.size() == 0:
		return
	if MonsterTarget is Monster47:
		Global.PlayerBeHitCount += 1
	var last_hit = get_Monster_last_hurt(MonsterTarget,Target) * (1 - slzjs) * (1 - slzjs2)
	if MonsterTarget != null:
		if MonsterTarget.IsLpz:
			var Levellpz = PlayerData.player_data["落魄阵"]["Level"]
			MonsterTarget.lpzjs = Levellpz * 0.01
			last_hit *= (1 - MonsterTarget.lpzjs)	
	var TotalCureMonster = int(MonsterTarget.ebol * last_hit)
	MonsterTarget.cure_hp(TotalCureMonster)
	if self.IsWDZT:
		var ReduecHurt = int(last_hit * (0.7 - PlayerData.player_data["技能学习"]["技能3"]["等级"] * 0.02))
		var CureHurt = last_hit - ReduecHurt
		last_hit = ReduecHurt
		if randi_range(0,100) < 20:
			cure_Hp(CureHurt)
	if MonsterTarget != null:
		MonsterTarget.total_hit += last_hit
		if MonsterTarget is Monster141:
			effect_reducehp(int(RoleProp.roleprop.SHp * 0.01),"real")
			Global.AddMonster141Aura(self.Bullet,self.position,MonsterTarget)
		if self.IsWDZT:
			if Global.CheckWD(MonsterTarget) < 7:
				Global.AddBuff(MonsterTarget.buff,{
				"Name": "Voodoo",
				"AddTime": 5,
				"ReduceInterval": 1,
				"value": int(RoleProp.roleprop.power * 0.1),
				"CanAdd":true,
				"CanRemove":false,
				"AttackKind": "real",
				"DeBuff": true
			})
	Global.TotalRoleHurt += int(last_hit)
	if not is_miss:
		Global.addSound_(self,"res://Music/Hero/68_Role3_beAttack.mp3")
		Global.add_mr_hurt(pz,Vector2(5,-20))
		if not IsTMc:
			if MonsterTarget.objattackDic[Target.hit_name].has("HitProtect"):
				CurrentProtect += MonsterTarget.objattackDic[Target.hit_name]["HitProtect"]
			else:
				CurrentProtect += randf_range(9.8,20.2)
	if is_miss or RoleProp.is_ws_state or IsSuperArmor or IsWDZT:
		is_be_attacking = false
	else:
		be_hit_back(MonsterTarget,Target)#这俩是被击退，到时候无双无视这俩就是霸体
		state_behit()#
	reduce_hp(last_hit,MonsterTarget,Target)
func state_behit():
	IsFly = false
	IsInSky = false
	is_using_skills = false
	is_be_attacking = true
	role_action_player.play("hurt")
	get_action = "hurt"
	await role_action_player.animation_finished
	is_be_attacking = false
func Fall():
	IsFly = false
func _on_hit_box_area_entered(area: Area2D) -> void:
	if get_action == "lhsq":
		var mm = area.get_parent().get_parent()
		var CureValue: float = 1
		CureValue += 0.3 * float((RoleProp.roleprop.SHp - RoleProp.roleprop.Hp)) / float(RoleProp.roleprop.SHp)
		if mm is BaseMonster:
			var CurePower = objattackDic["lhsq"]["power"] * (0.2 + (PlayerData.player_data["技能学习"]["技能7"]["等级"]) * 0.03) * CureValue
			cure_Hp(CurePower)
	if objattackDic.has(get_action):
		if objattackDic[get_action].has("addeffect"):
			var Monster = area.get_parent().get_parent()
			if Monster != null:
				if Monster is BaseMonster:
					if objattackDic[get_action]["addeffect"]["Name"] == "Voodoo":
						if Global.CheckWD(Monster) < 7:
							Global.AddBuff(Monster.buff,objattackDic[get_action]["addeffect"])
					else:
						Global.AddBuff(Monster.buff,objattackDic[get_action]["addeffect"])
