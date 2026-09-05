extends BaseMonster
class_name Monster109
var IsShow: bool = true
var ShowCount: int = randi_range(300,480)
var HideCount: int = randi_range(300,480)
func monster_109():
	self.is_boss = false
	self.my_mr_name = "隐匿童子"
	self.attack_in = 90
	self.level = 50
	self.SHp = 15000
	self.Hp = self.SHp
	self.def = 150
	self.mdef = 150
	self.crit = 20
	self.miss = 20
	self.lucky = 0
	self.Htarget = 20
	self.Toughness = 20
	self.ar = 25
	self.sp = 25
	self.Critreduce = 0
	self.speed = 11
	self.mysee = 500
	self.attackRange = 165
	self.attackDesire = 80
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 220
	self.fall_coin = 220
	self.objattackDic["hit1"] = {
		"power": 500,
		"hurtBack":[-4,-9],
		"attackKind": "magic",
		"HitProtect": 10,

	}
	self.fall_pro = 0.4
	self.fall_list = [
		{
			"name": "shougong",
			"value": randi_range(1,2)
		},
	]
	self.fall_stone_pro = 0.28
	self.fall_stone = [
		{
			"name": "ziyanyujin",
			"value": randi_range(1,5)
		},
	]	
func _ready() -> void:
	super._ready()
	monster_109()
	
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	
	if IsShow:
		ShowCount -= 1
		if ShowCount <= 0:
			ShowCount = randi_range(300,480)
			var tween = get_tree().create_tween()
			tween.tween_property(self,"modulate",Color(1,1,1,0.2),1)
			IsShow = false
	else:
		HideCount -= 1
		if HideCount <= 0:
			HideCount = randi_range(300,480)
			var tween = get_tree().create_tween()
			tween.tween_property(self,"modulate",Color(1,1,1,1),1)
			IsShow = true
func _on_hit_box_area_entered(area: Area2D) -> void:
	super._on_hit_box_area_entered(area)
	get_Player.reduce_Mp(int(RoleProp.roleprop.SMp * 0.05 + 30))
	if not IsShow:
		Global.AddBuff(RoleProp.SourcePlayer.buff,{
			"Name": "Scary",
			"AddTime": 3,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		})
func _on_hurt_box_area_entered(area: Area2D) -> void:
	if IsShow:
		super._on_hurt_box_area_entered(area)

