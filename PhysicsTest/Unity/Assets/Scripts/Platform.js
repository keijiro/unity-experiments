
/*
function FixedUpdate () {
	transform.position.x = Mathf.Sin(Time.time * 2.1) * 1.5;
	transform.position.z = Mathf.Sin(Time.time * 1.7) * 1.5;
	transform.rotation = Quaternion.AngleAxis(Time.time * 30.0, Vector3.up);
}
*/

function FixedUpdate () {
	var x : float = Mathf.Sin(Time.time * 2.1) * 1.5;
	var z : float = Mathf.Sin(Time.time * 1.7) * 1.5;
	rigidbody.MovePosition(Vector3(x, 0.0, z));
	rigidbody.MoveRotation(Quaternion.AngleAxis(Time.time * 30.0, Vector3.up));
}
