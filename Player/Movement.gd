extends KinematicBody

export var speed = 30
export var de_acceleration = 10
export var acceleration = 10
export var rotation_speed = 0.035

var velocity = Vector3.ZERO

func _ready():
    pass

func _physics_process(delta):
    # camera rotation logic
    var newRotation = rotation

    if Input.is_action_pressed("turn_left"):
        newRotation.y += rotation_speed

    if Input.is_action_pressed("turn_right"):
        newRotation.y -= rotation_speed

    rotation = newRotation

    # move forward / background logic
    var dir = Vector3()

    var transform = get_global_transform()

    if Input.is_action_pressed("move_forward"):
        dir += transform.basis[0]

    if Input.is_action_pressed("move_backward"):
        dir += -transform.basis[0]

    dir.y = 0
    dir = dir.normalized()
    var accel = de_acceleration


    var hv = velocity
    hv.y = 0

    if (dir.dot(hv) > 0):
        accel = acceleration

    var new_pos = dir * speed
    hv = hv.linear_interpolate(new_pos, accel * delta)
    

    velocity.x = hv.x
    velocity.z = hv.z

    velocity = move_and_slide(velocity, Vector3(0, 1, 0))
