extends Node
@onready var http_request: HTTPRequest = $HTTPRequest

func _on_body_received(request,body):
	var time_str = body.get_string_from_utf8()
	if time_str == "":
		print("无法获取时间！！")
		return null
	var utc_time = JSON.parse_string(time_str)
	if utc_time == null:
		print("无法获取时间！！")
		return null
	var TImeUnix = int(utc_time["sysTime2"])
	if TImeUnix == null or str(TImeUnix) == "":
		print("无法获取时间！！")
		return null
	return TImeUnix
func CheckTime():
	var error = http_request.request("http://quan.suning.com/getSysTime.do")
	if error != OK:
		push_error("在HTTP请求中发生了一个错误。")

func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	return
	if _on_body_received(result,body) != null:
		var abc = str(_on_body_received(result,body)).split()
		var DataList = {
			"year": str(abc[0] + abc[1] + abc[2] + abc[3]),
			"month":str(abc[4] + abc[5]),
			"day":str(abc[6] + abc[7]),
			"hour":str(abc[8] + abc[9]),
			"minute":str(abc[10] + abc[11]),
			"second":str(abc[12] + abc[13]),
		}
		#RefreshTime(DataList)
func RefreshTime(DataList):

	var Dic = DataList
	var MyDic = MainSet.set_data["MyTime"]#最后储存的时间
	if MyDic == {}:
		return 
	if int(Dic["year"]) < int(MyDic["year"]):
		MainSet.set_data["MyTime"] = DataList
	elif int(Dic["year"]) > int(MyDic["year"]):
		MainSet.set_data["MyTime"] = DataList
	else:
		if int(Dic["month"]) < int(MyDic["month"]):
			return false
		elif int(Dic["month"]) > int(MyDic["month"]):
			MainSet.set_data["MyTime"] = DataList
		else:
			if int(Dic["day"]) < int(MyDic["day"]):
				return false
			elif int(Dic["day"]) > int(MyDic["day"]):
				MainSet.set_data["MyTime"] = DataList
			else:
				return false
