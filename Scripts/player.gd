class_name Player extends CharacterBody3D

@export var MOVE_SPEED = 4.0
@export var JUMP_HEIGHT = 5.0
@export var GRAVITY = 9.8

var y = 0
var x = 0

func _physics_process(delta: float) -> void:
	x = Input.get_axis("left", "right") * MOVE_SPEED
	
	
	if (Input.is_action_just_pressed("jump") and is_on_floor()):
		y = JUMP_HEIGHT
	elif (not is_on_floor()):
		y += get_gravity().y * delta
	velocity = Vector3(x, y, 0)
	move_and_slide()
