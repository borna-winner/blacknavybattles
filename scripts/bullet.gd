extends Node3D
class_name bullet
var damage: float = 10.0  # Default damage value
var speed: float = 50.0   # Default speed value
var target: Node3D = null  # The target the bullet will hit

func _process(delta: float):
	if target:
		# Move towards the target (simplified movement towards the target)
		var direction = (target.global_position - global_position).normalized()
		global_position += direction * speed * delta
		# Check for collision or any logic to handle when the bullet hits the target
