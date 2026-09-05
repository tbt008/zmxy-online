extends BaseMagicWeapon
class_name CloudSword
var MonsterList: Array = []
var Target: BaseMonster
var IsNoTarget: bool

func _physics_process(delta: float) -> void:
	
	MonsterList = Player.get_parent().get_parent().monster.get_children()
	self.FB_Level = PlayerData.get_mostLevel("qyj") + 1
	needMp = 80 + self.FB_Level * 5
	var BasicHit
	BasicHit = self.FB_Level * 0.07
	if PlayerData.CheckHaveWX("qyj","木"):
		BasicHit = self.FB_Level * 0.1
		objattackDic["hit1"] = {
			"power": 100 + int(RoleProp.roleprop.power * BasicHit),
			"hurtBack":[0,-1],
			"attackKind": "magic",
			"addeffect":{
				"Name": "DefeReduce",
				"AddTime": 5,
				"ReduceInterval": 0,
				"value": 0.09 + (0.01 * FB_Level),
				"AttackKind": "",
				"DeBuff": true
			}
		}
	else:
		BasicHit = self.FB_Level * 0.05
		objattackDic["hit1"] = {
			"power": 50 + int(RoleProp.roleprop.power * BasicHit),
			"hurtBack":[0,-1],
			"attackKind": "magic",
			"addeffect":{
				"Name": "DefeReduce",
				"AddTime": 5,
				"ReduceInterval": 0,
				"value": 0.04 + (0.01 * FB_Level),
				"AttackKind": "",
				"DeBuff": true
			}
		}
	super._physics_process(delta)
	if not is_use:
		mg_player.play("wait")

func ShowSkill():
	Target = GetMonster()
	if Target == null:
		UseOver2()
		return
	mg_player.play("hit")
	await mg_player.animation_finished
	Useover()
func Useover():
	self.usecd = 15
	is_use = false
	Global.FB_CD = 1
	skill_cd.start(self.usecd)
	
func UseOver2():
	self.usecd = 0
	is_use = false
	Global.FB_CD = 1
	RoleProp.roleprop.Mp += needMp
	skill_cd.start(0.001)
func GetMonster():
	var MaxHp = 0
	var TT: BaseMonster
	if MonsterList.size() <= 0:
		return null
	for i in MonsterList:
		if i != null:
			if not i.NoTarget:
				if i is BaseMonster:
					if not i is Monster138:
						if i.Hp >= MaxHp:
							TT = i
							MaxHp = i.Hp
	return TT	
func AddSword():
	if Target != null:
		Global.addWeaponBullet_($Bullet,Target.position + Vector2(0,30),"CloudSwordBullet",objattackDic["hit1"],mg_action.flip_h,100)
