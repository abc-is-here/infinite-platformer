extends CharacterBody2D

const JUMP_VELOCITY : float = -560.0

func _ready() -> void:
	get_node("AudioStreamPlayer").stream = load("res://assets/audio/run-112647.mp3")
	get_node("AudioStreamPlayer").play()

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("jump")
		get_node("AudioStreamPlayer").stream = load("res://assets/audio/jump-up-245782.mp3")
		get_node("AudioStreamPlayer").play()
		await get_tree().create_timer(1.0).timeout
		$AnimatedSprite2D.play("default")
		get_node("AudioStreamPlayer").stream = load("res://assets/audio/run-112647.mp3")
		get_node("AudioStreamPlayer").play()

	move_and_slide()
