extends MarginContainer
var BuffName: String
@onready var buff_infor: Label = $MarginContainer/BuffInfor
var DataList = {}
var TotalTimes: int = 1
var LastHurt: float
var MMTime:int = 99999
var Parent
var OtherText: String
func _physics_process(delta: float) -> void:
	if DataList.has("CanRemove"):
		if DataList["CanRemove"]:
			OtherText = "(低级负面)"
		else:
			OtherText = "(高级负面)"
	else:
		OtherText = "(低级负面)"
	if Parent == null:
		return
	BuffName = Parent.DataList["Name"]
	var LastTime = Parent.BuffTime
	var Value = Parent.DataList["value"]
	var ReduceInterval = Parent.DataList["ReduceInterval"]
	var ATKKind = Parent.DataList["AttackKind"]
	var Get_DamageType: String
	match ATKKind:
		"physics":
			Get_DamageType = "物理"
		"magic":
			Get_DamageType = "魔法"
		"real":
			Get_DamageType = "真实"
	match BuffName:
		"Ice":
			if LastTime < MMTime:
				buff_infor.text = "该单位处于冰冻状态，" + str(snapped(LastTime,0.1)) + "秒内无法行动。" + OtherText
			else:
				buff_infor.text = "该单位处于被永久冰冻无法行动。" + OtherText
		"Bleed":
			if LastTime < MMTime:
				buff_infor.text = "该单位处于持续" + str(snapped(LastTime,0.1)) + "秒的流血状态，每过" + str(ReduceInterval) + '秒' + '受到' + str(LastHurt) + str(Get_DamageType) + "伤害。" + OtherText
			else:
				buff_infor.text = "该单位被添加永久流血，每过" + str(ReduceInterval) + '秒' + '受到' + str(LastHurt) + str(Get_DamageType) + "伤害。" + OtherText
		"poision":
			if LastTime < MMTime:
				buff_infor.text = "该单位处于持续" + str(snapped(LastTime,0.1)) + "秒的中毒状态，每过" + str(ReduceInterval) + '秒' + '受到' + str(LastHurt) + str(Get_DamageType) + "伤害。" + OtherText
			else:
				buff_infor.text = "该单位被添加永久中毒，每过" + str(ReduceInterval) + '秒' + '受到' + str(LastHurt) + str(Get_DamageType) + "伤害。" + OtherText
		"Fire":
			if LastTime < MMTime:
				buff_infor.text = "该单位处于持续" + str(snapped(LastTime,0.1)) + "秒的灼烧状态，每过" + str(ReduceInterval) + '秒' + '受到' + str(LastHurt) + str(Get_DamageType) + "伤害。" + OtherText
			else:
				buff_infor.text = "该单位被添加永久灼烧，每过" + str(ReduceInterval) + '秒' + '受到' + str(LastHurt) + str(Get_DamageType) + "伤害。" + OtherText
		"stun":
			if LastTime < MMTime:
				buff_infor.text = "该单位处于眩晕状态，" + str(snapped(LastTime,0.1)) + "秒内无法行动。" + OtherText
			else:
				buff_infor.text = "该单位被永久眩晕无法行动。" + OtherText
		"EyeFix":
			if LastTime < MMTime:
				buff_infor.text = "该单位处于眩目状态，" + str(snapped(LastTime,0.1)) + "秒内无法行动。" + OtherText
			else:
				buff_infor.text = "该单位被永久眩目无法行动。" + OtherText
		"DeadLink":
			if LastTime < MMTime:
				buff_infor.text = "该单位被施加" + str(snapped(LastTime,0.1)) + "秒的死亡连接，在此期间攻击施加者，自身也会受到同等伤害。" + OtherText
			else:
				buff_infor.text = "该单位永久施加死亡连接，在此期间攻击施加者，自身也会受到同等伤害。" + OtherText
		"nlls":
			if LastTime < MMTime:
				buff_infor.text = str(snapped(LastTime,0.1)) + "秒内，玩家移动的越快，法力和生命流失的越快。" + OtherText
			else:
				buff_infor.text = "玩家移动的越快，法力和生命流失的越快。" + OtherText
		"speed_down":
			if LastTime < MMTime:
				buff_infor.text = str(snapped(LastTime,0.1)) + "秒内，移动速度降低" + str(LastHurt * 100) + '%' + OtherText
			else:
				buff_infor.text = "移动速度永久降低" + str(snapped(LastHurt,0.1) * 100) + '%' + OtherText
		"Boundground":
			if LastTime < MMTime:
				buff_infor.text = "该单位处于缚地状态，" + str(snapped(LastTime,0.1)) + "秒内无法跳跃。" + OtherText
			else:
				buff_infor.text = "该单位被永久缚地无法跳跃。" + OtherText
		"silent":
			if LastTime < MMTime:
				buff_infor.text = "该单位处于沉默状态，" + str(snapped(LastTime,0.1)) + "秒内无法使用技能。" + OtherText
			else:
				buff_infor.text = "该单位被永久沉默无法使用技能。" + OtherText
		"Immobilize":
			if LastTime < MMTime:
				buff_infor.text = "该单位处于定身状态，" + str(snapped(LastTime,0.1)) + "秒内无法行动。" + OtherText
			else:
				buff_infor.text = "该单位被永久定身无法行动。" + OtherText
		"BloodFix":
			if LastTime < MMTime:
				buff_infor.text = "该单位处于封疗状态，" + str(snapped(LastTime,0.1)) + "秒内无法回复生命值。" + OtherText
			else:
				buff_infor.text = "该单位被永久封疗无法回复生命值。" + OtherText
		"Scary":
			if LastTime < MMTime:
				buff_infor.text = "该单位被恐惧，" + str(snapped(LastTime,0.1)) + "秒无法自由行动。" + OtherText
			else:
				buff_infor.text = "该单位被永久恐惧，无法自由行动。" + OtherText
		"DefeReduce":
			if LastTime < MMTime:
				buff_infor.text = "该单位处于破甲状态，" + str(snapped(LastTime,0.1)) + "秒内双抗被无视" + str(snapped(LastHurt,0.01) * 100) + "% 。" + OtherText
			else:
				buff_infor.text = "该单位被永久破甲，双抗被无视" + str(snapped(LastHurt,0.01) * 100) + "% 。" + OtherText
		"SuperArmor":
			if LastTime < MMTime:
				buff_infor.text = "该单位处于霸体状态，" + str(snapped(LastTime,0.1)) + "秒内免疫击退。"
			else:
				buff_infor.text = "该单位永久处于霸体状态。"
		"Indestructible":
			if LastTime < MMTime:
				buff_infor.text = "该单位处于不灭灵体状态，" + str(snapped(LastTime,0.1)) + "秒内免疫高于自身当前生命的伤害。"
			else:
				buff_infor.text = "该单位永久免疫高于自身当前生命的伤害。"
		"DoubleFallPro":
			buff_infor.text = str(snapped(LastTime,0.1)) + "秒内享受双倍掉率。"
		"Voodoo":
			if LastTime < MMTime:
				buff_infor.text = "该单位处于持续" + str(snapped(LastTime,0.1)) + "秒的巫毒状态，每过" + str(ReduceInterval) + '秒' + '受到' + str(LastHurt) + str(Get_DamageType) + "伤害。" + OtherText
			else:
				buff_infor.text = "该单位被添加永久巫毒，每过" + str(ReduceInterval) + '秒' + '受到' + str(LastHurt) + str(Get_DamageType) + "伤害。" + OtherText
		"slzbuff":
			var Levelslz = PlayerData.player_data["森罗阵"]["Level"]
			if LastTime < MMTime:
				buff_infor.text = "该单位获得森罗阵的加护，" + str(snapped(LastTime,0.1)) + "秒内，受伤降低" + str(Levelslz * 0.02 * 100) + '%'
			else:
				buff_infor.text = "该单位获得森罗阵的加护，受伤永久降低" + str(snapped(Levelslz * 0.02,0.01) * 100) + '%'	
		"lpzbuff":
			var Levelslz = PlayerData.player_data["落魄阵"]["Level"]
			if LastTime < MMTime:
				buff_infor.text = "该单位被施加虚弱，" + str(snapped(LastTime,0.1)) + "秒内，伤害降低" + str(LastHurt * 100) + '%'
			else:
				buff_infor.text = "该单位被施加虚弱，伤害永久降低" + str(snapped(LastHurt,0.01) * 100) + '%'
		"tszbuff":
			var Levelslz = PlayerData.player_data["落魄阵"]["Level"]
			if LastTime < MMTime:
				buff_infor.text = "该单位获得腾蛇加护，" + str(snapped(LastTime,0.1)) + "秒内，伤害增加" + str(Levelslz * 0.015 * 100) + '%'
			else:
				buff_infor.text = "该单位获得腾蛇加护，伤害永久增加" + str(snapped(Levelslz * 0.015,0.001) * 100) + '%'
		"PoisionBody":
			buff_infor.text = "该单位获得万毒加护，受伤减少，免疫部分击退，并对攻击者施加”巫毒“。"
		"lljybuff":
			buff_infor.text = "该单位被点穴，" + str(snapped(LastTime,0.1)) + "秒内，无法行动"	
		"NoDeBuff":
			if LastTime < MMTime:
				buff_infor.text = "该单位" + str(snapped(LastTime,0.1)) + "秒内，免疫所有负面状态。"
			else:
				buff_infor.text = "该单位永久免疫所有负面状态。"
		"flls":
			if LastTime < MMTime:
				buff_infor.text = "该单位处于持续" + str(snapped(LastTime,0.1)) + "秒的法力流失状态，每过" + str(ReduceInterval) + '秒' + '扣除' + str(LastHurt) + "魔法" + OtherText
			else:
				buff_infor.text = "该单位被添加永久法力流失，每过" + str(ReduceInterval) + '秒' + '扣除' + str(LastHurt) + "魔法。" + OtherText
	await get_tree().create_timer(3,false).timeout
	queue_free()
