extends CharacterBody2D

@export var speed := 200.0

func _physics_process(delta):
	var direction = Vector2.ZERO

	# Movimento horizontal
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1

	# Movimento vertical
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	# Normaliza para não andar mais rápido na diagonal
	direction = direction.normalized()

	velocity = direction * speed
	move_and_slide()
