extends BaseMagicWeapon
class_name Cucurbit

func _physics_process(delta: float) -> void:
	needMp = 50
	self.FB_Level = PlayerData.get_mostLevel("dshl") + 1
	if PlayerData.CheckHaveWX("dshl","木"):
		objattackDic["hit1"] = {
			"power": 100 + int(RoleProp.roleprop.power * randf_range(0.15,0.18)) + 70 * self.FB_Level,
			"hurtBack":[5,-5],
			"attackKind": "physics",
			"addeffect":{
				"Name": "Fire",
				"AddTime": 5,
				"ReduceInterval": 1,
				"value": int(RoleProp.roleprop.power * 0.1),
				"AttackKind": "real",
				"CanAdd":true,
				"DeBuff": true
			}
		}
	else:
		objattackDic["hit1"] = {
			"power": 50 + int(RoleProp.roleprop.power * randf_range(0.09,0.12)) + 40 * self.FB_Level,
			"hurtBack":[5,-5],
			"attackKind": "physics",
			"addeffect":{
				"Name": "Fire",
				"AddTime": 5,
				"ReduceInterval": 1,
				"value": int(RoleProp.roleprop.power * 0.1),
				"AttackKind": "real",
				"CanAdd":true,
				"DeBuff": true
			}
		}
	super._physics_process(delta)
	if not is_use:
		mg_player.play("wait")

func ShowSkill():
	#Global.FB_CD = 1
	mg_player.play("hit")
	await mg_player.animation_finished
	Useover()
func Useover():
	Global.FB_CD = 1
	self.usecd = 6
	is_use = false
	skill_cd.start(6)
func addFire():
	Global.addWeaponBullet_($Bullet,Vector2(self.position.x,250),"CucurFire_2",objattackDic["hit1"],mg_action.flip_h,100)
	Global.addWeaponBullet_($Bullet,Vector2(self.position.x - 230,250),"CucurFire_2",objattackDic["hit1"],mg_action.flip_h,100)
	Global.addWeaponBullet_($Bullet,Vector2(self.position.x + 230,250),"CucurFire_2",objattackDic["hit1"],mg_action.flip_h,100)

		
