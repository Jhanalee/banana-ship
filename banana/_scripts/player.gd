extends RigidBody2D
signal win
signal health_change(health : int)
signal ded
@export var max_health : float
var health : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = max_health
	health_change.emit(health)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player": return
	elif body.name == "Earth":
		win.emit()
	else:
		health-=15
		health_change.emit(health)
		if health <= 0:
			ded.emit()
