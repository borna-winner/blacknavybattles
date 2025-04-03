extends MeshInstance3D

@onready var forward_raycast: RayCast3D = $ForwardRaycast
@export var bullet_scene: PackedScene  # Assign your Bullet scene in the Inspector
@export var shoot_cooldown: float = 0.5  # Time between shots in seconds
var time_since_last_shot: float = 0.0

func _process(delta):
	time_since_last_shot += delta

	# Check if the raycast is colliding with an object
	if forward_raycast and forward_raycast.is_enabled():
		if forward_raycast.is_colliding() and time_since_last_shot >= shoot_cooldown:
			var collision_point = forward_raycast.get_collision_point()
			shoot(collision_point)
			time_since_last_shot = 0.0

func shoot(target_position: Vector3):
	var bullet = bullet_scene.instantiate()
	bullet.global_transform = global_transform
	bullet.look_at(target_position, Vector3.UP)
	get_tree().current_scene.add_child(bullet)
	print("Shot fired at position: ", target_position)
