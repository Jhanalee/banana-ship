extends Control

@onready var player = %Player
@onready var player_cord_text = $player_cord_text
@onready var health_bar : ProgressBar = $HealthBar
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	$Label.text = "distance: " + String.num(player.position.distance_to($"../../Earth".position)/100, 0)
