extends Camera3D

var speed = 5.0

func _process(delta):
	var direction = Vector3.ZERO

	# Move left and right using arrow keys
	if Input.is_action_pressed("ui_left"):
		direction -= transform.basis.x
	if Input.is_action_pressed("ui_right"):
		direction += transform.basis.x

	# Apply movement if there's any input
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		translate(direction * speed * delta)
