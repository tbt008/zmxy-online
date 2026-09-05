extends BaseMagicWeapon
class_name Hybrofoline
var IsCure: bool
func _physics_process(delta: float) -> void:
	if IsCure: self.position = Player.position - Vector2(0,200)
	self.FB_Level = PlayerData.get_mostLevel("kyl") + 1
	needMp = 50 + self.FB_Level * 5
	if PlayerData.CheckHaveWX("kyl","木"):
		objattackDic["hit1"] = {
			"power": 100 + int(RoleProp.roleprop.SHp * (randf_range(0.02,0.05)) + 0.02 * self.FB_Level),
			"hurtBack":[5,-5],
			"attackKind": "physics",
		}
	else:
		objattackDic["hit1"] = {
			"power": 50 + int(RoleProp.roleprop.SHp * (randf_range(0.01,0.02)) + 0.01 * self.FB_Level),
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
	IsCure = false
	Global.FB_CD = 1
	is_use = false
	self.usecd = 15
	skill_cd.start(15)
func Cure():
	if Player != null:
		Player.cure_Hp(objattackDic["hit1"]["power"])
func ADDSuperArmor():
	IsCure = true
	Global.AddBuff(Player.buff,{
			"Name": "SuperArmor",
			"AddTime": 10,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
		})
