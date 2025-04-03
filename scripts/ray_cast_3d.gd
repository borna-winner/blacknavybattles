# Shooter.gd (Object firing the bullet, e.g., Player, Turret, Enemy)
extends Node3D

@onready var bullet_scene = preload("res://scripts/bullet.gd")  # Path to your Bullet scene

var target: Castl  # This is the target for the shooter

# Function to calculate the damage dynamically
func calculate_damage() -> float:
	# Example: Calculate damage based on the shooter's stats (e.g., player level, weapon power)
	return 1.0  # Replace with your own logic for calculating damage

# Function to calculate the speed dynamically
func calculate_speed() -> float:
	# Example: Calculate speed based on the shooter's stats (e.g., weapon type, buffs)
	return 30.0  # Replace with your own logic for calculating speed

# Function to fire a bullet
func fire_bullet():
	if target == null:
		return  # If there's no target, don't fire

	var bullet = bullet_scene.instantiate()  # Create a new Bullet instance

	# Set the bullet's damage, speed, and target based on the shooter's logic
	bullet.damage = calculate_damage()
	bullet.speed = calculate_speed()
	bullet.target = target  # Set the target for the bullet

	# Position the bullet at the shooter's location
	bullet.global_position = global_position
	get_tree().root.add_child(bullet)  # Add the bullet to the scene
