extends BaseMonster
class_name Monster68
var Is_Stick = false
var Position: Vector2
var StickCount: int = 0
var MaxStickCount: int = randi_range(6,8)
var CurrentStickCount: int = 0
var Myfather: Monster67
func monster_67():
	self.is_boss = false
	self.my_mr_name = "水蛭"
	self.attack_in = 0
	self.level = RoleProp.baseroleprop.Level + 2
	self.SHp = 3000
	self.Hp = self.SHp
	self.def = 120
	self.mdef = 120
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 9
	self.mysee = 300
	self.attackRange = 225
	self.attackDesire = 0
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 0
	self.objattackDic["hit1"] = {
		"power": randi_range(100,150),
		"hurtBack":[0,0],
		"attackKind": "magic",
		"HitProtect": 0
	}
	self.fall_pro = 0
	self.fall_list = []	
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	Position = Vector2(randi_range(-10,10),randi_range(-15,15))
	super._ready()
	monster_67()
	Skill_1_CD = 0
func Monster_Intelligence():
	if Myfather == null:
		Myfather = Global.Create_Monster(67,get_parent(),position)
	if Is_Stick:
		StickCount += 1
		$BaseDamageBox/HurtBox/HurtBox.disabled = true
		self.position = get_Player.position + Position
		ShouldInSky = true
		if StickCount % 60 == 0 and StickCount != 0:
			CurrentStickCount += 1
			if Myfather != null:
				Myfather.cure_hp(randi_range(1000,1600))
			if get_Player != null:
				get_Player.effect_reducehp(objattackDic["hit1"]["power"],objattackDic["hit1"]["attackKind"])
				Global.AddBuff(get_Player.buff,{
							"Name": "speed_down",
							"AddTime": 0.4,
							"ReduceInterval": 0,
							"value": 0.3,
							"AttackKind": "",
							"DeBuff": true,
						})
		if CurrentStickCount > MaxStickCount:
			CurrentStickCount = 0
			Is_Stick = false
		return
	ShouldInSky = false
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) > attackRange:
				have_target()
			else:
				if count % 60 == 0:
					attack_target()
				else:
					stop_move()
func attack_target():
	to_hero()
	hit_name = "hit1"
	if MonsterDirection:
		velocity.x += 188
	else:
		velocity.x -= 188
	velocity.y = -400
	is_attacking = true
	mr_player.play("hit1")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func _on_hit_box_area_exited(_area: Area2D) -> void:
	Is_Stick = true
	super._on_hit_box_area_entered(_area)
