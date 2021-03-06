#pragma strict

var skin : GUISkin;
var touchTexture : Texture2D;

function Update() {
	if (!OverlayWindow.visible && Input.GetButtonDown("Fire1")) {
		OverlayWindow.Show("Socrates was a classical Greek Athenian philosopher. Ο Σωκράτης ήταν Έλληνας Αθηναίος φιλόσοφος και μία από τις σημαντικότερες φυσιογνωμίες του Ελληνικού και παγκόσμιου πολιτισμού. ソクラテスは、古代ギリシアの哲学者である。苏格拉底，古希臘哲学家，和其學生柏拉图及柏拉图的学生亚里士多德被并称為希臘三哲人。소크라테스 는 고대 그리스의 철학자이다. โสกราตีส เป็นนักปราชญ์กรีกและเป็นชาวเมืองเอเธนส์ ซึ่งถือกันว่าเป็นผู้วางรากฐานของปรัชญาตะวันตก Сократ е древногръцки философ, един от най-важните символи на западната философска традиция.");
	}
}

function OnGUI() {
	if (!OverlayWindow.visible) {
		GUI.skin = skin;
        GUI.Label(Rect(0, 0, Screen.width, Screen.height), "TAP SCREEN");
	}
    for (var touch : Touch in Input.touches) {
    	var y = Screen.height - touch.position.y - 64;
		GUI.DrawTexture(Rect(touch.position.x - 64, y, 128, 128), touchTexture);
    }
}
