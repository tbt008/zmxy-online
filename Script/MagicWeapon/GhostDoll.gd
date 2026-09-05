extends BaseMagicWeapon
class_name GhostDoll
var FollowTarget: BaseMonster
var MonsterList = []
var HitTimes: int = 0
var MaxTimes: int = 0
var isBegin: bool

func _physics_process(delta: float) -> void:
	MonsterList = Global.get_parent_(Player,2).monster.get_children()
	self.FB_Level = PlayerData.get_mostLevel("xhmt") + 1
	if PlayerData.CheckHaveWX("xhmt","木"):
		objattackDic["hit1"] = {
			"power": int(25 + RoleProp.roleprop.power * (0.15 + (self.FB_Level * 0.03))),
			"hurtBack":[1,-2],
			"attackKind": "magic"
		}
		MaxTimes = 5 + int(self.FB_Level / 3)
	else:
		objattackDic["hit1"] = {
			"power": int(12 + RoleProp.roleprop.power * (0.07 + (self.FB_Level * 0.02))),
			"hurtBack":[1,-2],
			"attackKind": "magic"
		}
		MaxTimes = 3 + int(self.FB_Level / 3)
	needMp = 25 + self.FB_Level * 5
	super._physics_process(delta)
	if HitTimes > 0:
		get_target()
		if FollowTarget != null:
			if not isBegin:
				var changepp: Vector2
				var tween = get_tree().create_tween()
				changepp = Vector2(0,112)
				tween.tween_property(self,"position",FollowTarget.position - changepp,0.25)
				isBegin = true
		else:
			Useover()
		if isBegin:#写攻击逻辑
			mg_player.play("hit")
			await mg_player.animation_finished
			change_dir()
			isBegin = false
			get_target()
			if HitTimes <= 0:
				Useover()
func change_dir():
	if FollowTarget != null:
		if FollowTarget is BaseMonster:
			if self.position.x > FollowTarget.position.x:
				scale.x = 1
				self.SelfDir = false
			else:
				self.SelfDir = true
				scale.x = -1

func ShowSkill():
	var a_1
	var Monster: BaseMonster = null
	var a_2 = 0
	var Monster_2: BaseMonster = null
	var a_3
	Global.RemoveAllBuff()
	mg_player.play("Show")
	await mg_player.animation_finished
	a_1 = 5000
	a_2 = 0
	while a_2 < MonsterList.size():
		if MonsterList[a_2] != null and MonsterList[a_2] is BaseMonster:
			Monster_2 = MonsterList[a_2]
		else:
			Useover()
			FollowTarget = null
			return null
		if Monster_2 == null:
			Useover()
			FollowTarget = null
			return null
		if Monster_2 is Monster138:
			a_2 += 1
			continue
		a_3 = Global.GetDisBetweem(Player,Monster_2)
		if a_3 <= a_1:
			a_1 = a_3
			if Monster_2 is Monster48:
				if Monster_2.ChangeBody:
					Useover()
					FollowTarget = null
					return null
			Monster = Monster_2
		a_2 += 1
	if Monster != null:
		FollowTarget = Monster
		Global.FB_CD = 5
		HitTimes = MaxTimes
	change_dir()
	if FollowTarget == null:
		RoleProp.roleprop.Mp += needMp
		Useover()
func get_target():
	var a_1
	var Monster: BaseMonster = null
	var a_2 = 0
	var Monster_2: BaseMonster = null
	var a_3
	a_1 = 1000
	a_2 = 0
	while a_2 < MonsterList.size():
		if MonsterList[a_2] != null and MonsterList[a_2] is BaseMonster:
			Monster_2 = MonsterList[a_2]
		else:
			Useover()
			FollowTarget = null
			return null
		if Monster_2 == null:
			Useover()
			FollowTarget = null
			return null
		if Monster_2 is Monster138:
			a_2 += 1
			continue
		a_3 = Global.GetDisBetweem(Player,Monster_2)
		if a_3 <= a_1:
			a_1 = a_3
			if Monster_2 is Monster48:
				if Monster_2.ChangeBody:
					FollowTarget = null
					Useover()
					return null
			Monster = Monster_2
		a_2 += 1
	if Monster != null:
		if not Monster_2 is Monster138:
			FollowTarget = Monster
		

func Useover():
	FollowTarget = null
	HitTimes = 0
	isBegin = false
	is_use = false
	if PlayerData.CheckHaveWX("xhmt","木"):
		self.usecd = 6
		skill_cd.start(6)
	else:
		self.usecd = 12
		skill_cd.start(12)
	self.visible = false
func reduceTimes():
	HitTimes -= 1
	
func GhostBullet_1():
	var Gh_1
	if self.SelfDir:
		#print("123")
		Gh_1 = Global.addWeaponBullet_(self,Vector2(-60,0),"GhostDollBullet_1",objattackDic["hit1"],self.SelfDir,100)
	else:
		#print("124")
		Gh_1 = Global.addWeaponBullet_(self,Vector2(-60,0),"GhostDollBullet_1",objattackDic["hit1"],!self.SelfDir,100)
func GhostBullet_2():
	if self.SelfDir:
		Global.addWeaponBullet_(self,Vector2(-60,0),"GhostDollBullet_2",objattackDic["hit1"],self.SelfDir,100)
	else:
		Global.addWeaponBullet_(self,Vector2(-60,0),"GhostDollBullet_2",objattackDic["hit1"],!self.SelfDir,100)
func GhostBullet_3():
	if self.SelfDir:
		Global.addWeaponBullet_(self,Vector2(-60,30),"GhostDollBullet_3",objattackDic["hit1"],!self.SelfDir,100)
	else:
		Global.addWeaponBullet_(self,Vector2(-60,30),"GhostDollBullet_3",objattackDic["hit1"],self.SelfDir,100)
func _on_check_monster_body_entered(body: Node2D) -> void:
	pass
	
func free() -> void:
	FollowTarget = null
func _on_skill_cd_timeout() -> void:
	super._on_skill_cd_timeout()
	self.visible = true
