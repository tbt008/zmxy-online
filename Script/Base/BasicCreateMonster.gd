extends Node2D
var BaseLevel_: BaseLevel
@onready var create_monster: Timer = $CreateMonster

@export var MonsterIdList: Array[int]
@export var MonsterPosition: Array[Vector2]
@export var Id: int = 1
@export var Stage: int = 1
var CreateInter: float = 1.2
var CanCreate: bool = false
var CanChcek: bool
func _physics_process(delta: float) -> void:
	if BaseLevel_.monster.get_children().size() > 4 and BaseLevel_.monster.get_children().size() < 6:
		CanChcek = true
	elif BaseLevel_.monster.get_children().size() < 4:
		CanCreate = true
	if CanChcek:
		Check()
		CanChcek = false
	if CanCreate:
		create_monster.start(CreateInter)
		CanCreate = false
func Check():
	match Stage:
		1:
			for i in BaseLevel_.create_1.get_children():
				if i.Id > Id:
					return
		2:
			for i in BaseLevel_.create_1.get_children():
				if i.Id > Id:
					return
		3:
			for i in BaseLevel_.create_1.get_children():
				if i.Id > Id:
					return
		4:
			for i in BaseLevel_.create_1.get_children():
				if i.Id > Id:
					return
	CanCreate = true
func CreateMonster(Id: int,Po: Vector2):
	Global.Create_Monster(Id,BaseLevel_.monster,Po)


func _on_create_monster_timeout() -> void:
	CreateMonster(MonsterIdList[0],MonsterPosition[0])
	MonsterIdList.remove_at(0)
	MonsterPosition.remove_at(0)
