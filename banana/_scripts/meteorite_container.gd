extends Node2D

@onready var player = %Player
@export var meteorite_scenes : Array[PackedScene]
var spawn_distance = 2500
var last_player_pos
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	last_player_pos = player.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.position.distance_to(last_player_pos) >= 300:
		_spawn_meteorites()
		last_player_pos = player.position
		
func _spawn_meteorites() -> void:
	var ma = 2
	var i=1
	while i<=ma:
		var dir : Vector2 = player.linear_velocity.normalized()
		dir.rotated(deg_to_rad(randf_range(-40, 40)))
		var distance_offset = randf_range( -400, 400)
		var pos = player.position + dir * (spawn_distance + distance_offset)
		
		_spawn_meteorite(pos)
		i+=1
	
func _spawn_meteorite(pos : Vector2) -> void:
	var meteorite = meteorite_scenes[randi_range(0, meteorite_scenes.size()-1)].instantiate()
	meteorite._init_(pos)
	add_child(meteorite)
