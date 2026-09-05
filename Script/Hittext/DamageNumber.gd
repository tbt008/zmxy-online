extends TextureRect

var need_number: int
var Type: String
var is_crit: bool
var is_set = false
var target:BaseObject
#func _ready() -> void:
#	changepic(Type, need_number,is_crit)
	
func _physics_process(_delta: float) -> void:
	changepic(Type, need_number,is_crit)
	set_physics_process(false)
	
func changepic(Type_: String, num: int,_crit: bool):
	if num == null:
		self.set_texture(null)
		return
	if Type_ == "cure":
		self.set_texture(load("res://Art/AllNumber/" + str(Type_) + '/' + str(Type_) + '_' + str(int(num)) +".png"))
		return
	if Type_ == "CureMp":
		self.set_texture(load("res://Art/AllNumber/" + str(Type_) + '/' + str(Type_) + '_' + str(int(num)) +".png"))
		return
	if Type_ == "ReduceMp":
		self.set_texture(load("res://Art/AllNumber/" + str(Type_) + '/' + str(Type_) + '_' + str(int(num)) +".png"))
		return
	if target != null:
		if target is BaseHero:
			if Type_ != "real":
				self.set_texture(load("res://Art/AllNumber/monster/" + str(Type_) + '/' + str(Type_) + '_' + str(int(num)) +".png"))
			else:
				self.set_texture(load("res://Art/AllNumber/" + str(Type_) + '/' + str(Type_) + '_' + str(int(num)) +".png"))

		elif target is BaseMonster:
			if is_crit:
				var tt = Type_ + "crit"
				#print(tt)
				self.set_texture(load("res://Art/AllNumber/" + str(tt) + '/' + str(Type) + '_' + str(int(num)) +".png"))
			else:
				if Type == "physics":
					#res://Art/AllNumber/magic/physics_0.png
					self.set_texture(load("res://Art/AllNumber/magic/" + str(Type_) + '_' + str(int(num)) +".png"))
					#self.set_texture(load("res://Art/AllNumber/" + str(Type) + '/' + str(Type) + '_' + str(int(num)) +".png"))
				else:
					self.set_texture(load("res://Art/AllNumber/" + str(Type_) + '/' + str(Type_) + '_' + str(int(num)) +".png"))
#				self.set_texture(load("res://Art/AllNumber/" + str(Type) + '/' + str(Type) + '_' + str(int(num)) +".png"))

