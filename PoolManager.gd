# PoolManager.gd
extends Node
# 对象池字典，键为PackedScene的路径，值为该类型对象的数组
var pools = {}

# 创建或扩充池
func create_pool(scene_path: String, _initial_size: int):
   # assert(PackedScene.has(scene_path))
	if not pools.has(scene_path):
		pools[scene_path] = []
	var scene = load(scene_path)
	for i in pools[scene_path].size():#.initial_size:
		var instance = scene.instantiate()
		instance.name = "PooledInstance"
		instance.queue_free() # 预先标记为free，稍后再实际使用时会重新添加到场景
		pools[scene_path].append(instance)

# 从池中获取一个实例
func get_instance(scene_path: String) -> Node:
	if pools.has(scene_path) and pools[scene_path].size() > 0:
		return pools[scene_path].pop_front()
	else:
		var scene = load(scene_path)
		return scene.instantiate()

# 将实例回收到池中
func recycle_instance(scene_path: String, instance: Node):
	if not pools.has(scene_path):
		pools[scene_path] = []
	instance.queue_free() # 从当前场景中移除
	pools[scene_path].append(instance)

