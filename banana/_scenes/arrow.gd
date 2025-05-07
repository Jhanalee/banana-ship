extends Sprite2D

@onready var player = %Player
@onready var earth = $"../Earth"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation = player.position.direction_to(earth.position).angle() + PI/2
	position = player.position + 200*player.position.direction_to(earth.position)
