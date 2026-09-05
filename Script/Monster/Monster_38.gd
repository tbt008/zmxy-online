extends BaseMonster
class_name Monster38
func monster_38():
	self.is_Fly = true
	self.is_boss = false
	self.CannotAttract = true
	self.my_mr_name = "巫毒娃娃"
	self.attack_in = 15
	self.level = 99
	self.SHp = 999999
	self.Hp = self.SHp
	self.def = 999
	self.mdef = 999
	self.crit = 20
	self.miss = 15
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 13
	self.mysee = 500
	self.attackRange = 55
	self.attackDesire = 60
	self.behit_calmtime = 0.3
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 0
	self.objattackDic["hit1"] = {
		"power": 99,
		"hurtBack":[-7,-9],
		"attackKind": "physics",
		"addeffect":{
			"Name": "poision",
			"AddTime": 5,
			"ReduceInterval": 0.7,
			"value": 50,
			"CanAdd":true,
			"DeBuff": true,
			"AttackKind": "magic",
		}
	}
	self.fall_pro = 0
	self.fall_list = []	
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_38()
func Monster_Intelligence():
	
	if abs(position.x - RoleProp.role_pos_x) > attackRange:
		if count % 180 == 0:
			attack_target()
		else:
			have_target()
	else:
		do_hit_2()
func attack_target():
	if RoleProp.role_pos_x > position.x:
		move_right()
	else:
		move_left()
	hit_name = "hit1"
	is_attacking = true
	mr_player.play("hit1")
	await mr_player.animation_finished
	is_attacking = false
func do_hit_2():
	self.Hp = -10
	self.is_death = true
	hit_name = "death"
	velocity.x = 0
	is_attacking = true
	mr_player.play("death")
	await mr_player.animation_finished
	is_attacking = false
func call_dd():
	if self.MonsterDirection:
		Global.CallChaseBullet(self.bullet,"Monster37Bullet",220,3,true,Vector2(self.position.x,self.position.y),"hit1",self.objattackDic["hit1"])
	else:
		Global.CallChaseBullet(self.bullet,"Monster37Bullet",220,3,true,Vector2(self.position.x,self.position.y),"hit1",self.objattackDic["hit1"])
func call_death():
	Global.add_Bullet("Monster38Bullet",get_parent(),false,1,Vector2(self.position.x,self.position.y),"hit1",self.objattackDic["hit1"])

func have_target():
	velocity.y = 0
	if RoleProp.role_pos_x > position.x:
		move_right()
	elif RoleProp.role_pos_x < position.x:
		move_left()


func _on_death_timeout() -> void:
	self.Hp = -10
