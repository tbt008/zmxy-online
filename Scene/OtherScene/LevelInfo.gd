extends Control
@onready var Title: Label = $ColorRect/TextureRect/Title
@onready var my_pj: Label = $ColorRect/TextureRect/pj/MyPj
@onready var fall_list: HBoxContainer = $ColorRect/TextureRect/ScrollContainer/FallList
@onready var monster_list: HBoxContainer = $ColorRect/TextureRect/ScrollContainer2/MonsterList
@onready var mybg: TextureRect = $ColorRect/TextureRect/Mybg
@onready var fall: Label = $ColorRect/TextureRect/Fall
@onready var pj: Label = $ColorRect/TextureRect/pj
@onready var speedtext: Label = $ColorRect/TextureRect/Speed/speedtext
#@onready var text: Label = $ColorRect/TextureRect/nandu/changenandu/text
@onready var color_rect_2: ColorRect = $ColorRect2
@onready var level_down: Label = $ColorRect/TextureRect/Level/LevelDown


var FontColorList = {
	"font_colorList": ["4c4c4c","818181","00ff00","0095ff","ba2cff","ff9d2e"],
}
var PjList = {
	"PjList": ["暂无","丙","乙","甲","超凡","至尊"],
}
var LevelInfo = {
	"花果山":{
		"LevelName": "花果山",
		"MonsterList":[{"Name":"xh","IsBoss":false},{"Name":"yh","IsBoss":false},{"Name":"dxx","IsBoss":true}],
		"LevelFall": [ "ptxzg","ptxzf","ptsmz","ptjs","ptdp","ptcs","ptyyc","ptcp","pttq","ptcf"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":100},
			"2":{"角色":"唐僧","战斗力":100},
			"3":{"角色":"八戒","战斗力":100},
			"4":{"角色":"沙僧","战斗力":100},
		},
		"SelfBg":"hgs",
		"Level": 5
	},
	"水帘洞":{
		"LevelName": "水帘洞",
		"MonsterList":[{"Name":"xh","IsBoss":false},{"Name":"yh","IsBoss":false},{"Name":"dxx","IsBoss":false},{"Name":"mhw","IsBoss":true}],
		"LevelFall": [ "ptxzg","ptxzf","ptsmz","ptjs","ptdp","ptcs","ptyyc","ptcp","pttq","ptcf","dslj","dshp","dszy","dslq","qld","hdc","bhz","zhp","twq","ryjgb","jhcz","jcdp","jlxmc","qthbq","qxsh"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":150},
			"2":{"角色":"唐僧","战斗力":150},
			"3":{"角色":"八戒","战斗力":150},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"hgs",
		"Level": 10
	},
	"桃花源":{
		"LevelName": "桃花源",
		"MonsterList":[{"Name":"yh","IsBoss":false},{"Name":"dxx","IsBoss":false},{"Name":"yrw","IsBoss":true}],
		"LevelFall": [ "ptxzg","ptxzf","ptsmz","ptjs","ptdp","ptcs","ptyyc","ptcp","pttq","ptcf","dsyj","jmc","dsqz","zhj"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":250},
			"2":{"角色":"唐僧","战斗力":300},
			"3":{"角色":"八戒","战斗力":300},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"thy",
		"Level": 13
	},
	"蝙蝠窟":{
		"LevelName": "蝙蝠窟",
		"MonsterList":[{"Name":"bf","IsBoss":false},{"Name":"bfsx","IsBoss":true}],
		"LevelFall": [ "ptxzg","ptxzf","ptsmz","ptjs","ptdp","ptcs","ptyyc","ptcp","pttq","ptcf","whg","wtp","bsp"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":350},
			"2":{"角色":"唐僧","战斗力":400},
			"3":{"角色":"八戒","战斗力":350},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"bfk",
		"Level": 17
	},
	"七星洞":{
		"LevelName": "七星洞",
		"MonsterList":[{"Name":"bf","IsBoss":false},{"Name":"ys","IsBoss":false},{"Name":"dsj","IsBoss":false},{"Name":"stw","IsBoss":true}],
		"LevelFall": [ "ptxzg","ptxzf","ptsmz","ptjs","ptdp","ptcs","ptyyc","ptcp","pttq","ptcf","jcbj","jcmc","jcjp"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":450},
			"2":{"角色":"唐僧","战斗力":450},
			"3":{"角色":"八戒","战斗力":450},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"bfk",
		"Level": 18
	},
	"迦楼罗之穴":{
		"LevelName": "迦楼罗之穴",
		"MonsterList":[{"Name":"jjy","IsBoss":false},{"Name":"ys","IsBoss":false},{"Name":"dsj","IsBoss":false},{"Name":"pmw","IsBoss":true}],
		"LevelFall": [ "ptxzg","ptxzf","ptsmz","ptjs","ptdp","ptcs","ptyyc","ptcp","pttq","ptcf","jcjs","jcsz","jclj"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":650},
			"2":{"角色":"唐僧","战斗力":700},
			"3":{"角色":"八戒","战斗力":600},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"bfk",
		"Level": 20
	},
	"浅岸":{
		"LevelName": "浅岸",
		"MonsterList":[{"Name":"xb","IsBoss":false},{"Name":"xj","IsBoss":false},{"Name":"gcx","IsBoss":true}],
		"LevelFall": ["xqzy"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":700},
			"2":{"角色":"唐僧","战斗力":700},
			"3":{"角色":"八戒","战斗力":700},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"qa",
		"Level": 20
	},
	"东海":{
		"LevelName": "东海",
		"MonsterList":[{"Name":"xb","IsBoss":false},{"Name":"xj","IsBoss":false},{"Name":"gcx","IsBoss":false},{"Name":"yjj","IsBoss":false},{"Name":"jmw","IsBoss":true}],
		"LevelFall": [ "xwj","pxk","bxp"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":1000},
			"2":{"角色":"唐僧","战斗力":1000},
			"3":{"角色":"八戒","战斗力":900},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"qa",
		"Level": 23
	},
	"鲨之涡流":{
		"LevelName": "鲨之涡流",
		"MonsterList":[{"Name":"xb","IsBoss":false},{"Name":"xj","IsBoss":false},{"Name":"gcx","IsBoss":false},{"Name":"yjj","IsBoss":false},{"Name":"sy","IsBoss":true},{"Name":"smw","IsBoss":true}],
		"LevelFall": ["qlp","zqj","ttj"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":1200},
			"2":{"角色":"唐僧","战斗力":1100},
			"3":{"角色":"八戒","战斗力":1000},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"qa",
		"Level": 25
	},
	"牛魔谷":{
		"LevelName": "牛魔谷",
		"MonsterList":[{"Name":"nmds","IsBoss":false},{"Name":"nmw1","IsBoss":true},{"Name":"nmw2","IsBoss":true},{"Name":"nmw3","IsBoss":true}],
		"LevelFall": ["ttlp1"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":1700},
			"2":{"角色":"唐僧","战斗力":1600},
			"3":{"角色":"八戒","战斗力":1400},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"nmg",
		"Level": 25
	},
	"火焰山":{
		"LevelName": "火焰山",
		"MonsterList":[{"Name":"hhe","IsBoss":true}],
		"LevelFall": ["jgj","ssj"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":1700},
			"2":{"角色":"唐僧","战斗力":1600},
			"3":{"角色":"八戒","战斗力":1400},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"nmg",
		"Level": 25
	},
	"鬼城":{
		"LevelName": "鬼城",
		"MonsterList":[{"Name":"gd","IsBoss":false},{"Name":"js","IsBoss":false},{"Name":"syr","IsBoss":true}],
		"LevelFall": [ "lzp","jmy"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":1700},
			"2":{"角色":"唐僧","战斗力":1600},
			"3":{"角色":"八戒","战斗力":1400},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"df",
		"Level": 25
	},
	"无常巷":{
		"LevelName": "无常巷",
		"MonsterList":[{"Name":"gd","IsBoss":false},{"Name":"js","IsBoss":false},{"Name":"syr","IsBoss":false},{"Name":"hwc","IsBoss":true},{"Name":"bwc","IsBoss":true}],
		"LevelFall": [ "yhj","tsgl","bsyz","bsxj","bszj","bsbc","bshq","csgs","bszy"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":1800},
			"2":{"角色":"唐僧","战斗力":1700},
			"3":{"角色":"八戒","战斗力":1500},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"df",
		"Level": 27
	},
	"鬼门关":{
		"LevelName": "鬼门关",
		"MonsterList":[{"Name":"gd","IsBoss":false},{"Name":"js","IsBoss":false},{"Name":"syr","IsBoss":false},{"Name":"klw","IsBoss":true}],
		"LevelFall": [ "lcgy","tsgp"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":2000},
			"2":{"角色":"唐僧","战斗力":2000},
			"3":{"角色":"八戒","战斗力":1800},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"df",
		"Level": 27
	},
	"接引院":{
		"LevelName": "接引院",
		"MonsterList":[{"Name":"nt","IsBoss":false},{"Name":"mm","IsBoss":false},{"Name":"qgw","IsBoss":true}],
		"LevelFall": [ "gtq","gtb","gtc","tsyj"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":2000},
			"2":{"角色":"唐僧","战斗力":2000},
			"3":{"角色":"八戒","战斗力":2500},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"jyy",
		"Level": 27
	},
	"判官府":{
		"LevelName": "判官府",
		"MonsterList":[{"Name":"nt","IsBoss":false},{"Name":"mm","IsBoss":false},{"Name":"hwc","IsBoss":false},{"Name":"bwc","IsBoss":false},{"Name":"pg","IsBoss":true}],
		"LevelFall": [ "gtq","gtb","lcld","tsyp"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":2200},
			"2":{"角色":"唐僧","战斗力":2500},
			"3":{"角色":"八戒","战斗力":2700},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"pgf",
		"Level": 27
	},
	"阎罗殿":{
		"LevelName": "阎罗殿",
		"MonsterList":[{"Name":"nt","IsBoss":false},{"Name":"mm","IsBoss":false},{"Name":"hwc","IsBoss":false},{"Name":"bwc","IsBoss":false},{"Name":"sdgm","IsBoss":true},{"Name":"ylw","IsBoss":true}],
		"LevelFall": [ "gtq","gtb","yll","fygwj","lchp"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":2400},
			"2":{"角色":"唐僧","战斗力":2700},
			"3":{"角色":"八戒","战斗力":2700},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"yld",
		"Level": 27
	},
	"忘川河":{
		"LevelName": "忘川河",
		"MonsterList":[{"Name":"gy","IsBoss":false},{"Name":"sdw","IsBoss":true}],
		"LevelFall": [],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":2200},
			"2":{"角色":"唐僧","战斗力":2700},
			"3":{"角色":"八戒","战斗力":2800},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"wch",
		"Level": 30
	},
	"奈何桥":{
		"LevelName": "奈何桥",
		"MonsterList":[{"Name":"mz","IsBoss":false},{"Name":"sh","IsBoss":false},{"Name":"ht","IsBoss":false},{"Name":"yc","IsBoss":true}],
		"LevelFall": ["yazfw","yizfw","hshb","zshb","lssp","qssp","lczh","xhmj","xhxc"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":3000},
			"2":{"角色":"唐僧","战斗力":3000},
			"3":{"角色":"八戒","战斗力":3000},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"nhq",
		"Level": 30
	},
	"望乡台":{
		"LevelName": "望乡台",
		"MonsterList":[{"Name":"mz","IsBoss":false},{"Name":"sh","IsBoss":false},{"Name":"ht","IsBoss":false},{"Name":"qs","IsBoss":false},{"Name":"mp","IsBoss":true}],
		"LevelFall": [ "yazfw","yizfw","hshb","zshb","lshb","lssp","qssp","jssp","xhgp","xhxh","xhyk","xhymk"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":3500},
			"2":{"角色":"唐僧","战斗力":3400},
			"3":{"角色":"八戒","战斗力":3600},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"wxt",
		"Level": 30
	},
	"转轮殿":{
		"LevelName": "转轮殿",
		"MonsterList":[{"Name":"zlsz","IsBoss":false},{"Name":"zlw1","IsBoss":true},{"Name":"zlw2","IsBoss":true},{"Name":"zlw3","IsBoss":true}],
		"LevelFall": ["ttlp2","myz","nyd","syc","shyc","xyq"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":4500},
			"2":{"角色":"唐僧","战斗力":4500},
			"3":{"角色":"八戒","战斗力":4500},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"zld",
		"Level": 30
	},
	"螺旋地狱":{
		"LevelName": "螺旋地狱",
		"MonsterList":[{"Name":"wgw","IsBoss":true},{"Name":"bcw","IsBoss":true},{"Name":"tsw","IsBoss":true},{"Name":"dsw","IsBoss":true},{"Name":"pdw","IsBoss":true}],
		"LevelFall": ["szyj","xzyj","czyj","zzyj","gzyj"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":0},
			"2":{"角色":"唐僧","战斗力":0},
			"3":{"角色":"八戒","战斗力":0},
			"4":{"角色":"沙僧","战斗力":0},
		},
		"SelfBg":"lxdy"
	},
	"九重天":{
		"LevelName": "九重天",
		"MonsterList":[{"Name":"ey","IsBoss":false},{"Name":"xtq","IsBoss":true}],
		"LevelFall": [],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":5600},
			"2":{"角色":"唐僧","战斗力":5600},
			"3":{"角色":"八戒","战斗力":5600},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"jct",
		"Level": 35
	},
	"天宫道":{
		"LevelName": "天宫道",
		"MonsterList":[{"Name":"hg","IsBoss":false},{"Name":"hh","IsBoss":false},{"Name":"wy","IsBoss":false},{"Name":"qly","IsBoss":true},{"Name":"sfe","IsBoss":true}],
		"LevelFall": ["kys","xhz","kyz","kyc","tfljzzs"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":5800},
			"2":{"角色":"唐僧","战斗力":5800},
			"3":{"角色":"八戒","战斗力":5800},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"jct",
		"Level": 35
	},
	"南天门":{
		"LevelName": "南天门",
		"MonsterList":[{"Name":"hg","IsBoss":false},{"Name":"hh","IsBoss":false},{"Name":"wy","IsBoss":false},{"Name":"jls","IsBoss":true}],
		"LevelFall": ["xhp","xhc","xhj"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":6000},
			"2":{"角色":"唐僧","战斗力":6000},
			"3":{"角色":"八戒","战斗力":6000},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"jct",
		"Level": 35
	},
	"南天王殿":{
		"LevelName": "南天王殿",
		"MonsterList":[{"Name":"tbd","IsBoss":false},{"Name":"tbq","IsBoss":false},{"Name":"tbg","IsBoss":false},{"Name":"zztw","IsBoss":true}],
		"LevelFall": ["qyfp","qybd","qysq"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":6500},
			"2":{"角色":"唐僧","战斗力":6500},
			"3":{"角色":"八戒","战斗力":6500},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"zztw",
		"Level": 35
	},
	"西天王殿":{
		"LevelName": "西天王殿",
		"MonsterList":[{"Name":"tbd","IsBoss":false},{"Name":"tbq","IsBoss":false},{"Name":"tbg","IsBoss":false},{"Name":"gmtw","IsBoss":true}],
		"LevelFall": ["hylk","qysz"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":6700},
			"2":{"角色":"唐僧","战斗力":6700},
			"3":{"角色":"八戒","战斗力":6700},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"gmtw",
		"Level": 35
	},
	"北天王殿":{
		"LevelName": "北天王殿",
		"MonsterList":[{"Name":"tbd","IsBoss":false},{"Name":"tbq","IsBoss":false},{"Name":"tbg","IsBoss":false},{"Name":"dwtw","IsBoss":true}],
		"LevelFall": ["hylc","hylz","mgzhzzs"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":7000},
			"2":{"角色":"唐僧","战斗力":7000},
			"3":{"角色":"八戒","战斗力":7000},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"dwtw",
		"Level": 35
	},
	"彩虹楼":{
		"LevelName": "彩虹楼",
		"MonsterList":[{"Name":"goy","IsBoss":false},{"Name":"yy","IsBoss":false},{"Name":"ny","IsBoss":false},{"Name":"zzz","IsBoss":true}],
		"LevelFall": ["zjqj","zjksf","zjgp","zjxmczzs","hljhzzs","tdlzjzzs"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":7000},
			"2":{"角色":"唐僧","战斗力":7000},
			"3":{"角色":"八戒","战斗力":7000},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"chl",
		"Level": 35
	},
	"朝会殿":{
		"LevelName": "朝会殿",
		"MonsterList":[{"Name":"goy","IsBoss":false},{"Name":"yy","IsBoss":false},{"Name":"ny","IsBoss":false},{"Name":"sey","IsBoss":false},{"Name":"yuh","IsBoss":true}],
		"LevelFall": ["zjbtgzzs","wsjgzzs","blmqzzs","jllm","smz"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":7000},
			"2":{"角色":"唐僧","战斗力":7000},
			"3":{"角色":"八戒","战斗力":7000},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"zhd",
		"Level": 35
	},
	"凌霄宝殿":{
		"LevelName": "凌霄宝殿",
		"MonsterList":[{"Name":"yy","IsBoss":false},{"Name":"ny","IsBoss":false},{"Name":"wgj","IsBoss":false},{"Name":"xtq","IsBoss":true},{"Name":"els","IsBoss":true}],
		"LevelFall": ["shsjt"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":7000},
			"2":{"角色":"唐僧","战斗力":7000},
			"3":{"角色":"八戒","战斗力":7000},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"lxbd",
		"Level": 35
	},
	"玲珑宝塔":{
		"LevelName": "玲珑宝塔",
		"MonsterList":[{"Name":"jdhw","IsBoss":false},{"Name":"cdhw","IsBoss":false},{"Name":"hdhw","IsBoss":false},{"Name":"txs","IsBoss":true},{"Name":"lzz","IsBoss":true},{"Name":"nz","IsBoss":true},{"Name":"tttw","IsBoss":true}],
		"LevelFall": ["xuantie","sichou","tanmu","eyzzs","tzzzs","zezzs","yjzzs","czzzs","tczzs","tqzzs","thzzs","ryzzs","tszzs","rls","llyzzs"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":7000},
			"2":{"角色":"唐僧","战斗力":7000},
			"3":{"角色":"八戒","战斗力":7000},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"llbt",
		"Level": 40
	},
	"兜率宫":{
		"LevelName": "兜率宫",
		"MonsterList":[{"Name":"lhtz","IsBoss":false},{"Name":"wdtz","IsBoss":false},{"Name":"ghtz","IsBoss":false},
		{"Name":"yntz","IsBoss":false},{"Name":"rstz","IsBoss":false},{"Name":"dhtz","IsBoss":false},{"Name":"yjdw","IsBoss":true},
		{"Name":"jjdw","IsBoss":true},{"Name":"qnj","IsBoss":true},{"Name":"tbjx","IsBoss":true},{"Name":"tslj","IsBoss":true}],
		"LevelFall": ["ziyanyujin","liuhuang","xianmao","lingli","shougong","renshen","dudan","yjpysp","yjpyasp","leizong","qljzzs","plpzzs","ylkzzs","jljzzs","tljzzs","qlgzzs","plzzzs","ylfzzs","jlczzs","tlqzzs","doushuaiziyanzzs"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":7000},
			"2":{"角色":"唐僧","战斗力":7000},
			"3":{"角色":"八戒","战斗力":7000},
			"4":{"角色":"沙僧","战斗力":80},
		},
		"SelfBg":"dsg",
		"Level": 50
	},
	"火龙岛":{
		"LevelName": "火龙岛",
		"MonsterList":[{"Name":"hlhw","IsBoss":false},{"Name":"fyj","IsBoss":true},{"Name":"wll","IsBoss":true},{"Name":"yzx","IsBoss":true}],
		"LevelFall": ["qszzs","rczzs","ytzzs","llzzs","ldzzs"],
		"NeedZDL":{
			"1":{"角色":"悟空","战斗力":0},
			"2":{"角色":"唐僧","战斗力":0},
			"3":{"角色":"八戒","战斗力":0},
			"4":{"角色":"沙僧","战斗力":0},
		},
		"SelfBg":"hld",
		"Level": 55
	},
	
}
#var Num: int
var LevelName: String
var Num: int
var TargetStagePath: String
var Time_: float
var Is_set:bool
func _ready() -> void:
	if not MainSet.set_data["LevelInfo"]:
		self.visible = false
#		if TargetStagePath == "res://Scene/Level/Level_llbt.tscn":
#			Global.AddllbtChallenge(get_parent(),Vector2(0,0))
#			self.queue_free()
#		elif TargetStagePath == "兜率宫":
#			Global.AddDsgChoose(self)
#			self.queue_free()
func _physics_process(delta: float) -> void:
	
	if not MainSet.set_data["LevelInfo"]:
		self.visible = false
		if TargetStagePath == "res://Scene/Level/Level_llbt.tscn":
			Global.AddllbtChallenge(get_parent(),Vector2(0,0))
			self.queue_free()
			return
		elif TargetStagePath == "兜率宫":
			Global.AddDsgChoose(get_parent())
			self.queue_free()
			return
		Global.change_secen(TargetStagePath)
		return
	match MainSet.set_data["CreateMonsterSpeed"]:
		1.2:
			speedtext.text = "×1"
		0.6:
			speedtext.text = "×2"
		0.3:
			speedtext.text = "×4"
	if not Is_set:
		level_down.text = str(LevelInfo[LevelName]["Level"])
		pj.text = str(LevelInfo[LevelName]["LevelName"]) + "历史最高评价："
		Title.text = LevelInfo[LevelName]["LevelName"]
		fall.text = str(LevelInfo[LevelName]["LevelName"]) + "概率掉落："
		Num = PlayerData.player_data["关卡评价"][LevelName]
		mybg.texture = load_2(LevelInfo[LevelName]["SelfBg"])
		SetPJFontColor()
		AddLevelFallItem()
		AddMonsterHead()
		Is_set = true
	#set_physics_process(false)

func SetPJFontColor():
	#var RoleName = LevelInfo[LevelName]["NeedZDL"][str(PlayerData.player_data["Myself"])]["角色"]
	#var ZDl = LevelInfo[LevelName]["NeedZDL"][str(PlayerData.player_data["Myself"])]["战斗力"]
	my_pj.text = PjList["PjList"][Num]
	my_pj.add_theme_color_override("font_color",FontColorList["font_colorList"][Num])

func AddLevelFallItem():#根据列表添加掉落物信息
	var InfoDic = LevelInfo[LevelName]["LevelFall"]
	for i in InfoDic:
		#print(i)
		var box = Global.AddLevelFallBox(fall_list,true,true,i,0,[],AE.AllEquipment_[i])
		box.set_button_icon(load_(i))
func AddMonsterHead():#根据列表添加掉Boss头像
	var InfoDic = LevelInfo[LevelName]["MonsterList"]
	for i in InfoDic:
		Global.AddMonsterHead(monster_list,i["Name"],i["IsBoss"])
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc
func load_2(name_):
	var abc = load("res://Art/LevelInfoBg/" + str(name_) + ".png")
	return abc

func _on_challenge_pressed() -> void:
	if TargetStagePath != "":
		if TargetStagePath == "res://Scene/Level/Level_llbt.tscn":
			Global.AddllbtChallenge(self,Vector2(0,0))
			return
		elif TargetStagePath == "兜率宫":
			Global.AddDsgChoose(self)
			return
		Global.change_secen(TargetStagePath)
	else:
		Global.AddMessageShow(Global.Windows_,"获取关卡信息时出现错误，请手动更换关卡！！",1.5,Vector2(470,300))


func _on_close_pressed() -> void:
	self.queue_free()


func _on_speed_pressed() -> void:
	if MainSet.set_data["CreateMonsterSpeed"] > 0.3:
		MainSet.set_data["CreateMonsterSpeed"] = MainSet.set_data["CreateMonsterSpeed"] / 2
	else:
		MainSet.set_data["CreateMonsterSpeed"] = 1.2
	MemoryClass.main_bc()
