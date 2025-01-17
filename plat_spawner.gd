extends Node

var platfor_scene : PackedScene = preload("res://platform.tscn")
var pool_size : int = 4
var platform_pool : Array =[]
func _ready() -> void:
	for i in range(pool_size):
		var platformTemp : Node2D = platfor_scene.instantiate()
		platformTemp.show()
		platformTemp.platform_size = 3
		platformTemp.set_platform()
		platformTemp.position = Vector2(i*(24*3), 200)
		platform_pool.append(platformTemp)
		add_child(platformTemp)

func _physics_process(_delta: float) -> void:
	if get_node("../player").position.x< -100:
		get_node("../GameOver").game_over()
	for platform in platform_pool:
		if platform.position.x < -200:
			res_plat(platform)
			add_plat()

func create_platform() -> Node2D:
	for platform in platform_pool:
		if not platform.visible:
			return platform as Node2D
	var platform : Node2D = platfor_scene.instantiate()
	platform.hide()
	platform_pool.append(platform)
	add_child(platform)
	return platform

func res_plat(plat: Node2D) -> void:
	plat.global_position = Vector2(-1000, -1000)
	plat.hide()

func add_plat() -> void:
	for platform in platform_pool:
		if not platform.visible:
			var pos: int = platform_pool.find(platform)
			platform.show()
			platform.platform_size = randi_range(3, 5)
			platform.position.y = randi_range(80, 200)
			
			var spawn_x: float
			if pos>0:
				spawn_x = platform_pool[pos-1].global_position.x + (platform_pool[pos-1].platform_size*24) + 80
			else:
				spawn_x = platform_pool[pool_size-1].global_position.x + (platform_pool[pool_size-1].platform_size*24) + 80
			platform.position.x = spawn_x
			platform.set_platform()
			platform.add_coins()
