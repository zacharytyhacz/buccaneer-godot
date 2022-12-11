extends Spatial

signal clicked(enemy)

func _ready():
    print("I am an enemy.")

func _on_input_event(camera, event, position, normal, shape_idx):
    var mouse_click = event as InputEventMouseButton
    if mouse_click and mouse_click.button_index == 1 and mouse_click.pressed:
        emit_signal("clicked", self)
