extends BaseMagicWeapon
class_name PurpleGoldBell

func _physics_process(delta: float) -> void:

	self.FB_Level = PlayerData.get_mostLevel("zjfyd") + 1
	needMp = 50 + self.FB_Level * 15
	if PlayerData.CheckHaveWX("zjfyd","木"):
		objattackDic["hit1"] = {
			"power": 5 + (FB_Level - 1) * 0.5,
			"hurtBack":[5,-5],
			"attackKind": "physics",
		}
	else:
		objattackDic["hit1"] = {
			"power": 2.5 + (FB_Level - 1)* 0.25,
			"hurtBack":[5,-5],
			"attackKind": "physics",
		}
	super._physics_process(delta)
	if not is_use:
		mg_player.play("wait")

func ShowSkill():
	#IsCure = true
	mg_player.play("hit")
	await mg_player.animation_finished
	Useover()
func Useover():

	Global.FB_CD = 1
	is_use = false
	self.usecd = 30
	skill_cd.start(30)

func ADDSuperArmor():

	Global.AddBuff(Player.buff,{
			"Name": "Indestructible",
			"AddTime": objattackDic["hit1"]["power"],
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanRemove": false,
		})
