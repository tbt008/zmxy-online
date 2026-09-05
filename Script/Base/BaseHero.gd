extends BaseObject
class_name BaseHero
@onready var zhen_fa: Timer = $ZhenFa
@onready var effect_body: Node2D = $Action/EffectBody

@onready var role_action_player: AnimationPlayer = $RolePlayer
@onready var base_damagebox: Node2D = $base_damagebox
@onready var damage_text: Node2D = $Damage_Text
@onready var pz: CollisionShape2D = $pz
@onready var action: Node2D = $Action
@onready var WSTimer = $WSTimer
@onready var magic_weapon: Node2D = $MagicWeapon
@onready var MyHurtBox = $base_damagebox/HurtBox/HurtBox
@onready var name_: Label = $Name_
@onready var RoleBody: Sprite2D = $Action/RoleBody
@onready var RoleEq: Sprite2D = $Action/RoleEquipment
@onready var Bullet = $Bullet
@onready var wings: AnimatedSprite2D = $Action/Wings
@onready var buff: Node = $Buff
@onready var role_equipment: Sprite2D = $Action/RoleEquipment
@onready var tx: AnimatedSprite2D = $tx
@onready var toukui: AnimatedSprite2D = $Action/EffectBody/toukui
@onready var jianjia: AnimatedSprite2D = $Action/EffectBody/jianjia
@onready var huwan: AnimatedSprite2D = $Action/EffectBody/huwan
@onready var shenti: AnimatedSprite2D = $Action/EffectBody/shenti
@onready var yaodai: AnimatedSprite2D = $Action/EffectBody/yaodai
@onready var xiabai: AnimatedSprite2D = $Action/EffectBody/xiabai
@onready var wuqi: AnimatedSprite2D = $Action/EffectBody/wuqi
var xrbl: float
var IsXr: bool
var tszzs:float
var NoDeBuff: bool = false
var Role5Bt: bool
var CanMoveWhenUseSkill: bool
var tszbsjm: float
var slzjs: float
var slzjs2: float
var ZhenFaCd: float
var Istsz: bool
var canglongremove: bool
var SXYRCannotCure:bool
var MyShallow: role2shallow
var IsDoubleFallPro: bool
var IsIndestructible: bool
var ran_num = randi_range(0,100)
var Onfloor: bool
var IsSuperArmor: bool
var IsScary: bool
var IsDefeReduce: bool
var IsDeath:bool = false
var DefeReduce: float
var NewPosition: float
var OldPosition:float
var OldIsCheck:bool
var IsTMc: bool
var Is_sdBuff: bool
var IdleCount: int = 0
var IsInSky:bool = false
var CureValue: float = 1
var IsUseSMB = false
var CUreCureCount: int = 0
var is_silent:bool
var is_Bound_to_the_ground: bool
var is_jdy: bool
var is_CureHp: bool
var CureHpValue: int
var Skill_Clam: float
var PlayerDir: bool = false
var MaxProtect: float = 100
var CurrentProtect: float
var Mgtarget:BaseMagicWeapon
var lyfb_calm: float
var slz_calm: float
var hmz_calm: float
var is_stun = false
var is_jump = false
var is_speedDown: bool
var get_action = "wait"
var is_Immobilize = false
var needProtect = false
var need_removeProtect = false
var BloodFix: bool = false
var IsWDZT: bool
var SMB1
var Isslz: bool
var HitDic = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": "real"
}
var Role1SkillInter = {
	"slz":0,"hytj":0,"lys":0,"lyfb":0,"hmz":0
	,"hyjj":0,"jdy":0,"qsez":0,"zz":0,"jdy2":0,
	
	"blb":0,"xbz":0,"shy":0,"tjgl":0,"smb":0,"sgq":0,
	"myhc":0,"jhsj":0,"jgz":0,
	
	"sd":0,"ssp":0,"jsp":0,"dgq":0,"xgq":0,"tmc":0,
	"syzq":0,"dj":0,"zznh":0,
	
	"qlj":0,"dcj":0,"wdzt":0,"tkj":0,"mmw":0,"jdz":0,
	"lhsq":0,"zq":0,"wdww":0,
	
	"slq":0,"blq":0,"cxq":0,"llrd":0,"lljy":0,"tllz":0,
	"ygth":0,"xyq":0,"fhf":0
}
var Role1SkillMaxInter = {
	"slz":0,"hytj":0,"lys":0,"lyfb":0,"hmz":0
	,"hyjj":0,"jdy":0,"qsez":0,"zz":0,
	
	"blb":0,"xbz":0,"shy":0,"tjgl":0,"smb":0,"sgq":0,
	"myhc":0,"jhsj":0,"jgz":0,
	
	"sd":0,"ssp":0,"jsp":0,"dgq":0,"xgq":0,"tmc":0,
	"syzq":0,"dj":0,"zznh":0,
	
	"qlj":0,"dcj":0,"wdzt":0,"tkj":0,"mmw":0,"jdz":0,
	"lhsq":0,"zq":0,"wdww":0
}
var hit_name: String
var is_call = false
func _ready() -> void:
	RoleProp.SourcePlayer = self
	#role_action_player.play("wait")
	walk_speed = 240
	RoleProp.baseroleprop.Level = PlayerData.player_data.玩家等级
	RoleProp.baseroleprop.exp = PlayerData.player_data.玩家当前经验
	RoleProp.set_basic_prop()
	RoleProp.set_full_Hp()
	RoleProp.set_full_Mp()
	addMagicWeapon()
	AddTx()
func NullSZFBCase():#当实战法宝为空时
	if PlayerData.player_data["实战法宝"] == "":
		if Mgtarget != null:
			Mgtarget.queue_free()
		if PlayerData.player_data["法宝"].size() != 0:
			addMagicWeapon()
func on_SZFBChange():#当实战法宝更换时
	if Global.should_change:
		if Mgtarget != null:
			Mgtarget.queue_free()
		if PlayerData.player_data["法宝"].size() != 0:
			addMagicWeapon()
		Global.should_change = false
func CheckRemoveOrAddFB():#检测是应该添加法宝还是清除法宝
	if PlayerData.player_data["法宝"].size() == 0:
		if Mgtarget != null:
			Mgtarget.queue_free()
	else:
		if Mgtarget == null:
			addMagicWeapon()	
func useFB():
	if Mgtarget.EnoughMp():
		if Mgtarget.is_canuse:
			Mgtarget.is_use = true

func WSSkill():
	if PlayerData.player_data["时装"].size() <= 0:
		return
	var SZName = Global.GetName(PlayerData.player_data["时装"][0]["名字"])
	var Pz = str(PlayerData.player_data["时装"][0]["名字"]).split(SZName)[0]
	if Pz != "putong":
		match SZName:
#			"ttzssz":
#				ADDTtzsEffect()
			"nmwsz":
				ADDNMWEffect()
			"zlwsz":
				ADDZLWEffect()
func _physics_process(delta: float) -> void:
	jsfzsy()
	UseZhenFa()
	SetWingsOffset()
	if not SXYRCannotCure:
		if PlayerData.ChekEqzb("头衔","sxyr"):
			SXYRCannotCure = true
	for i in Role1SkillInter:
		if Role1SkillInter[i] > 0:
			Role1SkillInter[i] -= 0.1
	if MainSet.set_data["NotShowRoleBody"]:
		RoleBody.visible = false
		$Action/Wings.visible = false
		$Action/Wings.modulate = Color(1,1,1,0)
	else:
		if not PlayerData.player_data["翅膀显示"]:
			$Action/Wings.visible = false
			$Action/Wings.modulate = Color(1,1,1,0)
		else:
			$Action/Wings.modulate = Color(1,1,1,1)
	if PlayerData.player_data["头衔显示"]:
		tx.visible = true
	else:
		tx.visible = false
	if MainSet.set_data["NotShowRoleEQ"]:
		role_equipment.visible = false
	if IsDeath :
		return
	SetSZValue()
	AddTx()
	if RoleProp.ws_value >= RoleProp.max_ws_value:
		if Input.is_action_just_pressed("无双"):
			if not RoleProp.is_ws_state:
				WSSkill()
			RoleProp.is_ws_state = true
	if CureValue >= 4:
		CureValue = 4
	if is_on_floor():
		if not Onfloor:
			NewPosition = self.position.y
			OldIsCheck = false
#			if get_parent().get_parent() is Level22:
#				if abs(NewPosition - OldPosition) >= 310:
#					var PositionReducevalue = float(abs(NewPosition - OldPosition)) / 20.0 * RoleProp.roleprop.SHp * 0.01
#					effect_reducehp(PositionReducevalue,"real")
		Onfloor = true
	if not is_on_floor():
		Onfloor = false
	if not OldIsCheck:
		if velocity.y > 0:
			OldPosition = self.position.y
			OldIsCheck = true
	if velocity.y <= 0:
		OldIsCheck = false
	ImproveSelfRecoveryWhenIdle()
	CheckAddBuff()

	if action.scale.x == - 1:
		PlayerDir = true
	else:
		PlayerDir = false
	if int(MemoryClass.get_cd_number()) <= 6:
		name_.text = str(MainSet.set_data["name" + str(MemoryClass.get_cd_number())])
	else:
		name_.text = str(MainSet.set_data["其他存档"][str(MemoryClass.get_cd_number())]["name"])
#	print(MainSet.set_data["name" + str(MemoryClass.get_cd_number())])
#	#print()
#	print(Global.cd_path)
	selfProtect()
	RoleProp.Directon = PlayerDir
	NullSZFBCase()
	on_SZFBChange()
	CheckRemoveOrAddFB()
#==============法宝相关操作======================		
	if RoleProp.is_ws_state:
		if WSTimer.is_stopped():
			WSTimer.start(0.1)
	if Input.is_action_just_pressed("down"):
		set_collision_mask_value(6,false)
		await get_tree().create_timer(0.5).timeout
		set_collision_mask_value(6,true)
		get_action = "down"
	if death() and not IsDeath:
		IsDeath = true
		Global.RemoveAAllBuff()
		velocity.x = 0
		velocity.y = 0
		get_action = "death"
		role_action_player.play("death")
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://Scene/Level/defeat.tscn")
		return
	RoleProp.up_level()
	RoleProp.role_pos_x = position.x
	RoleProp.role_pos_y = position.y
	RoleProp.role_pos = position
	remove_hit_data()
	if not is_on_floor():
		if self is role1:
			hit_count = 0
		elif self is role3:
			hit_count = 1
		elif self is role4:
			hit_count = 1
		elif self is role5:
			hit_count = 4
		velocity.y -= gravity * delta
	if is_on_floor() and velocity.y == 0:
		jump_count = 0
	if check_can_wait():
		role_action_player.play("wait")
		get_action = "wait"
	#检测何时可以做静止动作	
	if not NoLimitBuff():
		IsInSky = false
		if not IsTMc:
			if not IsScary:
				velocity.x = 0
				role_action_player.play("hurt")
			else:
				if IsScary:
					WhenScary()
	if Input.is_action_pressed("MagicWeapon"):
		if not get_parent().get_parent() is Level17 and not get_parent().get_parent() is Level22:
			if Mgtarget != null:
				if Mgtarget is GhostDoll:
					useFB()
				else:
					if NoLimitBuff():
						useFB()
	if is_Immobilize:
		velocity = Vector2(0,0)
	if not NoLimitBuff():
		is_using_skills = false
	if NoLimitBuff():
		if IsTMc:
			if self is role3:
				if Input.is_action_pressed("slz"):
					get_skill("tmc2")
				if Input.is_action_pressed("lys"):
					get_skill("tmc2")
				if Input.is_action_pressed("lyfb"):
					get_skill("tmc2")
				if Input.is_action_pressed("hmz"):
					get_skill("tmc2")
				if Input.is_action_pressed("hytj"):
					get_skill("tmc2")
			else:
				if CanNormalControl():
					NoarmalControl()
		else:
			if CanNormalControl():
					NoarmalControl()
	Global.Player_dir = PlayerDir
	move_and_slide()
	
func CanNormalControl():
	if not self is role5:
		if is_attacking == false and is_be_attacking == false and is_using_skills == false and not death():
			return true
	else:
		if CanMoveWhenUseSkill:
			if not death():
				return true
		else:
			if is_attacking == false and is_be_attacking == false and is_using_skills == false and not death():
				return true
	return false
func NoarmalControl():
	if IsUseSMB:
		return
	
	
	if not self is role5:
		NorMalMove()
	else:
		
		if CanMoveWhenUseSkill:
			var direction_ = Input.get_axis("move_left", "move_right")
			if direction_:
				velocity.x = direction_ * walk_speed * 0.7
			else:
				velocity.x = move_toward(velocity.x, 0, walk_speed * 0.7)
		else:
			NorMalMove()
	#检测移动
	if Input.is_action_just_pressed("jump"):
		if not is_Bound_to_the_ground:
			jump()
	if Input.is_action_pressed("slz") and not is_using_skills:
		var Skill_name = PlayerData.player_data["技能学习"]["技能键位"]["Y"]
		get_skill(Skill_name)
	if Input.is_action_pressed("lys") and not is_using_skills:
		var Skill_name = PlayerData.player_data["技能学习"]["技能键位"]["U"]
		get_skill(Skill_name)
	if Input.is_action_pressed("lyfb") and not is_using_skills:
		var Skill_name = PlayerData.player_data["技能学习"]["技能键位"]["I"]
		get_skill(Skill_name)
	if Input.is_action_pressed("hmz") and not is_using_skills:
		var Skill_name = PlayerData.player_data["技能学习"]["技能键位"]["O"]
		get_skill(Skill_name)
	if Input.is_action_pressed("hytj") and not is_using_skills:
		var Skill_name = PlayerData.player_data["技能学习"]["技能键位"]["L"]
		get_skill(Skill_name)
func NorMalMove():
	var direction_ = Input.get_axis("move_left", "move_right")
	if direction_ > 0:
		if check_on_floor() and is_attacking == false and is_be_attacking == false and is_using_skills == false:
			role_action_player.play("run")
			get_action = "run"
		action.scale.x = -1
		base_damagebox.scale.x = -1
	elif direction_ < 0:
		if check_on_floor() and is_attacking == false and is_be_attacking == false and is_using_skills == false:
			role_action_player.play("run")
			get_action = "run"
		action.scale.x = 1
		base_damagebox.scale.x = 1
	else:
		if get_action == "run":
			get_action = ""
	if direction_:
		velocity.x = direction_ * walk_speed * RoleProp.ws_up_power
	else:
		velocity.x = move_toward(velocity.x, 0, walk_speed * RoleProp.ws_up_power)
func NoLimitBuff():
	return not is_ice and not is_stun and not is_EyeFix and not IsDeath and not is_Immobilize and not IsScary
func turn_to_wait():
	if not is_on_floor():
		role_action_player.play("wait")
func do_normalhit_1():
	pass
func do_normalhit_2():
	pass
func do_normalhit_3():
	pass
func do_normalhit_4():
	pass
func do_slz():
	pass
func do_zz():
	pass
func do_lys():
	pass
func do_lyfb():
	pass
func do_hmz_pro():
	pass
func do_hytj():
	pass
func do_hyjj():
	pass
func do_jdy_2():
	pass
func do_jdy():
	pass
func do_qsez():
	pass
func Skill_Blb():
	pass
func Skill_Tjgl():
	pass
func Skill_XBZ():
	pass
func Skill_SHY():
	pass
func Skill_SMB():
	pass
func Skill_SMB2():
	pass
func Skill_SGQ():
	pass
func Skill_MYHC():
	pass
func Skill_JGZ():
	pass
func Skill_JHSJ():
	pass
func Skill_SD():
	pass
func Skill_ZZNH():
	pass
func Skill_SSP():
	pass	
func Skill_JSP():
	pass
func Skill_DGQ():
	pass
func Skill_XGQ():
	pass	
func Skill_SYZQ():
	pass	
func Skill_DJ():
	pass
func Skill_TMC2():
	pass
func Skill_TMC():
	pass
func ShovelQLJ():
	pass		
func ShovelDCJ():
	pass
func ShovelTKJ():
	pass
func ShovelMMW():
	pass
func ShovelZQ():
	pass
func ShovelWDWW():
	pass
func ShovelMBYJ():
	pass
func ShovelJDZ():
	pass
func ShovelWDZT():
	pass
func UseSLQ():
	pass
func UseCXQ():
	pass
func UseBLQ():
	pass
func UseXYQ():
	pass
func UseLLRD():
	pass
func UseLLJY():
	pass
func UseTLLZ():
	pass
func UseYGTH():
	pass
func UseFHF():
	pass	
func is_can_move_attack_in_sky():
	if is_on_floor() and is_attacking:
		velocity.x = 0
func check_on_floor():
	return velocity.y == 0
func check_can_wait():
	return velocity.x == 0 and not is_attacking and not is_be_attacking and velocity.y == 0 and not death() and get_action != "run" and not IsTMc
func checkCanuseSomeSkill():
	return not is_attacking and not is_be_attacking and velocity.y == 0 and not death()
func jump():
	is_jump = true
	if jump_count < 2 and is_attacking == false and is_be_attacking == false:
		velocity.y = jump_power
		if jump_count == 0:
			jump_count = 1
			role_action_player.play("jump1")	
			get_action = "jump1"
			await role_action_player.animation_finished
			role_action_player.play("drop")
			await role_action_player.animation_finished
		else:
			jump_count = 2
			role_action_player.play("jump2")
			get_action = "jump2"	
			await role_action_player.animation_finished
			role_action_player.play("drop")
			await role_action_player.animation_finished
	is_jump = false

func get_hit_data(hit_name_:String):
	HitDic = objattackDic[hit_name_]
	
func remove_hit_data():
	if not is_attacking:
		HitDic = {
			"power": 0,
			"hurtBack":[0,0],
			"attackKind": "real"
		}

func state_behit():
	IsInSky = false
	is_be_attacking = true
	is_using_skills = false
	role_action_player.play("hurt")
	get_action = "hurt"
	await role_action_player.animation_finished
	is_be_attacking = false
	

	
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
	if self is role3 and RoleProp.is_ws_state:
		last_hit = int(last_hit * 0.63)
	if MonsterTarget != null:
		MonsterTarget.total_hit += last_hit
		if MonsterTarget is Monster141:
			effect_reducehp(int(RoleProp.roleprop.SHp * 0.01),"real")
			Global.AddMonster141Aura(self.Bullet,self.position,MonsterTarget)
	Global.TotalRoleHurt += int(last_hit)
	if not is_miss:
		if self is role1:
			Global.addSound_(self,"res://Music/Hero/49_Role1_beAttack.mp3")
		elif self is role2:
			Global.addSound_(self,"res://Music/Hero/62_Role2_beAttack.mp3")
		elif self is role5:
			Global.addSound_(self,"res://Music/Hero/Role5/13_hurtStand.mp3")
		else:
			Global.addSound_(self,"res://Music/Hero/68_Role3_beAttack.mp3")
		Global.add_SpecialEffect(self,Vector2(0,0),"RoleBeHit",Vector2(1,1),false,1)
		if not IsTMc:
			if MonsterTarget.objattackDic[Target.hit_name].has("HitProtect"):
				CurrentProtect += MonsterTarget.objattackDic[Target.hit_name]["HitProtect"]
			else:
				CurrentProtect += randf_range(9.8,20.2)
	if self is role3:		
		if randi_range(0,100) <= 2 + PlayerData.player_data["技能学习"]["技能10"]["等级"] * 0.5:
			var Level = PlayerData.player_data["技能学习"]["技能10"]["等级"]
			if Level > 0:
				if not get_parent().get_parent() is Level17 and not get_parent().get_parent() is Level22:
					cure_Hp(RoleProp.roleprop.power * (0.5 + Level * 0.03))
					#return
	if self is role1 or self is role2 or self is role4:
		if is_miss or RoleProp.is_ws_state or IsSuperArmor:
			is_be_attacking = false
		else:
			be_hit_back(MonsterTarget,Target)#这俩是被击退，到时候无双无视这俩就是霸体
			state_behit()#
	elif self is role3:
		if is_miss  or Is_sdBuff or IsTMc or IsSuperArmor:
			is_be_attacking = false
		else:
			be_hit_back(MonsterTarget,Target)#这俩是被击退，到时候无双无视这俩就是霸体
			state_behit()#
	elif self is role5:
		if is_miss or RoleProp.is_ws_state or IsSuperArmor or Role5Bt:
			is_be_attacking = false
		else:
			be_hit_back(MonsterTarget,Target)#这俩是被击退，到时候无双无视这俩就是霸体
			state_behit()#
	reduce_hp(last_hit,MonsterTarget,Target)
	
func reduce_hp(value: int,target_boss,target_obj):
	if not canglongremove:
		if value >= RoleProp.roleprop.Hp:
			if PlayerData.ChekEqzb("饰品","canglongjie"):
				#Global.add_SpecialEffect(self,Vector2(0,0),"canglongjiahu",Vector2(2,2),false,1)
				Global.AddBuff(self.buff,{
					"Name": "Indestructible",
					"AddTime": 3,
					"ReduceInterval": 0,
					"value": 0,
					"AttackKind": "",
					"CanRemove":false,
					})
				canglongremove = true
				return
	if RoleProp.roleprop.Hp <= 0:
		return
	if IsIndestructible:
		if value >= RoleProp.roleprop.Hp:
			return
	
	CUreCureCount = 0
	CureValue = 1
	IdleCount = 0
	if target_boss == null or target_obj == null:
		return 0
	RoleProp.roleprop.Hp -= value
	if target_boss.objattackDic == null:
		return 0
	if target_boss.objattackDic == null and target_obj.hit_name == null and target_boss.objattackDic[target_obj.hit_name].has("attackKind"):
		return
	if target_obj.hit_name == "":
		return
	var ATKind = target_boss.objattackDic[target_obj.hit_name].attackKind
	if is_miss:
		var pp = get_parent().get_parent()
		var po = Vector2(self.position.x,self.position.y - 110)
		Global.addMissEffect(pp,po)
	else:
		if value > 0:
			#print("111")
			var pp = get_parent().get_parent()
			var po = Vector2(self.position.x,self.position.y - 110)
			Global.addDamageText(pp,po,value,ATKind,is_crit,self)
	is_crit = false######################
	is_miss = false######################
func effect_reducehp(value,atkKind):
	if not canglongremove:
		if value >= RoleProp.roleprop.Hp:
			if PlayerData.ChekEqzb("饰品","canglongjie"):
				#Global.add_SpecialEffect(self,Vector2(0,0),"canglongjiahu",Vector2(2,2),false,1)
				Global.AddBuff(self.buff,{
					"Name": "Indestructible",
					"AddTime": 3,
					"ReduceInterval": 0,
					"value": 0,
					"AttackKind": "",
					"CanRemove":false,
					})
				canglongremove = true
				return
	if RoleProp.roleprop.Hp <= 0:
		return
	if IsIndestructible:
		if value >= RoleProp.roleprop.Hp:
			return
	CUreCureCount = 0
	CureValue = 1
	IdleCount = 0
	if atkKind == "physics":
		var 减伤率 = snapped(RoleProp.roleprop.Def / float(RoleProp.roleprop.Def + 250),0.001)
		value = int(value * (1 - 减伤率))
		Global.TotalPhyHurt += value
	elif atkKind == "magic":
		var 减伤率 = snapped(RoleProp.roleprop.Mdef / float(RoleProp.roleprop.Mdef + 250),0.001)
		value = int(value * (1 - 减伤率))
		Global.TotalMagHurt += value
	elif atkKind == "real":
		Global.TotalRealHurt += value
	RoleProp.roleprop.Hp -= value
	Global.TotalRoleHurt += int(value)
	if value > 0:
		if is_miss:
			Global.TotalMissCount += 1
			Global.addMissEffect(damage_text,Vector2(0,-20))
		else:
			match atkKind:
				"physics":
					Global.TotalPhyHurt += int(value)
				"magic":
					Global.TotalMagHurt += int(value)
				"real":
					Global.TotalRealHurt += int(value)
			var pp = get_parent().get_parent()
			var po = Vector2(self.position.x,self.position.y - 110)
			Global.addDamageText(pp,po,value,atkKind,false,self)
func get_Monster_last_hurt(target_boss,target_obj):
	if target_boss == null or target_obj == null:#这个是攻击目标的伤害和类型
		return 0
	if target_obj.hit_name == null:
		return 0
	var Target = checkMonster(target_boss) as BaseMonster#用于获取boss属性
	var LevelInter = abs(target_boss.level - RoleProp.baseroleprop.Level)#玩家与角色之间的等级差
	
	var lx = target_boss.objattackDic[target_obj.hit_name].attackKind#伤害类型
	var Hurt = target_boss.objattackDic[target_obj.hit_name].power#伤害
	var Miss = RoleProp.roleprop.Miss - Target.Htarget#玩家剩余闪避
	var Crit = Target.crit - RoleProp.roleprop.CritReduce#怪物剩余暴击
	var Lucky = Target.lucky - RoleProp.roleprop.Toughness#怪物剩余幸运
	var last_def = RoleProp.roleprop.Def - Target.ar#角色剩余防御
	var last_mdef = RoleProp.roleprop.Mdef - Target.sp#角色剩余魔防
	var miss_bl = LevelInter * 0.03
	var crit_bl = LevelInter * 0.07
	var lucky_bl = LevelInter * 0.07
	var IniHurt = Hurt

	if Miss <= 0:Miss = 0
	if Crit <= 0:Crit = 0
	if last_def <= 0:last_def = 0
	if last_mdef <= 0:last_mdef = 0
	if IsDefeReduce:
		last_def *= 1 - DefeReduce
		last_mdef *= 1 - DefeReduce
	if Lucky <= 0 :Lucky = 0
	if miss_bl >= 1:miss_bl = 1
	if crit_bl >= 1:crit_bl = 1	
	if lucky_bl >= 0.7:lucky_bl = 0.7
	if target_boss.level - RoleProp.baseroleprop.Level < 0:
		Miss = Miss * (1 - miss_bl)
		Crit = Crit * (1 - crit_bl)
		Lucky = Lucky * (1 - lucky_bl)
		Hurt = int(Hurt * (1 - is_suppression_num(target_boss) * 0.05))
	else:
		Miss = Miss * (1 + miss_bl)
		Crit = Crit * (1 + crit_bl)
		Lucky = Lucky * (1 + lucky_bl)
		Hurt = int(Hurt * (1 + is_suppression_num(target_boss) * 0.05))
	var bl
	Crit = snapped(Crit / float(Crit + 100),0.001)
	Miss = snapped(Miss / float(Miss + 100),0.001)
	randomize()
	if randf_range(0,1) <= Miss:
		Global.TotalMissCount += 1
		is_miss = true
		return 0
	if randf_range(0,1) <= Crit:
		bl = 2 + snapped(Lucky / float(Lucky + 50),0.001) - tszbsjm
		Hurt = Hurt * bl
		is_crit = true
	if lx == "physics":
		var 减伤率 = snapped(last_def / float(last_def + 250),0.001)
		Hurt = int(Hurt * (1 - 减伤率))
		Global.TotalPhyHurt += Hurt
	elif lx == "magic":
		var 减伤率 = snapped(last_mdef / float(last_mdef + 250),0.001)
		Hurt = int(Hurt * (1 - 减伤率))
		Global.TotalMagHurt += Hurt
	elif lx == "real":
		Global.TotalRealHurt += Hurt
	if IsIndestructible:
		if Hurt >= RoleProp.roleprop.Hp:
			return 0
	if self is role3:#土魔刺逻辑
		if IsTMc:
			if Hurt > 0:
				if target_boss != null:
					if target_boss is BaseMonster:
						var Level = PlayerData.player_data["技能学习"]["技能5"]["等级"] + 1
						var LastHurt = int(IniHurt * (2 + Level * 0.2))
						target_boss.reduce_hp(LastHurt)
	return Hurt
func Level_suppression(target):
	return target.level - RoleProp.baseroleprop.Level > 0
func is_suppression_num(target):
	var num: int = abs(target.level - RoleProp.baseroleprop.Level)
	if num > 5:
		num = 5
	return num
func not_suppression_num(target):
	var num: int
	if RoleProp.baseroleprop.Level - target.level > 2:
		num = 2
	else:
		num = RoleProp.baseroleprop.Level - target.level
	return num
func be_hit_back(target_boss,target_obj):#击退方法
	if not target_boss is BaseMonster:
		return
	if target_boss.MonsterDirection:
		attack_to_right(target_boss,target_obj)
	else:
		attack_to_left(target_boss,target_obj)
func attack_to_right(target_boss,target_obj):
	if target_obj.hit_name != null:
		self.velocity.x = -target_boss.objattackDic[target_obj.hit_name].hurtBack[0] * 25
		self.velocity.y = target_boss.objattackDic[target_obj.hit_name].hurtBack[1] * 15


func attack_to_left(target_boss,target_obj):
	if target_obj.hit_name != null:
		self.velocity.x = target_boss.objattackDic[target_obj.hit_name].hurtBack[0] * 25
		self.velocity.y = target_boss.objattackDic[target_obj.hit_name].hurtBack[1] * 15


func _on_skill_in_timeout() -> void:
	pass
func cure_Mp(value: int = 0):	
	if RoleProp.roleprop.Mp + value >= RoleProp.roleprop.SMp:
		value = RoleProp.roleprop.SMp - RoleProp.roleprop.Mp
	RoleProp.roleprop.Mp += value
	if value > 0:
		var pp = get_parent().get_parent()
		var po:Vector2
		if PlayerDir:
			po = Vector2(self.position.x - 50,self.position.y - 140)
		else:
			po = Vector2(self.position.x + 30,self.position.y - 140)
		Global.addDamageText(pp,po,value,"CureMp",false,self)
func reduce_Mp(value: int = 0):	
	RoleProp.roleprop.Mp -= value
	if value > 0:
		var pp = get_parent().get_parent()
		var po:Vector2
		if PlayerDir:
			po = Vector2(self.position.x - 50,self.position.y - 140)
		else:
			po = Vector2(self.position.x + 30,self.position.y - 140)
		Global.addDamageText(pp,po,value,"ReduceMp",false,self)
func cure_Hp(value: int = 0):
	if SXYRCannotCure:
		return
	if RoleProp.roleprop.Hp <= 0:
		return
	if get_parent().get_parent() is Level17 or get_parent().get_parent() is Level22 or BloodFix:
		return
	if RoleProp.roleprop.Hp + value >= RoleProp.roleprop.SHp:
		value = RoleProp.roleprop.SHp - RoleProp.roleprop.Hp
	RoleProp.roleprop.Hp += value
	is_CureHp = true
	CureHpValue = int(value)
	Global.TotalCureHp += int(value)
	var le = get_parent().get_parent() as BaseLevel
	for i in le.get_node("Monster").get_children():
		if i != null :
			if i is Monster37:
				i.cure_hp(value * 8)
	if value > 0:
		var pp = get_parent().get_parent()
		var po:Vector2
		if PlayerDir:
			po = Vector2(self.position.x - 50,self.position.y - 140)
		else:
			po = Vector2(self.position.x + 30,self.position.y - 140)
		Global.addDamageText(pp,po,value,"cure",is_crit,self)
	return value
func FBcureHp(value: int):
	if SXYRCannotCure:
		return
	if get_parent().get_parent() is Level17 or get_parent().get_parent() is Level22:
		return
	if RoleProp.roleprop.Hp + value >= RoleProp.roleprop.SHp:
		value = RoleProp.roleprop.SHp - RoleProp.roleprop.Hp
	RoleProp.roleprop.Hp += value
	if value > 0:
		var pp = get_parent().get_parent()
		var po:Vector2
		if PlayerDir:
			po = Vector2(self.position.x - 50,self.position.y - 140)
		else:
			po = Vector2(self.position.x + 30,self.position.y - 140)
		Global.addDamageText(pp,po,value,"cure",is_crit,self)



func _on_spontaneous_recovery_timeout() -> void:

	ran_num = randi_range(0,100)
	if RoleProp.roleprop.Hp <= 0:
		return
	if get_parent().get_parent() is Level17 or get_parent().get_parent() is Level22 or BloodFix:
		return
	if CureValue >= 4:
		CureValue = 4
	if RoleProp.roleprop.Hp < RoleProp.roleprop.SHp and RoleProp.roleprop.Hp > 0:
		if not SXYRCannotCure:
			Global.TotalCureHp += int(RoleProp.roleprop.R_hp * CureValue)
			RoleProp.roleprop.Hp += int(RoleProp.roleprop.R_hp * CureValue)
		#RoleProp.roleprop.Hp += RoleProp.roleprop.R_hp
	if RoleProp.roleprop.Mp < RoleProp.roleprop.SMp:
		RoleProp.roleprop.Mp += RoleProp.roleprop.R_mp
func get_need_mp(skill_name,bool_):
	if not bool_:
		match skill_name:
			"slz":
				return 10 + ((3 + 2 * (get_SkillLevel(1) - 1)) * (get_SkillLevel(1) - 1 ))
			"hytj":
				return 8 + ((3 + 2 * (get_SkillLevel(2) - 1 )) * (get_SkillLevel(2) - 1 ))
			"lys":
				return 12 + ((4 + 2 * (get_SkillLevel(3) - 1 )) * (get_SkillLevel(3) - 1 ))
			"lyfb":
				return 35 + ((6 + 2 * (get_SkillLevel(4) - 1 )) * (get_SkillLevel(4) - 1 ))
			"hmz":
				return 35 + ((3 + 3 * (get_SkillLevel(5) - 1 )) * (get_SkillLevel(5) - 1 ))
			"zz":
				return 12 + ((4 + 2 * (get_SkillLevel(6) - 1 )) * (get_SkillLevel(6) - 1 ))
			"qsez":
				return 10 + ((8 + 2 * (get_SkillLevel(7) - 1 )) * (get_SkillLevel(7) - 1 ))
			"jdy":
				return 10 + ((8 + 2 * (get_SkillLevel(8) - 1 )) * (get_SkillLevel(8) - 1 ))
			"hyjj":
				return 22 + ((8 + 2 * (get_SkillLevel(9) - 1 )) * (get_SkillLevel(9) - 1 ))
			"blb":
				return 15 + ((3 + 2 * (get_SkillLevel(1) - 1)) * (get_SkillLevel(1) - 1))
			"xbz":
				return 25 + ((3 + 2 * (get_SkillLevel(2) - 1)) * (get_SkillLevel(2) - 1))
			"tjgl":
				return 35 + ((3 + 2 * (get_SkillLevel(4) - 1)) * (get_SkillLevel(4) - 1))
			"shy":
				
				return 30 + ((3 + 2 * (get_SkillLevel(3) - 1)) * (get_SkillLevel(3) - 1))
			"smb":
				return 60 + ((3 + 3 * (get_SkillLevel(5) - 1)) * (get_SkillLevel(5) - 1))
			"myhc":
				return 35 + ((3 + 2 * (get_SkillLevel(7) - 1)) * (get_SkillLevel(7) - 1))
			"sgq":
				return 40 + ((3 + 3 * (get_SkillLevel(6) - 1)) * (get_SkillLevel(6) - 1))
			"jgz":
				return 40 + ((3 + 3 * (get_SkillLevel(8) - 1)) * (get_SkillLevel(8) - 1))
			"jhsj":
				return 60 + ((3 + 3 * (get_SkillLevel(9) - 1)) * (get_SkillLevel(9) - 1))
				
			"ssp":
				return 10 + ((2 + 2 * (get_SkillLevel(1) - 1)) * (get_SkillLevel(1) - 1))
			"dj":
				return 10 + ((3 + 2 * (get_SkillLevel(2) - 1)) * (get_SkillLevel(2) - 1))
			"dgq":
				return 15 + ((3 + 2 * (get_SkillLevel(3) - 1)) * (get_SkillLevel(3) - 1))
			"zznh":
				return 10 + ((3 + 2 * (get_SkillLevel(4) - 1)) * (get_SkillLevel(4) - 1))
			"tmc":
				return 40 + ((3 + 2 * (get_SkillLevel(5) - 1)) * (get_SkillLevel(5) - 1))
			"sd":
				return 10 + ((3 + 2 * (get_SkillLevel(6) - 1)) * (get_SkillLevel(6) - 1))
			"jsp":
				return 20 + ((3 + 2 * (get_SkillLevel(7) - 1)) * (get_SkillLevel(7) - 1))
			"xgq":
				return 20 + ((3 + 2 * (get_SkillLevel(8) - 1)) * (get_SkillLevel(8) - 1))
			"syzq":
				return 20 + ((3 + 2 * (get_SkillLevel(9) - 1)) * (get_SkillLevel(9) - 1))
				
			"qlj":
				return 15 + ((2 + 2 * (get_SkillLevel(1) - 1)) * (get_SkillLevel(1) - 1))
			"dcj":
				return 15 + ((3 + 2 * (get_SkillLevel(2) - 1)) * (get_SkillLevel(2) - 1))
			"wdzt":
				return 15 + ((3 + 2 * (get_SkillLevel(3) - 1)) * (get_SkillLevel(3) - 1))
			"tkj":
				return 15 + ((3 + 2 * (get_SkillLevel(4) - 1)) * (get_SkillLevel(4) - 1))
			"mmw":
				return 25 + ((3 + 2 * (get_SkillLevel(5) - 1)) * (get_SkillLevel(5) - 1))
			"jdz":	
				return 20 + ((3 + 2 * (get_SkillLevel(6) - 1)) * (get_SkillLevel(6) - 1))
			"lhsq":
				return 20 + ((3 + 2 * (get_SkillLevel(7) - 1)) * (get_SkillLevel(7) - 1))
			"zq":
				return 20 + ((3 + 2 * (get_SkillLevel(8) - 1)) * (get_SkillLevel(8) - 1))
			"wdww":
				return 10 + ((3 + 2 * (get_SkillLevel(9) - 1)) * (get_SkillLevel(9) - 1))
				
			"xyq":
				return 15 + ((2 + 2 * (get_SkillLevel(1) - 1)) * (get_SkillLevel(1) - 1))
			"slq":
				return 20 + ((3 + 2 * (get_SkillLevel(2) - 1)) * (get_SkillLevel(2) - 1))
			"blq":
				return 20 + ((3 + 2 * (get_SkillLevel(3) - 1)) * (get_SkillLevel(3) - 1))
			"fhf":
				return 20 + ((3 + 2 * (get_SkillLevel(4) - 1)) * (get_SkillLevel(4) - 1))
			"cxq":
				return 25 + ((3 + 2 * (get_SkillLevel(5) - 1)) * (get_SkillLevel(5) - 1))
			"llrd":	
				return 30 + ((3 + 2 * (get_SkillLevel(6) - 1)) * (get_SkillLevel(6) - 1))
			"lljy":
				return 40 + ((3 + 2 * (get_SkillLevel(7) - 1)) * (get_SkillLevel(7) - 1))
			"ygth":
				return 40 + ((3 + 2 * (get_SkillLevel(8) - 1)) * (get_SkillLevel(8) - 1))
			"tllz":
				return 40 + ((3 + 2 * (get_SkillLevel(9) - 1)) * (get_SkillLevel(9) - 1))
			""	:
				return 0
	else:
		match skill_name:
			"slz":
				return 10 + ((3 + 2 * (get_SkillLevel(1))) * (get_SkillLevel(1) ))
			"hytj":
				return 8 + ((3 + 2 * (get_SkillLevel(2) )) * (get_SkillLevel(2) ))
			"lys":
				return 12 + ((4 + 2 * (get_SkillLevel(3) )) * (get_SkillLevel(3) ))
			"lyfb":
				return 35 + ((6 + 2 * (get_SkillLevel(4) )) * (get_SkillLevel(4) ))
			"hmz":
				return 35 + ((3 + 3 * (get_SkillLevel(5) )) * (get_SkillLevel(5) ))
			"zz":
				return 12 + ((4 + 2 * (get_SkillLevel(6) )) * (get_SkillLevel(6) ))
			"qsez":
				return 10 + ((8 + 2 * (get_SkillLevel(7) )) * (get_SkillLevel(7) ))
			"jdy":
				return 10 + ((8 + 2 * (get_SkillLevel(8) )) * (get_SkillLevel(8) ))
			"hyjj":
				return 22 + ((8 + 2 * (get_SkillLevel(9) )) * (get_SkillLevel(9) ))
			"blb":
				return 15 + ((3 + 2 * (get_SkillLevel(1) )) * (get_SkillLevel(1) ))
			"xbz":
				return 25 + ((3 + 2 * (get_SkillLevel(2) )) * (get_SkillLevel(2) ))
			"tjgl":
				return 35 + ((3 + 2 * (get_SkillLevel(4) )) * (get_SkillLevel(4) ))
			"shy":
				return 30 + ((3 + 2 * (get_SkillLevel(3) )) * (get_SkillLevel(3) ))
			"smb":
				return 60 + ((3 + 3 * (get_SkillLevel(5) )) * (get_SkillLevel(5) ))
			"myhc":
				return 35 + ((3 + 2 * (get_SkillLevel(7) )) * (get_SkillLevel(7) ))
			"sgq":
				return 40 + ((3 + 3 * (get_SkillLevel(6) )) * (get_SkillLevel(6) ))
			"jgz":
				return 40 + ((3 + 3 * (get_SkillLevel(8) )) * (get_SkillLevel(8) ))
			"jhsj":
				return 60 + ((3 + 3 * (get_SkillLevel(9) )) * (get_SkillLevel(9) ))
				
			"ssp":
				return 10 + ((2 + 2 * (get_SkillLevel(1))) * (get_SkillLevel(1)))
			"dj":
				return 10 + ((3 + 2 * (get_SkillLevel(2))) * (get_SkillLevel(2)))
			"dgq":
				return 15 + ((3 + 2 * (get_SkillLevel(3))) * (get_SkillLevel(3)))
			"zznh":
				return 10 + ((3 + 2 * (get_SkillLevel(4))) * (get_SkillLevel(4)))
			"tmc":
				return 40 + ((3 + 2 * (get_SkillLevel(5))) * (get_SkillLevel(5)))
			"sd":
				return 10 + ((3 + 2 * (get_SkillLevel(6))) * (get_SkillLevel(6)))
			"jsp":
				return 20 + ((3 + 2 * (get_SkillLevel(7))) * (get_SkillLevel(7)))
			"xgq":
				return 20 + ((3 + 2 * (get_SkillLevel(8))) * (get_SkillLevel(8)))
			"syzq":
				return 20 + ((3 + 2 * (get_SkillLevel(9))) * (get_SkillLevel(9)))
				
				
			"qlj":
				return 15 + ((2 + 2 * (get_SkillLevel(1))) * (get_SkillLevel(1)))
			"dcj":
				return 15 + ((3 + 2 * (get_SkillLevel(2))) * (get_SkillLevel(2)))
			"wdzt":
				return 15 + ((3 + 2 * (get_SkillLevel(3))) * (get_SkillLevel(3)))
			"tkj":
				return 15 + ((3 + 2 * (get_SkillLevel(4))) * (get_SkillLevel(4)))
			"mmw":
				return 25 + ((3 + 2 * (get_SkillLevel(5))) * (get_SkillLevel(5)))
			"jdz":
				return 20 + ((3 + 2 * (get_SkillLevel(6))) * (get_SkillLevel(6)))
			"lhsq":
				return 20 + ((3 + 2 * (get_SkillLevel(7))) * (get_SkillLevel(7)))
			"zq":
				return 20 + ((3 + 2 * (get_SkillLevel(8))) * (get_SkillLevel(8)))
			"wdww":
				return 10 + ((3 + 2 * (get_SkillLevel(9))) * (get_SkillLevel(9)))
				
			"xyq":
				return 15 + ((2 + 2 * (get_SkillLevel(1))) * (get_SkillLevel(1)))
			"slq":
				return 20 + ((3 + 2 * (get_SkillLevel(2))) * (get_SkillLevel(2)))
			"blq":
				return 20 + ((3 + 2 * (get_SkillLevel(3))) * (get_SkillLevel(3)))
			"fhf":
				return 20 + ((3 + 2 * (get_SkillLevel(4))) * (get_SkillLevel(4)))
			"cxq":
				return 25 + ((3 + 2 * (get_SkillLevel(5))) * (get_SkillLevel(5)))
			"llrd":	
				return 30 + ((3 + 2 * (get_SkillLevel(6))) * (get_SkillLevel(6)))
			"lljy":
				return 40 + ((3 + 2 * (get_SkillLevel(7))) * (get_SkillLevel(7)))
			"ygth":
				return 40 + ((3 + 2 * (get_SkillLevel(8))) * (get_SkillLevel(8)))
			"tllz":
				return 40 + ((3 + 2 * (get_SkillLevel(9))) * (get_SkillLevel(9)))
			""	:
				return 0
	return 0
func get_SkillLevel(num):
	return PlayerData.player_data["技能学习"]["技能" + str(num)]["等级"]

func death():
	return RoleProp.roleprop.Hp <= 0
func addMagicWeapon():
	if PlayerData.player_data["法宝"].size() != 0:
		var name1 = PlayerData.player_data["实战法宝"]
		if name1 != "":
			var parent = get_parent().get_parent()
			Mgtarget = Global.addMagicWeapon(parent,name1,Vector2(0,0))
			Mgtarget.Player = self
		else:
			PlayerData.player_data["实战法宝"] = PlayerData.player_data["法宝"][0]["名字"]
			var parent = get_parent().get_parent()
			Mgtarget = Global.addMagicWeapon(parent,PlayerData.player_data["实战法宝"],Vector2(0,0))
			Mgtarget.Player = self
	else:
		if Mgtarget != null:
			Mgtarget.queue_free()
func add_WSEffect():
		var WS_Effect = preload("res://Scene/Hero/Role_1/WS_Effect.tscn").instantiate()
		WS_Effect.add_child(action.duplicate())
		WS_Effect.set("position",get("position"))
		get_parent().add_child(WS_Effect)

func _on_ws_timer_timeout() -> void:
	add_WSEffect()

func selfProtect():
	if need_removeProtect:
		if CurrentProtect >= 0:
			CurrentProtect -= 1
	else:
		if CurrentProtect >= 0:
			CurrentProtect -= 0.05
	if needProtect:
		MyHurtBox.disabled = true
		RoleBody.self_modulate = Color(1,1,1,0.5)
		RoleEq.self_modulate = Color(1,1,1,0.5)
	if CurrentProtect >= MaxProtect:
		if not needProtect:
			$Protect.start(randi_range(3,4))
			needProtect = true
			need_removeProtect = true
func _on_protect_timeout() -> void:
	needProtect = false
	RoleBody.self_modulate = Color(1,1,1,1)
	RoleEq.self_modulate = Color(1,1,1,1)
	need_removeProtect = false

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
	AddSpecialEffectClothes(WQ,Fj)
	var WingsList
	if PlayerData.player_data["幻化列表"]["翅膀"] == "":
		if PlayerData.player_data["翅膀"].size() == 0:
			wings.visible = false
			WingsList = "empty"
		else:
			WingsList = PlayerData.player_data["翅膀"][0]["名字"]
	else:
		WingsList = PlayerData.player_data["幻化列表"]["翅膀"]
	wings.play(WingsList)
func ChangeBody(name1):
	self.RoleBody.texture = Global.LoadRole1Body(name1)
func ChangeEq(name1):
	self.RoleEq.texture = Global.LoadRole1EQ(name1)

func AddSpecialEffectClothes(EqName,ClothesName):
	var Lastname = EqName + ClothesName
	var BodyList = [toukui,jianjia,huwan,shenti,yaodai,xiabai]
	match Lastname:
		"zxstgzxstj":
			for i in BodyList:
				if i != null:
					i.play("zxstj")
					i.offset = Vector2(0,0)
			wuqi.play("zxstg")
			wuqi.offset = Vector2(0,0)
			wuqi.scale = Vector2(0.87,0.87)
			return
		"pftygpftyj":
			for i in BodyList:
				if i != null:
					i.play("pftyj")
					match str(i.name):
						"toukui":	
							i.offset = Vector2(3,-15)
							continue
						"jianjia":	
							i.offset = Vector2(15,0)
							continue
						"shenti":	
							i.offset = Vector2(-25,-20)
							continue
					i.offset = Vector2(0,0)		
							
			wuqi.play("pftyg")
			wuqi.offset = Vector2(3,0)
			wuqi.scale = Vector2(0.87,0.87)
			return
		"slshgslshj":
			for i in BodyList:
				if i != null:
					i.play("slshj")
					match str(i.name):
						"toukui":	
							i.offset = Vector2(3,-15)
							continue
						"jianjia":	
							i.offset = Vector2(15,10)
							continue
						"xiabai":	
							i.offset = Vector2(0,-10)
							continue
					i.offset = Vector2(0,0)		
							
			wuqi.play("slshg")
			wuqi.offset = Vector2(0,0)
			wuqi.scale = Vector2(1,1)
			return
	for i in effect_body.get_children():
		if i != null:
			i.play("Empty")
func _on_hit_box_area_entered(area: Area2D) -> void:
	if objattackDic.has(get_action):
		if objattackDic[get_action].has("addeffect"):
			var Monster = area.get_parent().get_parent()
			if Monster != null:
				if Monster is BaseMonster:
					if self is role4:
						if objattackDic[get_action]["addeffect"]["Name"] == "Voodoo":
							if Global.CheckWD(Monster) < 10:
								Global.AddBuff(Monster.buff,objattackDic[get_action]["addeffect"])
						else:
							Global.AddBuff(Monster.buff,objattackDic[get_action]["addeffect"])
					else:
						Global.AddBuff(Monster.buff,objattackDic[get_action]["addeffect"])
	if self is role1:
		if get_action == "qsez":
			velocity.x = 0
			Global.addSound_(self,"res://Music/Hero/27_Role1_hit13_2.mp3")
			if not is_call:
				is_call = true
				var pp = [Vector2(self.position.x,self.position.y),Vector2(self.position.x - 30,self.position.y),
				Vector2(self.position.x,self.position.y + 30),Vector2(self.position.x + 30,self.position.y),
				Vector2(self.position.x,self.position.y - 30)]
				for i in range(5):
					if randi_range(0,100) < 50:
						Global.addRoleBullet_1(self.Bullet,pp[i],"qsez",self.objattackDic["qsez"])
					else:
						Global.addRoleBullet_1(self.Bullet,pp[i],"qsez_1",self.objattackDic["qsez"])
					await get_tree().create_timer(0.08,false).timeout
				
func checkMonster(get_tt):
	#print(get_tt)
	var MonsterTarget: BaseMonster
	if get_tt.get_parent().get_parent() is BaseMonster:
		MonsterTarget = get_tt.get_parent().get_parent()
	elif get_tt.get_parent() is BaseMonster:
		MonsterTarget = get_tt.get_parent()
	elif get_tt.get_parent().get_parent().get_parent() is BaseMonster:
		MonsterTarget = get_tt.get_parent().get_parent().get_parent()
	elif get_tt.get_parent().get_parent().get_parent().get_parent() is BaseMonster:
		MonsterTarget = get_tt.get_parent().get_parent().get_parent().get_parent()
	elif get_tt is BaseMonster:
		return get_tt
	else:
		return null
	return MonsterTarget
func get_RealTarget(get_tt):
	#print(get_tt.get_parent().get_parent())
	return get_tt.get_parent().get_parent()


func CheckAddBuff():#在这里加上各种布尔值类的buff
	var not_ice = true
	var not_dl = true
	var not_eyefix = true
	var not_stun = true
	var not_sppeddown = true
	var not_silent = true
	var not_BoundFloor = true
	var not_Immobilize = true
	var not_BloodFix = true
	var not_DefeReduce = true
	var not_Scary = true
	var not_SuperArmor = true
	var not_Indestructible = true
	var not_DoubleFallPro = true
	var not_IsWDZT = true
	var not_slz = true
	var not_tsz = true
	var not_NoDeBuff = true
	var not_Xr = true
	if self.buff == null:
		return
	
		
	for i in self.buff.get_children():
		if i != null:
			if i.BuffInfo["Name"] == "NoDeBuff":
				NoDeBuff = true
				not_NoDeBuff = false
			if i.BuffInfo["Name"] == "lpzbuff":
				IsXr = true
				not_Xr = false
			if i.BuffInfo["Name"] == "tszbuff":
				Istsz = true
				not_tsz = false
			if i.BuffInfo["Name"] == "slzbuff":
				Isslz = true
				not_slz = false
			if i.BuffInfo["Name"] == "Ice":
				is_ice = true
				not_ice = false
			if i.BuffInfo["Name"] == "PoisionBody":
				IsWDZT = true
				not_IsWDZT = false
			if i.BuffInfo["Name"] == "SuperArmor":
				IsSuperArmor = true
				not_SuperArmor = false
			if i.BuffInfo["Name"] == "DoubleFallPro":
				IsDoubleFallPro = true
				not_DoubleFallPro = false
			if i.BuffInfo["Name"] == "DefeReduce":
				IsDefeReduce = true
				not_DefeReduce = false
			if i.BuffInfo["Name"] == "Indestructible":
				IsIndestructible = true
				not_Indestructible = false
			if i.BuffInfo["Name"] == "DeadLink":
				is_DeadLink = true
				not_dl = false
			if i.BuffInfo["Name"] == "EyeFix":
				is_EyeFix = true
				not_eyefix = false
			if i.BuffInfo["Name"] == "Immobilize":
				is_Immobilize = true
				not_Immobilize = false
			if i.BuffInfo["Name"] == "stun":
				is_stun = true
				not_stun = false
			if i.BuffInfo["Name"] == "speed_down":
				is_speedDown = true
				not_sppeddown = false
			if i.BuffInfo["Name"] == "BloodFix":
				BloodFix = true
				not_BloodFix = false
			if i.BuffInfo["Name"] == "silent":
				is_silent = true
				not_silent = false
			if i.BuffInfo["Name"] == "Boundground":
				is_Bound_to_the_ground = true
				not_BoundFloor = false
			if i.BuffInfo["Name"] == "Scary":
				IsScary = true
				not_Scary = false
	if not_Xr:
		IsXr = false
		xrbl = 0
	if not_NoDeBuff:
		NoDeBuff = false
	if not_tsz:
		Istsz = false
		tszzs = 0
	if not_slz:
		Isslz = false
		slzjs2 = 0
	if not_IsWDZT:
		IsWDZT = false
	if not_DoubleFallPro:
		IsDoubleFallPro = false
	if not_Indestructible:
		IsIndestructible = false
	if not_SuperArmor:
		IsSuperArmor = false
	if not_DefeReduce:
		IsDefeReduce = false
		DefeReduce = 0
	if not_Scary:
		IsScary = false	
	if not_BloodFix:
		BloodFix = false
	if not_BoundFloor:
		is_Bound_to_the_ground = false
	if not_silent:
		is_silent = false
	if not_ice:
		is_ice = false
	if not_dl:
		is_DeadLink = false
	if not_eyefix:
		is_EyeFix = false
	if not_stun:
		is_stun = false
	if not_Immobilize:
		is_Immobilize = false
	if not_sppeddown:
		is_speedDown = false
		walk_speed = 240
	if buff.get_children().size() == 0:
		is_speedDown = false
		walk_speed = 240
		is_stun = false
		is_EyeFix = false
		is_ice = false
		is_DeadLink = false
		is_silent = false
		is_Bound_to_the_ground = false
func get_skill(name1):
	if is_silent:
		return
	if get_parent().get_parent() is Level17 or get_parent().get_parent() is Level22:
		return
	if name1 == "":
		return
	if self is role1:
		var IsCanUseSlz = false
		if name1 == "slz":
			for i in PlayerData.player_data["技能学习"]["技能键位"]:
				if str(PlayerData.player_data["技能学习"]["技能键位"][i]) == "slz":
					IsCanUseSlz = true
			if not IsCanUseSlz:
				return
		if name1 == "hyjj":
			if not checkCanuseSomeSkill():
				return
		if RoleProp.roleprop.Mp >= get_need_mp(name1,false) and Role1SkillInter[name1] <= 0:
			RoleProp.roleprop.Mp -= get_need_mp(name1,false)
		else:
			return
		match name1:
			"slz":
				if Role1SkillInter["slz"] <= 0:
					do_slz()
			"zz":
				do_zz()
			"lys":
				if Role1SkillInter["lys"] <= 0:
					do_lys()
			"lyfb":
				if Role1SkillInter["lyfb"] <= 0:
					do_lyfb()
			"hmz":
				do_hmz_pro()
			"hytj":
				if Role1SkillInter["hytj"] <= 0:
					do_hytj()
			"hyjj":
				if Role1SkillInter["hyjj"] <= 0:
					do_hyjj()
			"jdy":
				if Role1SkillInter["jdy"] <= 0:			
					do_jdy()
			"jdy2":
				if Role1SkillInter["jdy"] <= 0:			
					do_jdy_2()
			"qsez":
				if Role1SkillInter["qsez"] <= 0:
					do_qsez()
			"":
				return
	elif self is role2:
		if not is_on_floor():
			if name1 == "smb":
				return
		if SMB1 == null:
			if RoleProp.roleprop.Mp < get_need_mp(name1,false) or Role1SkillInter[name1] > 0:
				return
		match name1:
			"blb":
				if Role1SkillInter["blb"] <= 0:
					Skill_Blb()
					RoleProp.roleprop.Mp -= get_need_mp(name1,false)
			"tjgl":
				if Role1SkillInter["tjgl"] <= 0:
					Skill_Tjgl()
					RoleProp.roleprop.Mp -= get_need_mp(name1,false)
			"xbz":
				if Role1SkillInter["xbz"] <= 0:
					Skill_XBZ()
					RoleProp.roleprop.Mp -= get_need_mp(name1,false)
			"shy":
				if Role1SkillInter["shy"] <= 0:
					Skill_SHY()
					if MyShallow == null:
						RoleProp.roleprop.Mp -= get_need_mp(name1,false)
			"sgq":
				if Role1SkillInter["sgq"] <= 0:
					Skill_SGQ()
					RoleProp.roleprop.Mp -= get_need_mp(name1,false)
			"myhc":
				if Role1SkillInter["myhc"] <= 0:
					Skill_MYHC()
					RoleProp.roleprop.Mp -= get_need_mp(name1,false)
			"jgz":
				if Role1SkillInter["jgz"] <= 0:
					Skill_JGZ()
					RoleProp.roleprop.Mp -= get_need_mp(name1,false)
			"jhsj":
				if Role1SkillInter["jhsj"] <= 0:
					Skill_JHSJ()
					RoleProp.roleprop.Mp -= get_need_mp(name1,false)
			"smb":
				if Role1SkillInter["smb"] <= 0:
					Skill_SMB()
					if SMB1 == null:
						RoleProp.roleprop.Mp -= get_need_mp(name1,false)
	elif self is role3:
		if name1 == "tmc2":
			if Role1SkillInter["tmc"] <= 0:
				Skill_TMC2()
				return
			return
		if RoleProp.roleprop.Mp >= get_need_mp(name1,false) and Role1SkillInter[name1] <= 0:
			RoleProp.roleprop.Mp -= get_need_mp(name1,false)
		else:
			return
		match name1:
			"sd":
				if Role1SkillInter["sd"] <= 0:
					Skill_SD()
			"ssp":
				if Role1SkillInter["ssp"] <= 0:
					Skill_SSP()
			"jsp":
				if Role1SkillInter["jsp"] <= 0:
					Skill_JSP()
			"zznh":
				if Role1SkillInter["zznh"] <= 0:
					Skill_ZZNH()
			"dj":
				if Role1SkillInter["dj"] <= 0:
					Skill_DJ()
			"dgq":
				if Role1SkillInter["dgq"] <= 0:
					Skill_DGQ()
			"xgq":
				if Role1SkillInter["xgq"] <= 0:
					Skill_XGQ()
			"syzq":
				if Role1SkillInter["syzq"] <= 0:
					Skill_SYZQ()
			"tmc":
				if Role1SkillInter["tmc"] <= 0:
					Skill_TMC()
	elif self is role4:
		if RoleProp.roleprop.Mp >= get_need_mp(name1,false) and Role1SkillInter[name1] <= 0:
			RoleProp.roleprop.Mp -= get_need_mp(name1,false)
		else:
			return
		match name1:
			"qlj":
				if Role1SkillInter["qlj"] <= 0:
					ShovelQLJ()
			"dcj":
				if Role1SkillInter["dcj"] <= 0:
					ShovelDCJ()
			"wdzt":
				if Role1SkillInter["wdzt"] <= 0:
					ShovelWDZT()
			"tkj":
				if Role1SkillInter["tkj"] <= 0:
					ShovelTKJ()
			"mmw":
				if Role1SkillInter["mmw"] <= 0:
					ShovelMMW()
			"zq":
				if Role1SkillInter["zq"] <= 0:
					ShovelZQ()
			"wdww":
				if Role1SkillInter["wdww"] <= 0:
					ShovelWDWW()
			"lhsq":
				if Role1SkillInter["lhsq"] <= 0:
					ShovelMBYJ()
			"jdz":
				if Role1SkillInter["jdz"] <= 0:
					ShovelJDZ()
	elif self is role5:
		if RoleProp.roleprop.Mp >= get_need_mp(name1,false) and Role1SkillInter[name1] <= 0:
			RoleProp.roleprop.Mp -= get_need_mp(name1,false)
		else:
			return
		match name1:
			"slq":
				if Role1SkillInter["slq"] <= 0:
					UseSLQ()
			"cxq":
				if Role1SkillInter["cxq"] <= 0:
					UseCXQ()
			"blq":
				if Role1SkillInter["blq"] <= 0:
					UseBLQ()
			"xyq":
				if Role1SkillInter["xyq"] <= 0:
					UseXYQ()
			"llrd":
				if Role1SkillInter["llrd"] <= 0:
					UseLLRD()
			"lljy":
				if Role1SkillInter["lljy"] <= 0:
					UseLLJY()
			"tllz":
				if Role1SkillInter["tllz"] <= 0:
					UseTLLZ()
			"ygth":
				if Role1SkillInter["ygth"] <= 0:
					UseYGTH()
			"fhf":
				if Role1SkillInter["jdz"] <= 0:
					UseFHF()
func ImproveSelfRecoveryWhenIdle():#提高自身自然恢复效果当休息时
	if is_be_attacking:
		CUreCureCount = 0
		CureValue = 1
	else:
		CUreCureCount += 1
	if CUreCureCount % 180 == 0 and CUreCureCount != 0:
		CureValue += 0.5
	if velocity.x == 0:
		IdleCount += 1
	else:
		IdleCount = 0
	if IdleCount % 120 == 0 and IdleCount != 0:
		CureValue += 0.5
func ResetInsky():
	IsInSky = false
func SetInsky():
	IsInSky = true
func ADDZLWEffect():
	Global.addRoleBullet_(self,Vector2(0,0),false,"ZLWBullet",objattackDic["zlw"])
func ADDNMWEffect():
	var PositionList_1 = [Vector2(-65,500),Vector2(65,500)]
	var PositionList_2 = [Vector2(-175,500),Vector2(175,500)]
	var PositionList_3 = [Vector2(-285,500),Vector2(285,500)]
	var PositionList = {
		"1":[Vector2(-185,500),Vector2(65,500),Vector2(-65,500),Vector2(185,500)],
		"2":[Vector2(-285,500),Vector2(-185,500),Vector2(65,500),Vector2(-65,500),Vector2(185,500),Vector2(285,500)],
		"3":[Vector2(-385,500),Vector2(-285,500),Vector2(-185,500),Vector2(65,500),Vector2(-65,500),Vector2(185,500)
		,Vector2(285,500),Vector2(385,500)],
	}
	var SZName = Global.GetName(PlayerData.player_data["时装"][0]["名字"])
	var Pz = str(PlayerData.player_data["时装"][0]["名字"]).split(SZName)[0]
	var Count: int = 1
	match Pz:
		"youxiu":
			Count = 1
		"jingliang":
			Count = 2
		"shishi":
			Count = 3
	for i in PositionList[str(Count)]:
		Global.addRoleBullet_(self.Bullet,Vector2(i.x + position.x,500),false,"NMWBullet2",objattackDic["nmw"])
#func ADDTtzsEffect():
#	var PositionList_1 = {
#		"Position":[Vector2(0,-335),Vector2(190,-295),Vector2(230,285)],
#		"Rotation":[0,30,150]
#	}
#	var PositionList_2 = {
#		"Position":[Vector2(0,295),Vector2(-260,290),Vector2(-355,-245)],
#		"Rotation":[90,-150,-30]
#	}
#	var PositionList_3 = {
#		"Position":[Vector2(235,-125),Vector2(-195,35),Vector2(0,275)],
#		"Rotation":[40,-140,-195]
#	}
#	var PositionList_4 = {
#		"Position":[Vector2(355,125),Vector2(-200,-390),Vector2(-525,20)],
#		"Rotation":[110,-20,-110]
#	}
#	var Arrow
#	var Num: int = 0
#	for i in PositionList_1["Position"]:
#		Arrow = Global.addRoleBullet_(self.Bullet,i + position,false,"TtzsszBullet",objattackDic["ttzs"])
#		Arrow.rotation_degrees = PositionList_1["Rotation"][Num]
#		Num += 1
#	Num = 0
#	await get_tree().create_timer(0.1,false).timeout
#	for i in PositionList_2["Position"]:
#		Arrow = Global.addRoleBullet_(self.Bullet,i + position,false,"TtzsszBullet",objattackDic["ttzs"])
#		Arrow.rotation_degrees = PositionList_2["Rotation"][Num]
#		Num += 1
#	Num = 0
#	await get_tree().create_timer(0.1,false).timeout
#	for i in PositionList_3["Position"]:
#		Arrow = Global.addRoleBullet_(self.Bullet,i + position,false,"TtzsszBullet",objattackDic["ttzs"])
#		Arrow.rotation_degrees = PositionList_3["Rotation"][Num]
#		Num += 1
#	Num = 0
#	await get_tree().create_timer(0.1,false).timeout
#	for i in PositionList_4["Position"]:
#		Arrow = Global.addRoleBullet_(self.Bullet,i + position,false,"TtzsszBullet",objattackDic["ttzs"])
#		Arrow.rotation_degrees = PositionList_4["Rotation"][Num]
#		Num += 1
#	Num = 0
#	await get_tree().create_timer(0.1,false).timeout
func SetSZValue():
	if PlayerData.player_data["时装"].size() <= 0:
		return
	var SZName = Global.GetName(PlayerData.player_data["时装"][0]["名字"])
	var Pz = str(PlayerData.player_data["时装"][0]["名字"]).split(SZName)[0]
	var Bl = 1
	match SZName:
#		"ttzssz":
#			var Power: int
#			var Pj: float
#			var Time_: float
#			match Pz:
#				"youxiu":
#					Power = RoleProp.roleprop.power * 0.5
#					Pj = 0.15
#					Time_ = 4
#				"jingliang":
#					Power = RoleProp.roleprop.power * 0.8
#					Pj = 0.25
#					Time_ = 6
#				"shishi":
#					Power = RoleProp.roleprop.power * 1
#					Pj = 0.35
#					Time_ = 8
#			objattackDic["ttzs"] = {
#				"power": int(Power),
#				"hurtBack":[1,-1],
#				"attackKind": "magic",
#				"addeffect":{
#					"Name": "DefeReduce",
#					"AddTime": Time_,
#					"ReduceInterval": 0,
#					"value": Pj,
#					"AttackKind": "",
#					"CanRemove": true,
#					"CanAdd":false,
#					"DeBuff": true
#				}}
		"nmwsz":
			var Power: int
			var Pj: float
			var Time_: float
			match Pz:
				"youxiu":
					Power = RoleProp.roleprop.power * 0.5
					Pj = RoleProp.roleprop.power * 0.1
					Time_ = 2
				"jingliang":
					Power = RoleProp.roleprop.power * 1
					Pj = RoleProp.roleprop.power * 0.1
					Time_ = 3
				"shishi":
					Power = RoleProp.roleprop.power * 1.5
					Pj = RoleProp.roleprop.power * 0.1
					Time_ = 5
			objattackDic["nmw"] = {
				"power": int(Power),
				"hurtBack":[1,-1],
				"attackKind": "magic",
				"addeffect":{
					"Name": "Fire",
					"AddTime": Time_,
					"ReduceInterval": 1,
					"value": int(Pj),
					"AttackKind": "real",
					"CanRemove": true,
					"CanAdd":false,
					"DeBuff": true,
				}}
		"zlwsz":
			var Power: int
			var Time_: float
			match Pz:
				"youxiu":
					Power = RoleProp.roleprop.power * 3
					Time_ = 2
				"jingliang":
					Power = RoleProp.roleprop.power * 4
					Time_ = 3
				"shishi":
					Power = RoleProp.roleprop.power * 5
					Time_ = 4
			objattackDic["zlw"] = {
				"power": int(Power),
				"hurtBack":[1,-1],
				"attackKind": "magic",
				"addeffect":{
					"Name": "stun",
					"AddTime": Time_,
					"ReduceInterval": 0,
					"value": 0,
					"AttackKind": "",
					"CanRemove": true,
					"CanAdd":false,
					"DeBuff": true
				}}

	
func WhenScary():
	if not IsScary or is_be_attacking:
		return
	if ran_num <= 20:
		role_action_player.play("wait")
		velocity.x = 0
	elif ran_num > 20 and ran_num <= 60:
		role_action_player.play("run")
		get_action = "run"
		action.scale.x = 1
		base_damagebox.scale.x = 1
		velocity.x = -walk_speed * RoleProp.ws_up_power * 0.5
	else:
		role_action_player.play("run")
		get_action = "run"
		action.scale.x = -1
		base_damagebox.scale.x = -1
		velocity.x = walk_speed * RoleProp.ws_up_power * 0.5
	pass

func AddTx():
	if PlayerData.player_data["幻化列表"].has("头衔"):
		if PlayerData.player_data["幻化列表"]["头衔"] == "":
			if PlayerData.player_data["头衔"].size() == 0:
				tx.play("Empty")
			else:
				var mz = PlayerData.player_data["头衔"][0]["名字"]
				tx.play(mz)
		else:
			tx.play(PlayerData.player_data["幻化列表"]["头衔"])
func jsfzsy():
	#森罗阵buff未做
	var Levelslz = PlayerData.player_data["森罗阵"]["Level"]
	if PlayerData.player_data["已佩戴阵法"] == "slz":
		slzjs = Levelslz * 0.01
	else:
		slzjs = 0
	var Leveltsz = PlayerData.player_data["腾蛇阵"]["Level"]
	if PlayerData.player_data["已佩戴阵法"] == "tsz":
		tszbsjm = Leveltsz * 0.01
	else:
		tszbsjm = 0

func UseZhenFa():
	if PlayerData.player_data["已佩戴阵法"] == "" or PlayerData.player_data["已佩戴阵法"] == null:
		return
	if Input.is_action_just_pressed("阵法"):
		match PlayerData.player_data["已佩戴阵法"]:
			"slz":
				if ZhenFaCd <= 0:
					self.objattackDic["slz"] = {
						"power": 0,
						"hurtBack":[0,0],
						"attackKind": "magic",
						"WSValue": 0
					}
					Global.addRoleBullet_(self,Vector2(0,30),false,"SLZBullet",objattackDic["slz"])
					ZhenFaCd = 30
					Global.zhen_fa.MaxTime = ZhenFaCd
					zhen_fa.start(ZhenFaCd)
			"lpz":
				if ZhenFaCd <= 0:
					self.objattackDic["lpz"] = {
						"power": int(RoleProp.roleprop.power * 1),
						"hurtBack":[0,0],
						"attackKind": "magic",
						"WSValue": 0
					}
					Global.addRoleBullet_(self.Bullet,position + Vector2(0,40),false,"LPZBullet",objattackDic["lpz"])
					ZhenFaCd = 30
					Global.zhen_fa.MaxTime = ZhenFaCd
					zhen_fa.start(ZhenFaCd)
			"tsz":
				if ZhenFaCd <= 0:
					self.objattackDic["tsz"] = {
						"power": 0,
						"hurtBack":[0,0],
						"attackKind": "magic",
						"WSValue": 0
					}
					Global.addRoleBullet_(self,Vector2(0,30),false,"TSZBullet",objattackDic["tsz"])
					ZhenFaCd = 30
					Global.zhen_fa.MaxTime = ZhenFaCd
					zhen_fa.start(ZhenFaCd)
			"tqz":
				if not is_on_floor():return
				if ZhenFaCd <= 0:
					self.objattackDic["tqz"] = {
						"power": 0,
						"hurtBack":[0,0],
						"attackKind": "magic",
						"WSValue": 0
					}
					Global.addRoleBullet_(self.Bullet,position + Vector2(0,40),false,"TQZBullet",objattackDic["tqz"])
					ZhenFaCd = 35
					Global.zhen_fa.MaxTime = ZhenFaCd
					zhen_fa.start(ZhenFaCd)
func _on_zhen_fa_timeout() -> void:
	ZhenFaCd = 0


func _on_hit_box_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
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
			if self is role2 or self is role3:
				wings.position = Vector2(0,0)
			else:
				wings.offset = Vector2(0,0)
			wings.scale = Vector2(1.4,1.4) 
		"xqzy":
			if self is role2 or self is role3:
				wings.position = Vector2(14,10)
			else:
				wings.offset = Vector2(5,10)
			wings.scale = Vector2(1.2,1.2) 
		"jmzy":
			if self is role2 or self is role3:
				wings.position = Vector2(45,15)
			else:
				wings.offset = Vector2(25,15)
			wings.scale = Vector2(1.1,1.1) 
		"xmzy":
			if self is role2 or self is role3:
				wings.position = Vector2(40,-25)
			else:
				wings.offset = Vector2(30,-15)
			wings.scale = Vector2(1,1) 
		"bszy":
			if self is role2 or self is role3:
				wings.position = Vector2(30,0)
			else:
				wings.offset = Vector2(20,10)
			wings.scale = Vector2(1,1) 
