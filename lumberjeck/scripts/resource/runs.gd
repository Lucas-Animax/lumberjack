extends Node2D

@export var player_ref:Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AnimationTrasition.open_trasition = true
	if Global.from_word != null:
		player_ref.global_position = get_node(Global.from_word + "Poss").position
		
