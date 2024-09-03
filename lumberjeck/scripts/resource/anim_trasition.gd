extends CanvasLayer
class_name AnimationTrasition

@export_category("Objects")
@export var anim:AnimationPlayer

static var open_trasition:bool = false
static var close_trasition:bool = false

func _physics_process(_delta: float) -> void:
	if close_trasition:
		func_close_trasition()
	if open_trasition:
		func_open_trasition()


	pass

func func_open_trasition():
	anim.play("open_transition")

func func_close_trasition():
	anim.play("close")

func _on_animation_player_animation_finished(anim_name:StringName) -> void:
	match anim_name:
		"close":
			close_trasition = false
		"open_transition":
			open_trasition = false
	pass # Replace with function body.
