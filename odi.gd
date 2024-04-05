extends CharacterBody2D

@onready var animator = get_node("AnimationPlayer")
@onready var x_scale = get_node("body").scale.x
const SPEED = 300.0
const JUMP_VELOCITY = -600.0
var interactable_objects = ["Monitor"] # need to move this to a global script later maybe? 

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animator.play("idle")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animator.play("walk")
		if direction < 0:
			get_node("body").scale.x = x_scale
		elif direction > 0:
			get_node("body").scale.x = -x_scale
	else:
		animator.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_interaction_range_body_entered(body):
	print(body.name)
	if body.name in interactable_objects:
		print("press E to interact with " + body.name)
