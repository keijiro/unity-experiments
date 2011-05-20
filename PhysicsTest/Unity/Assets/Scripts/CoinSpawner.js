var coinPrefab : GameObject;

function Update () {
	if (Input.GetButtonDown("Fire1")) {
		Instantiate(coinPrefab);
	}
}