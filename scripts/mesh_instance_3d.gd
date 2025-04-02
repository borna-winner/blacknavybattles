extends MeshInstance3D

@export var castle_node_path: NodePath        # Drag your castle node here in the Inspector
@export var attack_range: float = 20.0           # Distance within which the ship starts shooting
@export var attack_cooldown: float = 1.0         # Time between shots in seconds
@export var bullet_scene: PackedScene          # Assign your Bullet scene here

var time_since_last_attack: float = 0.0

func _process(delta):
	time_since_last_attack += delta

	# Get the castle node and its global position
	var castle = get_node(castle_node_path)
	var castle_pos = castle.global_transform.origin

	# Check the distance from the ship to the castle
	var distance_to_castle = global_transform.origin.distance_to(castle_pos)
	if distance_to_castle <= attack_range and time_since_last_attack >= attack_cooldown:
		summon_bullet(castle_pos)
		time_since_last_attack = 0.0

func summon_bullet(target_position: Vector3):
	# Instantiate the bullet and set its starting transform to the ship's transform
	var bullet = bullet_scene.instantiate()
	bullet.global_transform = global_transform
	# Pass the target position to the bullet (make sure the Bullet script has a "target_position" variable)
	bullet.target_position = target_position
	# Add the bullet to the scene; adjust as necessary if you have a dedicated node for spawned objects
	get_tree().current_scene.add_child(bullet)
