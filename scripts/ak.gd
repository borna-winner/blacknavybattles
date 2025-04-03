extends Node3D

@onready var bullet_scene = preload("res://scenes/bullet.tscn")  # Path to the Bullet scene
@onready var raycast: RayCast3D = $ForwardRaycast  # Make sure the path is correct

func _ready():
	if raycast == null:
		print("RayCast3D node not found!")
	else:
		print("RayCast3D node successfully loaded!")

func _process(_delta: float):
	# Check if the RayCast3D is initialized and enabled
	if raycast and raycast.is_enabled():
		# Perform raycast to detect the target
		if raycast.is_colliding():
			var hit_target = raycast.get_collider()  # Get the object the raycast hit

			if hit_target:
				print("Target detected: ", hit_target.name)
				fire_bullet(hit_target)

func fire_bullet(hit_target: Node3D):
	var bullet = bullet_scene.instantiate()  # Create a new Bullet instance

	# Set bullet properties
	bullet.damage = 1.0
	bullet.speed = 1.0
	bullet.target = hit_target

	# Position the bullet at the shooter's location
	bullet.global_position = global_position
	get_tree().current_scene.add_child(bullet)  # Add the bullet to the scene
	print("Bullet fired at: ", hit_target.name)
