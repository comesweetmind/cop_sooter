extends CharacterBody2D

@onready var animated = $AnimatedSprite2D

const WALK = 100
const RUN = 150
const DASH = 250
const JUMP_VELOCITY = -300
const GRAVITY = 1200

var is_dashing = false
var SPEED = WALK

#enum States {WALK,RUN,DASH}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _physics_process(delta):
	if is_dashing:
		return 
	
	var input_vector = Vector2.ZERO
	
	if Input.is_action_pressed("run"):
		SPEED = RUN
	else :
		SPEED = WALK
		
	if Input.is_action_pressed("walk_left"):
		input_vector.x = -1
	if Input.is_action_pressed("walk_right"):
		input_vector.x = 1
	if Input.is_action_pressed("walk_up"):
		input_vector.y = -1
	if Input.is_action_pressed("walk_down"):
		input_vector.y = 1
		
	

	input_vector = input_vector.normalized()  # Щоб по діагоналі не бігав швидше

	velocity = input_vector * SPEED

	# input_vector.x / y і т.д.

	if input_vector.y < 0:
		animated.play("Walk_top")
	elif input_vector.y > 0:
		animated.play("Walk_bottom")
	elif input_vector.x < 0:
		animated.play("Walk_left")
	elif input_vector.x > 0:
		animated.play("Walk_right")
	else:
		animated.stop()

	if Input.is_action_just_pressed("dash"):
		is_dashing = true
		SPEED = DASH
		animated.play("Dash")


	move_and_slide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_animated_sprite_2d_animation_finished() -> void:
	print("hi")
	is_dashing = false
	animated.play("Idle")
