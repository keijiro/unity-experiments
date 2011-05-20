function FixedUpdate () {
	var z : float = Mathf.Sin(Time.time * 1.8) * 0.8 + 1.5;
	rigidbody.MovePosition(Vector3(0, 0.25, z));
}
