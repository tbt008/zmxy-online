extends Node
var AllBuffList = ["speed_down","DefeReduce","nlls","Ice","stun","EyeFix","DeadLink","Boundground","silent","Immobilize","BloodFix",
"Bleed","poision","Fire","Scary","SuperArmor","Indestructible","DoubleFallPro","Voodoo","PoisionBody","slzbuff","lpzbuff"
,"tszbuff","lljybuff","NoDeBuff","flls"]
var BuffList = []
var ChooseList = []
var ChooseMs: bool
var buff_box
var MgCdPic
var zhen_fa
var LHHJBossList = {}
var CloudSword_ = preload("res://Scene/MagicWeapon/CloudSword.tscn")
var PurpleGoldBell_ = preload("res://Scene/MagicWeapon/PurpleGoldBell.tscn")
var BasicArButton = preload("res://Scene/OtherScene/BacisArButton.tscn")
var IsFrist: bool
var Is_Show: bool
var CollectNum: int = 0
var PlayerBeHitCount: int = 0
var GameOver: int = 1
var LLBTWXMS: bool = false
var LLBTCGMS: bool = true
var LLBTBOSSMS:bool
var BoxCount: int = 0
var LLBTLevel: int = 1
var CurrentLevel: String
var LevelBeginTime = ""#进入关卡初始时间
var LevelEndTime = ""#挑战成功最后时间
var MostLianji: int = 0#最高连击次数
var LastPropHp: float#
var TotalRoleHurt: int#累计受伤
var LastLevelPath: String
var TotalRoleHit: int
var TotalCureHp: int#累计治疗
var TotalPhyHit: int
var TotalMagHit: int
var TotalRealHit: int
var TotalPhyHurt: int
var TotalMagHurt: int
var TotalRealHurt: int
var TotalHurtCount: int
var TotalHitCount: int
var TotalCritCount: int
var TotalMissCount: int
var Windows_
var FileNum = 1.201
var Mytime
var Player_pos_x
var zb_packisfull = false
var dj_packisfull = false
var xhp_packisfull = false
var should_change: bool
var Forge_: Forge
var FB_CD: int
var is_in_ldl
var get_target
var is_Mpo
var is_ice
var is_poision
var is_Fire
var is_speed_down
var is_stun
var is_Bleed
var is_EyeFix
var is_DeadLink
var LJ_times: int
var lj_count: int
var Player_dir_
var remove_jq
var wait_time:float = 0.8
var get_player: BaseHero
var NeedChangeItem: bool = true
var lhhjbutton = preload("res://Scene/OtherScene/lhhj_button.tscn")
var Hybrofoline_ = preload("res://Scene/MagicWeapon/Hybrofoline.tscn")
var monster_be_hit = preload("res://Scene/MonsterDamage/monster_be_hit.tscn")
var monster_blood = preload("res://Scene/MonsterBlood/monster_blood_bar.tscn")
var hit_text = preload("res://Scene/hittest/HitText.tscn")
var bullet = preload("res://Scene/Monster/MonsterBullet.tscn")
var Player_dir
var MosaicHelp = preload("res://Scene/LDL/MosaicHelp.tscn")
var back_pack = preload("res://Scene/BackPack/BackPack.tscn")
var touch_text = preload("res://Scene/show_text/touch_text.tscn")
var moment_texxt = preload("res://Scene/show_text/MomentText.tscn")
var cd_path
var cd_jm = preload("res://Scene/ArchiveInterface/read_archive_interface.tscn")
var set_menu = preload("res://Scene/set_menu.tscn")
#var role_1 = preload("res://Scene/Hero/Role_1/Role1.tscn")
#var role_2 = preload("res://Scene/Hero/Role_2/Role_2.tscn")
#var role_3 = preload("res://Scene/Hero/Role_3/Role_3.tscn")
#var role_4 = preload("res://Scene/Hero/Role_4/Role_4.tscn")
#var role_5 = preload("res://Scene/Hero/Role_5/Role_5.tscn")
var mycamera = preload("res://Scene/Level/camera.tscn")
var music_set = preload("res://Scene/OtherScene/choose_music.tscn")
var target_scene
var main_backpack = preload("res://Scene/BackPack/Main_Backpack.tscn")
var sell_or_equ = preload("res://Scene/BackPack/sell_or_equ.tscn")
var equ_propeties_box = preload("res://Scene/BackPack/equipment_properies.tscn")
var dj_sell = preload("res://Scene/BackPack/dj_sell.tscn")
var dj_infor = preload("res://Scene/BackPack/dj_information.tscn")
var fall_equ = preload("res://Scene/BackPack/equipment_fall.tscn")
var pl_sell = preload("res://Scene/BackPack/pl_sell.tscn")
var ldl = preload("res://Scene/LDL/ldl.tscn")
var Game_information = preload("res://Scene/Main_menu/Game_information.tscn")
var zd_skill = preload("res://Scene/Skill/zd_skill.tscn")
var Skill_learn = preload("res://Scene/Skill/Learn_skill.tscn")
var role_information = preload("res://Scene/Level/Role_information.tscn")
var SpecialEffectBullet = preload("res://Scene/Hero/Role_1/hmz_effect/SpecialEffectBullet.tscn")
var choose_text = preload("res://Scene/show_text/choose_scene.tscn")
var SpecialAffect = preload("res://Scene/Base/special_affect.tscn")
var zztwtrap = preload("res://Scene/Level/zztw_trap.tscn")
var BuffIcon = preload("res://Scene/BackPack/buff.tscn")
var Trap_ = preload("res://Scene/Level/trap.tscn")
var lj = preload("res://Scene/show_text/liji.tscn")
var bd_skill = preload("res://Scene/Skill/bd_skill.tscn")
var FlyBullet = preload("res://Scene/Bullet/Fly_bullet.tscn")
var nmw_hands = preload("res://Scene/Monster/Monster_25.tscn")
var qh_jm = preload("res://Scene/LDL/strength.tscn")
var change_background = preload("res://Scene/OtherScene/change_back_ground.tscn")
var synthesis = preload("res://Scene/LDL/Synthesis.tscn")
var magp_infor = preload("res://Scene/BackPack/Magic_weapon_infor.tscn")
var shop_ttems = preload("res://Scene/Shop/Shop_item.tscn")
var SHop = preload("res://Scene/Shop/SHOP.tscn")
var ldl_help = preload("res://Scene/LDL/s_yn_help.tscn")
var ChaseBullet_ = preload("res://Scene/Bullet/Chase_bullet.tscn")
var Choose_Item = preload("res://Scene/Shop/Choose_item.tscn")
var WS_Effect = preload("res://Scene/Hero/Role_1/WS_Effect.tscn")
var MessageShow = preload("res://Scene/show_text/Message_show.tscn")
var Cucurbit_ = preload("res://Scene/MagicWeapon/Cucurbit.tscn")
var Sword_ = preload("res://Scene/MagicWeapon/Sword.tscn")
var addWeaponBullet = preload("res://Scene/MagicWeapon/HitBullet.tscn")
var SkillSelect = preload("res://Scene/BackPack/skill_select.tscn")
var UseMagicWeapon = preload("res://Scene/BackPack/Use_magic_weapon.tscn")
var MagicHelp = preload("res://Scene/MagicWeapon/Magic_help.tscn")
var Mirror_ = preload("res://Scene/MagicWeapon/Mirror.tscn")
var GhostDoll_ = preload("res://Scene/MagicWeapon/GhostDoll.tscn")
var Sound_ = preload("res://Scene/AllSound/MonsterBeHit.tscn")
var Mosaic_ = preload("res://Scene/LDL/Mosaic.tscn")
var BGM_ = preload("res://Scene/AllSound/BGM.tscn")
var Role4Bullet_ = preload("res://Scene/Hero/Role_4/Role4Bullet.tscn")
var GameSet_ = preload("res://Scene/Main_menu/GameSet.tscn")
var SkillKeySet = preload("res://Scene/Skill/SkillKeySet.tscn")
var RoleBullet_1 = preload("res://Scene/Hero/RoleBullet_1.tscn")
var Role1Shallow = preload("res://Scene/Hero/Role1SHallow.tscn")
var DamageText = preload("res://Scene/hittest/DamageText.tscn")
var DamageNumber = preload("res://Scene/hittest/DamageNumber.tscn")
var MissEffect = preload("res://Scene/hittest/miss_effect.tscn")
var ChangeClothesJm = preload("res://Scene/OtherScene/c_hange_clothes_jm.tscn")
var HHjm = preload("res://Scene/OtherScene/Transmogrified.tscn")
var ZLw_stage = preload("res://Scene/Level/zlw_fly_floor.tscn")
var ComboNum = preload("res://Scene/show_text/combo_num.tscn")
var Combo = preload("res://Scene/show_text/combo.tscn")
var AfterLevelEnd = preload("res://Scene/OtherScene/AfterLevelEnd.tscn")
var BaseBuff_ = preload("res://Scene/Base/BaseBuff.tscn")
var BuffIcon_ = preload("res://Scene/OtherScene/BuffIcon.tscn")
var Buffinfor = preload("res://Scene/OtherScene/buff_information.tscn")
var Aura_ = preload("res://Scene/OtherScene/Auras.tscn")
var Monster65Bullet = preload("res://Scene/Monster/Monster65bullet.tscn")
var ChoosePlayer = preload("res://Scene/Main_menu/ChoosePlayer.tscn")
var RoleBullet_ = preload("res://Scene/Hero/RoleBullet.tscn")
var RoleSpecialEffect_ = preload("res://Scene/Hero/RoleSpecialEffect.tscn")
var Role2Shallow = preload("res://Scene/Base/Role2shallow.tscn")
var SMBEffect = preload("res://Scene/Hero/Role_2/smb_effect.tscn")
var NewBullet = preload("res://Scene/Hero/BulletBullet.tscn")
var RoleMagicNeed = preload("res://Scene/Skill/RoleMagicNeed.tscn")
var GameNeedKnow = preload("res://Scene/OtherScene/GameNeedKnow.tscn")
var MonsterHead = preload("res://Scene/OtherScene/MonsterHeadInfo.tscn")
var LevelFallBox = preload("res://Scene/BackPack/Box_1.tscn")
var LevelInfo = preload("res://Scene/OtherScene/LevelInfo.tscn")
var Pj = preload("res://Scene/OtherScene/ping_jia.tscn")
var HelpThing = preload("res://Scene/OtherScene/help_things.tscn")
var Hc_Help = preload("res://Scene/OtherScene/hc_help.tscn")
var MagicUnmbrella = preload("res://Scene/MagicWeapon/MagicUmbrella.tscn")
var PurpleGlodCucurbit_ = preload("res://Scene/MagicWeapon/PurpleGlodCucurbit.tscn")
var BossBlood_ = preload("res://Scene/MonsterBlood/BossBlood.tscn")
var Stage = preload("res://Scene/Level/jctfloor_1.tscn")
var Curbit = preload("res://Scene/MagicWeapon/Cucurbit2.tscn")
var Decompose_ = preload("res://Scene/LDL/Decompose.tscn")
var Decompose_Help = preload("res://Scene/LDL/DecomposeHelp.tscn")
var RewardBox = preload("res://Scene/OtherScene/reward_box_2.tscn")
var RewardInfo = preload("res://Scene/OtherScene/RewardInterface.tscn")
var TaskTitle = preload("res://Scene/Task/TaskTitle.tscn")
var BasicTask_ = preload("res://Scene/Task/BasicTask.tscn")
var TaskReward = preload("res://Scene/Task/TaskReward.tscn")
var ADDFont = preload("res://Scene/show_text/MessageInfo.tscn")
var GameAnnouncement = preload("res://Scene/Main_menu/GameAnnouncement.tscn")
var BasicPellet_ = preload("res://Scene/Pellet/BasicPellet.tscn")
var TransBox = preload("res://Scene/OtherScene/TransmogtifiedBox.tscn")
var llbtChallenge = preload("res://Scene/Level/llbt_challenge.tscn")
var Forges = preload("res://Scene/LDL/Forge.tscn")
var ForgeBox = preload("res://Scene/LDL/ForgeMaterialBox.tscn")
var ForgeHelp = preload("res://Scene/LDL/ForgeHelp.tscn")
var BasicMonmentInfo = preload("res://Scene/OtherScene/BasicMonmentInfo.tscn")
var MonsterInfo = preload("res://Scene/Monster/BossInfo.tscn")
var HDZM = preload("res://Scene/Level/HDZM.tscn")
var DsgChoose = preload("res://Scene/Level/DsgChoose.tscn")
var Line = preload("res://Scene/Level/LineEffect.tscn")
var MysteryShop = preload("res://Scene/Shop/MysteryShop.tscn")
var CureTimesBox = preload("res://Scene/Shop/CureTimesBox.tscn")
var LetterForPlayer = preload("res://Scene/OtherScene/ALetterForAllPlayers.tscn")
var SomeMonsterHelp = preload("res://Scene/Monster/SomeMonsterHelp.tscn")
var Lhhj_ = preload("res://Scene/OtherScene/lhhj.tscn")
var listbutton = preload("res://Scene/OtherScene/list_button.tscn")
var lhhjhelp = preload("res://Scene/OtherScene/lhhj_help.tscn")
var Monster141Aura = preload("res://Scene/OtherScene/NMWAura.tscn")
var ReturnBackMap = preload("res://Scene/OtherScene/ReturnBackMap.tscn")
var Zhenfalxbutton = preload("res://Scene/OtherScene/zhenfalxbutton.tscn")
var ZhenFaInfo = preload("res://Scene/OtherScene/zhenfainfo.tscn")
var ZhenFaUi = preload("res://Scene/OtherScene/ZhenFaUi.tscn")
var _28Ui = preload("res://Scene/OtherScene/TwentyEightConstellations.tscn")
var zhenyanbutton = preload("res://Scene/OtherScene/zhenyanbutton.tscn")
var ZhenYanCureLevel = preload("res://Scene/OtherScene/ZhenYanCureLevel.tscn")
var ZhenFaTuPo = preload("res://Scene/OtherScene/ZhenFaTuPo.tscn")
var ZhenFaHelp = preload("res://Scene/OtherScene/ZhenFaHelp.tscn")
var RoleButton = preload("res://Scene/OtherScene/role_button.tscn")
var Star = preload("res://Scene/OtherScene/star.tscn")
func AddStar(parent,Type):
	var target = instance_scene(Star,parent)
	target.Type = Type
	return target

func AddRoleButton(parent,MyName,MyFather):
	var target = instance_scene(RoleButton,parent)
	target.MyName = MyName
	target.MyFather = MyFather
	return target
func AddBasicArButton(parent,Num):
	var target = instance_scene(BasicArButton,parent)
	target.MyNum = Num
	return target
func AddZhenFaHelp(parent,position):
	var target = instance_scene(ZhenFaHelp,parent)
	target.position = position
	return target
func AddZhenFaTuPo(parent,position,Father):
	var target = instance_scene(ZhenFaTuPo,parent)
	target.position = position
	target.Father = Father
	return target
func AddZhenYanCureLevel(parent,position,Father):
	var target = instance_scene(ZhenYanCureLevel,parent)
	target.position = position
	target.Father = Father
	return target
func Addzhenyanbutton(parent,position,LocNum,Father):
	var target = instance_scene(zhenyanbutton,parent)
	target.position = position
	target.LocNum = LocNum
	target.Father = Father
	return target
func Add_28Ui(parent,position):
	var target = instance_scene(_28Ui,parent)
	target.position = position
	return target
func AddZhenFaUi(parent,position):
	var target = instance_scene(ZhenFaUi,parent)
	target.position = position
	return target
func AddZhenFaInfo(parent,position,Father):
	var target = instance_scene(ZhenFaInfo,parent)
	target.position = position
	target.Father = Father
	return target
func AddZhenfalxbutton(parent,zhenfaName,Father):
	var target = instance_scene(Zhenfalxbutton,parent)
	target.zhenfaName = zhenfaName
	target.Father = Father
	return target
func Addhdgqmap(parent,position):
	var target = instance_scene(ReturnBackMap,parent)
	target.position = position
	return target
func AddMonster141Aura(parent,position_,TargetMonster):
	var target = instance_scene(Monster141Aura,parent)
	target.TargetMonster = TargetMonster
	target.position = position_
	return target
func Addlhhjhelp(parent,position):
	var target = instance_scene(lhhjhelp,parent)
	target.position = position
	return target
func Addlistbutton(parent,selfName,Father,Num):
	var target = instance_scene(listbutton,parent)
	target.selfName = selfName
	target.Father = Father
	target.Num = Num
	return target
func Addlhhj(parent,position):
	var target = instance_scene(Lhhj_,parent)
	target.position = position
	return target
func Addlhhjbutton(parent,selfName,Father):
	var target = instance_scene(lhhjbutton,parent)
	target.selfName = selfName
	target.Father = Father
	return target
func AddSomeMonsterHelp(parent,position):
	var target = instance_scene(SomeMonsterHelp,parent)
	target.position = position
	return target
func AddMosaicHelp(parent,position):
	var target = instance_scene(MosaicHelp,parent)
	target.position = position
	return target
func AddLetterForPlayer(parent,position):
	var target = instance_scene(LetterForPlayer,parent)
	target.position = position
	return target
func AddCureTimesBox(parent,position):
	var target = instance_scene(CureTimesBox,parent)
	target.position = position
	return target
func AddMysteryShop(parent,position):
	var target = instance_scene(MysteryShop,parent)
	target.position = position
	return target
func AddTransBox(parent,name_,Transmogrified_):
	var target = instance_scene(TransBox,parent)
	target.SelfName_ = name_
	target.Transmogrified_ = Transmogrified_
	return target
func AddRole4Bullet(parent,Player: BaseHero,position: Vector2):
	var target = instance_scene(Role4Bullet_,parent)
	target.Player = Player
	target.position = position
	return target
func AddLine(parent,Monster,Type):
	var target = instance_scene(Line,parent)
	target.position = Vector2(0,0)
	target.Type = Type
	target.Monster = Monster
	return target
func AddDsgChoose(parent):
	var target = instance_scene(DsgChoose,parent)
	target.position = Vector2(0,0)
	return target
func AddHDZM(parent,Parent):
	var target = instance_scene(HDZM,parent)
	target.position = Vector2(0,0)
	target.Parent = Parent
	return target

#func AddTimeTs(parent):
#	var target = instance_scene(TimeTs,parent)
#	return target
func AddMonsterInfo(parent,MonsterName,position):
	var target = instance_scene(MonsterInfo,parent)
	target.MonsterName = MonsterName
	target.position = position
	return target
func AddBasicMonmentInfo(parent,ShowText,position):
	var target = instance_scene(BasicMonmentInfo,parent)
	target.ShowText = ShowText
	target.position = position
	return target
func AddForgeHelp(parent,position):
	var target = instance_scene(ForgeHelp,parent)
	target.position = position
	return target
func AddForgeBox(parent,Name,Num):
	var target = instance_scene(ForgeBox,parent)
	target.ItemName = Name
	target.NeedNum = Num
	return target
func AddForges(parent,position):
	var target = instance_scene(Forges,parent)
	target.position = position
	return target
func AddllbtChallenge(parent,position):
	var target = instance_scene(llbtChallenge,parent)
	target.position = position
	return target
#func AddPelletHelp(parent,position):
#	var target = instance_scene(PelletHelp,parent)
#	target.position = position
#	return target
func AddBasicPellet_(parent,position):
	var target = instance_scene(BasicPellet_,parent)
	target.position = position
	return target
func AddGameAnnouncement(parent,position):
	var target = instance_scene(GameAnnouncement,parent)
	target.position = position
	return target
func ADDFont_(parent,ShowText,Font_,FontSize,FontColor,OutLineSize,OutLineColor):
	var target = instance_scene(ADDFont,parent)
	if Font_ == null:
		target.Font_ = null
	else:
		target.Font_ = load(Font_)
	target.ShowText = ShowText
	target.FontColor = FontColor
	target.OutLineSize = OutLineSize
	target.OutLineColor = OutLineColor
	target.FontSize = FontSize
	return target
func AddTaskReward(parent,ItemName,TotalNum):
	var target = instance_scene(TaskReward,parent)
	target.ItemName = ItemName
	target.TotalNum = TotalNum
	target.z_index = 99
	return target
func AddBasicTask_(parent,position):
	var target = instance_scene(BasicTask_,parent)
	target.position = position
	return target
func AddTaskTitle(parent,TaskType,TaskName,MyFather):
	var target = instance_scene(TaskTitle,parent)
	target.TaskName = TaskName#任务名
	target.TaskType = TaskType#任务种类
	target.MyFather = MyFather#BasicTask对象
	target.z_index = 99
	return target
func AddRewardInfo(parent,position,List,UseItemName,UseNum):
	var target = instance_scene(RewardInfo,parent)
	target.position = position
	target.UseNum = UseNum
	target.UseItemName = UseItemName
	target.ItemList_ = List
	target.z_index = 99
	return target
func AddRewardBox(parent,Name,Num):
	var target = instance_scene(RewardBox,parent)
	target.Name = Name
	target.Num = Num
	return target
#func AddRewardBox(parent,Inldl,Inhhgz,HideProp,Name,qh_level,num,wx,EqProp):
#	var target = instance_scene(LevelFallBox,parent)
#	target.is_in_ldl_gz = Inldl#是否在炼丹炉
#	target.is_in_hhgz = Inhhgz#是否在炼丹炉
#	target.HideProp = HideProp#是否显示属性图
#	target.qh_level = qh_level#强化等级
#	target.total_number = num#数量
#	target.wx = wx#五行
#	target.EQ_prop = EqProp#属性
#	return target
func Add_Decompose_Help(parent,position):
	var target = instance_scene(Decompose_Help,parent)
	target.position = position
	return target
func Add_Decompose_(parent,position):
	var target = instance_scene(Decompose_,parent)
	target.position = position
	return target
func AddZZTWTrap(parent,Name,position):
	var target = instance_scene(zztwtrap,parent)
	target.MyName = Name
	target.position = position
	return target
func AddStage(parent,Obj,position):
	var target = instance_scene(Stage,parent)
	target.Type = Obj
	target.position = position
	return target
func AddBossBlood_(parent,Obj):
	var target = instance_scene(BossBlood_,parent)
	target.GetObj = Obj
	return target
func AddHc_Help(parent,position):
	var target = instance_scene(Hc_Help,parent)
	target.position = position
	return target
func AddHelpThing(parent,position,ItemInfo):
	var target = instance_scene(HelpThing,parent)
	target.ItemInfo = ItemInfo
	target.position = position
	return target
func AddPj(parent,position,Num):
	var target = instance_scene(Pj,parent)
	target.Num = Num
	target.position = position
	return target
func AddLevelInfo(parent,Name,position,path):
	var target = instance_scene(LevelInfo,parent)
	target.LevelName = Name
	target.TargetStagePath = path
	target.position = position
	return target
func AddMonsterHead(parent,Name,IsBoss):
	var target = instance_scene(MonsterHead,parent)
	target.MonsterName = Name
	target.IsBoss = IsBoss
	return target
func AddLevelFallBox(parent,Inldl,Inhhgz,Name,qh_level,wx,EqProp):
	var target = instance_scene(LevelFallBox,parent)
	target.is_in_ldl_gz = Inldl
	target.is_in_hhgz = Inhhgz
	target.is_in_hhgz = Inhhgz
	target.qh_level = qh_level
	target.wx = wx
	target.EQ_prop = EqProp
	return target
func AddItemBox(parent,Inldl,Inhhgz,Name,qh_level,num,wx,EqProp):
	var target = instance_scene(LevelFallBox,parent)
	target.is_in_ldl_gz = Inldl#是否在炼丹炉
	target.is_in_hhgz = Inhhgz#是否在炼丹炉
	target.qh_level = qh_level#强化等级
	target.total_number = num#数量
	target.wx = wx#五行
	target.EQ_prop = EqProp#属性
	return target

func addGameNeedKnow(parent,position):
	var target = instance_scene(GameNeedKnow,parent)
	target.position = position
	return target
func addRoleMagicNeed(parent,position,name_,Old,New):
	var target = instance_scene(RoleMagicNeed,parent)
	target.position = position
	target.Skill_name = name_
	target.CurrentNeed = Old
	target.NextNeed = New
	return target
func addNewBullet(parent,position,Dir,name_,Dic):
	var target = instance_scene(NewBullet,parent)
	target.position = position
	target.name_ = name_
	target.HitDic = Dic
	target.Direction = Dir
	return target
func addSMBEffect(parent,position,Dir):
	var target = instance_scene(SMBEffect,parent)
	target.position = position
	target.Dir = Dir
	return target
func addRole2Shallow(parent,position,Dir):
	var target = instance_scene(Role2Shallow,parent)
	target.position = position
	target.Dir = Dir
	return target
func addRoleSpecialEffect_(parent,position,Dir,name_):
	var target = instance_scene(RoleSpecialEffect_,parent)
	target.position = position
	target.SpecialEffectName = name_
	target.Dir = Dir
	return target
func addRoleBullet_(parent,position,Dir,name_,Dic):
	var target = instance_scene(RoleBullet_,parent)
	target.position = position
	target.name_ = name_
	target.HitDic = Dic
	target.Direction = Dir
	return target
func AddChoosePlayer(parent,position_):
	var target = instance_scene(ChoosePlayer,parent)
	target.position = position_
	return target
func AddMonster65Bullet(parent,position_):
	var target = instance_scene(Monster65Bullet,parent)
	target.position = position_
	return target
func AddAura(parent,position_,Value):
	var target = instance_scene(Aura_,parent)
	target.Value = Value
	target.position = position_
	return target
func AddBuffinfor(parent,position_,Data):
	var target = instance_scene(Buffinfor,parent)
	target.DataList = Data
	target.position = position_
	target.z_index = 99
	return target
func AddBuffIcon(parent,Data):
	var target = instance_scene(BuffIcon_,parent)
	target.DataList = Data
	return target
func AddBuff(parent,BuffInfo):
	var Target = parent.get_parent()
	if Target is BaseObject:
		if Target.NoDeBuff:#无视负面
			if BuffInfo.has("DeBuff"):
				if BuffInfo["DeBuff"]:
					return
	var target = instance_scene(BaseBuff_,parent)
	target.BuffInfo = BuffInfo
	return target
func addAfterLevelEnd(parent,position):
	var target = instance_scene(AfterLevelEnd,parent)
	target.position = position
	return target
func addCombo(parent,ComboNum_,position):
	var target = instance_scene(Combo,parent)
	target.ComboNum = ComboNum_
	target.position = position
	return target
func addComboNum(parent,ComboNum_):
	var target = instance_scene(ComboNum,parent)
	target.ComboNum = ComboNum_
	return target
func addZLw_stage(parent,position,Speed,Dir,Max,PD):
	var target = instance_scene(ZLw_stage,parent)
	target.position = position
	target.Direction = Dir
	target.Speed = Speed
	target.MaxPosition_x = Max
	target.PD = PD
	return target
func addHHjm(parent,position):
	var target = instance_scene(HHjm,parent)
	target.position = position
	return target
func addChangeClothesJm(parent,position,name_,Transmogrified_):
	var target: ChangeClothesjm = instance_scene(ChangeClothesJm,parent)
	target.position = position
	target.SelfName_ = name_
	target.Transmogrified_ = Transmogrified_
	return target
func addMissEffect(parent,position):
	var target = instance_scene(MissEffect,parent)
	target.position = position
	return target
func addDamageNumber(parent,value,Type,is_crit,tar):
	var target = instance_scene(DamageNumber,parent)
	target.target = tar
	target.is_crit = is_crit
	target.Type = Type
	target.need_number = value
	return target
func addDamageText(parent,position,value,Type,is_crit,tar):
	var target = instance_scene(DamageText,parent)
	target.target = tar
	target.position = position
	target.Type = Type
	target.Number = value
	target.is_crit = is_crit
	return target
func addRole1Shallow(parent,position,dir,int_action):
	var target = instance_scene(Role1Shallow,parent)
	target.position = position
	target.iniaction = int_action
	target.direction = dir
	return target
func addRoleBullet_1(parent,position,name_,Dic):
	var target = instance_scene(RoleBullet_1,parent)
	target.position = position
	target.name_ = name_
	target.HitDic = Dic
	return target
func addSkillKeySet(parent,position,name_):
	var target = instance_scene(SkillKeySet,parent)
	target.position = position
	target.need_name = name_
	return target
	
func Add_GameSet_(parent,position):
	var target = instance_scene(GameSet_,parent)
	target.position = position
	return target
func addBGM_(parent,target_):
	var target = instance_scene(BGM_,parent)
	target.target = target_
	return target
func Add_Mosaic_(parent,position):
	var target = instance_scene(Mosaic_,parent)
	target.position = position
	return target
	
func addSound_(parent,target_):
	var target = instance_scene(Sound_,parent)
	target.target = target_
	return target
func addMagicHelp(parent,position):
	var target = instance_scene(MagicHelp,parent)
	target.z_index = 99
	target.position = position
	return target
func addUseMagicWeapon(parent,position):
	var target = instance_scene(UseMagicWeapon,parent)
	target.z_index = 99
	target.position = position
	return target
func addSkillSelect(parent,position,name_):
	var target = instance_scene(SkillSelect,parent)
	target.wp_name = name_
	target.position = position
	return target
func addWeaponBullet_(parent,position,name_,List,dir,Rand):
	var target = instance_scene(addWeaponBullet,parent)
	target.objattackDic = List
	target.Rnd = Rand
	target.name_ = name_
	target.dir = dir
	target.position = position
	return target
func addMagicWeapon(parent,name_,position):
	var target
	match name_:
		"dshl":
			target = instance_scene(Cucurbit_,parent)
		"tsgj":
			target = instance_scene(Sword_,parent)
		"bsyj":
			target = instance_scene(Mirror_,parent)
		"lsys":
			target = instance_scene(MagicUnmbrella,parent)
		"xhmt":
			target = instance_scene(GhostDoll_,parent)
		"xhhl":
			target = instance_scene(Curbit,parent)
		"kyl":
			target = instance_scene(Hybrofoline_,parent)
		"qyj":
			target = instance_scene(CloudSword_,parent)
		"zjfyd":
			target = instance_scene(PurpleGoldBell_,parent)
		"zjhl":
			target = instance_scene(PurpleGlodCucurbit_,parent)
		"jcld":
			pass
	target.position = position
	return target
func AddMessageShow(Parent,NeedText: String,Time_: float,Position: Vector2):
	var target = instance_scene(MessageShow,Parent)
	target.z_index = 999
	target.position = Position
	target.ShowText = NeedText
	target.LastTime = Time_
	return target
func add_WS_Effect(parent):
	var target = instance_scene(WS_Effect,parent)
	return target
func add_Choose_Item(parent,position,List,name_,page):
	var target = instance_scene(Choose_Item,parent)
	target.name_ = name_
	target.page_ = page
	target.list_ = List
	target.z_index = 99
	target.position = position
	return target
func add_s_y_nHelp(parent,position):
	var target = instance_scene(ldl_help,parent)
	target.z_index = 99
	target.position = position
	return target
func add_SHOP(parent,position):
	var target = instance_scene(SHop,parent)
	target.z_index = 99
	target.position = position
	return target
func add_shop_items(parent,position,name_: String,need_):
	var target = instance_scene(shop_ttems,parent)
	target.position = position
	target.item_name_ = name_
	target.need_lh = int(need_)
	return target
func add_magp_infor(parent,position):
	var target = instance_scene(magp_infor,parent)
	target.position = position
	return target
func add_Synthesis(parent,position):
	var target = instance_scene(synthesis,parent)
	target.position = position
	return target
func add_change_bg(parent,position):
	var target = instance_scene(change_background,parent)
	target.position = position
	return target
func add_strength(parent,position):
	var target = instance_scene(qh_jm,parent)
	target.position = position
	return target
func create_hands(parent,direction,position):
	var target = instance_scene(nmw_hands,parent)
	target.position = position
	target.mr_ani.flip_h = direction
	return target
	
func CallChaseBullet(parent,name_,speed,time:float,dir,position,hit_name,dic):
	var target = instance_scene(ChaseBullet_,parent)
	target.chase_ani.flip_h = dir
	target.name_ = name_
	target.speed_ = speed
	target.time_ = time
	target.position = position
	target.AttList = dic
	target.hit_name = hit_name
	return target	
	
func CallFlyBullet(parent,name_,dir,position,distance,speed,hit_name,dic):
	var target = instance_scene(FlyBullet,parent)
	target.name_ = name_
	target.speed_ = speed
	target.direction_ = dir
	target.distance = distance
	target.position = position
	target.AttList = dic
	target.hit_name = hit_name
	return target
func add_LJ(parent,position_):
	var target = instance_scene(lj,parent)
	target.z_index = 99
	target.position = position_
	return target
func add_Trap(parent,position_,name_):
	var target = instance_scene(Trap_,parent)
	target.z_index = 99
	target.get_name_ = name_
	target.position = position_
	return target
func add_BuffIcon(parent,text_):
	var target = instance_scene(BuffIcon,parent)
	target.z_index = 99
	target.texture_ = text_
	return target

func add_SpecialEffect(parent,position_,name_,scale_,direction,speed_):
	var target = instance_scene(SpecialAffect,parent)
	target.z_index = 99
	target.Effect_name = name_
	target.scale_ = scale_
	target.Effect_speed = speed_
	target.Effect_dir = direction
	target.position = position_
	return target
func add_choose_text(parent,position_,text_,calm_time):
	var target = instance_scene(choose_text,parent)
	target.z_index = 99
	target.position = position_
	target.my_text = text_
	target.calm_time = calm_time
	return target
func add_SpecialEffectBullet(parent,position_,scale_,name_,dir):
	var target = instance_scene(SpecialEffectBullet,parent)
	target.z_index = 99
	target.position = position_
	target.scale_ = scale_
	target.dire = dir
	target.action_name = name_
	return target
func add_role_information(parent,position):
	var target = instance_scene(role_information,parent)
	target.z_index = 99
	target.position = position
	buff_box = target.buff_box
	return target
func add_learn_skill(parent,position):
	var target = instance_scene(Skill_learn,parent)
	target.z_index = 99
	target.position = position
	return target
func add_zd_skillscene(parent,position):
	var target = instance_scene(zd_skill,parent)
	target.z_index = 99
	target.position = position
	return target
	
func add_bd_skillscene(parent,position):
	var target = instance_scene(bd_skill,parent)
	target.z_index = 99
	target.position = position
	return target
func add_gm_infor(parent,position):
	var target = instance_scene(Game_information,parent)
	target.z_index = 99
	target.position = position
	return target

func add_ldl(parent,position):
	var target = instance_scene(ldl,parent)
	target.z_index = 99
	target.position = position
	return target
func add_pl_sell(parent,position):
	var target = instance_scene(pl_sell,parent)
	target.z_index = 99
	target.position = position
	return target
func fall_item(parent,position,name_,value_):
	var target = instance_scene(fall_equ,parent)
	target.position = position
	target.item_name = name_
	target.num_ = value_
	return target
func add_dj_infor(parent,position,name_):
	var target = instance_scene(dj_infor,parent)
	target.my_name = name_
	target.z_index = 99
	target.position = position
	return target
func add_dj_sell(parent,position,name_,page_):
	var target = instance_scene(dj_sell,parent)
	target.my_page = page_
	target.my_name = name_
	target.z_index = 99
	target.position = position
	return target
func get_parent_(self_,times):
	var i = 0
	while i < times:
		self_ = self_.get_parent()
		i = i + 1
	return self_
func add_equ_propeties_box(parent,position,name_,qh_level,wx,Data):
	var target = instance_scene(equ_propeties_box,parent)
	target.z_index = 199
	target.qh_level = qh_level
	target.nam = name_
	target.wx = wx
	target.EQ_prop = Data
	target.position = position
	return target
func add_se_eq_jm(parent,position,name_,page_,number_):
	var target = instance_scene(sell_or_equ,parent)
	target.page = page_
	target.number = number_
	target.get_name_ = name_
	target.z_index = 99
	target.position = position
	return target
func add_mainBackpack(parent,position):
	var target = instance_scene(main_backpack,parent)
	target.position = position
	return target

func change_secen(target):
	target_scene = target
	get_tree().change_scene_to_file("res://Scene/OtherScene/load_scene.tscn")
func add_music_set(parent,position):
	var target = instance_scene(music_set,parent)
	target.position = position
	return target

func add_Camera(parent,position,right):
	var target = instance_scene(mycamera,parent)
	target.position = position
	target.max_right = right
	return target
func call_hero(who: String,parent,position: Vector2,_dir: bool):
	var target:BaseHero
	if who == "role_1":
		target = instance_scene(load("res://Scene/Hero/Role_1/Role1.tscn"),parent)
	elif who == "role_2":
		target = instance_scene(load("res://Scene/Hero/Role_2/Role_2.tscn"),parent)
	elif who == "role_3":
		target = instance_scene(load("res://Scene/Hero/Role_3/Role_3.tscn"),parent)
	elif who == "role_4":
		target = instance_scene(load("res://Scene/Hero/Role_4/Role_4.tscn"),parent)
	elif who == "role_5":
		target = instance_scene(load("res://Scene/Hero/Role_5/Role_5.tscn"),parent)
	target.position = position
	get_player = target
	return target
func add_set_menu(parent,position):
	var target = instance_scene(set_menu,parent)
	target.position = position
	return target

func add_cd_jm(parent,position):
	var target = instance_scene(cd_jm,parent)
	target.position = position
	return target

func add_moment_text(parent,position,text,last_time):
	var target = instance_scene(moment_texxt,parent)
	target.position = position
	target.show_text = text
	target.last_time = last_time
	target.z_index = 99
	return target
func add_touch_text(parent,position,text):
	var target = instance_scene(touch_text,parent)
	target.position = position
	target.z_index = 99
	target.tt = text
	return target
func add_back_pack(parent,position):
	var target = instance_scene(back_pack,parent)
	target.position = position
	target.z_index = 10
	return target
func Create_Monster(M_id: int,parent,position_: Vector2):
	var target = instance_scene(load("res://Scene/Monster/Monster_" + str(M_id) + ".tscn"),parent)
	target.position = position_
	return target
func add_hit_text(parent,position_,value,lx,crit,miss):
	var target = instance_scene(hit_text,parent)
	target.show_lx = str(lx)
	target.is_crit = crit
	target.is_miss = miss
	target.show_text = value
	target.position = position_
	return target

func add_monster_blood(parent,position_,value,text):
	var target = instance_scene(monster_blood,parent)
	target.bar_value = value
	target.bar_text = text
	target.position = position_
	return target

func add_mr_hurt(parent,position_):
	var target = instance_scene(monster_be_hit,parent)
	target.position = position_
	return target




func instance_scene(target_scene_,parent):
	var target = target_scene_.instantiate()
	parent.add_child(target)
	return target

func add_Bullet(bullet_name:String,parent,direction: bool,show_speed,position,hit_name_,list):
	var target = instance_scene(bullet,parent)
	target.AttList = list
	target.hit_name = hit_name_
	target.position = position
	target.dir = direction
	target.skill_name = bullet_name
	target.speed = show_speed
	return target
func main_remove_child(parent,node_name):
	parent.remove_child(get_node(node_name))
	
func _physics_process(_delta: float) -> void:
	if MainSet.set_data.has("FileValue"):
		if float(MainSet.set_data["FileValue"]) < float(FileNum):
			MainSet.set_data["FileValue"] = FileNum
	if BoxCount > 0:
		BoxCount -= 1
	lj_count += 1
	if lj_count > 100:
		LJ_times = 0
func GetPositionBetween(Ob_1,Ob_2):
	if Ob_1 == null or Ob_2 == null:
		return Vector2(0,0)
	var pp_1 = Ob_2.position.x - Ob_1.position.x
	var pp_2 = Ob_2.position.y - Ob_1.position.y
	if pp_1 == 0 or pp_2 == 0:
		return Vector2(0,0)
	var pp_3 = sqrt(pp_1 * pp_1 + pp_2 * pp_2 )
	var pp_4: Vector2 = Vector2(pp_1 / pp_3, pp_2 / pp_3)
	return pp_4
func GetDisBetweem(Ob_1,Ob_2):
	if Ob_1 == null or Ob_2 == null:
		return 0
	var pp_1 = Ob_2.position.x - Ob_1.position.x
	var pp_2 = Ob_2.position.y - Ob_1.position.y
	var pp_3 = sqrt(pp_1 * pp_1 + pp_2 * pp_2 )
	return pp_3
func LoadRole1Body(name_):
	var Information
	Information = load("res://Art/HeroPicture/Role" + str(int(PlayerData.player_data["Myself"])) + "AllEquipment/Role_" + str(int(PlayerData.player_data["Myself"])) + "_Body_" + str(name_) + ".png")
	return Information
func LoadRole1EQ(name_):
	var Information
	Information = load("res://Art/HeroPicture/Role" + str(int(PlayerData.player_data["Myself"])) + "AllEquipment/Role_" + str(int(PlayerData.player_data["Myself"])) + "_Eq_" + str(name_) + ".png")
	return Information
func get_wx(num):
	var wx = {"金":false,"木":false,"水":false,"火":false,"土":false}
	var rr = randi_range(0,100)
	if num == 0:
		randomize()
		if rr <= 4:
			var wx_lst = ["金","木","水","火","土"]
			var aa = randi_range(0,4)
			var wx_1 = wx_lst[aa]
			wx_lst.erase(wx_1)
			var bb = randi_range(0,3) 
			var wx_2 = wx_lst[bb]
			wx_lst.erase(wx_2)
			var cc = randi_range(0,2) 
			var wx_3 = wx_lst[cc]
			wx[wx_1] = true
			wx[wx_2] = true
			wx[wx_3] = true
			var new_list = []
			for i in wx:
				if wx[i]:
					new_list.push_back(i)
			return new_list
		elif rr > 4 and rr < 10 :
			var wx_lst = ["金","木","水","火","土"]
			var aa = randi_range(0,4)
			var wx_1 = wx_lst[aa]
			wx_lst.erase(wx_1)
			var bb = randi_range(0,3) 
			var wx_2 = wx_lst[bb]
			wx[wx_1] = true
			wx[wx_2] = true
			var new_list = []
			for i in wx:
				if wx[i]:
					new_list.push_back(i)
			return new_list
		else:
			var new_list = []
			var wx_lst = ["金","木","水","火","土"]
			var aa = randi_range(0,4)
			new_list.push_back(wx_lst[aa])
			return new_list
	elif num == 1:
			var new_list = []
			var wx_lst = ["金","木","水","火","土"]
			var aa = randi_range(0,4)
			new_list.push_back(wx_lst[aa])
			return new_list
	elif num == 2:
			var wx_lst = ["金","木","水","火","土"]
			var aa = randi_range(0,4)
			var wx_1 = wx_lst[aa]
			wx_lst.erase(wx_1)
			var bb = randi_range(0,3) 
			var wx_2 = wx_lst[bb]
			wx[wx_1] = true
			wx[wx_2] = true
			var new_list = []
			for i in wx:
				if wx[i]:
					new_list.push_back(i)
			return new_list
	elif num == 3:
			var wx_lst = ["金","木","水","火","土"]
			var aa = randi_range(0,4)
			var wx_1 = wx_lst[aa]
			wx_lst.erase(wx_1)
			var bb = randi_range(0,3) 
			var wx_2 = wx_lst[bb]
			wx_lst.erase(wx_2)
			var cc = randi_range(0,2) 
			var wx_3 = wx_lst[cc]
			wx[wx_1] = true
			wx[wx_2] = true
			wx[wx_3] = true
			var new_list = []
			for i in wx:
				if wx[i]:
					new_list.push_back(i)
			return new_list
func CheckDirBetweenTwoObj(Player: BaseHero,Monster: BaseMonster):#获取玩家面对的方向是否包含怪物
	if Player.position.x >= Monster.position.x:
		if not Player.PlayerDir:
			return true
	elif Player.position.x < Monster.position.x:
		if Player.PlayerDir:
			return true
	return false
func removeAllBuff():
	Global.is_Mpo = false
	Global.is_ice = false
	Global.is_poision = false
	Global.is_Fire = false
	Global.is_speed_down = false
	Global.is_stun = false
	Global.is_Bleed = false
	Global.is_EyeFix = false
	Global.is_DeadLink = false
	RoleProp.ws_value = 0
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc
func ADDAllItemNum(List,Num,NumRange):#物品列表，使用数目，每个物品随机数，根据列表返回列表内每项物品应分配的数量
	randomize()
	var Dic = {}
	for i in List:
		Dic[i] = {"Name": i,"Num": 0}
	for i in range(Num):
		var Name = List[randi_range(0,List.size() - 1)]
		Dic[Name]["Num"] += NumRange
	var List_ = []
	for i in Dic:
		if int(Dic[i]["Num"]) == 0:
			List_.push_back(i)
	for i in List_:
		Dic.erase(i)
	for i in Dic:
		var num = Dic[i]["Num"]
		PlayerData.add_dj(i,num)
	
	
	return Dic
func GetAllItemNum(List,Num,NumRange):#物品列表，使用数目，每个物品随机数，根据列表返回列表内每项物品应分配的数量
	randomize()
	var Dic = {}
	for i in List:
		Dic[i] = {"Name": i,"Num": 0}
	for i in range(Num):
		var Name = List[randi_range(0,List.size() - 1)]
		Dic[Name]["Num"] += NumRange
	var List_ = []
	for i in Dic:
		if int(Dic[i]["Num"]) == 0:
			List_.push_back(i)
	for i in List_:
		Dic.erase(i)
	for i in Dic:
		var Name = i
		var Num_ = Dic[i]["Num"]
		Dic[i] = {"Name": Name,"Value": Num_,"Prop":{},"WX":[],"StrengthValue":0}
	var ll = []
	for i in Dic:
		ll.push_back(Dic[i])
	return ll
func RemoveAllBuff():
	for i in RoleProp.SourcePlayer.buff.get_children():
		if i != null:
			if i.BuffInfo["AddTime"] < 999:
				if i.BuffInfo.has("CanRemove"):
					if i.BuffInfo["CanRemove"]:
						i.queue_free()
				else:
					i.queue_free()
func RemoveAAllBuff():
	for i in RoleProp.SourcePlayer.buff.get_children():
		if i != null:
			match i.BuffInfo["Name"]:
				"DoubleFallPro":
					continue
			i.queue_free()
func OnFresh():
	var Dic = Time.get_datetime_dict_from_system()
	var MyDic = PlayerData.player_data["MyTime"]#最后储存的时间
	if MyDic == {}:
		return
	if int(Dic["year"]) < int(MyDic["year"]):
		return false
	elif int(Dic["year"]) > int(MyDic["year"]):
		return true
	else:
		if int(Dic["month"]) < int(MyDic["month"]):
			return false
		elif int(Dic["month"]) > int(MyDic["month"]):
			return true
		else:
			if int(Dic["day"]) < int(MyDic["day"]):
				return false
			elif int(Dic["day"]) > int(MyDic["day"]):
				return true
			else:
				return false
func CheckWD(OBJ: BaseObject):
	var Count : int = 0
	for i in OBJ.buff.get_children():
		if i != null:
			if i.BuffInfo["Name"] == "Voodoo":
				Count += 1
	return Count
func RemoveWD(OBJ: BaseObject):
	for i in OBJ.buff.get_children():
		if i != null:
			if i.BuffInfo["Name"] == "Voodoo":
				i.queue_free()
func GetName(Name:String):
	if Name.get_slice("shishi",1) != Name:
		return Name.get_slice("shishi",1)
	elif Name.get_slice("youxiu",1) != Name:
		return Name.get_slice("youxiu",1)
	elif Name.get_slice("jingliang",1) != Name:
		return Name.get_slice("jingliang",1)
	elif Name.get_slice("putong",1) != Name:
		return Name.get_slice("putong",1)
	return Name
func NormalFacePlayer(OBJ,dir,Player):
	if dir:
		OBJ.look_at(Player.position)
	else:
		OBJ.look_at(Player.position)
		OBJ.bullet_ani.flip_v = true
		
