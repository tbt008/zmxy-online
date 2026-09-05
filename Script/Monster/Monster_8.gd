extends BaseMonster
class_name Monster8
var buff_icon
@onready var rd: Area2D = $Rd
@onready var rrd: CollisionShape2D = $Rd/rrd
var has_hd = true
func monster_8():
	Skill_1_CD = 0
	self.CannotAttract = true
	self.is_quiescent = true
	self.is_boss = true
	self.my_mr_name = "蝙蝠石像"
	self.attack_in = 10
	self.level = 17
	self.SHp = 2500
	self.Hp = self.SHp
	self.def = 500
	self.mdef = 500
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 200
	self.ar = 0
	self.sp = 0
	self.Critreduce = 500
	self.speed = 0
	self.mysee = 300
	self.attackRange = 75
	self.attackDesire = 100
	self.behit_calmtime = 0.2
	self.self_rhp = 50
	self.add_exp = 50
	self.fall_coin = 14
	self.objattackDic["hit1"] = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": ""
	}
	
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "whg",
			"value": 0
		},
		{
			"name": "bsp",
			"value": 0
		},
		{
			"name": "wtp",
			"value": 0
		},
	]	
	self.fall_stone_pro = 0
	self.fall_stone = [
	]	
var RD
func _ready() -> void:
	super._ready()
	monster_8()
func _physics_process(delta: float) -> void:
	if state != State.Death:
		if has_hd:
			self.self_rhp = 100
			self.def = 9999
			self.mdef = 9999
			mr_player.play("wait")
		else:
			self.def = 60
			self.mdef = 70
			self.self_rhp = 0
			if buff_icon != null:
				buff_icon.queue_free()
			mr_player.play("can_hurt")
	if RD != null:
		rrd.disabled = false
	else:
		rrd.disabled = true
	velocity.x = 0
	if is_on_floor():
		velocity.y = 0
	super._physics_process(delta)

func use_Skill_1():
	Skill_1_CD = 10
	call_monster()

func call_monster():
	Global.add_SpecialEffect(self,Vector2(21,-46),"red_eyes",Vector2(1,1),false,1)
	Global.add_SpecialEffect(self,Vector2(-27,-46),"red_eyes",Vector2(1,1),true,1)
	create_bf(randi_range(3,6))
func create_bf(get_number):
	for i in range(get_number):
		var pp_x = self.position.x + randi_range(-200,200)
		var pp_y = self.position.y + randi_range(-50,-350)
		var bf = Global.Create_Monster(7,get_parent(),Vector2(pp_x,pp_y))
		bf.def += 10
		bf.mdef += 10
		bf.SHp = bf.SHp * 1.5
		bf.Hp = bf.SHp
		bf.add_exp = 1
		bf.fall_coin = 1
		bf.fall_pro = 0
		bf.fall_stone_pro = 0
func _on_create_rd_timeout() -> void:
	randomize()
	var po_x_list = [-600,-700,-200,-250]
	if RD == null:
		RD = Global.add_SpecialEffect(self,Vector2(po_x_list[randi_range(0,3)],randi_range(-300,0)),"rd",Vector2(1,1),false,1)
		rd.position = RD.position
		
func _on_rd_area_entered(area: Area2D) -> void:
	$create_rd.stop()
	has_hd = false
	remove_hd()
	$reset_hd.wait_time = 5
	$reset_hd.start()
func Monster_Intelligence():
	if Skill_1_CD <= 0:
		use_Skill_1()
func attack_target():
	pass


func _on_reset_hd_timeout() -> void:
	#get_hd(99999999999,0,0)
	has_hd = true
	$create_rd.wait_time = 3
	$create_rd.start()
