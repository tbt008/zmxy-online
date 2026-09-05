extends BaseLevel
class_name Level19
@onready var stop_1: CollisionShape2D = $wall/stop1
@onready var stop_2: CollisionShape2D = $wall/stop2
@onready var stop_3: CollisionShape2D = $wall/stop3
var _2 = preload("res://Scene/Monster/Monster_46.tscn")
var _3 = preload("res://Scene/Monster/Monster_45.tscn")
var _4 = preload("res://Scene/Monster/Monster_44.tscn")
var _5 = preload("res://Scene/Monster/Monster_49.tscn")
var _6 = preload("res://Scene/Monster/Monster_50.tscn")
@onready var check_hero: Area2D = $CheckHero
@onready var ck_hero: CollisionShape2D = $CheckHero/ck_hero
@onready var bsz: Node2D = $BSZ
@onready var bsz_2: Node2D = $BSZ2
@onready var bsz_3: Node2D = $BSZ3
@onready var bsz_4: Node2D = $BSZ4
@onready var bsz_5: Node2D = $BSZ5
var entercount : int = 0
var Canthro = false
var CanPass  = false
var mm: Monster50
var mm2: Monster49
var randi_num = randi_range(0,2)
var can_notpass = false
func _ready() -> void:
	Global.CurrentLevel = "望乡台"
	var ppx = [1685,2160,2640]
	check_hero.position = Vector2(ppx[randi_num],35)
	Global.addBGM_(self,"res://Music/level/9_bg3.mp3")
	self.level_stage = 19
	super._ready()
	Monster_group = {
		"stage_1": [51,53,51,53,51,53,51,53,54,54,54,53,53,53,51,51,51,51,51,51],
		"stage_2": [51,53,54,51,52,54,51,53,52,53,52,54,51,54,51,54,53,52,51,51,52,53,53,51,52,52,52,52],
		"stage_3": [51,53,54,51,52,54,51,53,52,53,52,54,51,54,51,54,53,52,51,51,52,53,53,51,52,52,52,52,54,54,54,54,54,54,54,54],
		"stage_4": [49],
	}
	Monster_position_x = {
		"stage_1": [250,1000,250,1000,250,1000,250,1000,250,1000,250,1000,250,1000,250,1000,250,1000,250,1000],
		"stage_2": [1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,
		1200,2150,1200,2150,1200,2150,1200,2150],
		"stage_3": [2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,
		2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,],
		"stage_4": [4550],
	}
	Monster_position_y = {
		"stage_1": [255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255],
		"stage_2": [255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
		255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255],
		"stage_3": [255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
		255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255],
		"stage_4": [250],
	}
func _physics_process(delta: float) -> void:
	if mm != null:
		if mm.death():
			Canthro = true
	if bsz != null and bsz_2 != null and bsz_3 != null and bsz_4 != null and bsz_5 != null:
		if current_stage == 4:
			CanPass = true
			if randi_num == 0:
				bsz_4.free()
			elif randi_num == 1:
				bsz_5.free()
			elif randi_num == 2:
				bsz.free()
	if CanPass:
		if can_notpass:
			ck_hero.disabled = true
		else:
			ck_hero.disabled = false
	super._physics_process(delta)	
	if current_stage >= 1:
		if check_can_pass() and current_stage < 4:
			role_information.gogo.visible = true
		else:
			role_information.gogo.visible = false
func set_through():
	if current_stage == 1:
		if check_can_pass():
			stop_1.disabled = true
	elif current_stage == 2:	
		if check_can_pass():
			stop_2.disabled = true	
	elif current_stage == 3:
		if check_can_pass():
			stop_3.disabled = true	


func _on_area_2d_body_entered(body: Node2D) -> void:
	entercount += 1
	if entercount >= 5:
		if body is BaseHero:
			if CanPass:
				if mm == null:
					mm = Global.Create_Monster(50,monster,check_hero.position) as Monster50
					ck_hero.disabled = true
					can_exit = false
					exit.visible = false
					exit_2.disabled = true
				for i in monster.get_children():
					if i is Monster49:
						mm2 = i
						if mm2 != null:
							mm2.Hp = -100
						entercount = 0
						
						return
