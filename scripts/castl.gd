# Castle.gd
extends Node3D
class_name Castl
var max_health = 10

# Add any castle-specific logic here
var health: float = max_health

signal health_changed(new_health: float)

func _ready():
	# Optionally, print the initial health
	print("Castle Health:", health)

func take_damage(amount: float):
	health -= amount
	if health < 0:
		health = 0
	emit_signal("health_changed", health)

func die():
	print("Castle destroyed")
	queue_free()

# Optionally, if you want to constantly print the health every frame (not recommended for performance)
# func _process(delta):
#     print("Current Castle Health:", health)
