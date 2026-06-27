extends Node2D

@onready var windshield_view: Node2D = $ViewManager/WindshieldView
@onready var passenger_view: Node2D = $ViewManager/PassengerView

@onready var camera_1: Camera2D = $ViewManager/WindshieldView/Camera2D
@onready var camera_2: Camera2D = $ViewManager/PassengerView/Camera2D


var show_windshield_view: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	passenger_view.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		global_position = event.screen_relative


func _on_button_pressed() -> void:
	show_windshield_view = !show_windshield_view
	
	if show_windshield_view:
		windshield_view.visible = true
		passenger_view.visible = false
		camera_1.make_current()
	else:
		windshield_view.visible = false
		passenger_view.visible = true
		camera_2.make_current()
