#pragma strict

function Update (){
	transform.rotation *= Quaternion.AngleAxis(9.0 * Time.deltaTime, Vector3.up);
	transform.rotation *= Quaternion.AngleAxis(3.1 * Time.deltaTime, Vector3.right);
	transform.rotation *= Quaternion.AngleAxis(1.1 * Time.deltaTime, Vector3.forward);
}
