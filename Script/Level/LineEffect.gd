extends Line2D

var Type: String
var Player: BaseHero
var Monster: BaseMonster
var ReduceCount: int

func _physics_process(delta: float) -> void:
	Player = RoleProp.SourcePlayer
	if Player != null:
		points[1] = Player.position
#	if Monster != null:
#		points[points.size()-1] = Monster.position
	ReduceCount += 1
	if ReduceCount % 60 == 0:
		ReduceCount = 0
		match Type:
			"Red":
				if Player != null:
					Player.effect_reducehp(RoleProp.roleprop.SHp * 0.03,"magic")
			"Blue":
				if Player != null:
					RoleProp.roleprop.Mp -= RoleProp.roleprop.SMp * 0.03
