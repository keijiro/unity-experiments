function Update (){
	transform.rotation *= Quaternion.AngleAxis(7.0 * Time.deltaTime, Vector3.up);
	transform.rotation *= Quaternion.AngleAxis(2.1 * Time.deltaTime, Vector3.right);
	transform.rotation *= Quaternion.AngleAxis(0.7 * Time.deltaTime, Vector3.forward);
}
