extends Node
var BuffList = {"Name":"sbbl","LastTime":0,"Data":{},"Type":"Other"}

func GetAllOtherBuffAndAddToPlayer():
	if PlayerData.player_data["特殊Buff"].size() != 0:
		for i in PlayerData.player_data["特殊Buff"]:
			var Dic  = {"Name":i["Name"],"AddTime":i["LastTime"],"ReduceInterval": 0,"value": 0,"CanAdd":false,"AttackKind": "",}
			Global.AddBuff(RoleProp.SourcePlayer.buff,Dic)
	pass
