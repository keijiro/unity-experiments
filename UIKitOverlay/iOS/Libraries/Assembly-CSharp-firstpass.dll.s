#if defined(__arm__)
.text
	.align 3
methods:
	.space 16
	.align 2
Lm_0:
OverlayWindow__ctor:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,8,208,77,226,13,176,160,225,0,0,139,229,0,0,155,229
bl p_1

	.byte 8,208,139,226,0,9,189,232,8,112,157,229,0,160,157,232

Lme_0:
	.align 2
Lm_1:
OverlayWindow_get_visible:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,13,176,160,225
bl p_2

	.byte 16,0,208,229,0,208,139,226,0,9,189,232,8,112,157,229,0,160,157,232

Lme_1:
	.align 2
Lm_2:
OverlayWindow_Show_string:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,8,208,77,226,13,176,160,225,0,0,139,229
bl p_2

	.byte 1,16,160,227,16,16,192,229
bl p_3

	.byte 8,0,80,227,1,0,0,26,0,0,155,229
bl p_4

	.byte 0,0,155,229
bl p_5

	.byte 8,208,139,226,0,9,189,232,8,112,157,229,0,160,157,232

Lme_2:
	.align 2
Lm_3:
OverlayWindow_Hide:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,13,176,160,225
bl p_3

	.byte 8,0,80,227,0,0,0,26
bl p_6

	.byte 0,208,139,226,0,9,189,232,8,112,157,229,0,160,157,232

Lme_3:
	.align 2
Lm_4:
OverlayWindow_ShowAndWait_string:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,16,208,77,226,13,176,160,225,0,0,139,229,0,0,155,229
bl Lm_2
bl p_2

	.byte 8,0,139,229,0,0,159,229,0,0,0,234
	.long mono_aot_Assembly_CSharp_firstpass_got - . -4
	.byte 0,0,159,231
bl p_7

	.byte 0,16,160,225,8,32,155,229,2,0,160,225,0,224,146,229
bl p_8

	.byte 16,208,139,226,0,9,189,232,8,112,157,229,0,160,157,232

Lme_4:
	.align 2
Lm_a:
OverlayWindow_get_instance:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,8,208,77,226,13,176,160,225,0,0,159,229,0,0,0,234
	.long mono_aot_Assembly_CSharp_firstpass_got - .
	.byte 0,0,159,231,0,0,144,229
bl p_9

	.byte 0,0,80,227,30,0,0,26,0,0,159,229,0,0,0,234
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 4
	.byte 0,0,159,231,4,0,139,229,0,0,159,229,0,0,0,234
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 8
	.byte 0,0,159,231
bl p_10

	.byte 4,16,155,229,0,0,139,229
bl p_11

	.byte 0,0,155,229,0,16,159,229,0,0,0,234
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 12
	.byte 1,16,159,231,0,224,144,229,1,128,160,225
bl p_12

	.byte 0,16,160,225,0,0,159,229,0,0,0,234
	.long mono_aot_Assembly_CSharp_firstpass_got - .
	.byte 0,0,159,231,0,16,128,229
bl p_3

	.byte 8,0,80,227,0,0,0,26
bl p_13

	.byte 0,0,159,229,0,0,0,234
	.long mono_aot_Assembly_CSharp_firstpass_got - .
	.byte 0,0,159,231,0,0,144,229,8,208,139,226,0,9,189,232,8,112,157,229,0,160,157,232

Lme_a:
	.align 2
Lm_b:
OverlayWindow_WaitForClose:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,13,176,160,225,0,0,159,229,0,0,0,234
	.long mono_aot_Assembly_CSharp_firstpass_got - . -4
	.byte 0,0,159,231
bl p_7

	.byte 0,208,139,226,0,9,189,232,8,112,157,229,0,160,157,232

Lme_b:
	.align 2
Lm_c:
OverlayWindow_Update:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,8,208,77,226,13,176,160,225,0,0,139,229,0,0,155,229
	.byte 0,16,160,227,16,16,192,229
bl p_3

	.byte 8,0,80,227,3,0,0,26
bl p_14

	.byte 0,16,160,225,0,0,155,229,16,16,192,229,8,208,139,226,0,9,189,232,8,112,157,229,0,160,157,232

Lme_c:
	.align 2
Lm_d:
OverlayWindow_OnApplicationQuit:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,8,208,77,226,13,176,160,225,0,0,139,229,0,0,159,229
	.byte 0,0,0,234
	.long mono_aot_Assembly_CSharp_firstpass_got - .
	.byte 0,0,159,231,0,16,160,227,0,16,128,229
bl p_3

	.byte 8,0,80,227,0,0,0,26
bl p_15

	.byte 8,208,139,226,0,9,189,232,8,112,157,229,0,160,157,232

Lme_d:
	.align 2
Lm_e:
OverlayWindow__WaitForClosec__Iterator0__ctor:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,8,208,77,226,13,176,160,225,0,0,139,229,8,208,139,226
	.byte 0,9,189,232,8,112,157,229,0,160,157,232

Lme_e:
	.align 2
Lm_f:
OverlayWindow__WaitForClosec__Iterator0_System_Collections_Generic_IEnumerator_object_get_Current:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,8,208,77,226,13,176,160,225,0,0,139,229,0,0,155,229
	.byte 8,0,144,229,8,208,139,226,0,9,189,232,8,112,157,229,0,160,157,232

Lme_f:
	.align 2
Lm_10:
OverlayWindow__WaitForClosec__Iterator0_System_Collections_IEnumerator_get_Current:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,8,208,77,226,13,176,160,225,0,0,139,229,0,0,155,229
	.byte 8,0,144,229,8,208,139,226,0,9,189,232,8,112,157,229,0,160,157,232

Lme_10:
	.align 2
Lm_11:
OverlayWindow__WaitForClosec__Iterator0_MoveNext:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,93,45,233,12,208,77,226,13,176,160,225,0,160,160,225,12,0,154,229
	.byte 0,16,224,227,12,16,138,229,0,0,139,229,2,0,80,227,24,0,0,42,0,0,155,229,0,17,160,225,0,0,159,229
	.byte 0,0,0,234
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 16
	.byte 0,0,159,231,1,0,128,224,0,0,144,229,0,240,160,225,0,0,159,229,0,0,0,234
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 20
	.byte 0,0,159,231
bl p_16

	.byte 0,16,160,227,8,16,128,229,8,0,138,229,1,0,160,227,12,0,138,229,6,0,0,234
bl Lm_1

	.byte 0,0,80,227,241,255,255,26,0,0,224,227,12,0,138,229,0,0,160,227,0,0,0,234,1,0,160,227,12,208,139,226
	.byte 0,13,189,232,8,112,157,229,0,160,157,232

Lme_11:
	.align 2
Lm_12:
OverlayWindow__WaitForClosec__Iterator0_Dispose:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,8,208,77,226,13,176,160,225,0,0,139,229,0,0,155,229
	.byte 0,16,224,227,12,16,128,229,8,208,139,226,0,9,189,232,8,112,157,229,0,160,157,232

Lme_12:
	.align 2
Lm_13:
OverlayWindow__WaitForClosec__Iterator0_Reset:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,8,208,77,226,13,176,160,225,0,0,139,229,31,0,160,227
	.byte 1,12,128,226,2,4,128,226
bl p_17
bl p_18

	.byte 8,208,139,226,0,9,189,232,8,112,157,229,0,160,157,232

Lme_13:
	.align 2
Lm_15:
System_Array_InternalArray__IEnumerable_GetEnumerator_object:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,24,208,77,226,13,176,160,225,16,0,139,229,0,0,159,229
	.byte 0,0,0,234
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 24
	.byte 0,0,159,231,0,16,160,227,0,16,139,229,0,16,160,227,4,16,139,229,0,128,160,225,11,0,160,225,16,16,155,229
bl p_19

	.byte 0,0,155,229,8,0,139,229,4,0,155,229,12,0,139,229,0,0,159,229,0,0,0,234
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 24
	.byte 0,0,159,231
bl p_7

	.byte 8,16,128,226,8,32,155,229,0,32,129,229,12,32,155,229,4,32,129,229,24,208,139,226,0,9,189,232,8,112,157,229
	.byte 0,160,157,232

Lme_15:
	.align 2
Lm_17:
wrapper_managed_to_native_OverlayWindow__OverlayWindowInstall:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,13,176,160,225
bl p_20

	.byte 0,0,159,229,0,0,0,234
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 28
	.byte 0,0,159,231,0,0,144,229,0,0,80,227,3,0,0,26,0,208,139,226,0,9,189,232,8,112,157,229,0,160,157,232
bl p_21

	.byte 249,255,255,234

Lme_17:
	.align 2
Lm_18:
wrapper_managed_to_native_OverlayWindow__OverlayWindowUninstall:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,13,176,160,225
bl p_22

	.byte 0,0,159,229,0,0,0,234
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 28
	.byte 0,0,159,231,0,0,144,229,0,0,80,227,3,0,0,26,0,208,139,226,0,9,189,232,8,112,157,229,0,160,157,232
bl p_21

	.byte 249,255,255,234

Lme_18:
	.align 2
Lm_19:
wrapper_managed_to_native_OverlayWindow__OverlayWindowShow_string:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,93,45,233,4,208,77,226,13,176,160,225,0,160,160,225,10,0,160,225
bl p_23

	.byte 0,160,160,225
bl p_24

	.byte 0,0,159,229,0,0,0,234
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 28
	.byte 0,0,159,231,0,0,144,229,0,0,80,227,5,0,0,26,10,0,160,225
bl p_25

	.byte 4,208,139,226,0,13,189,232,8,112,157,229,0,160,157,232
bl p_21

	.byte 247,255,255,234

Lme_19:
	.align 2
Lm_1a:
wrapper_managed_to_native_OverlayWindow__OverlayWindowHide:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,13,176,160,225
bl p_26

	.byte 0,0,159,229,0,0,0,234
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 28
	.byte 0,0,159,231,0,0,144,229,0,0,80,227,3,0,0,26,0,208,139,226,0,9,189,232,8,112,157,229,0,160,157,232
bl p_21

	.byte 249,255,255,234

Lme_1a:
	.align 2
Lm_1b:
wrapper_managed_to_native_OverlayWindow__OverlayWindowUpdate:

	.byte 13,192,160,225,128,64,45,233,13,112,160,225,0,89,45,233,8,208,77,226,13,176,160,225
bl p_27

	.byte 0,0,203,229,0,0,159,229,0,0,0,234
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 28
	.byte 0,0,159,231,0,0,144,229,0,0,80,227,4,0,0,26,0,0,219,229,8,208,139,226,0,9,189,232,8,112,157,229
	.byte 0,160,157,232
bl p_21

	.byte 248,255,255,234

Lme_1b:
.text
	.align 3
methods_end:
.text
	.align 3
method_offsets:

	.long Lm_0 - methods,Lm_1 - methods,Lm_2 - methods,Lm_3 - methods,Lm_4 - methods,-1,-1,-1
	.long -1,-1,Lm_a - methods,Lm_b - methods,Lm_c - methods,Lm_d - methods,Lm_e - methods,Lm_f - methods
	.long Lm_10 - methods,Lm_11 - methods,Lm_12 - methods,Lm_13 - methods,-1,Lm_15 - methods,-1,Lm_17 - methods
	.long Lm_18 - methods,Lm_19 - methods,Lm_1a - methods,Lm_1b - methods

.text
	.align 3
method_info:
mi:
Lm_0_p:

	.byte 0,0
Lm_1_p:

	.byte 0,0
Lm_2_p:

	.byte 0,0
Lm_3_p:

	.byte 0,0
Lm_4_p:

	.byte 0,1,2
Lm_a_p:

	.byte 0,6,3,4,5,6,3,3
Lm_b_p:

	.byte 0,1,2
Lm_c_p:

	.byte 0,0
Lm_d_p:

	.byte 0,1,3
Lm_e_p:

	.byte 0,0
Lm_f_p:

	.byte 0,0
Lm_10_p:

	.byte 0,0
Lm_11_p:

	.byte 0,2,7,8
Lm_12_p:

	.byte 0,0
Lm_13_p:

	.byte 0,0
Lm_15_p:

	.byte 0,2,9,9
Lm_17_p:

	.byte 0,1,10
Lm_18_p:

	.byte 0,1,10
Lm_19_p:

	.byte 0,1,10
Lm_1a_p:

	.byte 0,1,10
Lm_1b_p:

	.byte 0,1,10
.text
	.align 3
method_info_offsets:

	.long Lm_0_p - mi,Lm_1_p - mi,Lm_2_p - mi,Lm_3_p - mi,Lm_4_p - mi,0,0,0
	.long 0,0,Lm_a_p - mi,Lm_b_p - mi,Lm_c_p - mi,Lm_d_p - mi,Lm_e_p - mi,Lm_f_p - mi
	.long Lm_10_p - mi,Lm_11_p - mi,Lm_12_p - mi,Lm_13_p - mi,0,Lm_15_p - mi,0,Lm_17_p - mi
	.long Lm_18_p - mi,Lm_19_p - mi,Lm_1a_p - mi,Lm_1b_p - mi

.text
	.align 3
extra_method_info:

	.byte 0,0,255,254,0,0,0,60,0,0,198,0,1,84,0,1,1,129,36,0,1,6,79,118,101,114,108,97,121,87,105,110
	.byte 100,111,119,58,95,79,118,101,114,108,97,121,87,105,110,100,111,119,73,110,115,116,97,108,108,32,40,41,0,1,6,79
	.byte 118,101,114,108,97,121,87,105,110,100,111,119,58,95,79,118,101,114,108,97,121,87,105,110,100,111,119,85,110,105,110,115
	.byte 116,97,108,108,32,40,41,0,1,6,79,118,101,114,108,97,121,87,105,110,100,111,119,58,95,79,118,101,114,108,97,121
	.byte 87,105,110,100,111,119,83,104,111,119,32,40,115,116,114,105,110,103,41,0,1,6,79,118,101,114,108,97,121,87,105,110
	.byte 100,111,119,58,95,79,118,101,114,108,97,121,87,105,110,100,111,119,72,105,100,101,32,40,41,0,1,6,79,118,101,114
	.byte 108,97,121,87,105,110,100,111,119,58,95,79,118,101,114,108,97,121,87,105,110,100,111,119,85,112,100,97,116,101,32,40
	.byte 41,0

.text
	.align 3
extra_method_table:

	.long 11,61,24,0,0,0,0,20
	.long 23,11,0,0,0,0,0,0
	.long 0,0,0,186,27,0,0,0
	.long 0,1,21,12,0,0,0,0
	.long 0,0,104,25,0,148,26,0
.text
	.align 3
extra_method_info_offsets:

	.long 7,21,1,22,0,23,20,24
	.long 61,25,104,26,148,27,186
.text
	.align 3
method_order:

	.long 0,16777215,0,1,2,3,4,10
	.long 11,12,13,14,15,16,17,18
	.long 19,21,23,24,25,26,27

.text
method_order_end:
.text
	.align 3
class_name_table:

	.short 11, 1, 0, 3, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 2, 0
.text
	.align 3
got_info:

	.byte 12,1,39,14,3,1,16,2,1,1,17,1,1,14,36,2,34,255,255,0,0,0,1,255,43,0,0,1,8,2,128,132
	.byte 128,132,14,128,216,0,14,219,0,0,0,21,63,0,1,129,36,0,33,3,194,0,2,167,3,193,0,0,11,3,194,0
	.byte 0,63,3,193,0,0,8,3,194,0,0,134,3,193,0,0,9,7,20,109,111,110,111,95,111,98,106,101,99,116,95,110
	.byte 101,119,95,102,97,115,116,0,3,194,0,2,168,3,194,0,2,176,7,23,109,111,110,111,95,111,98,106,101,99,116,95
	.byte 110,101,119,95,112,116,114,102,114,101,101,0,3,194,0,0,162,3,255,255,0,0,0,1,255,43,0,0,1,3,193,0
	.byte 0,6,3,193,0,0,10,3,193,0,0,7,7,27,109,111,110,111,95,111,98,106,101,99,116,95,110,101,119,95,112,116
	.byte 114,102,114,101,101,95,98,111,120,0,7,30,109,111,110,111,95,99,114,101,97,116,101,95,99,111,114,108,105,98,95,101
	.byte 120,99,101,112,116,105,111,110,95,48,0,7,25,109,111,110,111,95,97,114,99,104,95,116,104,114,111,119,95,101,120,99
	.byte 101,112,116,105,111,110,0,3,255,254,0,0,0,219,0,0,0,21,63,0,1,129,36,0,0,198,0,1,245,1,1,129
	.byte 36,0,0,31,193,0,0,6,7,35,109,111,110,111,95,116,104,114,101,97,100,95,105,110,116,101,114,114,117,112,116,105
	.byte 111,110,95,99,104,101,99,107,112,111,105,110,116,0,31,193,0,0,7,7,20,109,111,110,111,95,115,116,114,105,110,103
	.byte 95,116,111,95,108,112,115,116,114,0,31,193,0,0,8,7,17,109,111,110,111,95,109,97,114,115,104,97,108,95,102,114
	.byte 101,101,0,31,193,0,0,9,31,193,0,0,10
.text
	.align 3
got_info_offsets:

	.long 0,2,3,6,10,13,16,28
	.long 34,38,50
.text
	.align 3
ex_info:
ex:
Le_0_p:

	.byte 52,2,0,0
Le_1_p:

	.byte 44,2,26,0
Le_2_p:

	.byte 84,2,0,0
Le_3_p:

	.byte 52,2,26,0
Le_4_p:

	.byte 100,2,49,0
Le_a_p:

	.byte 128,216,2,0,0
Le_b_p:

	.byte 56,2,26,0
Le_c_p:

	.byte 84,2,0,0
Le_d_p:

	.byte 84,2,0,0
Le_e_p:

	.byte 44,2,0,0
Le_f_p:

	.byte 52,2,0,0
Le_10_p:

	.byte 52,2,0,0
Le_11_p:

	.byte 128,180,2,75,0
Le_12_p:

	.byte 56,2,0,0
Le_13_p:

	.byte 64,2,0,0
Le_15_p:

	.byte 128,148,2,103,0
Le_17_p:

	.byte 76,2,26,0
Le_18_p:

	.byte 76,2,26,0
Le_19_p:

	.byte 104,2,128,129,0
Le_1a_p:

	.byte 76,2,26,0
Le_1b_p:

	.byte 88,2,0,0
.text
	.align 3
ex_info_offsets:

	.long Le_0_p - ex,Le_1_p - ex,Le_2_p - ex,Le_3_p - ex,Le_4_p - ex,0,0,0
	.long 0,0,Le_a_p - ex,Le_b_p - ex,Le_c_p - ex,Le_d_p - ex,Le_e_p - ex,Le_f_p - ex
	.long Le_10_p - ex,Le_11_p - ex,Le_12_p - ex,Le_13_p - ex,0,Le_15_p - ex,0,Le_17_p - ex
	.long Le_18_p - ex,Le_19_p - ex,Le_1a_p - ex,Le_1b_p - ex

.text
	.align 3
unwind_info:

	.byte 25,12,13,0,76,14,8,135,2,68,14,24,136,6,139,5,140,4,142,3,68,14,32,68,13,11,22,12,13,0,76,14
	.byte 8,135,2,68,14,24,136,6,139,5,140,4,142,3,68,13,11,25,12,13,0,76,14,8,135,2,68,14,24,136,6,139
	.byte 5,140,4,142,3,68,14,40,68,13,11,27,12,13,0,76,14,8,135,2,68,14,28,136,7,138,6,139,5,140,4,142
	.byte 3,68,14,40,68,13,11,25,12,13,0,76,14,8,135,2,68,14,24,136,6,139,5,140,4,142,3,68,14,48,68,13
	.byte 11,27,12,13,0,76,14,8,135,2,68,14,28,136,7,138,6,139,5,140,4,142,3,68,14,32,68,13,11
.text
	.align 3
class_info:
LK_I_0:

	.byte 0,128,144,8,0,0,1
LK_I_1:

	.byte 4,128,200,20,4,0,4,194,0,2,175,194,0,2,172,138,244,194,0,2,171
LK_I_2:

	.byte 9,128,160,16,0,0,4,138,248,138,245,138,244,138,242,193,0,0,16,193,0,0,17,193,0,0,18,193,0,0,20,193
	.byte 0,0,19
.text
	.align 3
class_info_offsets:

	.long LK_I_0 - class_info,LK_I_1 - class_info,LK_I_2 - class_info


.text
	.align 4
plt:
mono_aot_Assembly_CSharp_firstpass_plt:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 40,0
p_1:
plt_UnityEngine_MonoBehaviour__ctor:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 44,51
p_2:
plt_OverlayWindow_get_instance:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 48,56
p_3:
plt_UnityEngine_Application_get_platform:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 52,61
p_4:
plt_OverlayWindow__OverlayWindowShow_string:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 56,66
p_5:
plt_UnityEngine_Debug_Log_object:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 60,71
p_6:
plt_OverlayWindow__OverlayWindowHide:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 64,76
p_7:
plt__jit_icall_mono_object_new_fast:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 68,81
p_8:
plt_UnityEngine_MonoBehaviour_StartCoroutine_System_Collections_IEnumerator:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 72,104
p_9:
plt_UnityEngine_Object_op_Implicit_UnityEngine_Object:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 76,109
p_10:
plt__jit_icall_mono_object_new_ptrfree:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 80,114
p_11:
plt_UnityEngine_GameObject__ctor_string:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 84,140
p_12:
plt_UnityEngine_GameObject_AddComponent_OverlayWindow:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 88,145
p_13:
plt_OverlayWindow__OverlayWindowInstall:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 92,157
p_14:
plt_OverlayWindow__OverlayWindowUpdate:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 96,162
p_15:
plt_OverlayWindow__OverlayWindowUninstall:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 100,167
p_16:
plt__jit_icall_mono_object_new_ptrfree_box:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 104,172
p_17:
plt__jit_icall_mono_create_corlib_exception_0:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 108,202
p_18:
plt__jit_icall_mono_arch_throw_exception:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 112,235
p_19:
plt_System_Array_InternalEnumerator_1_object__ctor_System_Array:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 116,263
p_20:
plt__icall_native_OverlayWindow__OverlayWindowInstall:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 120,291
p_21:
plt__jit_icall_mono_thread_interruption_checkpoint:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 124,296
p_22:
plt__icall_native_OverlayWindow__OverlayWindowUninstall:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 128,334
p_23:
plt__jit_icall_mono_string_to_lpstr:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 132,339
p_24:
plt__icall_native_OverlayWindow__OverlayWindowShow_string:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 136,362
p_25:
plt__jit_icall_mono_marshal_free:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 140,367
p_26:
plt__icall_native_OverlayWindow__OverlayWindowHide:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 144,387
p_27:
plt__icall_native_OverlayWindow__OverlayWindowUpdate:

	.byte 0,192,159,229,12,240,159,231
	.long mono_aot_Assembly_CSharp_firstpass_got - . + 148,392
plt_end:
.text
	.align 3
mono_image_table:

	.long 3
	.asciz "mscorlib"
	.asciz "13383F99-8205-4C5B-B97E-EDAFC380D389"
	.asciz ""
	.asciz "7cec85d7bea7798e"
	.align 3

	.long 1,2,0,5,0
	.asciz "Assembly-CSharp-firstpass"
	.asciz "C865EFA5-5E41-4349-AFA7-4EB4AA75D827"
	.asciz ""
	.asciz ""
	.align 3

	.long 0,0,0,0,0
	.asciz "UnityEngine"
	.asciz "A8647889-356B-4391-9E52-B3FD702CBCB7"
	.asciz ""
	.asciz ""
	.align 3

	.long 0,0,0,0,0
.data
	.align 3
mono_aot_Assembly_CSharp_firstpass_got:
	.space 156
got_end:
.data
	.align 3
mono_aot_got_addr:
	.align 2
	.long mono_aot_Assembly_CSharp_firstpass_got
.data
	.align 3
mono_aot_file_info:

	.long 11,156,28,28,1024,1024,128,0
	.long 0,0,0,0,0
.text
mono_assembly_guid:
	.asciz "C865EFA5-5E41-4349-AFA7-4EB4AA75D827"
.text
mono_aot_version:
	.asciz "66"
.text
mono_aot_opt_flags:
	.asciz "55650815"
.text
mono_aot_full_aot:
	.asciz "TRUE"
.text
mono_runtime_version:
	.asciz ""
.text
mono_aot_assembly_name:
	.asciz "Assembly-CSharp-firstpass"
.text
	.align 3
Lglobals_hash:

	.short 73, 26, 0, 0, 0, 0, 0, 0
	.short 0, 14, 0, 18, 0, 0, 0, 0
	.short 0, 5, 0, 0, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0, 28
	.short 0, 12, 0, 4, 0, 0, 0, 0
	.short 0, 3, 0, 27, 0, 0, 0, 8
	.short 0, 0, 0, 0, 0, 0, 0, 13
	.short 0, 1, 0, 0, 0, 0, 0, 11
	.short 74, 0, 0, 0, 0, 0, 0, 29
	.short 0, 2, 75, 0, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0, 0
	.short 0, 21, 0, 0, 0, 0, 0, 0
	.short 0, 10, 0, 16, 0, 7, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 15, 0, 19
	.short 0, 6, 73, 23, 0, 9, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0, 0
	.short 0, 20, 0, 17, 76, 22, 0, 24
	.short 0, 25, 0
.text
name_0:
	.asciz "methods"
.text
name_1:
	.asciz "methods_end"
.text
name_2:
	.asciz "method_offsets"
.text
name_3:
	.asciz "method_info"
.text
name_4:
	.asciz "method_info_offsets"
.text
name_5:
	.asciz "extra_method_info"
.text
name_6:
	.asciz "extra_method_table"
.text
name_7:
	.asciz "extra_method_info_offsets"
.text
name_8:
	.asciz "method_order"
.text
name_9:
	.asciz "method_order_end"
.text
name_10:
	.asciz "class_name_table"
.text
name_11:
	.asciz "got_info"
.text
name_12:
	.asciz "got_info_offsets"
.text
name_13:
	.asciz "ex_info"
.text
name_14:
	.asciz "ex_info_offsets"
.text
name_15:
	.asciz "unwind_info"
.text
name_16:
	.asciz "class_info"
.text
name_17:
	.asciz "class_info_offsets"
.text
name_18:
	.asciz "plt"
.text
name_19:
	.asciz "plt_end"
.text
name_20:
	.asciz "mono_image_table"
.text
name_21:
	.asciz "mono_aot_got_addr"
.text
name_22:
	.asciz "mono_aot_file_info"
.text
name_23:
	.asciz "mono_assembly_guid"
.text
name_24:
	.asciz "mono_aot_version"
.text
name_25:
	.asciz "mono_aot_opt_flags"
.text
name_26:
	.asciz "mono_aot_full_aot"
.text
name_27:
	.asciz "mono_runtime_version"
.text
name_28:
	.asciz "mono_aot_assembly_name"
.data
	.align 3
Lglobals:
	.align 2
	.long Lglobals_hash
	.align 2
	.long name_0
	.align 2
	.long methods
	.align 2
	.long name_1
	.align 2
	.long methods_end
	.align 2
	.long name_2
	.align 2
	.long method_offsets
	.align 2
	.long name_3
	.align 2
	.long method_info
	.align 2
	.long name_4
	.align 2
	.long method_info_offsets
	.align 2
	.long name_5
	.align 2
	.long extra_method_info
	.align 2
	.long name_6
	.align 2
	.long extra_method_table
	.align 2
	.long name_7
	.align 2
	.long extra_method_info_offsets
	.align 2
	.long name_8
	.align 2
	.long method_order
	.align 2
	.long name_9
	.align 2
	.long method_order_end
	.align 2
	.long name_10
	.align 2
	.long class_name_table
	.align 2
	.long name_11
	.align 2
	.long got_info
	.align 2
	.long name_12
	.align 2
	.long got_info_offsets
	.align 2
	.long name_13
	.align 2
	.long ex_info
	.align 2
	.long name_14
	.align 2
	.long ex_info_offsets
	.align 2
	.long name_15
	.align 2
	.long unwind_info
	.align 2
	.long name_16
	.align 2
	.long class_info
	.align 2
	.long name_17
	.align 2
	.long class_info_offsets
	.align 2
	.long name_18
	.align 2
	.long plt
	.align 2
	.long name_19
	.align 2
	.long plt_end
	.align 2
	.long name_20
	.align 2
	.long mono_image_table
	.align 2
	.long name_21
	.align 2
	.long mono_aot_got_addr
	.align 2
	.long name_22
	.align 2
	.long mono_aot_file_info
	.align 2
	.long name_23
	.align 2
	.long mono_assembly_guid
	.align 2
	.long name_24
	.align 2
	.long mono_aot_version
	.align 2
	.long name_25
	.align 2
	.long mono_aot_opt_flags
	.align 2
	.long name_26
	.align 2
	.long mono_aot_full_aot
	.align 2
	.long name_27
	.align 2
	.long mono_runtime_version
	.align 2
	.long name_28
	.align 2
	.long mono_aot_assembly_name

	.long 0,0
	.globl _mono_aot_module_Assembly_CSharp_firstpass_info
	.align 3
_mono_aot_module_Assembly_CSharp_firstpass_info:
	.align 2
	.long Lglobals
.text
	.align 3
mem_end:
#endif
