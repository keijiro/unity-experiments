function Update() {
	if (Input.GetButtonDown("Fire1")) {
		var camera = GetComponent(Camera) as Camera;
		if (camera.renderingPath == RenderingPath.Forward) {
			camera.renderingPath = RenderingPath.VertexLit;
		} else {
			camera.renderingPath = RenderingPath.Forward;
		}
	}
}
