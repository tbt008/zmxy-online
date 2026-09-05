extends BaseMonster
class_name Monster36
var should_death = false
var WaitTime = [120,90,180,60]
var GetWWaitTime: int
func monster_36():
	self.is_Fly = true
	self.CannotAttract = true
	self.is_boss = false
	self.my_mr_name = "傀儡王右手"
	self.attack_in = 10
	self.level = 90
	self.SHp = 10000
	self.Hp = self.SHp
	self.def = 150
	self.mdef = 150
	self.crit = 8
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 7
	self.mysee = 225
	self.attackRange = 305
	self.attackDesire = 80
	self.behit_calmtime = 0.2
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 0
	self.objattackDic["hit1"] = {
		"power": 400,
		"hurtBack":[-4,-9],
		"attackKind": "physics",
		"addeffect":{
			"Name": "Bleed",
			"DeBuff": true,
			"AddTime": 3,
			"ReduceInterval": 0.5,
			"value": 35,
			"AttackKind": "physics",
		}
	}
	self.objattackDic["xfj"] = {
		"power": 500,
		"hurtBack":[-3,-15],
		"attackKind": "magic",
		"addeffect":{
			"Name": "silent",
			"DeBuff": true,
			"AddTime": 5 ,
			"CanAdd":false,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
		}
	}
	self.objattackDic["wl"] = {
		"power": 400,
		"hurtBack":[-3,-15],
		"attackKind": "magic"
	}
	self.fall_pro = 0.00
	self.fall_list = []	
	self.fall_stone_pro = 0
	self.fall_stone = []
func _ready() -> void:
	$ChangePL.start(randi_range(4,6))
	GetWWaitTime = WaitTime[randi_range(0,3)]
	super._ready()
	monster_36()
	hit_name = "hit1"
	Skill_1_CD = 0
	Skill_2_CD = 0
func _physics_process(delta: float) -> void:
	velocity.x = 0
	velocity.y = 0
	super._physics_process(delta)
func Monster_Intelligence():
	velocity.x = 0
	velocity.y = 0
	if Hp > 0:
		if Skill_1_CD > 0 and Skill_2_CD > 0:
			if count % 240 == 0:
				if randi_range(0,100) <= attackDesire:
					do_hit_1()
				else:
					if not is_attacking:
						mr_player.play("wait")
			else:
				if not is_attacking:
					mr_player.play("wait")
		else:
			if Skill_1_CD <= 0:
				do_hit_2()
			else:
				if not is_attacking:
					mr_player.play("wait")
func do_hit_1():
	hit_name = "hit1"
	is_attacking = true
	mr_player.play("hit")
	await mr_player.animation_finished
	is_attacking = false
func do_hit_2():
	Skill_1_CD = 12
	hit_name = "xfj"
	is_attacking = true
	mr_player.play("jf")
	await mr_player.animation_finished
	is_attacking = false
func do_hit_3():
	Skill_2_CD = 20
	hit_name = "wl"
	is_attacking = true
	mr_player.play("wl")
	await mr_player.animation_finished
	is_attacking = false
func call_ljf():
	var ljf = Global.CallFlyBullet(self.bullet,"Monster17Bullet",1,Vector2(self.position.x + 130,self.position.y + 120),900,400,"xfj",self.objattackDic["xfj"])
	ljf.set_modulate(Color(2,0,2,1))
func call_wling():
	randomize()
	for i in range(randi_range(1,2)):
		var list = [26,27,28,30,31]
		Global.Create_Monster(list[randi_range(0,4)],get_parent(),Vector2(self.position.x,self.position.y + 100))
func CallFL():
	return
	var NewList = [{"Ratation":30,"Position": Vector2(0,0)},{"Ratation":60,"Position": Vector2(0,0)},{"Ratation":-20,"Position": Vector2(0,0)},
	{"Ratation":-60,"Position": Vector2(0,0)},{"Ratation":70,"Position": Vector2(0,0)},{"Ratation":20,"Position": Vector2(0,0)}]
	NewList.shuffle()
	for i in NewList:
		var fl = Global.add_Bullet("Monster33Bullet2",self.bullet,true,1,i["Position"] + position,"wl",self.objattackDic["wl"])
		fl.rotation_degrees = i["Ratation"]
		await get_tree().create_timer(0.7,false).timeout


func _on_change_pl_timeout() -> void:
	GetWWaitTime = WaitTime[randi_range(0,3)]
	$ChangePL.start(randi_range(4,6))
