extends BaseHero
class_name role2shallow
@onready var hurt_box = $base_damagebox/HurtBox/HurtBox
var Interv: int
var ShallowList: Array
var Dir: bool
var ShouldUseSkill: bool
var SkillName: String
var is_set: bool
func _ready() -> void:
	walk_speed = 360
	Role_2()
func Role_2():
	var level_1 = PlayerData.player_data["技能学习"]["技能1"]["等级"] + 1
	var level_2 = PlayerData.player_data["技能学习"]["技能2"]["等级"] + 1
	var level_3 = PlayerData.player_data["技能学习"]["技能3"]["等级"] + 1
	var level_4 = PlayerData.player_data["技能学习"]["技能4"]["等级"] + 1
	var level_5 = PlayerData.player_data["技能学习"]["技能5"]["等级"] + 1
	var level_6 = PlayerData.player_data["技能学习"]["技能6"]["等级"] + 1
	var level_7 = PlayerData.player_data["技能学习"]["技能7"]["等级"] + 1
	var level_8 = PlayerData.player_data["技能学习"]["技能8"]["等级"] + 1
	var level_9 = PlayerData.player_data["技能学习"]["技能9"]["等级"] + 1
	var level_10 = PlayerData.player_data["技能学习"]["技能10"]["等级"]
	self.objattackDic["xbz"] = {
		"power": RoleProp.roleprop.power * (0.55 + (level_2 * 0.055)),
		"hurtBack":[8,-13],
		"attackKind": "magic"
	}
	self.objattackDic["jhsj"] = {
		"power": RoleProp.roleprop.power * (0.9 + (level_9 * 0.1)),
		"hurtBack":[3,-8],
		"attackKind": "magic"
	}
func _physics_process(delta: float) -> void:
	$Action/EffectBody.visible = false
	if self.IsInSky:
		self.gravity = 0
		velocity.y = 0
	else:
		self.gravity = -980
	if not is_on_floor():
		hit_count = 0
		velocity.y -= gravity * delta
	Role_2()
	if not ShouldUseSkill:
		if Dir:
			$Action.scale.x = -1
			velocity.x = walk_speed
			role_action_player.play("run")
		else:
			$Action.scale.x = 1
			velocity.x = -walk_speed
			role_action_player.play("run")
	else:
		if not is_set:
			UseSkill()
			is_set = true
	move_and_slide()
func UseSkill():
	match SkillName:
		"xbz":
			Skill_Tjgl()
		"tjgl":
			Skill_XBZ()
		"jhsj":
			Skill_JHSJ()
func Skill_XBZ():
	velocity.x = 0
	get_action = "tjgl"
	is_using_skills = true
	super.get_hit_data("xbz")
	is_attacking = true
	role_action_player.play("tjgl")
	await role_action_player.animation_finished
	is_attacking = false
	is_using_skills = false
func Skill_Tjgl():
	velocity.x = 0
	get_action = "tjgl"
	is_using_skills = true
	is_attacking = true
	role_action_player.play("xbz")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
	
func Skill_JHSJ():
	velocity.x = 0
	get_action = "jhsj"
	is_using_skills = true
	is_attacking = true
	role_action_player.play("jhsj")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
	
func AddTJGL():
	Global.addRoleSpecialEffect_(self.Bullet,position + Vector2(0,-35),false,"tjgl")
func AddXBZ():
	var PositionList = [Vector2(-80,-15)]
	var ScaleList = [Vector2(1,1),Vector2(1.3,1.3),Vector2(1.5,1.5)]
	if !Dir:
		PositionList = [Vector2(-80,-15),Vector2(-175,-20),Vector2(-275,-25)]
	else:
		PositionList = [Vector2(80,-15),Vector2(175,-20),Vector2(275,-25)]
	for i in PositionList.size():
		var xbz = Global.addRoleBullet_(self.Bullet,PositionList[i] + position,Dir,"Role2Bullet3",objattackDic["xbz"])
		xbz.scale = ScaleList[i]
		await get_tree().create_timer(0.2,false).timeout
func AddJHSJ2():
	var Position = Vector2()
	Position = Vector2(0,-10)
	var jhsj_2 = Global.addRoleBullet_(self,Position,false,"Role2Bullet6",objattackDic["jhsj"])
	jhsj_2.show_behind_parent = true

func _on_death___timeout() -> void:
	if not ShouldUseSkill:
		self.queue_free()
func _on_spontaneous_recovery_timeout() -> void:
	return
