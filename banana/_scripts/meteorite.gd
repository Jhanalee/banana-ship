extends RigidBody2D
@onready var player = %Player
@export var angular_vel : float
@export var max_linear_vel : float
# Called when the node enters the scene tree for the first time.
func _init_(pos : Vector2) -> void:
	position = pos
func _ready() -> void:
	angular_velocity = randf() * randf_range(-1, 1) * angular_vel
	linear_velocity = Vector2.from_angle(randf_range(0, 2*PI)) * max_linear_vel
	
	
func _process(delta: float) -> void:
	if !player: return
	if position.distance_to(player.position) > 3000:
		queue_free()
