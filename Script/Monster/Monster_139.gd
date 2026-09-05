extends BaseMonster
class_name Monster139
var ShowBox: bool = false
var BigBody: bool = false
var CanMove: bool = false
var CanAttack: bool = false
var SecondHurt: int
var AllHurt: int
var IsAttacking: bool
var AttackingCount:int
var AttackTime: int
var EveryHurt: int
@onready var remove_all_hurt: Timer = $RemoveAllHurt
@onready var total_dam: Label = $HurtInfo/TotalDam
@onready var total_dam_2: Label = $HurtInfo/TotalDam2
@onready var total_dam_3: Label = $HurtInfo/TotalDam3

@onready var buttonlist: VBoxContainer = $buttonlist
@onready var bt: Button = $buttonlist/bt
@onready var bt_2: Button = $buttonlist/bt2
@onready var bt_3: Button = $buttonlist/bt3
var ShowBoxCount: int = 0
func monster_139():
	self.is_boss = true
	self.my_mr_name = "草木皆兵"
	self.attack_in = 0
	self.level = 5
	self.SHp = 5000
	self.Hp = self.SHp
	self.def = 100
	self.mdef = 100
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 10
	self.mysee = 300
	self.attackRange = 145
	self.attackDesire = 70
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 0
	self.objattackDic["hit1"] = {
		"power": 100,
		"hurtBack":[-3,-6],
		"attackKind": "physics",
		"HitProtect": 10,
	}
	self.fall_pro = 0
	self.fall_list = []		
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_139()
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("假人攻击"):
		if CanAttack:
			CanAttack = false
		else:
			CanAttack = true
	if Input.is_action_just_pressed("假人霸体"):	
		if BigBody:
			BigBody = false
		else:
			BigBody = true
	if Input.is_action_just_pressed("假人移动"):			
		if CanMove:
			CanMove = false
		else:
			CanMove = true
	if IsAttacking:
		AttackingCount += 1
		if AttackingCount % 60 == 0:
			AttackTime += 1
	if AllHurt > 0:
		total_dam.text = "累计受到伤害：" + str(AllHurt)
	else:
		total_dam.text = ""
	if AttackTime > 0 and AllHurt > 0:
		SecondHurt = int(AllHurt) / int(AttackTime)
		if SecondHurt > 0:
			total_dam_2.text = "每秒受到伤害：" + str(SecondHurt)
		else:
			total_dam_2.text = ""
	else:
		total_dam_2.text = ""
	if EveryHurt > 0:
		total_dam_3.text = "每一秒受到伤害：" + str(EveryHurt)
	else:
		total_dam_3.text = ""
	if BigBody:
		bt.text = "当前不可击退，快捷键：Q"
	else:
		bt.text = "当前可以击退，快捷键：Q"
	if CanMove:
		bt_2.text = "当前可以移动，快捷键：R"
	else:
		bt_2.text = "当前不可移动，快捷键：R"
	if CanAttack:
		bt_3.text = "当前可以攻击，快捷键：E"
	else:
		bt_3.text = "当前不可攻击，快捷键：E"
#	if ShowBox:
#		buttonlist.visible = true
#		ShowBoxCount = 180
#	else:
#		ShowBoxCount -= 1
#	if ShowBoxCount <= 0:
#		buttonlist.visible = false
	super._physics_process(delta)
func Monster_Intelligence():
	if CanMove:
		if abs(RoleProp.role_pos_x - position.x) < mysee:
			has_target = true
		if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt() and not is_Immobilize:
			if has_target == false:
				normal_state()
			else:
				if abs(position.x - RoleProp.role_pos_x) >= attackRange:
						have_target()
				else:
					stop_move()
					if CanAttack:
						if count % 60 == 0:
							if randi_range(0,100) < attackDesire:
								attack_target()
	else:
		if not is_be_attacking:
			stop_move()
func state_hurt():
	is_jgz = false
	if BigBody:
		is_be_attacking = false
		return
	super.state_hurt()
func _on_buttonlist_mouse_entered() -> void:
	ShowBox = true



func _on_bt_pressed() -> void:
	if BigBody:
		BigBody = false
	else:
		BigBody = true


func _on_bt_2_pressed() -> void:
	if CanMove:
		CanMove = false
	else:
		CanMove = true


func _on_bt_3_pressed() -> void:
	if CanAttack:
		CanAttack = false
	else:
		CanAttack = true
func _on_buttonlist_mouse_exited() -> void:
	ShowBox = false
func HurtReduceHp(value,target):
	IsAttacking = true
	if value > 0:
		remove_all_hurt.start(4)
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
	EveryHurt += last_value
	AllHurt += last_value
	if last_value > 0:
		addHurtText(value,target)	
	else:
		if is_miss:
			addHurtText(value,target)	
	is_crit = false
	is_miss = false
func reduce_hp(value: int):
	IsAttacking = true
	if value > 0:
		remove_all_hurt.start(4)
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
	AllHurt += last_value
	EveryHurt += last_value
	Global.TotalRoleHit += last_value
	Global.TotalRealHit += last_value
	var pp = get_parent().get_parent()
	var po = Vector2(self.position.x - 20,self.position.y - 240)
	if last_value > 0:
		Global.addDamageText(pp,po,last_value,"real",false,self)
	is_crit = false
	is_miss = false
	


func _on_remove_all_hurt_timeout() -> void:
	AllHurt = 0
	AttackTime = 0
	IsAttacking = false
	AttackingCount = 0


func _on_every_second_timeout() -> void:
	EveryHurt = 0
