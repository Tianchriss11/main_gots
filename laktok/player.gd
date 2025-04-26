extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
var swing: bool = false

@onready var animation_tree = $AnimationTree

func _physics_process(_delta):
	if not swing:
		velocity = direction * 75
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()

func _process(_delta):
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction != Vector2.ZERO and not swing:
		set_walking(true)
		update_blend_position()
	else:
		set_walking(false)

func set_walking(value):
	animation_tree["parameters/conditions/is_walking"] = value


func update_blend_position():
	animation_tree["parameters/idle/blend_position"] = direction
	animation_tree["parameters/walk/blend_position"] = direction
