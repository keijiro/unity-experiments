#include "RegisterMonoModules.h"

extern "C"
{
	typedef void* gpointer;
	typedef int gboolean;
#if !(TARGET_IPHONE_SIMULATOR)
	const char*			UnityIPhoneRuntimeVersion = "3.3.0f4"; /* targetDevice = 0 */
	void				mono_dl_register_symbol (const char* name, void *addr);
	extern int 			mono_ficall_flag;
	void				mono_aot_register_module(gpointer *aot_info);
	extern gboolean		mono_aot_only;
	extern gpointer*	mono_aot_module_Assembly_CSharp_firstpass_info; // Assembly-CSharp-firstpass.dll
	extern gpointer*	mono_aot_module_Assembly_UnityScript_info; // Assembly-UnityScript.dll
	extern gpointer*	mono_aot_module_UnityEngine_info; // UnityEngine.dll
	extern gpointer*	mono_aot_module_mscorlib_info; // mscorlib.dll
#endif // !(TARGET_IPHONE_SIMULATOR)
	void	_OverlayWindowInstall();
	void	_OverlayWindowUninstall();
	void	_OverlayWindowShow();
	void	_OverlayWindowHide();
	void	_OverlayWindowUpdate();
}
void RegisterMonoModules()
{
#if !(TARGET_IPHONE_SIMULATOR)
	mono_aot_only = true;
	mono_ficall_flag = true;
	mono_aot_register_module(mono_aot_module_Assembly_CSharp_firstpass_info);
	mono_aot_register_module(mono_aot_module_Assembly_UnityScript_info);
	mono_aot_register_module(mono_aot_module_UnityEngine_info);
	mono_aot_register_module(mono_aot_module_mscorlib_info);

#endif // !(TARGET_IPHONE_SIMULATOR)
	mono_dl_register_symbol("_OverlayWindowInstall", (void*)&_OverlayWindowInstall);
	mono_dl_register_symbol("_OverlayWindowUninstall", (void*)&_OverlayWindowUninstall);
	mono_dl_register_symbol("_OverlayWindowShow", (void*)&_OverlayWindowShow);
	mono_dl_register_symbol("_OverlayWindowHide", (void*)&_OverlayWindowHide);
	mono_dl_register_symbol("_OverlayWindowUpdate", (void*)&_OverlayWindowUpdate);
}

void RegisterAllStrippedInternalCalls ()
{
	void Register_UnityEngine_Animation_GetStateAtIndex ();
	Register_UnityEngine_Animation_GetStateAtIndex ();
	void Register_UnityEngine_Animation_GetStateCount ();
	Register_UnityEngine_Animation_GetStateCount ();
	void Register_UnityEngine_AnimationCurve_Cleanup ();
	Register_UnityEngine_AnimationCurve_Cleanup ();
	void Register_UnityEngine_AnimationCurve_Evaluate ();
	Register_UnityEngine_AnimationCurve_Evaluate ();
	void Register_UnityEngine_AnimationCurve_AddKey ();
	Register_UnityEngine_AnimationCurve_AddKey ();
	void Register_UnityEngine_AnimationCurve_INTERNAL_CALL_AddKey_Internal ();
	Register_UnityEngine_AnimationCurve_INTERNAL_CALL_AddKey_Internal ();
	void Register_UnityEngine_AnimationCurve_INTERNAL_CALL_MoveKey ();
	Register_UnityEngine_AnimationCurve_INTERNAL_CALL_MoveKey ();
	void Register_UnityEngine_AnimationCurve_RemoveKey ();
	Register_UnityEngine_AnimationCurve_RemoveKey ();
	void Register_UnityEngine_AnimationCurve_get_length ();
	Register_UnityEngine_AnimationCurve_get_length ();
	void Register_UnityEngine_AnimationCurve_SetKeys ();
	Register_UnityEngine_AnimationCurve_SetKeys ();
	void Register_UnityEngine_AnimationCurve_GetKey_Internal ();
	Register_UnityEngine_AnimationCurve_GetKey_Internal ();
	void Register_UnityEngine_AnimationCurve_GetKeys ();
	Register_UnityEngine_AnimationCurve_GetKeys ();
	void Register_UnityEngine_AnimationCurve_SmoothTangents ();
	Register_UnityEngine_AnimationCurve_SmoothTangents ();
	void Register_UnityEngine_AnimationCurve_get_preWrapMode ();
	Register_UnityEngine_AnimationCurve_get_preWrapMode ();
	void Register_UnityEngine_AnimationCurve_set_preWrapMode ();
	Register_UnityEngine_AnimationCurve_set_preWrapMode ();
	void Register_UnityEngine_AnimationCurve_get_postWrapMode ();
	Register_UnityEngine_AnimationCurve_get_postWrapMode ();
	void Register_UnityEngine_AnimationCurve_set_postWrapMode ();
	Register_UnityEngine_AnimationCurve_set_postWrapMode ();
	void Register_UnityEngine_AnimationCurve_Init ();
	Register_UnityEngine_AnimationCurve_Init ();
	void Register_UnityEngine_AnimationEvent_Destroy ();
	Register_UnityEngine_AnimationEvent_Destroy ();
	void Register_UnityEngine_Application_Quit ();
	Register_UnityEngine_Application_Quit ();
	void Register_UnityEngine_Application_CancelQuit ();
	Register_UnityEngine_Application_CancelQuit ();
	void Register_UnityEngine_Application_get_loadedLevel ();
	Register_UnityEngine_Application_get_loadedLevel ();
	void Register_UnityEngine_Application_get_loadedLevelName ();
	Register_UnityEngine_Application_get_loadedLevelName ();
	void Register_UnityEngine_Application_LoadLevelAsync ();
	Register_UnityEngine_Application_LoadLevelAsync ();
	void Register_UnityEngine_Application_get_isLoadingLevel ();
	Register_UnityEngine_Application_get_isLoadingLevel ();
	void Register_UnityEngine_Application_get_levelCount ();
	Register_UnityEngine_Application_get_levelCount ();
	void Register_UnityEngine_Application_GetStreamProgressForLevelByName ();
	Register_UnityEngine_Application_GetStreamProgressForLevelByName ();
	void Register_UnityEngine_Application_GetStreamProgressForLevel ();
	Register_UnityEngine_Application_GetStreamProgressForLevel ();
	void Register_UnityEngine_Application_get_streamedBytes ();
	Register_UnityEngine_Application_get_streamedBytes ();
	void Register_UnityEngine_Application_CanStreamedLevelBeLoadedByName ();
	Register_UnityEngine_Application_CanStreamedLevelBeLoadedByName ();
	void Register_UnityEngine_Application_CanStreamedLevelBeLoaded ();
	Register_UnityEngine_Application_CanStreamedLevelBeLoaded ();
	void Register_UnityEngine_Application_get_isPlaying ();
	Register_UnityEngine_Application_get_isPlaying ();
	void Register_UnityEngine_Application_get_isEditor ();
	Register_UnityEngine_Application_get_isEditor ();
	void Register_UnityEngine_Application_get_isWebPlayer ();
	Register_UnityEngine_Application_get_isWebPlayer ();
	void Register_UnityEngine_Application_get_platform ();
	Register_UnityEngine_Application_get_platform ();
	void Register_UnityEngine_Application_CaptureScreenshot ();
	Register_UnityEngine_Application_CaptureScreenshot ();
	void Register_UnityEngine_Application_get_runInBackground ();
	Register_UnityEngine_Application_get_runInBackground ();
	void Register_UnityEngine_Application_set_runInBackground ();
	Register_UnityEngine_Application_set_runInBackground ();
	void Register_UnityEngine_Application_HasProLicense ();
	Register_UnityEngine_Application_HasProLicense ();
	void Register_UnityEngine_Application_HasAdvancedLicense ();
	Register_UnityEngine_Application_HasAdvancedLicense ();
	void Register_UnityEngine_Application_DontDestroyOnLoad ();
	Register_UnityEngine_Application_DontDestroyOnLoad ();
	void Register_UnityEngine_Application_get_dataPath ();
	Register_UnityEngine_Application_get_dataPath ();
	void Register_UnityEngine_Application_get_persistentDataPath ();
	Register_UnityEngine_Application_get_persistentDataPath ();
	void Register_UnityEngine_Application_get_temporaryCachePath ();
	Register_UnityEngine_Application_get_temporaryCachePath ();
	void Register_UnityEngine_Application_get_srcValue ();
	Register_UnityEngine_Application_get_srcValue ();
	void Register_UnityEngine_Application_get_absoluteURL ();
	Register_UnityEngine_Application_get_absoluteURL ();
	void Register_UnityEngine_Application_Internal_ExternalCall ();
	Register_UnityEngine_Application_Internal_ExternalCall ();
	void Register_UnityEngine_Application_get_unityVersion ();
	Register_UnityEngine_Application_get_unityVersion ();
	void Register_UnityEngine_Application_GetBuildUnityVersion ();
	Register_UnityEngine_Application_GetBuildUnityVersion ();
	void Register_UnityEngine_Application_GetNumericUnityVersion ();
	Register_UnityEngine_Application_GetNumericUnityVersion ();
	void Register_UnityEngine_Application_get_webSecurityEnabled ();
	Register_UnityEngine_Application_get_webSecurityEnabled ();
	void Register_UnityEngine_Application_get_webSecurityHostUrl ();
	Register_UnityEngine_Application_get_webSecurityHostUrl ();
	void Register_UnityEngine_Application_OpenURL ();
	Register_UnityEngine_Application_OpenURL ();
	void Register_UnityEngine_Application_CommitSuicide ();
	Register_UnityEngine_Application_CommitSuicide ();
	void Register_UnityEngine_Application_get_targetFrameRate ();
	Register_UnityEngine_Application_get_targetFrameRate ();
	void Register_UnityEngine_Application_set_targetFrameRate ();
	Register_UnityEngine_Application_set_targetFrameRate ();
	void Register_UnityEngine_Application_get_systemLanguage ();
	Register_UnityEngine_Application_get_systemLanguage ();
	void Register_UnityEngine_Application_SetLogCallbackDefined ();
	Register_UnityEngine_Application_SetLogCallbackDefined ();
	void Register_UnityEngine_Application_get_backgroundLoadingPriority ();
	Register_UnityEngine_Application_get_backgroundLoadingPriority ();
	void Register_UnityEngine_Application_set_backgroundLoadingPriority ();
	Register_UnityEngine_Application_set_backgroundLoadingPriority ();
	void Register_UnityEngine_AsyncOperation_InternalDestroy ();
	Register_UnityEngine_AsyncOperation_InternalDestroy ();
	void Register_UnityEngine_Component_get_transform ();
	Register_UnityEngine_Component_get_transform ();
	void Register_UnityEngine_Component_get_gameObject ();
	Register_UnityEngine_Component_get_gameObject ();
	void Register_UnityEngine_Coroutine_ReleaseCoroutine ();
	Register_UnityEngine_Coroutine_ReleaseCoroutine ();
	void Register_UnityEngine_Debug_Internal_Log ();
	Register_UnityEngine_Debug_Internal_Log ();
	void Register_UnityEngine_GameObject_CreatePrimitive ();
	Register_UnityEngine_GameObject_CreatePrimitive ();
	void Register_UnityEngine_GameObject_GetComponent ();
	Register_UnityEngine_GameObject_GetComponent ();
	void Register_UnityEngine_GameObject_GetComponentByName ();
	Register_UnityEngine_GameObject_GetComponentByName ();
	void Register_UnityEngine_GameObject_get_isStatic ();
	Register_UnityEngine_GameObject_get_isStatic ();
	void Register_UnityEngine_GameObject_set_isStatic ();
	Register_UnityEngine_GameObject_set_isStatic ();
	void Register_UnityEngine_GameObject_GetComponents ();
	Register_UnityEngine_GameObject_GetComponents ();
	void Register_UnityEngine_GameObject_GetComponentsWithCorrectReturnType ();
	Register_UnityEngine_GameObject_GetComponentsWithCorrectReturnType ();
	void Register_UnityEngine_GameObject_get_transform ();
	Register_UnityEngine_GameObject_get_transform ();
	void Register_UnityEngine_GameObject_get_rigidbody ();
	Register_UnityEngine_GameObject_get_rigidbody ();
	void Register_UnityEngine_GameObject_get_camera ();
	Register_UnityEngine_GameObject_get_camera ();
	void Register_UnityEngine_GameObject_get_light ();
	Register_UnityEngine_GameObject_get_light ();
	void Register_UnityEngine_GameObject_get_animation ();
	Register_UnityEngine_GameObject_get_animation ();
	void Register_UnityEngine_GameObject_get_constantForce ();
	Register_UnityEngine_GameObject_get_constantForce ();
	void Register_UnityEngine_GameObject_get_renderer ();
	Register_UnityEngine_GameObject_get_renderer ();
	void Register_UnityEngine_GameObject_get_audio ();
	Register_UnityEngine_GameObject_get_audio ();
	void Register_UnityEngine_GameObject_get_guiText ();
	Register_UnityEngine_GameObject_get_guiText ();
	void Register_UnityEngine_GameObject_get_networkView ();
	Register_UnityEngine_GameObject_get_networkView ();
	void Register_UnityEngine_GameObject_get_guiElement ();
	Register_UnityEngine_GameObject_get_guiElement ();
	void Register_UnityEngine_GameObject_get_guiTexture ();
	Register_UnityEngine_GameObject_get_guiTexture ();
	void Register_UnityEngine_GameObject_get_collider ();
	Register_UnityEngine_GameObject_get_collider ();
	void Register_UnityEngine_GameObject_get_hingeJoint ();
	Register_UnityEngine_GameObject_get_hingeJoint ();
	void Register_UnityEngine_GameObject_get_particleEmitter ();
	Register_UnityEngine_GameObject_get_particleEmitter ();
	void Register_UnityEngine_GameObject_get_layer ();
	Register_UnityEngine_GameObject_get_layer ();
	void Register_UnityEngine_GameObject_set_layer ();
	Register_UnityEngine_GameObject_set_layer ();
	void Register_UnityEngine_GameObject_get_active ();
	Register_UnityEngine_GameObject_get_active ();
	void Register_UnityEngine_GameObject_set_active ();
	Register_UnityEngine_GameObject_set_active ();
	void Register_UnityEngine_GameObject_get_tag ();
	Register_UnityEngine_GameObject_get_tag ();
	void Register_UnityEngine_GameObject_set_tag ();
	Register_UnityEngine_GameObject_set_tag ();
	void Register_UnityEngine_GameObject_CompareTag ();
	Register_UnityEngine_GameObject_CompareTag ();
	void Register_UnityEngine_GameObject_FindGameObjectWithTag ();
	Register_UnityEngine_GameObject_FindGameObjectWithTag ();
	void Register_UnityEngine_GameObject_FindGameObjectsWithTag ();
	Register_UnityEngine_GameObject_FindGameObjectsWithTag ();
	void Register_UnityEngine_GameObject_SendMessageUpwards ();
	Register_UnityEngine_GameObject_SendMessageUpwards ();
	void Register_UnityEngine_GameObject_SendMessage ();
	Register_UnityEngine_GameObject_SendMessage ();
	void Register_UnityEngine_GameObject_BroadcastMessage ();
	Register_UnityEngine_GameObject_BroadcastMessage ();
	void Register_UnityEngine_GameObject_AddComponent ();
	Register_UnityEngine_GameObject_AddComponent ();
	void Register_UnityEngine_GameObject_Internal_AddComponentWithType ();
	Register_UnityEngine_GameObject_Internal_AddComponentWithType ();
	void Register_UnityEngine_GameObject_Internal_CreateGameObject ();
	Register_UnityEngine_GameObject_Internal_CreateGameObject ();
	void Register_UnityEngine_GameObject_SampleAnimation ();
	Register_UnityEngine_GameObject_SampleAnimation ();
	void Register_UnityEngine_GameObject_PlayAnimation ();
	Register_UnityEngine_GameObject_PlayAnimation ();
	void Register_UnityEngine_GameObject_StopAnimation ();
	Register_UnityEngine_GameObject_StopAnimation ();
	void Register_UnityEngine_GameObject_Find ();
	Register_UnityEngine_GameObject_Find ();
	void Register_UnityEngine_Graphics_DrawTexture ();
	Register_UnityEngine_Graphics_DrawTexture ();
	void Register_UnityEngine_GUI_INTERNAL_CALL_Internal_UpdateColors ();
	Register_UnityEngine_GUI_INTERNAL_CALL_Internal_UpdateColors ();
	void Register_UnityEngine_GUI_Internal_SetEnabled ();
	Register_UnityEngine_GUI_Internal_SetEnabled ();
	void Register_UnityEngine_GUI_get_depth ();
	Register_UnityEngine_GUI_get_depth ();
	void Register_UnityEngine_GUI_set_depth ();
	Register_UnityEngine_GUI_set_depth ();
	void Register_UnityEngine_GUI_InitializeGUIClipTexture ();
	Register_UnityEngine_GUI_InitializeGUIClipTexture ();
	void Register_UnityEngine_GUI_get_blendMaterial ();
	Register_UnityEngine_GUI_get_blendMaterial ();
	void Register_UnityEngine_GUI_get_blitMaterial ();
	Register_UnityEngine_GUI_get_blitMaterial ();
	void Register_UnityEngine_GUI_get_usePageScrollbars ();
	Register_UnityEngine_GUI_get_usePageScrollbars ();
	void Register_UnityEngine_GUI_InternalRepaintEditorWindow ();
	Register_UnityEngine_GUI_InternalRepaintEditorWindow ();
	void Register_UnityEngine_GUIClip_INTERNAL_CALL_Push ();
	Register_UnityEngine_GUIClip_INTERNAL_CALL_Push ();
	void Register_UnityEngine_GUIClip_Pop ();
	Register_UnityEngine_GUIClip_Pop ();
	void Register_UnityEngine_GUIClip_get_enabled ();
	Register_UnityEngine_GUIClip_get_enabled ();
	void Register_UnityEngine_GUIClip_INTERNAL_CALL_Unclip_Vector2 ();
	Register_UnityEngine_GUIClip_INTERNAL_CALL_Unclip_Vector2 ();
	void Register_UnityEngine_GUIClip_INTERNAL_CALL_Unclip_Rect ();
	Register_UnityEngine_GUIClip_INTERNAL_CALL_Unclip_Rect ();
	void Register_UnityEngine_GUIClip_INTERNAL_CALL_Clip_Vector2 ();
	Register_UnityEngine_GUIClip_INTERNAL_CALL_Clip_Vector2 ();
	void Register_UnityEngine_GUIClip_GetMatrix ();
	Register_UnityEngine_GUIClip_GetMatrix ();
	void Register_UnityEngine_GUIClip_INTERNAL_CALL_SetMatrix ();
	Register_UnityEngine_GUIClip_INTERNAL_CALL_SetMatrix ();
	void Register_UnityEngine_GUIClip_Begin ();
	Register_UnityEngine_GUIClip_Begin ();
	void Register_UnityEngine_GUIClip_INTERNAL_GetAbsoluteMousePosition ();
	Register_UnityEngine_GUIClip_INTERNAL_GetAbsoluteMousePosition ();
	void Register_UnityEngine_GUIClip_End ();
	Register_UnityEngine_GUIClip_End ();
	void Register_UnityEngine_GUIClip_EndThroughException ();
	Register_UnityEngine_GUIClip_EndThroughException ();
	void Register_UnityEngine_GUISettings_Internal_GetCursorFlashSpeed ();
	Register_UnityEngine_GUISettings_Internal_GetCursorFlashSpeed ();
	void Register_UnityEngine_GUIStyle_Init ();
	Register_UnityEngine_GUIStyle_Init ();
	void Register_UnityEngine_GUIStyle_Cleanup ();
	Register_UnityEngine_GUIStyle_Cleanup ();
	void Register_UnityEngine_GUIStyle_Internal_GetLineHeight ();
	Register_UnityEngine_GUIStyle_Internal_GetLineHeight ();
	void Register_UnityEngine_GUIStyle_Internal_ApplyToCache ();
	Register_UnityEngine_GUIStyle_Internal_ApplyToCache ();
	void Register_UnityEngine_GUIStyle_Internal_Draw ();
	Register_UnityEngine_GUIStyle_Internal_Draw ();
	void Register_UnityEngine_GUIStyle_Internal_GetCursorFlashOffset ();
	Register_UnityEngine_GUIStyle_Internal_GetCursorFlashOffset ();
	void Register_UnityEngine_GUIStyle_INTERNAL_CALL_Internal_DrawCursor ();
	Register_UnityEngine_GUIStyle_INTERNAL_CALL_Internal_DrawCursor ();
	void Register_UnityEngine_GUIStyle_Internal_DrawWithTextSelection ();
	Register_UnityEngine_GUIStyle_Internal_DrawWithTextSelection ();
	void Register_UnityEngine_GUIStyle_SetDefaultFont ();
	Register_UnityEngine_GUIStyle_SetDefaultFont ();
	void Register_UnityEngine_GUIStyle_INTERNAL_CALL_Internal_GetCursorPixelPosition ();
	Register_UnityEngine_GUIStyle_INTERNAL_CALL_Internal_GetCursorPixelPosition ();
	void Register_UnityEngine_GUIStyle_INTERNAL_CALL_Internal_GetCursorStringIndex ();
	Register_UnityEngine_GUIStyle_INTERNAL_CALL_Internal_GetCursorStringIndex ();
	void Register_UnityEngine_GUIStyle_Internal_CalcSize ();
	Register_UnityEngine_GUIStyle_Internal_CalcSize ();
	void Register_UnityEngine_GUIUtility_SetDidGUIWindowsEatLastEvent ();
	Register_UnityEngine_GUIUtility_SetDidGUIWindowsEatLastEvent ();
	void Register_UnityEngine_GUIUtility_get_systemCopyBuffer ();
	Register_UnityEngine_GUIUtility_get_systemCopyBuffer ();
	void Register_UnityEngine_GUIUtility_set_systemCopyBuffer ();
	Register_UnityEngine_GUIUtility_set_systemCopyBuffer ();
	void Register_UnityEngine_GUIUtility_Internal_LoadSkin ();
	Register_UnityEngine_GUIUtility_Internal_LoadSkin ();
	void Register_UnityEngine_GUIUtility_Internal_ExitGUI ();
	Register_UnityEngine_GUIUtility_Internal_ExitGUI ();
	void Register_UnityEngine_GUIUtility_GetInGameWindowsIDList ();
	Register_UnityEngine_GUIUtility_GetInGameWindowsIDList ();
	void Register_UnityEngine_GUIUtility_SetHasKeyboardControl ();
	Register_UnityEngine_GUIUtility_SetHasKeyboardControl ();
	void Register_UnityEngine_GUIUtility_SetKeyboardDirection ();
	Register_UnityEngine_GUIUtility_SetKeyboardDirection ();
	void Register_UnityEngine_GUIUtility_GetKeyboardDirection ();
	Register_UnityEngine_GUIUtility_GetKeyboardDirection ();
	void Register_UnityEngine_GUIUtility_CurrentScriptHasKeyboardFocus ();
	Register_UnityEngine_GUIUtility_CurrentScriptHasKeyboardFocus ();
	void Register_UnityEngine_GUIUtility_GetMouseUsed ();
	Register_UnityEngine_GUIUtility_GetMouseUsed ();
	void Register_UnityEngine_GUIUtility_SetMouseUsed ();
	Register_UnityEngine_GUIUtility_SetMouseUsed ();
	void Register_UnityEngine_GUIUtility_SetKeyboardScriptInstanceID ();
	Register_UnityEngine_GUIUtility_SetKeyboardScriptInstanceID ();
	void Register_UnityEngine_GUIUtility_get_textFieldInput ();
	Register_UnityEngine_GUIUtility_get_textFieldInput ();
	void Register_UnityEngine_GUIUtility_set_textFieldInput ();
	Register_UnityEngine_GUIUtility_set_textFieldInput ();
	void Register_UnityEngine_GUIUtility_get_compositionString ();
	Register_UnityEngine_GUIUtility_get_compositionString ();
	void Register_UnityEngine_GUIUtility_INTERNAL_get_textFieldCursorPos ();
	Register_UnityEngine_GUIUtility_INTERNAL_get_textFieldCursorPos ();
	void Register_UnityEngine_GUIUtility_INTERNAL_set_textFieldCursorPos ();
	Register_UnityEngine_GUIUtility_INTERNAL_set_textFieldCursorPos ();
	void Register_UnityEngine_IDList_Internal_SkipToControlID ();
	Register_UnityEngine_IDList_Internal_SkipToControlID ();
	void Register_UnityEngine_IDList_CalculateNextFromHintList ();
	Register_UnityEngine_IDList_CalculateNextFromHintList ();
	void Register_UnityEngine_IDList_ResetIdx ();
	Register_UnityEngine_IDList_ResetIdx ();
	void Register_UnityEngine_Input_GetButtonDown ();
	Register_UnityEngine_Input_GetButtonDown ();
	void Register_UnityEngine_iPhoneKeyboard_Destroy ();
	Register_UnityEngine_iPhoneKeyboard_Destroy ();
	void Register_UnityEngine_iPhoneKeyboard_iPhoneKeyboard_InternalConstructorHelper ();
	Register_UnityEngine_iPhoneKeyboard_iPhoneKeyboard_InternalConstructorHelper ();
	void Register_UnityEngine_iPhoneKeyboard_get_text ();
	Register_UnityEngine_iPhoneKeyboard_get_text ();
	void Register_UnityEngine_iPhoneKeyboard_get_done ();
	Register_UnityEngine_iPhoneKeyboard_get_done ();
	void Register_UnityEngine_Matrix4x4_INTERNAL_CALL_Inverse ();
	Register_UnityEngine_Matrix4x4_INTERNAL_CALL_Inverse ();
	void Register_UnityEngine_Matrix4x4_INTERNAL_CALL_TRS ();
	Register_UnityEngine_Matrix4x4_INTERNAL_CALL_TRS ();
	void Register_UnityEngine_MonoBehaviour_StartCoroutine_Auto ();
	Register_UnityEngine_MonoBehaviour_StartCoroutine_Auto ();
	void Register_UnityEngine_MonoBehaviour__ctor ();
	Register_UnityEngine_MonoBehaviour__ctor ();
	void Register_UnityEngine_Object_CompareBaseObjects ();
	Register_UnityEngine_Object_CompareBaseObjects ();
	void Register_UnityEngine_Object_get_name ();
	Register_UnityEngine_Object_get_name ();
	void Register_UnityEngine_Object_ToString ();
	Register_UnityEngine_Object_ToString ();
	void Register_UnityEngine_Quaternion_INTERNAL_CALL_AngleAxis ();
	Register_UnityEngine_Quaternion_INTERNAL_CALL_AngleAxis ();
	void Register_UnityEngine_Quaternion_INTERNAL_CALL_FromToRotation ();
	Register_UnityEngine_Quaternion_INTERNAL_CALL_FromToRotation ();
	void Register_UnityEngine_Quaternion_INTERNAL_CALL_LookRotation ();
	Register_UnityEngine_Quaternion_INTERNAL_CALL_LookRotation ();
	void Register_UnityEngine_Quaternion_INTERNAL_CALL_Inverse ();
	Register_UnityEngine_Quaternion_INTERNAL_CALL_Inverse ();
	void Register_UnityEngine_Quaternion_INTERNAL_CALL_Internal_ToEulerRad ();
	Register_UnityEngine_Quaternion_INTERNAL_CALL_Internal_ToEulerRad ();
	void Register_UnityEngine_Quaternion_INTERNAL_CALL_Internal_FromEulerRad ();
	Register_UnityEngine_Quaternion_INTERNAL_CALL_Internal_FromEulerRad ();
	void Register_UnityEngine_RenderTexture_Internal_GetWidth ();
	Register_UnityEngine_RenderTexture_Internal_GetWidth ();
	void Register_UnityEngine_RenderTexture_Internal_GetHeight ();
	Register_UnityEngine_RenderTexture_Internal_GetHeight ();
	void Register_UnityEngine_Screen_get_width ();
	Register_UnityEngine_Screen_get_width ();
	void Register_UnityEngine_Screen_get_height ();
	Register_UnityEngine_Screen_get_height ();
	void Register_UnityEngine_ScriptableObject__ctor ();
	Register_UnityEngine_ScriptableObject__ctor ();
	void Register_UnityEngine_TextAsset_get_text ();
	Register_UnityEngine_TextAsset_get_text ();
	void Register_UnityEngine_Texture_Internal_GetWidth ();
	Register_UnityEngine_Texture_Internal_GetWidth ();
	void Register_UnityEngine_Texture_Internal_GetHeight ();
	Register_UnityEngine_Texture_Internal_GetHeight ();
	void Register_UnityEngine_Time_get_deltaTime ();
	Register_UnityEngine_Time_get_deltaTime ();
	void Register_UnityEngine_Time_get_realtimeSinceStartup ();
	Register_UnityEngine_Time_get_realtimeSinceStartup ();
	void Register_UnityEngine_Transform_INTERNAL_get_position ();
	Register_UnityEngine_Transform_INTERNAL_get_position ();
	void Register_UnityEngine_Transform_INTERNAL_set_position ();
	Register_UnityEngine_Transform_INTERNAL_set_position ();
	void Register_UnityEngine_Transform_INTERNAL_get_localPosition ();
	Register_UnityEngine_Transform_INTERNAL_get_localPosition ();
	void Register_UnityEngine_Transform_INTERNAL_set_localPosition ();
	Register_UnityEngine_Transform_INTERNAL_set_localPosition ();
	void Register_UnityEngine_Transform_INTERNAL_get_localEulerAngles ();
	Register_UnityEngine_Transform_INTERNAL_get_localEulerAngles ();
	void Register_UnityEngine_Transform_INTERNAL_set_localEulerAngles ();
	Register_UnityEngine_Transform_INTERNAL_set_localEulerAngles ();
	void Register_UnityEngine_Transform_INTERNAL_get_rotation ();
	Register_UnityEngine_Transform_INTERNAL_get_rotation ();
	void Register_UnityEngine_Transform_INTERNAL_set_rotation ();
	Register_UnityEngine_Transform_INTERNAL_set_rotation ();
	void Register_UnityEngine_Transform_INTERNAL_get_localRotation ();
	Register_UnityEngine_Transform_INTERNAL_get_localRotation ();
	void Register_UnityEngine_Transform_INTERNAL_set_localRotation ();
	Register_UnityEngine_Transform_INTERNAL_set_localRotation ();
	void Register_UnityEngine_Transform_INTERNAL_get_localScale ();
	Register_UnityEngine_Transform_INTERNAL_get_localScale ();
	void Register_UnityEngine_Transform_INTERNAL_set_localScale ();
	Register_UnityEngine_Transform_INTERNAL_set_localScale ();
	void Register_UnityEngine_Transform_get_parent ();
	Register_UnityEngine_Transform_get_parent ();
	void Register_UnityEngine_Transform_set_parent ();
	Register_UnityEngine_Transform_set_parent ();
	void Register_UnityEngine_Transform_INTERNAL_get_worldToLocalMatrix ();
	Register_UnityEngine_Transform_INTERNAL_get_worldToLocalMatrix ();
	void Register_UnityEngine_Transform_INTERNAL_get_localToWorldMatrix ();
	Register_UnityEngine_Transform_INTERNAL_get_localToWorldMatrix ();
	void Register_UnityEngine_Transform_INTERNAL_CALL_LookAt ();
	Register_UnityEngine_Transform_INTERNAL_CALL_LookAt ();
	void Register_UnityEngine_Transform_INTERNAL_CALL_TransformDirection ();
	Register_UnityEngine_Transform_INTERNAL_CALL_TransformDirection ();
	void Register_UnityEngine_Transform_INTERNAL_CALL_InverseTransformDirection ();
	Register_UnityEngine_Transform_INTERNAL_CALL_InverseTransformDirection ();
	void Register_UnityEngine_Transform_INTERNAL_CALL_TransformPoint ();
	Register_UnityEngine_Transform_INTERNAL_CALL_TransformPoint ();
	void Register_UnityEngine_Transform_INTERNAL_CALL_InverseTransformPoint ();
	Register_UnityEngine_Transform_INTERNAL_CALL_InverseTransformPoint ();
	void Register_UnityEngine_Transform_get_root ();
	Register_UnityEngine_Transform_get_root ();
	void Register_UnityEngine_Transform_get_childCount ();
	Register_UnityEngine_Transform_get_childCount ();
	void Register_UnityEngine_Transform_DetachChildren ();
	Register_UnityEngine_Transform_DetachChildren ();
	void Register_UnityEngine_Transform_Find ();
	Register_UnityEngine_Transform_Find ();
	void Register_UnityEngine_Transform_INTERNAL_get_lossyScale ();
	Register_UnityEngine_Transform_INTERNAL_get_lossyScale ();
	void Register_UnityEngine_Transform_IsChildOf ();
	Register_UnityEngine_Transform_IsChildOf ();
	void Register_UnityEngine_Transform_INTERNAL_CALL_RotateAround ();
	Register_UnityEngine_Transform_INTERNAL_CALL_RotateAround ();
	void Register_UnityEngine_Transform_INTERNAL_CALL_RotateAroundLocal ();
	Register_UnityEngine_Transform_INTERNAL_CALL_RotateAroundLocal ();
	void Register_UnityEngine_Transform_GetChild ();
	Register_UnityEngine_Transform_GetChild ();
	void Register_UnityEngine_Transform_GetChildCount ();
	Register_UnityEngine_Transform_GetChildCount ();
	void Register_UnityEngine_UnityLogWriter_WriteStringToUnityLog ();
	Register_UnityEngine_UnityLogWriter_WriteStringToUnityLog ();

}
void RegisterAllClasses() 
{
void RegisterMaximumClassID ();
 RegisterMaximumClassID();
int RegisterClass_GameObject();
 RegisterClass_GameObject();
int RegisterClass_Component();
 RegisterClass_Component();
int RegisterClass_LevelGameManager();
 RegisterClass_LevelGameManager();
int RegisterClass_Transform();
 RegisterClass_Transform();
int RegisterClass_Behaviour();
 RegisterClass_Behaviour();
int RegisterClass_GameManager();
 RegisterClass_GameManager();
int RegisterClass_EditorExtension();
 RegisterClass_EditorExtension();
int RegisterClass_Camera();
 RegisterClass_Camera();
int RegisterClass_Material();
 RegisterClass_Material();
int RegisterClass_Texture();
 RegisterClass_Texture();
int RegisterClass_Texture2D();
 RegisterClass_Texture2D();
int RegisterClass_Scene();
 RegisterClass_Scene();
int RegisterClass_Shader();
 RegisterClass_Shader();
int RegisterClass_TextAsset();
 RegisterClass_TextAsset();
int RegisterClass_RenderLayer();
 RegisterClass_RenderLayer();
int RegisterClass_AudioListener();
 RegisterClass_AudioListener();
int RegisterClass_GUILayer();
 RegisterClass_GUILayer();
int RegisterClass_RenderSettings();
 RegisterClass_RenderSettings();
int RegisterClass_MonoBehaviour();
 RegisterClass_MonoBehaviour();
int RegisterClass_MonoScript();
 RegisterClass_MonoScript();
int RegisterClass_FlareLayer();
 RegisterClass_FlareLayer();
int RegisterClass_HaloManager();
 RegisterClass_HaloManager();
int RegisterClass_Font();
 RegisterClass_Font();
int RegisterClass_NamedObject();
 RegisterClass_NamedObject();
int RegisterClass_LightmapSettings();
 RegisterClass_LightmapSettings();
int RegisterClass_AudioBehaviour();
 RegisterClass_AudioBehaviour();
int RegisterClass_PreloadData();
 RegisterClass_PreloadData();
int RegisterClass_Cubemap();
 RegisterClass_Cubemap();
int RegisterClass_RenderTexture();
 RegisterClass_RenderTexture();
int RegisterClass_TimeManager();
 RegisterClass_TimeManager();
int RegisterClass_AudioManager();
 RegisterClass_AudioManager();
int RegisterClass_InputManager();
 RegisterClass_InputManager();
int RegisterClass_RenderManager();
 RegisterClass_RenderManager();
int RegisterClass_QualitySettings();
 RegisterClass_QualitySettings();
int RegisterClass_NotificationManager();
 RegisterClass_NotificationManager();
int RegisterClass_AnimationManager();
 RegisterClass_AnimationManager();
int RegisterClass_TagManager();
 RegisterClass_TagManager();
int RegisterClass_ScriptMapper();
 RegisterClass_ScriptMapper();
int RegisterClass_DelayedCallManager();
 RegisterClass_DelayedCallManager();
int RegisterClass_MonoManager();
 RegisterClass_MonoManager();
int RegisterClass_PlayerSettings();
 RegisterClass_PlayerSettings();
int RegisterClass_BuildSettings();
 RegisterClass_BuildSettings();
int RegisterClass_ResourceManager();
 RegisterClass_ResourceManager();
int RegisterClass_MasterServerInterface();
 RegisterClass_MasterServerInterface();
int RegisterClass_Animation();
 RegisterClass_Animation();
int RegisterClass_AnimationClip();
 RegisterClass_AnimationClip();
int RegisterClass_AssetBundle();
 RegisterClass_AssetBundle();
int RegisterClass_AudioSource();
 RegisterClass_AudioSource();
int RegisterClass_Collider();
 RegisterClass_Collider();
int RegisterClass_ConstantForce();
 RegisterClass_ConstantForce();
int RegisterClass_GUIElement();
 RegisterClass_GUIElement();
int RegisterClass_GUIText();
 RegisterClass_GUIText();
int RegisterClass_GUITexture();
 RegisterClass_GUITexture();
int RegisterClass_HingeJoint();
 RegisterClass_HingeJoint();
int RegisterClass_Joint();
 RegisterClass_Joint();
int RegisterClass_Light();
 RegisterClass_Light();
int RegisterClass_NetworkView();
 RegisterClass_NetworkView();
int RegisterClass_ParticleEmitter();
 RegisterClass_ParticleEmitter();
int RegisterClass_Renderer();
 RegisterClass_Renderer();
int RegisterClass_Rigidbody();
 RegisterClass_Rigidbody();
int RegisterClass_NetworkManager();
 RegisterClass_NetworkManager();
int RegisterClass_PhysicsManager();
 RegisterClass_PhysicsManager();

}
