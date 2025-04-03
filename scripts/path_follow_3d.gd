extends PathFollow3D

var speed = 4  # Adjust this to control how fast it moves along the path

func _process(delta):
	# Move along the path by increasing progress
	progress += speed * delta

	# Clamp progress to ensure it never exceeds 1.0
	if progress >= 27.0:
		progress = 27.0
