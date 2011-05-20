var coinPrefab : GameObject;

function Update () {
	if (Input.GetButtonDown("Fire1")) {
		var pos = transform.position;
		pos += Vector3.right * Mathf.Sin(Time.time * 9.0) * 1.5;
		Instantiate(coinPrefab, pos, Random.rotation);
	}
}