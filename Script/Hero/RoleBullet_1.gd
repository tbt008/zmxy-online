extends Area2D
class_name RoleBullet1
@onready var bullet_an: AnimatedSprite2D = $BulletAN
@onready var bullet_player: AnimationPlayer = $BulletPlayer
var MonsterList
var name_: String
var Player: BaseHero
var is_set = false
var HitDic = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": "real"
}
var Shallow
var FirstHyjj: bool = true
func _physics_process(_delta: float) -> void:
	if not is_set:
		Player = get_parent().get_parent()
		if name_ == "hyjj":
			call_hyjj()
		else:
			bullet_player.play(name_)
			await bullet_player.animation_finished
		is_set = true
func call_hyjj():
	var Monster = get_monster()
	var Level = PlayerData.player_data["技能学习"]["技能9"]["等级"] + 1
	for i in range(3):
		if Monster != null:
			self.position = Monster.position
		else:
			self.queue_free()
		bullet_player.play(name_)
		Global.addSound_(self,"res://Music/Hero/44_Role1_hit12_2.mp3")
		await bullet_player.animation_finished
		await get_tree().create_timer(0.55,false).timeout
		#HitDic["power"] = HitDic["power"] * 0.65
		
	self.queue_free()

func get_monster():
	var AllMonsterList = Player.get_parent().get_parent().get_node("Monster").get_children()
	if AllMonsterList.size() <= 0:
		return null
	for i in AllMonsterList:
		if i is BaseMonster:
			if i is Monster48:
				if i.ChangeBody:
					return
			if i is Monster50:
				if i.is_stop:
					return
			if i is Monster49:
				if i.is_stop:
					return
			if abs(i.position.x - Player.position.x) >= 2000:
				return null
			if Player.PlayerDir:
				if i != null:
					if i.position.x > Player.position.x:
						return i	
			else:
				if i != null:
					if i.position.x < Player.position.x:
						return i	
	return null
#	var a_1: int = 10000
#	var Monster: BaseMonster = null
#	var a_2 = 0
#	var Monster_2: BaseMonster = null
#	var a_3 = 0
#	if FirstHyjj:
#		MonsterList = Player.get_parent().get_parent().get_node("Monster").get_children()
#		for i in MonsterList:
#			if Player.PlayerDir:
#				if i != null:
#					if i.position.x < Player.position.x:
#						MonsterList.erase(i)
#			else:
#				if i != null:
#					if i.position.x > Player.position.x:
#						MonsterList.erase(i)
#
#	while a_2 < MonsterList.size():
#		if MonsterList[a_2] == null:
#			return
#		Monster_2 = MonsterList[a_2] as BaseMonster
#		a_3 = Global.GetDisBetweem(Player,Monster_2)
#		if a_3 <= a_1:
#			if FirstHyjj:
#				if not Global.CheckDirBetweenTwoObj(Player,Monster_2):
#					FirstHyjj = false
#					self.queue_free()
#				FirstHyjj = false
#			a_1 = a_3
#			if Monster_2 is Monster48:
#				if Monster_2.ChangeBody:
#					pass
#				else:
#					Monster = Monster_2
#			elif Monster_2 is Monster49:
#				if Monster_2.is_stop:
#					pass
#				else:
#					Monster = Monster_2
#			elif Monster_2 is Monster50:
#				if Monster_2.is_stop:
#					pass
#				else:
#					Monster = Monster_2
#			else:
#				Monster = Monster_2
#		a_2 += 1
##		if Global.GetDisBetweem(Player,Monster_2) > 800:
##			HitDic["power"] = HitDic["power"] * 0.5
#	return Monster


func _on_area_entered(_area: Area2D) -> void:
	randomize()
	if name_ == "qsez" or name_ == "qsez_1":
		var num = randi_range(0,4)
#		var _MaxShallowNum = (PlayerData.player_data["技能学习"]["技能7"]["等级"] + 1)
		if Player.ShallowList.size() < GetMaxMinShallowNum()[0]:
			for i in range(GetMaxMinShallowNum()[0]):
				if Player.ShallowList.size() > GetMaxMinShallowNum()[1]:
					return
				Global.addRole1Shallow(Player.get_parent(),Player.position,Player.action.scale.x,num)
		if Player.ShallowList.size() >= GetMaxMinShallowNum()[1]:
			return
		if randi_range(0,100) < 45 + (PlayerData.player_data["技能学习"]["技能7"]["等级"] + 1) * 3:
			Global.addRole1Shallow(Player.get_parent(),Player.position + Vector2(0,-20),Player.action.scale.x,num)


func GetMaxMinShallowNum():
	var GetLevel = int(PlayerData.player_data["技能学习"]["技能7"]["等级"])
	#print(GetLevel)
	match GetLevel:
		0:
			return [1,5]
		1:
			return [1,5]
		2:
			return [1,5]
		3:
			return [2,6]
		4:
			return [2,6]
		5:
			return [2,6]
		6:
			return [2,8]
		7:
			return [2,8]
		8:
			return [2,8]
		9:
			return [2,12]
		10:
			return [2,12]
	return [0,0]
