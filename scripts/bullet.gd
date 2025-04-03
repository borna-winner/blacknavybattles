extends Node3D

# Default values for the projectile
@export var damage: float = 10.0   # Default damage
@export var speed: float = 20.0    # Default speed (units per second)
@export var target: Node3D = null  # Default target node for the projectile (this could be an enemy or specific position)

# Internal variables
var direction: Vector3 = Vector3.ZERO

# Called when the bullet is created/shot
func _ready():
	if target:
		# Calculate the direction from the bullet to the target
		direction = (target.position - global_position).normalized()

# Called every frame to update the bullet's position
func _process(delta: float):
	if target:
		# Move the bullet towards the target
		global_position += direction * speed * delta
		# Optionally, you could add a check here to destroy the bullet once it reaches the target
		if global_position.distance_to(target.position) < 1.0:  # Adjust the threshold as needed
			_hit_target()

# Handle the projectile hitting a target
func _hit_target():
	if target:
		# You can apply damage or any other effect when the bullet hits the target
		if target.has_method("take_damage"):
			target.take_damage(damage)
	queue_free()  # Destroy the bullet after hitting the target
