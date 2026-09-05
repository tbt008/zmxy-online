extends BaseLevel
#@onready var np: AnimationPlayer = $NP
#
#@onready var zzz: Node2D = $BackGround/End/Zp1/zzz
#@onready var stop_1: CollisionShape2D = $wall/stop1
#var is_cc = false
#var ZZ_1: bool = false
#var ZZ_2: bool = false
#var List_ = [0,80,150,220,280]
#var ZZcount: int = 0
#var Is_szdy: bool = false
#var Is_xzdy: bool = false
#var Is_czdy: bool = false
#var Is_zzdy: bool = false
#var Is_gzdy: bool = false
#var f_o = false
#var s_o = false
#var t_o = false
#var fo_o = false
#var fi_o = false
#func _ready() -> void:
#	np.play("ini")
#	Global.CurrentLevel = "螺旋地狱"
#	Global.addBGM_(self,"res://Music/level/2_bg4.mp3")
#	self.level_stage = 1
#	super._ready()
#	Monster_group = {
#		"stage_1": [1],
#		"stage_2": [],
#		"stage_3": [],
#		"stage_4": [],
#	}
#	Monster_position_x = {
#		"stage_1": [-50000],
#		"stage_2": [],
#		"stage_3": [],
#		"stage_4": [],
#	}
#	Monster_position_y = {
#		"stage_1": [10000],
#		"stage_2": [],
#		"stage_3": [],
#		"stage_4": [],
#	}
#func _physics_process(delta: float) -> void:
#	$exit.visible = false
#	$exit/exit2/exit.disabled = true
#	zzz.set_rotation_degrees(List_[ZZcount])
#	if Input.is_action_just_pressed("Exit"):#新关卡加这里
#		if Is_czdy:
#			Global.change_secen("res://Scene/Level/Level_czdy.tscn")
#		if Is_gzdy:
#			Global.change_secen("res://Scene/Level/Level_gzdy.tscn")
#		if Is_xzdy:
#			Global.change_secen("res://Scene/Level/Level_xzdy.tscn")
#		if Is_zzdy:
#			Global.change_secen("res://Scene/Level/Level_zzdy.tscn")
#		if Is_szdy:
#			Global.change_secen("res://Scene/Level/Level_szdy.tscn")
#	if ZZ_1 and ZZ_2:
#		match ZZcount:
#			0:
#				if not f_o:
#					np.play("rk_1up")
#					f_o = true
#					await np.animation_finished
#			1:
#				if not s_o:
#					np.play("rk_2up")
#					s_o = true
#					await np.animation_finished
#			2:
#				if not t_o:
#					np.play("rk_3up")
#					t_o = true
#					await np.animation_finished
#			3:
#				if not fo_o:
#					np.play("rk_4up")
#					fo_o = true
#					await np.animation_finished
#			4:
#				if not fi_o:
#					np.play("dh1")
#					fi_o = true
#					await np.animation_finished
#		pass
#	if not is_cc:
#		if Role_.position.x >= 600:
#			create_control.wait_time = 3
#			create_control.start()	
#			is_cc = true
#			role_information.gogo.visible = false
#		else:
#			create_control.wait_time = 3
#			create_control.start()	
#	super._physics_process(delta)	
#	my_camera.max_left = 10
#	my_camera.max_right = 925
#	if current_stage >= 1:
#		if check_can_pass() and current_stage < 1:
#			role_information.gogo.visible = true
#		else:
#			role_information.gogo.visible = false
#
#
#func _on_check_1_area_entered(area: Area2D) -> void:
#	Global.add_mr_hurt($BackGround/End/Check_1/cc,Vector2(0,0))
#	ZZ_1 = true
#	await get_tree().create_timer(1,false).timeout
#	ZZ_1 = false
#func _on_check_2_area_entered(area: Area2D) -> void:
#	Global.add_mr_hurt($BackGround/End/Check_2/cc,Vector2(0,0))
#	ZZ_2 = true
#	await get_tree().create_timer(1,false).timeout
#	ZZ_2 = false
#
#
#
#
#func _on_check_3_area_entered(area: Area2D) -> void:
#	Global.add_mr_hurt($BackGround/End/Zp1,Vector2(0,0))
#	$BackGround/End/Zp1/Check_3/cc.disabled = true
#	$Timer2.start(2.5)
#	if ZZcount < 4:
#		ZZcount += 1
#	else:
#		ZZcount = 0
#	#await get_tree().create_timer(2.5,false).timeout
#
#
#func _on_area_2d_body_entered(body: Node2D) -> void:
#	Is_szdy = true
#	Is_xzdy = false
#	Is_czdy = false
#	Is_zzdy = false
#	Is_gzdy = false
#
#
#func _on_area_2d_body_exited(body: Node2D) -> void:
#	Is_szdy = false
#
#
#
#func _on_area_2d_2_body_entered(body: Node2D) -> void:
#	Is_szdy = false
#	Is_xzdy = true
#	Is_czdy = false
#	Is_zzdy = false
#	Is_gzdy = false
#
#
#func _on_area_2d_2_body_exited(body: Node2D) -> void:
#	Is_xzdy = false
#
#
#func _on_area_2d_3_body_entered(body: Node2D) -> void:
#	Is_szdy = false
#	Is_xzdy = false
#	Is_czdy = true
#	Is_zzdy = false
#	Is_gzdy = false
#
#
#func _on_area_2d_3_body_exited(body: Node2D) -> void:
#	Is_czdy = false
#
#
#func _on_area_2d_4_body_entered(body: Node2D) -> void:
#	Is_szdy = false
#	Is_xzdy = false
#	Is_czdy = false
#	Is_zzdy = true
#	Is_gzdy = false
#
#
#func _on_area_2d_4_body_exited(body: Node2D) -> void:
#	Is_zzdy = false
#
#func Player_2():
#	np.play("dh_2")
#	pass
#
#
#func _on_timer_2_timeout() -> void:
#	$BackGround/End/Zp1/Check_3/cc.disabled = false
#
#
#func _on_area_2d_5_body_entered(body: Node2D) -> void:
#	Is_szdy = false
#	Is_xzdy = false
#	Is_czdy = false
#	Is_zzdy = false
#	Is_gzdy = true
#
#
#
#func _on_area_2d_5_body_exited(body: Node2D) -> void:
#	Is_gzdy = false
