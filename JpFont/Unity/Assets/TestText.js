var skinSmall : GUISkin;
var skinLarge : GUISkin;

private var skin : GUISkin;

function Start() {
	if (Screen.width < 640 && Screen.height < 640) {
		skin = skinSmall;
	} else {
		skin = skinLarge;
	}
}

function OnGUI() {
	GUI.skin = skin;
	GUILayout.BeginArea(Rect(0, 0, Screen.width, Screen.height));
	GUILayout.BeginVertical();
	GUILayout.Label("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");
	GUILayout.Label("ジョバンニはまっ赤になってうなずきました。けれどもいつかジョバンニの眼のなかには涙がいっぱいになりました。そうだ僕は知っていたのだ、勿論カムパネルラも知っている、それはいつかカムパネルラのお父さんの博士のうちでカムパネルラといっしょに読んだ雑誌のなかにあったのだ。それどこでなくカムパネルラは、その雑誌を読むと、すぐお父さんの書斎から巨きな本をもってきて、ぎんがというところをひろげ、まっ黒な頁いっぱいに白い点々のある美しい写真を二人でいつまでも見たのでした。");
	GUILayout.EndVertical();
	GUILayout.EndArea();
}
