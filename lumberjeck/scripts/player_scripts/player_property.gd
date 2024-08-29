extends CharacterBody2D
class_name PlayerProperty

@export_category("Objects")
@export var spr:Sprite2D
@export_category("Variebles")
@export var life:float
@export var speed:int
@export var strength:float

var in_attack:bool = false


const INTERPOLATION = 0.5

func _physics_process(_delta: float) -> void:
	if check_inputs():
		moving()
		move_and_slide()
	spr.animation_player(velocity)
	inputs()

	pass

func moving():
	var direction:Vector2 = Vector2(
		Input.get_axis("move_left","move_right"),
		Input.get_axis("move_up","move_down")
	)
	if direction != Vector2.ZERO:
		velocity.x = lerp(velocity.x,speed * direction.x,0.5)
		velocity.y = lerp(velocity.y,speed * direction.y,0.5)
	else:
		velocity.x = move_toward(velocity.x,0,speed)
		velocity.y = move_toward(velocity.y,0,speed)


	pass

func check_inputs() -> bool:
	if in_attack:
		return false
	else:
		return true

func inputs():
	if Input.is_action_just_pressed("attack") and not in_attack:
		in_attack = true
	pass
