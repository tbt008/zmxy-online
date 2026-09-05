extends BaseMagicWeapon
class_name Mirror
var FixTarget: BaseMonster
var FollowTarget: BaseObject
var BloodEffect
var InitSpeed: int = 5
var Speed: int = 5
var isBegin: bool
var FixTime: int = 960
var MonsterList:Array = []
var TotalHp: int = 0
var IsShowSkill: bool
var velocity
var IsFollow: bool
func _physics_process(delta: float) -> void:

	MonsterList = Player.get_parent().get_parent().monster.get_children()
	self.FB_Level = PlayerData.get_mostLevel("bsyj") + 1
	if PlayerData.CheckHaveWX("bsyj","木"):
		objattackDic["hit1"] = {
			"power": int(RoleProp.roleprop.SHp * (0.16 + (self.FB_Level * 0.01))),
			"hurtBack":[0,0],
			"attackKind": "real",
			"addeffect":{
				"Name": "speed_down",
				"AddTime": 1,
				"ReduceInterval": 0,
				"value": 0.3,
				"AttackKind": "",
				"DeBuff": true
			}
		}
	else:
		objattackDic["hit1"] = {
			"power": int(RoleProp.roleprop.SHp * (0.08 + (self.FB_Level * 0.005))),
			"hurtBack":[0,0],
			"attackKind": "real",
			"addeffect":{
				"Name": "speed_down",
				"AddTime": 0.5,
				"ReduceInterval": 0,
				"value": 0.15,
				"AttackKind": "",
				"DeBuff": true
			}
		}
	needMp = 25
	var a_2
	super._physics_process(delta)
	if FollowTarget != null:
		var target: Vector2
		if FollowTarget is BaseMonster:
			target = FollowTarget.position - Vector2(0, 140)
		elif FollowTarget is BaseHero:
			target = FollowTarget.position - Vector2(0, 70)
		velocity = position.direction_to(target) * Speed
		self.position.x = self.position.x + velocity.x
		self.position.y = self.position.y + velocity.y
		if Speed < 15:
			Speed += 1
		a_2 = position.distance_to(target)
		if a_2 < 10:	
			if FollowTarget == FixTarget:
				isBegin = true
				FollowTarget = null
				Speed = InitSpeed
			elif FollowTarget == Player:
				Useover()
				Player.FBcureHp(TotalHp)
				TotalHp = 0
			else:
				Useover()
				FixTime = 0
#		else:
#			Useover()

	if isBegin:		
		if FixTarget != null:
			self.position = FixTarget.position - Vector2(0, 140)
			if FixTime % 60 == 0:
				addSpecialEffect()
				if FixTarget == null or not FixTarget is BaseMonster:
					FixTime = 0
				else:
					if FixTarget != null and FixTarget is BaseMonster:
						Global.AddBuff(FixTarget.buff,objattackDic["hit1"]["addeffect"])
						TotalHp += reduceHp()
					else:
						FixTime = 0
		else:
			FixTime = 0
			#Useover()
		if FixTime == 0:
			FollowTarget = Player
			FixTarget = null
			isBegin = false	
		if FixTime > 0: 
			FixTime -= 1


func ShowSkill():
#	print(FollowTarget)
#	print(FixTarget)
	IsFollow = true
	IsShowSkill = true
	Global.FB_CD = 5
	var a_1
	var Monster: BaseMonster = null
	var a_2 = 0
	var Monster_2: BaseMonster = null
	var a_3
	a_1 = 5000
	a_2 = 0
	while a_2 < MonsterList.size():
		if MonsterList[a_2] == null:
			Useover()
			return
		Monster_2 = MonsterList[a_2] as BaseMonster
		a_3 = Global.GetDisBetweem(Player,Monster_2)
		if a_3 <= a_1:
			a_1 = a_3
		if Monster_2 is Monster49 or Monster_2 is Monster50:
			if Monster_2.is_stop:
				pass
			else:
				Monster = Monster_2
		else:
			Monster = Monster_2
		a_2 += 1
	if Monster != null:
		mg_player.play("hit")
		FixTarget = Monster
		FollowTarget = FixTarget
	if FollowTarget == null or FixTarget == null:
		RoleProp.roleprop.Mp += needMp
		Useover()
	IsShowSkill = false
func Useover():
	IsFollow = false
	IsShowSkill = false
	isBegin = false
	FixTime = 60 * 16
	is_use = false
	Global.FB_CD = 0
	self.usecd = 1
	skill_cd.start(1)
	FollowTarget = null
	isBegin = false
	Speed = InitSpeed

func _on_check_monster_body_entered(body: Node2D) -> void:
	return
	if body is BaseMonster:
		MonsterList.push_back(body)

func reduceHp():
	var hurt = int(objattackDic["hit1"]["power"] / 15)
	FixTarget.reduce_hp(hurt)
	return hurt	

func checkMonsterDeath():
	for i in MonsterList:
		if i != null:
			if i is BaseMonster:
				if i.is_death:
					MonsterList.erase(i)	
			else:
				MonsterList.erase(i)	
		else:
			MonsterList.erase(i)
func free() -> void:
	FollowTarget = null
	FixTarget = null	
func addSpecialEffect():
	Global.add_SpecialEffect(self,Vector2(0,-25),"MirrorHpSteal",Vector2(1,1),false,1)
	Global.add_SpecialEffect(self,Vector2(0,0),"MirrorHpSteal",Vector2(1,1),true,0.9)
	Global.add_SpecialEffect(self,Vector2(0,25),"MirrorHpSteal",Vector2(1,1),false,1.2)
	Global.add_SpecialEffect(self,Vector2(0,15),"MirrorHpSteal",Vector2(1,1),true,0.8)
	Global.add_SpecialEffect(self,Vector2(0,-15),"MirrorHpSteal",Vector2(1,1),false,0.7)
	Global.add_SpecialEffect(self,Vector2(0,35),"MirrorHpSteal",Vector2(1,1),true,0.9)
	Global.add_SpecialEffect(self,Vector2(0,45),"MirrorHpSteal",Vector2(1,1),false,1.2)
	Global.add_SpecialEffect(self,Vector2(0,45),"MirrorHpSteal",Vector2(1,1),true,0.8)
	Global.add_SpecialEffect(self,Vector2(0,-35),"MirrorHpSteal",Vector2(1,1),false,0.7)


func _on_timer_timeout() -> void:
	if not isBegin:
		if FollowTarget == null and FixTarget == null:
			Useover()
