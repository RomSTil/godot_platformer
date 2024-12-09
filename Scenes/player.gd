extends CharacterBody2D

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	# Добавляем гравитацию.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Прыжок.
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Движение влево/вправо.
	var direction := Input.get_axis("left", "right")
	if direction != 0:
		velocity.x = direction * SPEED
		$CollisionShape2D/AnimatedSprite2D.flip_h = direction < 0
		$CollisionShape2D/AnimatedSprite2D.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$CollisionShape2D/AnimatedSprite2D.play("idle")

	# Движение персонажа.
	move_and_slide()
