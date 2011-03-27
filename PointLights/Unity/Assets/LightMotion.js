private var origin : Vector3;
private var xcycle : float;
private var zcycle : float;

function Awake() {
	origin = transform.position;
	xcycle = Random.Range(1.0, 4.0);
	zcycle = Random.Range(1.0, 4.0);
}

function Update() {
	var dx = 2.0 * Mathf.Sin(xcycle * Time.time);
	var dz = 2.0 * Mathf.Sin(zcycle * Time.time);
	transform.position = origin + Vector3(dx, 0, dz);
}
