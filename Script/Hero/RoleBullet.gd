extends Node2D
class_name RoleBullet
@onready var bullet_player: AnimatedSprite2D = $Middle/BulletPlayer
@onready var bullet_players: AnimationPlayer = $Middle/BulletPlayers
@onready var middle: Node2D = $Middle
@onready var hit_box: Area2D = $Middle/HitBox
@onready var collion: CollisionShape2D = $Middle/HitBox/Collion
@onready var queue_timer: Timer = $QueueTimer
var IsCanCure: bool
var CureCount: int
var name_: String = "Role2Bullet5"
var Player: BaseHero
var Direction:bool = true
var is_set = false
var jhbhcount: int
var CheckCount: int = 0
var HitDic = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": "real"
}
var BCRotationList = [30,60,90,120,150,180,210,240,270,300,330,360]
var num: int = 0
func _physics_process(_delta: float) -> void:
	
	TQZCure()	
	CheckCount += 1
	if not is_set:
		if Global.get_parent_(self,2) is BaseHero:
			Player = Global.get_parent_(self,2)
		elif Global.get_parent_(self,1) is BaseHero:
			Player = Global.get_parent_(self,1)
		bullet_players.play(name_)
		if Direction:
			middle.scale.x = -1
		else:
			middle.scale.x = 1
		is_set = true
	if name_ == "Role2Bullet5":
		if Direction:
			self.position.x += 2
		else:
			self.position.x -= 2
	
		CallJHBH1()
func CallJHBH1():
	BCRotationList.reverse()
	if jhbhcount % 5 == 0:
		if num > 11:
			num = 0
		var bc = Global.addNewBullet(Player.Bullet,position + bullet_player.position,Player.PlayerDir,"Role2Bullet7",HitDic)
		bc.rotation_degrees = BCRotationList[num]
		bc.scale = Vector2(1.5,1.5)
		num += 1
		
	jhbhcount += 1
func _on_hit_box_area_entered(area: Area2D) -> void:
	var Target = area.get_parent().get_parent()
	if Target is BaseMonster:
		match name_:
			"Role5Bullet4":
				Global.AddBuff(Target.buff,{
				"Name": "speed_down",
				"AddTime": 1,
				"ReduceInterval": 0,
				"value": 0.5,
				"CanAdd":false,
				"AttackKind": "",
				"DeBuff": true
			})
			"Role5Bullet2":
				if Target != null:
					Target.llrdCount = 300
					if not Target.CannotAttract:
						TweenToLLRDCenter(Target)
			"TtzsszBullet":
				if HitDic.has("addeffect"):
					Global.AddBuff(Target.buff,HitDic["addeffect"])
			"NMWBullet2":
				if HitDic.has("addeffect"):
					Global.AddBuff(Target.buff,HitDic["addeffect"])
			"Role4Bullet6":
				if Global.CheckWD(Target) < 7:
					if HitDic.has("addeffect"):
						Global.AddBuff(Target.buff,HitDic["addeffect"])
				Global.AddBuff(Target.buff,{
				"Name": "speed_down",
				"AddTime": 0.6,
				"ReduceInterval": 0,
				"value": 0.5,
				"CanAdd":false,
				"AttackKind": "",
				"DeBuff": true
			})
			"ZLWBullet":
				Global.AddBuff(Target.buff,HitDic["addeffect"])
			"LPZBullet":
				var Levellpz = PlayerData.player_data["落魄阵"]["Level"]
				var Value = 0.02 * Levellpz
				var Rnd = 10 * Levellpz
				print(Rnd)
				randomize()
				if randi_range(0,100) <= Rnd:
					Global.AddBuff(Target.buff,{
					"Name": "lpzbuff",
					"AddTime":10,
					"ReduceInterval": 0,
					"value": Value,
					"CanAdd":false,
					"AttackKind": "",
					"DeBuff": true
				})
		if PlayerData.player_data["技能学习"]["技能10"]["等级"] <= 0:
			return
		if name_ == "Role2Bullet3":
			if randi_range(0,100) > 3 + PlayerData.player_data["技能学习"]["技能10"]["等级"] * 0.5:
				return
		elif name_ == "Role2Bullet4":
			if randi_range(0,100) > 2 + PlayerData.player_data["技能学习"]["技能10"]["等级"]:
				return
		else:
			return
		if HitDic.has("addeffect"):
			Global.AddBuff(Target.buff,HitDic["addeffect"])
		
func ADDMusic(num):
	match num:
		1:#普攻
			Global.addSound_(self,"res://Music/Hero/58_Role2_hit1.mp3")
		2:#冰龙波
			Global.addSound_(self,"res://Music/Hero/59_Role2_hit2.mp3")
		3:#天降甘露
			Global.addSound_(self,"res://Music/Hero/57_Role2_hit8.mp3")
		4:#玄冰阵
			Global.addSound_(self,"res://Music/Hero/60_Role2_hit3.mp3")			
		5:#水幻影
			Global.addSound_(self,"res://Music/Hero/51_Role2_hit10.mp3")	
		6:#水魔爆
			Global.addSound_(self,"res://Music/Hero/11_Role2_hit4.mp3")	
		7:#圣光球
			Global.addSound_(self,"res://Music/Hero/effect8.mp3")	
		8:#雷阵
			Global.addSound_(self,"res://Music/Hero/Role5/attack_repeat.mp3")	
func FaceToBoss():
	var MrList = []
	var desired_angle
	if Player is BaseHero:
		MrList = Player.get_parent().get_parent().monster.get_children()
	if MrList.size() > 0:
		var Target = MrList[0]
		if Target != null:
			if Target is BaseMonster:
				if not Target is Monster48:
					desired_angle = position.angle_to_point(Target.position)

		var tween = get_tree().create_tween()
		tween.tween_property(self,"rotation",desired_angle,0.5)

func TweenToLLRDCenter(body: BaseMonster):
	var tween = get_tree().create_tween()
	tween.tween_property(body,"position",Vector2(position.x,position.y - 30),0.15)


func _on_queue_timer_timeout() -> void:
	queue_free()


func _on_hit_box_body_entered(body: Node2D) -> void:
	match name_:
		"Role4Bullet3":
			if CheckCount > 30:
				if body is BaseHero:
					queue_free()
		"TQZBullet":
			if body is BaseHero:
				IsCanCure = true

				
func _on_hit_box_body_exited(body: Node2D) -> void:
	match name_:
		"TQZBullet":
			if body is BaseHero:
				IsCanCure = false

func AddslzBuff():
	Global.AddBuff(RoleProp.SourcePlayer.buff,{
				"Name": "slzbuff",
				"AddTime": 10,
				"ReduceInterval": 0,
				"value": 0,
				"CanAdd":false,
				"CanRemove":false,
				"AttackKind": "",
			})
func AddtszBuff():
	Global.AddBuff(RoleProp.SourcePlayer.buff,{
				"Name": "tszbuff",
				"AddTime": 10,
				"ReduceInterval": 0,
				"value": 0,
				"CanAdd":false,
				"CanRemove":false,
				"AttackKind": "",
			})
func ADDTQZBuff():
	if not IsCanCure:
		return
	Global.RemoveAllBuff()
	Global.add_SpecialEffect(RoleProp.SourcePlayer,Vector2(0,0),"tqzbuff",Vector2(1,1),false,1)
	Global.AddBuff(RoleProp.SourcePlayer.buff,{
			"Name": "SuperArmor",
			"AddTime": 1,
			"ReduceInterval": 0,
			"value": 0,
			"CanAdd":false,
			"CanRemove":false,
			"AttackKind": "",
		})
func TQZCure():
	if name_ == "TQZBullet":
		if IsCanCure:
			if CureCount % 60 == 0 and CureCount != 0:
				var Levellpz = PlayerData.player_data["太清阵"]["Level"]
				var CureValue = int(Levellpz * 0.05 * RoleProp.roleprop.power)
				RoleProp.SourcePlayer.cure_Hp(int(CureValue))
			CureCount += 1
		else:
			CureCount = 0

func TLLZQueue():
	if queue_timer.is_stopped():
		queue_timer.start(10)
