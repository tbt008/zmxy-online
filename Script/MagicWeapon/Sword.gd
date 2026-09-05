extends BaseMagicWeapon
class_name Sword
var bl = 30
func _physics_process(delta: float) -> void:
	needMp = 30 + 10 * self.FB_Level
	self.FB_Level = PlayerData.get_mostLevel("tsgj") + 1
	if PlayerData.CheckHaveWX("tsgj","木"):
		objattackDic["hit1"] = {
			"power": 100 + int(RoleProp.roleprop.power * randf_range(0.28,0.35)) + 50 * self.FB_Level,
			"hurtBack":[8,-5],
			"attackKind": "magic",
				"addeffect":{
				"Name": "Ice",
				"AddTime": 3 + 0.18 * self.FB_Level,
				"ReduceInterval": 0,
				"value": 0,
				"AttackKind": "",
				"DeBuff": true
			}
		}
	else:
		objattackDic["hit1"] = {
			"power": 100 + int(RoleProp.roleprop.power * randf_range(0.15,0.2)) + 100 * self.FB_Level,
			"hurtBack":[8,-5],
			"attackKind": "magic",
			"addeffect":{
				"Name": "Ice",
				"AddTime": 1 + 0.18 * self.FB_Level,
				"ReduceInterval": 0,
				"value": 0,
				"AttackKind": "",
				"DeBuff": true
			}
		}
	super._physics_process(delta)

func ShowSkill():
	Global.FB_CD = 3
	mg_player.play("hit")
	await mg_player.animation_finished
	Useover()
func Useover():
	is_use = false
	self.usecd = 15
	skill_cd.start(15)
func addSword():
	Global.addWeaponBullet_($Bullet,Vector2(self.position.x,0),"SwordBullet",objattackDic["hit1"],mg_action.flip_h,bl)
	Global.addWeaponBullet_($Bullet,Vector2(self.position.x - 90,0),"SwordBullet",objattackDic["hit1"],mg_action.flip_h,bl)
	Global.addWeaponBullet_($Bullet,Vector2(self.position.x + 90,0),"SwordBullet",objattackDic["hit1"],mg_action.flip_h,bl)
	await get_tree().create_timer(0.1,false).timeout
	Global.addWeaponBullet_($Bullet,Vector2(self.position.x - 180,0),"SwordBullet",objattackDic["hit1"],mg_action.flip_h,bl)
	Global.addWeaponBullet_($Bullet,Vector2(self.position.x + 180,0),"SwordBullet",objattackDic["hit1"],mg_action.flip_h,bl)
	await get_tree().create_timer(0.1,false).timeout
	Global.addWeaponBullet_($Bullet,Vector2(self.position.x - 270,0),"SwordBullet",objattackDic["hit1"],mg_action.flip_h,bl)
	Global.addWeaponBullet_($Bullet,Vector2(self.position.x + 270,0),"SwordBullet",objattackDic["hit1"],mg_action.flip_h,bl)
