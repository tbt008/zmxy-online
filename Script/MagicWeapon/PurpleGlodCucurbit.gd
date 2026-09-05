extends BaseMagicWeapon
class_name PurpleGlodCucurbit

func _physics_process(delta: float) -> void:
	
	self.FB_Level = PlayerData.get_mostLevel("zjhl")
	needMp = 50 + self.FB_Level * 12
	var Power: int
	var playerPower = RoleProp.roleprop.power
	if PlayerData.CheckHaveWX("zjhl","木"):
		Power = int(playerPower * randf_range(0.15,0.2)) + int(playerPower * (randf_range(0.08,0.1) * self.FB_Level))
	else:
		Power = int(playerPower * randf_range(0.08,0.1)) + int(playerPower * (randf_range(0.05,0.07) * self.FB_Level))
	objattackDic["hit1"] = {
		"power": Power,
		"hurtBack":[0,0],
		"attackKind": "physics",
		"WSValue": randi_range(15,20),
		"addeffect":{
			"Name": "Fire",
			"AddTime": 5,
			"ReduceInterval": 1,
			"value": int(RoleProp.roleprop.power * 0.1),
			"AttackKind": "real",
			"CanAdd":true,
		}
	}
	super._physics_process(delta)
	if not is_use:
		mg_player.play("wait")

func ShowSkill():
	mg_player.play("hit")
	await mg_player.animation_finished
	Useover()
func Useover():
	Global.FB_CD = 1
	is_use = false
	if PlayerData.CheckHaveWX("zjhl","木"):
		self.usecd = 12
		skill_cd.start(12)
	else:
		self.usecd = 17
		skill_cd.start(17)
func CucurbitFire():
	if self.SelfDir:
		Global.addWeaponBullet_(self,Vector2(-30,0),"PurpleGlodCucurbitBullet",objattackDic["hit1"],self.SelfDir,10)
	else:
		Global.addWeaponBullet_(self,Vector2(-50,0),"PurpleGlodCucurbitBullet",objattackDic["hit1"],!self.SelfDir,10)
