function Update() {
	transform.localRotation *= Quaternion.AngleAxis(Time.deltaTime * 30, Vector3.up);
	transform.localRotation *= Quaternion.AngleAxis(Time.deltaTime * 2.3, Vector3.right);
}
