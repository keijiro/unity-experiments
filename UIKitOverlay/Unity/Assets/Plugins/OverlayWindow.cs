using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;

public class OverlayWindow : MonoBehaviour {
	public static bool visible {
		get { return instance.visible_; }
	}
	
	public static void Show(string text) {
		instance.visible_ = true;
		// [iPhone]
		#if UNITY_IPHONE
		if (Application.platform == RuntimePlatform.IPhonePlayer) {
			_OverlayWindowShow(text);
		}
		#endif
		Debug.Log(text);
	}
	
	public static void Hide() {
		// [iPhone]
		#if UNITY_IPHONE
		if (Application.platform == RuntimePlatform.IPhonePlayer) {
			_OverlayWindowHide();
		}
		#endif
	}
	
	public static YieldInstruction ShowAndWait(string text) {
		Show(text);
		return instance.StartCoroutine(WaitForClose());
	}

	// 以下プライベート部。

	// iPhone向けネイティブコードのインポート。
	#if UNITY_IPHONE
	[DllImport ("__Internal")]
	private static extern void _OverlayWindowInstall();
	[DllImport ("__Internal")]
	private static extern void _OverlayWindowUninstall();
	[DllImport ("__Internal")]
	private static extern void _OverlayWindowShow(string text);
	[DllImport ("__Internal")]
	private static extern void _OverlayWindowHide();
	[DllImport ("__Internal")]
	private static extern bool _OverlayWindowUpdate();
	#endif

    static OverlayWindow instance_; // 唯一のインスタンス

	// 唯一のインスタンスへのアクセサ
    static OverlayWindow instance {
        get {
            if (!instance_) {
            	instance_ = new GameObject("OverlayWindow").AddComponent<OverlayWindow>();
        		// [iPhone]
        		#if UNITY_IPHONE
        		if (Application.platform == RuntimePlatform.IPhonePlayer) {
    				_OverlayWindowInstall();
        		}
				#endif
            }
            return instance_;
        }
    }

	bool visible_; // 表示状態
	
	// 非表示になるのを待つコルーチン。
    static IEnumerator WaitForClose() {
		while (visible) yield return 0;
    }

	// フレーム更新。
	void Update() {
		visible_ = false;
        // [iPhone]
		#if UNITY_IPHONE
        if (Application.platform == RuntimePlatform.IPhonePlayer) {
        	visible_ = _OverlayWindowUpdate();
        }
		#endif
	}

	// アプリケーション終了時の後片付け。
	void OnApplicationQuit() {
		instance_ = null;
        // [iPhone]
        #if UNITY_IPHONE
        if (Application.platform == RuntimePlatform.IPhonePlayer) {
        	_OverlayWindowUninstall();
        }
		#endif
	}
}