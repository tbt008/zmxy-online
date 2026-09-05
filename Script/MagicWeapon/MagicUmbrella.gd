extends BaseMagicWeapon
class_name MagicUmbrella
var StabRotationList = [-5,-5,-5,-5,-5,-5,-5,-5,-5,-5,0,5,5,5,5,5,5,5,5,5,5]
var PositionList = [150,135,120,105,90,75,60,45,30,15,0,-15,-30,-45,-60,-75,-90,-105,-120,-135,-150]
func _physics_process(delta: float) -> void:
	self.FB_Level = PlayerData.get_mostLevel("lsys") + 1
	needMp = 30 + self.FB_Level * 10
	if PlayerData.CheckHaveWX("lsys","木"):
		objattackDic["hit1"] = {
			"power": 10 + 10 * self.FB_Level,
			"hurtBack":[5,-5],
			"attackKind": "real",
			"addeffect":{
				"Name": "poision",
				"AddTime": 5,
				"ReduceInterval": 1,
				"value": int(RoleProp.roleprop.power * (0.04  + 0.04 * self.FB_Level)),
				"AttackKind": "real",
				"CanAdd":true,
				"DeBuff": true
			}
		}
	else:
		objattackDic["hit1"] = {
			"power": 10 + 10 * self.FB_Level,
			"hurtBack":[5,-5],
			"attackKind": "real",
			"addeffect":{
				"Name": "poision",
				"AddTime": 5,
				"ReduceInterval": 1,
				"value": int(RoleProp.roleprop.power * (0.04  + 0.01 * self.FB_Level)),
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
	is_use = false
	skill_cd.start(3)
func addBullet():
	for i in range(21):
		var stab = Global.addWeaponBullet_($Bullet,Vector2(self.position.x + PositionList[i],self.position.y),"MagicUmbrellaBullet",objattackDic["hit1"],mg_action.flip_h,100)
		stab.rotation_degrees = StabRotationList[i]
		stab.scale = Vector2(2,2)
	
func TweenToTop():
	var Po = self.position
	var tween = get_tree().create_tween()
	tween.tween_property(self,"position",Player.position + Vector2(0,-400),0.8)
	pass
	
	
	
	
	
	
	
