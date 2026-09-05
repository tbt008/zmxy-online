extends BaseObject
class_name BaseMonster
@onready var buff: Node = $Buff
var Islljy: bool
var lpzzs:float
var tqzbs: float
var tszzs: float
var lpzjs: float
var NoGrav: bool
var RndiCount: int = randi_range(0,100)
var get_Player:BaseHero
var CHangeClamCount: float
var HurtSpecialEffect: Node2D
var IsSmartMonster: bool
var is_bt
var NoDeBuff: bool = false
var IsScary: bool
var HurtBl: float = 1
var is_death: bool = false
var DefeReduce: float
var max_ = 2
var current_ = 0
var IsSuperArmor: bool
var is_bounds = false
var SmartHitCount: int
var SmartWaitCount: int
var NoTarget: bool
var IsIndestructible: bool
var llrdzs: float
var ran_1 = randf_range(0,1)
var ran_2 = randf_range(0,1)
var ran_3 = randf_range(0,1)
var ran_4 = randf_range(0,1)
var is_Immobilize: bool = false
var BloodFix: bool = false
var level: int
var def: int
var ebol: float
var mdef: int
var lucky: int
var crit: int
var miss: int
var is_speedDown: bool
var attackRange: int
var attackDesire: int
var mysee: int
var Skill_1_CD: int = 10
var Skill_2_CD: int
var Skill_3_CD: int
var Skill_4_CD: int
var Skill_5_CD: int
var Skill_6_CD: int
var state
var ran_num: int = randi_range(10,100)
var speed
var behit_calmtime: float 
var Htarget: int
var Toughness
var GetHurt: int
var Critreduce: int
var ar: int
var sp: int
var Bullet
var is_stun = false
var is_sleep = false
var attack_in: int
var has_target = false
var count = 0
var IsDefeReduce: bool
var add_exp : int
var self_rhp: int
var is_boss = false
var Therapeutic_effects: float
var fall_coin
var my_mr_name
var fall_pro: float
var fall_stone_pro: float
var fall_list = []
var fall_stone = []
var is_fall = false
var is_fall_medi = false
var hd: int
var max_hd: int
var total_hit: int
var total_hurt: int
var add_buff
var is_quiescent = false
var ws_hd = false
var lj_count: int = 0
var is_enter_hitBox
var rush_speed
var HitTarget
var get_target#
var is_set_: bool
var iniSpeed
var is_jgz: bool
var jgz_bl: float = 1
var jgz_count: int
var MyBlood
var CannotAttract: bool
var IsLpz: bool
var IsLLRD: bool
@onready var bullet: Node = $Bullet
@onready var hurt_box: CollisionShape2D = $BaseDamageBox/HurtBox/HurtBox
@onready var damage_text: Node2D = $damage_text
@onready var base_damage_box: Node2D = $BaseDamageBox
@onready var pz: CollisionShape2D = $pz
@onready var mr_player: AnimationPlayer = $mr_player
@onready var mr_ani: AnimatedSprite2D = $MonsterDir/mr_ani
@onready var monster_dir: Node2D = $MonsterDir
@onready var remove_hurt_bl: Timer = $RemoveHurtBL

var llrdCount: int = 0
var RunHit: bool
var RunHitCount: int = 0
var MonsterDirection: bool = false
var HitText
var is_Fly = false
enum State {
	other,
	Death,
	is_top,
	is_under,
}
var hit_name
var monster_blood_bar: mr_blood_bar
var Onset: bool
var BaseLevel_: BaseLevel
var ShouldInSky: bool
func SetGra():
	gravity = -980
func CanSetGra():
	return not NoGrav and not Islljy and not ShouldInSky
func _ready() -> void:	
	self.SHp = self.SHp + randi_range(0,1)
	self.Hp = self.Hp + randi_range(0,1)
	$CalmHit.start(CHangeClamCount)
	mr_player.play("wait")
	$BaseDamageBox/HitBox/HitBox.disabled = true
	if MainSet.set_data["NoShowMonsterBody"] == false:
		monster_dir.visible = false
	randomize()
func _physics_process(delta: float) -> void:
	if CanSetGra():
		gravity = -980
	else:
		gravity = 0
	if Islljy and Hp > 0:
		mr_player.play("hurt")
	if llrdCount > 0:
		llrdCount -= 1
		llrdzs = 1.3
	else:
		llrdzs = 1
	jsfzsy()
	BaseLevel_ = get_parent().get_parent()
	if BaseLevel_ is Lhhj:
		fall_coin = 0
		fall_list = []
		fall_pro = 0
		fall_stone_pro = 0
		add_exp = 0
		fall_stone = []
	WDHurt()
	if MainSet.set_data["MonsterBloodSHow"]:
		if is_boss:
			if MyBlood == null:
				var Parent = get_parent().get_parent().monster_blood
				MyBlood = Global.AddBossBlood_(Parent,self)

	if is_jgz:
		if int(PlayerData.player_data["Myself"]) == 3:
			jgz_bl = 1.2 + (PlayerData.player_data["技能学习"]["技能4"]["等级"] + 1) * 0.05
		else:
			jgz_bl = 1.2 + (PlayerData.player_data["技能学习"]["技能8"]["等级"] + 1) * 0.05
	else:
		jgz_bl = 1
	if self.position.x <= 0:
		self.position.x = 100
#	if self.position.x >= 4650:
#		self.position.x = 4400
	if self.position.y >= 800:
		self.position.y = 400
	if not is_set_:
		if MainSet.set_data["Difficult"] > 0:
			Difficult()
		iniSpeed = speed
		is_set_ = true
	CheckAddBuff()
	if MainSet.set_data["NoShowMonsterBody"] == false:
		monster_dir.visible = false
	if monster_dir.scale.x == 1:
		MonsterDirection = false
	else:
		MonsterDirection = true
	get_Player = Global.get_player
	count += 1
	if death():
		state = State.Death
	else:
		state = State.other#======测试
	if not is_on_floor() and not is_Fly:
		velocity.y -= gravity * delta
	match state:
		State.Death:
			state_death()
	if MainSet.set_data["MonsterLittleBlood"] and MainSet.set_data["NoShowMonsterBody"]:#如果小血条效果开启，那么显示
		little_blood_bar_control()#小血条控制	
	if self.Hp > 0 and not IsLimitBuff():
		Monster_Intelligence()
	else:
		if IsScary:
			if not is_be_attacking:
				WhenScary()
	if IsLimitBuff():
		if IsScary:
			if not is_be_attacking:
				WhenScary()
		else:
			if not is_be_attacking:
				velocity.x = 0
	check_hp()
	move_and_slide()
func IsLimitBuff():
	return is_ice or is_stun or is_Immobilize or is_sleep or IsScary or Islljy
func Monster_Intelligence():
	#print(Global.CheckWD(self))
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt() and not is_Immobilize and not Islljy:
		if has_target == false:
			normal_state()
		else:
			if IsSmartMonster:
				if abs(position.x - RoleProp.role_pos_x) >= attackRange:
					if RndiCount < SmartWaitCount:
						have_target()
					else:
						normal_state()
					if count % 90 == 0:
						if randi_range(0,100) < SmartHitCount:
							attack_target()
				else:
					if RndiCount < 60:
						normal_state()
					else:
						stop_move()
					if count % 60 == 0:
						if randi_range(0,100) < attackDesire:
							attack_target()
			else:
				if follow_Hero():
					have_target()
					if RunHit:
						if count % RunHitCount == 0:
							if randi_range(0,100) <= attackDesire:	
								attack_target()
							else:
								if randi_range(0,100) <= 20:
									stop_move()
								else:
									have_target()
				else:
					stop_move()
					if count % 60 == 0:
						if randi_range(0,100) < attackDesire:
							attack_target()
func RunHit_():
	if ran_num < 70:
		if position.x > get_Player.position.x + randi_range(-60,60):
			move_left()
		elif position.x < get_Player.position.x - randi_range(-60,60):
			move_right()
		else:
			stop_move()	
	else:
		stop_move()

func follow_Hero():
	return abs(position.x - RoleProp.role_pos_x) > attackRange
func to_hero():
	if RoleProp.role_pos_x > position.x:
		base_damage_box.scale.x = -1
		monster_dir.scale.x = -1
	else:
		base_damage_box.scale.x = 1
		monster_dir.scale.x = 1
func attack_target():
	#velocity.y = 0
	if RoleProp.role_pos_x > position.x:
		base_damage_box.scale.x = -1
		monster_dir.scale.x = -1
	else:
		base_damage_box.scale.x = 1
		monster_dir.scale.x = 1
	hit_name = "hit1"
	if not is_Fly:
		velocity.x = 0
	is_attacking = true
	mr_player.play("hit1")
	await mr_player.animation_finished
	is_attacking = false
	if not is_Fly:
		stop_move()
func normal_state():
	if is_quiescent:
		return
	if is_Fly:
		if ran_num < 95:
			if RoleProp.role_pos_y > position.y + randi_range(125,245):
				move_down()
			elif RoleProp.role_pos_y < position.y + randi_range(15,65):
				move_up()
		else:
			if ran_num < 50:
				move_down()
			else:
				move_up()
	if is_be_attacking:
		return

	if ran_num < 10:
		stop_move()
	elif ran_num >= 10 and ran_num <= 55:
		move_left()
	else:
		move_right()

func Else_haveTarget():
	if is_quiescent:
		return
	if is_Fly:
		if RoleProp.role_pos_y > position.y + randi_range(15,85):
			move_up()
		elif RoleProp.role_pos_y < position.y - randi_range(15,85):
			move_down()
	if RoleProp.role_pos_x > position.x + randi_range(65,85):
		move_left()
	elif RoleProp.role_pos_x < position.x - randi_range(65,85):
		move_right()
	else:
		stop_move()
func have_target():
	if is_quiescent:
		return
	if is_Fly:
		if RoleProp.role_pos_y > position.y + randi_range(125,245):
			move_down()
		elif RoleProp.role_pos_y < position.y + randi_range(15,45):
			move_up()
	if RoleProp.role_pos_x > position.x + randi_range(65,85):
		move_right()
	elif RoleProp.role_pos_x < position.x - randi_range(65,85):
		move_left()
func move_left():
	base_damage_box.scale.x = 1
	monster_dir.scale.x = 1
	#mr_ani.flip_h = false
	if IsScary:
		velocity.x = -speed * 15
	else:
		velocity.x = -speed * 10
	if not is_Fly:
		mr_player.play("walk")
	else:
		mr_player.play("Fly")
func move_right():
	base_damage_box.scale.x = -1
	monster_dir.scale.x = -1
	#mr_ani.flip_h = true
	if IsScary:
		velocity.x = speed * 15
	else:
		velocity.x = speed * 10
	if not is_Fly:
		mr_player.play("walk")
	else:
		mr_player.play("Fly")
func move_up():
	velocity.y = -speed * randi_range(7,9)
	if not is_Fly:
		mr_player.play("walk")
	else:
		mr_player.play("Fly")
func move_down():
	velocity.y = speed * randi_range(7,9)
	if not is_Fly:
		mr_player.play("walk")
	else:
		mr_player.play("Fly")
func stop_move():
	velocity.x = 0
	if not is_Fly:
		mr_player.play("wait")
	else:
		mr_player.play("Fly_wait")
	await get_tree().create_timer(behit_calmtime,false).timeout
func turn_towad_role():
	if RoleProp.role_pos_x < position.x:
		self.scale.x = 1
		#mr_ani.flip_h = false
	else:
		#self.scale.x = -1
		mr_ani.flip_h = true
func state_hurt():
	is_jgz = false
	if self is Monster114:
		if get_target.HitDic["hurtBack"][0] != 0 or get_target.HitDic["hurtBack"][1] != 0:
			is_be_attacking = true
			mr_player.play("hurt")
			if MonsterDirection:
				velocity.x = 250
			else:
				velocity.x = -250
			await mr_player.animation_finished
			velocity.x = 0
			is_be_attacking = false
		return
	if hd > 0:
		is_be_attacking = false
		return
	if self is Monster48:
		if self.ChangeBody:
			return
	
	if get_target.HitDic["hurtBack"][0] != 0 or get_target.HitDic["hurtBack"][1] != 0:
		is_be_attacking = true
		velocity.x = 0
		if is_quiescent or is_bt:
			pass
		else:
			be_hit_back(get_target)
		if get_target.HitDic["hurtBack"][0] != 0 or get_target.HitDic["hurtBack"][1] != 0:
			mr_player.play("hurt")
			await mr_player.animation_finished
		is_be_attacking = false
func little_blood_bar_control():
	if monster_blood_bar != null:
		if not is_be_attacking:
			monster_blood_bar.can_show = false
			monster_blood_bar.bar_value = float(Hp) / float(SHp)
			monster_blood_bar.bar_text = Hp
		else:
			monster_blood_bar.bar_value = float(Hp) / float(SHp)
			monster_blood_bar.bar_text = Hp
			monster_blood_bar.can_show = true	
func set_hd(value,max_value):
	hd = value
	max_hd = max_value
#func set_hd_length():
#	hd_bar.size.x = float(max_hd) / float(SHp) * big_blood.size.x
func be_hit_back(target):#击退方法
	#get_target
	if hd > 0:
		return
	if target == null:
		return
	if target is BaseHero:
		if not get_Player.PlayerDir:
			attack_to_right(target.HitDic["hurtBack"])
		else:
			attack_to_left(target.HitDic["hurtBack"])
	elif target is BaseMagicWeapon:
		if not target.mg_action.flip_h:
			attack_to_right(target.HitDic["hurtBack"])
		else:
			attack_to_left(target.HitDic["hurtBack"])
	elif target is RoleBullet:
		if not target.Direction:
			attack_to_right(target.HitDic["hurtBack"])
		else:
			attack_to_left(target.HitDic["hurtBack"])
	elif target is RoleBullet1:
		if not get_Player.PlayerDir:
			attack_to_right(target.HitDic["hurtBack"])
		else:
			attack_to_left(target.HitDic["hurtBack"])
	else:
		return
func attack_to_right(list):
	var sp_x = list[0]
	var sp_y = list[1]
	self.velocity.x = -sp_x * 30
	if not is_Fly:
		self.velocity.y = sp_y * 15
	else:
		self.velocity.y = sp_y * 3
func attack_to_left(list):
	var sp_x = list[0]
	var sp_y = list[1]
	self.velocity.x = sp_x * 30
	if not is_Fly:
		self.velocity.y = sp_y * 15
	else:
		self.velocity.y = sp_y * 3
func state_death():
	set_exp()
	set_gxp()
	velocity.x = 0
	if not self is Monster32:
		mr_player.play("death")
		#is_death = true
		if not is_death:
			if PlayerData.player_data.has(my_mr_name):
				var Current = PlayerData.player_data[my_mr_name]
				if self is Monster17 or self is Monster30 or self is Monster31 or self is Monster28:
					if is_boss:
						if not BaseLevel_ is Lhhj:
							PlayerData.player_data[my_mr_name] += 1
				elif self is Monster49:
					pass
				else:
						if not BaseLevel_ is Lhhj:
							PlayerData.player_data[my_mr_name] += 1
		is_death = true
		await mr_player.animation_finished
	else:
		if current_ < max_:
			if not is_bounds:
				is_bounds = true
				mr_player.play("bounds")
				if PlayerData.player_data.has(my_mr_name):
					var Current = PlayerData.player_data[my_mr_name]
					if not BaseLevel_ is Lhhj:
						PlayerData.player_data[my_mr_name] += 1
				#set_position_(-15,-18)
				return
		else:
			mr_player.play("death")
			if not is_death:
				if PlayerData.player_data.has(my_mr_name):
					var Current = PlayerData.player_data[my_mr_name]
					if not BaseLevel_ is Lhhj:
						PlayerData.player_data[my_mr_name] += 1
			is_death = true
			await mr_player.animation_finished

func fall_items():
	randomize()
	ran_1 = randf_range(0,1)
	if fall_list.size() > 0 and is_fall == false:
		var loc_4 = randi_range(0,(fall_list.size() - 1))
		var loc_2 = fall_list[loc_4]["name"]
		var loc_3 = fall_list[loc_4]["value"]
		if get_Player != null:
			if get_Player.IsDoubleFallPro:
				fall_pro *= 2			
		var GetAddPro = CheckFashionAndAddFallPro()
		fall_pro += GetAddPro
		if PlayerData.ChekEqzb("头衔","xczg"):
			fall_pro = 100
		if ran_1 <= float(fall_pro):
			Global.fall_item(get_parent().get_parent().fall_it,Vector2(self.position.x,self.position.y - 30),loc_2,loc_3)
			is_fall = true
	pass
func fall_medicine():
	randomize()
	ran_2 = randf_range(0,1)
	if PlayerData.ChekEqzb("头衔","xczg"):
		ran_2 = 0
	if ran_2 < 0.15 and is_fall_medi == false:
		ran_3 = randf_range(0,1)
		var rr = ran_3
		if rr < 0.4 and rr > 0:
			Global.fall_item(get_parent().get_parent().fall_it,Vector2(self.position.x,self.position.y - 30),"radish",0)
		elif rr < 0.8 and rr >= 0.4:
			Global.fall_item(get_parent().get_parent().fall_it,Vector2(self.position.x,self.position.y - 30),"Bble",0)
		else:
			Global.fall_item(get_parent().get_parent().fall_it,Vector2(self.position.x,self.position.y - 30),"peach",0)
		is_fall_medi = true
func fall_stone_():
	randomize()
	ran_4 = randf_range(0,1)
	if PlayerData.ChekEqzb("头衔","xczg"):
		fall_stone_pro = 100
	if fall_stone.size() > 0:
		var loc_1 = randi_range(0,(fall_stone.size() - 1))
		var loc_2 = fall_stone[loc_1]["name"]
		var loc_3 = fall_stone[loc_1]["value"]
		if ran_4 <= float(fall_stone_pro):
			Global.fall_item(get_parent().get_parent().fall_it,Vector2(self.position.x,self.position.y - 30),loc_2,loc_3)
	pass
func death():
	return Hp <= 0
func _on_hurt_box_area_entered(area: Area2D) -> void:
	is_jgz = false
	Global.TotalHitCount += 1
	
	
	has_target = true

	if area is BaseRoleHitBox or area is RolehmzBullet:# or area.get_parent() is Role1Shallow:#如果范围是角色或者火魔斩那么对象是角色
		get_target = get_Player
	elif area is MagicWeaponHit:#如果范围是法宝攻击，那么对象是法宝
		get_target = area.get_parent()
	elif area.get_parent() is Role1Shallow:
		get_target = area.get_parent()
	elif area is RoleBullet1:#如果范围是角色子弹，那么对象是他自己（因为可能需要伤害不变）
		get_target = area
	elif area.get_parent().get_parent() is RoleBullet:
		get_target = area.get_parent().get_parent()
	else:
		return
	if RoleProp.SourcePlayer.Istsz:
		var TszLevel = PlayerData.player_data["腾蛇阵"]["Level"]
		RoleProp.SourcePlayer.tszzs = TszLevel * 0.015
	else:
		RoleProp.SourcePlayer.tszzs = 0
	var last_hurt = get_Role_last_hurt(get_target) * RoleProp.ws_up_power * jgz_bl * HurtBl * (1 + lpzzs) * (1 + RoleProp.SourcePlayer.tszzs) * llrdzs
	GetHurt = last_hurt
	if get_Player is BaseHero: 
		if get_Player.is_DeadLink:
			get_Player.effect_reducehp(last_hurt,"real")
	cureWSValue()#添加无双值
	add_lj(last_hurt)#添加连击
	HurtReduceHp(last_hurt,get_target)
	Global.TotalRoleHit += last_hurt
	Role5Bullet(last_hurt)
	if get_target is BaseHero or get_target is MgHit or get_target is Role1Shallow or get_target is RoleBullet:
		match get_target.HitDic["attackKind"]:
			"physics":
				Global.TotalPhyHit += last_hurt
			"magic":
				Global.TotalMagHit += last_hurt
			"real":
				Global.TotalRealHit += last_hurt
		if get_target.HitDic["attackKind"] == "physics" and get_Player != null:
			get_Player.cure_Hp(last_hurt * RoleProp.roleprop.vampirism)
	if not is_miss and last_hurt > 0:
		if MainSet.set_data["MonsterLittleBlood"]:
			if monster_blood_bar == null:
				monster_blood_bar = Global.add_monster_blood(self,Vector2(-30,-90),Hp / float(SHp),Hp)#建立血条
		if PlayerData.player_data["Myself"] != 2:
			Global.addSound_(self,"res://Music/MonsterHurt/6_BeattackByRole1.mp3")
		else:
			Global.addSound_(self,"res://Music/Hero/9_BeattackByRole2.mp3")
		if not Monster_18_protect() and not Monster102Protect() and not IsSuperArmor:
			#print(get_target)
			state_hurt()
		HurtSpecialEffect = Global.add_mr_hurt(pz,Vector2(0,0))
	get_target = null
	
	
func Role5Bullet(last_hurt):
	if get_target == null:
		return
	if get_target is RoleBullet:
		if get_target.name_ == "Role5Bullet6":
			return
	if get_target is MgHit:
		return
	var SLevel = PlayerData.player_data["技能学习"]["技能10"]["等级"]
	if SLevel <= 0:
		return	
	if get_Player == null or last_hurt <= 0:	
		return
	if not get_Player is role5:
		return
	randomize()	
	if randi_range(0,100) > 15:		
		return		
	var HurtValue = int(last_hurt * 0.3 + (SLevel * 0.02))
	Global.addRoleBullet_(get_Player.Bullet,Vector2(position.x ,position.y + 30),false,"Role5Bullet6",
	{
		"power": HurtValue,
		"hurtBack":[0,0],
		"attackKind": "real",
		"WSValue": 5
	})
	var bl = 1 + (SLevel * 0.2)
	get_Player.cure_Hp(HurtValue * bl)
	
	
func get_Role_last_hurt(target):#传入对象，获取对象的HitDic字典，所以能攻击的对象必须有HitDic
	is_crit = false
	is_miss = false
	var Hurt = 0
	var Miss = 0
	var Crit = 0
	var LastDef = 0
	var LastMdef = 0
	var Level: int = 0
	var Lucky = 0
	var HurtLx: String = "real"
	if target is BaseHero or target is BaseMagicWeapon or target is RoleBullet1 or target is RoleBullet or target is MgHit or target is Role1Shallow:#如果攻击对象是角色或者法宝
		Miss = miss - RoleProp.roleprop.Htarget
		Crit = RoleProp.roleprop.Crit - Critreduce
		LastDef = def - RoleProp.roleprop.ar
		LastMdef = mdef - RoleProp.roleprop.sp
		Level = RoleProp.baseroleprop.Level
		Lucky = RoleProp.roleprop.Lucky - Toughness
	elif target is BaseBuff:
		Miss = miss - RoleProp.roleprop.Htarget
		Crit = RoleProp.roleprop.Crit - Critreduce
		LastDef = def - RoleProp.roleprop.ar
		LastMdef = mdef - RoleProp.roleprop.sp
		Level = RoleProp.baseroleprop.Level
		Lucky = RoleProp.roleprop.Lucky - Toughness
	else:#否则的话是未知目标，返回0伤害
		return 0
		
	if not target is BaseBuff:
		Hurt = target.HitDic["power"]
		HurtLx = target.HitDic["attackKind"]
	else:
		
		Hurt = target.LastValue
		HurtLx = target.BuffInfo["AttackKind"]
	if RoleProp.SourcePlayer.IsXr:
		Hurt *= RoleProp.SourcePlayer.xrbl
	if Miss <= 0:
		Miss = 0
	else:
		var miss_bl = abs(level - Level) * 0.04
		if miss_bl >= 0.9:
			miss_bl = 0.9
		if Level_suppression(Level):
			Miss = Miss * (1 + miss_bl)
		else:
			Miss = Miss * (1 - miss_bl)
	if Crit <= 0:
		Crit = 0
	else:
		var crit_bl = abs(level - Level) * 0.11
		if crit_bl >= 1:
			crit_bl = 1
		if Level_suppression(Level):
			Crit = Crit * (1 - crit_bl)
		else:
			Crit = Crit * (1 + crit_bl)
	if LastDef <= 0:
		LastDef = 0
	if LastMdef <= 0:
		LastMdef = 0
	if IsDefeReduce:
		LastDef *= 1 - DefeReduce
		LastMdef *= 1 - DefeReduce
	if Lucky <= 0 :
		Lucky = 0
	else:
		var lucky_bl = abs(level - Level) * 0.07
		if lucky_bl >= 0.7:
			lucky_bl = 0.7
		if Level_suppression(Level):
			Lucky = Lucky * (1 - lucky_bl)
		else:
			Lucky = Lucky * (1 + lucky_bl)
	var bl
	if Level_suppression(Level):
		Hurt = int(Hurt * (1 - is_suppression_num(Level) * 0.05))
	else:
		Hurt = int(Hurt * (1 + not_suppression_num(Level) * 0.05))
	Crit = snapped(Crit / float(Crit + 100),0.001)
	Miss = snapped(Miss / float(Miss + 70),0.001)
	randomize()
	if randf_range(0,1) <= Miss:
		is_miss = true
		return 0
	if randf_range(0,1) <= Crit:
		bl = 2 + snapped(Lucky / float(Lucky + 100),0.001) + tqzbs
		Hurt = Hurt * bl
		Global.TotalCritCount += 1
		is_crit = true

	match HurtLx:
		"physics":
			var 减伤率 = snapped(LastDef / float(LastDef + 100),0.001)
			Hurt = int(Hurt * (1 - 减伤率))
		"magic":
			var 减伤率 = snapped(LastMdef / float(LastMdef + 100),0.001)
			Hurt = int(Hurt * (1 - 减伤率))
	if IsIndestructible:
		if Hurt >= Hp:
			return 0
	return Hurt
func reduce_hp(value: int):
	if Monster_18_protect():
		cure_hp(value * 1)
		return 0
	if Monster102Protect():
		cure_hp(value)
		return 0
	if IsIndestructible:
		if value >= Hp:
			return 0
	var last_value = hd_reduce(value)
	Hp -= last_value
	total_hurt += last_value
	Global.TotalRoleHit += last_value
	Global.TotalRealHit += last_value
	var pp = get_parent().get_parent()
	var po = Vector2(self.position.x - 20,self.position.y - 240)
	if last_value > 0:
		Global.addDamageText(pp,po,last_value,"real",false,self)
	is_crit = false
	is_miss = false
func HurtReduceHp(value,target):
	if Monster_18_protect():
		cure_hp(value * 1)
		return 0
	if Monster102Protect():
		cure_hp(value)
		return 0
	if IsIndestructible:
		if value >= Hp:
			return 0
	var last_value = hd_reduce(value)
	Hp -= last_value
	total_hurt += last_value
	if last_value > 0:
		addHurtText(value,target)	
	else:
		if is_miss:
			addHurtText(value,target)	
	is_crit = false
	is_miss = false
func addHurtText(value,target):
	if value <= 0 and not is_miss: return
	if target == null:
		return
	elif target is BaseHero or target is BaseMagicWeapon or target is RoleBullet1 or target is RoleBullet or target is MgHit or target is Role1Shallow:
		var HurtLx = target.HitDic["attackKind"]
		if is_miss:
			var pp = get_parent().get_parent()
			var po = Vector2(self.position.x - 20,self.position.y - 240)
			Global.addMissEffect(pp,po)
		else:
			var pp = get_parent().get_parent()
			var po = Vector2(self.position.x - 20,self.position.y - 240)
			Global.addDamageText(pp,po,value,HurtLx,is_crit,self)
	elif target is BaseBuff:
		var HurtLx = target.BuffInfo["AttackKind"]
		var pp = get_parent().get_parent()
		var po = Vector2(self.position.x - 20,self.position.y - 240)
		Global.addDamageText(pp,po,value,HurtLx,is_crit,self)
func hd_reduce(value):
	var last_value
	if hd <= 0 or ws_hd:
		last_value = value
		return value
	if value >= hd:
		last_value = value - hd
	else:
		last_value = 0
	hd -= value
	return last_value
func cure_hp(value: int):
	if Hp <= 0:
		return
	if BloodFix:
		return
	value = value * (1 + Therapeutic_effects)
	if value + Hp >= SHp:
		value = SHp - Hp
	if value > 0:
		Hp += value
		var pp = get_parent().get_parent()
		var po = Vector2(self.position.x - 20,self.position.y - 240)
		Global.addDamageText(pp,po,value,"cure",false,self)

func remove_CD():
	if Skill_1_CD >= 0:
		Skill_1_CD -= 1
	if Skill_2_CD >= 0:
		Skill_2_CD -= 1
	if Skill_3_CD >= 0:
		Skill_3_CD -= 1
	if Skill_4_CD >= 0:
		Skill_4_CD -= 1
	if Skill_5_CD >= 0:
		Skill_5_CD -= 1
	if Skill_6_CD >= 0:
		Skill_6_CD -= 1

func _on_cd_remove_timeout() -> void:
	remove_CD()
func Level_suppression(Level):
	return level - Level > 0
func is_suppression_num(Level):
	var num: int
	if level - Level > 2:
		num = 2
	else:
		num = level - Level
	return num
func not_suppression_num(Level):
	var num: int
	if Level - level > 2:
		num = 2
	else:
		num = Level - level
	return num
func _on_change_state_timeout() -> void:
	ran_num = randi_range(0,100)
func do_hit_1():
	pass
func do_hit_2():
	pass
func do_hit_2_2():
	pass
func do_hit_3():
	pass
func do_hit_3_2():
	pass
func do_hit_4():
	pass
func do_hit_5():
	pass
func do_hit_6():
	pass
func set_position_(x: int,y: int):
	if mr_ani.flip_h == false:
		mr_ani.position.x = -x
	elif mr_ani.flip_h == true:
		mr_ani.position.x = x
	mr_ani.position.y = y
func cannotchangestatewhenattorbeatt():
	return is_attacking or is_be_attacking
func check_hp():
	if Hp >= SHp:
		Hp = SHp
	if Hp <= 0:
		Hp = 0


func _on_spontaneous_recovery_timeout() -> void:
	if Hp < SHp and not death():
		cure_hp(self_rhp)
func get_hd(value: int,hit_bl: float,hurt_bl: float):#这个到时候给特殊boss用，目前先写这里
	var hd_1 = int(total_hit * hit_bl)
	var hd_2 = int(total_hurt * hurt_bl)
	var total_hd: int
	var value_ = hd_1 + hd_2 + value
	total_hd += value_
	set_hd(total_hd,total_hd)
	total_hit = 0
	total_hurt = 0
func remove_hd():
	hd = 0
	max_hd = 0


func _on_hit_box_area_entered(area: Area2D) -> void:
	if self is Monster20:
		var abc: Monster20 = self
		if abc.Low_Hp():
			cure_hp(int((SHp - Hp) * 0.07))
	is_enter_hitBox = true
	var rro = area.get_parent().get_parent() as BaseHero
	if objattackDic != null and hit_name != null:
		if objattackDic[hit_name].has("addeffect"):
			if objattackDic[hit_name]["addeffect"].size() != 0:
				Global.AddBuff(rro.buff,objattackDic[hit_name]["addeffect"])



func add_lj(value):
	if value <= 0:
		return
	Global.LJ_times += 1
	if Global.LJ_times >= Global.MostLianji:
		Global.MostLianji = Global.LJ_times
	var father_ = self.get_parent().get_parent()
	Global.addCombo(father_.lj_tt,Global.LJ_times,Vector2(0,0))
	for i in father_.lj_tt.get_children().size() - 1:
		if father_.lj_tt.get_children()[i] != null:
			father_.lj_tt.get_children()[i].queue_free()
	Global.lj_count = 0


func Monster_18_protect():
	if self is Monster18:
		if self.MonsterDirection != !Global.Player_dir:
			if self.MonsterDirection == false:
				Global.add_SpecialEffect(self,Vector2(0,5),"protect",Vector2(1.1,1.1),false,1)
			else:
				Global.add_SpecialEffect(self,Vector2(0,5),"protect",Vector2(1.1,1.1),false,1)
			return true
	return false


func _on_hit_box_area_exited(_area: Area2D) -> void:
	if self is Monster43:
		if Skill_1_CD > 0:
			Skill_1_CD -= 3
		if hit_name == "csjq":
			cure_hp(self.objattackDic["csjq"]["power"] * 25 + int((SHp - Hp) * 0.07))
			self.Skill_3_CD = 0

func rush():
	velocity.x = 0
	if self.MonsterDirection:
		velocity.x += rush_speed
	else:
		velocity.x -= rush_speed
func gg_pl():
	if get_Player == null:
		var top = get_parent().get_parent()
		var role_jd = top.get_node("Hero")
		var role_ = role_jd.get_children()
		for i in role_:
			if i is BaseHero:
				get_Player = i
func move_playerto_boss(movetime):
	var tween = create_tween()
	tween.tween_property(get_Player,"position",self.position,movetime)
func cureWSValue():
	if not RoleProp.is_ws_state:
		if get_target != null:
			if get_target.HitDic.has("WSValue"):
				RoleProp.ws_value += get_target.HitDic["WSValue"]
			else:
				RoleProp.ws_value += 2	
		else:
			RoleProp.ws_value += 2
func shake(strength,times,interv):
	var baselevel = get_parent().get_parent() as BaseLevel
	baselevel.shake_(strength,times,interv)
func add_WSEffect(Object_):
		var WS_Effect = preload("res://Scene/Hero/Role_1/WS_Effect.tscn").instantiate()
		WS_Effect.add_child(Object_.duplicate())
		WS_Effect.set("position",get("position"))
		get_parent().add_child(WS_Effect)
#func on_HpChange(value):
#
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
	var not_lpz = true
	var not_lljy = true
	var not_NoDeBuff = true
	if self.buff == null:
		return
	
		
	for i in self.buff.get_children():
		if i != null:
			if i.BuffInfo["Name"] == "lljybuff":
				Islljy = true
				not_lljy = false
			if i.BuffInfo["Name"] == "NoDeBuff":
				NoDeBuff = true
				not_NoDeBuff = false
			
			if i.BuffInfo["Name"] == "lpzbuff":
				IsLpz = true
				not_lpz = false
			if i.BuffInfo["Name"] == "Ice":
				is_ice = true
				not_ice = false
			if i.BuffInfo["Name"] == "Indestructible":
				IsIndestructible = true
				not_Indestructible = false
			if i.BuffInfo["Name"] == "DefeReduce":
				IsDefeReduce = true
				not_DefeReduce = false
			if i.BuffInfo["Name"] == "SuperArmor":
				IsSuperArmor = true
				not_SuperArmor = false
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
			if i.BuffInfo["Name"] == "Scary":
				IsScary = true
				not_Scary = false
	if not_NoDeBuff:
		NoDeBuff = false
	if not_lljy:
		Islljy = false
	if not_lpz:
		IsLpz = false
		lpzjs = 0
	if not_Indestructible:
		IsIndestructible = false
	if not_DefeReduce:
		DefeReduce = 0
		IsDefeReduce = false
	if not_SuperArmor:
		IsSuperArmor = false
	if not_Scary:
		IsScary = false	
	if not_BloodFix:
		BloodFix = false			
	if not_Immobilize:
		is_Immobilize = false
	if not_ice:
		is_ice = false
	if not_dl:
		is_DeadLink = false
	if not_eyefix:
		is_EyeFix = false
	if not_stun:
		is_stun = false
	if not_sppeddown:
		is_speedDown = false
		speed = iniSpeed
	if buff.get_children().size() == 0:
		is_speedDown = false
		speed = iniSpeed
		is_stun = false
		is_EyeFix = false
		is_ice = false
		is_DeadLink = false
func ChangeHdCureHp(zhl):
	
	cure_hp(int(hd * zhl))
	remove_hd()
	pass
func Difficult():
	if MainSet.set_data["Difficult"] == 1:
		self.level = 99
		self.SHp = self.SHp * 1.5
		self.Hp = self.SHp
		self.def = self.def * 1.4
		self.mdef = self.mdef * 1.2
		self.crit = self.crit * 1.5
		self.miss = 10
		self.lucky = self.lucky * 1.5 + 30
		self.Htarget = 45
		self.Toughness = 15
		self.ar = 35 + self.ar 
		self.sp = 35 + self.sp 
		self.Critreduce = 0
		self.speed = self.speed * 1.2
		self.attackDesire = 100
		self.add_exp = self.add_exp * 1.5
		self.fall_coin = self.fall_coin * 1.5
		for i in self.objattackDic:
			if objattackDic[i].has("power"):
				objattackDic[i]["power"] = objattackDic[i]["power"] * randf_range(1.4,1.6)
		if self.fall_pro > 0:
			self.fall_pro = self.fall_pro * 1.5
	elif MainSet.set_data["Difficult"] == 2:
		self.level = 99
		if not is_boss:
			self.SHp = RoleProp.roleprop.SHp * 4 + self.SHp
			self.Hp = self.SHp
			self.def = self.def * 2
			self.mdef = self.mdef * 2
			self.crit = self.crit * 4
			self.miss = 20
			self.lucky = self.lucky * 2 + 30
			self.Htarget = 400
			self.Toughness = 35
			self.ar = 35 + self.ar * 2
			self.sp = 35 + self.sp * 2
			self.Critreduce = 0
			self.speed = self.speed * 1.2
			self.attackDesire = 100
			self.add_exp = self.add_exp * 2
			self.fall_coin = self.fall_coin * 2
			for i in self.objattackDic:
				if objattackDic[i].has("power"):
					objattackDic[i]["power"] = int(objattackDic[i]["power"] * randf_range(1.4,1.6) + RoleProp.roleprop.power * 0.2)
		else:
			self.SHp = RoleProp.roleprop.SHp * 20 + self.SHp
			self.Hp = self.SHp
			self.def = self.def * 2
			self.mdef = self.mdef * 2
			self.crit = self.crit * 4
			self.miss = 20
			self.lucky = self.lucky * 2 + 30
			self.Htarget = 400
			self.Toughness = 35
			self.ar = 35 + self.ar * 2
			self.sp = 35 + self.sp * 2
			self.Critreduce = 0
			self.speed = self.speed * 1.5
			self.attackDesire = 100
			self.add_exp = self.add_exp * 3
			self.fall_coin = self.fall_coin * 3
			for i in self.objattackDic:
				if objattackDic[i].has("power"):
					objattackDic[i]["power"] = int(objattackDic[i]["power"] * randf_range(1.4,1.6) + RoleProp.roleprop.power * 0.5)
		if self.fall_pro > 0:
			self.fall_pro = self.fall_pro * 2.2
func movetoplayer():
	self.position = get_Player.position
func set_fullHp():
	Hp = SHp


func _on_calm_hit_timeout() -> void:
	RndiCount = randi_range(0,100)


func _on_remove_hurt_bl_timeout() -> void:
	HurtBl = 1
func ADDMonsterDeathEffect():
	Global.add_SpecialEffect(self,Vector2(0,0),"MonsterDeath",Vector2(1,1),false,1)
func WhenScary():
	if ran_num <= 20:
		stop_move()
	elif ran_num > 20 and ran_num <= 60:
		move_left()
	else:
		move_right()
	pass
func Monster102Protect():
	if self is Monster102:
		if self.MyChild != null:
			return true
	return false
func set_gxp():
	if fall_coin > 0:
		for i in range(1,4):
			var pp = position + Vector2(randi_range(-15,15),randi_range(-15,15))
			Global.AddAura(get_parent().get_parent().fall_it,pp,fall_coin)
		fall_coin = 0
func set_exp():
	if add_exp > 0 and RoleProp.baseroleprop.Level < 55:
		RoleProp.CureExp(add_exp)
#		if not PlayerData.player_data["天庭"]:
#			if RoleProp.baseroleprop.Level < 40:
#
#		elif not PlayerData.player_data["截教"]:
#			if RoleProp.baseroleprop.Level < 50:
#				RoleProp.CureExp(add_exp)
#		elif not PlayerData.player_data["碧游宫"]:
#			if RoleProp.baseroleprop.Level < 75:
#				RoleProp.CureExp(add_exp)
		add_exp = 0
func CheckPlayerHaveDebuff(Target):
	if get_Player == null:
		return
	for i in get_Player.buff.get_children():
		if i != null:
			if i.BuffInfo["Name"] == Target:
				return true
	return false
func WDHurt():
	if RoleProp.SourcePlayer is role4:
		if PlayerData.player_data["技能学习"]["技能10"]["等级"] > 0:
			var VoodooCounts = Global.CheckWD(self)
			if VoodooCounts >= 7:
				var SkillLevel = PlayerData.player_data["技能学习"]["技能10"]["等级"]
				var Power = int(RoleProp.roleprop.power) * (0.5 + SkillLevel * 0.05)
				var SkillPower = int(VoodooCounts * Power)
				if SkillPower > 0:
					Global.addSound_(self,"res://Music/Hero/Role4/mds.mp3")
					Global.add_SpecialEffect(self,Vector2(0,-25),"mds",Vector2(1,1),false,1)
					reduce_hp(SkillPower)
				Global.RemoveWD(self)
func jsfzsy():
	#森罗阵buff未做
	var Levellpz = PlayerData.player_data["落魄阵"]["Level"]
	if PlayerData.player_data["已佩戴阵法"] == "lpz":
		lpzzs = Levellpz * 0.01
	else:
		lpzzs = 0
	var Leveltqz = PlayerData.player_data["太清阵"]["Level"]
	if PlayerData.player_data["已佩戴阵法"] == "tqz":
		tqzbs = Leveltqz * 0.01
	else:
		tqzbs = 0
