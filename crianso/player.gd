extends CharacterBody2D

@export var speed = 200.0
@export var gravity = 900.0

@onready var anim = $AnimatedSprite2D

func _physics_process(delta):

	# Gravidade
	if not is_on_floor():
		velocity.y += gravity * delta

	# Movimento
	var direction = Input.get_axis("ui_left", "ui_right")

	velocity.x = direction * speed

	# Virar sprite
	if direction > 0:
		anim.flip_h = true
	elif direction < 0:
		anim.flip_h = false

	# Tocar animação
	if direction != 0:
		anim.play("walk")
	else:
		anim.stop()

	move_and_slide()
