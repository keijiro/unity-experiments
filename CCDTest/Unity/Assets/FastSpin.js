private var velocity : float;

function Start () {
	yield WaitForSeconds(1.0);
	velocity = -30;
}

function FixedUpdate () {
	rigidbody.MoveRotation(rigidbody.rotation * Quaternion.AngleAxis(velocity, Vector3.up));
}
