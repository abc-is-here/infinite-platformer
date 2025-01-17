extends TileMapLayer

var speed : int = 100
var platform_size : int = 2
@onready var coin : PackedScene = preload("res://coin.tscn")

func set_platform() -> void:
	for i in range(platform_size):
		set_cell(Vector2i(i, 0), 2, Vector2(6,0))

func _physics_process(delta: float) -> void:
	position.x -= speed*delta

func add_coins() -> void:
	for i in platform_size:
		var TempCoin = coin.instantiate()
		TempCoin.position= map_to_local(Vector2i(i, 0)) + Vector2(0, -60)
		add_child(TempCoin)
