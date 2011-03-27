var skinSmall : GUISkin;
var skinLarge : GUISkin;

private var open : boolean;
private var scale : float;

function Update() {
	if (open) {
		scale = 1.0 - (1.0 - scale) * Mathf.Exp(-14.0 * Time.deltaTime);
	} else {
		scale *= Mathf.Exp(-14.0 * Time.deltaTime);
	}
}

function OnGUI() {
	GUI.skin = (Screen.width < 480) ? skinSmall : skinLarge;
	if (scale < 0.03) {
		ShowOpenButton();
	} else {
		ShowMenu();
	}
}

private function ShowOpenButton() {
	var sw = Screen.width;
	var sh = Screen.height;
	GUILayout.BeginArea(Rect(0, 0, sw, sh));
	GUILayout.BeginVertical();
	GUILayout.FlexibleSpace();
	GUILayout.BeginHorizontal();
	GUILayout.Space(0.2 * sw);
	open = GUILayout.Button("OPEN");
	GUILayout.Space(0.2 * sw);
	GUILayout.EndHorizontal();
	GUILayout.EndVertical();
	GUILayout.EndArea();
}

private function ShowMenu() {
	var sw = Screen.width;
	var sh = Screen.height;
	
	var pivot = Vector2(0.5 * Screen.width, 0.5 * Screen.height);
	var angle = 5.0 * Mathf.Sin(Time.time * 3.0);
	var offset = sw * 0.05 * Mathf.Sin(Time.time * 2.7);
    GUIUtility.RotateAroundPivot(angle, pivot);
    GUIUtility.ScaleAroundPivot(Vector2(scale, scale), pivot);
    
    var ww = 0.8 * sw;
    var ox = 0.1 * sw;
    var oy = 0.5 * (sh - ww) + offset;
	
	GUILayout.BeginArea(Rect(ox, oy, ww, ww), GUI.skin.box);
	GUILayout.BeginVertical();
	if (GUILayout.Button("START")) open = false;
	if (GUILayout.Button("TUTORIAL")) open = false;
	if (GUILayout.Button("OPTION")) open = false;
	if (GUILayout.Button("CREDITS")) open = false;
	GUILayout.EndVertical();
	GUILayout.EndArea();
}
