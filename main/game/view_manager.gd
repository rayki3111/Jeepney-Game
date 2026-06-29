extends Node2D

@onready var driver_view: Camera2D = $DriverView/Camera2D
@onready var passenger_view: Camera2D = $PassengerView/Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#driver_view.make_current()
	#$DriverView.change_view.connect(switch_view)
	#$PassengerView.change_view.connect(switch_view)

func switch_view(current_view: String) -> void:
	if current_view == "driver":
		passenger_view.make_current()
		GameManager.current_view = "passenger"
		print("change to passenger")
	elif current_view == "passenger":
		driver_view.make_current()
		GameManager.current_view = "driver"
		print("change to driver")
