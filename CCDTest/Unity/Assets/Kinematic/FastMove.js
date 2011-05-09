private var move : boolean;
private var time : float;

function Start () {
	yield WaitForSeconds(1.0);
	move = true;
}

function FixedUpdate () {
	if (move) {
		time += Time.fixedDeltaTime;
		rigidbody.MovePosition(Vector3(Mathf.Cos(time * Mathf.PI * 10) * 10, 1, 5.5));
	}
}
