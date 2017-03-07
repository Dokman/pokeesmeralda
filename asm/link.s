	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80093CC
sub_80093CC: @ 80093CC
	push {lr}
	bl sub_800B488
	bl sub_800E700
	bl sub_800BEC0
	ldr r1, =0x00008001
	cmp r0, r1
	beq _080093F4
	bl sub_800B4A4
	bl sub_80097E8
	bl RestoreSerialTimer3IntrHandlers
	movs r0, 0
	b _080093FE
	.pool
_080093F4:
	bl rfu_REQ_stopMode
	bl rfu_waitREQComplete
	movs r0, 0x1
_080093FE:
	pop {r1}
	bx r1
	thumb_func_end sub_80093CC

	thumb_func_start sub_8009404
sub_8009404: @ 8009404
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	thumb_func_end sub_8009404

	thumb_func_start sub_8009414
sub_8009414: @ 8009414
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	ldr r4, [sp, 0x18]
	lsls r5, 24
	lsrs r5, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r4, 16
	lsrs r4, 16
	ldr r0, =gUnknown_082ECF20
	lsls r1, r5, 4
	movs r2, 0x20
	bl LoadPalette
	ldr r3, =0x040000d4
	ldr r0, =gUnknown_082ECF40
	str r0, [r3]
	lsls r2, r7, 14
	lsls r0, r4, 5
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	adds r2, r0
	str r2, [r3, 0x4]
	ldr r0, =0x80000110
	str r0, [r3, 0x8]
	ldr r0, [r3, 0x8]
	ldr r0, =gUnknown_03003130
	str r6, [r0]
	str r5, [r0, 0x4]
	str r4, [r0, 0x8]
	mov r0, r8
	cmp r0, 0x2
	beq _0800949E
	cmp r0, 0x2
	bgt _08009484
	cmp r0, 0x1
	beq _0800948C
	b _080094C0
	.pool
_08009484:
	mov r0, r8
	cmp r0, 0x3
	beq _080094B0
	b _080094C0
_0800948C:
	lsls r1, r6, 8
	movs r0, 0x1
	orrs r1, r0
	lsls r0, r7, 2
	orrs r1, r0
	movs r0, 0xA
	bl SetGpuReg
	b _080094C0
_0800949E:
	lsls r1, r6, 8
	movs r0, 0x1
	orrs r1, r0
	lsls r0, r7, 2
	orrs r1, r0
	movs r0, 0xC
	bl SetGpuReg
	b _080094C0
_080094B0:
	lsls r1, r6, 8
	movs r0, 0x1
	orrs r1, r0
	lsls r0, r7, 2
	orrs r1, r0
	movs r0, 0xE
	bl SetGpuReg
_080094C0:
	mov r0, r8
	lsls r4, r0, 2
	adds r0, r4, 0
	adds r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl SetGpuReg
	adds r4, 0x12
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0
	bl SetGpuReg
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8009414

	thumb_func_start sub_80094EC
sub_80094EC: @ 80094EC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r6, r1, 0
	adds r4, r2, 0
	adds r5, r3, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, =gUnknown_082ECF20
	mov r2, r8
	lsls r1, r2, 4
	movs r2, 0x20
	bl LoadPalette
	ldr r2, =0x040000d4
	ldr r0, =gUnknown_082ECF40
	str r0, [r2]
	lsls r0, r5, 14
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	str r0, [r2, 0x4]
	ldr r0, =0x80000110
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, =gUnknown_03003130
	str r4, [r0]
	mov r1, r8
	str r1, [r0, 0x4]
	movs r1, 0
	str r1, [r0, 0x8]
	ldr r0, =gUnknown_082ED1D0
	adds r6, r0
	ldrb r0, [r6]
	lsls r4, 8
	lsls r5, 2
	orrs r4, r5
	adds r1, r4, 0
	bl SetGpuReg
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80094EC

	thumb_func_start sub_8009570
sub_8009570: @ 8009570
	push {r4,lr}
	sub sp, 0x4
	bl ResetAllObjectData
	bl ResetObjectPaletteAllocator
	bl ResetTasks
	ldr r0, =sub_80096BC
	bl SetVBlankCallback
	bl sub_800A2E0
	ldr r1, =gUnknown_020229C6
	ldr r2, =0x00001111
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_8009734
	ldr r0, =gMain
	ldrh r0, [r0, 0x24]
	bl SeedRng
	movs r4, 0
_080095A0:
	bl Random
	ldr r1, =gSaveBlock2Ptr
	ldr r1, [r1]
	adds r1, 0xA
	adds r1, r4
	strb r0, [r1]
	adds r4, 0x1
	cmp r4, 0x3
	ble _080095A0
	movs r4, 0
	str r4, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x4
	movs r3, 0
	bl sub_8009414
	movs r1, 0xAA
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r0, =sub_8009404
	movs r1, 0
	bl CreateTask
	bl RunTasks
	bl CallObjectCallbacks
	bl PrepareSpritesForOamLoad
	bl UpdatePaletteFade
	ldr r0, =gUnknown_03000D60
	str r4, [r0]
	bl sub_8009638
	ldr r0, =task00_link_test
	movs r1, 0
	bl CreateTask
	ldr r0, =c2_08009A8C
	bl SetMainCallback2
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8009570

	thumb_func_start sub_8009628
sub_8009628: @ 8009628
	lsls r0, 24
	lsrs r0, 24
	ldr r1, =gUnknown_020229CC
	strh r0, [r1, 0x18]
	bx lr
	.pool
	thumb_func_end sub_8009628

	thumb_func_start sub_8009638
sub_8009638: @ 8009638
	push {r4,r5,lr}
	ldr r5, =gUnknown_020229CC
	ldr r4, =gSaveBlock2Ptr
	ldr r1, [r4]
	ldrb r2, [r1, 0xA]
	ldrb r0, [r1, 0xB]
	lsls r0, 8
	orrs r2, r0
	ldrb r0, [r1, 0xC]
	lsls r0, 16
	orrs r2, r0
	ldrb r0, [r1, 0xD]
	lsls r0, 24
	orrs r2, r0
	str r2, [r5, 0x4]
	adds r0, r5, 0
	adds r0, 0x8
	bl StringCopy
	ldr r0, [r4]
	ldrb r0, [r0, 0x8]
	strb r0, [r5, 0x13]
	ldr r0, =gUnknown_020229C6
	ldrh r0, [r0]
	str r0, [r5, 0x14]
	ldr r0, =gGameLanguage
	ldrb r0, [r0]
	strh r0, [r5, 0x1A]
	ldr r0, =gGameVersion
	ldrb r0, [r0]
	movs r2, 0x80
	lsls r2, 7
	adds r1, r2, 0
	adds r0, r1
	strh r0, [r5]
	movs r0, 0x80
	lsls r0, 8
	strh r0, [r5, 0x2]
	bl sub_809D42C
	strb r0, [r5, 0x10]
	ldr r0, =0x0000087f
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0800969E
	ldrb r0, [r5, 0x10]
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r5, 0x10]
_0800969E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8009638

	thumb_func_start sub_80096BC
sub_80096BC: @ 80096BC
	push {lr}
	bl LoadOamFromSprites
	bl ProcessObjectCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_80096BC

	thumb_func_start sub_80096D0
sub_80096D0: @ 80096D0
	push {lr}
	ldr r3, =gUnknown_020229C4
	ldr r1, =gUnknown_03003110
	ldr r2, =0x0000efff
	adds r0, r1, 0
	adds r0, 0xE
_080096DC:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _080096DC
	movs r0, 0x1
	strb r0, [r3]
	bl sub_800B594
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80096D0

	thumb_func_start task02_080097CC
task02_080097CC: @ 80096FC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _08009726
	ldr r1, =gUnknown_03003144
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r2, 0
	bl DestroyTask
_08009726:
	pop {r0}
	bx r0
	.pool
	thumb_func_end task02_080097CC

	thumb_func_start sub_8009734
sub_8009734: @ 8009734
	push {r4-r6,lr}
	ldr r0, =gLinkVSyncDisabled
	ldrb r4, [r0]
	cmp r4, 0
	bne _080097A8
	bl sub_800B628
	bl sub_80096D0
	ldr r1, =gUnknown_03003140
	ldr r0, =sub_800A824
	str r0, [r1]
	ldr r0, =gUnknown_03002748
	strb r4, [r0]
	ldr r0, =gUnknown_0300306C
	strb r4, [r0]
	ldr r0, =gUnknown_030030F8
	strb r4, [r0]
	bl sub_800A5B4
	bl sub_800A2E0
	ldr r0, =gUnknown_03000D54
	str r4, [r0]
	ldr r0, =gUnknown_030030E8
	strb r4, [r0]
	ldr r0, =gUnknown_030030E4
	strb r4, [r0]
	ldr r0, =gUnknown_030030F4
	strh r4, [r0]
	ldr r0, =task02_080097CC
	movs r1, 0x2
	bl CreateTask
	b _080097AC
	.pool
_080097A8:
	bl sub_800E700
_080097AC:
	ldr r1, =gUnknown_03003124
	movs r0, 0
	strb r0, [r1]
	movs r1, 0
	ldr r6, =gUnknown_03003078
	movs r2, 0
	movs r5, 0x1
	ldr r4, =gUnknown_030030F0
	ldr r3, =gUnknown_030030EC
_080097BE:
	adds r0, r1, r6
	strb r5, [r0]
	adds r0, r1, r4
	strb r2, [r0]
	adds r0, r1, r3
	strb r2, [r0]
	adds r1, 0x1
	cmp r1, 0x3
	ble _080097BE
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8009734

	thumb_func_start sub_80097E8
sub_80097E8: @ 80097E8
	push {r4,lr}
	ldr r0, =gUnknown_03003124
	movs r4, 0
	strb r4, [r0]
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0
	beq _080097FC
	bl sub_800EDD4
_080097FC:
	ldr r0, =gUnknown_020229C4
	strb r4, [r0]
	bl sub_800B53C
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80097E8

	thumb_func_start sub_8009818
sub_8009818: @ 8009818
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r5, =gUnknown_03000D64
	ldr r4, =gUnknown_03000D10
	ldrb r0, [r5]
	ldrh r1, [r4]
	cmp r0, r1
	beq _0800983C
	ldrh r0, [r4]
	movs r1, 0x2
	movs r2, 0x3
	movs r3, 0x2
	bl sub_800A6E8
	ldrh r0, [r4]
	strb r0, [r5]
_0800983C:
	movs r5, 0
	ldr r7, =gUnknown_03000D20
_08009840:
	ldr r0, =gUnknown_03000D68
	adds r6, r5, r0
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 2
	adds r4, r0, r7
	ldrb r0, [r6]
	ldrh r1, [r4]
	cmp r0, r1
	beq _08009868
	ldrh r0, [r4]
	adds r2, r5, 0x4
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x2
	movs r3, 0x2
	bl sub_800A6E8
	ldrh r0, [r4]
	strb r0, [r6]
_08009868:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _08009840
	bl sub_800A550
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0xF
	bne _080098CE
	movs r5, 0
	ldr r0, =gUnknown_03000D20
	mov r9, r0
	ldr r1, =0x00000342
	mov r8, r1
_08009888:
	adds r0, r7, 0
	asrs r0, r5
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080098C4
	lsls r0, r5, 8
	ldr r1, =gUnknown_020223C4
	adds r0, r1
	lsls r4, r5, 1
	adds r1, r4, r5
	lsls r1, 2
	add r1, r9
	ldrh r1, [r1, 0x2]
	bl sub_800A648
	ldr r1, =gUnknown_03003148
	adds r4, r1
	movs r6, 0
	strh r0, [r4]
	adds r0, r5, 0
	bl sub_800A5EC
	ldrh r0, [r4]
	cmp r0, r8
	beq _080098C4
	ldr r0, =gUnknown_020223BC
	strb r6, [r0]
	ldr r0, =gUnknown_020223BD
	strb r6, [r0]
_080098C4:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _08009888
_080098CE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8009818

	thumb_func_start sub_8009900
sub_8009900: @ 8009900
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r4, =gMain
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08009916
	ldr r1, =gUnknown_03003144
	movs r0, 0x1
	strb r0, [r1]
_08009916:
	ldrh r1, [r4, 0x2C]
	movs r5, 0x2
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _0800992A
	ldr r0, =0x02004000
	ldr r1, =0x00002004
	bl sub_800A2F4
_0800992A:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _08009946
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_08009946:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08009956
	movs r0, 0x1
	bl sub_800B330
_08009956:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _08009968
	movs r0, 0x1
	bl save_game_when_memory_present
_08009968:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08009976
	bl sub_800AC34
_08009976:
	ldr r0, =gUnknown_020223BC
	ldrb r0, [r0]
	cmp r0, 0
	beq _08009996
	ldr r2, [r4, 0x24]
	ldr r0, =gUnknown_03002748
	ldrb r1, [r0]
	ldr r0, =gUnknown_03003140
	ldr r0, [r0]
	cmp r0, 0
	bne _08009990
	movs r0, 0x10
	orrs r1, r0
_08009990:
	adds r0, r2, 0
	bl sub_800A994
_08009996:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8009900

	thumb_func_start c2_08009A8C
c2_08009A8C: @ 80099BC
	push {lr}
	bl sub_8009900
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl sub_8009818
	bl RunTasks
	bl CallObjectCallbacks
	bl PrepareSpritesForOamLoad
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end c2_08009A8C

	thumb_func_start sub_80099E0
sub_80099E0: @ 80099E0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, =gUnknown_020229C4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080099F4
	movs r0, 0
	b _08009A3C
	.pool
_080099F4:
	movs r1, 0
	ldr r5, =gUnknown_03003084
	ldr r3, =gUnknown_03003110
	movs r2, 0
_080099FC:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _080099FC
	ldrh r0, [r4]
	strh r0, [r5]
	ldr r0, =gUnknown_030030E0
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08009A38
	ldr r0, =0x04000128
	ldr r0, [r0]
	lsls r0, 26
	lsrs r0, 30
	bl sub_8009AA0
	ldr r0, =gUnknown_03003140
	ldr r0, [r0]
	cmp r0, 0
	beq _08009A34
	bl _call_via_r0
_08009A34:
	bl sub_800AEB4
_08009A38:
	ldr r0, =gUnknown_030030E0
	ldrh r0, [r0]
_08009A3C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_80099E0

	thumb_func_start sub_8009A58
sub_8009A58: @ 8009A58
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	ldr r1, =gUnknown_03003078
	adds r0, r1
	strb r5, [r0]
	movs r4, 0
	adds r6, r1, 0
	b _08009A78
	.pool
_08009A70:
	adds r0, r4, r6
	ldrb r0, [r0]
	adds r5, r0
	adds r4, 0x1
_08009A78:
	bl sub_800ABAC
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _08009A70
	cmp r5, 0
	bne _08009A94
	ldr r1, =gUnknown_03003124
	ldrb r0, [r1]
	cmp r0, 0
	bne _08009A94
	movs r0, 0x1
	strb r0, [r1]
_08009A94:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8009A58

	thumb_func_start sub_8009AA0
sub_8009AA0: @ 8009AA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r6, 0
_08009AAE:
	ldr r0, =gUnknown_03003020
	lsls r1, r6, 1
	adds r3, r1, r0
	movs r0, 0
	strh r0, [r3]
	lsls r4, r6, 4
	ldr r5, =gUnknown_03003090
	adds r2, r4, r5
	ldrh r0, [r2]
	mov r12, r1
	adds r7, r6, 0x1
	str r7, [sp]
	cmp r0, 0
	bne _08009ACC
	b _08009D6E
_08009ACC:
	ldrh r1, [r2]
	ldr r0, =0x00005fff
	cmp r1, r0
	bne _08009AD6
	b _08009D20
_08009AD6:
	cmp r1, r0
	bgt _08009B24
	ldr r0, =0x00004444
	cmp r1, r0
	bne _08009AE2
	b _08009D64
_08009AE2:
	cmp r1, r0
	bgt _08009B10
	ldr r0, =0x00002222
	cmp r1, r0
	beq _08009B68
	ldr r0, =0x00002ffe
	cmp r1, r0
	bne _08009AF4
	b _08009D28
_08009AF4:
	b _08009D6E
	.pool
_08009B10:
	ldr r0, =0x00005555
	cmp r1, r0
	beq _08009BB8
	adds r0, 0x11
	cmp r1, r0
	beq _08009BB8
	b _08009D6E
	.pool
_08009B24:
	ldr r0, =0x0000bbbb
	cmp r1, r0
	beq _08009BC4
	cmp r1, r0
	bgt _08009B4C
	ldr r0, =0x00008888
	cmp r1, r0
	beq _08009BF0
	ldr r0, =0x0000aaaa
	cmp r1, r0
	bne _08009B3C
	b _08009D38
_08009B3C:
	b _08009D6E
	.pool
_08009B4C:
	ldr r0, =0x0000cafe
	cmp r1, r0
	bne _08009B54
	b _08009D64
_08009B54:
	ldr r0, =0x0000cccc
	cmp r1, r0
	bne _08009B5C
	b _08009D3E
_08009B5C:
	b _08009D6E
	.pool
_08009B68:
	bl sub_8009638
	ldr r0, =gUnknown_03003030
	adds r2, r0, 0
	adds r2, 0x10
	ldr r1, =gUnknown_020229CC
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	ldm r1!, {r3,r6,r7}
	stm r2!, {r3,r6,r7}
	ldr r1, [r1]
	str r1, [r2]
	ldr r4, =gUnknown_082ED1D4
	adds r2, r0, 0
	adds r1, r4, 0
	ldm r1!, {r5-r7}
	stm r2!, {r5-r7}
	ldrh r3, [r1]
	strh r3, [r2]
	ldrb r1, [r1, 0x2]
	strb r1, [r2, 0x2]
	adds r1, r0, 0
	adds r1, 0x2C
	ldm r4!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldrh r2, [r4]
	strh r2, [r1]
	ldrb r2, [r4, 0x2]
	strb r2, [r1, 0x2]
	movs r1, 0x3C
	bl sub_800A2F4
	b _08009D6E
	.pool
_08009BB8:
	ldr r1, =gUnknown_030030E8
	movs r0, 0x1
	strb r0, [r1]
	b _08009D6E
	.pool
_08009BC4:
	mov r7, r12
	adds r1, r7, r6
	lsls r1, 2
	ldr r0, =gUnknown_03000D20
	adds r1, r0
	movs r2, 0
	strh r2, [r1]
	ldr r0, =gUnknown_03003090
	adds r0, 0x2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r1, 0x2]
	ldr r0, =gUnknown_03003090
	adds r0, 0x4
	adds r0, r4, r0
	ldrh r0, [r0]
	strb r0, [r1, 0x9]
	b _08009D6E
	.pool
_08009BF0:
	mov r3, r12
	adds r0, r3, r6
	lsls r0, 2
	ldr r5, =gUnknown_03000D20
	adds r3, r0, r5
	ldrh r1, [r3, 0x2]
	movs r0, 0x80
	lsls r0, 1
	adds r7, r5, 0
	mov r10, r7
	cmp r1, r0
	bls _08009C40
	ldr r0, =0x0201c000
	mov r8, r0
	movs r2, 0
	adds r5, r3, 0
	ldr r7, =gUnknown_03003090
	adds r3, r4, 0
_08009C14:
	ldrh r1, [r5]
	lsrs r1, 1
	adds r1, r2
	lsls r1, 1
	add r1, r8
	adds r2, 0x1
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r2, 16
	lsrs r2, 16
	cmp r2, 0x6
	bls _08009C14
	b _08009C70
	.pool
_08009C40:
	movs r2, 0
	ldr r1, =gUnknown_020223C4
	mov r9, r1
	adds r7, r3, 0
	ldr r3, =gUnknown_03003090
	mov r8, r3
	lsls r5, r6, 8
	adds r3, r4, 0
_08009C50:
	ldrh r1, [r7]
	lsrs r1, 1
	adds r1, r2
	lsls r1, 1
	adds r1, r5
	add r1, r9
	adds r2, 0x1
	lsls r0, r2, 1
	adds r0, r3
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r2, 16
	lsrs r2, 16
	cmp r2, 0x6
	bls _08009C50
_08009C70:
	mov r4, r12
	adds r1, r4, r6
	lsls r1, 2
	add r1, r10
	ldrh r0, [r1]
	adds r0, 0xE
	movs r3, 0
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1, 0x2]
	cmp r0, r1
	bcc _08009D6E
	ldr r0, =gUnknown_03003078
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08009D16
	lsls r1, r6, 8
	ldr r0, =gUnknown_020223C4
	adds r1, r0
	mov r8, r1
	lsls r0, r6, 3
	subs r0, r6
	lsls r0, 2
	ldr r1, =gUnknown_020229E8
	adds r2, r0, r1
	adds r1, r2, 0
	mov r0, r8
	adds r0, 0x10
	ldm r0!, {r4,r5,r7}
	stm r1!, {r4,r5,r7}
	ldm r0!, {r4,r5,r7}
	stm r1!, {r4,r5,r7}
	ldr r0, [r0]
	str r0, [r1]
	ldrb r0, [r2]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _08009CCA
	strb r3, [r2, 0x12]
	strb r3, [r2, 0x11]
	strb r3, [r2, 0x10]
_08009CCA:
	adds r0, r2, 0
	bl sub_800B524
	ldr r5, =gUnknown_082ED1D4
	mov r0, r8
	adds r1, r5, 0
	bl strcmp
	cmp r0, 0
	bne _08009CEC
	mov r0, r8
	adds r0, 0x2C
	adds r1, r5, 0
	bl strcmp
	cmp r0, 0
	beq _08009D0C
_08009CEC:
	ldr r0, =c2_800ACD4
	bl SetMainCallback2
	b _08009D6E
	.pool
_08009D0C:
	lsls r0, r6, 24
	lsrs r0, 24
	bl sub_8009A58
	b _08009D6E
_08009D16:
	lsls r0, r6, 24
	lsrs r0, 24
	bl sub_800A588
	b _08009D6E
_08009D20:
	ldr r0, =gUnknown_030030F0
	b _08009D2A
	.pool
_08009D28:
	ldr r0, =gUnknown_030030EC
_08009D2A:
	adds r0, r6, r0
	movs r1, 0x1
	strb r1, [r0]
	b _08009D6E
	.pool
_08009D38:
	bl sub_800A418
	b _08009D6E
_08009D3E:
	ldr r3, =gUnknown_082ED1A8
	ldr r0, =gUnknown_03003090
	adds r0, 0x2
	adds r0, r4, r0
	ldrh r2, [r0]
	lsls r2, 3
	adds r0, r2, r3
	ldr r1, [r0]
	adds r3, 0x4
	adds r2, r3
	ldrh r2, [r2]
	movs r0, 0
	bl link_0800A448
	b _08009D6E
	.pool
_08009D64:
	ldr r0, =gUnknown_03003090
	adds r0, 0x2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r3]
_08009D6E:
	ldr r5, [sp]
	lsls r0, r5, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bhi _08009D7A
	b _08009AAE
_08009D7A:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8009AA0

	thumb_func_start sub_8009D90
sub_8009D90: @ 8009D90
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, =0x00006666
	cmp r2, r0
	beq _08009E60
	cmp r2, r0
	bgt _08009DF0
	ldr r0, =0x00004444
	cmp r2, r0
	beq _08009E4C
	cmp r2, r0
	bgt _08009DCC
	ldr r0, =0x00002222
	cmp r2, r0
	beq _08009E38
	ldr r0, =0x00002ffe
_08009DB2:
	cmp r2, r0
	bne _08009DB8
	b _08009EE4
_08009DB8:
	b _08009F06
	.pool
_08009DCC:
	ldr r0, =0x00005566
	cmp r2, r0
	bne _08009DD4
	b _08009EE4
_08009DD4:
	cmp r2, r0
	bgt _08009DE0
	subs r0, 0x11
	b _08009DB2
	.pool
_08009DE0:
	ldr r0, =0x00005fff
	cmp r2, r0
	bne _08009DE8
	b _08009ED0
_08009DE8:
	b _08009F06
	.pool
_08009DF0:
	ldr r0, =0x0000aaab
	cmp r2, r0
	beq _08009EA8
	cmp r2, r0
	bgt _08009E10
	ldr r0, =0x00007777
	cmp r2, r0
	beq _08009E6C
	ldr r0, =0x0000aaaa
	b _08009DB2
	.pool
_08009E10:
	ldr r0, =0x0000cafe
	cmp r2, r0
	beq _08009EF0
	cmp r2, r0
	bgt _08009E2C
	ldr r0, =0x0000bbbb
	cmp r2, r0
	beq _08009E8C
	b _08009F06
	.pool
_08009E2C:
	ldr r0, =0x0000cccc
	cmp r2, r0
	beq _08009EBC
	b _08009F06
	.pool
_08009E38:
	ldr r0, =gUnknown_03003110
	strh r2, [r0]
	ldr r1, =gUnknown_020229C6
	ldrh r1, [r1]
	b _08009F04
	.pool
_08009E4C:
	ldr r0, =gUnknown_03003110
	strh r2, [r0]
	ldr r1, =gMain
	ldrh r1, [r1, 0x2C]
	b _08009F04
	.pool
_08009E60:
	ldr r0, =gUnknown_03003110
	movs r1, 0
	b _08009F02
	.pool
_08009E6C:
	ldr r0, =gUnknown_03003110
	strh r2, [r0]
	movs r1, 0
	adds r3, r0, 0
	movs r2, 0xEE
_08009E76:
	adds r1, 0x1
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x4
	bls _08009E76
	b _08009F06
	.pool
_08009E8C:
	ldr r1, =gUnknown_03003110
	strh r2, [r1]
	ldr r2, =gUnknown_03000D10
	ldrh r0, [r2, 0x2]
	strh r0, [r1, 0x2]
	ldrb r0, [r2, 0x9]
	adds r0, 0x80
	strh r0, [r1, 0x4]
	b _08009F06
	.pool
_08009EA8:
	ldr r0, =gUnknown_03003110
	strh r2, [r0]
	ldr r1, =gUnknown_0203CE7C
	ldrh r1, [r1]
	b _08009F04
	.pool
_08009EBC:
	ldr r0, =gUnknown_03003110
	strh r2, [r0]
	ldr r1, =gUnknown_03003150
	ldrb r1, [r1]
	b _08009F04
	.pool
_08009ED0:
	ldr r0, =gUnknown_03003110
	strh r2, [r0]
	ldr r1, =gUnknown_030030F4
	ldrh r1, [r1]
	b _08009F04
	.pool
_08009EE4:
	ldr r0, =gUnknown_03003110
	strh r2, [r0]
	b _08009F06
	.pool
_08009EF0:
	ldr r0, =gUnknown_03005DA8
	ldrh r1, [r0]
	cmp r1, 0
	beq _08009F06
	ldr r0, =gUnknown_030022B4
	ldrb r0, [r0]
	cmp r0, 0
	bne _08009F06
	ldr r0, =gUnknown_03003110
_08009F02:
	strh r2, [r0]
_08009F04:
	strh r1, [r0, 0x2]
_08009F06:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8009D90

	thumb_func_start sub_8009F18
sub_8009F18: @ 8009F18
	push {lr}
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0
	beq _08009F26
	bl sub_800F804
_08009F26:
	ldr r1, =gUnknown_03003140
	ldr r0, =sub_8009F70
	str r0, [r1]
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8009F18

	thumb_func_start sub_8009F3C
sub_8009F3C: @ 8009F3C
	push {lr}
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0
	beq _08009F50
	bl sub_800F7E4
	b _08009F6A
	.pool
_08009F50:
	ldr r0, =gUnknown_03003140
	ldr r1, [r0]
	ldr r0, =sub_8009F70
	cmp r1, r0
	beq _08009F68
	movs r0, 0
	b _08009F6A
	.pool
_08009F68:
	movs r0, 0x1
_08009F6A:
	pop {r1}
	bx r1
	thumb_func_end sub_8009F3C

	thumb_func_start sub_8009F70
sub_8009F70: @ 8009F70
	push {lr}
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08009F80
	ldr r0, =0x0000cafe
	bl sub_8009D90
_08009F80:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8009F70

	thumb_func_start sub_8009F8C
sub_8009F8C: @ 8009F8C
	push {lr}
	ldr r0, =gLinkVSyncDisabled
	ldrb r1, [r0]
	cmp r1, 0
	beq _08009FA0
	bl Rfu_set_zero
	b _08009FA4
	.pool
_08009FA0:
	ldr r0, =gUnknown_03003140
	str r1, [r0]
_08009FA4:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8009F8C

	thumb_func_start sub_8009FAC
sub_8009FAC: @ 8009FAC
	push {lr}
	ldr r0, =gLinkVSyncDisabled
	ldrb r1, [r0]
	cmp r1, 0
	beq _08009FC0
	bl Rfu_set_zero
	b _08009FC4
	.pool
_08009FC0:
	ldr r0, =gUnknown_03003140
	str r1, [r0]
_08009FC4:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8009FAC

	thumb_func_start sub_8009FCC
sub_8009FCC: @ 8009FCC
	push {lr}
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0
	bne _08009FEC
	ldr r0, =gUnknown_030030E0
	ldr r0, [r0]
	movs r1, 0x1C
	ands r0, r1
	lsrs r0, 2
	b _08009FF4
	.pool
_08009FEC:
	bl sub_80104F4
	lsls r0, 24
	lsrs r0, 24
_08009FF4:
	pop {r1}
	bx r1
	thumb_func_end sub_8009FCC

	thumb_func_start sub_8009FF8
sub_8009FF8: @ 8009FF8
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	bl sub_8009FCC
	lsls r0, 24
	lsrs r4, r0, 24
	movs r2, 0
	cmp r2, r4
	bge _0800A030
	movs r7, 0xFF
	ldr r3, =gUnknown_020229E8
_0800A010:
	ldrh r0, [r3]
	adds r1, r7, 0
	ands r1, r0
	cmp r1, r6
	beq _0800A01E
	cmp r1, r5
	bne _0800A028
_0800A01E:
	movs r0, 0x1
	b _0800A034
	.pool
_0800A028:
	adds r3, 0x1C
	adds r2, 0x1
	cmp r2, r4
	blt _0800A010
_0800A030:
	movs r0, 0x1
	negs r0, r0
_0800A034:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8009FF8

	thumb_func_start sub_800A03C
sub_800A03C: @ 800A03C
	movs r0, 0x2
	bx lr
	thumb_func_end sub_800A03C

	thumb_func_start sub_800A040
sub_800A040: @ 800A040
	push {lr}
	bl sub_8009FCC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _0800A05A
	movs r0, 0x2
	movs r1, 0x1
	bl sub_8009FF8
	cmp r0, 0
	bge _0800A05E
_0800A05A:
	movs r0, 0
	b _0800A060
_0800A05E:
	movs r0, 0x1
_0800A060:
	pop {r1}
	bx r1
	thumb_func_end sub_800A040

	thumb_func_start sub_800A064
sub_800A064: @ 800A064
	push {lr}
	movs r0, 0x2
	movs r1, 0x1
	bl sub_8009FF8
	cmp r0, 0
	bge _0800A076
	movs r0, 0
	b _0800A078
_0800A076:
	movs r0, 0x1
_0800A078:
	pop {r1}
	bx r1
	thumb_func_end sub_800A064

	thumb_func_start sub_800A07C
sub_800A07C: @ 800A07C
	push {lr}
	movs r0, 0x4
	movs r1, 0x5
	bl sub_8009FF8
	adds r2, r0, 0
	cmp r2, 0
	blt _0800A0A4
	ldr r0, =gUnknown_020229E8
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x1A]
	cmp r0, 0x1
	bne _0800A0A4
	movs r0, 0x1
	b _0800A0A6
	.pool
_0800A0A4:
	movs r0, 0
_0800A0A6:
	pop {r1}
	bx r1
	thumb_func_end sub_800A07C

	thumb_func_start sub_800A0AC
sub_800A0AC: @ 800A0AC
	push {lr}
	ldr r0, =gUnknown_03000D5C
	movs r1, 0
	str r1, [r0]
	ldr r0, =gUnknown_020229C8
	strh r1, [r0]
	bl sub_8009734
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800A0AC

	thumb_func_start sub_800A0C8
sub_800A0C8: @ 800A0C8
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	movs r7, 0
	ldr r0, =gUnknown_03003124
	ldrb r4, [r0]
	cmp r4, 0x1
	beq _0800A0DA
	b _0800A214
_0800A0DA:
	bl sub_800ABAC
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bgt _0800A0EA
	cmp r0, r6
	ble _0800A0FC
_0800A0EA:
	ldr r1, =gUnknown_03000D5C
	movs r0, 0x6
	str r0, [r1]
	b _0800A22E
	.pool
_0800A0FC:
	bl sub_8009FCC
	lsls r0, 24
	cmp r0, 0
	bne _0800A10E
	ldr r0, =gUnknown_0300306C
	strb r4, [r0]
	bl sub_80097E8
_0800A10E:
	movs r6, 0
	ldr r4, =gUnknown_020229E8
	movs r5, 0
	b _0800A134
	.pool
_0800A120:
	adds r0, r4, 0
	adds r0, 0x14
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r0, [r4, 0x14]
	cmp r1, r0
	bne _0800A130
	adds r7, 0x1
_0800A130:
	adds r5, 0x1C
	adds r6, 0x1
_0800A134:
	bl sub_8009FCC
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	blt _0800A120
	bl sub_8009FCC
	lsls r0, 24
	lsrs r0, 24
	cmp r7, r0
	bne _0800A1AC
	ldr r0, =gUnknown_020229E8
	ldr r1, [r0, 0x14]
	ldr r0, =0x00001133
	cmp r1, r0
	bne _0800A19C
	bl sub_807A728
	cmp r0, 0x1
	beq _0800A184
	cmp r0, 0x1
	bgt _0800A178
	cmp r0, 0
	beq _0800A19C
	ldr r3, =gUnknown_03000D5C
	b _0800A22C
	.pool
_0800A178:
	cmp r0, 0x2
	beq _0800A190
	ldr r3, =gUnknown_03000D5C
	b _0800A22C
	.pool
_0800A184:
	ldr r1, =gUnknown_03000D5C
	movs r0, 0x4
	b _0800A1A0
	.pool
_0800A190:
	ldr r1, =gUnknown_03000D5C
	movs r0, 0x5
	b _0800A1A0
	.pool
_0800A19C:
	ldr r1, =gUnknown_03000D5C
	movs r0, 0x1
_0800A1A0:
	str r0, [r1]
	adds r3, r1, 0
	b _0800A22C
	.pool
_0800A1AC:
	ldr r6, =gUnknown_03000D5C
	movs r0, 0x3
	str r0, [r6]
	ldr r4, =gUnknown_020229E8
	bl link_get_multiplayer_id
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r4, 0x14
	adds r1, r4
	ldr r5, [r1]
	bl link_get_multiplayer_id
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldr r1, [r1]
	ldr r2, =0x00002266
	cmp r5, r2
	bne _0800A1EA
	ldr r0, =0x00002277
	cmp r1, r0
	beq _0800A1F6
_0800A1EA:
	ldr r0, =0x00002277
	adds r3, r6, 0
	cmp r5, r0
	bne _0800A22C
	cmp r1, r2
	bne _0800A22C
_0800A1F6:
	ldr r1, =gUnknown_020375E2
	movs r0, 0x3
	strh r0, [r1]
	ldr r3, =gUnknown_03000D5C
	b _0800A22C
	.pool
_0800A214:
	ldr r0, =gUnknown_020229C8
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	lsls r1, 16
	movs r0, 0x96
	lsls r0, 18
	ldr r3, =gUnknown_03000D5C
	cmp r1, r0
	bls _0800A22C
	movs r0, 0x2
	str r0, [r3]
_0800A22C:
	ldrb r0, [r3]
_0800A22E:
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800A0C8

	thumb_func_start sub_800A23C
sub_800A23C: @ 800A23C
	push {r4-r6,lr}
	movs r6, 0
	movs r4, 0
	ldr r5, =gUnknown_020229E8
	b _0800A26C
	.pool
_0800A24C:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x14
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r5, 0x14]
	cmp r1, r0
	bne _0800A266
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0800A266:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0800A26C:
	bl sub_8009FCC
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _0800A24C
	bl sub_8009FCC
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _0800A290
	movs r2, 0x1
	ldr r0, =gUnknown_03000D5C
	str r2, [r0]
	b _0800A298
	.pool
_0800A290:
	movs r2, 0
	ldr r1, =gUnknown_03000D5C
	movs r0, 0x3
	str r0, [r1]
_0800A298:
	adds r0, r2, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800A23C

	thumb_func_start sub_800A2A4
sub_800A2A4: @ 800A2A4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, =gUnknown_020229E8
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r2, 0x4
	adds r1, r2
	ldr r0, [r1]
	bx lr
	.pool
	thumb_func_end sub_800A2A4

	thumb_func_start sub_800A2BC
sub_800A2BC: @ 800A2BC
	push {r4,r5,lr}
	ldr r5, =gUnknown_020229E8
	movs r4, 0x4
_0800A2C2:
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x1C
	bl memset
	adds r5, 0x1C
	subs r4, 0x1
	cmp r4, 0
	bge _0800A2C2
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800A2BC

	thumb_func_start sub_800A2E0
sub_800A2E0: @ 800A2E0
	ldr r1, =gUnknown_03000D10
	movs r0, 0
	strb r0, [r1, 0x8]
	strh r0, [r1]
	strh r0, [r1, 0x2]
	str r0, [r1, 0x4]
	bx lr
	.pool
	thumb_func_end sub_800A2E0

	thumb_func_start sub_800A2F4
sub_800A2F4: @ 800A2F4
	push {r4-r7,lr}
	adds r7, r0, 0
	adds r6, r1, 0
	ldr r4, =gUnknown_03000D10
	ldrb r5, [r4, 0x8]
	cmp r5, 0
	beq _0800A30C
	movs r0, 0
	b _0800A34A
	.pool
_0800A30C:
	bl link_get_multiplayer_id
	strb r0, [r4, 0x9]
	movs r0, 0x1
	strb r0, [r4, 0x8]
	strh r6, [r4, 0x2]
	strh r5, [r4]
	adds r0, 0xFF
	cmp r6, r0
	bls _0800A324
	str r7, [r4, 0x4]
	b _0800A336
_0800A324:
	ldr r5, =gUnknown_020228C4
	cmp r7, r5
	beq _0800A334
	adds r0, r5, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl memcpy
_0800A334:
	str r5, [r4, 0x4]
_0800A336:
	ldr r0, =0x0000bbbb
	bl sub_8009D90
	ldr r1, =gUnknown_03003140
	ldr r0, =sub_800A364
	str r0, [r1]
	ldr r1, =gUnknown_03000D50
	movs r0, 0
	str r0, [r1]
	movs r0, 0x1
_0800A34A:
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800A2F4

	thumb_func_start sub_800A364
sub_800A364: @ 800A364
	push {lr}
	ldr r1, =gUnknown_03000D50
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x2
	bls _0800A378
	ldr r1, =gUnknown_03003140
	ldr r0, =sub_800A388
	str r0, [r1]
_0800A378:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800A364

	thumb_func_start sub_800A388
sub_800A388: @ 800A388
	push {r4-r6,lr}
	ldr r0, =gUnknown_03000D10
	ldr r5, [r0, 0x4]
	ldr r2, =gUnknown_03003110
	ldr r1, =0x00008888
	strh r1, [r2]
	movs r3, 0
	adds r4, r0, 0
	adds r6, r4, 0
	adds r2, 0x2
_0800A39C:
	lsls r0, r3, 1
	ldrh r1, [r6]
	adds r0, r1
	adds r0, r5
	ldrb r1, [r0, 0x1]
	lsls r1, 8
	ldrb r0, [r0]
	orrs r0, r1
	strh r0, [r2]
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x6
	ble _0800A39C
	ldrh r0, [r4]
	adds r0, 0xE
	strh r0, [r4]
	ldrh r1, [r4, 0x2]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _0800A3D0
	movs r0, 0
	strb r0, [r4, 0x8]
	ldr r1, =gUnknown_03003140
	ldr r0, =sub_800A3EC
	str r0, [r1]
_0800A3D0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800A388

	thumb_func_start sub_800A3EC
sub_800A3EC: @ 800A3EC
	ldr r1, =gUnknown_03003140
	movs r0, 0
	str r0, [r1]
	bx lr
	.pool
	thumb_func_end sub_800A3EC

	thumb_func_start sub_800A3F8
sub_800A3F8: @ 800A3F8
	push {lr}
	bl link_get_multiplayer_id
	ldr r0, =0x00004444
	bl sub_8009D90
	ldr r1, =gUnknown_020223C0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800A3F8

	thumb_func_start sub_800A418
sub_800A418: @ 800A418
	push {lr}
	ldr r1, =gUnknown_020223C0
	movs r0, 0
	str r0, [r1]
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800A438
	bl sub_800F850
	b _0800A43E
	.pool
_0800A438:
	ldr r1, =gUnknown_03003140
	ldr r0, =sub_800A3F8
	str r0, [r1]
_0800A43E:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800A418

	thumb_func_start sub_800A44C
sub_800A44C: @ 800A44C
	ldr r0, =gUnknown_020223C0
	ldr r0, [r0]
	bx lr
	.pool
	thumb_func_end sub_800A44C

	thumb_func_start sub_800A458
sub_800A458: @ 800A458
	push {lr}
	ldr r0, =0x0000aaaa
	bl sub_8009D90
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800A458

	thumb_func_start link_get_multiplayer_id
link_get_multiplayer_id: @ 800A468
	push {lr}
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0800A484
	ldr r0, =0x04000128
	ldr r0, [r0]
	lsls r0, 26
	lsrs r0, 30
	b _0800A48C
	.pool
_0800A484:
	bl rfu_get_multiplayer_id
	lsls r0, 24
	lsrs r0, 24
_0800A48C:
	pop {r1}
	bx r1
	thumb_func_end link_get_multiplayer_id

	thumb_func_start bitmask_all_link_players_but_self
bitmask_all_link_players_but_self: @ 800A490
	push {lr}
	bl link_get_multiplayer_id
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	lsls r0, r1
	movs r1, 0xF
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end bitmask_all_link_players_but_self

	thumb_func_start link_0800A448
link_0800A448: @ 800A4AC
	push {lr}
	adds r3, r1, 0
	lsls r2, 16
	lsrs r1, r2, 16
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0800A4C8
	adds r0, r3, 0
	bl sub_800A2F4
	b _0800A4CE
	.pool
_0800A4C8:
	adds r0, r3, 0
	bl sub_800FE84
_0800A4CE:
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end link_0800A448

	thumb_func_start sub_800A4D8
sub_800A4D8: @ 800A4D8
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800A4F8
	adds r0, r1, 0
	bl sub_8010100
	lsls r0, 24
	lsrs r0, 24
	b _0800A514
	.pool
_0800A4F8:
	ldr r0, =gUnknown_03003140
	ldr r0, [r0]
	cmp r0, 0
	beq _0800A508
	movs r0, 0
	b _0800A514
	.pool
_0800A508:
	ldr r0, =gUnknown_03003150
	strb r2, [r0]
	ldr r0, =0x0000cccc
	bl sub_8009D90
	movs r0, 0x1
_0800A514:
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800A4D8

	thumb_func_start sub_800A520
sub_800A520: @ 800A520
	push {lr}
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800A538
	bl sub_8010500
	lsls r0, 24
	lsrs r0, 24
	b _0800A546
	.pool
_0800A538:
	movs r1, 0
	ldr r0, =gUnknown_03003140
	ldr r0, [r0]
	cmp r0, 0
	bne _0800A544
	movs r1, 0x1
_0800A544:
	adds r0, r1, 0
_0800A546:
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800A520

	thumb_func_start sub_800A550
sub_800A550: @ 800A550
	push {lr}
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0800A57C
	ldr r2, =gUnknown_0300307C
	ldrb r0, [r2, 0x3]
	lsls r0, 3
	ldrb r1, [r2, 0x2]
	lsls r1, 2
	orrs r0, r1
	ldrb r1, [r2, 0x1]
	lsls r1, 1
	orrs r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	b _0800A580
	.pool
_0800A57C:
	bl sub_800FCD8
_0800A580:
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_800A550

	thumb_func_start sub_800A588
sub_800A588: @ 800A588
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800A5A4
	adds r0, r1, 0
	bl sub_800F6FC
	b _0800A5AC
	.pool
_0800A5A4:
	ldr r0, =gUnknown_0300307C
	adds r0, r1, r0
	movs r1, 0x1
	strb r1, [r0]
_0800A5AC:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800A588

	thumb_func_start sub_800A5B4
sub_800A5B4: @ 800A5B4
	push {r4,lr}
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800A5D4
	movs r4, 0
_0800A5C0:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_800F728
	adds r4, 0x1
	cmp r4, 0x4
	ble _0800A5C0
	b _0800A5E2
	.pool
_0800A5D4:
	ldr r1, =gUnknown_0300307C
	movs r2, 0
	adds r0, r1, 0x3
_0800A5DA:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _0800A5DA
_0800A5E2:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800A5B4

	thumb_func_start sub_800A5EC
sub_800A5EC: @ 800A5EC
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800A608
	adds r0, r1, 0
	bl sub_800F728
	b _0800A616
	.pool
_0800A608:
	ldr r0, =gUnknown_0300307C
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0800A616
	movs r0, 0
	strb r0, [r1]
_0800A616:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800A5EC

	thumb_func_start sub_800A620
sub_800A620: @ 800A620
	push {lr}
	ldr r0, =gUnknown_030030E0
	ldr r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0800A63C
	movs r0, 0x1C
	ands r1, r0
	cmp r1, 0x4
	bls _0800A63C
	ldr r1, =gUnknown_03003144
	movs r0, 0x1
	strb r0, [r1]
_0800A63C:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800A620

	thumb_func_start sub_800A648
sub_800A648: @ 800A648
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 16
	movs r3, 0
	movs r2, 0
	lsrs r1, 17
	cmp r3, r1
	bcs _0800A66E
_0800A658:
	lsls r0, r2, 1
	adds r0, r4
	ldrh r0, [r0]
	adds r0, r3, r0
	lsls r0, 16
	lsrs r3, r0, 16
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r1
	bcc _0800A658
_0800A66E:
	adds r0, r3, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_800A648

	thumb_func_start sub_800A678
sub_800A678: @ 800A678
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	ldr r4, =gUnknown_03003130
	ldr r3, [r4]
	lsls r3, 11
	movs r5, 0xC0
	lsls r5, 19
	adds r3, r5
	lsrs r2, 19
	adds r2, r1
	lsls r2, 1
	adds r2, r3
	ldr r3, [r4, 0x4]
	lsls r3, 12
	ldr r1, [r4, 0x8]
	adds r1, 0x1
	adds r0, r1
	orrs r3, r0
	strh r3, [r2]
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800A678

	thumb_func_start sub_800A6B0
sub_800A6B0: @ 800A6B0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	ldr r4, =gUnknown_03003130
	ldr r3, [r4]
	lsls r3, 11
	movs r5, 0xC0
	lsls r5, 19
	adds r3, r5
	lsrs r2, 19
	adds r2, r1
	lsls r2, 1
	adds r2, r3
	ldr r3, [r4, 0x4]
	lsls r3, 12
	ldr r1, [r4, 0x8]
	adds r1, r0
	orrs r3, r1
	strh r3, [r2]
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800A6B0

	thumb_func_start sub_800A6E8
sub_800A6E8: @ 800A6E8
	push {r4-r7,lr}
	sub sp, 0x10
	adds r5, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0
	cmp r4, r3
	bge _0800A714
	movs r2, 0xF
_0800A702:
	mov r0, sp
	adds r1, r0, r4
	adds r0, r5, 0
	ands r0, r2
	strb r0, [r1]
	lsrs r5, 4
	adds r4, 0x1
	cmp r4, r3
	blt _0800A702
_0800A714:
	subs r4, r3, 0x1
	cmp r4, 0
	blt _0800A734
_0800A71A:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	adds r1, r6, 0
	adds r2, r7, 0
	bl sub_800A678
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	subs r4, 0x1
	cmp r4, 0
	bge _0800A71A
_0800A734:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_800A6E8

	thumb_func_start sub_800A73C
sub_800A73C: @ 800A73C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	adds r6, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x10]
	cmp r6, 0
	bge _0800A768
	str r7, [sp, 0x10]
	negs r6, r6
_0800A768:
	movs r5, 0
	movs r1, 0x1
	negs r1, r1
	add r1, r8
	mov r10, r1
	cmp r5, r8
	bge _0800A794
_0800A776:
	mov r0, sp
	adds r4, r0, r5
	adds r0, r6, 0
	movs r1, 0xA
	bl __modsi3
	strb r0, [r4]
	adds r0, r6, 0
	movs r1, 0xA
	bl __divsi3
	adds r6, r0, 0
	adds r5, 0x1
	cmp r5, r8
	blt _0800A776
_0800A794:
	mov r5, r10
	cmp r5, 0
	blt _0800A7B4
_0800A79A:
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	adds r1, r7, 0
	mov r2, r9
	bl sub_800A678
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	subs r5, 0x1
	cmp r5, 0
	bge _0800A79A
_0800A7B4:
	movs r0, 0x1
	negs r0, r0
	ldr r1, [sp, 0x10]
	cmp r1, r0
	beq _0800A7CA
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0xA
	mov r2, r9
	bl sub_800A678
_0800A7CA:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_800A73C

	thumb_func_start sub_800A7DC
sub_800A7DC: @ 800A7DC
	push {r4-r7,lr}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	movs r6, 0
	ldrb r0, [r3]
	cmp r0, 0
	beq _0800A81C
	adds r4, r3, 0
	lsls r5, r2, 24
_0800A7F4:
	ldrb r0, [r4]
	cmp r0, 0xA
	bne _0800A804
	movs r0, 0x80
	lsls r0, 17
	adds r5, r0
	movs r6, 0
	b _0800A814
_0800A804:
	ldrb r0, [r4]
	adds r1, r7, r6
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r5, 24
	bl sub_800A6B0
	adds r6, 0x1
_0800A814:
	adds r4, 0x1
	ldrb r0, [r4]
	cmp r0, 0
	bne _0800A7F4
_0800A81C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_800A7DC

	thumb_func_start sub_800A824
sub_800A824: @ 800A824
	push {lr}
	ldr r0, =gUnknown_030030E0
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
_0800A830:
	beq _0800A838
	ldr r0, =0x00002222
	bl sub_8009D90
_0800A838:
	ldr r1, =gUnknown_03003140
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800A824

	thumb_func_start task00_link_test
task00_link_test: @ 800A850
	push {r4-r6,lr}
	sub sp, 0x20
	ldr r1, =gUnknown_082ED1E4
	mov r0, sp
	bl strcpy
	mov r0, sp
	movs r1, 0x5
	movs r2, 0x2
	bl sub_800A7DC
	ldr r0, =gUnknown_03003144
	ldrb r0, [r0]
	movs r1, 0x2
	movs r2, 0x1
	movs r3, 0x2
	bl sub_800A6E8
	ldr r4, =gUnknown_030030E0
	ldr r0, [r4]
	movs r1, 0xF
	movs r2, 0x1
	movs r3, 0x8
	bl sub_800A6E8
	ldr r0, =gUnknown_03003170
	ldrb r0, [r0, 0x1]
	movs r1, 0x2
	movs r2, 0xA
	movs r3, 0x2
	bl sub_800A6E8
	ldr r0, [r4]
	movs r1, 0x1C
	ands r0, r1
	lsrs r0, 2
	movs r1, 0xF
	movs r2, 0xA
	movs r3, 0x2
	bl sub_800A6E8
	bl link_get_multiplayer_id
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xF
	movs r2, 0xC
	movs r3, 0x2
	bl sub_800A6E8
	ldr r0, =gUnknown_03003160
	ldrb r0, [r0]
	movs r1, 0x19
	movs r2, 0x1
	movs r3, 0x2
	bl sub_800A6E8
	ldr r0, =gUnknown_03004130
	ldrb r0, [r0]
	movs r1, 0x19
	movs r2, 0x2
	movs r3, 0x2
	bl sub_800A6E8
	bl sub_800A550
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xF
	movs r2, 0x5
	movs r3, 0x2
	bl sub_800A6E8
	ldr r0, =gUnknown_0300302C
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xC
	movs r3, 0x8
	bl sub_800A6E8
	ldr r0, =gUnknown_03003070
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xD
	movs r3, 0x8
	bl sub_800A6E8
	bl sub_800B2E8
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x19
	movs r2, 0x5
	movs r3, 0x1
	bl sub_800A6E8
	bl sub_800B2F8
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x19
	movs r2, 0x6
	movs r3, 0x1
	bl sub_800A6E8
	bl sub_800B320
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x19
	movs r2, 0x7
	movs r3, 0x1
	bl sub_800A6E8
	bl sub_800B33C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x19
	movs r2, 0x8
	movs r3, 0x1
	bl sub_800A6E8
	movs r6, 0
	movs r5, 0x80
	lsls r5, 19
	ldr r4, =gUnknown_03003148
_0800A94E:
	ldrh r0, [r4]
	lsrs r2, r5, 24
	movs r1, 0xA
	movs r3, 0x4
	bl sub_800A6E8
	movs r0, 0x80
	lsls r0, 17
	adds r5, r0
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0800A94E
	add sp, 0x20
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end task00_link_test

	thumb_func_start sub_800A994
sub_800A994: @ 800A994
	ldr r2, =gUnknown_0300302C
	str r0, [r2]
	ldr r0, =gUnknown_03003070
	str r1, [r0]
	bx lr
	.pool
	thumb_func_end sub_800A994

	thumb_func_start sub_800A9A8
sub_800A9A8: @ 800A9A8
	push {r4,lr}
	movs r1, 0
	movs r2, 0
	ldr r0, =gUnknown_03003100
	ldrb r0, [r0]
	cmp r1, r0
	bge _0800A9CA
	movs r4, 0x1
	adds r3, r0, 0
_0800A9BA:
	adds r0, r4, 0
	lsls r0, r2
	orrs r1, r0
	lsls r0, r1, 24
	lsrs r1, r0, 24
	adds r2, 0x1
	cmp r2, r3
	blt _0800A9BA
_0800A9CA:
	adds r0, r1, 0
	pop {r4}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800A9A8

	thumb_func_start sub_800A9D8
sub_800A9D8: @ 800A9D8
	push {r4-r6,lr}
	movs r4, 0
	movs r5, 0
	movs r6, 0x1
	b _0800A9EE
_0800A9E2:
	adds r0, r6, 0
	lsls r0, r5
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
	adds r5, 0x1
_0800A9EE:
	bl sub_8009FCC
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	blt _0800A9E2
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_800A9D8

	thumb_func_start sub_800AA04
sub_800AA04: @ 800AA04
	push {r4-r7,lr}
	ldr r1, =gUnknown_03003100
	strb r0, [r1]
	bl link_get_multiplayer_id
	ldr r1, =gUnknown_03003120
	strb r0, [r1]
	ldr r4, =gUnknown_020229E8
	ldr r3, =gUnknown_02022A74
	movs r2, 0x4
_0800AA18:
	adds r0, r3, 0
	adds r1, r4, 0
	ldm r1!, {r5-r7}
	stm r0!, {r5-r7}
	ldm r1!, {r5-r7}
	stm r0!, {r5-r7}
	ldr r1, [r1]
	str r1, [r0]
	adds r4, 0x1C
	adds r3, 0x1C
	subs r2, 0x1
	cmp r2, 0
	bge _0800AA18
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800AA04

	thumb_func_start sub_800AA48
sub_800AA48: @ 800AA48
	ldr r0, =gUnknown_03003100
	ldrb r0, [r0]
	bx lr
	.pool
	thumb_func_end sub_800AA48

	thumb_func_start sub_800AA54
sub_800AA54: @ 800AA54
	ldr r0, =gUnknown_03003120
	ldrb r0, [r0]
	bx lr
	.pool
	thumb_func_end sub_800AA54

	thumb_func_start sub_800AA60
sub_800AA60: @ 800AA60
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r3, 0
	ldr r0, =gUnknown_03003100
	ldrb r1, [r0]
	mov r9, r0
	cmp r3, r1
	bge _0800AAB4
	ldr r0, =gUnknown_020229E8
	mov r12, r0
	ldr r0, =gUnknown_02022A74
	ldr r2, =0x00002288
	mov r8, r2
	ldr r7, =gUnknown_020229C6
	mov r6, r12
	adds r6, 0x14
	adds r5, r0, 0x4
	movs r4, 0
	adds r2, r1, 0
_0800AA8A:
	mov r0, r12
	adds r0, 0x4
	adds r0, r4, r0
	ldr r1, [r0]
	ldr r0, [r5]
	cmp r1, r0
	bne _0800AAA8
	ldrh r0, [r7]
	cmp r0, r8
	bne _0800AAA6
	adds r1, r0, 0
	ldr r0, [r6]
	cmp r1, r0
	bne _0800AAA8
_0800AAA6:
	adds r3, 0x1
_0800AAA8:
	adds r6, 0x1C
	adds r5, 0x1C
	adds r4, 0x1C
	subs r2, 0x1
	cmp r2, 0
	bne _0800AA8A
_0800AAB4:
	mov r0, r9
	ldrb r0, [r0]
	cmp r3, r0
	bne _0800AAE4
	bl sub_800ABAC
	lsls r0, 24
	lsrs r0, 24
	mov r1, r9
	ldrb r1, [r1]
	cmp r0, r1
	bne _0800AAE4
	movs r0, 0x1
	b _0800AAE6
	.pool
_0800AAE4:
	movs r0, 0
_0800AAE6:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_800AA60

	thumb_func_start sub_800AAF4
sub_800AAF4: @ 800AAF4
	push {r4,r5,lr}
	ldr r5, =gUnknown_02022A74
	movs r4, 0x3
_0800AAFA:
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x1C
	bl CpuSet
	adds r5, 0x1C
	subs r4, 0x1
	cmp r4, 0
	bge _0800AAFA
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800AAF4

	thumb_func_start sub_800AB18
sub_800AB18: @ 800AB18
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r4, 0
	ldr r0, =gUnknown_03003100
	ldrb r0, [r0]
	cmp r4, r0
	bcs _0800AB78
	ldr r6, =gUnknown_02022A74
	ldr r5, =gUnknown_020229E8
	movs r0, 0x8
	adds r0, r6
	mov r8, r0
	adds r7, r5, 0
	adds r7, 0x8
_0800AB36:
	lsls r0, r4, 3
	subs r0, r4
	lsls r2, r0, 2
	adds r1, r6, 0x4
	adds r1, r2, r1
	adds r0, r5, 0x4
	adds r0, r2, r0
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne _0800AB5A
	mov r1, r8
	adds r0, r2, r1
	adds r1, r2, r7
	bl StringCompare
	cmp r0, 0
	beq _0800AB6A
_0800AB5A:
	ldr r1, =gUnknown_0300306C
	movs r0, 0x1
	strb r0, [r1]
	bl sub_80097E8
	ldr r0, =c2_800ACD4
	bl SetMainCallback2
_0800AB6A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, =gUnknown_03003100
	ldrb r0, [r0]
	cmp r4, r0
	bcc _0800AB36
_0800AB78:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800AB18

	thumb_func_start sub_800AB98
sub_800AB98: @ 800AB98
	ldr r0, =gUnknown_03003100
	movs r1, 0
	strb r1, [r0]
	ldr r0, =gUnknown_03003120
	strb r1, [r0]
	bx lr
	.pool
	thumb_func_end sub_800AB98

	thumb_func_start sub_800ABAC
sub_800ABAC: @ 800ABAC
	ldr r0, =gUnknown_030030E0
	ldr r0, [r0]
	movs r1, 0x1C
	ands r0, r1
	lsrs r0, 2
	bx lr
	.pool
	thumb_func_end sub_800ABAC

	thumb_func_start sub_800ABBC
sub_800ABBC: @ 800ABBC
	push {lr}
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800ABDC
	ldr r0, =gUnknown_030030E0
	ldr r0, [r0]
	lsrs r0, 5
	movs r1, 0x1
	ands r0, r1
	b _0800ABE4
	.pool
_0800ABDC:
	bl sub_8011AB0
	lsls r0, 24
	lsrs r0, 24
_0800ABE4:
	pop {r1}
	bx r1
	thumb_func_end sub_800ABBC

	thumb_func_start sub_800ABE8
sub_800ABE8: @ 800ABE8
	ldr r0, =gUnknown_03000D58
	ldrb r0, [r0]
	bx lr
	.pool
	thumb_func_end sub_800ABE8

	thumb_func_start sub_800ABF4
sub_800ABF4: @ 800ABF4
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800AC0C
	bl task_add_05_task_del_08FA224_when_no_RfuFunc
	b _0800AC20
	.pool
_0800AC0C:
	ldr r2, =gUnknown_03003140
	ldr r1, [r2]
	cmp r1, 0
	bne _0800AC20
	ldr r0, =sub_800AC80
	str r0, [r2]
	ldr r0, =gUnknown_030030E4
	strb r1, [r0]
	ldr r0, =gUnknown_030030F4
	strh r3, [r0]
_0800AC20:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800ABF4

	thumb_func_start sub_800AC34
sub_800AC34: @ 800AC34
	push {lr}
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800AC48
	bl task_add_05_task_del_08FA224_when_no_RfuFunc
	b _0800AC70
	.pool
_0800AC48:
	ldr r2, =gUnknown_03003140
	ldr r1, [r2]
	cmp r1, 0
	beq _0800AC64
	ldr r1, =gUnknown_02022B08
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0800AC70
	.pool
_0800AC64:
	ldr r0, =sub_800AC80
	str r0, [r2]
	ldr r0, =gUnknown_030030E4
	strb r1, [r0]
	ldr r0, =gUnknown_030030F4
	strh r1, [r0]
_0800AC70:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800AC34

	thumb_func_start sub_800AC80
sub_800AC80: @ 800AC80
	push {lr}
	ldr r0, =gUnknown_03004130
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800AC96
	ldr r0, =0x00005fff
	bl sub_8009D90
	ldr r1, =gUnknown_03003140
	ldr r0, =sub_800ACAC
	str r0, [r1]
_0800AC96:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800AC80

	thumb_func_start sub_800ACAC
sub_800ACAC: @ 800ACAC
	push {r4,lr}
	bl sub_8009FCC
	lsls r0, 24
	lsrs r2, r0, 24
	movs r3, 0
	movs r1, 0
	cmp r3, r2
	bge _0800ACD0
	ldr r4, =gUnknown_030030F0
_0800ACC0:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800ACCA
	adds r3, 0x1
_0800ACCA:
	adds r1, 0x1
	cmp r1, r2
	blt _0800ACC0
_0800ACD0:
	cmp r3, r2
	bne _0800ACF4
	ldr r2, =gBattleTypeFlags
	ldr r0, [r2]
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	str r0, [r2]
	ldr r0, =gUnknown_03002748
	movs r4, 0x1
	strb r4, [r0]
	bl sub_80097E8
	ldr r1, =gUnknown_03003140
	movs r0, 0
	str r0, [r1]
	ldr r0, =gUnknown_030030E4
	strb r4, [r0]
_0800ACF4:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800ACAC

	thumb_func_start sub_800AD10
sub_800AD10: @ 800AD10
	push {lr}
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800AD24
	bl task_add_05_task_del_08FA224_when_no_RfuFunc
	b _0800AD4C
	.pool
_0800AD24:
	ldr r2, =gUnknown_03003140
	ldr r1, [r2]
	cmp r1, 0
	beq _0800AD40
	ldr r1, =gUnknown_02022B08
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0800AD4C
	.pool
_0800AD40:
	ldr r0, =sub_800AD5C
	str r0, [r2]
	ldr r0, =gUnknown_030030E4
	strb r1, [r0]
	ldr r0, =gUnknown_030030F4
	strh r1, [r0]
_0800AD4C:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800AD10

	thumb_func_start sub_800AD5C
sub_800AD5C: @ 800AD5C
	push {lr}
	ldr r0, =gUnknown_03004130
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800AD72
	ldr r0, =0x00005fff
	bl sub_8009D90
	ldr r1, =gUnknown_03003140
	ldr r0, =sub_800AD88
	str r0, [r1]
_0800AD72:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800AD5C

	thumb_func_start sub_800AD88
sub_800AD88: @ 800AD88
	push {r4,r5,lr}
	bl sub_8009FCC
	lsls r0, 24
	lsrs r3, r0, 24
	movs r1, 0
	movs r2, 0
	cmp r1, r3
	bge _0800ADB6
	ldr r5, =gUnknown_030030F0
	ldr r4, =gUnknown_020229E8
_0800AD9E:
	ldrh r0, [r4, 0x1A]
	cmp r0, 0x1
	beq _0800ADAC
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800ADAE
_0800ADAC:
	adds r1, 0x1
_0800ADAE:
	adds r4, 0x1C
	adds r2, 0x1
	cmp r2, r3
	blt _0800AD9E
_0800ADB6:
	cmp r1, r3
	bne _0800ADDA
	ldr r2, =gBattleTypeFlags
	ldr r0, [r2]
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	str r0, [r2]
	ldr r0, =gUnknown_03002748
	movs r4, 0x1
	strb r4, [r0]
	bl sub_80097E8
	ldr r1, =gUnknown_03003140
	movs r0, 0
	str r0, [r1]
	ldr r0, =gUnknown_030030E4
	strb r4, [r0]
_0800ADDA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800AD88

	thumb_func_start sub_800ADF8
sub_800ADF8: @ 800ADF8
	push {lr}
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800AE0C
	bl sub_8010434
	b _0800AE1E
	.pool
_0800AE0C:
	ldr r1, =gUnknown_03003140
	ldr r0, [r1]
	cmp r0, 0
	bne _0800AE18
	ldr r0, =sub_800AE30
	str r0, [r1]
_0800AE18:
	ldr r1, =gUnknown_030030E4
	movs r0, 0
	strb r0, [r1]
_0800AE1E:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800ADF8

	thumb_func_start sub_800AE30
sub_800AE30: @ 800AE30
	push {lr}
	ldr r0, =gUnknown_03004130
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800AE46
	ldr r0, =0x00002ffe
	bl sub_8009D90
	ldr r1, =gUnknown_03003140
	ldr r0, =sub_800AE5C
	str r0, [r1]
_0800AE46:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800AE30

	thumb_func_start sub_800AE5C
sub_800AE5C: @ 800AE5C
	push {r4,lr}
	bl sub_8009FCC
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	cmp r1, r2
	bcs _0800AE86
	ldr r3, =gUnknown_030030EC
	ldrb r0, [r3]
	cmp r0, 0
	beq _0800AE86
_0800AE74:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	bcs _0800AE86
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800AE74
_0800AE86:
	cmp r1, r2
	bne _0800AEA4
	movs r1, 0
	ldr r4, =gUnknown_03003140
	ldr r3, =gUnknown_030030EC
	movs r2, 0
_0800AE92:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _0800AE92
	movs r0, 0
	str r0, [r4]
_0800AEA4:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800AE5C

	thumb_func_start sub_800AEB4
sub_800AEB4: @ 800AEB4
	push {lr}
	ldr r0, =gUnknown_020229C4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800AEF4
	ldr r0, =gUnknown_030030E0
	ldr r2, [r0]
	movs r0, 0xFE
	lsls r0, 11
	ands r0, r2
	cmp r0, 0
	beq _0800AEF4
	ldr r0, =gUnknown_030030F8
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800AEEA
	ldr r1, =gUnknown_02022B00
	str r2, [r1]
	ldr r0, =gUnknown_03004130
	ldrb r0, [r0]
	strb r0, [r1, 0x4]
	ldr r0, =gUnknown_03003160
	ldrb r0, [r0]
	strb r0, [r1, 0x5]
	ldr r0, =c2_800ACD4
	bl SetMainCallback2
_0800AEEA:
	ldr r1, =gUnknown_0300306C
	movs r0, 0x1
	strb r0, [r1]
	bl sub_80097E8
_0800AEF4:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800AEB4

	thumb_func_start sub_800AF18
sub_800AF18: @ 800AF18
	push {r4,lr}
	ldr r4, =gUnknown_02022B00
	str r0, [r4]
	strb r1, [r4, 0x5]
	strb r2, [r4, 0x4]
	strb r3, [r4, 0x6]
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800AF18

	thumb_func_start c2_800ACD4
c2_800ACD4: @ 800AF30
	push {r4,lr}
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	ldr r0, =gMPlay_SE1
	bl m4aMPlayStop
	ldr r0, =gMPlay_SE2
	bl m4aMPlayStop
	ldr r0, =gMPlay_SE3
	bl m4aMPlayStop
	ldr r0, =0x02000000
	movs r1, 0xE0
	lsls r1, 9
	bl InitHeap
	bl ResetAllObjectData
	bl ResetObjectPaletteAllocator
	bl ResetPaletteFadeControl
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl FillPalette
	bl ResetTasks
	bl remove_some_task
	ldr r1, =gLinkVSyncDisabled
	ldrb r0, [r1]
	cmp r0, 0
	beq _0800AF8C
	ldr r0, =gUnknown_02022B00
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	bne _0800AF88
	movs r0, 0x3
	strb r0, [r1]
_0800AF88:
	bl sub_800E604
_0800AF8C:
	ldr r0, =sub_80096BC
	bl SetVBlankCallback
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, =gUnknown_082ED1FC
	movs r0, 0
	movs r2, 0x2
	bl InitBgsFromTemplates
	ldr r4, =gUnknown_02022B0C
	movs r0, 0x80
	lsls r0, 4
	bl Alloc
	adds r1, r0, 0
	str r1, [r4]
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r0, =gUnknown_082ED204
	bl InitWindows
	lsls r0, 16
	cmp r0, 0
	beq _0800B03C
	bl DeactivateAllTextPrinters
	bl reset_temp_tile_data_buffers
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x10
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x12
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x14
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x16
	movs r1, 0
	bl SetGpuReg
	movs r1, 0xE0
	lsls r1, 8
	movs r0, 0
	bl ClearGpuRegBits
	ldr r0, =gUnknown_0860F074
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, =gSoftResetDisabled
	movs r0, 0
	strb r0, [r1]
	ldr r0, =sub_8009404
	movs r1, 0
	bl CreateTask
	bl sub_80A2F30
	ldr r1, =gMain
	movs r0, 0
	str r0, [r1]
	bl RunTasks
	bl CallObjectCallbacks
	bl PrepareSpritesForOamLoad
	bl UpdatePaletteFade
	ldr r0, =sub_800B1A0
	bl SetMainCallback2
_0800B03C:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end c2_800ACD4

	thumb_func_start sub_800B080
sub_800B080: @ 800B080
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r1, =gUnknown_082ED168
	movs r0, 0
	movs r2, 0x20
	movs r3, 0
	bl LoadBgTiles
	ldr r1, =gUnknown_082EC88C
	movs r5, 0
	str r5, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl copy_decompressed_tile_data_to_vram_autofree
	ldr r1, =gUnknown_082ECD34
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	ldr r0, =gUnknown_082EC86C
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x2
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r4, =gUnknown_082ED224
	str r4, [sp]
	str r5, [sp, 0x4]
	ldr r0, =gUnknown_085EE4F7
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0x6
	bl box_print
	str r4, [sp]
	str r5, [sp, 0x4]
	ldr r0, =gUnknown_085EE50C
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0x1
	bl box_print
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0
	bl CopyWindowToVram
	movs r0, 0x2
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800B080

	thumb_func_start sub_800B138
sub_800B138: @ 800B138
	push {lr}
	sub sp, 0xC
	ldr r1, =gUnknown_082ED168
	movs r0, 0
	movs r2, 0x20
	movs r3, 0
	bl LoadBgTiles
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x2
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r0, =gUnknown_082ED224
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r0, =gUnknown_085EE4A4
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0
	bl box_print
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0
	bl CopyWindowToVram
	movs r0, 0x2
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0xC
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800B138

	thumb_func_start sub_800B1A0
sub_800B1A0: @ 800B1A0
	push {r4,lr}
	sub sp, 0xC
	ldr r0, =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1E
	beq _0800B20C
	cmp r0, 0x1E
	bgt _0800B1C4
	cmp r0, 0
	beq _0800B1D8
	cmp r0, 0x2
	beq _0800B1F2
	b _0800B260
	.pool
_0800B1C4:
	cmp r0, 0x5A
	beq _0800B20C
	cmp r0, 0x5A
	bgt _0800B1D2
	cmp r0, 0x3C
	beq _0800B20C
	b _0800B260
_0800B1D2:
	cmp r0, 0x82
	beq _0800B214
	b _0800B260
_0800B1D8:
	ldr r0, =gUnknown_02022B00
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	beq _0800B1EC
	bl sub_800B080
	b _0800B260
	.pool
_0800B1EC:
	bl sub_800B138
	b _0800B260
_0800B1F2:
	movs r0, 0
	bl ShowBg
	ldr r0, =gUnknown_02022B00
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	beq _0800B260
	movs r0, 0x1
	bl ShowBg
	b _0800B260
	.pool
_0800B20C:
	movs r0, 0x16
	bl audio_play
	b _0800B260
_0800B214:
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0800B244
	ldr r0, =gUnknown_082ED224
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r0, =gUnknown_085EE572
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0x14
	bl box_print
	b _0800B260
	.pool
_0800B244:
	cmp r0, 0x1
	bne _0800B260
	ldr r0, =gUnknown_082ED224
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r0, =gUnknown_085EE553
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0x14
	bl box_print
_0800B260:
	ldr r0, =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r0, r2
	ldrb r1, [r1]
	cmp r1, 0xA0
	bne _0800B2D0
	ldr r4, =gLinkVSyncDisabled
	ldrb r2, [r4]
	cmp r2, 0x1
	bne _0800B2A8
	ldrh r0, [r0, 0x2E]
	ands r2, r0
	cmp r2, 0
	beq _0800B2C2
	movs r0, 0x15
	bl audio_play
	movs r0, 0
	strb r0, [r4]
	ldr r1, =gUnknown_02022B00
	movs r0, 0
	strb r0, [r1, 0x6]
	bl sub_81700F8
	b _0800B2C2
	.pool
_0800B2A8:
	cmp r2, 0x2
	bne _0800B2C2
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0800B2C2
	bl rfu_REQ_stopMode
	bl rfu_waitREQComplete
	bl DoSoftReset
_0800B2C2:
	ldr r0, =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r0, r2
	ldrb r1, [r1]
	cmp r1, 0xA0
	beq _0800B2DC
_0800B2D0:
	movs r2, 0x87
	lsls r2, 3
	adds r1, r0, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0800B2DC:
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800B1A0

	thumb_func_start sub_800B2E8
sub_800B2E8: @ 800B2E8
	ldr r0, =0x04000128
	ldrh r0, [r0]
	lsrs r0, 2
	movs r1, 0x1
	ands r0, r1
	bx lr
	.pool
	thumb_func_end sub_800B2E8

	thumb_func_start sub_800B2F8
sub_800B2F8: @ 800B2F8
	push {lr}
	movs r3, 0
	ldr r2, =0x04000128
	ldrh r1, [r2]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0800B314
	ldrh r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0800B314
	movs r3, 0x1
_0800B314:
	adds r0, r3, 0
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800B2F8

	thumb_func_start sub_800B320
sub_800B320: @ 800B320
	ldr r0, =gUnknown_030030E0
	ldr r0, [r0]
	lsrs r0, 6
	movs r1, 0x1
	ands r0, r1
	bx lr
	.pool
	thumb_func_end sub_800B320

	thumb_func_start sub_800B330
sub_800B330: @ 800B330
	ldr r1, =gUnknown_030030F8
	strb r0, [r1]
	bx lr
	.pool
	thumb_func_end sub_800B330

	thumb_func_start sub_800B33C
sub_800B33C: @ 800B33C
	ldr r0, =gUnknown_0300306C
	ldrb r0, [r0]
	bx lr
	.pool
	thumb_func_end sub_800B33C

	thumb_func_start sub_800B348
sub_800B348: @ 800B348
	push {r4-r6,lr}
	bl sub_8009638
	ldr r1, =gUnknown_03003030
	adds r2, r1, 0
	adds r2, 0x10
	ldr r0, =gUnknown_020229CC
	ldm r0!, {r3-r5}
	stm r2!, {r3-r5}
	ldm r0!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	ldr r0, [r0]
	str r0, [r2]
	ldr r3, =gUnknown_082ED1D4
	adds r2, r1, 0
	adds r0, r3, 0
	ldm r0!, {r4-r6}
	stm r2!, {r4-r6}
	ldrh r4, [r0]
	strh r4, [r2]
	ldrb r0, [r0, 0x2]
	strb r0, [r2, 0x2]
	adds r0, r1, 0
	adds r0, 0x2C
	ldm r3!, {r2,r5,r6}
	stm r0!, {r2,r5,r6}
	ldrh r2, [r3]
	strh r2, [r0]
	ldrb r2, [r3, 0x2]
	strb r2, [r0, 0x2]
	ldr r0, =gUnknown_020228C4
	movs r2, 0x3C
	bl memcpy
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800B348

	thumb_func_start sub_800B3A4
sub_800B3A4: @ 800B3A4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 8
	ldr r1, =gUnknown_020223C4
	adds r4, r2, r1
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 2
	ldr r0, =gUnknown_020229E8
	adds r2, r0
	adds r1, r2, 0
	adds r0, r4, 0
	adds r0, 0x10
	ldm r0!, {r3,r5,r6}
	stm r1!, {r3,r5,r6}
	ldm r0!, {r3,r5,r6}
	stm r1!, {r3,r5,r6}
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r2, 0
	bl sub_800B524
	ldr r5, =gUnknown_082ED1D4
	adds r0, r4, 0
	adds r1, r5, 0
	bl strcmp
	cmp r0, 0
	bne _0800B3EE
	adds r0, r4, 0
	adds r0, 0x2C
	adds r1, r5, 0
	bl strcmp
	cmp r0, 0
	beq _0800B3F4
_0800B3EE:
	ldr r0, =c2_800ACD4
	bl SetMainCallback2
_0800B3F4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800B3A4

	thumb_func_start HandleLinkConnection
HandleLinkConnection: @ 800B40C
	push {r4,r5,lr}
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800B45C
	ldr r0, =gUnknown_03003144
	ldr r1, =gUnknown_03003110
	ldr r2, =gUnknown_03003090
	bl sub_800B638
	ldr r4, =gUnknown_030030E0
	str r0, [r4]
	ldr r0, =gUnknown_030022EC
	bl sub_80099E0
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 1
	ands r0, r1
	cmp r0, 0
	beq _0800B480
	bl sub_808766C
	cmp r0, 0x1
	bne _0800B480
_0800B43E:
	movs r0, 0x1
	b _0800B482
	.pool
_0800B45C:
	bl sub_8010EC0
	adds r4, r0, 0
	bl sub_8010F1C
	adds r5, r0, 0
	bl sub_808766C
	cmp r0, 0x1
	bne _0800B480
	cmp r4, 0x1
	beq _0800B43E
	bl sub_800F0B8
	cmp r0, 0
	bne _0800B43E
	cmp r5, 0
	bne _0800B43E
_0800B480:
	movs r0, 0
_0800B482:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end HandleLinkConnection

	thumb_func_start sub_800B488
sub_800B488: @ 800B488
	push {lr}
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800B498
	ldr r1, =gLinkVSyncDisabled
	movs r0, 0x1
	strb r0, [r1]
_0800B498:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800B488

	thumb_func_start sub_800B4A4
sub_800B4A4: @ 800B4A4
	push {lr}
	ldr r0, =gUnknown_03003124
	ldrb r1, [r0]
	cmp r1, 0
	bne _0800B4B2
	ldr r0, =gLinkVSyncDisabled
	strb r1, [r0]
_0800B4B2:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800B4A4

	thumb_func_start sub_800B4C0
sub_800B4C0: @ 800B4C0
	push {lr}
	ldr r0, =gUnknown_03003124
	ldrb r1, [r0]
	cmp r1, 0
	bne _0800B4CE
	ldr r0, =gLinkVSyncDisabled
	strb r1, [r0]
_0800B4CE:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800B4C0

	thumb_func_start sub_800B4DC
sub_800B4DC: @ 800B4DC
	push {lr}
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800B4FC
	ldr r0, =gUnknown_03003170
	ldr r1, =0x00000fbd
	adds r0, r1
	ldrb r0, [r0]
	b _0800B500
	.pool
_0800B4FC:
	bl sub_80124D4
_0800B500:
	pop {r1}
	bx r1
	thumb_func_end sub_800B4DC

	thumb_func_start sub_800B504
sub_800B504: @ 800B504
	push {lr}
	bl sub_800B4DC
	cmp r0, 0x2
	bhi _0800B512
	movs r0, 0
	b _0800B514
_0800B512:
	movs r0, 0x1
_0800B514:
	pop {r1}
	bx r1
	thumb_func_end sub_800B504

	thumb_func_start sub_800B518
sub_800B518: @ 800B518
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	bx lr
	.pool
	thumb_func_end sub_800B518

	thumb_func_start sub_800B524
sub_800B524: @ 800B524
	push {lr}
	ldrb r1, [r0, 0x10]
	strb r1, [r0, 0x12]
	adds r2, r0, 0
	adds r2, 0x8
	ldrb r1, [r0, 0x1A]
	adds r0, r2, 0
	bl ConvertInternationalString
	pop {r0}
	bx r0
	thumb_func_end sub_800B524

	thumb_func_start sub_800B53C
sub_800B53C: @ 800B53C
	push {lr}
	sub sp, 0x4
	movs r0, 0xC0
	bl DisableInterrupts
	ldr r1, =0x04000128
	movs r2, 0x80
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, =0x0400010e
	movs r2, 0
	strh r2, [r0]
	adds r1, 0xDA
	movs r0, 0xC0
	strh r0, [r1]
	ldr r0, =0x0400012a
	strh r2, [r0]
	ldr r2, =0x04000120
	movs r0, 0
	movs r1, 0
	str r0, [r2]
	str r1, [r2, 0x4]
	str r0, [sp]
	ldr r1, =gUnknown_03003170
	ldr r2, =0x050003f0
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800B53C

	thumb_func_start sub_800B594
sub_800B594: @ 800B594
	push {r4,r5,lr}
	sub sp, 0x4
	movs r0, 0xC0
	bl DisableInterrupts
	ldr r0, =0x04000134
	movs r4, 0
	strh r4, [r0]
	ldr r2, =0x04000128
	movs r1, 0x80
	lsls r1, 6
	adds r0, r1, 0
	strh r0, [r2]
	ldrh r0, [r2]
	ldr r3, =0x00004003
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	movs r0, 0x80
	bl EnableInterrupts
	ldr r0, =0x0400012a
	strh r4, [r0]
	movs r5, 0
	str r5, [sp]
	ldr r1, =gUnknown_03003170
	ldr r2, =0x050003f0
	mov r0, sp
	bl CpuSet
	ldr r0, =gUnknown_03000D6C
	strb r4, [r0]
	ldr r0, =gUnknown_03000D6E
	strh r5, [r0]
	ldr r0, =gUnknown_03000D70
	strh r5, [r0]
	ldr r0, =gUnknown_03000D72
	strb r4, [r0]
	ldr r0, =gUnknown_03000D73
	strb r4, [r0]
	ldr r0, =gUnknown_03003160
	strb r4, [r0]
	ldr r0, =gUnknown_03004130
	strb r4, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800B594

	thumb_func_start sub_800B628
sub_800B628: @ 800B628
	push {lr}
	bl sub_800B594
	bl sub_800B53C
	pop {r0}
	bx r0
	thumb_func_end sub_800B628

	thumb_func_start sub_800B638
sub_800B638: @ 800B638
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r0, =gUnknown_03003170
	ldrb r0, [r0, 0x1]
	cmp r0, 0x4
	bhi _0800B6EA
	lsls r0, 2
	ldr r1, =_0800B65C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0800B65C:
	.4byte _0800B670
	.4byte _0800B680
	.4byte _0800B698
	.4byte _0800B6D4
	.4byte _0800B6DE
_0800B670:
	bl sub_800B53C
	ldr r1, =gUnknown_03003170
	movs r0, 0x1
	strb r0, [r1, 0x1]
	b _0800B6EA
	.pool
_0800B680:
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _0800B6EA
	bl sub_800B594
	ldr r1, =gUnknown_03003170
	movs r0, 0x2
	strb r0, [r1, 0x1]
	b _0800B6EA
	.pool
_0800B698:
	ldrb r1, [r4]
	cmp r1, 0x1
	beq _0800B6A8
	cmp r1, 0x2
	beq _0800B6C0
	bl sub_800B764
	b _0800B6EA
_0800B6A8:
	ldr r2, =gUnknown_03003170
	ldrb r0, [r2]
	cmp r0, 0x8
	bne _0800B6EA
	ldrb r0, [r2, 0x3]
	cmp r0, 0x1
	bls _0800B6EA
	strb r1, [r2, 0xE]
	b _0800B6EA
	.pool
_0800B6C0:
	ldr r0, =gUnknown_03003170
	movs r1, 0
	strb r1, [r0, 0x1]
	ldr r0, =0x0400012a
	strh r1, [r0]
	b _0800B6EA
	.pool
_0800B6D4:
	bl sub_800B790
	ldr r1, =gUnknown_03003170
	movs r0, 0x4
	strb r0, [r1, 0x1]
_0800B6DE:
	adds r0, r5, 0
	bl sub_800B7C0
	adds r0, r6, 0
	bl sub_800B8A8
_0800B6EA:
	movs r0, 0
	strb r0, [r4]
	ldr r1, =gUnknown_03003170
	ldrb r2, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 2
	orrs r2, r0
	ldrb r0, [r1]
	cmp r0, 0x8
	bne _0800B702
	movs r0, 0x20
	orrs r2, r0
_0800B702:
	ldrb r0, [r1, 0xC]
	lsls r3, r0, 8
	ldrb r0, [r1, 0xF]
	lsls r4, r0, 9
	ldrb r0, [r1, 0x10]
	lsls r5, r0, 12
	ldrb r0, [r1, 0x11]
	lsls r6, r0, 13
	ldrb r0, [r1, 0x12]
	lsls r7, r0, 14
	ldrb r0, [r1, 0x1]
	cmp r0, 0x4
	bne _0800B728
	movs r0, 0x40
	orrs r0, r3
	orrs r0, r2
	b _0800B72C
	.pool
_0800B728:
	adds r0, r2, 0
	orrs r0, r3
_0800B72C:
	orrs r0, r4
	orrs r0, r5
	orrs r0, r6
	orrs r0, r7
	adds r2, r0, 0
	ldrb r3, [r1, 0x13]
	cmp r3, 0x1
	bne _0800B742
	movs r0, 0x80
	lsls r0, 9
	orrs r2, r0
_0800B742:
	ldrb r0, [r1, 0x2]
	cmp r0, 0x3
	bls _0800B74E
	movs r0, 0x80
	lsls r0, 10
	orrs r2, r0
_0800B74E:
	adds r1, r2, 0
	cmp r3, 0x2
	bne _0800B75A
	movs r0, 0x80
	lsls r0, 11
	orrs r1, r0
_0800B75A:
	adds r0, r1, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_800B638

	thumb_func_start sub_800B764
sub_800B764: @ 800B764
	push {lr}
	ldr r0, =0x04000128
	ldr r1, [r0]
	movs r0, 0xC
	ands r1, r0
	ldr r2, =gUnknown_03003170
	cmp r1, 0x8
	bne _0800B788
	ldrb r0, [r2, 0x2]
	cmp r0, 0
	bne _0800B788
	strb r1, [r2]
	b _0800B78C
	.pool
_0800B788:
	movs r0, 0
	strb r0, [r2]
_0800B78C:
	pop {r0}
	bx r0
	thumb_func_end sub_800B764

	thumb_func_start sub_800B790
sub_800B790: @ 800B790
	push {lr}
	ldr r0, =gUnknown_03003170
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800B7AE
	ldr r1, =0x0400010c
	ldr r2, =0x0000ff3b
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x41
	strh r0, [r1]
	movs r0, 0x40
	bl EnableInterrupts
_0800B7AE:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800B790

	thumb_func_start sub_800B7C0
sub_800B7C0: @ 800B7C0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r3, r0, 0
	ldr r2, =gUnknown_03004134
	ldr r1, =0x04000208
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, 0
	strh r0, [r1]
	ldr r1, =gUnknown_03003170
	ldr r4, =0x00000339
	adds r0, r1, r4
	ldrb r4, [r0]
	adds r6, r1, 0
	cmp r4, 0x31
	bhi _0800B850
	movs r1, 0xCE
	lsls r1, 2
	adds r0, r6, r1
	ldrb r0, [r0]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _0800B7FE
	subs r0, 0x32
	lsls r0, 24
	lsrs r0, 24
_0800B7FE:
	movs r2, 0
	ldr r4, =gUnknown_03000D6E
	mov r9, r4
	ldr r1, =gUnknown_03003160
	mov r10, r1
	lsls r5, r0, 1
	movs r0, 0x18
	adds r0, r6
	mov r8, r0
	mov r12, r2
	movs r7, 0x64
_0800B814:
	ldrh r0, [r4]
	ldrh r1, [r3]
	orrs r0, r1
	strh r0, [r4]
	adds r0, r2, 0
	muls r0, r7
	adds r0, r5, r0
	add r0, r8
	strh r1, [r0]
	mov r1, r12
	strh r1, [r3]
	adds r3, 0x2
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _0800B814
	b _0800B85C
	.pool
_0800B850:
	movs r0, 0x1
	strb r0, [r6, 0x12]
	ldr r2, =gUnknown_03000D6E
	mov r9, r2
	ldr r4, =gUnknown_03003160
	mov r10, r4
_0800B85C:
	mov r1, r9
	ldrh r0, [r1]
	cmp r0, 0
	beq _0800B874
	ldr r2, =0x00000339
	adds r0, r6, r2
	ldrb r1, [r0]
	adds r1, 0x1
	movs r2, 0
	strb r1, [r0]
	mov r4, r9
	strh r2, [r4]
_0800B874:
	ldr r1, =0x04000208
	ldr r2, =gUnknown_03004134
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r4, =0x00000339
	adds r0, r6, r4
	ldrb r0, [r0]
	mov r1, r10
	strb r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800B7C0

	thumb_func_start sub_800B8A8
sub_800B8A8: @ 800B8A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	ldr r2, =gUnknown_03004134
	ldr r1, =0x04000208
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, 0
	strh r0, [r1]
	ldr r1, =gUnknown_03003170
	ldr r3, =0x00000fbd
	adds r0, r1, r3
	ldrb r0, [r0]
	mov r12, r1
	cmp r0, 0
	bne _0800B914
	movs r3, 0
	ldrb r0, [r1, 0x3]
	cmp r3, r0
	bcs _0800B8FA
	movs r5, 0
	adds r6, r0, 0
_0800B8DA:
	movs r2, 0
	lsls r1, r3, 4
	adds r4, r3, 0x1
	add r1, r9
_0800B8E2:
	lsls r0, r2, 1
	adds r0, r1
	strh r5, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _0800B8E2
	lsls r0, r4, 24
	lsrs r3, r0, 24
	cmp r3, r6
	bcc _0800B8DA
_0800B8FA:
	movs r0, 0x1
	mov r7, r12
	strb r0, [r7, 0xC]
	b _0800B990
	.pool
_0800B914:
	movs r3, 0
	mov r0, r12
	ldrb r1, [r0, 0x3]
	cmp r3, r1
	bcs _0800B96A
	ldr r0, =0x00000fbc
	add r0, r12
	ldrb r0, [r0]
	lsls r6, r0, 1
	movs r2, 0xCF
	lsls r2, 2
	add r2, r12
	mov r8, r2
	mov r10, r1
_0800B930:
	movs r2, 0
	lsls r1, r3, 4
	adds r4, r3, 0x1
	lsls r0, r3, 1
	mov r7, r9
	adds r5, r1, r7
	adds r0, r3
	lsls r0, 3
	adds r0, r3
	lsls r3, r0, 5
_0800B944:
	lsls r1, r2, 1
	adds r1, r5
	movs r7, 0x64
	adds r0, r2, 0
	muls r0, r7
	adds r0, r6, r0
	adds r0, r3
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _0800B944
	lsls r0, r4, 24
	lsrs r3, r0, 24
	cmp r3, r10
	bcc _0800B930
_0800B96A:
	mov r2, r12
	ldr r0, =0x00000fbd
	adds r1, r2, r0
	ldrb r0, [r1]
	subs r0, 0x1
	movs r3, 0
	strb r0, [r1]
	ldr r1, =0x00000fbc
	adds r2, r1
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _0800B98C
	strb r3, [r2]
_0800B98C:
	mov r2, r12
	strb r3, [r2, 0xC]
_0800B990:
	ldr r1, =0x04000208
	ldr r3, =gUnknown_03004134
	ldrh r0, [r3]
	strh r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800B8A8

	thumb_func_start sub_800B9B8
sub_800B9B8: @ 800B9B8
	push {r4,lr}
	ldr r3, =gUnknown_03003170
	ldrb r4, [r3]
	cmp r4, 0
	beq _0800B9F4
	ldrb r0, [r3, 0x1]
	cmp r0, 0x2
	beq _0800B9EE
	cmp r0, 0x4
	bne _0800BA1E
	movs r0, 0xD
	ldrsb r0, [r3, r0]
	cmp r0, 0x8
	bgt _0800B9E4
	ldrb r0, [r3, 0x10]
	cmp r0, 0x1
	beq _0800B9EE
	movs r0, 0x1
	strb r0, [r3, 0x13]
	b _0800BA1E
	.pool
_0800B9E4:
	ldrb r0, [r3, 0x13]
	cmp r0, 0x1
	beq _0800BA1E
	movs r0, 0
	strb r0, [r3, 0xD]
_0800B9EE:
	bl sub_800BAC0
	b _0800BA1E
_0800B9F4:
	ldrb r2, [r3, 0x1]
	cmp r2, 0x4
	beq _0800B9FE
	cmp r2, 0x2
	bne _0800BA1E
_0800B9FE:
	ldr r1, =gUnknown_03000D6C
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	bls _0800BA1E
	cmp r2, 0x4
	bne _0800BA16
	movs r0, 0x2
	strb r0, [r3, 0x13]
_0800BA16:
	cmp r2, 0x2
	bne _0800BA1E
	strb r4, [r3, 0x3]
	strb r4, [r3, 0xF]
_0800BA1E:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800B9B8

	thumb_func_start Timer3Intr
Timer3Intr: @ 800BA28
	push {lr}
	bl sub_800BD98
	bl sub_800BAC0
	pop {r0}
	bx r0
	thumb_func_end Timer3Intr

	thumb_func_start sub_800BA38
sub_800BA38: @ 800BA38
	push {r4,lr}
	ldr r4, =gUnknown_03003170
	ldr r0, =0x04000128
	ldr r1, [r0]
	lsls r0, r1, 26
	lsrs r0, 30
	strb r0, [r4, 0x2]
	ldrb r0, [r4, 0x1]
	cmp r0, 0x2
	beq _0800BA6C
	cmp r0, 0x4
	bne _0800BA8A
	lsls r0, r1, 25
	lsrs r0, 31
	strb r0, [r4, 0x10]
	bl sub_800BBCC
	bl sub_800BCE4
	bl sub_800BDCC
	b _0800BA8A
	.pool
_0800BA6C:
	bl sub_800BAD0
	lsls r0, 24
	cmp r0, 0
	beq _0800BA8A
	ldrb r0, [r4]
	cmp r0, 0
	beq _0800BA86
	movs r0, 0x3
	strb r0, [r4, 0x1]
	movs r0, 0x8
	strb r0, [r4, 0xD]
	b _0800BA8A
_0800BA86:
	movs r0, 0x4
	strb r0, [r4, 0x1]
_0800BA8A:
	ldr r3, =gUnknown_03003170
	ldrb r0, [r3, 0xD]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r3, 0xD]
	ldr r1, =gUnknown_03000D6C
	strb r2, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x8
	bne _0800BAAA
	ldr r0, =gUnknown_03004130
	ldr r2, =0x00000fbd
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
_0800BAAA:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800BA38

	thumb_func_start sub_800BAC0
sub_800BAC0: @ 800BAC0
	ldr r0, =0x04000128
	ldrh r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.pool
	thumb_func_end sub_800BAC0

	thumb_func_start sub_800BAD0
sub_800BAD0: @ 800BAD0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r5, 0
	ldr r6, =0x0000ffff
	ldr r0, =gUnknown_03003170
	ldrb r1, [r0, 0xE]
	adds r7, r0, 0
	cmp r1, 0x1
	bne _0800BAFC
	ldr r1, =0x0400012a
	ldr r2, =0x00008fff
	b _0800BB00
	.pool
_0800BAFC:
	ldr r1, =0x0400012a
	ldr r2, =0x0000b9a0
_0800BB00:
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, =gUnknown_03003174
	ldr r3, =0x04000120
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	movs r0, 0
	movs r1, 0
	str r0, [r3]
	str r1, [r3, 0x4]
	strb r0, [r2, 0xA]
	movs r4, 0
	ldr r0, =gUnknown_03000D73
	mov r9, r0
	mov r8, r2
	ldr r2, =0x00008fff
	ldr r1, =0x0000ffff
	mov r12, r1
_0800BB28:
	lsls r0, r4, 1
	add r0, r8
	ldrh r3, [r0]
	movs r0, 0x4
	negs r0, r0
	ands r0, r3
	ldr r1, =0x0000b9a0
	cmp r0, r1
	beq _0800BB40
	adds r0, r3, 0
	cmp r0, r2
	bne _0800BB70
_0800BB40:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r3, 0
	cmp r6, r0
	bls _0800BB78
	cmp r0, 0
	beq _0800BB78
	adds r6, r3, 0
	b _0800BB78
	.pool
_0800BB70:
	cmp r0, r12
	beq _0800BB82
	movs r5, 0
	b _0800BB82
_0800BB78:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0800BB28
_0800BB82:
	strb r5, [r7, 0x3]
	adds r0, r5, 0
	cmp r0, 0x1
	bls _0800BBB2
	mov r2, r9
	ldrb r2, [r2]
	cmp r0, r2
	bne _0800BBA4
	ldrh r1, [r7, 0x4]
	ldr r0, =0x00008fff
	cmp r1, r0
	bne _0800BBA4
	movs r0, 0x1
	b _0800BBBE
	.pool
_0800BBA4:
	ldrb r0, [r7, 0x3]
	cmp r0, 0x1
	bls _0800BBB2
	movs r0, 0x3
	ands r6, r0
	adds r0, r6, 0x1
	b _0800BBB4
_0800BBB2:
	movs r0, 0
_0800BBB4:
	strb r0, [r7, 0xF]
	ldrb r0, [r7, 0x3]
	mov r1, r9
	strb r0, [r1]
	movs r0, 0
_0800BBBE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_800BAD0

	thumb_func_start sub_800BBCC
sub_800BBCC: @ 800BBCC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	ldr r0, =0x04000120
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, =gUnknown_03003170
	ldrb r1, [r0, 0x16]
	adds r6, r0, 0
	cmp r1, 0
	bne _0800BC30
	movs r4, 0
	ldr r7, =gUnknown_03000D72
	ldrb r0, [r6, 0x3]
	cmp r4, r0
	bcs _0800BC1A
	adds r5, r6, 0
	ldrh r1, [r6, 0x14]
	adds r3, r7, 0
	adds r2, r6, 0
_0800BBFA:
	lsls r0, r4, 1
	add r0, sp
	ldrh r0, [r0]
	cmp r1, r0
	beq _0800BC0E
	ldrb r0, [r3]
	cmp r0, 0
	beq _0800BC0E
	movs r0, 0x1
	strb r0, [r5, 0x11]
_0800BC0E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r2, 0x3]
	cmp r4, r0
	bcc _0800BBFA
_0800BC1A:
	movs r0, 0
	strh r0, [r6, 0x14]
	movs r0, 0x1
	strb r0, [r7]
	b _0800BCD0
	.pool
_0800BC30:
	ldr r2, =0x00000fbc
	adds r1, r6, r2
	adds r2, 0x1
	adds r0, r6, r2
	ldrb r2, [r0]
	ldrb r1, [r1]
	adds r0, r2, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _0800BC4C
	subs r0, 0x32
	lsls r0, 24
	lsrs r0, 24
_0800BC4C:
	cmp r2, 0x31
	bhi _0800BCA8
	movs r4, 0
	ldrb r1, [r6, 0x3]
	cmp r4, r1
	bcs _0800BCAC
	adds r5, r6, 0
	ldr r7, =gUnknown_03000D70
	lsls r0, 1
	mov r12, r0
	movs r2, 0xCF
	lsls r2, 2
	adds r2, r6
	mov r8, r2
_0800BC68:
	lsls r1, r4, 1
	mov r2, sp
	adds r0, r2, r1
	ldrh r3, [r0]
	ldrh r2, [r5, 0x14]
	adds r0, r3, r2
	strh r0, [r5, 0x14]
	ldrh r0, [r7]
	orrs r0, r3
	strh r0, [r7]
	ldrb r2, [r5, 0x17]
	movs r0, 0x64
	muls r0, r2
	add r0, r12
	adds r1, r4
	lsls r1, 3
	adds r1, r4
	lsls r1, 5
	adds r0, r1
	add r0, r8
	strh r3, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5, 0x3]
	cmp r4, r0
	bcc _0800BC68
	b _0800BCAC
	.pool
_0800BCA8:
	movs r0, 0x2
	strb r0, [r6, 0x12]
_0800BCAC:
	ldrb r0, [r6, 0x17]
	adds r0, 0x1
	strb r0, [r6, 0x17]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bne _0800BCD0
	ldr r2, =gUnknown_03000D70
	ldrh r0, [r2]
	cmp r0, 0
	beq _0800BCD0
	ldr r1, =0x00000fbd
	adds r0, r6, r1
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	movs r0, 0
	strh r0, [r2]
_0800BCD0:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800BBCC

	thumb_func_start sub_800BCE4
sub_800BCE4: @ 800BCE4
	push {r4,lr}
	ldr r0, =gUnknown_03003170
	ldrb r1, [r0, 0x16]
	adds r4, r0, 0
	cmp r1, 0x8
	bne _0800BD36
	ldr r1, =0x0400012a
	ldrh r0, [r4, 0x14]
	strh r0, [r1]
	ldr r1, =gUnknown_03000D6D
	ldrb r2, [r1]
	cmp r2, 0
	bne _0800BD30
	ldr r0, =0x00000339
	adds r1, r4, r0
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	movs r0, 0xCE
	lsls r0, 2
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _0800BD8C
	strb r2, [r1]
	b _0800BD8C
	.pool
_0800BD30:
	movs r0, 0
	strb r0, [r1]
	b _0800BD8C
_0800BD36:
	ldr r1, =gUnknown_03000D6D
	ldrb r0, [r1]
	cmp r0, 0
	bne _0800BD52
	ldr r2, =0x00000339
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800BD4C
	movs r0, 0x1
	strb r0, [r1]
_0800BD4C:
	ldrb r0, [r1]
	cmp r0, 0
	beq _0800BD68
_0800BD52:
	ldr r1, =0x0400012a
	movs r0, 0
	strh r0, [r1]
	b _0800BD86
	.pool
_0800BD68:
	ldr r3, =0x0400012a
	movs r1, 0xCE
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, 1
	ldrb r2, [r4, 0x16]
	movs r1, 0x64
	muls r1, r2
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x18
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r3]
_0800BD86:
	ldrb r0, [r4, 0x16]
	adds r0, 0x1
	strb r0, [r4, 0x16]
_0800BD8C:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800BCE4

	thumb_func_start sub_800BD98
sub_800BD98: @ 800BD98
	push {lr}
	ldr r0, =gUnknown_03003170
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800BDB4
	ldr r2, =0x0400010e
	ldrh r1, [r2]
	ldr r0, =0x0000ff7f
	ands r0, r1
	strh r0, [r2]
	ldr r1, =0x0400010c
	ldr r2, =0x0000ff3b
	adds r0, r2, 0
	strh r0, [r1]
_0800BDB4:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800BD98

	thumb_func_start sub_800BDCC
sub_800BDCC: @ 800BDCC
	push {lr}
	ldr r1, =gUnknown_03003170
	ldrb r0, [r1, 0x17]
	cmp r0, 0x8
	bne _0800BDE4
	movs r0, 0
	strb r0, [r1, 0x16]
	strb r0, [r1, 0x17]
	b _0800BDF4
	.pool
_0800BDE4:
	ldrb r0, [r1]
	cmp r0, 0
	beq _0800BDF4
	ldr r0, =0x0400010e
	ldrh r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strh r1, [r0]
_0800BDF4:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800BDCC

	thumb_func_start sub_800BDFC
sub_800BDFC: @ 800BDFC
	push {r4-r6,lr}
	ldr r1, =gUnknown_03003170
	ldr r2, =0x00000339
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	movs r3, 0xCE
	lsls r3, 2
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, 0
	movs r6, 0x64
	adds r5, r1, 0
	adds r5, 0x18
	ldr r4, =0x0000efff
_0800BE1A:
	movs r2, 0
	adds r1, r0, 0x1
	adds r3, r0, 0
	muls r3, r6
_0800BE22:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r5
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x31
	bls _0800BE22
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0x7
	bls _0800BE1A
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800BDFC

	thumb_func_start sub_800BE50
sub_800BE50: @ 800BE50
	push {r4-r7,lr}
	ldr r1, =gUnknown_03003170
	ldr r2, =0x00000fbd
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, =0x00000fbc
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, 0x64
	mov r12, r0
	movs r3, 0xCF
	lsls r3, 2
	adds r7, r1, r3
	ldr r6, =0x0000efff
_0800BE6E:
	movs r3, 0
	lsls r0, r2, 1
	adds r5, r2, 0x1
	adds r0, r2
	lsls r0, 3
	adds r0, r2
	lsls r4, r0, 5
_0800BE7C:
	movs r2, 0
	adds r1, r3, 0x1
	mov r0, r12
	muls r0, r3
	adds r3, r0, 0
_0800BE86:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r4
	adds r0, r7
	strh r6, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x31
	bls _0800BE86
	lsls r0, r1, 24
	lsrs r3, r0, 24
	cmp r3, 0x7
	bls _0800BE7C
	lsls r0, r5, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _0800BE6E
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800BE50

	thumb_func_start sub_800BEC0
sub_800BEC0: @ 800BEC0
	push {r4,lr}
	bl rfu_REQBN_softReset_and_checkID
	adds r4, r0, 0
	ldr r0, =0x00008001
	cmp r4, r0
	bne _0800BED4
	ldr r1, =gUnknown_03004140
	movs r0, 0x1
	strb r0, [r1, 0x8]
_0800BED4:
	ldr r0, =gUnknown_03004140
	ldrb r2, [r0, 0x4]
	adds r1, r0, 0
	cmp r2, 0x17
	beq _0800BEE8
	cmp r2, 0x1
	beq _0800BEE8
	movs r0, 0
	strb r0, [r1, 0x5]
	strb r0, [r1, 0x4]
_0800BEE8:
	movs r0, 0
	strb r0, [r1, 0x7]
	strb r0, [r1, 0xD]
	strb r0, [r1, 0x1]
	strb r0, [r1]
	movs r0, 0xFF
	strb r0, [r1, 0x6]
	bl sub_800D610
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800BEC0

	thumb_func_start rfu_REQ_sendData_wrapper
rfu_REQ_sendData_wrapper: @ 800BF0C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800BF34
	ldr r0, =gUnknown_03004140
	ldrb r0, [r0, 0x2]
	movs r2, 0
	cmp r0, 0x1
	bne _0800BF3C
	movs r2, 0x1
	b _0800BF3C
	.pool
_0800BF34:
	ldr r0, =gUnknown_03004140
	ldrb r1, [r0, 0x3]
	movs r1, 0
	strb r1, [r0, 0x3]
_0800BF3C:
	adds r0, r2, 0
	bl rfu_REQ_sendData
	pop {r0}
	bx r0
	.pool
	thumb_func_end rfu_REQ_sendData_wrapper

	thumb_func_start sub_800BF4C
sub_800BF4C: @ 800BF4C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	cmp r5, 0
	beq _0800BF94
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r4, =gUnknown_03004140
	ldr r2, =0x01000024
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	movs r0, 0xFF
	strb r0, [r4, 0x6]
	str r5, [r4, 0x40]
	str r6, [r4, 0x44]
	ldr r0, =sub_800CEB0
	bl rfu_setMSCCallback
	ldr r0, =sub_800C7B4
	bl rfu_setREQCallback
	movs r0, 0
	b _0800BF96
	.pool
_0800BF94:
	movs r0, 0x4
_0800BF96:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_800BF4C

	thumb_func_start sub_800BFA0
sub_800BFA0: @ 800BFA0
	push {r4,lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r4, =gUnknown_03004140
	ldr r2, =0x01000020
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	movs r0, 0xFF
	strb r0, [r4, 0x6]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800BFA0

	thumb_func_start sub_800BFCC
sub_800BFCC: @ 800BFCC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_800C000
	ldr r1, =gUnknown_03004140
	movs r2, 0x1
	strb r2, [r1, 0x4]
	movs r0, 0x2
	strb r0, [r1, 0x5]
	str r4, [r1, 0x3C]
	ldrb r0, [r4, 0x11]
	strb r0, [r1, 0x9]
	ldrh r0, [r4, 0x12]
	strh r0, [r1, 0x32]
	ldrh r0, [r4, 0x14]
	strh r0, [r1, 0x18]
	ldrb r0, [r4, 0x10]
	cmp r0, 0
	beq _0800BFF4
	strb r2, [r1, 0xB]
_0800BFF4:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800BFCC

	thumb_func_start sub_800C000
sub_800C000: @ 800C000
	push {r4,r5,lr}
	ldr r2, =gUnknown_03004140
	movs r0, 0
	strb r0, [r2, 0x5]
	strb r0, [r2, 0x4]
	movs r1, 0xFF
	strb r1, [r2, 0x6]
	strb r0, [r2, 0x7]
	strb r0, [r2, 0x10]
	strb r0, [r2, 0xC]
	adds r1, r2, 0
	adds r1, 0x24
	strb r0, [r1]
	adds r1, 0xC
	strb r0, [r1]
	movs r3, 0
	adds r5, r2, 0
	adds r5, 0x28
	movs r4, 0
	adds r2, 0x34
_0800C028:
	lsls r1, r3, 1
	adds r0, r1, r5
	strh r4, [r0]
	adds r1, r2
	strh r4, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0800C028
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800C000

	thumb_func_start sub_800C048
sub_800C048: @ 800C048
	ldr r1, =gUnknown_03004140
	movs r0, 0x15
	strb r0, [r1, 0x4]
	bx lr
	.pool
	thumb_func_end sub_800C048

	thumb_func_start sub_800C054
sub_800C054: @ 800C054
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r3, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	ldr r1, =gUnknown_03004140
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _0800C090
	cmp r0, 0x8
	bne _0800C07A
	cmp r5, 0x1
	beq _0800C090
_0800C07A:
	movs r0, 0x1
	strh r0, [r1, 0x14]
	movs r0, 0xF3
	movs r1, 0x1
	bl sub_800D30C
	movs r0, 0x1
	b _0800C122
	.pool
_0800C090:
	bl rfu_getMasterSlave
	lsls r0, 24
	cmp r0, 0
	bne _0800C0B0
	ldr r1, =gUnknown_03004140
	movs r0, 0x2
	strh r0, [r1, 0x14]
	movs r0, 0xF3
	movs r1, 0x1
	bl sub_800D30C
	movs r0, 0x2
	b _0800C122
	.pool
_0800C0B0:
	movs r2, 0
	ldrh r0, [r6]
	ldr r4, =0x0000ffff
	adds r1, r6, 0x2
	ldr r3, =gUnknown_03004140
	cmp r0, r4
	beq _0800C0D0
_0800C0BE:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bhi _0800C0D0
	ldrh r0, [r1]
	adds r1, 0x2
	cmp r0, r4
	bne _0800C0BE
_0800C0D0:
	cmp r2, 0x10
	bne _0800C0EC
	movs r0, 0x4
	strh r0, [r3, 0x14]
	movs r0, 0xF3
	movs r1, 0x1
	bl sub_800D30C
	movs r0, 0x4
	b _0800C122
	.pool
_0800C0EC:
	cmp r5, 0x1
	bls _0800C0FA
	movs r0, 0x1
	strb r0, [r3, 0x7]
	movs r5, 0x1
	movs r7, 0
	b _0800C0FE
_0800C0FA:
	movs r0, 0
	strb r0, [r3, 0x7]
_0800C0FE:
	cmp r5, 0
	beq _0800C108
	movs r0, 0x5
	strb r0, [r3, 0x4]
	b _0800C116
_0800C108:
	movs r0, 0x9
	strb r0, [r3, 0x4]
	ldrb r0, [r3, 0xB]
	cmp r0, 0
	beq _0800C116
	movs r0, 0x2
	strb r0, [r3, 0xB]
_0800C116:
	strb r5, [r3, 0x6]
	strh r7, [r3, 0x1A]
	mov r0, r8
	strh r0, [r3, 0x26]
	str r6, [r3, 0x20]
	movs r0, 0
_0800C122:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_800C054

	thumb_func_start sub_800C12C
sub_800C12C: @ 800C12C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	ldr r1, =gUnknown_03004140
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _0800C164
	subs r0, 0x9
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bls _0800C164
	movs r0, 0x1
	strh r0, [r1, 0x14]
	movs r0, 0xF3
	movs r1, 0x1
	bl sub_800D30C
	movs r0, 0x1
	b _0800C204
	.pool
_0800C164:
	bl rfu_getMasterSlave
	lsls r0, 24
	cmp r0, 0
	bne _0800C184
	ldr r1, =gUnknown_03004140
	movs r0, 0x2
	strh r0, [r1, 0x14]
	movs r0, 0xF3
	movs r1, 0x1
	bl sub_800D30C
	movs r0, 0x2
	b _0800C204
	.pool
_0800C184:
	movs r2, 0
	ldr r0, =gUnknown_03007890
	ldr r1, [r0]
	ldrb r3, [r1, 0x8]
	ldr r5, =gUnknown_03004140
	adds r7, r0, 0
	cmp r2, r3
	bcs _0800C1B2
	ldrh r0, [r1, 0x14]
	cmp r0, r6
	beq _0800C1B2
	adds r4, r1, 0
	adds r1, r3, 0
_0800C19E:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r1
	bcs _0800C1B2
	lsls r0, r2, 5
	adds r0, r4, r0
	ldrh r0, [r0, 0x14]
	cmp r0, r6
	bne _0800C19E
_0800C1B2:
	ldr r0, [r7]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	beq _0800C1BE
	cmp r2, r0
	bne _0800C1D8
_0800C1BE:
	movs r0, 0x3
	strh r0, [r5, 0x14]
	movs r0, 0xF3
	movs r1, 0x1
	bl sub_800D30C
	movs r0, 0x3
	b _0800C204
	.pool
_0800C1D8:
	ldrb r0, [r5, 0x4]
	cmp r0, 0
	beq _0800C1E2
	cmp r0, 0x9
	bne _0800C1EA
_0800C1E2:
	movs r0, 0xC
	strb r0, [r5, 0x4]
	movs r0, 0xD
	b _0800C1F0
_0800C1EA:
	movs r0, 0xB
	strb r0, [r5, 0x4]
	movs r0, 0xC
_0800C1F0:
	strb r0, [r5, 0x5]
	strh r6, [r5, 0x1E]
	mov r0, r8
	strh r0, [r5, 0x1A]
	ldrb r0, [r5, 0x7]
	cmp r0, 0
	beq _0800C202
	movs r0, 0x7
	strb r0, [r5, 0x7]
_0800C202:
	movs r0, 0
_0800C204:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_800C12C

	thumb_func_start sub_800C210
sub_800C210: @ 800C210
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r6, =gUnknown_03004140
	adds r3, r6, 0
	adds r3, 0x30
	ldrb r2, [r3]
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _0800C26C
	adds r0, r2, 0
	bics r0, r1
	strb r0, [r3]
	movs r4, 0
	ldr r7, =gUnknown_03007890
	movs r5, 0x1
	adds r3, 0x4
	movs r2, 0
_0800C236:
	adds r0, r1, 0
	asrs r0, r4
	ands r0, r5
	cmp r0, 0
	beq _0800C246
	lsls r0, r4, 1
	adds r0, r3
	strh r2, [r0]
_0800C246:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0800C236
	ldr r0, [r7]
	ldrb r4, [r0, 0x3]
	ands r4, r1
	cmp r4, 0
	beq _0800C260
	adds r0, r4, 0
	bl sub_800D334
_0800C260:
	ldr r0, =gUnknown_03004140
	strh r4, [r0, 0x14]
	movs r0, 0x33
	adds r1, r4, 0
	bl sub_800D30C
_0800C26C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800C210

	thumb_func_start sub_800C27C
sub_800C27C: @ 800C27C
	push {r4,r5,lr}
	lsls r0, 24
	movs r2, 0
	ldr r1, =gUnknown_03004140
	strb r2, [r1, 0x7]
	adds r5, r1, 0
	cmp r0, 0
	beq _0800C29C
	bl sub_800C000
	movs r0, 0x17
	strb r0, [r5, 0x4]
	b _0800C366
	.pool
_0800C29C:
	ldrb r0, [r5, 0x4]
	subs r0, 0x5
	cmp r0, 0xD
	bhi _0800C352
	lsls r0, 2
	ldr r1, =_0800C2B4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0800C2B4:
	.4byte _0800C2EC
	.4byte _0800C2F8
	.4byte _0800C2F8
	.4byte _0800C358
	.4byte _0800C302
	.4byte _0800C30C
	.4byte _0800C30C
	.4byte _0800C316
	.4byte _0800C320
	.4byte _0800C320
	.4byte _0800C358
	.4byte _0800C326
	.4byte _0800C34C
	.4byte _0800C34C
_0800C2EC:
	movs r1, 0
	movs r0, 0x8
	strb r0, [r5, 0x4]
	strb r1, [r5, 0x5]
	movs r2, 0x13
	b _0800C358
_0800C2F8:
	movs r0, 0x7
	strb r0, [r5, 0x4]
	movs r0, 0x8
	strb r0, [r5, 0x5]
	b _0800C358
_0800C302:
	movs r0, 0
	strb r0, [r5, 0x5]
	strb r0, [r5, 0x4]
	movs r2, 0x21
	b _0800C358
_0800C30C:
	movs r1, 0
	movs r0, 0xB
	strb r0, [r5, 0x4]
	strb r1, [r5, 0x5]
	b _0800C358
_0800C316:
	movs r0, 0
	strb r0, [r5, 0x5]
	strb r0, [r5, 0x4]
	movs r2, 0x23
	b _0800C358
_0800C320:
	movs r0, 0xE
	strb r0, [r5, 0x4]
	b _0800C358
_0800C326:
	ldrb r0, [r5, 0x11]
	strb r0, [r5, 0x4]
	ldrb r0, [r5, 0x12]
	strb r0, [r5, 0x5]
	ldr r4, =gUnknown_03007890
	ldr r0, [r4]
	ldrb r0, [r0, 0x3]
	bl sub_800D334
	ldr r0, [r4]
	ldrb r0, [r0, 0x3]
	strh r0, [r5, 0x14]
	movs r0, 0x33
	movs r1, 0x1
	bl sub_800D30C
	b _0800C366
	.pool
_0800C34C:
	movs r0, 0x12
	strb r0, [r5, 0x4]
	b _0800C358
_0800C352:
	strb r2, [r5, 0x5]
	strb r2, [r5, 0x4]
	movs r2, 0x43
_0800C358:
	ldrb r0, [r5, 0x4]
	cmp r0, 0
	bne _0800C366
	adds r0, r2, 0
	movs r1, 0
	bl sub_800D30C
_0800C366:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_800C27C

	thumb_func_start sub_800C36C
sub_800C36C: @ 800C36C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	mov r8, r1
	mov r5, sp
	adds r5, 0x1
	mov r4, sp
	adds r4, 0x2
	mov r1, sp
	adds r2, r5, 0
	adds r3, r4, 0
	bl rfu_REQBN_watchLink
	mov r0, sp
	ldrb r0, [r0]
	adds r7, r4, 0
	cmp r0, 0
	beq _0800C43E
	ldr r1, =gUnknown_03004140
	mov r0, sp
	ldrb r0, [r0]
	strh r0, [r1, 0x14]
	ldrb r0, [r5]
	strh r0, [r1, 0x16]
	ldrb r0, [r1, 0x9]
	adds r6, r1, 0
	cmp r0, 0
	beq _0800C426
	movs r0, 0x1
	strb r0, [r6, 0xA]
	ldrb r0, [r6, 0x6]
	cmp r0, 0
	bne _0800C3C2
	ldrb r0, [r5]
	cmp r0, 0
	bne _0800C3C2
	movs r0, 0x4
	strb r0, [r6, 0xA]
_0800C3C2:
	ldrb r0, [r6, 0xA]
	cmp r0, 0x1
	bne _0800C40C
	movs r2, 0
	mov r4, sp
	movs r5, 0x1
	mov r12, r6
	mov r3, r12
	adds r3, 0x30
	movs r6, 0x34
	add r6, r12
	mov r9, r6
_0800C3DA:
	ldrb r0, [r4]
	asrs r0, r2
	ands r0, r5
	cmp r0, 0
	beq _0800C3F8
	adds r0, r5, 0
	lsls r0, r2
	ldrb r1, [r3]
	orrs r0, r1
	strb r0, [r3]
	lsls r0, r2, 1
	add r0, r9
	mov r6, r12
	ldrh r1, [r6, 0x32]
	strh r1, [r0]
_0800C3F8:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _0800C3DA
	movs r0, 0x31
	b _0800C41E
	.pool
_0800C40C:
	movs r0, 0
	strb r0, [r6, 0xA]
	mov r0, sp
	ldrb r0, [r0]
	bl sub_800D334
	movs r0, 0x1
	mov r8, r0
	movs r0, 0x33
_0800C41E:
	movs r1, 0x1
	bl sub_800D30C
	b _0800C43A
_0800C426:
	mov r0, sp
	ldrb r0, [r0]
	bl sub_800D334
	movs r1, 0x1
	mov r8, r1
	movs r0, 0x30
	movs r1, 0x2
	bl sub_800D30C
_0800C43A:
	bl sub_800D610
_0800C43E:
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800C518
	ldrb r0, [r7]
	cmp r0, 0
	beq _0800C49C
	movs r2, 0
	ldr r6, =gUnknown_03004140
	movs r3, 0x1
	adds r4, r6, 0
	adds r4, 0x34
	adds r6, 0x30
	adds r5, r7, 0
_0800C45C:
	ldrb r0, [r6]
	asrs r0, r2
	ands r0, r3
	cmp r0, 0
	beq _0800C478
	ldrb r0, [r5]
	asrs r0, r2
	ands r0, r3
	cmp r0, 0
	beq _0800C478
	lsls r0, r2, 1
	adds r0, r4
	movs r1, 0
	strh r1, [r0]
_0800C478:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _0800C45C
	ldr r3, =gUnknown_03004140
	adds r2, r3, 0
	adds r2, 0x30
	ldrb r1, [r7]
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	ldrb r0, [r7]
	strh r0, [r3, 0x14]
	movs r0, 0x32
	movs r1, 0x1
	bl sub_800D30C
_0800C49C:
	ldr r0, =gUnknown_03004140
	adds r3, r0, 0
	adds r3, 0x30
	ldrb r1, [r3]
	adds r6, r0, 0
	cmp r1, 0
	beq _0800C514
	movs r4, 0
	movs r2, 0
	movs r5, 0x1
_0800C4B0:
	ldrb r0, [r3]
	asrs r0, r2
	ands r0, r5
	cmp r0, 0
	beq _0800C4E2
	lsls r1, r2, 1
	adds r0, r6, 0
	adds r0, 0x34
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _0800C4E2
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _0800C4E2
	adds r0, r5, 0
	lsls r0, r2
	ldrb r1, [r3]
	bics r1, r0
	strb r1, [r3]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_0800C4E2:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _0800C4B0
	cmp r4, 0
	beq _0800C506
	adds r0, r4, 0
	bl sub_800D334
	movs r6, 0x1
	mov r8, r6
	ldr r0, =gUnknown_03004140
	strh r4, [r0, 0x14]
	movs r0, 0x33
	movs r1, 0x1
	bl sub_800D30C
_0800C506:
	ldr r0, =gUnknown_03004140
	adds r1, r0, 0
	adds r1, 0x30
	ldrb r1, [r1]
	adds r6, r0, 0
	cmp r1, 0
	bne _0800C518
_0800C514:
	movs r0, 0
	strb r0, [r6, 0xA]
_0800C518:
	mov r0, r8
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800C36C

	thumb_func_start rfu_syncVBlank_
rfu_syncVBlank_: @ 800C530
	push {lr}
	bl rfu_syncVBlank
	lsls r0, 16
	cmp r0, 0
	beq _0800C548
	movs r0, 0xF1
	movs r1, 0
	bl sub_800D30C
	bl sub_800D610
_0800C548:
	pop {r0}
	bx r0
	thumb_func_end rfu_syncVBlank_

	thumb_func_start sub_800C54C
sub_800C54C: @ 800C54C
	push {r4,lr}
	adds r3, r0, 0
	ldr r1, =gUnknown_03004140
	ldr r2, [r1, 0x40]
	cmp r2, 0
	bne _0800C568
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _0800C568
	strb r2, [r1, 0x4]
	b _0800C736
	.pool
_0800C568:
	ldr r0, =gUnknown_03004140
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	beq _0800C576
	adds r0, r3, 0
	bl sub_800C744
_0800C576:
	ldr r4, =gUnknown_03004140
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	bne _0800C580
	b _0800C700
_0800C580:
	bl rfu_waitREQComplete
	movs r0, 0x1
	strb r0, [r4, 0xE]
	ldrb r0, [r4, 0x4]
	subs r0, 0x1
	cmp r0, 0x16
	bls _0800C592
	b _0800C6F6
_0800C592:
	lsls r0, 2
	ldr r1, =_0800C5A4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0800C5A4:
	.4byte _0800C624
	.4byte _0800C65C
	.4byte _0800C662
	.4byte _0800C678
	.4byte _0800C690
	.4byte _0800C696
	.4byte _0800C69C
	.4byte _0800C6F6
	.4byte _0800C6A2
	.4byte _0800C6A8
	.4byte _0800C6AE
	.4byte _0800C6B4
	.4byte _0800C6C4
	.4byte _0800C6CA
	.4byte _0800C6F6
	.4byte _0800C6D0
	.4byte _0800C6E0
	.4byte _0800C6E6
	.4byte _0800C6EC
	.4byte _0800C6F6
	.4byte _0800C6F2
	.4byte _0800C6F6
	.4byte _0800C600
_0800C600:
	bl sub_800BEC0
	ldr r1, =0x00008001
	movs r2, 0xFF
	cmp r0, r1
	bne _0800C60E
	movs r2, 0x44
_0800C60E:
	ldr r1, =gUnknown_03004140
	movs r0, 0
	strb r0, [r1, 0x5]
	strb r0, [r1, 0x4]
	adds r0, r2, 0
	b _0800C64E
	.pool
_0800C624:
	bl sub_800BEC0
	ldr r1, =0x00008001
	cmp r0, r1
	bne _0800C644
	ldr r0, =gUnknown_03004140
	ldrb r1, [r0, 0x5]
	strb r1, [r0, 0x4]
	movs r1, 0x3
	strb r1, [r0, 0x5]
	b _0800C6F6
	.pool
_0800C644:
	ldr r1, =gUnknown_03004140
	movs r0, 0
	strb r0, [r1, 0x5]
	strb r0, [r1, 0x4]
	movs r0, 0xFF
_0800C64E:
	movs r1, 0
	bl sub_800D30C
	b _0800C6F6
	.pool
_0800C65C:
	bl rfu_REQ_reset
	b _0800C6F6
_0800C662:
	ldr r0, =gUnknown_03004140
	ldr r2, [r0, 0x3C]
	ldrh r0, [r2, 0x2]
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	bl rfu_REQ_configSystem
	b _0800C6F6
	.pool
_0800C678:
	ldr r0, =gUnknown_03004140
	ldr r3, [r0, 0x3C]
	ldrb r0, [r3, 0x4]
	ldrh r1, [r3, 0x6]
	ldr r2, [r3, 0x8]
	ldr r3, [r3, 0xC]
	bl rfu_REQ_configGameData
	b _0800C6F6
	.pool
_0800C690:
	bl rfu_REQ_startSearchChild
	b _0800C6F6
_0800C696:
	bl rfu_REQ_pollSearchChild
	b _0800C6F6
_0800C69C:
	bl rfu_REQ_endSearchChild
	b _0800C6F6
_0800C6A2:
	bl rfu_REQ_startSearchParent
	b _0800C6F6
_0800C6A8:
	bl rfu_REQ_pollSearchParent
	b _0800C6F6
_0800C6AE:
	bl rfu_REQ_endSearchParent
	b _0800C6F6
_0800C6B4:
	ldr r0, =gUnknown_03004140
	ldrh r0, [r0, 0x1E]
	bl rfu_REQ_startConnectParent
	b _0800C6F6
	.pool
_0800C6C4:
	bl rfu_REQ_pollConnectParent
	b _0800C6F6
_0800C6CA:
	bl rfu_REQ_endConnectParent
	b _0800C6F6
_0800C6D0:
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	bl rfu_REQ_CHILD_startConnectRecovery
	b _0800C6F6
	.pool
_0800C6E0:
	bl rfu_REQ_CHILD_pollConnectRecovery
	b _0800C6F6
_0800C6E6:
	bl rfu_REQ_CHILD_endConnectRecovery
	b _0800C6F6
_0800C6EC:
	bl rfu_REQ_changeMasterSlave
	b _0800C6F6
_0800C6F2:
	bl rfu_REQ_stopMode
_0800C6F6:
	bl rfu_waitREQComplete
	ldr r1, =gUnknown_03004140
	movs r0, 0
	strb r0, [r1, 0xE]
_0800C700:
	ldr r0, =gUnknown_03004140
	ldrb r0, [r0, 0x4]
	subs r0, 0x12
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0800C710
	b _0800C576
_0800C710:
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800C726
	movs r0, 0
	bl sub_800C36C
	lsls r0, 24
	cmp r0, 0
	bne _0800C736
_0800C726:
	bl sub_800CF34
	bl sub_800D158
	bl sub_800D268
	bl sub_800D434
_0800C736:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800C54C

	thumb_func_start sub_800C744
sub_800C744: @ 800C744
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, =gUnknown_03004140
	ldrb r1, [r0, 0x7]
	adds r4, r0, 0
	cmp r1, 0x5
	bne _0800C76E
	movs r2, 0x1
	strb r2, [r4, 0x6]
	strb r1, [r4, 0x4]
	ldrh r0, [r4, 0x1C]
	strh r0, [r4, 0x1A]
	lsls r0, 16
	cmp r0, 0
	beq _0800C76C
	movs r0, 0x6
	strb r0, [r4, 0x7]
	b _0800C76E
	.pool
_0800C76C:
	strb r2, [r4, 0x7]
_0800C76E:
	ldrb r0, [r4, 0x7]
	cmp r0, 0x1
	bne _0800C798
	strb r0, [r4, 0x6]
	movs r0, 0x5
	strb r0, [r4, 0x4]
	adds r0, r3, 0
	movs r1, 0x8C
	bl __umodsi3
	strh r0, [r4, 0x1A]
	movs r1, 0x8C
	subs r1, r0
	strh r1, [r4, 0x1C]
	lsls r0, 16
	cmp r0, 0
	beq _0800C794
	movs r0, 0x2
	b _0800C796
_0800C794:
	movs r0, 0x3
_0800C796:
	strb r0, [r4, 0x7]
_0800C798:
	ldrb r0, [r4, 0x7]
	cmp r0, 0x3
	bne _0800C7AE
	movs r0, 0
	strb r0, [r4, 0x6]
	movs r0, 0x28
	strh r0, [r4, 0x1A]
	movs r0, 0x4
	strb r0, [r4, 0x7]
	movs r0, 0x9
	strb r0, [r4, 0x4]
_0800C7AE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_800C744

	thumb_func_start sub_800C7B4
sub_800C7B4: @ 800C7B4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r0, =gUnknown_03004140
	ldrb r1, [r0, 0xE]
	adds r7, r0, 0
	cmp r1, 0
	bne _0800C7D2
	b _0800CC98
_0800C7D2:
	movs r0, 0
	strb r0, [r7, 0xE]
	mov r0, r8
	subs r0, 0x10
	cmp r0, 0x2D
	bls _0800C7E0
	b _0800CC8A
_0800C7E0:
	lsls r0, 2
	ldr r1, =_0800C7F4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0800C7F4:
	.4byte _0800C8AC
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800C8D8
	.4byte _0800C8C4
	.4byte _0800CC8A
	.4byte _0800C8EC
	.4byte _0800C8FC
	.4byte _0800C920
	.4byte _0800C940
	.4byte _0800C960
	.4byte _0800C9D0
	.4byte _0800CA02
	.4byte _0800CA18
	.4byte _0800CA60
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CBD8
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CAD0
	.4byte _0800CB1C
	.4byte _0800CB64
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC8A
	.4byte _0800CC78
_0800C8AC:
	cmp r6, 0
	beq _0800C8B2
	b _0800CC8A
_0800C8B2:
	ldr r0, =gUnknown_03004140
	ldrb r1, [r0, 0x5]
	strb r1, [r0, 0x4]
	movs r1, 0x4
	strb r1, [r0, 0x5]
	b _0800CC8A
	.pool
_0800C8C4:
	cmp r6, 0
	beq _0800C8CA
	b _0800CC8A
_0800C8CA:
	ldr r0, =gUnknown_03004140
	ldrb r1, [r0, 0x5]
	strb r1, [r0, 0x4]
	strb r6, [r0, 0x5]
	b _0800CC8A
	.pool
_0800C8D8:
	cmp r6, 0
	beq _0800C8DE
	b _0800CC8A
_0800C8DE:
	ldr r0, =gUnknown_03004140
	strb r6, [r0, 0x5]
	strb r6, [r0, 0x4]
	movs r0, 0
	b _0800CBF6
	.pool
_0800C8EC:
	cmp r6, 0
	beq _0800C8F2
	b _0800CC8A
_0800C8F2:
	ldr r1, =gUnknown_03004140
	movs r0, 0x6
	b _0800CA0C
	.pool
_0800C8FC:
	ldr r1, =gUnknown_03004140
	ldrh r0, [r1, 0x1A]
	cmp r0, 0
	bne _0800C906
	b _0800CC8A
_0800C906:
	subs r0, 0x1
	strh r0, [r1, 0x1A]
	lsls r0, 16
	cmp r0, 0
	beq _0800C912
	b _0800CC8A
_0800C912:
	movs r0, 0x7
	strb r0, [r1, 0x4]
	movs r0, 0x8
	strb r0, [r1, 0x5]
	b _0800CC8A
	.pool
_0800C920:
	cmp r6, 0
	beq _0800C926
	b _0800CC8A
_0800C926:
	ldr r0, =gUnknown_03004140
	ldrb r1, [r0, 0x5]
	strb r1, [r0, 0x4]
	strb r6, [r0, 0x5]
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	beq _0800C936
	b _0800CC8A
_0800C936:
	movs r0, 0x13
	b _0800CBF6
	.pool
_0800C940:
	cmp r6, 0
	beq _0800C946
	b _0800CC8A
_0800C946:
	ldrb r0, [r7, 0xB]
	cmp r0, 0x1
	bne _0800C956
	ldrh r0, [r7, 0x1A]
	cmp r0, 0x1
	bls _0800C956
	subs r0, 0x1
	strh r0, [r7, 0x1A]
_0800C956:
	ldr r1, =gUnknown_03004140
	movs r0, 0xA
	b _0800CA0C
	.pool
_0800C960:
	cmp r6, 0
	bne _0800C9A6
	bl sub_800D294
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	ldr r4, =gUnknown_03004140
	strh r0, [r4, 0x14]
	cmp r0, 0
	beq _0800C980
	movs r0, 0x20
	movs r1, 0x1
	bl sub_800D30C
_0800C980:
	ldrb r0, [r4, 0xB]
	cmp r0, 0
	beq _0800C9A6
	ldrh r0, [r4, 0x1A]
	cmp r0, 0x1
	beq _0800C9A6
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0x4
	bne _0800C9A6
	bl rfu_REQ_endSearchParent
	bl rfu_waitREQComplete
	movs r0, 0x9
	strb r0, [r4, 0x4]
	movs r0, 0x1
	strb r0, [r4, 0xB]
_0800C9A6:
	ldr r1, =gUnknown_03004140
	ldrh r0, [r1, 0x1A]
	cmp r0, 0
	bne _0800C9B0
	b _0800CC8A
_0800C9B0:
	subs r0, 0x1
	strh r0, [r1, 0x1A]
	lsls r0, 16
	cmp r0, 0
	beq _0800C9BC
	b _0800CC8A
_0800C9BC:
	movs r0, 0xB
	strb r0, [r1, 0x4]
	movs r0, 0
	strb r0, [r1, 0x5]
	b _0800CC8A
	.pool
_0800C9D0:
	cmp r6, 0
	beq _0800C9D6
	b _0800CC8A
_0800C9D6:
	ldr r2, =gUnknown_03004140
	ldrb r0, [r2, 0x5]
	strb r0, [r2, 0x4]
	ldrb r1, [r2, 0x7]
	cmp r1, 0
	bne _0800C9F4
	lsls r0, 24
	cmp r0, 0
	beq _0800C9EA
	b _0800CC8A
_0800C9EA:
	movs r0, 0x21
	b _0800CBF6
	.pool
_0800C9F4:
	cmp r1, 0x7
	bne _0800C9FA
	b _0800CC8A
_0800C9FA:
	movs r0, 0x5
	strb r0, [r2, 0x4]
	strb r0, [r2, 0x7]
	b _0800CC8A
_0800CA02:
	cmp r6, 0
	beq _0800CA08
	b _0800CC8A
_0800CA08:
	ldr r1, =gUnknown_03004140
	movs r0, 0xD
_0800CA0C:
	strb r0, [r1, 0x5]
	strb r0, [r1, 0x4]
	b _0800CC8A
	.pool
_0800CA18:
	cmp r6, 0
	bne _0800CA3C
	ldr r4, =gUnknown_03004150
	mov r0, sp
	adds r1, r4, 0
	bl rfu_getConnectParentStatus
	lsls r0, 16
	cmp r0, 0
	bne _0800CA3C
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800CA3C
	adds r1, r4, 0
	subs r1, 0x10
	movs r0, 0xE
	strb r0, [r1, 0x4]
_0800CA3C:
	ldr r1, =gUnknown_03004140
	ldrh r0, [r1, 0x1A]
	cmp r0, 0
	bne _0800CA46
	b _0800CC8A
_0800CA46:
	subs r0, 0x1
	strh r0, [r1, 0x1A]
	lsls r0, 16
	cmp r0, 0
	beq _0800CA52
	b _0800CC8A
_0800CA52:
	movs r0, 0xE
	strb r0, [r1, 0x4]
	b _0800CC8A
	.pool
_0800CA60:
	cmp r6, 0
	beq _0800CA66
	b _0800CC8A
_0800CA66:
	ldr r4, =gUnknown_03004150
	mov r0, sp
	adds r1, r4, 0
	bl rfu_getConnectParentStatus
	lsls r0, 16
	cmp r0, 0
	beq _0800CA78
	b _0800CC8A
_0800CA78:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800CA9C
	adds r1, r4, 0
	subs r1, 0x10
	movs r0, 0x13
	strb r0, [r1, 0x4]
	movs r0, 0xF
	strb r0, [r1, 0x5]
	movs r0, 0x22
	strh r0, [r1, 0x1E]
	ldrb r0, [r1, 0x10]
	strh r0, [r1, 0x14]
	b _0800CABC
	.pool
_0800CA9C:
	adds r1, r4, 0
	subs r1, 0x10
	strb r6, [r1, 0x5]
	strb r6, [r1, 0x4]
	movs r0, 0x23
	strh r0, [r1, 0x1E]
	mov r0, sp
	ldrb r0, [r0]
	strh r0, [r1, 0x14]
	ldrb r0, [r1, 0x7]
	cmp r0, 0
	beq _0800CABC
	movs r0, 0x3
	strb r0, [r1, 0x7]
	movs r0, 0x9
	strb r0, [r1, 0x4]
_0800CABC:
	ldr r4, =gUnknown_03004140
	ldrb r0, [r4, 0x1E]
	movs r1, 0x1
	bl sub_800D30C
	movs r0, 0
	strh r0, [r4, 0x1E]
	b _0800CC8A
	.pool
_0800CAD0:
	cmp r6, 0
	beq _0800CAD6
	b _0800CC8A
_0800CAD6:
	ldr r2, =gUnknown_03007890
	ldr r3, [r2]
	ldrb r0, [r3, 0x3]
	movs r1, 0
	strh r0, [r7, 0x14]
	movs r0, 0x11
	strb r0, [r7, 0x5]
	strb r0, [r7, 0x4]
	strb r1, [r7, 0x10]
	ldrb r0, [r3, 0x3]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0800CAF4
	b _0800CC8A
_0800CAF4:
	adds r1, r7, 0
	movs r3, 0x1
_0800CAF8:
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _0800CB08
	b _0800CC8A
_0800CB08:
	ldr r0, [r2]
	ldrb r0, [r0, 0x3]
	ldrb r4, [r7, 0x10]
	asrs r0, r4
	ands r0, r3
	cmp r0, 0
	beq _0800CAF8
	b _0800CC8A
	.pool
_0800CB1C:
	cmp r6, 0
	bne _0800CB3A
	mov r0, sp
	bl rfu_CHILD_getConnectRecoveryStatus
	lsls r0, 16
	cmp r0, 0
	bne _0800CB3A
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0x1
	bhi _0800CB3A
	ldr r1, =gUnknown_03004140
	movs r0, 0x12
	strb r0, [r1, 0x4]
_0800CB3A:
	ldr r2, =gUnknown_03004140
	ldrb r0, [r2, 0x10]
	lsls r0, 1
	adds r1, r2, 0
	adds r1, 0x34
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, 0
	bne _0800CB4E
	b _0800CC8A
_0800CB4E:
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _0800CB5A
	b _0800CC8A
_0800CB5A:
	movs r0, 0x12
	strb r0, [r2, 0x4]
	b _0800CC8A
	.pool
_0800CB64:
	cmp r6, 0
	beq _0800CB6A
	b _0800CC8A
_0800CB6A:
	mov r0, sp
	bl rfu_CHILD_getConnectRecoveryStatus
	lsls r0, 16
	cmp r0, 0
	beq _0800CB78
	b _0800CC8A
_0800CB78:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800CB94
	ldr r1, =gUnknown_03004140
	movs r0, 0x13
	strb r0, [r1, 0x4]
	movs r0, 0x16
	strb r0, [r1, 0x5]
	movs r0, 0x32
	strh r0, [r1, 0x1E]
	b _0800CBA8
	.pool
_0800CB94:
	ldr r4, =gUnknown_03004140
	strb r6, [r4, 0x5]
	strb r6, [r4, 0x4]
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	bl sub_800D334
	movs r0, 0x33
	strh r0, [r4, 0x1E]
_0800CBA8:
	ldr r5, =gUnknown_03004140
	ldrb r0, [r5, 0x10]
	lsls r0, 1
	adds r1, r5, 0
	adds r1, 0x34
	adds r0, r1
	movs r1, 0
	movs r4, 0
	strh r4, [r0]
	adds r0, r5, 0
	adds r0, 0x30
	strb r1, [r0]
	strb r1, [r5, 0xA]
	ldrb r0, [r5, 0x1E]
	movs r1, 0x1
	bl sub_800D30C
	strh r4, [r5, 0x1E]
	b _0800CC8A
	.pool
_0800CBD8:
	cmp r6, 0
	bne _0800CC8A
	ldr r5, =gUnknown_03004140
	ldrb r1, [r5, 0x5]
	adds r0, r1, 0
	cmp r0, 0x16
	bne _0800CC04
	ldrb r0, [r5, 0x11]
	strb r0, [r5, 0x4]
	ldrb r0, [r5, 0x12]
	strb r0, [r5, 0x5]
	ldrb r0, [r5, 0x2]
	movs r0, 0x1
	strb r0, [r5, 0x2]
	movs r0, 0x41
_0800CBF6:
	movs r1, 0
	bl sub_800D30C
	b _0800CC8A
	.pool
_0800CC04:
	cmp r0, 0xF
	bne _0800CC8A
	strb r1, [r5, 0x4]
	ldrb r0, [r5, 0x2]
	movs r4, 0x1
	strb r4, [r5, 0x2]
	movs r0, 0x41
	movs r1, 0
	bl sub_800D30C
	adds r1, r5, 0
	adds r1, 0x24
	ldrb r0, [r5, 0x10]
	lsls r4, r0
	ldrb r0, [r1]
	orrs r4, r0
	strb r4, [r1]
	ldrb r0, [r5, 0x10]
	lsls r0, 1
	adds r1, 0x4
	adds r0, r1
	ldrh r1, [r5, 0x26]
	movs r7, 0
	strh r1, [r0]
	ldrb r1, [r5, 0x10]
	movs r0, 0x4
	bl rfu_clearSlot
	mov r4, sp
	ldrb r0, [r5, 0x10]
	movs r1, 0xE
	bl rfu_NI_CHILD_setSendGameName
	strb r0, [r4]
	lsls r0, 24
	cmp r0, 0
	beq _0800CC8A
	strb r7, [r5, 0x5]
	strb r7, [r5, 0x4]
	bl sub_800D610
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
	ldrb r0, [r0, 0x3]
	orrs r0, r1
	bl sub_800D334
	mov r0, sp
	ldrb r0, [r0]
	strh r0, [r5, 0x14]
	movs r0, 0x25
	movs r1, 0x1
	bl sub_800D30C
	b _0800CC8A
	.pool
_0800CC78:
	cmp r6, 0
	bne _0800CC8A
	ldr r0, =gUnknown_03004140
	strb r6, [r0, 0x5]
	strb r6, [r0, 0x4]
	movs r0, 0x42
	movs r1, 0
	bl sub_800D30C
_0800CC8A:
	ldr r1, =gUnknown_03004140
	movs r0, 0x1
	strb r0, [r1, 0xE]
	b _0800CCE6
	.pool
_0800CC98:
	cmp r6, 0x3
	bne _0800CCE6
	ldrb r0, [r7, 0xF]
	cmp r0, 0
	beq _0800CCE6
	mov r3, r8
	cmp r3, 0x24
	beq _0800CCB0
	cmp r3, 0x26
	beq _0800CCB0
	cmp r3, 0x27
	bne _0800CCE6
_0800CCB0:
	bl rfu_REQ_RFUStatus
	bl rfu_waitREQComplete
	mov r0, sp
	bl rfu_getRFUStatus
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800CCE6
	ldr r4, =gUnknown_03007890
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800CCE6
	bl rfu_getSTWIRecvBuffer
	ldr r1, [r4]
	ldrb r1, [r1, 0x2]
	strb r1, [r0, 0x4]
	movs r1, 0x1
	strb r1, [r0, 0x5]
	movs r0, 0x29
	bl sub_800C36C
	movs r6, 0
_0800CCE6:
	mov r4, r8
	cmp r4, 0x26
	bne _0800CCEE
	b _0800CE02
_0800CCEE:
	cmp r4, 0x26
	bgt _0800CD00
	cmp r4, 0x10
	bne _0800CCF8
	b _0800CE20
_0800CCF8:
	b _0800CE3E
	.pool
_0800CD00:
	mov r0, r8
	cmp r0, 0x30
	beq _0800CD0E
	cmp r0, 0x3D
	bne _0800CD0C
	b _0800CE20
_0800CD0C:
	b _0800CE3E
_0800CD0E:
	cmp r6, 0
	beq _0800CD14
	b _0800CE42
_0800CD14:
	bl rfu_getSTWIRecvBuffer
	ldr r4, =gUnknown_03004140
	ldrb r0, [r0, 0x8]
	strh r0, [r4, 0x14]
	bl sub_800D358
	adds r2, r4, 0
	adds r2, 0x30
	ldrb r1, [r2]
	cmp r1, 0
	beq _0800CD6A
	ldrb r0, [r4, 0x14]
	adds r3, r1, 0
	bics r3, r0
	adds r0, r3, 0
	strb r0, [r2]
	movs r3, 0
	adds r7, r4, 0
	adds r1, r7, 0
	movs r5, 0x1
	adds r4, r1, 0
	adds r4, 0x34
	movs r2, 0
_0800CD44:
	ldrh r0, [r1, 0x14]
	asrs r0, r3
	ands r0, r5
	cmp r0, 0
	beq _0800CD54
	lsls r0, r3, 1
	adds r0, r4
	strh r2, [r0]
_0800CD54:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0800CD44
	ldr r1, =gUnknown_03004140
	ldrb r0, [r1, 0x6]
	cmp r0, 0
	bne _0800CD6A
	strb r0, [r1, 0x5]
	strb r0, [r1, 0x4]
_0800CD6A:
	mov r3, sp
	ldr r1, =gUnknown_03004140
	ldrb r2, [r1]
	ldrb r0, [r1, 0x14]
	ands r0, r2
	strb r0, [r3]
	movs r3, 0
	adds r7, r1, 0
	ldr r2, =gUnknown_03007890
	mov r1, sp
	movs r5, 0x1
	adds r4, r7, 0
_0800CD82:
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r5
	cmp r0, 0
	beq _0800CD96
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _0800CD96
	subs r0, 0x1
	strb r0, [r7, 0x1]
_0800CD96:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0800CD82
	ldrb r1, [r7, 0x14]
	ldrb r0, [r7]
	bics r0, r1
	strb r0, [r7]
	ldrb r1, [r7, 0x7]
	cmp r1, 0
	beq _0800CDE0
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _0800CDF2
	cmp r1, 0x8
	bne _0800CDCC
	ldrh r0, [r7, 0x1C]
	strh r0, [r7, 0x1A]
	movs r0, 0x6
	strb r0, [r7, 0x7]
	b _0800CDDE
	.pool
_0800CDCC:
	ldrb r0, [r7, 0x4]
	subs r0, 0x6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0800CDE0
	movs r0, 0x1
	strb r0, [r7, 0x7]
	movs r0, 0x5
_0800CDDE:
	strb r0, [r7, 0x4]
_0800CDE0:
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _0800CDF2
	ldrb r0, [r7, 0x4]
	cmp r0, 0
	bne _0800CDF2
	movs r0, 0xFF
	strb r0, [r7, 0x6]
_0800CDF2:
	ldrb r0, [r7, 0xE]
	cmp r0, 0
	bne _0800CE3E
	movs r0, 0x40
	movs r1, 0x1
	bl sub_800D30C
	b _0800CE3E
_0800CE02:
	bl sub_800D20C
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _0800CE3E
	movs r0, 0x50
	movs r1, 0
	bl sub_800D30C
	b _0800CE3E
	.pool
_0800CE20:
	cmp r6, 0
	bne _0800CE42
	ldr r0, =gUnknown_03004140
	strb r6, [r0, 0xD]
	strb r6, [r0, 0x1]
	strb r6, [r0]
	movs r1, 0xFF
	strb r1, [r0, 0x6]
	bl sub_800D610
	mov r4, r8
	cmp r4, 0x3D
	bne _0800CE3E
	bl sub_800BFA0
_0800CE3E:
	cmp r6, 0
	beq _0800CE92
_0800CE42:
	ldr r7, =gUnknown_03004140
	mov r0, r8
	cmp r0, 0x1C
	bne _0800CE74
	cmp r6, 0
	beq _0800CE74
	ldrb r0, [r7, 0x7]
	cmp r0, 0x4
	bne _0800CE74
	ldr r2, =gUnknown_03007890
	ldr r1, [r2]
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, [r2]
	movs r0, 0xF
	strb r0, [r1, 0x2]
	bl sub_800D334
	bl rfu_waitREQComplete
	b _0800CEA4
	.pool
_0800CE74:
	movs r1, 0
	mov r3, r8
	strh r3, [r7, 0x14]
	strh r6, [r7, 0x16]
	ldrb r0, [r7, 0xE]
	cmp r0, 0
	beq _0800CE86
	strb r1, [r7, 0x5]
	strb r1, [r7, 0x4]
_0800CE86:
	movs r0, 0xF0
	movs r1, 0x2
	bl sub_800D30C
	bl sub_800D610
_0800CE92:
	mov r4, r8
	cmp r4, 0xFF
	bne _0800CEA4
	movs r0, 0xF2
	movs r1, 0
	bl sub_800D30C
	bl sub_800D610
_0800CEA4:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_800C7B4

	thumb_func_start sub_800CEB0
sub_800CEB0: @ 800CEB0
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r4, =gUnknown_03004140
	ldrb r7, [r4, 0xE]
	movs r0, 0
	strb r0, [r4, 0xE]
	movs r0, 0x1
	strb r0, [r4, 0xF]
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r5, [r0]
	cmp r5, 0
	bne _0800CEEC
	adds r0, r6, 0
	bl sub_800C36C
	ldrb r0, [r4, 0x2]
	cmp r0, 0x1
	beq _0800CF04
	bl sub_800D610
	strb r5, [r4, 0xF]
	strb r7, [r4, 0xE]
	b _0800CF28
	.pool
_0800CEEC:
	mov r0, sp
	bl rfu_UNI_PARENT_getDRAC_ACK
	lsls r0, 16
	cmp r0, 0
	bne _0800CF04
	mov r1, sp
	ldrb r0, [r4, 0x3]
	ldrb r1, [r1]
	orrs r0, r1
	ldrb r1, [r4, 0x3]
	strb r0, [r4, 0x3]
_0800CF04:
	ldr r4, =gUnknown_03004140
	ldr r1, [r4, 0x44]
	cmp r1, 0
	beq _0800CF20
	adds r0, r6, 0
	bl _call_via_r1
	bl rfu_waitREQComplete
	ldrb r0, [r4, 0x2]
	cmp r0, 0x2
	bne _0800CF20
	bl sub_800D610
_0800CF20:
	ldr r1, =gUnknown_03004140
	movs r0, 0
	strb r0, [r1, 0xF]
	strb r7, [r1, 0xE]
_0800CF28:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800CEB0

	thumb_func_start sub_800CF34
sub_800CF34: @ 800CF34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r1, =gUnknown_03004140
	ldrb r0, [r1, 0x4]
	subs r0, 0x5
	lsls r0, 24
	lsrs r0, 24
	adds r3, r1, 0
	cmp r0, 0x3
	bls _0800CF52
	b _0800D146
_0800CF52:
	ldr r0, =gUnknown_03007890
	ldr r2, [r0]
	ldrb r1, [r2, 0x2]
	ldrb r0, [r3, 0xC]
	adds r4, r1, 0
	eors r4, r0
	ands r4, r1
	ldrb r0, [r2, 0x7]
	bics r4, r0
	mov r8, r4
	strb r1, [r3, 0xC]
	cmp r4, 0
	beq _0800CF7A
	strh r4, [r3, 0x14]
	movs r0, 0x10
	movs r1, 0x1
	str r3, [sp, 0x4]
	bl sub_800D30C
	ldr r3, [sp, 0x4]
_0800CF7A:
	movs r0, 0
	str r0, [sp]
	movs r6, 0
	adds r7, r3, 0
	movs r1, 0x24
	adds r1, r3
	mov r9, r1
_0800CF88:
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r6
	lsrs r4, r0, 24
	movs r5, 0
	mov r0, r8
	ands r0, r4
	cmp r0, 0
	beq _0800CFDA
	lsls r1, r6, 1
	adds r0, r7, 0
	adds r0, 0x28
	adds r1, r0
	ldrh r0, [r7, 0x26]
	strh r0, [r1]
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	orrs r0, r1
	strb r0, [r2]
	adds r6, 0x1
	mov r10, r6
	b _0800D090
	.pool
_0800CFC0:
	ldrb r1, [r7]
	adds r0, r4, 0
	orrs r0, r1
	strb r0, [r7]
	ldrb r0, [r7, 0x1]
	adds r0, 0x1
	strb r0, [r7, 0x1]
	ldr r0, [sp]
	orrs r0, r4
	str r0, [sp]
	movs r0, 0x1
	orrs r5, r0
	b _0800D024
_0800CFDA:
	mov r1, r9
	ldrb r0, [r1]
	ands r0, r4
	adds r2, r6, 0x1
	mov r10, r2
	cmp r0, 0
	beq _0800D090
	ldr r0, =gUnknown_03007880
	lsls r1, r6, 2
	adds r1, r0
	ldr r1, [r1]
	ldrh r0, [r1, 0x34]
	cmp r0, 0x46
	bne _0800D040
	adds r0, r1, 0
	adds r0, 0x61
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800D058
	movs r5, 0x2
	ldr r3, [r3, 0x20]
	ldrh r2, [r3]
	ldr r0, =0x0000ffff
	cmp r2, r0
	beq _0800D024
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	lsls r1, r6, 5
	adds r0, r1
	ldrh r0, [r0, 0x18]
	ldr r1, =0x0000ffff
_0800D018:
	cmp r0, r2
	beq _0800CFC0
	adds r3, 0x2
	ldrh r2, [r3]
	cmp r2, r1
	bne _0800D018
_0800D024:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	bne _0800D058
	movs r0, 0x4
	orrs r5, r0
	b _0800D058
	.pool
_0800D040:
	lsls r1, r6, 1
	adds r0, r3, 0
	adds r0, 0x28
	adds r1, r0
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	ldr r1, =0x0000ffff
	ands r0, r1
	cmp r0, 0
	bne _0800D058
	movs r5, 0x6
_0800D058:
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	beq _0800D07E
	mov r2, r9
	ldrb r0, [r2]
	bics r0, r4
	movs r2, 0
	mov r1, r9
	strb r0, [r1]
	lsls r0, r6, 1
	adds r1, r7, 0
	adds r1, 0x28
	adds r0, r1
	strh r2, [r0]
	movs r0, 0x8
	adds r1, r6, 0
	bl rfu_clearSlot
_0800D07E:
	movs r0, 0x4
	ands r5, r0
	ldr r3, =gUnknown_03004140
	cmp r5, 0
	beq _0800D090
	ldrb r1, [r7, 0xD]
	adds r0, r4, 0
	orrs r0, r1
	strb r0, [r7, 0xD]
_0800D090:
	mov r2, r10
	lsls r0, r2, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bhi _0800D09C
	b _0800CF88
_0800D09C:
	ldr r4, [sp]
	cmp r4, 0
	beq _0800D0AE
	ldr r0, =gUnknown_03004140
	strh r4, [r0, 0x14]
	movs r0, 0x11
	movs r1, 0x1
	bl sub_800D30C
_0800D0AE:
	ldr r1, =gUnknown_03004140
	ldrb r0, [r1, 0xD]
	cmp r0, 0
	beq _0800D0EA
	movs r5, 0x1
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	beq _0800D0CE
	ldrb r0, [r1, 0x3]
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, r1
	beq _0800D0CE
	movs r5, 0
_0800D0CE:
	cmp r5, 0
	beq _0800D0EA
	ldr r4, =gUnknown_03004140
	ldrb r0, [r4, 0xD]
	bl sub_800D334
	ldrb r0, [r4, 0xD]
	movs r1, 0
	strh r0, [r4, 0x14]
	strb r1, [r4, 0xD]
	movs r0, 0x12
	movs r1, 0x1
	bl sub_800D30C
_0800D0EA:
	ldr r0, =gUnknown_03004140
	adds r1, r0, 0
	adds r1, 0x24
	ldrb r1, [r1]
	adds r3, r0, 0
	cmp r1, 0
	bne _0800D146
	ldrb r0, [r3, 0x4]
	cmp r0, 0x8
	bne _0800D146
	ldrb r0, [r3, 0x7]
	cmp r0, 0
	bne _0800D120
	strb r0, [r3, 0x5]
	strb r0, [r3, 0x4]
	movs r0, 0x14
	movs r1, 0
	bl sub_800D30C
	b _0800D146
	.pool
_0800D120:
	cmp r0, 0x2
	bne _0800D12C
	movs r0, 0x3
	strb r0, [r3, 0x7]
	movs r0, 0x9
	b _0800D132
_0800D12C:
	movs r0, 0x1
	strb r0, [r3, 0x7]
	movs r0, 0x5
_0800D132:
	strb r0, [r3, 0x4]
	ldrb r0, [r3]
	cmp r0, 0
	beq _0800D146
	movs r0, 0
	strh r0, [r3, 0x1A]
	movs r0, 0x8
	strb r0, [r3, 0x7]
	movs r0, 0x5
	strb r0, [r3, 0x4]
_0800D146:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_800CF34

	thumb_func_start sub_800D158
sub_800D158: @ 800D158
	push {r4-r6,lr}
	ldr r1, =0x04000208
	ldrh r0, [r1]
	adds r6, r0, 0
	movs r0, 0
	strh r0, [r1]
	ldr r4, =gUnknown_03004140
	ldrb r0, [r4, 0x4]
	cmp r0, 0xF
	bne _0800D1BC
	ldrb r1, [r4, 0x10]
	lsls r1, 1
	adds r5, r4, 0
	adds r5, 0x28
	adds r1, r5
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _0800D192
	ldr r1, =gUnknown_03007880
	ldrb r0, [r4, 0x10]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x27
	bne _0800D1BC
_0800D192:
	bl sub_800D630
	movs r0, 0x18
	strb r0, [r4, 0x4]
	ldrb r1, [r4, 0x10]
	movs r0, 0x4
	bl rfu_clearSlot
	adds r2, r4, 0
	adds r2, 0x24
	movs r1, 0x1
	ldrb r0, [r4, 0x10]
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	ldrb r0, [r4, 0x10]
	lsls r0, 1
	adds r0, r5
	movs r1, 0
	strh r1, [r0]
_0800D1BC:
	ldr r0, =0x04000208
	strh r6, [r0]
	ldr r5, =gUnknown_03004140
	ldrb r0, [r5, 0x4]
	cmp r0, 0x18
	bne _0800D1F6
	ldrb r0, [r5, 0x2]
	cmp r0, 0x1
	bne _0800D1D2
	bl sub_800D630
_0800D1D2:
	ldrb r0, [r5, 0x2]
	adds r4, r0, 0
	cmp r4, 0
	bne _0800D1F6
	strb r4, [r5, 0x5]
	strb r4, [r5, 0x4]
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
	ldrb r0, [r0, 0x3]
	orrs r0, r1
	bl sub_800D334
	strh r4, [r5, 0x14]
	movs r0, 0x25
	movs r1, 0x1
	bl sub_800D30C
_0800D1F6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800D158

	thumb_func_start sub_800D20C
sub_800D20C: @ 800D20C
	push {r4,r5,lr}
	ldr r5, =gUnknown_03004140
	ldrb r0, [r5, 0x4]
	cmp r0, 0xF
	bne _0800D258
	ldr r1, =gUnknown_03007880
	ldrb r2, [r5, 0x10]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x26
	bne _0800D258
	movs r4, 0
	strb r4, [r5, 0x5]
	strb r4, [r5, 0x4]
	movs r0, 0x4
	adds r1, r2, 0
	bl rfu_clearSlot
	adds r2, r5, 0
	adds r2, 0x24
	movs r1, 0x1
	ldrb r0, [r5, 0x10]
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	ldrb r0, [r5, 0x10]
	lsls r0, 1
	adds r1, r5, 0
	adds r1, 0x28
	adds r0, r1
	strh r4, [r0]
	movs r0, 0x24
	movs r1, 0
	bl sub_800D30C
_0800D258:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800D20C

	thumb_func_start sub_800D268
sub_800D268: @ 800D268
	push {lr}
	ldr r1, =gUnknown_03004140
	ldrb r0, [r1, 0x6]
	cmp r0, 0
	bne _0800D28C
	ldrb r0, [r1, 0xA]
	cmp r0, 0x1
	bne _0800D28C
	ldrb r0, [r1, 0x4]
	strb r0, [r1, 0x11]
	ldrb r0, [r1, 0x5]
	strb r0, [r1, 0x12]
	movs r0, 0x10
	strb r0, [r1, 0x4]
	movs r0, 0x11
	strb r0, [r1, 0x5]
	movs r0, 0x2
	strb r0, [r1, 0xA]
_0800D28C:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800D268

	thumb_func_start sub_800D294
sub_800D294: @ 800D294
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r6, 0
	movs r5, 0
	ldr r1, =gUnknown_03007890
	ldr r0, [r1]
	ldrb r0, [r0, 0x8]
	cmp r6, r0
	bcs _0800D2F0
	mov r8, r0
	ldr r0, =gUnknown_03004140
	mov r10, r0
	mov r9, r1
_0800D2B4:
	mov r1, r10
	ldr r3, [r1, 0x20]
	ldrh r2, [r3]
	adds r0, r5, 0x1
	mov r12, r0
	ldr r1, =0x0000ffff
	cmp r2, r1
	beq _0800D2E6
	mov r1, r9
	ldr r0, [r1]
	lsls r1, r5, 5
	adds r0, r1
	ldrh r4, [r0, 0x18]
	ldr r7, =0x0000ffff
	movs r1, 0x1
	lsls r1, r5
_0800D2D4:
	cmp r4, r2
	bne _0800D2DE
	orrs r6, r1
	lsls r0, r6, 24
	lsrs r6, r0, 24
_0800D2DE:
	adds r3, 0x2
	ldrh r2, [r3]
	cmp r2, r7
	bne _0800D2D4
_0800D2E6:
	mov r1, r12
	lsls r0, r1, 24
	lsrs r5, r0, 24
	cmp r5, r8
	bcc _0800D2B4
_0800D2F0:
	adds r0, r6, 0
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800D294

	thumb_func_start sub_800D30C
sub_800D30C: @ 800D30C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r4, =gUnknown_03004140
	ldr r2, [r4, 0x40]
	cmp r2, 0
	beq _0800D322
	bl _call_via_r2
_0800D322:
	movs r0, 0
	strh r0, [r4, 0x16]
	strh r0, [r4, 0x14]
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800D30C

	thumb_func_start sub_800D334
sub_800D334: @ 800D334
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, =gUnknown_03004140
	ldrb r5, [r4, 0xE]
	movs r1, 0x1
	strb r1, [r4, 0xE]
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	strb r5, [r4, 0xE]
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800D334

	thumb_func_start sub_800D358
sub_800D358: @ 800D358
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _0800D3A0
	movs r4, 0
_0800D36A:
	ldr r1, =gUnknown_03007880
	lsls r0, r4, 2
	adds r0, r1
	ldr r2, [r0]
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0800D396
	ldrb r1, [r2, 0x1A]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _0800D396
	adds r2, r1, 0
	bics r2, r5
	movs r0, 0x20
	adds r1, r4, 0
	bl rfu_changeSendTarget
_0800D396:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0800D36A
_0800D3A0:
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	cmp r0, 0
	beq _0800D3DE
	movs r4, 0
_0800D3AC:
	ldr r1, =gUnknown_03007880
	lsls r0, r4, 2
	adds r0, r1
	ldr r2, [r0]
	ldrh r0, [r2, 0x34]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0800D3D4
	adds r0, r2, 0
	adds r0, 0x4E
	ldrb r0, [r0]
	ands r0, r5
	cmp r0, 0
	beq _0800D3D4
	adds r0, r4, 0
	bl rfu_NI_stopReceivingData
_0800D3D4:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0800D3AC
_0800D3DE:
	ldr r0, =gUnknown_03007890
	ldr r3, [r0]
	ldrb r2, [r3, 0x6]
	cmp r2, 0
	beq _0800D41C
	mvns r1, r5
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3, 0x6]
	movs r4, 0
	ldr r7, =gUnknown_03007870
	ldr r6, =0x00008024
_0800D3F6:
	lsls r0, r4, 2
	adds r0, r7
	ldr r2, [r0]
	ldrh r0, [r2]
	cmp r0, r6
	bne _0800D412
	ldrb r3, [r2, 0x3]
	adds r0, r5, 0
	ands r0, r3
	cmp r0, 0
	beq _0800D412
	adds r0, r1, 0
	ands r0, r3
	strb r0, [r2, 0x3]
_0800D412:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0800D3F6
_0800D41C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800D358

	thumb_func_start sub_800D434
sub_800D434: @ 800D434
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, =gUnknown_03004140
	ldrh r0, [r0, 0x18]
	cmp r0, 0
	beq _0800D510
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _0800D4D4
	movs r6, 0
_0800D454:
	ldr r3, =gUnknown_03007880
	lsls r2, r6, 2
	adds r0, r2, r3
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r4, 0x80
	lsls r4, 8
	adds r0, r4, 0
	ands r1, r0
	adds r7, r2, 0
	adds r0, r6, 0x1
	mov r9, r0
	cmp r1, 0
	beq _0800D4CA
	movs r5, 0
	movs r4, 0
	movs r1, 0x1
	mov r8, r1
	mov r10, r3
_0800D47A:
	adds r0, r7, r3
	ldr r0, [r0]
	ldrb r0, [r0, 0x1A]
	asrs r0, r4
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _0800D4A4
	lsls r0, r4, 2
	adds r0, r3
	ldr r0, [r0]
	ldr r1, =gUnknown_03004140
	ldrh r0, [r0, 0x2]
	ldrh r1, [r1, 0x18]
	cmp r0, r1
	bls _0800D4A4
	mov r0, r8
	lsls r0, r4
	orrs r5, r0
	lsls r0, r5, 24
	lsrs r5, r0, 24
_0800D4A4:
	cmp r5, 0
	beq _0800D4C0
	mov r1, r10
	adds r0, r7, r1
	ldr r0, [r0]
	ldrb r0, [r0, 0x1A]
	adds r2, r5, 0
	eors r2, r0
	movs r0, 0x20
	adds r1, r6, 0
	str r3, [sp]
	bl rfu_changeSendTarget
	ldr r3, [sp]
_0800D4C0:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0800D47A
_0800D4CA:
	mov r3, r9
	lsls r0, r3, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _0800D454
_0800D4D4:
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	cmp r0, 0
	beq _0800D510
	movs r6, 0
_0800D4E0:
	ldr r1, =gUnknown_03007880
	lsls r0, r6, 2
	adds r0, r1
	ldr r2, [r0]
	ldrh r0, [r2, 0x34]
	movs r4, 0x80
	lsls r4, 8
	adds r1, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0800D506
	ldr r1, =gUnknown_03004140
	ldrh r0, [r2, 0x36]
	ldrh r1, [r1, 0x18]
	cmp r0, r1
	bls _0800D506
	adds r0, r6, 0
	bl rfu_NI_stopReceivingData
_0800D506:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _0800D4E0
_0800D510:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800D434

	thumb_func_start sub_800D52C
sub_800D52C: @ 800D52C
	push {lr}
	ldr r1, =gUnknown_03004140
	str r0, [r1, 0x44]
	ldr r0, =sub_800CEB0
	bl rfu_setMSCCallback
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800D52C

	thumb_func_start sub_800D544
sub_800D544: @ 800D544
	ldr r1, =gUnknown_03004140
	str r0, [r1, 0x40]
	bx lr
	.pool
	thumb_func_end sub_800D544

	thumb_func_start sub_800D550
sub_800D550: @ 800D550
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r0, =gUnknown_03004140
	ldrb r1, [r0, 0x9]
	adds r3, r0, 0
	cmp r1, 0
	beq _0800D578
	cmp r4, 0
	bne _0800D578
	adds r0, 0x30
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800D578
	movs r0, 0x5
	b _0800D588
	.pool
_0800D578:
	ldr r2, =0x04000208
	ldrh r1, [r2]
	movs r0, 0
	strh r0, [r2]
	strb r4, [r3, 0x9]
	strh r5, [r3, 0x32]
	strh r1, [r2]
	movs r0, 0
_0800D588:
	pop {r4,r5}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800D550

	thumb_func_start sub_800D594
sub_800D594: @ 800D594
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r1, [r0, 0x4]
	ldrb r0, [r0, 0x5]
	orrs r0, r1
	cmp r0, 0
	bne _0800D5B8
	ldr r0, =gUnknown_03004140
	strh r2, [r0, 0x18]
	movs r0, 0
	b _0800D5C8
	.pool
_0800D5B8:
	ldr r1, =gUnknown_03004140
	movs r0, 0x6
	strh r0, [r1, 0x14]
	movs r0, 0xF3
	movs r1, 0x1
	bl sub_800D30C
	movs r0, 0x6
_0800D5C8:
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800D594

	thumb_func_start sub_800D5D0
sub_800D5D0: @ 800D5D0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	ldr r1, =gUnknown_03004140
	ldrb r0, [r1, 0x4]
	subs r0, 0x9
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _0800D5FC
	movs r0, 0x7
	strh r0, [r1, 0x14]
	movs r0, 0xF3
	movs r1, 0x1
	bl sub_800D30C
	movs r0, 0x7
	b _0800D60A
	.pool
_0800D5FC:
	cmp r2, 0
	beq _0800D606
	movs r0, 0x1
	strb r0, [r1, 0xB]
	b _0800D608
_0800D606:
	strb r3, [r1, 0xB]
_0800D608:
	movs r0, 0
_0800D60A:
	pop {r1}
	bx r1
	thumb_func_end sub_800D5D0

	thumb_func_start sub_800D610
sub_800D610: @ 800D610
	push {lr}
	ldr r1, =gUnknown_03004140
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	beq _0800D628
	ldrb r0, [r1, 0x2]
	movs r0, 0
	strb r0, [r1, 0x2]
	movs r0, 0x45
	movs r1, 0
	bl sub_800D30C
_0800D628:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800D610

	thumb_func_start sub_800D630
sub_800D630: @ 800D630
	push {lr}
	ldr r1, =gUnknown_03004140
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	bne _0800D648
	movs r0, 0x45
	movs r1, 0
	bl sub_800D30C
	b _0800D654
	.pool
_0800D648:
	ldrb r0, [r1, 0x2]
	cmp r0, 0x1
	bne _0800D654
	ldrb r0, [r1, 0x2]
	movs r0, 0x2
	strb r0, [r1, 0x2]
_0800D654:
	pop {r0}
	bx r0
	thumb_func_end sub_800D630

	thumb_func_start sub_800D658
sub_800D658: @ 800D658
	push {lr}
	ldr r0, =gUnknown_03004140
	ldrb r1, [r0, 0x7]
	adds r2, r0, 0
	cmp r1, 0
	beq _0800D6C2
	ldrb r0, [r2, 0x4]
	subs r0, 0x5
	cmp r0, 0x6
	bhi _0800D6C2
	lsls r0, 2
	ldr r1, =_0800D680
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0800D680:
	.4byte _0800D69C
	.4byte _0800D6A4
	.4byte _0800D6AE
	.4byte _0800D6AE
	.4byte _0800D6B4
	.4byte _0800D6B4
	.4byte _0800D6BA
_0800D69C:
	movs r0, 0x3
	strb r0, [r2, 0x7]
	movs r0, 0x9
	b _0800D6C0
_0800D6A4:
	movs r0, 0x2
	strb r0, [r2, 0x7]
	movs r0, 0x1
	strh r0, [r2, 0x1A]
	b _0800D6C2
_0800D6AE:
	movs r0, 0x2
	strb r0, [r2, 0x7]
	b _0800D6C2
_0800D6B4:
	movs r0, 0x28
	strh r0, [r2, 0x1A]
	b _0800D6C2
_0800D6BA:
	movs r0, 0x28
	strh r0, [r2, 0x1A]
	movs r0, 0xA
_0800D6C0:
	strb r0, [r2, 0x4]
_0800D6C2:
	pop {r0}
	bx r0
	thumb_func_end sub_800D658

	thumb_func_start sub_800D6C8
sub_800D6C8: @ 800D6C8
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r0, 0
	movs r4, 0
	movs r5, 0x46
_0800D6D2:
	adds r2, r0, 0x1
	movs r1, 0x45
	muls r0, r5
	adds r0, r3
	adds r0, 0x45
_0800D6DC:
	strb r4, [r0]
	subs r0, 0x1
	subs r1, 0x1
	cmp r1, 0
	bge _0800D6DC
	adds r0, r2, 0
	cmp r0, 0x1F
	ble _0800D6D2
	movs r1, 0
	ldr r2, =0x000008c1
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	movs r2, 0x8C
	lsls r2, 4
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r2, =0x000008c2
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r2, =0x000008c3
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800D6C8

	thumb_func_start sub_800D724
sub_800D724: @ 800D724
	push {r4,lr}
	adds r3, r0, 0
	movs r1, 0
	movs r4, 0
_0800D72C:
	lsls r0, r1, 3
	adds r2, r1, 0x1
	subs r0, r1
	movs r1, 0xD
	lsls r0, 1
	adds r0, r3
	adds r0, 0xD
_0800D73A:
	strb r4, [r0]
	subs r0, 0x1
	subs r1, 0x1
	cmp r1, 0
	bge _0800D73A
	adds r1, r2, 0
	cmp r1, 0x27
	ble _0800D72C
	movs r1, 0
	ldr r2, =0x00000231
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	movs r2, 0x8C
	lsls r2, 2
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r2, =0x00000232
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r2, =0x00000233
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800D724

	thumb_func_start sub_800D780
sub_800D780: @ 800D780
	push {r4,lr}
	adds r3, r0, 0
	movs r1, 0
	movs r4, 0
_0800D788:
	lsls r0, r1, 8
	adds r2, r1, 0x1
	movs r1, 0xFF
	adds r0, r3
	adds r0, 0xFF
_0800D792:
	strb r4, [r0]
	subs r0, 0x1
	subs r1, 0x1
	cmp r1, 0
	bge _0800D792
	adds r1, r2, 0
	cmp r1, 0x1
	ble _0800D788
	movs r1, 0
	ldr r2, =0x00000201
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	movs r2, 0x80
	lsls r2, 2
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r2, =0x00000202
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r2, =0x00000203
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800D780

	thumb_func_start sub_800D7D8
sub_800D7D8: @ 800D7D8
	push {r4-r7,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	ldr r1, =0x000008c2
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0x1F
	bhi _0800D874
	ldr r0, =0x04000208
	ldrh r1, [r0]
	adds r7, r1, 0
	movs r1, 0
	strh r1, [r0]
	movs r5, 0
	movs r2, 0
_0800D7F6:
	adds r1, r4, r2
	ldrb r0, [r1]
	cmp r0, 0
	bne _0800D80A
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _0800D80A
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0800D80A:
	adds r2, 0xE
	cmp r2, 0x45
	ble _0800D7F6
	cmp r5, 0x5
	beq _0800D866
	movs r2, 0
	movs r0, 0x8C
	lsls r0, 4
	adds r5, r3, r0
	movs r6, 0x46
_0800D81E:
	ldrb r0, [r5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r2, r1
	adds r1, r3, r1
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1
	cmp r2, 0x45
	ble _0800D81E
	movs r0, 0x8C
	lsls r0, 4
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	ldrb r2, [r1]
	movs r0, 0x1F
	ands r0, r2
	ldrb r2, [r1]
	strb r0, [r1]
	ldr r0, =0x000008c2
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r1, 0
	adds r0, r4, 0
	adds r0, 0x45
_0800D85E:
	strb r1, [r0]
	subs r0, 0x1
	cmp r0, r4
	bge _0800D85E
_0800D866:
	ldr r0, =0x04000208
	strh r7, [r0]
	b _0800D87E
	.pool
_0800D874:
	ldr r1, =0x000008c3
	adds r0, r3, r1
	ldrb r1, [r0]
	movs r1, 0x1
	strb r1, [r0]
_0800D87E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800D7D8

	thumb_func_start sub_800D888
sub_800D888: @ 800D888
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	ldr r1, =0x00000232
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, 0x27
	bhi _0800D920
	ldr r1, =0x04000208
	ldrh r0, [r1]
	adds r7, r0, 0
	movs r0, 0
	strh r0, [r1]
	movs r2, 0
	ldrb r0, [r5]
	cmp r0, 0
	bne _0800D8B8
_0800D8AA:
	adds r2, 0x1
	cmp r2, 0xD
	bgt _0800D8B8
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800D8AA
_0800D8B8:
	cmp r2, 0xE
	beq _0800D910
	movs r2, 0
	movs r0, 0x8C
	lsls r0, 2
	adds r3, r6, r0
_0800D8C4:
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, r2, r0
	adds r0, r6, r0
	adds r1, r5, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0xD
	ble _0800D8C4
	movs r1, 0x8C
	lsls r1, 2
	adds r4, r6, r1
	ldrb r0, [r4]
	adds r0, 0x1
	ldrb r1, [r4]
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, 0x28
	bl __umodsi3
	ldrb r1, [r4]
	strb r0, [r4]
	ldr r0, =0x00000232
	adds r1, r6, r0
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r1, 0
	adds r0, r5, 0
	adds r0, 0xD
_0800D908:
	strb r1, [r0]
	subs r0, 0x1
	cmp r0, r5
	bge _0800D908
_0800D910:
	ldr r0, =0x04000208
	strh r7, [r0]
	b _0800D92A
	.pool
_0800D920:
	ldr r1, =0x00000233
	adds r0, r6, r1
	ldrb r1, [r0]
	movs r1, 0x1
	strb r1, [r0]
_0800D92A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800D888

	thumb_func_start sub_800D934
sub_800D934: @ 800D934
	push {r4-r7,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	ldr r1, =0x04000208
	ldrh r0, [r1]
	mov r12, r0
	movs r0, 0
	strh r0, [r1]
	movs r1, 0x8C
	lsls r1, 4
	adds r0, r3, r1
	ldr r7, =0x000008c1
	adds r5, r3, r7
	ldrb r1, [r0]
	ldrb r0, [r5]
	cmp r1, r0
	beq _0800D960
	ldr r1, =0x000008c3
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800D984
_0800D960:
	movs r1, 0
	adds r0, r4, 0
	adds r0, 0x45
_0800D966:
	strb r1, [r0]
	subs r0, 0x1
	cmp r0, r4
	bge _0800D966
	ldr r0, =0x04000208
	mov r7, r12
	strh r7, [r0]
	movs r0, 0
	b _0800D9CA
	.pool
_0800D984:
	movs r2, 0
	movs r6, 0x46
_0800D988:
	adds r1, r4, r2
	ldrb r0, [r5]
	adds r7, r0, 0
	muls r7, r6
	adds r0, r7, 0
	adds r0, r2, r0
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1
	cmp r2, 0x45
	ble _0800D988
	ldr r0, =0x000008c1
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	ldrb r2, [r1]
	movs r0, 0x1F
	ands r0, r2
	ldrb r2, [r1]
	strb r0, [r1]
	ldr r7, =0x000008c2
	adds r1, r3, r7
	ldrb r0, [r1]
	subs r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	ldr r0, =0x04000208
	mov r1, r12
	strh r1, [r0]
	movs r0, 0x1
_0800D9CA:
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800D934

	thumb_func_start sub_800D9DC
sub_800D9DC: @ 800D9DC
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	movs r1, 0x8C
	lsls r1, 2
	adds r0, r5, r1
	adds r1, 0x1
	adds r4, r5, r1
	ldrb r1, [r0]
	ldrb r0, [r4]
	cmp r1, r0
	beq _0800DA00
	ldr r1, =0x00000233
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r2, r0, 0
	cmp r2, 0
	beq _0800DA08
_0800DA00:
	movs r0, 0
	b _0800DA54
	.pool
_0800DA08:
	ldr r1, =0x04000208
	ldrh r0, [r1]
	adds r7, r0, 0
	strh r2, [r1]
	movs r3, 0
_0800DA12:
	adds r2, r6, r3
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, r3, r0
	adds r0, r5, r0
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, 0x1
	cmp r3, 0xD
	ble _0800DA12
	ldr r0, =0x00000231
	adds r4, r5, r0
	ldrb r0, [r4]
	adds r0, 0x1
	ldrb r1, [r4]
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, 0x28
	bl __umodsi3
	ldrb r1, [r4]
	strb r0, [r4]
	ldr r0, =0x00000232
	adds r1, r5, r0
	ldrb r0, [r1]
	subs r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	ldr r0, =0x04000208
	strh r7, [r0]
	movs r0, 0x1
_0800DA54:
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800D9DC

	thumb_func_start sub_800DA68
sub_800DA68: @ 800DA68
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _0800DA7E
	adds r0, r2, 0
	movs r1, 0
	bl sub_800DAC8
	b _0800DAC0
_0800DA7E:
	movs r3, 0
_0800DA80:
	ldrb r1, [r2, 0x1C]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, r3, r0
	adds r0, r2, r0
	adds r1, r4, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, 0xD
	ble _0800DA80
	ldrb r0, [r2, 0x1C]
	adds r0, 0x1
	ldrb r1, [r2, 0x1C]
	strb r0, [r2, 0x1C]
	ldrb r1, [r2, 0x1C]
	movs r0, 0x1
	ands r0, r1
	ldrb r1, [r2, 0x1C]
	strb r0, [r2, 0x1C]
	ldrb r0, [r2, 0x1E]
	cmp r0, 0x1
	bhi _0800DABA
	ldrb r0, [r2, 0x1E]
	adds r0, 0x1
	ldrb r1, [r2, 0x1E]
	strb r0, [r2, 0x1E]
	b _0800DAC0
_0800DABA:
	ldrb r0, [r2, 0x1C]
	ldrb r1, [r2, 0x1D]
	strb r0, [r2, 0x1D]
_0800DAC0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_800DA68

	thumb_func_start sub_800DAC8
sub_800DAC8: @ 800DAC8
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	ldrb r0, [r3, 0x1E]
	cmp r0, 0
	bne _0800DAD8
	movs r0, 0
	b _0800DB12
_0800DAD8:
	cmp r5, 0
	beq _0800DAF6
	movs r4, 0
_0800DADE:
	adds r2, r5, r4
	ldrb r1, [r3, 0x1D]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, r4, r0
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r2]
	adds r4, 0x1
	cmp r4, 0xD
	ble _0800DADE
_0800DAF6:
	ldrb r0, [r3, 0x1D]
	adds r0, 0x1
	ldrb r1, [r3, 0x1D]
	strb r0, [r3, 0x1D]
	ldrb r1, [r3, 0x1D]
	movs r0, 0x1
	ands r0, r1
	ldrb r1, [r3, 0x1D]
	strb r0, [r3, 0x1D]
	ldrb r0, [r3, 0x1E]
	subs r0, 0x1
	ldrb r1, [r3, 0x1E]
	strb r0, [r3, 0x1E]
	movs r0, 0x1
_0800DB12:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_800DAC8

	thumb_func_start sub_800DB18
sub_800DB18: @ 800DB18
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	ldr r1, =0x00000202
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bhi _0800DB70
	movs r2, 0
	movs r0, 0x80
	lsls r0, 2
	adds r4, r3, r0
_0800DB30:
	ldrb r0, [r4]
	lsls r0, 8
	adds r0, r2, r0
	adds r0, r3, r0
	adds r1, r5, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0xFF
	ble _0800DB30
	movs r0, 0x80
	lsls r0, 2
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	ldrb r2, [r1]
	movs r0, 0x1
	ands r0, r2
	ldrb r2, [r1]
	strb r0, [r1]
	ldr r0, =0x00000202
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	b _0800DB7A
	.pool
_0800DB70:
	ldr r1, =0x00000203
	adds r0, r3, r1
	ldrb r1, [r0]
	movs r1, 0x1
	strb r1, [r0]
_0800DB7A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800DB18

	thumb_func_start sub_800DB84
sub_800DB84: @ 800DB84
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	movs r1, 0x80
	lsls r1, 2
	adds r0, r3, r1
	adds r1, 0x1
	adds r4, r3, r1
	ldrb r1, [r0]
	ldrb r0, [r4]
	cmp r1, r0
	beq _0800DBA6
	ldr r1, =0x00000203
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800DBB0
_0800DBA6:
	movs r0, 0
	b _0800DBEA
	.pool
_0800DBB0:
	movs r2, 0
_0800DBB2:
	adds r0, r5, r2
	ldrb r1, [r4]
	lsls r1, 8
	adds r1, r2, r1
	adds r1, r3, r1
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0xFF
	ble _0800DBB2
	ldr r0, =0x00000201
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	ldrb r2, [r1]
	movs r0, 0x1
	ands r0, r2
	ldrb r2, [r1]
	strb r0, [r1]
	ldr r0, =0x00000202
	adds r1, r3, r0
	ldrb r0, [r1]
	subs r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, 0x1
_0800DBEA:
	pop {r4,r5}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800DB84

	thumb_func_start sub_800DBF8
sub_800DBF8: @ 800DBF8
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r1, 0
	movs r5, 0
	cmp r1, 0x1
	beq _0800DC36
	cmp r1, 0x1
	bgt _0800DC12
	cmp r1, 0
	beq _0800DC1C
	b _0800DCAA
_0800DC12:
	cmp r0, 0x2
	beq _0800DC56
	cmp r0, 0x3
	beq _0800DC76
	b _0800DCAA
_0800DC1C:
	movs r4, 0
_0800DC1E:
	adds r0, r6, r4
	adds r1, r4, 0x1
	strb r1, [r0]
	lsls r0, r5, 16
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, r1, 0
	cmp r4, 0xC7
	ble _0800DC1E
	b _0800DC70
_0800DC36:
	movs r4, 0
	adds r2, r6, 0
	adds r2, 0xC8
_0800DC3C:
	adds r0, r6, r4
	adds r1, r4, 0x1
	strb r1, [r0]
	lsls r0, r5, 16
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, r1, 0
	cmp r4, 0x63
	ble _0800DC3C
	strh r5, [r2]
	b _0800DCAA
_0800DC56:
	movs r4, 0
_0800DC58:
	bl Random
	lsls r0, 24
	lsrs r0, 24
	adds r1, r6, r4
	strb r0, [r1]
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, 0x1
	cmp r4, 0xC7
	ble _0800DC58
_0800DC70:
	adds r0, r6, r4
	strh r5, [r0]
	b _0800DCAA
_0800DC76:
	movs r4, 0
	ldr r3, =gUnknown_03000D74
	ldrb r1, [r3]
	ldrb r0, [r3]
	adds r7, r0, 0x1
	adds r2, r1, 0x1
	movs r0, 0xFF
	mov r12, r0
_0800DC86:
	adds r0, r6, r4
	adds r1, r4, 0x1
	strb r2, [r0]
	adds r0, r4, r7
	mov r4, r12
	ands r0, r4
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	adds r2, 0x1
	adds r4, r1, 0
	cmp r1, 0xC7
	ble _0800DC86
	adds r0, r6, r1
	strh r5, [r0]
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
_0800DCAA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800DBF8

	thumb_func_start sub_800DCB4
sub_800DCB4: @ 800DCB4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r3, 0
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _0800DCD8
	ldr r5, =gUnknown_082ED470
	adds r2, r1, 0
_0800DCC4:
	adds r1, r4, r3
	ldrb r0, [r2]
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1
	adds r3, 0x1
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _0800DCC4
_0800DCD8:
	adds r1, r4, r3
	movs r0, 0
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800DCB4

	thumb_func_start sub_800DCE8
sub_800DCE8: @ 800DCE8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r3, 0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0800DD0C
	ldr r5, =gUnknown_082ED370
	adds r2, r1, 0
_0800DCF8:
	adds r1, r4, r3
	ldrb r0, [r2]
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1
	adds r3, 0x1
	ldrb r0, [r2]
	cmp r0, 0
	bne _0800DCF8
_0800DD0C:
	adds r1, r4, r3
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800DCE8

	thumb_func_start sub_800DD1C
sub_800DD1C: @ 800DD1C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r0, =gUnknown_03007890
	ldr r4, [r0]
	ldrb r2, [r4, 0x2]
	ldrb r1, [r4]
	adds r7, r0, 0
	cmp r1, 0x1
	bne _0800DD72
	movs r3, 0
	ands r1, r2
	cmp r1, 0
	beq _0800DD4E
	cmp r5, 0x1
	bne _0800DD48
	ldrb r0, [r4, 0xA]
	b _0800DD8C
	.pool
_0800DD48:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0800DD4E:
	lsrs r2, 1
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bhi _0800DD8A
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _0800DD4E
	adds r0, r6, 0x1
	cmp r5, r0
	bne _0800DD48
_0800DD68:
	ldr r0, [r7]
	adds r0, 0xA
	adds r0, r3
	ldrb r0, [r0]
	b _0800DD8C
_0800DD72:
	movs r3, 0
	movs r1, 0x1
_0800DD76:
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0800DD68
	lsrs r2, 1
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0800DD76
_0800DD8A:
	movs r0, 0
_0800DD8C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_800DD1C

	thumb_func_start sub_800DD94
sub_800DD94: @ 800DD94
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	movs r4, 0
	ldr r0, =gSaveBlock2Ptr
	mov r8, r0
	adds r6, r7, 0x2
	ldr r0, [r0]
	adds r5, r0, 0
	adds r5, 0xA
_0800DDB2:
	adds r0, r6, r4
	adds r1, r5, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x1
	ble _0800DDB2
	movs r4, 0
	lsls r2, 7
	mov r12, r2
	adds r1, r7, 0x4
_0800DDC8:
	adds r0, r1, r4
	strb r3, [r0]
	asrs r3, 8
	adds r4, 0x1
	cmp r4, 0x3
	ble _0800DDC8
	mov r1, r8
	ldr r0, [r1]
	ldrb r0, [r0, 0x8]
	movs r6, 0x1
	movs r1, 0x1
	ands r1, r0
	ldrb r2, [r7, 0xB]
	movs r5, 0x2
	negs r5, r5
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, 0xB]
	movs r4, 0x7F
	mov r1, r9
	ands r1, r4
	ldrb r2, [r7, 0xA]
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	ands r0, r4
	mov r1, r12
	orrs r0, r1
	strb r0, [r7, 0xA]
	ldrb r0, [r7]
	movs r1, 0x10
	negs r1, r1
	ands r1, r0
	movs r0, 0x2
	orrs r1, r0
	ldrb r2, [r7, 0x1]
	movs r0, 0x3D
	negs r0, r0
	ands r0, r2
	movs r2, 0xC
	orrs r0, r2
	strb r0, [r7, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r1, r0
	subs r0, 0x10
	ands r1, r0
	subs r0, 0x20
	ands r1, r0
	strb r1, [r7]
	ldr r0, =0x0000087f
	bl FlagGet
	lsls r0, 7
	ldrb r1, [r7]
	ands r4, r1
	orrs r4, r0
	strb r4, [r7]
	bl sub_809D42C
	ands r0, r6
	ldrb r1, [r7, 0x1]
	ands r5, r1
	orrs r5, r0
	strb r5, [r7, 0x1]
	ldr r0, =0x00000864
	bl FlagGet
	ands r6, r0
	lsls r6, 1
	ldrb r1, [r7, 0x1]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	orrs r0, r6
	strb r0, [r7, 0x1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800DD94

	thumb_func_start sub_800DE7C
sub_800DE7C: @ 800DE7C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	mov r8, r1
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r0, =gUnknown_03004140
	ldrb r0, [r0, 0x6]
	cmp r0, 0x1
	bne _0800DED8
	movs r0, 0x1
	mov r9, r0
	ldr r6, =gUnknown_03007890
	ldr r0, [r6]
	lsls r4, r5, 5
	adds r0, r4
	ldrh r0, [r0, 0x18]
	bl sub_8010454
	cmp r0, 0
	beq _0800DEB8
	ldr r1, [r6]
	ldrb r0, [r1, 0x7]
	asrs r0, r5
	mov r2, r9
	ands r0, r2
	cmp r0, 0
	bne _0800DEF0
_0800DEB8:
	adds r0, r7, 0
	movs r1, 0
	movs r2, 0xD
	bl memset
	mov r0, r8
	movs r1, 0
	movs r2, 0x8
	bl memset
	b _0800DF24
	.pool
_0800DED8:
	movs r0, 0
	mov r9, r0
	ldr r6, =gUnknown_03007890
	ldr r0, [r6]
	lsls r4, r5, 5
	adds r0, r4
	ldrh r0, [r0, 0x18]
	bl sub_8010454
	cmp r0, 0
	beq _0800DF10
	ldr r1, [r6]
_0800DEF0:
	adds r1, r4, r1
	adds r1, 0x1A
	adds r0, r7, 0
	movs r2, 0xD
	bl memcpy
	ldr r1, [r6]
	adds r1, r4, r1
	adds r1, 0x29
	mov r0, r8
	movs r2, 0x8
	bl memcpy
	b _0800DF24
	.pool
_0800DF10:
	adds r0, r7, 0
	movs r1, 0
	movs r2, 0xD
	bl memset
	mov r0, r8
	movs r1, 0
	movs r2, 0x8
	bl memset
_0800DF24:
	mov r0, r9
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_800DE7C

	thumb_func_start sub_800DF34
sub_800DF34: @ 800DF34
	push {r4-r7,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	movs r7, 0
	ldr r6, =gUnknown_03007890
	ldr r0, [r6]
	lsrs r4, r2, 19
	adds r2, r0, r4
	ldrh r1, [r2, 0x18]
	ldr r0, =0x00007f7d
	cmp r1, r0
	bne _0800DF74
	adds r1, r2, 0
	adds r1, 0x1A
	adds r0, r3, 0
	movs r2, 0xD
	bl memcpy
	ldr r1, [r6]
	adds r1, r4, r1
	adds r1, 0x29
	adds r0, r5, 0
	movs r2, 0x8
	bl memcpy
	movs r7, 0x1
	b _0800DF88
	.pool
_0800DF74:
	adds r0, r3, 0
	movs r1, 0
	movs r2, 0xD
	bl memset
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x8
	bl memset
_0800DF88:
	adds r0, r7, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_800DF34

	thumb_func_start sub_800DF90
sub_800DF90: @ 800DF90
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, =gUnknown_02022B14
	movs r2, 0xD
	bl memcpy
	ldr r1, =gUnknown_02022B22
	adds r0, r4, 0
	movs r2, 0x8
	bl memcpy
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800DF90

	thumb_func_start sub_800DFB4
sub_800DFB4: @ 800DFB4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	cmp r3, 0
	bne _0800DFCA
	cmp r2, 0
	bne _0800DFCA
	movs r3, 0xE7
	movs r2, 0x8
_0800DFCA:
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800E024
	ldr r0, =gUnknown_082ED5F0
	adds r1, r3, 0
	movs r3, 0
	bl AddObjectToFront
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, =gUnknown_02020630
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	adds r4, r0
	ldr r0, =0x00001234
	strh r0, [r4, 0x3C]
	ldr r0, =gUnknown_082ED5E0
	ldrh r0, [r0, 0x6]
	bl GetObjectTileRangeStartByTag
	strh r0, [r4, 0x3A]
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	ldr r0, =gUnknown_02022B10
	strb r5, [r0]
	b _0800E06A
	.pool
_0800E024:
	ldr r0, =gUnknown_082ED5F0
	adds r1, r3, 0
	movs r3, 0
	bl AddObjectToFront
	ldr r4, =gUnknown_02022B10
	strb r0, [r4]
	ldr r5, =gUnknown_02020630
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, =0x00001234
	strh r1, [r0, 0x3C]
	ldr r0, =gUnknown_082ED5E0
	ldrh r0, [r0, 0x6]
	bl GetObjectTileRangeStartByTag
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	strh r0, [r1, 0x3A]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_0800E06A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800DFB4

	thumb_func_start sub_800E084
sub_800E084: @ 800E084
	push {r4,lr}
	ldr r4, =gUnknown_02020630
	ldr r3, =gUnknown_02022B10
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r4
	movs r0, 0x3C
	ldrsh r1, [r2, r0]
	ldr r0, =0x00001234
	cmp r1, r0
	bne _0800E0CA
	movs r0, 0
	strh r0, [r2, 0x3C]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl RemoveObjectAndFreeTiles
	ldr r3, =gMain
	movs r0, 0x84
	lsls r0, 3
	adds r3, r0
	ldr r0, =gDefaultOamAttributes
	ldr r1, [r0]
	ldr r2, [r0, 0x4]
	str r1, [r3]
	str r2, [r3, 0x4]
	ldr r1, =0x070003e8
	movs r2, 0x4
	bl CpuSet
_0800E0CA:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800E084

	thumb_func_start sub_800E0E8
sub_800E0E8: @ 800E0E8
	push {r4,lr}
	ldr r4, =gUnknown_082ED5E0
	ldrh r0, [r4, 0x6]
	bl GetObjectTileRangeStartByTag
	lsls r0, 16
	ldr r1, =0xffff0000
	cmp r0, r1
	bne _0800E100
	adds r0, r4, 0
	bl LoadCompressedObjectPic
_0800E100:
	ldr r0, =gUnknown_082ED5E8
	bl LoadTaggedObjectPalette
	ldr r1, =gUnknown_02022B10
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800E0E8

	thumb_func_start sub_800E124
sub_800E124: @ 800E124
	push {r4,lr}
	ldr r1, =gUnknown_03007890
	ldr r0, [r1]
	ldrb r2, [r0, 0x2]
	movs r3, 0
	movs r4, 0x1
_0800E130:
	adds r0, r2, 0
	ands r0, r4
	cmp r0, 0
	beq _0800E148
	ldr r0, [r1]
	adds r0, 0xA
	adds r0, r3
	ldrb r0, [r0]
	b _0800E156
	.pool
_0800E148:
	lsrs r2, 1
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0800E130
	movs r0, 0
_0800E156:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_800E124

	thumb_func_start sub_800E15C
sub_800E15C: @ 800E15C
	push {lr}
	adds r2, r0, 0
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	cmp r0, r1
	beq _0800E170
	movs r0, 0
	strh r1, [r2, 0x32]
	strh r0, [r2, 0x34]
	strh r0, [r2, 0x36]
_0800E170:
	pop {r0}
	bx r0
	thumb_func_end sub_800E15C

	thumb_func_start sub_800E174
sub_800E174: @ 800E174
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r1, =gUnknown_02022B10
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _0800E184
	b _0800E346
_0800E184:
	ldr r2, =gUnknown_02020630
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r2
	movs r0, 0x3C
	ldrsh r1, [r2, r0]
	ldr r0, =0x00001234
	cmp r1, r0
	beq _0800E19C
	b _0800E346
_0800E19C:
	adds r6, r2, 0
	movs r5, 0xFF
	movs r4, 0
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800E1F6
	adds r7, r6, 0
	adds r7, 0x28
	movs r1, 0x29
	adds r1, r6
	mov r8, r1
	b _0800E1E6
	.pool
_0800E1C8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_800DD1C
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bcc _0800E1E6
	adds r0, r4, 0
	bl sub_800DD1C
	lsls r0, 24
	lsrs r5, r0, 24
_0800E1E6:
	bl sub_8009FCC
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r4, r0
	blt _0800E1C8
	b _0800E208
_0800E1F6:
	bl sub_800E124
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r6, 0
	adds r7, 0x28
	movs r2, 0x29
	adds r2, r6
	mov r8, r2
_0800E208:
	bl sub_8012224
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0800E218
	movs r0, 0x4
	b _0800E246
_0800E218:
	cmp r5, 0x18
	bhi _0800E220
	movs r0, 0x3
	b _0800E246
_0800E220:
	adds r0, r5, 0
	subs r0, 0x19
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x65
	bhi _0800E230
	movs r0, 0x2
	b _0800E246
_0800E230:
	adds r0, r5, 0
	subs r0, 0x7F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x65
	bhi _0800E240
	movs r0, 0x1
	b _0800E246
_0800E240:
	cmp r5, 0xE4
	bls _0800E248
	movs r0, 0
_0800E246:
	strh r0, [r6, 0x2E]
_0800E248:
	movs r3, 0x2E
	ldrsh r1, [r6, r3]
	movs r2, 0x30
	ldrsh r0, [r6, r2]
	cmp r1, r0
	beq _0800E25E
	adds r0, r6, 0
	bl sub_800E15C
	ldrh r0, [r6, 0x2E]
	strh r0, [r6, 0x30]
_0800E25E:
	movs r0, 0x32
	ldrsh r1, [r6, r0]
	ldr r2, [r6, 0x8]
	lsls r1, 2
	adds r1, r2
	movs r3, 0x36
	ldrsh r0, [r6, r3]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r0, 10
	lsrs r0, 26
	movs r3, 0x34
	ldrsh r1, [r6, r3]
	cmp r0, r1
	bge _0800E2AC
	ldrh r0, [r6, 0x36]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r6, 0x36]
	strh r3, [r6, 0x34]
	movs r1, 0x32
	ldrsh r0, [r6, r1]
	lsls r0, 2
	adds r0, r2
	movs r2, 0x36
	ldrsh r1, [r6, r2]
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	ldrsh r1, [r1, r0]
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	bne _0800E2B2
	strh r3, [r6, 0x36]
	b _0800E2B2
_0800E2AC:
	ldrh r0, [r6, 0x34]
	adds r0, 0x1
	strh r0, [r6, 0x34]
_0800E2B2:
	ldr r4, =gMain
	movs r1, 0x84
	lsls r1, 3
	adds r0, r4, r1
	ldr r1, =gUnknown_082ED570
	ldr r2, [r1, 0x4]
	ldr r1, [r1]
	str r1, [r0]
	str r2, [r0, 0x4]
	movs r3, 0x20
	ldrsh r2, [r6, r3]
	movs r1, 0
	ldrsb r1, [r7, r1]
	adds r2, r1
	ldr r1, =0x00000422
	adds r5, r4, r1
	ldr r3, =0x000001ff
	adds r1, r3, 0
	ands r2, r1
	ldrh r3, [r5]
	ldr r1, =0xfffffe00
	ands r1, r3
	orrs r1, r2
	strh r1, [r5]
	ldrh r1, [r6, 0x22]
	mov r2, r8
	ldrb r2, [r2]
	adds r1, r2
	strb r1, [r0]
	ldrb r2, [r6, 0x5]
	ldr r3, =0x00000425
	adds r5, r4, r3
	lsrs r2, 4
	lsls r2, 4
	ldrb r3, [r5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r2
	strb r1, [r5]
	movs r1, 0x32
	ldrsh r2, [r6, r1]
	ldr r1, [r6, 0x8]
	lsls r2, 2
	adds r2, r1
	movs r3, 0x36
	ldrsh r1, [r6, r3]
	ldr r2, [r2]
	lsls r1, 2
	adds r1, r2
	ldrh r2, [r1]
	ldrh r6, [r6, 0x3A]
	adds r2, r6
	ldr r1, =0x00000424
	adds r4, r1
	ldr r3, =0x000003ff
	adds r1, r3, 0
	ands r2, r1
	ldrh r3, [r4]
	ldr r1, =0xfffffc00
	ands r1, r3
	orrs r1, r2
	strh r1, [r4]
	ldr r1, =0x070003e8
	movs r2, 0x4
	bl CpuSet
	bl sub_8011A74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0800E346
	bl sub_800E084
_0800E346:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800E174

	thumb_func_start sub_800E378
sub_800E378: @ 800E378
	push {lr}
	stm r0!, {r1}
	adds r1, r2, 0
	bl StringCopy
	pop {r0}
	bx r0
	thumb_func_end sub_800E378

	thumb_func_start sub_800E388
sub_800E388: @ 800E388
	push {lr}
	adds r2, r0, 0
	movs r1, 0
_0800E38E:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800E39A
	movs r0, 0x1
	b _0800E3A2
_0800E39A:
	adds r1, 0x1
	cmp r1, 0x7
	ble _0800E38E
	movs r0, 0
_0800E3A2:
	pop {r1}
	bx r1
	thumb_func_end sub_800E388

	thumb_func_start sub_800E3A8
sub_800E3A8: @ 800E3A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800E3BE
	b _0800E520
_0800E3BE:
	movs r0, 0xF0
	bl AllocZeroed
	str r0, [sp, 0x14]
	movs r4, 0
	b _0800E434
	.pool
_0800E3D0:
	lsls r2, r4, 2
	mov r0, sp
	adds r1, r0, r2
	movs r0, 0x1
	negs r0, r0
	str r0, [r1]
	movs r5, 0
	mov r8, r2
	lsls r0, r4, 3
	adds r1, r4, 0x1
	mov r9, r1
	subs r0, r4
	lsls r0, 2
	str r0, [sp, 0x1C]
	ldr r7, =gUnknown_020229F0
	mov r10, r7
	ldr r6, =0x00003b98
	movs r4, 0
	mov r0, r10
	subs r0, 0x4
	ldr r1, [sp, 0x1C]
	adds r3, r1, r0
_0800E3FC:
	ldrh r1, [r3]
	ldr r0, =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r7, =0x00003b98
	adds r0, r2, r7
	adds r0, r4
	ldr r0, [r0]
	cmp r1, r0
	bne _0800E428
	adds r1, r2, r6
	adds r1, 0x4
	ldr r0, [sp, 0x1C]
	add r0, r10
	str r3, [sp, 0x18]
	bl StringCompare
	ldr r3, [sp, 0x18]
	cmp r0, 0
	bne _0800E428
	mov r0, sp
	add r0, r8
	str r5, [r0]
_0800E428:
	adds r6, 0xC
	adds r4, 0xC
	adds r5, 0x1
	cmp r5, 0x13
	ble _0800E3FC
	mov r4, r9
_0800E434:
	bl sub_8009FCC
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _0800E3D0
	movs r0, 0
	mov r8, r0
	movs r4, 0
	mov r7, sp
	movs r5, 0
	ldr r6, [sp, 0x14]
	b _0800E4AC
	.pool
_0800E45C:
	bl link_get_multiplayer_id
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	beq _0800E4A6
	ldr r2, =gUnknown_020229E8
	adds r0, r5, r2
	ldrh r0, [r0, 0x1A]
	cmp r0, 0x1
	beq _0800E4A6
	adds r0, r2, 0x4
	adds r0, r5, r0
	ldrh r1, [r0]
	adds r2, 0x8
	adds r2, r5, r2
	adds r0, r6, 0
	bl sub_800E378
	ldr r2, [r7]
	cmp r2, 0
	blt _0800E4A0
	ldr r0, =gSaveBlock1Ptr
	ldr r1, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldr r1, =0x00003b9c
	adds r0, r1
	movs r1, 0
	movs r2, 0x8
	bl memset
_0800E4A0:
	adds r6, 0xC
	movs r0, 0x1
	add r8, r0
_0800E4A6:
	adds r7, 0x4
	adds r5, 0x1C
	adds r4, 0x1
_0800E4AC:
	bl sub_8009FCC
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _0800E45C
	movs r4, 0
	ldr r1, =gSaveBlock1Ptr
	mov r9, r1
	ldr r6, =0x00003b98
	movs r7, 0
	mov r1, r8
	lsls r0, r1, 1
	add r0, r8
	lsls r0, 2
	ldr r1, [sp, 0x14]
	adds r5, r0, r1
_0800E4CE:
	mov r1, r9
	ldr r0, [r1]
	adds r0, r6
	adds r0, 0x4
	bl sub_800E388
	cmp r0, 0
	beq _0800E500
	mov r0, r9
	ldr r2, [r0]
	ldr r1, =0x00003b98
	adds r0, r2, r1
	adds r0, r7
	ldr r1, [r0]
	adds r2, r6
	adds r2, 0x4
	adds r0, r5, 0
	bl sub_800E378
	adds r5, 0xC
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0x13
	bgt _0800E50A
_0800E500:
	adds r6, 0xC
	adds r7, 0xC
	adds r4, 0x1
	cmp r4, 0x13
	ble _0800E4CE
_0800E50A:
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r7, =0x00003b98
	adds r0, r7
	ldr r1, [sp, 0x14]
	movs r2, 0xF0
	bl memcpy
	ldr r0, [sp, 0x14]
	bl Free
_0800E520:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800E3A8

	thumb_func_start sub_800E540
sub_800E540: @ 800E540
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	movs r7, 0
	ldr r6, =gSaveBlock1Ptr
	ldr r4, =0x00003b98
	movs r5, 0
_0800E558:
	ldr r0, [r6]
	adds r0, r4
	adds r0, 0x4
	mov r1, r9
	bl StringCompare
	cmp r0, 0
	bne _0800E584
	ldr r0, [r6]
	ldr r1, =0x00003b98
	adds r0, r1
	adds r0, r5
	ldr r0, [r0]
	cmp r0, r8
	bne _0800E584
	movs r0, 0x1
	b _0800E59E
	.pool
_0800E584:
	ldr r0, [r6]
	adds r0, r4
	adds r0, 0x4
	bl sub_800E388
	cmp r0, 0
	beq _0800E59C
	adds r4, 0xC
	adds r5, 0xC
	adds r7, 0x1
	cmp r7, 0x13
	ble _0800E558
_0800E59C:
	movs r0, 0
_0800E59E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_800E540

	thumb_func_start sub_800E5AC
sub_800E5AC: @ 800E5AC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r0, =0x00003b98
	mov r8, r0
	movs r7, 0
	mov r6, r8
	movs r5, 0
	movs r4, 0x13
_0800E5C0:
	ldr r0, =gSaveBlock1Ptr
	ldr r1, [r0]
	mov r2, r8
	adds r0, r1, r2
	adds r0, r5
	str r7, [r0]
	mov r0, sp
	strh r7, [r0]
	adds r1, r6
	adds r1, 0x4
	ldr r2, =0x01000004
	bl CpuSet
	adds r6, 0xC
	adds r5, 0xC
	subs r4, 0x1
	cmp r4, 0
	bge _0800E5C0
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800E5AC

	thumb_func_start nullsub_5
nullsub_5: @ 800E5FC
	bx lr
	thumb_func_end nullsub_5

	thumb_func_start nullsub_13
nullsub_13: @ 800E600
	bx lr
	thumb_func_end nullsub_13

	thumb_func_start sub_800E604
sub_800E604: @ 800E604
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	ldr r6, =gUnknown_03005000
	adds r5, r6, 0
	adds r5, 0xEE
	ldrb r4, [r5]
	mov r0, sp
	movs r7, 0
	strh r7, [r0]
	ldr r2, =0x0100067a
	adds r1, r6, 0
	bl CpuSet
	ldrb r0, [r5]
	strb r4, [r5]
	movs r0, 0xFF
	strb r0, [r6, 0xC]
	ldrb r0, [r5]
	cmp r0, 0x4
	beq _0800E636
	ldrb r0, [r5]
	strb r7, [r5]
_0800E636:
	mov r7, sp
	adds r7, 0x2
	add r0, sp, 0x4
	mov r8, r0
	movs r0, 0x6
	add r0, sp
	mov r9, r0
	adds r5, r6, 0
	adds r5, 0x80
	movs r4, 0x4
_0800E64A:
	adds r0, r5, 0
	bl sub_800FCC4
	adds r5, 0x14
	subs r4, 0x1
	cmp r4, 0
	bge _0800E64A
	movs r5, 0
	ldr r4, =gUnknown_0300506C
	adds r0, r4, 0
	bl sub_800FCC4
	adds r0, r4, 0
	adds r0, 0xB8
	bl sub_800D6C8
	ldr r0, =0x0000097c
	adds r4, r0
	adds r0, r4, 0
	bl sub_800D724
	strh r5, [r7]
	ldr r1, =gUnknown_03003110
	ldr r2, =0x01000008
	adds r0, r7, 0
	bl CpuSet
	mov r0, r8
	strh r5, [r0]
	ldr r1, =gUnknown_03003090
	ldr r2, =0x01000028
	bl CpuSet
	mov r0, r9
	strh r5, [r0]
	ldr r1, =gUnknown_020229E8
	ldr r2, =0x01000046
	bl CpuSet
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800E604

	thumb_func_start sub_800E6D0
sub_800E6D0: @ 800E6D0
	push {r4-r6,lr}
	ldr r4, =gIntrTable
	ldr r5, [r4, 0x4]
	ldr r6, [r4, 0x8]
	bl sub_800E700
	bl rfu_REQ_stopMode
	bl rfu_waitREQComplete
	ldr r1, =0x04000208
	movs r0, 0
	strh r0, [r1]
	str r5, [r4, 0x4]
	str r6, [r4, 0x8]
	movs r0, 0x1
	strh r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800E6D0

	thumb_func_start sub_800E700
sub_800E700: @ 800E700
	push {r4,lr}
	ldr r0, =gUnknown_03004190
	ldr r1, =0x00000e64
	ldr r4, =gIntrTable + 0x4
	adds r2, r4, 0
	movs r3, 0x1
	bl rfu_initializeAPI
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _0800E732
	ldr r0, =gUnknown_020229C6
	strh r1, [r0]
	bl sub_800AAF4
	movs r0, 0
	bl sub_80111B0
	bl sub_800E604
	adds r1, r4, 0x4
	movs r0, 0x3
	bl rfu_setTimerInterrupt
_0800E732:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800E700

	thumb_func_start sub_800E748
sub_800E748: @ 800E748
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_8010750
	ldr r0, =gUnknown_03005000
	ldrh r0, [r0, 0x4]
	cmp r0, 0x12
	bls _0800E75C
	b _0800E862
_0800E75C:
	lsls r0, 2
	ldr r1, =_0800E770
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0800E770:
	.4byte _0800E7BC
	.4byte _0800E862
	.4byte _0800E7E4
	.4byte _0800E862
	.4byte _0800E814
	.4byte _0800E862
	.4byte _0800E862
	.4byte _0800E862
	.4byte _0800E862
	.4byte _0800E862
	.4byte _0800E862
	.4byte _0800E862
	.4byte _0800E862
	.4byte _0800E862
	.4byte _0800E862
	.4byte _0800E862
	.4byte _0800E862
	.4byte _0800E862
	.4byte _0800E828
_0800E7BC:
	ldr r0, =gUnknown_02022B2C
	bl sub_800BFCC
	ldr r0, =gUnknown_03005000
	movs r2, 0x1
	strh r2, [r0, 0x4]
	ldr r1, =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0xA]
	b _0800E862
	.pool
_0800E7E4:
	ldr r4, =gUnknown_03005000
	ldrb r0, [r4, 0xC]
	ldr r3, =gUnknown_082ED6E0
	movs r1, 0
	movs r2, 0xF0
	bl sub_800C054
	movs r0, 0x3
	strh r0, [r4, 0x4]
	ldr r1, =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x6
	strh r1, [r0, 0xA]
	b _0800E862
	.pool
_0800E814:
	movs r0, 0
	bl sub_800C27C
	ldr r1, =gUnknown_03005000
	movs r0, 0x5
	strh r0, [r1, 0x4]
	b _0800E862
	.pool
_0800E828:
	ldr r4, =gUnknown_03005000
	ldr r0, =0x00000cdb
	adds r1, r4, r0
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r0, =sub_800EDBC
	bl sub_800D52C
	bl sub_800EAB4
	bl sub_800EAFC
	movs r0, 0x14
	strh r0, [r4, 0x4]
	ldr r1, =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	strh r1, [r0, 0xA]
	ldr r0, =sub_801084C
	movs r1, 0x5
	bl CreateTask
	adds r0, r5, 0
	bl DestroyTask
_0800E862:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800E748

	thumb_func_start sub_800E87C
sub_800E87C: @ 800E87C
	lsls r0, 24
	lsrs r0, 24
	ldr r1, =gUnknown_082ED6A5
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.pool
	thumb_func_end sub_800E87C

	thumb_func_start sub_800E88C
sub_800E88C: @ 800E88C
	push {r4-r7,lr}
	adds r2, r0, 0
	adds r5, r1, 0
	movs r4, 0x1
	adds r1, r2, 0
	movs r6, 0
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	bne _0800E8CC
	movs r3, 0
	movs r5, 0x1
	ldr r1, =gUnknown_03005CDE
_0800E8A6:
	adds r0, r2, 0
	ands r0, r5
	cmp r0, 0
	beq _0800E8B8
	adds r0, r3, r1
	strb r4, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0800E8B8:
	asrs r2, 1
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0800E8A6
	b _0800E942
	.pool
_0800E8CC:
	movs r3, 0
	mvns r0, r1
	mov r12, r0
	movs r7, 0x1
	ldr r4, =gUnknown_03005CDE
_0800E8D6:
	adds r2, r1, 0
	ands r2, r7
	cmp r2, 0
	bne _0800E8E2
	adds r0, r3, r4
	strb r2, [r0]
_0800E8E2:
	asrs r1, 1
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0800E8D6
	movs r4, 0x4
	ldr r0, =gUnknown_03005CDE
	ldrb r7, [r0]
_0800E8F4:
	movs r3, 0
	subs r1, r4, 0x1
	cmp r7, r4
	beq _0800E910
	ldr r2, =gUnknown_03005CDE
_0800E8FE:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bhi _0800E910
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, r4
	bne _0800E8FE
_0800E910:
	cmp r3, 0x4
	bne _0800E916
	adds r6, r4, 0
_0800E916:
	lsls r0, r1, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0800E8F4
	mov r0, r12
	ands r5, r0
	movs r3, 0
	movs r2, 0x1
	ldr r1, =gUnknown_03005CDE
_0800E928:
	adds r0, r5, 0
	ands r0, r2
	cmp r0, 0
	beq _0800E936
	adds r0, r3, r1
	strb r6, [r0]
	adds r6, 0x1
_0800E936:
	asrs r5, 1
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0800E928
_0800E942:
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800E88C

	thumb_func_start sub_800E94C
sub_800E94C: @ 800E94C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, =gUnknown_03005000
	ldrh r3, [r0, 0x4]
	adds r7, r0, 0
	cmp r3, 0xC
	bls _0800E95E
	b _0800EA9A
_0800E95E:
	lsls r0, r3, 2
	ldr r1, =_0800E970
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0800E970:
	.4byte _0800E9A4
	.4byte _0800EA9A
	.4byte _0800EA9A
	.4byte _0800EA9A
	.4byte _0800EA9A
	.4byte _0800EA9A
	.4byte _0800E9BC
	.4byte _0800EA9A
	.4byte _0800EA9A
	.4byte _0800E9E4
	.4byte _0800EA9A
	.4byte _0800E9F8
	.4byte _0800EA3C
_0800E9A4:
	ldr r0, =gUnknown_082ED608
	bl sub_800BFCC
	ldr r0, =gUnknown_03005000
	movs r2, 0x1
	strh r2, [r0, 0x4]
	b _0800E9CC
	.pool
_0800E9BC:
	ldrb r0, [r7, 0xC]
	ldr r3, =gUnknown_082ED6E0
	movs r1, 0
	movs r2, 0xF0
	bl sub_800C054
	movs r2, 0x7
	strh r2, [r7, 0x4]
_0800E9CC:
	ldr r1, =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0xA]
	b _0800EA9A
	.pool
_0800E9E4:
	ldr r0, =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	movs r0, 0xA
	strh r0, [r1, 0xA]
	b _0800EA9A
	.pool
_0800E9F8:
	bl sub_80107A0
	cmp r0, 0x6
	beq _0800EA1C
	cmp r0, 0x6
	bgt _0800EA0A
	cmp r0, 0x5
	beq _0800EA10
	b _0800EA9A
_0800EA0A:
	cmp r0, 0x9
	beq _0800EA1C
	b _0800EA9A
_0800EA10:
	ldr r1, =gUnknown_03005000
	movs r0, 0xC
	strh r0, [r1, 0x4]
	b _0800EA9A
	.pool
_0800EA1C:
	bl sub_800D630
	ldr r0, =gUnknown_03005000
	ldr r1, =0x00000ce4
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	adds r0, r6, 0
	bl DestroyTask
	b _0800EA9A
	.pool
_0800EA3C:
	ldr r0, =0x00000c3e
	adds r4, r7, r0
	ldrb r0, [r4]
	movs r5, 0x80
	lsls r5, 17
	lsls r5, r0
	lsrs r5, 24
	ldrb r1, [r4]
	movs r0, 0xC
	bl rfu_clearSlot
	ldrb r1, [r4]
	ldr r0, =0x00000c3f
	adds r2, r7, r0
	movs r0, 0x10
	movs r3, 0x46
	bl rfu_setRecvBuffer
	adds r1, r7, 0
	adds r1, 0x4C
	adds r0, r5, 0
	movs r2, 0xE
	bl rfu_UNI_setSendData
	ldr r1, =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	strh r1, [r0, 0xA]
	adds r0, r6, 0
	bl DestroyTask
	ldr r4, =gUnknown_02022B44
	ldrb r0, [r4, 0xF]
	cmp r0, 0
	bne _0800EA92
	bl sub_801227C
	ldrb r0, [r4, 0xF]
	adds r0, 0x1
	strb r0, [r4, 0xF]
_0800EA92:
	ldr r0, =sub_801084C
	movs r1, 0x5
	bl CreateTask
_0800EA9A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800E94C

	thumb_func_start sub_800EAB4
sub_800EAB4: @ 800EAB4
	push {r4,r5,lr}
	ldr r0, =gUnknown_03004140
	ldrb r5, [r0]
	movs r4, 0
_0800EABC:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _0800EAE0
	lsls r2, r4, 3
	subs r2, r4
	lsls r2, 1
	ldr r0, =gUnknown_03005014
	adds r2, r0
	movs r0, 0x10
	adds r1, r4, 0
	movs r3, 0xE
	bl rfu_setRecvBuffer
	movs r0, 0x3
	adds r1, r4, 0
	bl rfu_clearSlot
_0800EAE0:
	lsrs r5, 1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0800EABC
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800EAB4

	thumb_func_start sub_800EAFC
sub_800EAFC: @ 800EAFC
	push {r4-r6,lr}
	ldr r0, =gUnknown_03004140
	ldrb r5, [r0]
	ldr r4, =gUnknown_03005C87
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x46
	bl rfu_UNI_setSendData
	adds r0, r5, 0
	bl sub_800E87C
	ldr r1, =0xfffff379
	adds r6, r4, r1
	adds r1, r4, 0
	adds r1, 0x53
	strb r0, [r1]
	adds r4, 0x5B
	strb r5, [r4]
	movs r1, 0x1
	negs r1, r1
	adds r0, r5, 0
	bl sub_800E88C
	movs r0, 0x1
	strb r0, [r6, 0xC]
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800EAFC

	thumb_func_start sub_800EB44
sub_800EB44: @ 800EB44
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_800F7DC
	ldrb r1, [r0, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x54
	bne _0800EB78
	bl sub_8011A74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _0800EB78
	ldr r0, =gUnknown_03004140
	ldrb r0, [r0]
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	movs r0, 0
	movs r1, 0
	bl sub_8011A64
_0800EB78:
	ldr r0, =gUnknown_03005000
	ldrh r2, [r0, 0x4]
	adds r6, r0, 0
	cmp r2, 0x12
	bls _0800EB84
	b _0800ECF4
_0800EB84:
	lsls r0, r2, 2
	ldr r1, =_0800EB9C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0800EB9C:
	.4byte _0800EBE8
	.4byte _0800ECF4
	.4byte _0800ECF4
	.4byte _0800ECF4
	.4byte _0800ECF4
	.4byte _0800ECF4
	.4byte _0800ECF4
	.4byte _0800ECF4
	.4byte _0800ECF4
	.4byte _0800ECF4
	.4byte _0800ECF4
	.4byte _0800ECF4
	.4byte _0800ECF4
	.4byte _0800EC38
	.4byte _0800EC98
	.4byte _0800ECF4
	.4byte _0800ECAC
	.4byte _0800EC10
	.4byte _0800ECF4
_0800EBE8:
	ldr r0, =gUnknown_02022B2C
	bl sub_800BFCC
	ldr r0, =gUnknown_03005000
	movs r2, 0x1
	strh r2, [r0, 0x4]
	ldr r1, =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0xA]
	b _0800ECF4
	.pool
_0800EC10:
	ldr r3, =gUnknown_082ED6E0
	movs r0, 0x2
	movs r1, 0
	movs r2, 0xF0
	bl sub_800C054
	ldr r0, =sub_800ED34
	bl sub_800D52C
	ldr r1, =gUnknown_03005000
	movs r0, 0x12
	strh r0, [r1, 0x4]
	b _0800ECF4
	.pool
_0800EC38:
	ldr r1, =0x00000c3e
	adds r0, r6, r1
	ldrb r1, [r0]
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r1
	lsrs r0, 24
	adds r1, r6, 0
	adds r1, 0x4C
	movs r2, 0xE
	bl rfu_UNI_setSendData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0800ECF4
	strb r0, [r6, 0xC]
	adds r0, r5, 0
	bl DestroyTask
	ldr r0, =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x16
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0800EC88
	ldr r0, =sub_8010D0C
	movs r1, 0x1
	bl CreateTask
	b _0800ECF4
	.pool
_0800EC88:
	ldr r0, =sub_801084C
	movs r1, 0x5
	bl CreateTask
	b _0800ECF4
	.pool
_0800EC98:
	movs r0, 0
	bl sub_800C27C
	ldr r1, =gUnknown_03005000
	movs r0, 0xF
	strh r0, [r1, 0x4]
	b _0800ECF4
	.pool
_0800ECAC:
	ldr r0, =0x00000cdb
	adds r1, r6, r0
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r0, =sub_800EDBC
	bl sub_800D52C
	movs r0, 0x1
	bl sub_8011068
	bl sub_800EAB4
	bl sub_800EAFC
	movs r0, 0x14
	strh r0, [r6, 0x4]
	ldr r1, =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	strh r1, [r0, 0xA]
	movs r4, 0x1
	strb r4, [r6, 0xC]
	ldr r0, =sub_801084C
	movs r1, 0x5
	bl CreateTask
	ldr r1, =0x00000ce8
	adds r0, r6, r1
	strb r4, [r0]
	adds r0, r5, 0
	bl DestroyTask
_0800ECF4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800EB44

	thumb_func_start sub_800ED10
sub_800ED10: @ 800ED10
	push {lr}
	ldr r3, =gUnknown_082ED6E0
	movs r0, 0x1
	movs r1, 0
	movs r2, 0xF0
	bl sub_800C054
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800ED10

	thumb_func_start sub_800ED28
sub_800ED28: @ 800ED28
	push {lr}
	movs r0, 0
	bl sub_800C27C
	pop {r0}
	bx r0
	thumb_func_end sub_800ED28

	thumb_func_start sub_800ED34
sub_800ED34: @ 800ED34
	push {r4,lr}
	ldr r0, =gUnknown_03005000
	movs r2, 0
	movs r1, 0xD
	adds r0, 0x59
_0800ED3E:
	strb r2, [r0]
	subs r0, 0x1
	subs r1, 0x1
	cmp r1, 0
	bge _0800ED3E
	bl rfu_REQ_recvData
	bl rfu_waitREQComplete
	ldr r1, =gUnknown_03007870
	ldr r3, =gUnknown_03005000
	ldr r0, =0x00000c3e
	adds r4, r3, r0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, 0x12]
	cmp r0, 0
	beq _0800ED9A
	movs r2, 0xCD
	lsls r2, 4
	adds r1, r3, r2
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r1, 0x92
	lsls r1, 1
	adds r0, r3, r1
	ldr r2, =0x00000c3f
	adds r1, r3, r2
	bl sub_800D7D8
	ldr r1, =gUnknown_02022B44
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	bl sub_800F048
	ldrb r0, [r4]
	bl rfu_UNI_readySendData
	ldrb r0, [r4]
	bl rfu_UNI_clearRecvNewDataFlag
_0800ED9A:
	movs r0, 0x1
	bl rfu_REQ_sendData_wrapper
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800ED34

	thumb_func_start sub_800EDBC
sub_800EDBC: @ 800EDBC
	ldr r0, =gUnknown_03005000
	ldr r1, =0x00000cdb
	adds r0, r1
	ldrb r1, [r0]
	movs r1, 0x1
	strb r1, [r0]
	bx lr
	.pool
	thumb_func_end sub_800EDBC

	thumb_func_start sub_800EDD4
sub_800EDD4: @ 800EDD4
	push {r4-r6,lr}
	bl sub_800C048
	ldr r4, =gUnknown_03005000
	ldrb r0, [r4, 0xC]
	cmp r0, 0x1
	bne _0800EDF0
	ldr r0, =sub_800E748
	b _0800EDF6
	.pool
_0800EDF0:
	cmp r0, 0
	bne _0800EE18
	ldr r0, =sub_800E94C
_0800EDF6:
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0800EE38
	adds r0, r4, 0
	adds r0, 0x67
	ldrb r0, [r0]
	bl DestroyTask
	bl sub_800E604
	b _0800EE38
	.pool
_0800EE18:
	cmp r0, 0x2
	bne _0800EE38
	ldr r0, =sub_800EB44
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0800EE38
	adds r0, r4, 0
	adds r0, 0x67
	ldrb r0, [r0]
	bl DestroyTask
	bl sub_800E604
_0800EE38:
	movs r5, 0
	ldr r6, =gUnknown_082ED7E0
_0800EE3C:
	lsls r0, r5, 2
	adds r0, r6
	ldr r4, [r0]
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0800EE5E
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0800EE5E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _0800EE3C
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800EDD4

	thumb_func_start sub_800EE78
sub_800EE78: @ 800EE78
	push {lr}
	ldr r0, =sub_800E748
	movs r1, 0x1
	bl CreateTask
	ldr r1, =gUnknown_03005000
	adds r1, 0x67
	strb r0, [r1]
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800EE78

	thumb_func_start sub_800EE94
sub_800EE94: @ 800EE94
	push {lr}
	ldr r1, =gUnknown_03005000
	ldrh r0, [r1, 0x4]
	cmp r0, 0x7
	bne _0800EEB4
	ldr r2, =0x00000ccd
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800EEB4
	movs r0, 0x1
	b _0800EEB6
	.pool
_0800EEB4:
	movs r0, 0
_0800EEB6:
	pop {r1}
	bx r1
	thumb_func_end sub_800EE94

	thumb_func_start sub_800EEBC
sub_800EEBC: @ 800EEBC
	push {r4,lr}
	ldr r4, =gUnknown_03005000
	ldrh r0, [r4, 0x4]
	cmp r0, 0x7
	bne _0800EEF8
	ldr r0, =gUnknown_03007890
	ldr r1, [r0]
	ldr r2, =0x00000c3d
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 5
	adds r1, r0
	ldrh r0, [r1, 0x14]
	movs r1, 0xF0
	bl sub_800C12C
	lsls r0, 24
	cmp r0, 0
	bne _0800EEF8
	movs r0, 0x9
	strh r0, [r4, 0x4]
	movs r0, 0x1
	b _0800EEFA
	.pool
_0800EEF8:
	movs r0, 0
_0800EEFA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_800EEBC

	thumb_func_start sub_800EF00
sub_800EF00: @ 800EF00
	push {lr}
	ldr r0, =sub_800E94C
	movs r1, 0x1
	bl CreateTask
	ldr r1, =gUnknown_03005000
	adds r1, 0x67
	strb r0, [r1]
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800EF00

	thumb_func_start sub_800EF1C
sub_800EF1C: @ 800EF1C
	push {lr}
	ldr r0, =gUnknown_03004140
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800EF30
	movs r0, 0
	b _0800EF32
	.pool
_0800EF30:
	movs r0, 0x1
_0800EF32:
	pop {r1}
	bx r1
	thumb_func_end sub_800EF1C

	thumb_func_start sub_800EF38
sub_800EF38: @ 800EF38
	ldr r1, =gUnknown_03005000
	movs r0, 0x4
	strh r0, [r1, 0x4]
	ldr r0, =gUnknown_03004140
	ldrb r0, [r0]
	ldr r2, =0x00000ce7
	adds r1, r2
	strb r0, [r1]
	bx lr
	.pool
	thumb_func_end sub_800EF38

	thumb_func_start sub_800EF58
sub_800EF58: @ 800EF58
	push {lr}
	adds r1, r0, 0
	ldr r2, =gUnknown_03005000
	ldrh r0, [r2, 0x4]
	cmp r0, 0x11
	beq _0800EF68
	cmp r1, 0
	beq _0800EF74
_0800EF68:
	movs r0, 0x12
	strh r0, [r2, 0x4]
	movs r0, 0x1
	b _0800EF76
	.pool
_0800EF74:
	movs r0, 0
_0800EF76:
	pop {r1}
	bx r1
	thumb_func_end sub_800EF58

	thumb_func_start sub_800EF7C
sub_800EF7C: @ 800EF7C
	ldr r1, =gUnknown_03005000
	movs r0, 0xE
	strh r0, [r1, 0x4]
	bx lr
	.pool
	thumb_func_end sub_800EF7C

	thumb_func_start sub_800EF88
sub_800EF88: @ 800EF88
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0
	b _0800EF9A
_0800EF92:
	lsrs r1, 1
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_0800EF9A:
	cmp r2, 0x3
	bhi _0800EFAC
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0800EF92
	adds r0, r2, 0
	bl rfu_UNI_readySendData
_0800EFAC:
	pop {r0}
	bx r0
	thumb_func_end sub_800EF88

	thumb_func_start sub_800EFB0
sub_800EFB0: @ 800EFB0
	push {r4-r7,lr}
	sub sp, 0x4
	movs r2, 0
	ldr r7, =gUnknown_03003090
	ldr r0, =gUnknown_03005000
	adds r6, r7, 0
	ldr r1, =0x00000c87
	adds r5, r0, r1
_0800EFC0:
	movs r3, 0
	lsls r0, r2, 3
	lsls r1, r2, 4
	adds r4, r2, 0x1
	subs r0, r2
	lsls r0, 1
	adds r2, r0, r5
	adds r1, r6
_0800EFD0:
	ldrh r0, [r1]
	lsrs r0, 8
	strb r0, [r2, 0x1]
	ldrh r0, [r1]
	strb r0, [r2]
	adds r2, 0x2
	adds r1, 0x2
	adds r3, 0x1
	cmp r3, 0x6
	ble _0800EFD0
	adds r2, r4, 0
	cmp r2, 0x4
	ble _0800EFC0
	movs r0, 0
	mov r1, sp
	strh r0, [r1]
	ldr r2, =0x01000028
	mov r0, sp
	adds r1, r7, 0
	bl CpuSet
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800EFB0

	thumb_func_start sub_800F014
sub_800F014: @ 800F014
	push {lr}
	ldr r3, =gUnknown_03003110
	ldr r2, =gUnknown_03003090
	movs r1, 0x6
_0800F01C:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, 0x2
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _0800F01C
	ldr r1, =gUnknown_03003110
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0xC
_0800F032:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _0800F032
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800F014

	thumb_func_start sub_800F048
sub_800F048: @ 800F048
	push {r4,r5,lr}
	ldr r4, =gUnknown_03005000
	ldr r0, =0x00000c3c
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, 0
	beq _0800F07A
	ldr r1, =0x00000c1c
	adds r0, r4, r1
	adds r1, r4, 0
	adds r1, 0x4C
	bl sub_800DAC8
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, =0x00000c3a
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r1, r0, 0
	cmp r1, 0
	bne _0800F076
	ldrb r0, [r5]
	strb r1, [r5]
_0800F076:
	cmp r2, 0
	bne _0800F09E
_0800F07A:
	ldr r5, =gUnknown_03005000
	ldr r1, =0x00000c3c
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800F09E
	ldr r1, =0x000009e8
	adds r0, r5, r1
	adds r4, r5, 0
	adds r4, 0x4C
	adds r1, r4, 0
	bl sub_800D9DC
	ldr r1, =0x00000c1c
	adds r0, r5, r1
	adds r1, r4, 0
	bl sub_800DA68
_0800F09E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800F048

	thumb_func_start sub_800F0B8
sub_800F0B8: @ 800F0B8
	push {r4,lr}
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	bne _0800F0CC
_0800F0C4:
	movs r0, 0
	b _0800F0EC
	.pool
_0800F0CC:
	movs r3, 0
	ldr r4, =gUnknown_03003090
_0800F0D0:
	movs r2, 0
	lsls r0, r3, 4
	adds r1, r0, r4
_0800F0D6:
	ldrh r0, [r1]
	cmp r0, 0
	bne _0800F0C4
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x6
	ble _0800F0D6
	adds r3, 0x1
	cmp r3, 0x4
	ble _0800F0D0
	movs r0, 0x1
_0800F0EC:
	pop {r4}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800F0B8

	thumb_func_start sub_800F0F8
sub_800F0F8: @ 800F0F8
	push {r4-r6,lr}
	ldr r6, =gUnknown_03005000
	ldrh r0, [r6, 0x4]
	cmp r0, 0x13
	bhi _0800F118
	bl rfu_REQ_recvData
	bl rfu_waitREQComplete
	movs r0, 0
	bl rfu_REQ_sendData_wrapper
	b _0800F1D2
	.pool
_0800F118:
	ldr r0, =0x00000cdb
	adds r1, r6, r0
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r0, =0x00000ce2
	adds r1, r6, r0
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r1, [r1]
	ldrb r0, [r0, 0x2]
	ands r0, r1
	cmp r0, r1
	bne _0800F1D2
	cmp r0, 0
	beq _0800F1D2
	ldr r1, =0x00000cdc
	adds r0, r6, r1
	ldrb r0, [r0]
	adds r5, r0, 0
	cmp r5, 0
	bne _0800F1C8
	ldr r0, =0x00000ce3
	adds r4, r6, r0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0800F1A8
	bl sub_8011D6C
	strb r5, [r4]
	ldr r1, =0x00000ce4
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800F18C
	movs r4, 0x80
	lsls r4, 8
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_8011A64
	adds r0, r4, 0
	bl sub_8011170
	b _0800F1D2
	.pool
_0800F18C:
	ldr r0, =gUnknown_03004140
	ldrb r4, [r0]
	cmp r4, 0
	bne _0800F1A8
	bl sub_800EDD4
	ldr r0, =gUnknown_03003124
	strb r4, [r0]
	b _0800F1D2
	.pool
_0800F1A8:
	bl sub_800EFB0
	ldr r0, =gUnknown_03005000
	ldr r1, =0x00000cda
	adds r0, r1
	ldrb r0, [r0]
	bl rfu_UNI_readySendData
	movs r0, 0x1
	bl rfu_REQ_sendData_wrapper
	b _0800F1CC
	.pool
_0800F1C8:
	bl rfu_REQ_PARENT_resumeRetransmitAndChange
_0800F1CC:
	ldr r1, =gUnknown_03005000
	movs r0, 0x1
	strb r0, [r1, 0xE]
_0800F1D2:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800F0F8

	thumb_func_start sub_800F1E0
sub_800F1E0: @ 800F1E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r0, =gUnknown_03005000
	ldrh r1, [r0, 0x4]
	adds r6, r0, 0
	cmp r1, 0x13
	bhi _0800F1F8
	b _0800F45A
_0800F1F8:
	ldrb r0, [r6, 0xE]
	cmp r0, 0x1
	beq _0800F200
	b _0800F45A
_0800F200:
	bl rfu_waitREQComplete
	ldr r0, =0x00000cdb
	adds r2, r6, r0
	ldrb r0, [r2]
	cmp r0, 0
	bne _0800F220
	adds r1, r6, 0
	adds r1, 0xEE
_0800F212:
	ldrb r0, [r1]
	cmp r0, 0
	beq _0800F21A
	b _0800F480
_0800F21A:
	ldrb r0, [r2]
	cmp r0, 0
	beq _0800F212
_0800F220:
	bl rfu_REQ_recvData
	bl rfu_waitREQComplete
	ldr r2, =gUnknown_03004140
	ldr r4, =gUnknown_03005000
	ldr r1, =0x00000ce2
	adds r0, r4, r1
	ldrb r1, [r2, 0x3]
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, r0
	beq _0800F23C
	b _0800F444
_0800F23C:
	ldr r6, =0x00000cdc
	adds r1, r4, r6
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r1, =gUnknown_02022B44
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	ldrb r7, [r2]
	movs r5, 0
_0800F252:
	movs r0, 0x1
	ands r0, r7
	lsrs r1, r7, 1
	str r1, [sp, 0x4]
	adds r2, r5, 0x1
	str r2, [sp]
	cmp r0, 0
	bne _0800F264
	b _0800F364
_0800F264:
	ldr r1, =gUnknown_03005000
	lsls r2, r5, 3
	subs r0, r2, r5
	lsls r4, r0, 1
	adds r0, r1, 0
	adds r0, 0x15
	adds r0, r4, r0
	ldrb r0, [r0]
	adds r6, r1, 0
	adds r3, r2, 0
	lsls r1, r5, 24
	mov r10, r1
	cmp r0, 0
	beq _0800F35C
	ldr r2, =0x00000cee
	adds r0, r6, r2
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _0800F2E0
	adds r0, r6, 0
	adds r0, 0x14
	adds r0, r4, r0
	ldrb r2, [r0]
	lsrs r2, 5
	ldrb r0, [r1]
	adds r0, 0x1
	movs r1, 0x7
	ands r0, r1
	cmp r2, r0
	beq _0800F2E0
	ldr r0, =0x00000cea
	adds r1, r6, r0
	adds r1, r5, r1
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _0800F35C
	movs r0, 0x81
	lsls r0, 8
	bl sub_8011170
	b _0800F35C
	.pool
_0800F2E0:
	ldr r2, =gUnknown_03005000
	ldr r6, =0x00000cee
	adds r1, r2, r6
	adds r1, r5, r1
	subs r3, r5
	lsls r3, 1
	adds r4, r2, 0
	adds r4, 0x14
	adds r2, r3, r4
	ldrb r0, [r2]
	lsrs r0, 5
	strb r0, [r1]
	ldr r1, =gUnknown_03005000
	subs r6, 0x4
	adds r0, r1, r6
	adds r0, r5, r0
	movs r1, 0
	strb r1, [r0]
	ldrb r1, [r2]
	movs r0, 0x1F
	ands r0, r1
	strb r0, [r2]
	ldr r2, =gUnknown_03005CDE
	adds r0, r5, r2
	ldrb r0, [r0]
	movs r6, 0
	lsls r1, r5, 24
	mov r10, r1
	lsrs r2, r7, 1
	str r2, [sp, 0x4]
	adds r5, 0x1
	str r5, [sp]
	ldr r1, =gUnknown_03003090
	mov r9, r1
	adds r5, r3, 0
	adds r7, r4, 0
	lsls r0, 4
	mov r8, r0
	adds r2, r5, 0x1
	mov r12, r2
_0800F330:
	lsls r1, r6, 1
	mov r0, r8
	adds r4, r1, r0
	add r4, r9
	mov r2, r12
	adds r3, r1, r2
	adds r3, r7
	ldrb r2, [r3]
	lsls r2, 8
	adds r1, r5
	adds r1, r7
	ldrb r0, [r1]
	orrs r0, r2
	strh r0, [r4]
	movs r0, 0
	strb r0, [r3]
	strb r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x6
	bls _0800F330
_0800F35C:
	mov r1, r10
	lsrs r0, r1, 24
	bl rfu_UNI_clearRecvNewDataFlag
_0800F364:
	ldr r2, [sp, 0x4]
	lsls r0, r2, 16
	lsrs r7, r0, 16
	ldr r6, [sp]
	lsls r0, r6, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bhi _0800F376
	b _0800F252
_0800F376:
	bl sub_800F014
	movs r0, 0
	bl sub_800F86C
	bl sub_8010528
	ldr r4, =gUnknown_03005000
	ldr r1, =0x00000ce5
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800F452
	ldr r2, =0x00000cd9
	adds r0, r4, r2
	ldrb r2, [r0]
	cmp r2, 0
	bne _0800F452
	ldr r0, =gUnknown_02022B44
	ldrb r1, [r0, 0xE]
	strb r2, [r0, 0xE]
	ldr r6, =0x00000cda
	adds r0, r4, r6
	ldrb r1, [r0]
	movs r0, 0x3
	bl rfu_clearSlot
	movs r5, 0
	adds r7, r4, 0
	adds r7, 0x14
_0800F3B2:
	ldr r0, =0x00000ce5
	adds r6, r4, r0
	ldrb r0, [r6]
	asrs r0, r5
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0800F3D6
	lsls r1, r5, 24
	lsrs r1, 24
	lsls r2, r5, 3
	subs r2, r5
	lsls r2, 1
	adds r2, r7
	movs r0, 0x10
	movs r3, 0xE
	bl rfu_setRecvBuffer
_0800F3D6:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _0800F3B2
	subs r4, r6, 0x3
	ldrb r0, [r4]
	ldrb r2, [r6]
	adds r1, r0, 0
	orrs r1, r2
	bl sub_800E88C
	ldrb r1, [r6]
	movs r2, 0
	strb r1, [r6, 0x4]
	ldrb r0, [r4]
	orrs r0, r1
	strb r0, [r4]
	strb r2, [r6]
	ldrb r0, [r4]
	adds r1, r6, 0
	subs r1, 0x5E
	movs r2, 0x46
	bl rfu_UNI_setSendData
	ldrb r0, [r4]
	bl sub_800E87C
	adds r1, r6, 0
	subs r1, 0xB
	strb r0, [r1]
	ldr r0, =sub_8010AAC
	movs r1, 0
	bl CreateTask
	b _0800F452
	.pool
_0800F444:
	ldr r2, =0x00000cdc
	adds r1, r4, r2
	ldrb r0, [r1]
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1]
	strb r2, [r4, 0xE]
_0800F452:
	ldr r1, =gUnknown_03005000
	movs r0, 0
	strb r0, [r1, 0xE]
	adds r6, r1, 0
_0800F45A:
	ldr r1, =0x00000cdc
	adds r0, r6, r1
	ldrb r0, [r0]
	adds r1, r0, 0
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	beq _0800F484
	movs r0, 0x1
	ands r0, r1
	b _0800F486
	.pool
_0800F480:
	movs r0, 0
	b _0800F486
_0800F484:
	movs r0, 0
_0800F486:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_800F1E0

	thumb_func_start sub_800F498
sub_800F498: @ 800F498
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r2, r1, 0
	ldrh r1, [r4]
	cmp r1, 0
	beq _0800F4DC
	ldr r0, =gUnknown_03005000
	movs r5, 0x81
	lsls r5, 1
	adds r3, r0, r5
	ldrb r0, [r3]
	lsls r0, 5
	orrs r0, r1
	strh r0, [r4]
	ldrb r0, [r3]
	adds r0, 0x1
	movs r1, 0x7
	ands r0, r1
	strb r0, [r3]
	adds r3, r4, 0
	movs r4, 0x6
_0800F4C2:
	ldrh r1, [r3]
	lsrs r0, r1, 8
	strb r0, [r2, 0x1]
	strb r1, [r2]
	adds r2, 0x2
	adds r3, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _0800F4C2
	b _0800F4EA
	.pool
_0800F4DC:
	movs r1, 0
	adds r0, r2, 0
	adds r0, 0xD
_0800F4E2:
	strb r1, [r0]
	subs r0, 0x1
	cmp r0, r2
	bge _0800F4E2
_0800F4EA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_800F498

	thumb_func_start sub_800F4F0
sub_800F4F0: @ 800F4F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x58
	ldr r0, =gUnknown_03005124
	mov r1, sp
	bl sub_800D934
	movs r1, 0
	ldr r0, =gUnknown_03003090
	mov r12, r0
_0800F506:
	movs r4, 0
	lsls r0, r1, 3
	adds r2, r1, 0x1
	mov r8, r2
	lsls r6, r1, 4
	subs r0, r1
	lsls r5, r0, 1
_0800F514:
	lsls r1, r4, 1
	adds r3, r1, r6
	add r3, r12
	adds r1, r5, r1
	adds r0, r1, 0x1
	add r0, sp
	ldrb r2, [r0]
	lsls r2, 8
	mov r7, sp
	adds r0, r7, r1
	ldrb r0, [r0]
	orrs r0, r2
	strh r0, [r3]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	bls _0800F514
	mov r1, r8
	lsls r0, r1, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _0800F506
	movs r0, 0
	bl sub_800F86C
	ldr r0, =gUnknown_03004140
	ldrb r0, [r0, 0x2]
	cmp r0, 0
	bne _0800F5C0
	ldr r0, =gUnknown_03005000
	ldr r2, =0x00000ce4
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800F5C0
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
	ldrb r0, [r0, 0x3]
	orrs r0, r1
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	bl sub_8011A74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0800F58C
	cmp r0, 0x6
	beq _0800F58C
	cmp r0, 0x9
	beq _0800F58C
	movs r1, 0x90
	lsls r1, 8
	movs r0, 0x2
	bl sub_8011A64
_0800F58C:
	bl rfu_clearAllSlot
	ldr r1, =gUnknown_03003124
	movs r0, 0
	strb r0, [r1]
	ldr r0, =gUnknown_03005000
	movs r5, 0
	str r5, [r0]
	ldr r7, =0x00000ce4
	adds r6, r0, r7
	ldrb r0, [r6]
	cmp r0, 0x1
	bne _0800F5B8
	movs r4, 0x90
	lsls r4, 8
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_8011A64
	adds r0, r4, 0
	bl sub_8011170
_0800F5B8:
	ldr r0, =gUnknown_03004140
	strb r5, [r0, 0x5]
	strb r5, [r0, 0x4]
	strb r5, [r6]
_0800F5C0:
	ldr r6, =gUnknown_03005000
	movs r0, 0xCD
	lsls r0, 4
	adds r2, r6, r0
	ldrb r0, [r2]
	cmp r0, 0
	beq _0800F604
	ldrb r0, [r2]
	subs r0, 0x1
	ldrb r1, [r2]
	strb r0, [r2]
	bl sub_8010528
	ldr r5, =gUnknown_03003110
	add r4, sp, 0x48
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_800F498
	ldr r1, =0x000009e8
	adds r0, r6, r1
	adds r1, r4, 0
	bl sub_800D888
	movs r1, 0
	movs r2, 0
_0800F5F4:
	lsls r0, r1, 1
	adds r0, r5
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x6
	bls _0800F5F4
_0800F604:
	bl sub_800F0B8
	add sp, 0x58
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800F4F0

	thumb_func_start sub_800F638
sub_800F638: @ 800F638
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, =gUnknown_03005000
	ldr r2, [r0, 0x70]
	mov r10, r2
	movs r5, 0
	adds r2, r0, 0
	adds r2, 0x6E
	ldrh r3, [r2]
	cmp r5, r3
	bge _0800F6D4
	mov r9, r0
	ldr r0, =gUnknown_03000D90
	mov r8, r0
_0800F65A:
	movs r0, 0x1
	ands r0, r1
	lsrs r7, r1, 1
	adds r6, r5, 0x1
	cmp r0, 0
	bne _0800F6C8
	ldr r1, =0xffff8900
	adds r0, r1, 0
	adds r1, r5, 0
	orrs r1, r0
	mov r2, r8
	strh r1, [r2]
	movs r4, 0
	lsls r0, r5, 1
	ldr r3, =gUnknown_03000D80
	mov r12, r3
	adds r0, r5
	lsls r0, 2
	mov r1, r10
	adds r2, r0, r1
	mov r3, r8
	adds r3, 0x2
_0800F686:
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	ldrb r0, [r2]
	orrs r0, r1
	strh r0, [r3]
	adds r2, 0x2
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x6
	ble _0800F686
	movs r4, 0
	ldr r2, =gUnknown_03000D90
	ldr r1, =gUnknown_03000D80
_0800F6A0:
	ldrh r0, [r2]
	lsrs r0, 8
	strb r0, [r1, 0x1]
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x6
	ble _0800F6A0
	ldr r0, =gUnknown_030059E8
	mov r1, r12
	bl sub_800D888
	movs r1, 0x1
	lsls r1, r5
	mov r2, r9
	ldr r0, [r2, 0x78]
	orrs r0, r1
	str r0, [r2, 0x78]
_0800F6C8:
	adds r1, r7, 0
	adds r5, r6, 0
	ldr r3, =gUnknown_0300506E
	ldrh r3, [r3]
	cmp r5, r3
	blt _0800F65A
_0800F6D4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800F638

	thumb_func_start sub_800F6FC
sub_800F6FC: @ 800F6FC
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, =gUnknown_03005000
	ldrb r2, [r0, 0xC]
	cmp r2, 0x1
	bne _0800F71C
	cmp r1, 0
	beq _0800F71C
	adds r0, 0x61
	adds r0, r1, r0
	strb r2, [r0]
	b _0800F724
	.pool
_0800F71C:
	adds r0, 0x5C
	adds r0, r1, r0
	movs r1, 0x1
	strb r1, [r0]
_0800F724:
	pop {r0}
	bx r0
	thumb_func_end sub_800F6FC

	thumb_func_start sub_800F728
sub_800F728: @ 800F728
	lsls r0, 24
	lsrs r0, 24
	ldr r3, =gUnknown_03005000
	adds r1, r3, 0
	adds r1, 0x5C
	adds r1, r0, r1
	movs r2, 0
	strb r2, [r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	adds r1, 0x92
	strb r2, [r1]
	bx lr
	.pool
	thumb_func_end sub_800F728

	thumb_func_start sub_800F74C
sub_800F74C: @ 800F74C
	push {r4,r5,lr}
	adds r3, r0, 0
	ldr r0, =gUnknown_03005000
	ldrb r1, [r0, 0xC]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _0800F764
	movs r0, 0
	b _0800F786
	.pool
_0800F764:
	movs r2, 0
	ldr r0, =0x00000cde
	adds r4, r5, r0
_0800F76A:
	adds r1, r2, r4
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _0800F76A
	ldr r1, =0x00000c3e
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r0, r3
	ldrb r0, [r0]
_0800F786:
	pop {r4,r5}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800F74C

	thumb_func_start rfu_func_080F97B8
rfu_func_080F97B8: @ 800F794
	push {lr}
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800F7C6
	ldr r3, =gUnknown_03005DA8
	ldrh r2, [r3]
	cmp r2, 0
	beq _0800F7C6
	ldr r0, =gUnknown_030022B4
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0800F7C6
	ldr r1, =gUnknown_03000D78
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldrb r0, [r1]
	lsls r0, 8
	orrs r0, r2
	strh r0, [r3]
	movs r0, 0xBE
	lsls r0, 8
	bl sub_800FD14
_0800F7C6:
	pop {r0}
	bx r0
	.pool
	thumb_func_end rfu_func_080F97B8

	thumb_func_start sub_800F7DC
sub_800F7DC: @ 800F7DC
	ldr r0, =gUnknown_02022B14
	bx lr
	.pool
	thumb_func_end sub_800F7DC

	thumb_func_start sub_800F7E4
sub_800F7E4: @ 800F7E4
	push {lr}
	movs r2, 0
	ldr r0, =gUnknown_03005000
	ldr r1, [r0]
	ldr r0, =rfu_func_080F97B8
	cmp r1, r0
	bne _0800F7F4
	movs r2, 0x1
_0800F7F4:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800F7E4

	thumb_func_start sub_800F804
sub_800F804: @ 800F804
	ldr r1, =gUnknown_03005000
	ldr r0, =rfu_func_080F97B8
	str r0, [r1]
	bx lr
	.pool
	thumb_func_end sub_800F804

	thumb_func_start Rfu_set_zero
Rfu_set_zero: @ 800F814
	ldr r1, =gUnknown_03005000
	movs r0, 0
	str r0, [r1]
	bx lr
	.pool
	thumb_func_end Rfu_set_zero

	thumb_func_start sub_800F820
sub_800F820: @ 800F820
	push {lr}
	movs r0, 0x88
	lsls r0, 7
	bl sub_800FD14
	bl link_get_multiplayer_id
	lsls r0, 24
	cmp r0, 0
	bne _0800F83C
	bl sub_8082D18
	ldr r1, =gUnknown_03003110
	strh r0, [r1, 0xC]
_0800F83C:
	ldr r1, =gUnknown_020223C0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800F820

	thumb_func_start sub_800F850
sub_800F850: @ 800F850
	push {lr}
	ldr r1, =gUnknown_03005000
	ldr r0, [r1]
	cmp r0, 0
	bne _0800F85E
	ldr r0, =sub_800F820
	str r0, [r1]
_0800F85E:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800F850

	thumb_func_start sub_800F86C
sub_800F86C: @ 800F86C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0
	mov r8, r0
_0800F87A:
	mov r1, r8
	lsls r0, r1, 4
	ldr r2, =gUnknown_03003090
	adds r1, r0, r2
	ldrh r7, [r1]
	movs r3, 0xFF
	lsls r3, 8
	adds r1, r3, 0
	ands r1, r7
	movs r2, 0x88
	lsls r2, 8
	adds r5, r0, 0
	cmp r1, r2
	beq _0800F960
	cmp r1, r2
	bgt _0800F8D6
	movs r0, 0xCC
	lsls r0, 7
	cmp r1, r0
	bne _0800F8A4
	b _0800FAE0
_0800F8A4:
	cmp r1, r0
	bgt _0800F8C4
	movs r0, 0x88
	lsls r0, 7
	cmp r1, r0
	bne _0800F8B2
	b _0800FBF4
_0800F8B2:
	movs r0, 0xBE
	lsls r0, 7
	cmp r1, r0
	bne _0800F8BC
	b _0800FAD0
_0800F8BC:
	b _0800FC04
	.pool
_0800F8C4:
	movs r0, 0xEE
	lsls r0, 7
	cmp r1, r0
	beq _0800F920
	movs r0, 0xF0
	lsls r0, 7
	cmp r1, r0
	beq _0800F90E
	b _0800FC04
_0800F8D6:
	movs r0, 0xBE
	lsls r0, 8
	cmp r1, r0
	bne _0800F8E0
	b _0800FBF4
_0800F8E0:
	cmp r1, r0
	bgt _0800F8F8
	movs r0, 0x89
	lsls r0, 8
	cmp r1, r0
	beq _0800F9C8
	movs r0, 0xA1
	lsls r0, 8
	cmp r1, r0
	bne _0800F8F6
	b _0800FAAC
_0800F8F6:
	b _0800FC04
_0800F8F8:
	movs r0, 0xED
	lsls r0, 8
	cmp r1, r0
	bne _0800F902
	b _0800FB10
_0800F902:
	movs r0, 0xEE
	lsls r0, 8
	cmp r1, r0
	bne _0800F90C
	b _0800FBB0
_0800F90C:
	b _0800FC04
_0800F90E:
	ldr r4, =gUnknown_03005000
	ldrb r0, [r4, 0xC]
	cmp r0, 0
	bne _0800F920
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800F920
	b _0800FC50
_0800F920:
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0]
	mov r6, r8
	adds r6, 0x1
	cmp r0, 0
	beq _0800F930
	b _0800FC08
_0800F930:
	ldr r1, =gUnknown_03003092
	adds r0, r5, r1
	ldrh r0, [r0]
	ldr r2, =gUnknown_03005000
	strb r0, [r2, 0xD]
	ldr r3, =gUnknown_03003094
	adds r0, r5, r3
	bl sub_800F74C
	ldr r4, =gUnknown_03005CCE
	strb r0, [r4]
	b _0800FC08
	.pool
_0800F960:
	ldr r0, =gUnknown_03005000
	mov r9, r0
	mov r1, r8
	lsls r0, r1, 2
	add r0, r8
	lsls r7, r0, 2
	mov r2, r9
	adds r3, r7, r2
	movs r4, 0x92
	adds r4, r3
	mov r12, r4
	ldrb r4, [r4]
	mov r6, r8
	adds r6, 0x1
	cmp r4, 0
	beq _0800F982
	b _0800FC08
_0800F982:
	adds r0, r3, 0
	adds r0, 0x80
	movs r2, 0
	strh r4, [r0]
	ldr r1, =gUnknown_03003092
	adds r0, r5, r1
	ldrh r0, [r0]
	adds r1, r3, 0
	adds r1, 0x82
	strh r0, [r1]
	ldr r1, =gUnknown_03003094
	adds r0, r5, r1
	ldrh r1, [r0]
	adds r0, r3, 0
	adds r0, 0x91
	strb r1, [r0]
	mov r0, r9
	adds r0, 0x88
	adds r0, r7, r0
	str r4, [r0]
	movs r0, 0x1
	mov r3, r12
	strb r0, [r3]
	mov r0, r9
	adds r0, 0x5C
	add r0, r8
	strb r2, [r0]
	b _0800FC08
	.pool
_0800F9C8:
	ldr r4, =gUnknown_03005000
	mov r9, r4
	mov r0, r8
	lsls r1, r0, 2
	adds r0, r1, r0
	lsls r4, r0, 2
	mov r3, r9
	adds r2, r4, r3
	adds r0, r2, 0
	adds r0, 0x92
	ldrb r3, [r0]
	mov r10, r1
	mov r6, r8
	adds r6, 0x1
	cmp r3, 0x1
	beq _0800F9EA
	b _0800FC08
_0800F9EA:
	movs r0, 0xFF
	ands r0, r7
	adds r2, 0x80
	strh r0, [r2]
	mov r1, r9
	adds r1, 0x88
	adds r1, r4, r1
	lsls r3, r0
	ldr r0, [r1]
	orrs r0, r3
	str r0, [r1]
	movs r4, 0
	ldr r0, =gUnknown_020223C4
	mov r9, r0
	mov r12, r2
	mov r1, r8
	lsls r7, r1, 8
	adds r3, r5, 0
_0800FA0E:
	mov r2, r12
	ldrh r0, [r2]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	adds r1, r4
	lsls r1, 1
	adds r1, r7
	add r1, r9
	adds r2, r4, 0x1
	lsls r0, r2, 1
	adds r0, r3
	ldr r4, =gUnknown_03003090
	adds r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r2, 16
	lsrs r4, r2, 16
	cmp r4, 0x5
	bls _0800FA0E
	ldr r4, =gUnknown_03005000
	mov r0, r10
	add r0, r8
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x88
	adds r1, r0, r1
	adds r2, r0, r4
	adds r0, r2, 0
	adds r0, 0x82
	ldrh r0, [r0]
	lsls r0, 2
	ldr r3, =gUnknown_082ED628
	adds r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	beq _0800FA5C
	b _0800FC08
_0800FA5C:
	adds r1, r2, 0
	adds r1, 0x92
	movs r0, 0x2
	strb r0, [r1]
	mov r1, r8
	lsls r0, r1, 24
	lsrs r0, 24
	bl sub_800F6FC
	bl sub_800F7DC
	ldrb r1, [r0, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x45
	beq _0800FA7E
	b _0800FC08
_0800FA7E:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800FA88
	b _0800FC08
_0800FA88:
	ldrb r0, [r4, 0xC]
	cmp r0, 0
	beq _0800FA90
	b _0800FC08
_0800FA90:
	ldr r0, =gUnknown_020223C4
	bl sub_8010A70
	b _0800FC08
	.pool
_0800FAAC:
	ldr r2, =gUnknown_082ED6B8
	ldr r3, =gUnknown_03003092
	adds r0, r5, r3
	ldrh r1, [r0]
	lsls r1, 3
	adds r0, r1, r2
	ldr r0, [r0]
	adds r2, 0x4
	adds r1, r2
	ldrh r1, [r1]
	bl sub_800FE84
	b _0800FC04
	.pool
_0800FAD0:
	ldr r1, =gUnknown_030050E4
	add r1, r8
	movs r0, 0x1
	strb r0, [r1]
	b _0800FC04
	.pool
_0800FAE0:
	ldr r2, =gUnknown_03005000
	movs r4, 0x80
	lsls r4, 1
	adds r0, r2, r4
	ldr r3, =gUnknown_03003092
	adds r1, r5, r3
	ldrh r0, [r0]
	mov r6, r8
	adds r6, 0x1
	ldrh r1, [r1]
	cmp r0, r1
	beq _0800FAFA
	b _0800FC08
_0800FAFA:
	adds r0, r2, 0
	adds r0, 0xE9
	add r0, r8
	movs r1, 0x1
	strb r1, [r0]
	b _0800FC08
	.pool
_0800FB10:
	ldr r7, =gUnknown_03005000
	ldrb r2, [r7, 0xC]
	cmp r2, 0
	bne _0800FB78
	ldr r3, =gUnknown_03003124
	ldrb r0, [r3]
	mov r6, r8
	adds r6, 0x1
	cmp r0, 0
	beq _0800FC08
	ldr r0, =gUnknown_03003092
	adds r4, r5, r0
	ldrh r1, [r4]
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0, 0x2]
	ands r1, r0
	cmp r1, 0
	beq _0800FB48
	strb r2, [r3]
	bl sub_800D630
	ldr r1, =gUnknown_03003094
	adds r0, r5, r1
	ldrh r1, [r0]
	ldr r2, =0x00000ce4
	adds r0, r7, r2
	strb r1, [r0]
_0800FB48:
	ldr r0, =gUnknown_03003090
	adds r0, 0x6
	adds r0, r5, r0
	ldrh r0, [r0]
	strb r0, [r7, 0xD]
	ldrh r0, [r4]
	bl sub_80109E8
	b _0800FC08
	.pool
_0800FB78:
	movs r0, 0xEE
	lsls r0, 8
	bl sub_800FD14
	ldr r1, =gUnknown_03003110
	ldr r3, =gUnknown_03003092
	adds r0, r5, r3
	ldrh r0, [r0]
	strh r0, [r1, 0x2]
	ldr r4, =gUnknown_03003094
	adds r0, r5, r4
	ldrh r0, [r0]
	strh r0, [r1, 0x4]
	ldr r0, =gUnknown_03003090
	adds r0, 0x6
	adds r0, r5, r0
	ldrh r0, [r0]
	strh r0, [r1, 0x6]
	b _0800FC04
	.pool
_0800FBB0:
	ldr r4, =gUnknown_03005000
	ldrb r0, [r4, 0xC]
	mov r6, r8
	adds r6, 0x1
	cmp r0, 0x1
	bne _0800FC44
	ldr r0, =0x00000ce3
	adds r2, r4, r0
	ldr r1, =gUnknown_03003092
	adds r3, r5, r1
	ldrb r1, [r3]
	ldrb r0, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r2, =gUnknown_03003094
	adds r0, r5, r2
	ldrh r1, [r0]
	ldr r2, =0x00000ce4
	adds r0, r4, r2
	strb r1, [r0]
	ldrh r0, [r3]
	bl sub_80109E8
	b _0800FC08
	.pool
_0800FBF4:
	ldr r0, =gUnknown_03003020
	mov r3, r8
	lsls r1, r3, 1
	adds r1, r0
	ldr r4, =gUnknown_03003092
	adds r0, r5, r4
	ldrh r0, [r0]
	strh r0, [r1]
_0800FC04:
	mov r6, r8
	adds r6, 0x1
_0800FC08:
	ldr r3, =gUnknown_03005000
	ldrb r4, [r3, 0xC]
	cmp r4, 0x1
	bne _0800FC44
	adds r0, r3, 0
	adds r0, 0x61
	mov r1, r8
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r1, r0, 0
	cmp r1, 0
	beq _0800FC44
	cmp r1, 0x4
	bne _0800FC40
	adds r0, r3, 0
	adds r0, 0x5C
	add r0, r8
	movs r1, 0
	strb r4, [r0]
	strb r1, [r2]
	b _0800FC44
	.pool
_0800FC40:
	adds r0, 0x1
	strb r0, [r2]
_0800FC44:
	lsls r0, r6, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0x4
	bhi _0800FC50
	b _0800F87A
_0800FC50:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_800F86C

	thumb_func_start sub_800FC60
sub_800FC60: @ 800FC60
	push {lr}
	movs r2, 0
	ldr r0, =gUnknown_03005000
	adds r1, r0, 0
	adds r1, 0x92
_0800FC6A:
	ldrb r0, [r1]
	cmp r0, 0
	beq _0800FC78
	movs r0, 0
	b _0800FC82
	.pool
_0800FC78:
	adds r1, 0x14
	adds r2, 0x1
	cmp r2, 0x4
	ble _0800FC6A
	movs r0, 0x1
_0800FC82:
	pop {r1}
	bx r1
	thumb_func_end sub_800FC60

	thumb_func_start sub_800FC88
sub_800FC88: @ 800FC88
	push {r4,lr}
	movs r1, 0
	ldr r2, =gUnknown_03005000
	ldrb r0, [r2, 0xD]
	cmp r1, r0
	bge _0800FCBC
	adds r4, r0, 0
	adds r3, r2, 0
	adds r3, 0x92
	adds r2, 0x5C
_0800FC9C:
	ldrb r0, [r3]
	cmp r0, 0x2
	bne _0800FCAA
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0800FCB4
_0800FCAA:
	movs r0, 0
	b _0800FCBE
	.pool
_0800FCB4:
	adds r3, 0x14
	adds r1, 0x1
	cmp r1, r4
	blt _0800FC9C
_0800FCBC:
	movs r0, 0x1
_0800FCBE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_800FC88

	thumb_func_start sub_800FCC4
sub_800FCC4: @ 800FCC4
	movs r2, 0
	movs r1, 0
	strh r1, [r0]
	strh r1, [r0, 0x2]
	str r1, [r0, 0x4]
	str r1, [r0, 0x8]
	strb r2, [r0, 0x10]
	strb r2, [r0, 0x11]
	strb r2, [r0, 0x12]
	bx lr
	thumb_func_end sub_800FCC4

	thumb_func_start sub_800FCD8
sub_800FCD8: @ 800FCD8
	push {r4,lr}
	movs r2, 0
	movs r1, 0
	ldr r0, =gUnknown_03005000
	adds r3, r0, 0
	adds r3, 0x92
	adds r4, r0, 0
	adds r4, 0x5C
_0800FCE8:
	ldrb r0, [r3]
	cmp r0, 0x2
	bne _0800FCFE
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800FCFE
	lsls r0, r1
	orrs r2, r0
	lsls r0, r2, 24
	lsrs r2, r0, 24
_0800FCFE:
	adds r3, 0x14
	adds r1, 0x1
	cmp r1, 0x4
	ble _0800FCE8
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800FCD8

	thumb_func_start sub_800FD14
sub_800FD14: @ 800FD14
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r5, =gUnknown_03003110
	strh r1, [r5]
	movs r0, 0xF0
	lsls r0, 7
	adds r4, r5, 0
	cmp r1, r0
	beq _0800FDB0
	cmp r1, r0
	bgt _0800FD62
	movs r0, 0xBE
	lsls r0, 7
	cmp r1, r0
	beq _0800FE00
	cmp r1, r0
	bgt _0800FD50
	movs r0, 0xBC
	lsls r0, 6
	cmp r1, r0
	beq _0800FE20
	movs r0, 0x88
	lsls r0, 7
	cmp r1, r0
	beq _0800FE14
	b _0800FE46
	.pool
_0800FD50:
	movs r0, 0xCC
	lsls r0, 7
	cmp r1, r0
	beq _0800FE00
	movs r0, 0xEE
	lsls r0, 7
	cmp r1, r0
	beq _0800FDB0
	b _0800FE46
_0800FD62:
	movs r0, 0xBE
	lsls r0, 8
	cmp r1, r0
	beq _0800FE40
	cmp r1, r0
	bgt _0800FE46
	movs r0, 0x88
	lsls r0, 8
	cmp r1, r0
	beq _0800FD80
	movs r0, 0xA1
	lsls r0, 8
	cmp r1, r0
	beq _0800FD98
	b _0800FE46
_0800FD80:
	ldr r0, =gUnknown_03005000
	adds r1, r0, 0
	adds r1, 0x6E
	ldrh r1, [r1]
	strh r1, [r5, 0x2]
	adds r0, 0x7D
	ldrb r0, [r0]
	adds r0, 0x80
	strh r0, [r5, 0x4]
	b _0800FE46
	.pool
_0800FD98:
	bl sub_800FC60
	lsls r0, 24
	cmp r0, 0
	beq _0800FE46
	ldr r0, =gUnknown_03005000
	adds r0, 0x5A
	ldrb r0, [r0]
	b _0800FE44
	.pool
_0800FDB0:
	ldr r3, =gUnknown_03005000
	ldr r1, =0x00000ce2
	adds r0, r3, r1
	ldr r2, =0x00000ce3
	adds r1, r3, r2
	ldrb r2, [r0]
	ldrb r0, [r1]
	eors r0, r2
	ldr r1, =gUnknown_082ED695
	adds r0, r1
	ldrb r0, [r0]
	adds r0, 0x1
	strb r0, [r3, 0xD]
	ldrb r0, [r3, 0xD]
	strh r0, [r4, 0x2]
	adds r2, r4, 0x4
	movs r4, 0
	ldr r0, =0x00000cde
	adds r3, r0
_0800FDD6:
	adds r1, r2, r4
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0800FDD6
	b _0800FE46
	.pool
_0800FE00:
	ldr r0, =gUnknown_03005000
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r4, 0x2]
	b _0800FE46
	.pool
_0800FE14:
	strh r1, [r5]
	ldr r0, =gMain
	ldrh r0, [r0, 0x2C]
	b _0800FE44
	.pool
_0800FE20:
	movs r4, 0
	ldr r3, =gUnknown_030050F2
_0800FE24:
	adds r2, r4, 0x1
	lsls r1, r2, 1
	adds r1, r5
	lsls r0, r4, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r4, 0x5
	bls _0800FE24
	b _0800FE46
	.pool
_0800FE40:
	ldr r0, =gUnknown_03005DA8
	ldrh r0, [r0]
_0800FE44:
	strh r0, [r5, 0x2]
_0800FE46:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800FD14

	thumb_func_start sub_800FE50
sub_800FE50: @ 800FE50
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, =gUnknown_03003110
	ldrh r0, [r0]
	cmp r0, 0
	bne _0800FE76
	bl sub_8011A80
	cmp r0, 0
	bne _0800FE76
	ldr r0, =gUnknown_030050F2
	adds r1, r4, 0
	movs r2, 0xC
	bl memcpy
	movs r0, 0xBC
	lsls r0, 6
	bl sub_800FD14
_0800FE76:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800FE50

	thumb_func_start sub_800FE84
@ bool8 sub_800FE84(u32 a1, u32 size)
sub_800FE84: @ 800FE84
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	adds r6, r1, 0
	ldr r5, =gUnknown_03005000
	ldr r0, [r5]
	cmp r0, 0
	bne _0800FEB8
	ldr r0, =gUnknown_03003110
	ldrh r0, [r0]
	cmp r0, 0
	bne _0800FEB8
	movs r0, 0x7C
	adds r0, r5
	mov r9, r0
	ldrb r1, [r0]
	mov r8, r1
	cmp r1, 0
	beq _0800FEC8
	ldr r1, =gUnknown_02022B44
	adds r1, 0x83
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0800FEB8:
	movs r0, 0
	b _0800FF32
	.pool
_0800FEC8:
	adds r0, r6, 0
	movs r1, 0xC
	bl __umodsi3
	negs r4, r0
	orrs r4, r0
	lsrs r4, 31
	bl link_get_multiplayer_id
	adds r1, r5, 0
	adds r1, 0x7D
	strb r0, [r1]
	movs r0, 0x1
	mov r1, r9
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0xC
	bl __udivsi3
	adds r0, r4
	adds r1, r5, 0
	adds r1, 0x6E
	strh r0, [r1]
	adds r0, r5, 0
	adds r0, 0x6C
	mov r1, r8
	strh r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	cmp r6, r0
	bls _0800FF0A
	str r7, [r5, 0x70]
	b _0800FF1C
_0800FF0A:
	ldr r4, =gUnknown_020228C4
	cmp r7, r4
	beq _0800FF1A
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl memcpy
_0800FF1A:
	str r4, [r5, 0x70]
_0800FF1C:
	movs r0, 0x88
	lsls r0, 8
	bl sub_800FD14
	ldr r0, =gUnknown_03005000
	ldr r1, =rfufunc_80F9F44
	str r1, [r0]
	adds r0, 0x5B
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
_0800FF32:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_800FE84

	thumb_func_start rfufunc_80F9F44
rfufunc_80F9F44: @ 800FF4C
	push {r4,r5,lr}
	ldr r0, =gUnknown_03003110
	ldrh r0, [r0]
	cmp r0, 0
	bne _0800FFA0
	movs r5, 0x88
	lsls r5, 8
	adds r0, r5, 0
	bl sub_800FD14
	ldr r4, =gUnknown_03005000
	ldrb r0, [r4, 0xC]
	cmp r0, 0x1
	bne _0800FF84
	adds r1, r4, 0
	adds r1, 0x5B
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bls _0800FFA0
	b _0800FF9C
	.pool
_0800FF84:
	bl link_get_multiplayer_id
	ldr r1, =gUnknown_03003090
	lsls r0, 24
	lsrs r0, 20
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, r5
	bne _0800FFA0
_0800FF9C:
	ldr r0, =sub_800FFB0
	str r0, [r4]
_0800FFA0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end rfufunc_80F9F44

	thumb_func_start sub_800FFB0
sub_800FFB0: @ 800FFB0
	push {r4-r6,lr}
	ldr r0, =gUnknown_03005000
	mov r12, r0
	ldr r5, [r0, 0x70]
	ldr r3, =gUnknown_03003110
	mov r2, r12
	adds r2, 0x6C
	ldrh r1, [r2]
	movs r4, 0x89
	lsls r4, 8
	adds r0, r4, 0
	orrs r0, r1
	strh r0, [r3]
	movs r4, 0
	adds r6, r2, 0
	adds r3, 0x2
_0800FFD0:
	lsls r2, r4, 1
	ldrh r1, [r6]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	lsls r1, 8
	ldrb r0, [r0]
	orrs r0, r1
	strh r0, [r3]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x6
	ble _0800FFD0
	mov r0, r12
	adds r0, 0x6C
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	adds r0, 0x2
	ldrh r0, [r0]
	lsls r1, 16
	lsrs r1, 16
	cmp r0, r1
	bhi _08010014
	mov r0, r12
	adds r0, 0x7C
	movs r1, 0
	strb r1, [r0]
	ldr r0, =rfufunc_80FA020
	mov r1, r12
	str r0, [r1]
_08010014:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_800FFB0

	thumb_func_start rfufunc_80FA020
rfufunc_80FA020: @ 8010028
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r5, =gUnknown_03005000
	ldr r0, [r5, 0x70]
	mov r8, r0
	bl link_get_multiplayer_id
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _080100F0
	ldr r3, =gUnknown_03003110
	adds r2, r5, 0
	adds r2, 0x6E
	ldrh r0, [r2]
	subs r0, 0x1
	ldr r4, =0xffff8900
	adds r1, r4, 0
	orrs r0, r1
	strh r0, [r3]
	movs r4, 0
	mov r9, r5
	ldr r0, =gUnknown_03003090
	mov r12, r0
	lsls r5, r6, 4
	adds r7, r2, 0
	adds r3, 0x2
_08010064:
	lsls r2, r4, 1
	ldrh r1, [r7]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	add r0, r8
	adds r1, r0, 0
	subs r1, 0xB
	ldrb r1, [r1]
	lsls r1, 8
	subs r0, 0xC
	ldrb r0, [r0]
	orrs r0, r1
	strh r0, [r3]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x6
	ble _08010064
	mov r1, r12
	adds r0, r5, r1
	ldrb r1, [r0]
	mov r3, r9
	adds r0, r3, 0
	adds r0, 0x6E
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bne _080100F4
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x88
	adds r1, r0, r1
	ldr r2, =gUnknown_082ED628
	adds r0, r3
	adds r0, 0x82
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	beq _080100E8
	adds r0, r6, 0
	bl sub_800F638
	ldr r1, =gUnknown_02022B44
	adds r1, 0x64
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080100F4
	.pool
_080100E8:
	movs r0, 0
	mov r4, r9
	str r0, [r4]
	b _080100F4
_080100F0:
	movs r0, 0
	str r0, [r5]
_080100F4:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end rfufunc_80FA020

	thumb_func_start sub_8010100
sub_8010100: @ 8010100
	push {lr}
	ldr r1, =gUnknown_03005000
	adds r1, 0x5A
	strb r0, [r1]
	movs r0, 0xA1
	lsls r0, 8
	bl sub_800FD14
	movs r0, 0x1
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8010100

	thumb_func_start sub_801011C
sub_801011C: @ 801011C
	push {lr}
	bl rfu_clearAllSlot
	bl sub_800C048
	ldr r1, =gUnknown_03003124
	movs r0, 0
	strb r0, [r1]
	ldr r2, =gUnknown_03005000
	adds r3, r2, 0
	adds r3, 0xEF
	movs r1, 0
	movs r0, 0x1
	strb r0, [r3]
	str r1, [r2]
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801011C

	thumb_func_start sub_8010148
sub_8010148: @ 8010148
	push {lr}
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
	ldrb r0, [r0, 0x3]
	orrs r0, r1
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	bl sub_801011C
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010148

	thumb_func_start sub_8010168
sub_8010168: @ 8010168
	push {r4,lr}
	ldr r4, =gUnknown_03005000
	ldrb r0, [r4, 0xC]
	cmp r0, 0
	bne _08010188
	bl sub_800D630
	ldr r0, =0x00000ce4
	adds r1, r4, r0
	movs r0, 0x2
	strb r0, [r1]
	b _0801018C
	.pool
_08010188:
	ldr r0, =sub_8010148
	str r0, [r4]
_0801018C:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010168

	thumb_func_start sub_8010198
sub_8010198: @ 8010198
	push {lr}
	bl sub_800D630
	ldr r2, =gUnknown_03005000
	ldr r0, =0x00000ce4
	adds r1, r2, r0
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, =gUnknown_03007890
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	ldrb r1, [r1, 0x3]
	orrs r0, r1
	ldr r1, =0x00000ce3
	adds r2, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010198

	thumb_func_start sub_80101CC
sub_80101CC: @ 80101CC
	push {r4,r5,lr}
	ldr r0, =gUnknown_03005000
	ldrb r5, [r0, 0xD]
	movs r2, 0
	movs r1, 0
	adds r3, r0, 0
	adds r4, r3, 0
	adds r4, 0xE4
_080101DC:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080101E6
	adds r2, 0x1
_080101E6:
	adds r1, 0x1
	cmp r1, 0x4
	ble _080101DC
	cmp r2, r5
	bne _08010220
	ldr r2, =gBattleTypeFlags
	ldr r0, [r2]
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	str r0, [r2]
	ldrb r0, [r3, 0xC]
	cmp r0, 0
	bne _0801021C
	adds r0, r3, 0
	adds r0, 0xEE
	ldrb r1, [r0]
	movs r1, 0x3
	strb r1, [r0]
	bl sub_8010168
	b _08010220
	.pool
_0801021C:
	ldr r0, =sub_8010168
	str r0, [r3]
_08010220:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80101CC

	thumb_func_start sub_801022C
sub_801022C: @ 801022C
	push {r4,lr}
	ldr r0, =gUnknown_03003110
	ldrh r0, [r0]
	cmp r0, 0
	bne _0801024E
	ldr r4, =gUnknown_03005000
	ldr r1, =0x00000ce8
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801024E
	movs r0, 0xBE
	lsls r0, 7
	bl sub_800FD14
	ldr r0, =sub_80101CC
	str r0, [r4]
_0801024E:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801022C

	thumb_func_start sub_8010264
sub_8010264: @ 8010264
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, =gUnknown_03005000
	ldr r0, [r2]
	cmp r0, 0
	bne _08010284
	ldr r1, =0x00000cd9
	adds r0, r2, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, =sub_801022C
	str r0, [r2]
	adds r0, r3, 0
	bl DestroyTask
_08010284:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010264

	thumb_func_start task_add_05_task_del_08FA224_when_no_RfuFunc
task_add_05_task_del_08FA224_when_no_RfuFunc: @ 8010294
	push {r4,lr}
	ldr r4, =sub_8010264
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _080102AC
	adds r0, r4, 0
	movs r1, 0x5
	bl CreateTask
_080102AC:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end task_add_05_task_del_08FA224_when_no_RfuFunc

	thumb_func_start sub_80102B8
sub_80102B8: @ 80102B8
	push {r4,r5,lr}
	bl link_get_multiplayer_id
	lsls r0, 24
	cmp r0, 0
	beq _080102E6
	ldr r1, =gUnknown_03005000
	ldr r2, =0x000009e6
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r4, r0, 0
	cmp r4, 0
	bne _080102E6
	adds r5, r1, 0
	adds r5, 0xFE
	ldrh r0, [r5]
	cmp r0, 0x3C
	bls _080102E6
	movs r0, 0xCC
	lsls r0, 7
	bl sub_800FD14
	strh r4, [r5]
_080102E6:
	bl sub_8009FCC
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	cmp r1, r2
	bcs _08010312
	ldr r0, =gUnknown_03005000
	adds r3, r0, 0
	adds r3, 0xE9
	ldrb r0, [r3]
	cmp r0, 0
	beq _08010312
_08010300:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	bcs _08010312
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _08010300
_08010312:
	ldr r4, =gUnknown_03005000
	cmp r1, r2
	bne _0801033E
	movs r1, 0
	adds r3, r4, 0
	adds r3, 0xE9
	movs r2, 0
_08010320:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _08010320
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, r1
	ldrh r1, [r0]
	adds r1, 0x1
	movs r2, 0
	strh r1, [r0]
	str r2, [r4]
_0801033E:
	adds r1, r4, 0
	adds r1, 0xFE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80102B8

	thumb_func_start sub_8010358
sub_8010358: @ 8010358
	push {r4,lr}
	ldr r4, =gUnknown_03005000
	ldr r1, =0x000009e6
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801037A
	ldr r0, =gUnknown_03003110
	ldrh r0, [r0]
	cmp r0, 0
	bne _0801037A
	movs r0, 0xCC
	lsls r0, 7
	bl sub_800FD14
	ldr r0, =sub_80102B8
	str r0, [r4]
_0801037A:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010358

	thumb_func_start sub_8010390
sub_8010390: @ 8010390
	push {r4,lr}
	bl link_get_multiplayer_id
	lsls r0, 24
	cmp r0, 0
	beq _080103CC
	ldr r4, =gUnknown_03005000
	ldr r1, =0x000009e6
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801041E
	ldr r0, =gUnknown_03003110
	ldrh r0, [r0]
	cmp r0, 0
	bne _0801041E
	movs r0, 0xCC
	lsls r0, 7
	bl sub_800FD14
	ldr r0, =sub_80102B8
	b _0801041C
	.pool
_080103CC:
	bl sub_8009FCC
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0x1
	cmp r1, r2
	bcs _080103FA
	ldr r3, =gUnknown_03005000
	adds r0, r3, 0
	adds r0, 0xEA
	ldrb r0, [r0]
	cmp r0, 0
	beq _080103FA
	adds r3, 0xE9
_080103E8:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	bcs _080103FA
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _080103E8
_080103FA:
	cmp r1, r2
	bne _0801041E
	ldr r4, =gUnknown_03005000
	ldr r1, =0x000009e6
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801041E
	ldr r0, =gUnknown_03003110
	ldrh r0, [r0]
	cmp r0, 0
	bne _0801041E
	movs r0, 0xCC
	lsls r0, 7
	bl sub_800FD14
	ldr r0, =sub_8010358
_0801041C:
	str r0, [r4]
_0801041E:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010390

	thumb_func_start sub_8010434
sub_8010434: @ 8010434
	push {lr}
	ldr r1, =gUnknown_03005000
	ldr r2, [r1]
	cmp r2, 0
	bne _08010448
	ldr r0, =sub_8010390
	str r0, [r1]
	adds r0, r1, 0
	adds r0, 0xFE
	strh r2, [r0]
_08010448:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010434

	thumb_func_start sub_8010454
sub_8010454: @ 8010454
	push {r4,lr}
	adds r3, r0, 0
	ldr r1, =gUnknown_082ED6E0
	ldrh r0, [r1]
	cmp r0, r3
	beq _08010482
	ldr r4, =0x0000ffff
	adds r2, r1, 0
_08010464:
	ldrh r0, [r2]
	cmp r0, r4
	bne _08010478
	movs r0, 0
	b _08010484
	.pool
_08010478:
	adds r1, 0x2
	adds r2, 0x2
	ldrh r0, [r1]
	cmp r0, r3
	bne _08010464
_08010482:
	movs r0, 0x1
_08010484:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8010454

	thumb_func_start sub_801048C
sub_801048C: @ 801048C
	push {lr}
	cmp r0, 0
	beq _080104A0
	movs r1, 0x96
	lsls r1, 2
	movs r0, 0x1
	bl sub_800D550
	movs r0, 0
	b _080104AC
_080104A0:
	movs r0, 0
	movs r1, 0
	bl sub_800D550
	lsls r0, 24
	lsrs r0, 24
_080104AC:
	pop {r1}
	bx r1
	thumb_func_end sub_801048C

	thumb_func_start sub_80104B0
sub_80104B0: @ 80104B0
	push {lr}
	ldr r0, =gUnknown_03005000
	ldr r1, =0x00000cd9
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	movs r0, 0
	bl sub_800C27C
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80104B0

	thumb_func_start rfu_get_multiplayer_id
rfu_get_multiplayer_id: @ 80104D0
	push {lr}
	ldr r1, =gUnknown_03005000
	ldrb r0, [r1, 0xC]
	cmp r0, 0x1
	beq _080104EC
	ldr r2, =0x00000cce
	adds r0, r1, r2
	ldrb r0, [r0]
	b _080104EE
	.pool
_080104EC:
	movs r0, 0
_080104EE:
	pop {r1}
	bx r1
	thumb_func_end rfu_get_multiplayer_id

	thumb_func_start sub_80104F4
sub_80104F4: @ 80104F4
	ldr r0, =gUnknown_03005000
	ldrb r0, [r0, 0xD]
	bx lr
	.pool
	thumb_func_end sub_80104F4

	thumb_func_start sub_8010500
sub_8010500: @ 8010500
	push {lr}
	ldr r2, =gUnknown_03005000
	adds r0, r2, 0
	adds r0, 0xF1
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08010518
	movs r0, 0
	b _08010524
	.pool
_08010518:
	movs r1, 0
	ldr r0, [r2]
	cmp r0, 0
	bne _08010522
	movs r1, 0x1
_08010522:
	adds r0, r1, 0
_08010524:
	pop {r1}
	bx r1
	thumb_func_end sub_8010500

	thumb_func_start sub_8010528
sub_8010528: @ 8010528
	push {lr}
	ldr r0, =gUnknown_03005000
	ldr r0, [r0]
	cmp r0, 0
	beq _08010536
	bl _call_via_r0
_08010536:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010528

	thumb_func_start sub_8010540
sub_8010540: @ 8010540
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r7, 0
	movs r5, 0
	ldr r6, =gUnknown_03005000
	ldr r0, =0x00000c3e
	adds r0, r6
	mov r8, r0
_08010552:
	ldr r1, =0x00000cd1
	adds r0, r6, r1
	adds r4, r5, r0
	ldrb r0, [r4]
	subs r0, 0x5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080105DA
	ldr r1, =gUnknown_03007880
	lsls r0, r5, 2
	adds r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, 0x34]
	cmp r0, 0x46
	beq _08010576
	cmp r0, 0x48
	bne _080105C0
_08010576:
	ldr r2, =0x00000cd5
	adds r0, r6, r2
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, 0x8
	bne _080105DA
	movs r0, 0x9
	strb r0, [r4]
	movs r0, 0xA
	strb r0, [r1]
	lsls r1, r5, 24
	lsrs r1, 24
	movs r0, 0x8
	bl rfu_clearSlot
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r5
	lsrs r0, 24
	movs r1, 0x8
	adds r2, r4, 0
	movs r3, 0x1
	bl rfu_NI_setSendData
	movs r7, 0x1
	b _080105DA
	.pool
_080105C0:
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, 0x34]
	cmp r0, 0x47
	bne _080105DA
	lsls r1, r5, 24
	lsrs r1, 24
	movs r0, 0x8
	bl rfu_clearSlot
_080105DA:
	adds r5, 0x1
	cmp r5, 0x3
	ble _08010552
	adds r0, r7, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8010540

	thumb_func_start sub_80105EC
sub_80105EC: @ 80105EC
	push {r4-r6,lr}
	movs r3, 0
	movs r1, 0
	ldr r5, =gUnknown_03005CD5
	movs r6, 0x1
	movs r4, 0
_080105F8:
	adds r2, r1, r5
	ldrb r0, [r2]
	cmp r0, 0xB
	bne _0801060C
	adds r0, r6, 0
	lsls r0, r1
	orrs r3, r0
	lsls r0, r3, 24
	lsrs r3, r0, 24
	strb r4, [r2]
_0801060C:
	adds r1, 0x1
	cmp r1, 0x3
	ble _080105F8
	cmp r3, 0
	beq _08010620
	adds r0, r3, 0
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
_08010620:
	movs r1, 0
	ldr r2, =gUnknown_03005CD5
_08010624:
	adds r0, r1, r2
	ldrb r0, [r0]
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0801063C
	movs r0, 0x1
	b _08010644
	.pool
_0801063C:
	adds r1, 0x1
	cmp r1, 0x3
	ble _08010624
	movs r0, 0
_08010644:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80105EC

	thumb_func_start sub_801064C
sub_801064C: @ 801064C
	push {lr}
	adds r2, r0, 0
	adds r0, r1, 0
	lsls r2, 16
	lsrs r2, 16
	adds r1, r2, 0
	bl sub_8011CE4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _08010680
	ldr r0, =gUnknown_03005000
	ldr r2, =0x00000cd1
	adds r0, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0x9
	beq _08010680
	movs r0, 0
	b _08010682
	.pool
_08010680:
	movs r0, 0x1
_08010682:
	pop {r1}
	bx r1
	thumb_func_end sub_801064C

	thumb_func_start sub_8010688
sub_8010688: @ 8010688
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r0, r2, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r1, 16
	lsrs r1, 16
	bl sub_8011CE4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, =gUnknown_03005000
	ldr r0, =0x00000cd1
	adds r5, r0
	adds r5, r4, r5
	strb r6, [r5]
	movs r0, 0x4
	adds r1, r4, 0
	bl rfu_clearSlot
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r4
	lsrs r0, 24
	movs r1, 0x8
	adds r2, r5, 0
	movs r3, 0x1
	bl rfu_NI_setSendData
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010688

	thumb_func_start sub_80106D4
sub_80106D4: @ 80106D4
	push {r4,r5,lr}
	ldr r4, =gUnknown_03005000
	ldr r0, =0x00000c85
	adds r5, r4, r0
	movs r0, 0x8
	strb r0, [r5]
	ldr r0, =0x00000c3e
	adds r4, r0
	ldrb r1, [r4]
	movs r0, 0x4
	bl rfu_clearSlot
	ldrb r1, [r4]
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r1
	lsrs r0, 24
	movs r1, 0x8
	adds r2, r5, 0
	movs r3, 0x1
	bl rfu_NI_setSendData
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80106D4

	thumb_func_start sub_8010714
sub_8010714: @ 8010714
	push {lr}
	adds r2, r0, 0
	adds r0, r1, 0
	lsls r2, 16
	lsrs r2, 16
	adds r1, r2, 0
	bl sub_8011CE4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _08010730
	movs r0, 0x2
	b _0801074A
_08010730:
	ldr r1, =gUnknown_03007880
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0
	beq _08010748
	movs r0, 0
	b _0801074A
	.pool
_08010748:
	movs r0, 0x1
_0801074A:
	pop {r1}
	bx r1
	thumb_func_end sub_8010714

	thumb_func_start sub_8010750
sub_8010750: @ 8010750
	push {r4,r5,lr}
	bl sub_8010540
	movs r4, 0
	ldr r0, =gUnknown_03005000
	ldr r1, =0x00000cd5
	adds r5, r0, r1
_0801075E:
	ldr r1, =gUnknown_03007880
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, 0x26
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _08010788
	adds r1, r4, r5
	ldrb r0, [r1]
	cmp r0, 0xA
	bne _0801077E
	movs r0, 0xB
	strb r0, [r1]
_0801077E:
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0x4
	bl rfu_clearSlot
_08010788:
	adds r4, 0x1
	cmp r4, 0x3
	ble _0801075E
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010750

	thumb_func_start sub_80107A0
sub_80107A0: @ 80107A0
	push {r4,r5,lr}
	movs r4, 0
	ldr r1, =gUnknown_03005000
	ldr r2, =0x00000c85
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _080107DA
	ldr r2, =gUnknown_03007880
	ldr r0, =0x00000c3e
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x26
	beq _080107D2
	ldrb r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x27
	bne _080107DA
_080107D2:
	ldrb r1, [r1]
	movs r0, 0x4
	bl rfu_clearSlot
_080107DA:
	ldr r2, =gUnknown_03007880
	ldr r5, =gUnknown_03005000
	ldr r0, =0x00000c3e
	adds r1, r5, r0
	ldrb r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, 0x34]
	cmp r0, 0x46
	beq _080107FE
	ldrb r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, 0x34]
	cmp r0, 0x48
	bne _0801082C
_080107FE:
	ldrb r1, [r1]
	movs r0, 0x8
	bl rfu_clearSlot
	ldr r2, =0x00000c86
	adds r4, r5, r2
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8011A64
	ldrb r4, [r4]
	b _08010844
	.pool
_0801082C:
	ldrb r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, 0x34]
	cmp r0, 0x47
	bne _08010844
	ldrb r1, [r1]
	movs r0, 0x8
	bl rfu_clearSlot
	movs r4, 0x6
_08010844:
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80107A0

	thumb_func_start sub_801084C
sub_801084C: @ 801084C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, =gUnknown_03005000
	adds r0, r5, 0
	adds r0, 0xF1
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08010872
	ldr r0, =0x00000ce8
	adds r1, r5, r0
	movs r0, 0
	strb r0, [r1]
	adds r0, r6, 0
	bl DestroyTask
_08010872:
	ldr r2, =gTasks
	lsls r1, r6, 2
	adds r0, r1, r6
	lsls r0, 3
	adds r4, r0, r2
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	adds r7, r1, 0
	cmp r0, 0x3
	beq _0801091C
	cmp r0, 0x3
	bgt _080108A4
	cmp r0, 0x1
	beq _080108CC
	cmp r0, 0x1
	bgt _08010918
	cmp r0, 0
	beq _080108B6
	b _080109D2
	.pool
_080108A4:
	cmp r0, 0x5
	beq _08010950
	cmp r0, 0x5
	blt _0801093E
	cmp r0, 0x6
	beq _08010984
	cmp r0, 0x65
	beq _08010904
	b _080109D2
_080108B6:
	bl sub_800FC60
	lsls r0, 24
	cmp r0, 0
	bne _080108C2
	b _080109D2
_080108C2:
	bl sub_800A5B4
	bl sub_800B348
	b _08010948
_080108CC:
	ldrb r0, [r5, 0xC]
	cmp r0, 0x1
	bne _0801090C
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	beq _080108E8
	movs r0, 0xF0
	lsls r0, 7
	bl sub_800FD14
	b _080108F0
	.pool
_080108E8:
	movs r0, 0xEE
	lsls r0, 7
	bl sub_800FD14
_080108F0:
	ldr r0, =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	movs r0, 0x65
	strh r0, [r1, 0x8]
	b _080109D2
	.pool
_08010904:
	ldr r0, =gUnknown_03003110
	ldrh r0, [r0]
	cmp r0, 0
	bne _080109D2
_0801090C:
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080109D2
	.pool
_08010918:
	ldrb r0, [r5, 0xD]
	b _08010944
_0801091C:
	ldrb r0, [r5, 0xC]
	cmp r0, 0x1
	bne _08010948
	bl sub_800FC60
	lsls r0, 24
	cmp r0, 0
	beq _080109D2
	adds r1, r5, 0
	adds r1, 0x5A
	movs r0, 0
	strb r0, [r1]
	movs r0, 0xA1
	lsls r0, 8
	bl sub_800FD14
	b _08010948
_0801093E:
	bl sub_800FC88
	lsls r0, 24
_08010944:
	cmp r0, 0
	beq _080109D2
_08010948:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080109D2
_08010950:
	movs r4, 0
	ldrb r0, [r5, 0xD]
	cmp r4, r0
	bge _0801096E
_08010958:
	adds r0, r4, 0
	bl sub_800B3A4
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_800F728
	adds r4, 0x1
	ldrb r2, [r5, 0xD]
	cmp r4, r2
	blt _08010958
_0801096E:
	ldr r0, =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080109D2
	.pool
_08010984:
	adds r0, r6, 0
	bl DestroyTask
	ldr r1, =gUnknown_03003124
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, =0x00000ce8
	adds r1, r5, r0
	movs r0, 0
	strb r0, [r1]
	movs r1, 0x96
	lsls r1, 2
	movs r0, 0x1
	bl sub_800D550
	ldr r2, =0x00000ce6
	adds r1, r5, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _080109D2
	movs r4, 0
	adds r2, r1, 0
	movs r3, 0x1
	ldr r0, =0x00000ce5
	adds r5, r0
_080109B6:
	ldrb r0, [r2]
	asrs r0, r4
	ands r0, r3
	cmp r0, 0
	beq _080109CC
	adds r0, r3, 0
	lsls r0, r4
	strb r0, [r5]
	ldrb r1, [r2]
	eors r0, r1
	strb r0, [r2]
_080109CC:
	adds r4, 0x1
	cmp r4, 0x3
	ble _080109B6
_080109D2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801084C

	thumb_func_start sub_80109E8
sub_80109E8: @ 80109E8
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0
	movs r5, 0x1
	ldr r4, =gUnknown_03005CDE
	movs r3, 0
_080109F6:
	adds r0, r2, 0
	asrs r0, r1
	ands r0, r5
	cmp r0, 0
	beq _08010A04
	adds r0, r1, r4
	strb r3, [r0]
_08010A04:
	adds r1, 0x1
	cmp r1, 0x3
	ble _080109F6
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80109E8

	thumb_func_start sub_8010A14
sub_8010A14: @ 8010A14
	push {r4-r7,lr}
	adds r2, r0, 0
	ldr r1, =gUnknown_03005000
	ldrb r0, [r2, 0xF]
	strb r0, [r1, 0xD]
	movs r4, 0
	ldr r0, =0x00000cde
	adds r5, r1, r0
	adds r3, r2, 0
	adds r3, 0x10
_08010A28:
	adds r0, r4, r5
	adds r1, r3, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x3
	ble _08010A28
	adds r6, r2, 0
	ldr r5, =gUnknown_020229E8
	movs r4, 0x4
_08010A3C:
	adds r0, r5, 0
	adds r1, r6, 0
	adds r1, 0x14
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	ldr r1, [r1]
	str r1, [r0]
	adds r0, r5, 0
	bl sub_800B524
	adds r6, 0x1C
	adds r5, 0x1C
	subs r4, 0x1
	cmp r4, 0
	bge _08010A3C
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010A14

	thumb_func_start sub_8010A70
sub_8010A70: @ 8010A70
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, =gUnknown_082ED7EC
	adds r1, r4, 0
	bl strcmp
	adds r5, r0, 0
	cmp r5, 0
	bne _08010A9C
	adds r0, r4, 0
	bl sub_8010A14
	mov r0, sp
	strh r5, [r0]
	ldr r2, =0x0100007e
	adds r1, r4, 0
	bl CpuSet
	movs r0, 0
	bl sub_800A5EC
_08010A9C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010A70

	thumb_func_start sub_8010AAC
sub_8010AAC: @ 8010AAC
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r3, =gUnknown_03005000
	ldr r2, =gUnknown_082ED68C
	ldr r1, =0x00000ce9
	adds r0, r3, r1
	ldrb r1, [r0]
	adds r1, r2
	ldr r2, =0x00000cde
	adds r0, r3, r2
	ldrb r1, [r1]
	adds r0, r1
	ldrb r4, [r0]
	adds r0, r3, 0
	adds r0, 0xF1
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08010AE8
	ldr r5, =0x00000ce8
	adds r1, r3, r5
	movs r0, 0
	strb r0, [r1]
	adds r0, r6, 0
	bl DestroyTask
_08010AE8:
	ldr r0, =gTasks
	lsls r2, r6, 2
	adds r1, r2, r6
	lsls r1, 3
	adds r1, r0
	movs r3, 0x8
	ldrsh r1, [r1, r3]
	adds r3, r0, 0
	adds r7, r2, 0
	cmp r1, 0x5
	bls _08010B00
	b _08010CF0
_08010B00:
	lsls r0, r1, 2
	ldr r1, =_08010B28
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08010B28:
	.4byte _08010B40
	.4byte _08010B60
	.4byte _08010B78
	.4byte _08010BC0
	.4byte _08010C0A
	.4byte _08010C94
_08010B40:
	ldr r0, =gUnknown_03003110
	ldrh r0, [r0]
	cmp r0, 0
	beq _08010B4A
	b _08010CF0
_08010B4A:
	adds r0, r4, 0
	bl sub_800A5EC
	movs r0, 0xF0
	lsls r0, 7
	bl sub_800FD14
	b _08010C4A
	.pool
_08010B60:
	ldr r0, =gUnknown_03003110
	ldrh r0, [r0]
	cmp r0, 0
	beq _08010B6A
	b _08010CF0
_08010B6A:
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r3
	b _08010C52
	.pool
_08010B78:
	bl sub_800A550
	lsls r0, 24
	lsrs r0, 24
	asrs r0, r4
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08010B8C
	b _08010CF0
_08010B8C:
	adds r0, r4, 0
	bl sub_800A5EC
	lsls r2, r4, 8
	ldr r0, =gUnknown_020223C4
	adds r2, r0
	ldr r1, =gUnknown_020229E8
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r1
	adds r1, r0, 0
	adds r2, 0x10
	ldm r2!, {r3-r5}
	stm r1!, {r3-r5}
	ldm r2!, {r3-r5}
	stm r1!, {r3-r5}
	ldr r2, [r2]
	str r2, [r1]
	bl sub_800B524
	b _08010C4A
	.pool
_08010BC0:
	ldr r5, =gUnknown_020228C4
	adds r1, r5, 0
	ldr r0, =gUnknown_082ED7EC
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldrh r2, [r0]
	strh r2, [r1]
	ldrb r0, [r0, 0x2]
	strb r0, [r1, 0x2]
	ldr r1, =gUnknown_03005000
	ldrb r0, [r1, 0xD]
	strb r0, [r5, 0xF]
	movs r2, 0
	adds r4, r5, 0
	adds r4, 0x10
	ldr r0, =0x00000cde
	adds r3, r1, r0
_08010BE2:
	adds r0, r4, r2
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _08010BE2
	ldr r1, =gUnknown_020229E8
	adds r0, r5, 0
	adds r0, 0x14
	movs r2, 0x8C
	bl memcpy
	ldr r0, =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_08010C0A:
	ldr r5, =gUnknown_020228C4
	ldr r1, =gUnknown_03005000
	ldrb r0, [r1, 0xD]
	strb r0, [r5, 0xF]
	movs r2, 0
	ldr r3, =gUnknown_020229E8
	mov r12, r3
	adds r4, r5, 0
	adds r4, 0x10
	ldr r0, =0x00000cde
	adds r3, r1, r0
_08010C20:
	adds r0, r4, r2
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _08010C20
	adds r0, r5, 0
	adds r0, 0x14
	mov r1, r12
	movs r2, 0x8C
	bl memcpy
	ldr r1, =gUnknown_020228C4
	movs r0, 0
	movs r2, 0xA0
	bl link_0800A448
	lsls r0, 24
	cmp r0, 0
	beq _08010CF0
_08010C4A:
	ldr r0, =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
_08010C52:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _08010CF0
	.pool
_08010C74:
	adds r0, r3, 0
	lsls r0, r2
	ldr r2, =0x00000ce5
	adds r1, r5, r2
	strb r0, [r1]
	ldrb r1, [r4]
	eors r0, r1
	strb r0, [r4]
	ldr r4, =0x00000ce8
	adds r0, r5, r4
	strb r3, [r0]
	b _08010CEA
	.pool
_08010C94:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08010CF0
	bl sub_800A550
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08010CF0
	mov r0, sp
	movs r4, 0
	strh r4, [r0]
	ldr r1, =gUnknown_020223C4
	ldr r2, =0x0100007e
	bl CpuSet
	movs r0, 0
	bl sub_800A5EC
	ldr r1, =gUnknown_03005000
	ldr r5, =0x00000ce8
	adds r0, r1, r5
	strb r4, [r0]
	ldr r0, =0x00000ce6
	adds r3, r1, r0
	ldrb r0, [r3]
	cmp r0, 0
	beq _08010CEA
	movs r2, 0
	adds r5, r1, 0
	adds r4, r3, 0
	ldrb r1, [r4]
	movs r3, 0x1
_08010CDA:
	adds r0, r1, 0
	asrs r0, r2
	ands r0, r3
	cmp r0, 0
	bne _08010C74
	adds r2, 0x1
	cmp r2, 0x3
	ble _08010CDA
_08010CEA:
	adds r0, r6, 0
	bl DestroyTask
_08010CF0:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010AAC

	thumb_func_start sub_8010D0C
sub_8010D0C: @ 8010D0C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, =gUnknown_03005000
	adds r0, r6, 0
	adds r0, 0xF1
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08010D2A
	adds r0, r5, 0
	bl DestroyTask
_08010D2A:
	ldr r1, =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08010D70
	cmp r0, 0x1
	bgt _08010D50
	cmp r0, 0
	beq _08010D56
	b _08010DA6
	.pool
_08010D50:
	cmp r0, 0x2
	beq _08010D82
	b _08010DA6
_08010D56:
	ldrb r0, [r6, 0xD]
	cmp r0, 0
	beq _08010DA6
	bl sub_800B348
	ldr r1, =gUnknown_020228C4
	movs r0, 0
	movs r2, 0x3C
	bl link_0800A448
	b _08010D7A
	.pool
_08010D70:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08010DA6
_08010D7A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08010DA6
_08010D82:
	bl sub_800A550
	movs r4, 0x1
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _08010DA6
	ldr r0, =gUnknown_020223C4
	bl sub_8010A14
	movs r0, 0
	bl sub_800A5EC
	ldr r0, =gUnknown_03003124
	strb r4, [r0]
	adds r0, r5, 0
	bl DestroyTask
_08010DA6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010D0C

	thumb_func_start sub_8010DB4
sub_8010DB4: @ 8010DB4
	push {r4-r7,lr}
	ldr r0, =gUnknown_03005000
	adds r1, r0, 0
	adds r1, 0xEE
	ldrb r1, [r1]
	adds r3, r0, 0
	cmp r1, 0x1
	bne _08010E5C
	ldr r2, =gUnknown_03004140
	ldrb r0, [r2, 0x2]
	cmp r0, 0
	bne _08010E5C
	ldr r0, =gMain
	ldr r1, [r0, 0x4]
	ldr r0, =sub_8018438
	cmp r1, r0
	beq _08010DDE
	ldr r0, [r2, 0x3C]
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _08010DE4
_08010DDE:
	ldr r1, =gLinkVSyncDisabled
	movs r0, 0x2
	strb r0, [r1]
_08010DE4:
	ldr r4, =c2_800ACD4
	adds r0, r4, 0
	bl SetMainCallback2
	ldr r0, =gMain
	str r4, [r0, 0x8]
	ldr r5, =gUnknown_03005000
	ldrh r0, [r5, 0xA]
	lsls r4, r0, 16
	ldrh r0, [r5, 0x10]
	lsls r0, 8
	orrs r4, r0
	ldrh r0, [r5, 0x12]
	orrs r4, r0
	ldr r1, =0x000009e6
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r7, r0, 0
	ldr r1, =0x00000c1a
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r6, r0, 0
	bl sub_8011A74
	movs r3, 0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08010E20
	movs r3, 0x1
_08010E20:
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl sub_800AF18
	adds r0, r5, 0
	adds r0, 0xEE
	ldrb r1, [r0]
	movs r1, 0x2
	strb r1, [r0]
	bl sub_80097E8
	b _08010E8E
	.pool
_08010E5C:
	ldr r1, =0x00000c1b
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08010E70
	ldr r1, =0x000009e7
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08010E8E
_08010E70:
	ldr r0, =gUnknown_03004140
	ldrb r0, [r0, 0x2]
	cmp r0, 0
	beq _08010E7C
	bl sub_800D630
_08010E7C:
	movs r4, 0xE0
	lsls r4, 7
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_8011A64
	adds r0, r4, 0
	bl sub_8011170
_08010E8E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010DB4

	thumb_func_start rfu_REQ_recvData_then_sendData
rfu_REQ_recvData_then_sendData: @ 8010EA0
	push {lr}
	ldr r0, =gUnknown_03004140
	ldrb r0, [r0, 0x6]
	cmp r0, 0x1
	bne _08010EB8
	bl rfu_REQ_recvData
	bl rfu_waitREQComplete
	movs r0, 0
	bl rfu_REQ_sendData_wrapper
_08010EB8:
	pop {r0}
	bx r0
	.pool
	thumb_func_end rfu_REQ_recvData_then_sendData

	thumb_func_start sub_8010EC0
sub_8010EC0: @ 8010EC0
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, =gUnknown_03005000
	ldr r1, =0x00000ccd
	adds r0, r4, r1
	strb r5, [r0]
	bl Random2
	lsls r0, 16
	lsrs r0, 16
	bl sub_800C54C
	adds r0, r4, 0
	adds r0, 0xEF
	ldrb r0, [r0]
	cmp r0, 0
	bne _08010F14
	ldrb r0, [r4, 0xC]
	cmp r0, 0x1
	beq _08010F02
	cmp r0, 0x1
	bgt _08010EFC
	cmp r0, 0
	beq _08010F08
	b _08010F14
	.pool
_08010EFC:
	cmp r0, 0x2
	beq _08010F10
	b _08010F14
_08010F02:
	bl sub_800F0F8
	b _08010F14
_08010F08:
	bl sub_800F4F0
	adds r5, r0, 0
	b _08010F14
_08010F10:
	bl rfu_REQ_recvData_then_sendData
_08010F14:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8010EC0

	thumb_func_start sub_8010F1C
sub_8010F1C: @ 8010F1C
	push {r4,lr}
	movs r4, 0
	ldr r1, =gUnknown_03005000
	adds r0, r1, 0
	adds r0, 0xEF
	ldrb r0, [r0]
	cmp r0, 0
	bne _08010F3C
	ldrb r0, [r1, 0xC]
	cmp r0, 0x1
	bne _08010F38
	bl sub_800F1E0
	adds r4, r0, 0
_08010F38:
	bl sub_8010DB4
_08010F3C:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8010F1C

	thumb_func_start sub_8010F48
sub_8010F48: @ 8010F48
	push {lr}
	ldr r0, =gUnknown_02022B22
	ldr r1, =gSaveBlock2Ptr
	ldr r1, [r1]
	bl StringCopy
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010F48

	thumb_func_start sub_8010F60
sub_8010F60: @ 8010F60
	push {r4,lr}
	ldr r4, =gUnknown_02022B14
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xD
	bl memset
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_800DD94
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010F60

	thumb_func_start sub_8010F84
sub_8010F84: @ 8010F84
	push {r4,lr}
	adds r4, r0, 0
	adds r3, r1, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, =gUnknown_02022B14
	adds r1, r4, 0
	bl sub_800DD94
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010F84

	thumb_func_start sub_8010FA0
sub_8010FA0: @ 8010FA0
	push {r4,r5,lr}
	ldr r5, =gUnknown_02022B14
	movs r4, 0x1
	ands r0, r4
	lsls r0, 4
	ldrb r3, [r5]
	movs r2, 0x11
	negs r2, r2
	ands r2, r3
	orrs r2, r0
	ands r1, r4
	lsls r1, 5
	movs r0, 0x21
	negs r0, r0
	ands r2, r0
	orrs r2, r1
	strb r2, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010FA0

	thumb_func_start sub_8010FCC
sub_8010FCC: @ 8010FCC
	push {r4,r5,lr}
	ldr r5, =gUnknown_02022B14
	lsls r0, 2
	ldrb r4, [r5, 0x9]
	movs r3, 0x3
	ands r3, r4
	orrs r3, r0
	strb r3, [r5, 0x9]
	ldr r3, =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldrh r3, [r5, 0x8]
	ldr r0, =0xfffffc00
	ands r0, r3
	orrs r0, r1
	strh r0, [r5, 0x8]
	lsls r2, 1
	ldrb r1, [r5, 0xB]
	movs r0, 0x1
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0xB]
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8010FCC

	thumb_func_start sub_801100C
sub_801100C: @ 801100C
	push {r4,lr}
	movs r4, 0x80
	ldr r3, =gUnknown_020229E8
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r1, r3
	ldrb r2, [r0, 0x13]
	lsls r2, 3
	orrs r2, r4
	adds r3, 0x4
	adds r1, r3
	ldr r0, [r1]
	movs r1, 0x7
	ands r0, r1
	orrs r0, r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801100C

	thumb_func_start sub_801103C
sub_801103C: @ 801103C
	push {r4,r5,lr}
	ldr r5, =gUnknown_02022B14
	movs r4, 0x1
	b _08011054
	.pool
_08011048:
	adds r0, r4, 0
	bl sub_801100C
	adds r1, r5, r4
	strb r0, [r1, 0x3]
	adds r4, 0x1
_08011054:
	bl sub_8009FCC
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _08011048
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_801103C

	thumb_func_start sub_8011068
sub_8011068: @ 8011068
	push {lr}
	lsls r0, 24
	ldr r2, =gUnknown_02022B14
	lsrs r0, 17
	ldrb r3, [r2, 0xA]
	movs r1, 0x7F
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, 0xA]
	ldr r3, =gUnknown_02022B22
	movs r0, 0
	movs r1, 0x2
	bl rfu_REQ_configGameData
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8011068

	thumb_func_start sub_8011090
sub_8011090: @ 8011090
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0801109E
	bl sub_8010F84
_0801109E:
	ldr r2, =gUnknown_02022B14
	ldr r3, =gUnknown_02022B22
	movs r0, 0
	movs r1, 0x2
	bl rfu_REQ_configGameData
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8011090

	thumb_func_start sub_80110B8
sub_80110B8: @ 80110B8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	bl sub_800F7DC
	ldrb r1, [r0, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x45
	bne _0801114C
	movs r5, 0
	movs r7, 0
	ldr r3, =gUnknown_03005000
	ldr r1, =0x00000ce2
	adds r0, r3, r1
	ldr r2, =0x00000ce3
	adds r1, r3, r2
	ldrb r2, [r0]
	ldrb r0, [r1]
	adds r1, r0, 0
	eors r1, r2
	mov r8, r1
	movs r4, 0
	movs r6, 0x1
	ldr r2, =gUnknown_020229E8
	mov r12, r2
	ldr r0, =0x00000cde
	adds r0, r3
	mov r10, r0
	mov r3, r12
	adds r3, 0x4
_080110FC:
	mov r0, r8
	asrs r0, r4
	ands r0, r6
	cmp r0, 0
	beq _0801113C
	mov r1, r10
	adds r0, r4, r1
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	mov r2, r12
	adds r1, r0, r2
	ldrb r1, [r1, 0x13]
	adds r2, r6, 0
	ands r2, r1
	lsls r2, 3
	adds r0, r3
	ldr r1, [r0]
	movs r0, 0x7
	ands r1, r0
	movs r0, 0x80
	orrs r1, r0
	orrs r2, r1
	lsls r0, r5, 3
	lsls r2, r0
	orrs r7, r2
	adds r5, 0x1
	mov r0, r9
	subs r0, 0x1
	cmp r5, r0
	beq _08011142
_0801113C:
	adds r4, 0x1
	cmp r4, 0x3
	ble _080110FC
_08011142:
	movs r0, 0x45
	adds r1, r7, 0
	movs r2, 0
	bl sub_8011090
_0801114C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80110B8

	thumb_func_start sub_8011170
sub_8011170: @ 8011170
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, =gUnknown_03005000
	adds r3, r2, 0
	adds r3, 0xEE
	ldrb r0, [r3]
	cmp r0, 0
	bne _08011192
	ldr r1, =gUnknown_03004140
	ldrh r0, [r1, 0x14]
	strh r0, [r2, 0x10]
	ldrh r0, [r1, 0x16]
	strh r0, [r2, 0x12]
	strh r4, [r2, 0xA]
	ldrb r0, [r3]
	movs r0, 0x1
	strb r0, [r3]
_08011192:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8011170

	thumb_func_start sub_80111A0
sub_80111A0: @ 80111A0
	ldr r0, =gUnknown_03005000
	adds r0, 0xEE
	ldrb r1, [r0]
	movs r1, 0
	strb r1, [r0]
	bx lr
	.pool
	thumb_func_end sub_80111A0

	thumb_func_start sub_80111B0
sub_80111B0: @ 80111B0
	push {lr}
	adds r2, r0, 0
	cmp r2, 0
	bne _080111C8
	ldr r0, =gUnknown_03005000
	adds r0, 0xEE
	ldrb r1, [r0]
	strb r2, [r0]
	b _080111D2
	.pool
_080111C8:
	ldr r0, =gUnknown_03005000
	adds r0, 0xEE
	ldrb r1, [r0]
	movs r1, 0x4
	strb r1, [r0]
_080111D2:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80111B0

	thumb_func_start sub_80111DC
sub_80111DC: @ 80111DC
	push {lr}
	ldr r0, =gUnknown_03004140
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8011E94
	ldr r1, =gUnknown_03005000
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80111DC

	thumb_func_start sub_80111FC
sub_80111FC: @ 80111FC
	ldr r1, =gUnknown_03005000
	ldr r0, =sub_80111DC
	str r0, [r1]
	bx lr
	.pool
	thumb_func_end sub_80111FC

	thumb_func_start sub_801120C
sub_801120C: @ 801120C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r6, 0
	cmp r4, 0x32
	bne _08011222
	b _08011360
_08011222:
	cmp r4, 0x32
	bgt _08011252
	cmp r4, 0x13
	bgt _08011240
	cmp r4, 0x12
	blt _08011230
	b _080113EE
_08011230:
	cmp r4, 0x10
	bne _08011236
	b _080113EE
_08011236:
	cmp r4, 0x10
	bgt _0801128C
	cmp r4, 0
	beq _0801127E
	b _080113EE
_08011240:
	cmp r4, 0x30
	bne _08011246
	b _0801136C
_08011246:
	cmp r4, 0x30
	ble _0801124C
	b _08011354
_0801124C:
	cmp r4, 0x14
	beq _08011328
	b _080113EE
_08011252:
	cmp r4, 0x44
	bgt _08011264
	cmp r4, 0x42
	blt _0801125C
	b _080113EE
_0801125C:
	cmp r4, 0x33
	bne _08011262
	b _0801136C
_08011262:
	b _080113EE
_08011264:
	cmp r4, 0xF3
	bne _0801126A
	b _080113BA
_0801126A:
	cmp r4, 0xF3
	bgt _08011276
	cmp r4, 0xF0
	bge _08011274
	b _080113EE
_08011274:
	b _080113D4
_08011276:
	cmp r4, 0xFF
	bne _0801127C
	b _080113D4
_0801127C:
	b _080113EE
_0801127E:
	ldr r1, =gUnknown_03005000
	movs r0, 0x2
	strh r0, [r1, 0x4]
	b _080113EE
	.pool
_0801128C:
	ldr r0, =gUnknown_03004140
	ldrh r0, [r0, 0x14]
	bl sub_80115EC
	movs r5, 0
	movs r0, 0x1
	mov r8, r0
	ldr r1, =gUnknown_03005000
	mov r9, r1
	ldr r3, =0x00000cd5
	add r3, r9
	mov r10, r3
	movs r7, 0x7F
_080112A6:
	ldr r0, =gUnknown_03004140
	ldrh r0, [r0, 0x14]
	asrs r0, r5
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _0801130E
	ldr r0, =gUnknown_03007890
	lsls r1, r5, 5
	adds r1, 0x14
	ldr r0, [r0]
	adds r0, r1
	ldrb r0, [r0, 0x10]
	adds r4, r7, 0
	ands r4, r0
	bl sub_800F7DC
	ldrb r1, [r0, 0xA]
	adds r0, r7, 0
	ands r0, r1
	cmp r4, r0
	bne _08011304
	ldr r0, =0x00000cd1
	add r0, r9
	adds r0, r5, r0
	movs r1, 0
	strb r1, [r0]
	mov r3, r10
	adds r2, r5, r3
	strb r1, [r2]
	movs r0, 0x20
	adds r1, r5, 0
	movs r3, 0x1
	bl rfu_setRecvBuffer
	b _0801130E
	.pool
_08011304:
	mov r0, r8
	lsls r0, r5
	orrs r6, r0
	lsls r0, r6, 24
	lsrs r6, r0, 24
_0801130E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _080112A6
	cmp r6, 0
	beq _080113EE
	adds r0, r6, 0
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	b _080113EE
_08011328:
	ldr r4, =gUnknown_03005000
	ldr r1, =0x00000ce7
	adds r0, r4, r1
	ldr r1, =gUnknown_03004140
	ldrb r2, [r0]
	ldrb r0, [r1]
	cmp r2, r0
	beq _08011342
	eors r0, r2
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
_08011342:
	movs r0, 0x11
	strh r0, [r4, 0x4]
	b _080113EE
	.pool
_08011354:
	ldr r0, =gUnknown_03005000
	adds r0, 0xF0
	b _080113EA
	.pool
_08011360:
	ldr r0, =gUnknown_03005000
	adds r0, 0xF0
	movs r1, 0x3
	b _080113EC
	.pool
_0801136C:
	ldr r1, =gUnknown_03005000
	adds r2, r1, 0
	adds r2, 0xF0
	movs r0, 0x4
	strb r0, [r2]
	ldr r3, =0x00000ce2
	adds r1, r3
	ldr r0, =gUnknown_03004140
	ldrb r2, [r0, 0x14]
	ldrb r0, [r1]
	adds r3, r0, 0
	bics r3, r2
	adds r2, r3, 0
	strb r2, [r1]
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080113B0
	cmp r2, 0
	bne _080113AC
	adds r0, r4, 0
	bl sub_8011170
	b _080113B0
	.pool
_080113AC:
	bl sub_80111FC
_080113B0:
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_8011A64
	b _080113EE
_080113BA:
	movs r0, 0x1
	movs r1, 0xF3
	bl sub_8011A64
	movs r0, 0xF3
	bl sub_8011170
	ldr r0, =gUnknown_03005000
	adds r0, 0xEF
	b _080113EA
	.pool
_080113D4:
	adds r0, r4, 0
	bl sub_8011170
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_8011A64
	ldr r0, =gUnknown_03005000
	ldr r1, =0x00000cdb
	adds r0, r1
	ldrb r1, [r0]
_080113EA:
	movs r1, 0x1
_080113EC:
	strb r1, [r0]
_080113EE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801120C

	thumb_func_start sub_8011404
sub_8011404: @ 8011404
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x31
	bne _08011410
	b _08011570
_08011410:
	cmp r4, 0x31
	bgt _0801143E
	cmp r4, 0x22
	beq _08011494
	cmp r4, 0x22
	bgt _0801142C
	cmp r4, 0x20
	beq _0801147C
	cmp r4, 0x20
	ble _08011426
	b _080115DE
_08011426:
	cmp r4, 0
	beq _0801146E
	b _080115DE
_0801142C:
	cmp r4, 0x24
	beq _080114BA
	cmp r4, 0x24
	blt _080114B0
	cmp r4, 0x25
	beq _08011504
	cmp r4, 0x30
	beq _0801150E
	b _080115DE
_0801143E:
	cmp r4, 0x44
	bgt _08011454
	cmp r4, 0x42
	blt _08011448
	b _080115DE
_08011448:
	cmp r4, 0x33
	beq _08011522
	cmp r4, 0x33
	bge _08011452
	b _0801158C
_08011452:
	b _080115DE
_08011454:
	cmp r4, 0xF3
	bne _0801145A
	b _080115AC
_0801145A:
	cmp r4, 0xF3
	bgt _08011466
	cmp r4, 0xF0
	bge _08011464
	b _080115DE
_08011464:
	b _080115C4
_08011466:
	cmp r4, 0xFF
	bne _0801146C
	b _080115C4
_0801146C:
	b _080115DE
_0801146E:
	ldr r1, =gUnknown_03005000
	movs r0, 0x6
	strh r0, [r1, 0x4]
	b _080115DE
	.pool
_0801147C:
	ldr r0, =gUnknown_03005000
	ldr r1, =gUnknown_03004140
	ldrh r1, [r1, 0x14]
	ldr r2, =0x00000ccd
	adds r0, r2
	b _080115DC
	.pool
_08011494:
	ldr r0, =gUnknown_03005000
	ldr r1, =gUnknown_03004140
	ldrh r1, [r1, 0x14]
	ldr r2, =0x00000c3e
	adds r0, r2
	ldrb r2, [r0]
	b _080115DC
	.pool
_080114B0:
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_8011A64
	b _080115DE
_080114BA:
	ldr r4, =gUnknown_03005000
	movs r1, 0
	movs r0, 0xB
	strh r0, [r4, 0x4]
	ldr r2, =0x00000c85
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, =0x00000c86
	adds r2, r4, r0
	strb r1, [r2]
	ldr r1, =0x00000c3e
	adds r5, r4, r1
	ldrb r1, [r5]
	movs r0, 0x20
	movs r3, 0x1
	bl rfu_setRecvBuffer
	ldrb r1, [r5]
	ldr r2, =0x00000c3f
	adds r4, r2
	movs r0, 0x10
	adds r2, r4, 0
	movs r3, 0x46
	bl rfu_setRecvBuffer
	b _080115DE
	.pool
_08011504:
	movs r0, 0x2
	movs r1, 0x25
	bl sub_8011A64
	b _080115DE
_0801150E:
	ldr r0, =gUnknown_03005000
	adds r2, r0, 0
	adds r2, 0xF0
	movs r1, 0x2
	strb r1, [r2]
	ldr r1, =0x00000c86
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x6
	beq _080115DE
_08011522:
	ldr r2, =gUnknown_03005000
	adds r1, r2, 0
	adds r1, 0xF0
	ldrb r0, [r1]
	cmp r0, 0x2
	beq _08011532
	movs r0, 0x4
	strb r0, [r1]
_08011532:
	ldr r1, =0x00000c86
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x9
	beq _08011544
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_8011A64
_08011544:
	ldr r0, =gUnknown_082ED7FC
	movs r1, 0x5
	movs r2, 0x5
	bl nullsub_5
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080115DE
	adds r0, r4, 0
	bl sub_8011170
	b _080115DE
	.pool
_08011570:
	ldr r0, =gUnknown_03005000
	adds r0, 0xF0
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, =gUnknown_082ED814
	movs r1, 0x5
	movs r2, 0x5
	bl nullsub_5
	b _080115DE
	.pool
_0801158C:
	ldr r1, =gUnknown_03005000
	adds r2, r1, 0
	adds r2, 0xF0
	movs r0, 0x3
	strb r0, [r2]
	ldr r2, =0x00000c3c
	adds r1, r2
	ldrb r0, [r1]
	movs r0, 0x1
	strb r0, [r1]
	b _080115DE
	.pool
_080115AC:
	movs r0, 0x1
	movs r1, 0xF3
	bl sub_8011A64
	movs r0, 0xF3
	bl sub_8011170
	ldr r0, =gUnknown_03005000
	adds r0, 0xEF
	b _080115DA
	.pool
_080115C4:
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_8011A64
	adds r0, r4, 0
	bl sub_8011170
	ldr r0, =gUnknown_03005000
	ldr r1, =0x00000cdb
	adds r0, r1
	ldrb r1, [r0]
_080115DA:
	movs r1, 0x1
_080115DC:
	strb r1, [r0]
_080115DE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8011404

	thumb_func_start sub_80115EC
sub_80115EC: @ 80115EC
	push {r4-r6,lr}
	adds r3, r0, 0
	movs r2, 0
	movs r6, 0x1
	ldr r0, =gUnknown_03005000
	ldr r4, =0x00000cea
	adds r1, r0, r4
	movs r5, 0
	movs r4, 0xFF
_080115FE:
	adds r0, r3, 0
	asrs r0, r2
	ands r0, r6
	cmp r0, 0
	beq _08011610
	strb r5, [r1]
	ldrb r0, [r1, 0x4]
	orrs r0, r4
	strb r0, [r1, 0x4]
_08011610:
	adds r1, 0x1
	adds r2, 0x1
	cmp r2, 0x3
	ble _080115FE
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80115EC

	thumb_func_start sub_8011628
sub_8011628: @ 8011628
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r3, 0
	movs r2, 0
	movs r4, 0x1
	ldr r6, =gUnknown_03007890
	movs r7, 0x7F
_08011636:
	adds r0, r5, 0
	asrs r0, r2
	ands r0, r4
	cmp r0, 0
	beq _0801165C
	lsls r1, r2, 5
	adds r1, 0x14
	ldr r0, [r6]
	adds r0, r1
	ldrb r1, [r0, 0x10]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0x45
	bne _0801165C
	adds r0, r4, 0
	lsls r0, r2
	orrs r3, r0
	lsls r0, r3, 24
	lsrs r3, r0, 24
_0801165C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _08011636
	adds r0, r3, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8011628

	thumb_func_start sub_8011674
sub_8011674: @ 8011674
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x25
	bne _08011680
	b _080118EC
_08011680:
	cmp r4, 0x25
	bgt _080116C2
	cmp r4, 0x14
	bne _0801168A
	b _08011804
_0801168A:
	cmp r4, 0x14
	bgt _080116A2
	cmp r4, 0x11
	beq _08011722
	cmp r4, 0x11
	ble _08011698
	b _08011A42
_08011698:
	cmp r4, 0
	beq _0801170C
	cmp r4, 0x10
	beq _08011718
	b _08011A42
_080116A2:
	cmp r4, 0x22
	bne _080116A8
	b _08011868
_080116A8:
	cmp r4, 0x22
	bgt _080116B4
	cmp r4, 0x20
	bne _080116B2
	b _08011850
_080116B2:
	b _08011A42
_080116B4:
	cmp r4, 0x23
	bne _080116BA
	b _08011884
_080116BA:
	cmp r4, 0x24
	bne _080116C0
	b _080118BA
_080116C0:
	b _08011A42
_080116C2:
	cmp r4, 0x44
	bgt _080116F2
	cmp r4, 0x42
	blt _080116CC
	b _08011A42
_080116CC:
	cmp r4, 0x32
	bne _080116D2
	b _08011914
_080116D2:
	cmp r4, 0x32
	bgt _080116E4
	cmp r4, 0x30
	bne _080116DC
	b _08011940
_080116DC:
	cmp r4, 0x31
	bne _080116E2
	b _080118F6
_080116E2:
	b _08011A42
_080116E4:
	cmp r4, 0x33
	bne _080116EA
	b _08011948
_080116EA:
	cmp r4, 0x40
	bne _080116F0
	b _080119FC
_080116F0:
	b _08011A42
_080116F2:
	cmp r4, 0xF3
	bne _080116F8
	b _08011A0C
_080116F8:
	cmp r4, 0xF3
	bgt _08011704
	cmp r4, 0xF0
	bge _08011702
	b _08011A42
_08011702:
	b _08011A28
_08011704:
	cmp r4, 0xFF
	bne _0801170A
	b _08011A28
_0801170A:
	b _08011A42
_0801170C:
	ldr r1, =gUnknown_03005000
	movs r0, 0x11
	strh r0, [r1, 0x4]
	b _08011A42
	.pool
_08011718:
	movs r0, 0x4
	movs r1, 0
	bl sub_8011A64
	b _08011A42
_08011722:
	bl sub_800F7DC
	ldrb r1, [r0, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x45
	bne _080117DC
	ldr r5, =gUnknown_03005000
	ldr r1, =0x00000cd9
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080117DC
	ldr r0, =gUnknown_03004140
	ldrh r0, [r0, 0x14]
	bl sub_8011628
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080117A6
	adds r0, r4, 0
	bl sub_800E87C
	movs r2, 0x1
	mov r12, r2
	mov r1, r12
	lsls r1, r0
	lsls r1, 24
	lsrs r1, 24
	ldr r7, =0x00000ce6
	adds r6, r5, r7
	ldrb r2, [r6]
	cmp r2, 0
	bne _08011798
	ldr r0, =0x00000ce8
	adds r3, r5, r0
	ldrb r0, [r3]
	cmp r0, 0
	bne _08011798
	subs r7, 0x1
	adds r0, r5, r7
	strb r1, [r0]
	eors r1, r4
	orrs r1, r2
	strb r1, [r6]
	mov r0, r12
	strb r0, [r3]
	b _080117A6
	.pool
_08011798:
	ldr r0, =gUnknown_03005000
	ldr r1, =0x00000ce6
	adds r0, r1
	ldrb r2, [r0]
	adds r1, r4, 0
	orrs r1, r2
	strb r1, [r0]
_080117A6:
	ldr r0, =gUnknown_03004140
	ldrh r1, [r0, 0x14]
	cmp r4, r1
	beq _080117F6
	ldr r2, =gUnknown_03005000
	ldr r7, =0x00000ce3
	adds r3, r2, r7
	adds r0, r4, 0
	eors r0, r1
	ldrb r1, [r3]
	orrs r0, r1
	strb r0, [r3]
	ldr r0, =0x00000ce4
	adds r2, r0
	movs r0, 0x2
	strb r0, [r2]
	b _080117F6
	.pool
_080117DC:
	bl sub_800F7DC
	ldrb r1, [r0, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x54
	bne _080117F6
	ldr r0, =gUnknown_03004140
	ldrb r0, [r0]
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
_080117F6:
	ldr r0, =gUnknown_03004140
	ldrh r0, [r0, 0x14]
	bl sub_80115EC
	b _08011A42
	.pool
_08011804:
	bl sub_800F7DC
	ldrb r1, [r0, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x45
	beq _08011836
	ldr r4, =gUnknown_03004140
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1
	bls _08011836
	ldrb r0, [r4, 0x14]
	bl sub_800E87C
	movs r1, 0x80
	lsls r1, 17
	lsls r1, r0
	lsrs r1, 24
	ldrb r0, [r4]
	eors r1, r0
	adds r0, r1, 0
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
_08011836:
	ldr r1, =gUnknown_03005000
	ldrh r0, [r1, 0x4]
	cmp r0, 0xF
	beq _08011840
	b _08011A42
_08011840:
	movs r0, 0x10
	strh r0, [r1, 0x4]
	b _08011A42
	.pool
_08011850:
	ldr r0, =gUnknown_03005000
	ldr r1, =gUnknown_03004140
	ldrh r1, [r1, 0x14]
	ldr r2, =0x00000ccd
	adds r0, r2
	b _08011A40
	.pool
_08011868:
	ldr r0, =gUnknown_03005000
	ldr r1, =gUnknown_03004140
	ldrh r1, [r1, 0x14]
	ldr r7, =0x00000c3e
	adds r0, r7
	ldrb r2, [r0]
	b _08011A40
	.pool
_08011884:
	ldr r1, =gUnknown_03005000
	movs r0, 0x12
	strh r0, [r1, 0x4]
	ldr r0, =0x00000ccf
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x1
	bhi _080118B0
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, =sub_801209C
	movs r1, 0x2
	bl CreateTask
	b _08011A42
	.pool
_080118B0:
	movs r0, 0x2
	movs r1, 0x23
	bl sub_8011A64
	b _08011A42
_080118BA:
	ldr r4, =gUnknown_03005000
	movs r0, 0xD
	strh r0, [r4, 0x4]
	movs r0, 0x3
	movs r1, 0
	bl sub_8011A64
	ldr r1, =0x00000c3e
	adds r0, r4, r1
	ldrb r1, [r0]
	ldr r2, =0x00000c3f
	adds r4, r2
	movs r0, 0x10
	adds r2, r4, 0
	movs r3, 0x46
	bl rfu_setRecvBuffer
	b _08011A42
	.pool
_080118EC:
	movs r0, 0x2
	movs r1, 0x25
	bl sub_8011A64
	b _08011A42
_080118F6:
	ldr r0, =gUnknown_03004140
	ldrb r1, [r0]
	ldrh r0, [r0, 0x14]
	ands r1, r0
	cmp r1, 0
	bne _08011904
	b _08011A42
_08011904:
	ldr r0, =gUnknown_03005000
	adds r0, 0xF0
	movs r1, 0x1
	b _08011A40
	.pool
_08011914:
	ldr r2, =gUnknown_03005000
	adds r1, r2, 0
	adds r1, 0xF0
	movs r0, 0x3
	strb r0, [r1]
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0
	beq _0801192A
	b _08011A42
_0801192A:
	ldr r7, =0x00000c3c
	adds r0, r2, r7
	ldrb r1, [r0]
	movs r1, 0x1
	b _08011A40
	.pool
_08011940:
	ldr r0, =gUnknown_03005000
	adds r0, 0xF0
	movs r1, 0x2
	strb r1, [r0]
_08011948:
	ldr r2, =gUnknown_03005000
	adds r1, r2, 0
	adds r1, 0xF0
	ldrb r0, [r1]
	cmp r0, 0x2
	beq _08011958
	movs r0, 0x4
	strb r0, [r1]
_08011958:
	ldrb r0, [r2, 0xC]
	cmp r0, 0x1
	bne _08011996
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080119B4
	ldr r0, =0x00000ce2
	adds r2, r0
	ldr r0, =gUnknown_03004140
	ldrb r1, [r0, 0x14]
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	cmp r0, 0
	bne _08011990
	adds r0, r4, 0
	bl sub_8011170
	b _080119B4
	.pool
_08011990:
	bl sub_80111FC
	b _080119B4
_08011996:
	ldr r1, =0x00000ce4
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080119B4
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080119B4
	adds r0, r4, 0
	bl sub_8011170
	movs r0, 0
	bl sub_800C27C
_080119B4:
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080119DA
	ldr r0, =gUnknown_03004140
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	bne _080119DA
	ldr r0, =sub_800EB44
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080119DA
	ldr r1, =gUnknown_03005000
	movs r0, 0x11
	strh r0, [r1, 0x4]
_080119DA:
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_8011A64
	b _08011A42
	.pool
_080119FC:
	ldr r0, =gUnknown_03005000
	ldr r2, =0x00000ce3
	adds r0, r2
	b _08011A3E
	.pool
_08011A0C:
	movs r0, 0x1
	movs r1, 0xF3
	bl sub_8011A64
	movs r0, 0xF3
	bl sub_8011170
	ldr r0, =gUnknown_03005000
	adds r0, 0xEF
	movs r1, 0x1
	b _08011A40
	.pool
_08011A28:
	adds r0, r4, 0
	bl sub_8011170
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_8011A64
	ldr r0, =gUnknown_03005000
	ldr r7, =0x00000cdb
	adds r0, r7
	ldrb r1, [r0]
_08011A3E:
	movs r1, 0
_08011A40:
	strb r1, [r0]
_08011A42:
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8011674

	thumb_func_start sub_8011A50
sub_8011A50: @ 8011A50
	ldr r0, =gUnknown_03005000
	ldr r1, =0x00000ce4
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	bx lr
	.pool
	thumb_func_end sub_8011A50

	thumb_func_start sub_8011A64
sub_8011A64: @ 8011A64
	ldr r2, =gUnknown_03005000
	adds r3, r2, 0
	adds r3, 0xF1
	strb r0, [r3]
	strh r1, [r2, 0xA]
	bx lr
	.pool
	thumb_func_end sub_8011A64

	thumb_func_start sub_8011A74
sub_8011A74: @ 8011A74
	ldr r0, =gUnknown_03005000
	adds r0, 0xF1
	ldrb r0, [r0]
	bx lr
	.pool
	thumb_func_end sub_8011A74

	thumb_func_start sub_8011A80
sub_8011A80: @ 8011A80
	push {lr}
	bl sub_8011A74
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x1
	bls _08011A94
	movs r0, 0
	b _08011A96
_08011A94:
	movs r0, 0x1
_08011A96:
	pop {r1}
	bx r1
	thumb_func_end sub_8011A80

	thumb_func_start sub_8011A9C
sub_8011A9C: @ 8011A9C
	ldr r0, =gUnknown_03005000
	ldr r1, =0x00000ce8
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.pool
	thumb_func_end sub_8011A9C

	thumb_func_start sub_8011AB0
sub_8011AB0: @ 8011AB0
	ldr r0, =gUnknown_03005000
	ldrb r0, [r0, 0xC]
	bx lr
	.pool
	thumb_func_end sub_8011AB0

	thumb_func_start LinkVSync
LinkVSync: @ 8011ABC
	push {lr}
	bl rfu_syncVBlank_
	pop {r0}
	bx r0
	thumb_func_end LinkVSync

	thumb_func_start sub_8011AC8
sub_8011AC8: @ 8011AC8
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r1, =gUnknown_03003090
	ldr r2, =0x05000014
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8011AC8

	thumb_func_start sub_8011AE8
sub_8011AE8: @ 8011AE8
	push {lr}
	bl LoadOamFromSprites
	bl ProcessObjectCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8011AE8

	thumb_func_start sub_8011AFC
sub_8011AFC: @ 8011AFC
	push {r4,lr}
	bl ResetAllObjectData
	bl ResetObjectPaletteAllocator
	bl ResetTasks
	bl ResetPaletteFade
	ldr r0, =sub_8011AE8
	bl SetVBlankCallback
	bl sub_80093CC
	lsls r0, 24
	cmp r0, 0
	beq _08011B70
	ldr r1, =gUnknown_020229C6
	ldr r2, =0x00001111
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_800B488
	bl sub_8009734
	ldr r0, =gMain
	ldrh r0, [r0, 0x24]
	bl SeedRng
	movs r4, 0
_08011B38:
	bl Random
	ldr r1, =gSaveBlock2Ptr
	ldr r1, [r1]
	adds r1, 0xA
	adds r1, r4
	strb r0, [r1]
	adds r4, 0x1
	cmp r4, 0x3
	ble _08011B38
	movs r1, 0xAA
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	bl RunTasks
	bl CallObjectCallbacks
	bl PrepareSpritesForOamLoad
	bl UpdatePaletteFade
	bl sub_8011BA4
	ldr r0, =sub_8011BF8
	bl SetMainCallback2
_08011B70:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8011AFC

	thumb_func_start sub_8011B90
sub_8011B90: @ 8011B90
	push {lr}
	ldr r0, =sub_800EB44
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8011B90

	thumb_func_start sub_8011BA4
sub_8011BA4: @ 8011BA4
	push {r4,lr}
	ldr r4, =nullsub_89
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08011BC2
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	ldr r1, =gUnknown_03005000
	adds r1, 0x66
	strb r0, [r1]
_08011BC2:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8011BA4

	thumb_func_start sub_8011BD0
sub_8011BD0: @ 8011BD0
	push {lr}
	ldr r0, =nullsub_89
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08011BEA
	ldr r0, =gUnknown_03005000
	adds r0, 0x66
	ldrb r0, [r0]
	bl DestroyTask
_08011BEA:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8011BD0

	thumb_func_start sub_8011BF8
sub_8011BF8: @ 8011BF8
	push {lr}
	bl RunTasks
	bl CallObjectCallbacks
	bl PrepareSpritesForOamLoad
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8011BF8

	thumb_func_start sub_8011C10
sub_8011C10: @ 8011C10
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r1, =gUnknown_03005000
	movs r0, 0x1
	strb r0, [r1, 0xC]
	bl sub_8010F48
	ldr r0, =sub_801120C
	movs r1, 0
	bl sub_800BF4C
	ldr r2, =gUnknown_02022B2C
	adds r1, r2, 0
	ldr r0, =gUnknown_082ED608
	ldm r0!, {r3,r5,r6}
	stm r1!, {r3,r5,r6}
	ldm r0!, {r3,r5,r6}
	stm r1!, {r3,r5,r6}
	ldr r0, =gUnknown_082ED620
	subs r4, 0x1
	adds r4, r0
	ldrb r0, [r4]
	strh r0, [r2, 0x2]
	bl sub_800EE78
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8011C10

	thumb_func_start sub_8011C5C
sub_8011C5C: @ 8011C5C
	push {lr}
	ldr r1, =gUnknown_03005000
	movs r0, 0
	strb r0, [r1, 0xC]
	bl sub_8010F48
	ldr r0, =sub_8011404
	ldr r1, =sub_800ED34
	bl sub_800BF4C
	bl sub_800EF00
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8011C5C

	thumb_func_start sub_8011C84
sub_8011C84: @ 8011C84
	push {r4-r7,lr}
	ldr r4, =gUnknown_03005000
	movs r5, 0
	movs r0, 0x2
	strb r0, [r4, 0xC]
	bl sub_8010F48
	ldr r0, =sub_8011674
	movs r1, 0
	bl sub_800BF4C
	ldr r2, =gUnknown_02022B2C
	adds r1, r2, 0
	ldr r0, =gUnknown_082ED608
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	strb r5, [r2, 0x11]
	movs r0, 0x96
	lsls r0, 2
	strh r0, [r2, 0x12]
	ldr r0, =sub_800EB44
	movs r1, 0x1
	bl CreateTask
	adds r4, 0x67
	strb r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8011C84

	thumb_func_start sub_8011CD8
sub_8011CD8: @ 8011CD8
	ldrb r1, [r0, 0x1]
	lsls r1, 8
	ldrb r0, [r0]
	orrs r0, r1
	bx lr
	thumb_func_end sub_8011CD8

	thumb_func_start sub_8011CE4
sub_8011CE4: @ 8011CE4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r0, [sp]
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	movs r0, 0xFF
	mov r9, r0
	movs r7, 0
	ldr r1, =gUnknown_03007890
	mov r8, r1
_08011D02:
	lsls r4, r7, 5
	adds r5, r4, 0
	adds r5, 0x14
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5
	adds r0, 0x8
	bl sub_8011CD8
	lsls r0, 16
	lsrs r6, r0, 16
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4
	ldrh r0, [r0, 0x18]
	bl sub_8010454
	cmp r0, 0
	beq _08011D4C
	mov r0, r8
	ldr r1, [r0]
	adds r1, r5
	adds r1, 0x15
	ldr r0, [sp]
	bl StringCompare
	cmp r0, 0
	bne _08011D4C
	cmp r10, r6
	bne _08011D4C
	mov r9, r7
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4
	ldrb r0, [r0, 0x16]
	cmp r0, 0xFF
	bne _08011D56
_08011D4C:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bls _08011D02
_08011D56:
	mov r0, r9
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8011CE4

	thumb_func_start sub_8011D6C
sub_8011D6C: @ 8011D6C
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r0, r6, 24
	lsrs r0, 24
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	ldr r4, =gUnknown_03005000
	ldr r0, =0x00000ce2
	adds r5, r4, r0
	ldrb r0, [r5]
	bics r0, r6
	strb r0, [r5]
	ldr r1, =0x00000cda
	adds r6, r4, r1
	ldrb r1, [r6]
	movs r0, 0x1
	bl rfu_clearSlot
	ldrb r0, [r5]
	ldr r1, =0x00000c87
	adds r4, r1
	adds r1, r4, 0
	movs r2, 0x46
	bl rfu_UNI_setSendData
	ldrb r0, [r5]
	bl sub_800E87C
	strb r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8011D6C

	thumb_func_start sub_8011DC0
sub_8011DC0: @ 8011DC0
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl sub_8011CE4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _08011DDA
	movs r0, 0x1
	lsls r0, r1
	bl sub_8011D6C
_08011DDA:
	pop {r0}
	bx r0
	thumb_func_end sub_8011DC0

	thumb_func_start sub_8011DE0
sub_8011DE0: @ 8011DE0
	push {r4-r6,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _08011E20
	movs r3, 0
	movs r2, 0
	ldr r5, =gUnknown_03005CDE
	adds r6, r5, 0x4
_08011DF0:
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, r4
	bne _08011E0E
	ldrb r0, [r6]
	asrs r0, r2
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08011E0E
	adds r0, r1, 0
	lsls r0, r2
	orrs r3, r0
	lsls r0, r3, 24
	lsrs r3, r0, 24
_08011E0E:
	adds r2, 0x1
	cmp r2, 0x3
	ble _08011DF0
	cmp r3, 0
	beq _08011E20
	adds r0, r3, 0
	movs r1, 0x2
	bl sub_8011E94
_08011E20:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8011DE0

	thumb_func_start sub_8011E2C
sub_8011E2C: @ 8011E2C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r6, =gUnknown_03003110
	ldrh r0, [r6]
	cmp r0, 0
	bne _08011E7A
	ldr r5, =gUnknown_03005000
	ldr r1, =0x00000ce8
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08011E7A
	movs r0, 0xED
	lsls r0, 8
	bl sub_800FD14
	ldr r1, =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	strh r1, [r6, 0x2]
	ldrh r1, [r0, 0xA]
	strh r1, [r6, 0x4]
	ldr r1, =gUnknown_082ED695
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r0, r1
	ldrb r1, [r5, 0xD]
	ldrb r0, [r0]
	subs r1, r0
	strb r1, [r5, 0xD]
	ldrb r0, [r5, 0xD]
	strh r0, [r6, 0x6]
	adds r0, r4, 0
	bl DestroyTask
_08011E7A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8011E2C

	thumb_func_start sub_8011E94
sub_8011E94: @ 8011E94
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	ldr r5, =sub_8011E2C
	adds r0, r5, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _08011ECC
	adds r0, r5, 0
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x8]
	b _08011EDC
	.pool
_08011ECC:
	ldr r0, =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	orrs r4, r0
	strh r4, [r1, 0x8]
_08011EDC:
	ldr r1, =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	strh r6, [r0, 0xA]
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8011E94

	thumb_func_start sub_8011EF4
sub_8011EF4: @ 8011EF4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, =gTasks + 0x8
	adds r4, r0, r1
	bl sub_800EE94
	lsls r0, 24
	cmp r0, 0
	beq _08011FA4
	adds r0, r4, 0
	adds r0, 0x10
	bl sub_8011CD8
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8011CE4
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _08011F8C
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	lsls r1, r2, 5
	adds r0, r1
	ldrb r0, [r0, 0x16]
	cmp r0, 0xFF
	beq _08011F5C
	ldr r0, =gUnknown_03005000
	ldr r1, =0x00000c3d
	adds r0, r1
	strb r2, [r0]
	bl sub_800EEBC
	cmp r0, 0
	beq _08011FAA
	b _08011F84
	.pool
_08011F5C:
	bl sub_800F7DC
	ldrb r1, [r0, 0xA]
	movs r5, 0x7F
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0x15
	beq _08011FA4
	bl sub_800F7DC
	ldrb r1, [r0, 0xA]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0x16
	beq _08011FA4
	movs r1, 0xE0
	lsls r1, 7
	movs r0, 0x2
	bl sub_8011A64
_08011F84:
	adds r0, r6, 0
	bl DestroyTask
	b _08011FAA
_08011F8C:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	ldr r0, =gUnknown_03005000
	ldr r1, =0x00000c3d
	adds r0, r1
	strb r2, [r0]
	b _08011FAA
	.pool
_08011FA4:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
_08011FAA:
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0xF0
	ble _08011FC2
	movs r1, 0xE0
	lsls r1, 7
	movs r0, 0x2
	bl sub_8011A64
	adds r0, r6, 0
	bl DestroyTask
_08011FC2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8011EF4

	thumb_func_start sub_8011FC8
sub_8011FC8: @ 8011FC8
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r5, r1, 16
	lsrs r5, 16
	ldr r0, =gUnknown_03005000
	adds r0, 0xF1
	movs r1, 0
	strb r1, [r0]
	ldr r0, =sub_8011EF4
	movs r1, 0x3
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, =gTasks + 0x8
	adds r4, r0
	adds r0, r4, 0
	adds r1, r6, 0
	bl StringCopy
	strh r5, [r4, 0x10]
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8011FC8

	thumb_func_start sub_801200C
sub_801200C: @ 801200C
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r5, r0, 16
	bl sub_800F7DC
	ldrb r1, [r0, 0xA]
	movs r2, 0x7F
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0x45
	bne _08012032
	ldrb r1, [r4, 0xA]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0x45
	beq _08012092
_0801202E:
	movs r0, 0x1
	b _08012094
_08012032:
	ldrb r1, [r4, 0xA]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0x40
	bne _0801202E
	cmp r5, 0x44
	bne _08012092
	ldr r5, =gUnknown_0300510A
	ldrh r0, [r5, 0x8]
	ldr r3, =0x000003ff
	adds r2, r3, 0
	ands r2, r0
	movs r0, 0xCE
	lsls r0, 1
	cmp r2, r0
	bne _08012068
	ldrh r1, [r4, 0x8]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, r2
	beq _08012092
	b _0801202E
	.pool
_08012068:
	ldrh r1, [r4, 0x8]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, r2
	bne _0801202E
	ldrb r2, [r4, 0xB]
	movs r0, 0xFE
	ldrb r3, [r5, 0xB]
	adds r1, r0, 0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bne _0801202E
	ldrb r2, [r4, 0x9]
	movs r0, 0xFC
	ldrb r3, [r5, 0x9]
	adds r1, r0, 0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bne _0801202E
_08012092:
	movs r0, 0
_08012094:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_801200C

	thumb_func_start sub_801209C
sub_801209C: @ 801209C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	mov r8, r5
	ldr r6, =gUnknown_03005000
	adds r0, r6, 0
	adds r0, 0xF1
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _080120BA
	adds r0, r5, 0
	bl DestroyTask
_080120BA:
	ldr r1, =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	movs r1, 0x96
	lsls r1, 17
	cmp r0, r1
	ble _080120E4
	movs r1, 0xE0
	lsls r1, 7
	movs r0, 0x2
	bl sub_8011A64
	adds r0, r5, 0
	bl DestroyTask
_080120E4:
	ldr r1, =0x00000ccd
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0801217C
	ldr r0, =gUnknown_03004140
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	bne _0801217C
	movs r2, 0x86
	lsls r2, 1
	adds r0, r6, r2
	bl sub_8011CD8
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r2, =0x00000119
	adds r0, r6, r2
	bl sub_8011CE4
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _0801217C
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	ldr r7, =gUnknown_03007890
	lsls r4, r2, 5
	adds r2, r4, 0
	adds r2, 0x14
	ldr r1, [r7]
	adds r1, r2
	adds r1, 0x6
	bl sub_801200C
	cmp r0, 0
	bne _0801216C
	ldr r0, [r7]
	adds r1, r0, r4
	ldrb r0, [r1, 0x16]
	cmp r0, 0xFF
	beq _0801217C
	ldrh r0, [r1, 0x14]
	movs r1, 0x5A
	bl sub_800C12C
	lsls r0, 24
	cmp r0, 0
	bne _0801217C
	movs r0, 0xA
	strh r0, [r6, 0x4]
	adds r0, r5, 0
	bl DestroyTask
	b _0801217C
	.pool
_0801216C:
	movs r1, 0xE0
	lsls r1, 7
	movs r0, 0x2
	bl sub_8011A64
	mov r0, r8
	bl DestroyTask
_0801217C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_801209C

	thumb_func_start sub_8012188
sub_8012188: @ 8012188
	push {r4-r7,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	lsls r4, r2, 24
	lsrs r4, 24
	ldr r6, =gUnknown_03005000
	ldr r1, =0x00000ccf
	adds r0, r6, r1
	movs r7, 0
	strb r7, [r0]
	adds r0, r6, 0
	adds r0, 0xF1
	strb r7, [r0]
	ldr r1, =0x00000119
	adds r0, r6, r1
	adds r1, r3, 0
	bl StringCopy
	movs r1, 0x85
	lsls r1, 1
	adds r0, r6, r1
	adds r1, r5, 0
	movs r2, 0xD
	bl memcpy
	bl sub_800D658
	ldr r0, =sub_801209C
	movs r1, 0x2
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r5, =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r5
	strh r4, [r1, 0xA]
	ldr r0, =sub_800EB44
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	cmp r4, 0x45
	bne _08012210
	cmp r1, 0xFF
	beq _0801221E
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r1, 0x1
	strh r1, [r0, 0x16]
	b _0801221E
	.pool
_08012210:
	cmp r2, 0xFF
	beq _0801221E
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r5
	strh r7, [r0, 0x16]
_0801221E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8012188

	thumb_func_start sub_8012224
sub_8012224: @ 8012224
	push {lr}
	ldr r0, =gUnknown_03005000
	adds r0, 0xF0
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08012238
	movs r0, 0
	b _0801223A
	.pool
_08012238:
	movs r0, 0x1
_0801223A:
	pop {r1}
	bx r1
	thumb_func_end sub_8012224

	thumb_func_start sub_8012240
sub_8012240: @ 8012240
	push {r4,lr}
	movs r1, 0
	ldr r0, =gUnknown_03004140
	ldrb r2, [r0]
	ldr r4, =gUnknown_03005CD1
	movs r3, 0x1
_0801224C:
	adds r0, r2, 0
	asrs r0, r1
	ands r0, r3
	cmp r0, 0
	beq _0801226C
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801226C
	movs r0, 0
	b _08012274
	.pool
_0801226C:
	adds r1, 0x1
	cmp r1, 0x3
	ble _0801224C
	movs r0, 0x1
_08012274:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8012240

	thumb_func_start sub_801227C
sub_801227C: @ 801227C
	push {r4,lr}
	movs r4, 0
_08012280:
	lsls r2, r4, 24
	lsrs r2, 24
	ldr r0, =gUnknown_082ED82C
	movs r1, 0
	bl nullsub_5
	adds r4, 0x1
	cmp r4, 0x13
	ble _08012280
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801227C

	thumb_func_start sub_801229C
sub_801229C: @ 801229C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	bl sub_800A550
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1C
	movs r2, 0x13
	movs r3, 0x2
	bl nullsub_13
	ldr r4, =gUnknown_03007890
	ldr r0, [r4]
	ldrb r0, [r0, 0x2]
	movs r1, 0x14
	movs r2, 0x1
	movs r3, 0x1
	bl nullsub_13
	ldr r0, [r4]
	ldrb r0, [r0, 0x3]
	movs r1, 0x17
	movs r2, 0x1
	movs r3, 0x1
	bl nullsub_13
	ldr r0, =gUnknown_03005000
	ldrb r0, [r0, 0xC]
	cmp r0, 0x1
	bne _08012378
	movs r6, 0
	adds r7, r4, 0
	movs r5, 0x14
_080122E0:
	ldr r2, [r7]
	ldrb r0, [r2, 0x7]
	asrs r0, r6
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0801231E
	lsls r0, r6, 5
	adds r0, r2, r0
	ldrh r0, [r0, 0x18]
	adds r4, r6, 0x3
	lsls r4, 24
	lsrs r4, 24
	adds r2, r4, 0
	movs r3, 0x4
	bl nullsub_13
	ldr r0, [r7]
	adds r0, r5
	adds r0, 0x6
	movs r1, 0x6
	adds r2, r4, 0
	bl nullsub_5
	ldr r0, [r7]
	adds r0, r5
	adds r0, 0x15
	movs r1, 0x16
	adds r2, r4, 0
	bl nullsub_5
_0801231E:
	adds r5, 0x20
	adds r6, 0x1
	cmp r6, 0x3
	ble _080122E0
	movs r6, 0
	ldr r0, =gUnknown_03005000
	mov r8, r0
_0801232C:
	movs r5, 0
	adds r7, r6, 0x1
	lsls r0, r6, 3
	adds r2, r6, 0
	adds r2, 0xB
	subs r0, r6
	lsls r0, 1
	mov r1, r8
	adds r1, 0x14
	adds r4, r0, r1
	lsls r6, r2, 24
_08012342:
	ldrb r0, [r4]
	lsls r1, r5, 25
	lsrs r1, 24
	lsrs r2, r6, 24
	movs r3, 0x2
	bl nullsub_13
	adds r4, 0x1
	adds r5, 0x1
	cmp r5, 0xD
	ble _08012342
	adds r6, r7, 0
	cmp r6, 0x3
	ble _0801232C
	ldr r0, =gUnknown_082ED868
	movs r1, 0x1
	movs r2, 0xF
	bl nullsub_5
	b _080124AA
	.pool
_08012378:
	ldr r1, [r4]
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	beq _08012414
	ldrb r0, [r1, 0x7]
	cmp r0, 0
	beq _08012414
	movs r6, 0
	movs r5, 0xC0
	lsls r5, 18
_0801238C:
	lsrs r4, r5, 24
	movs r0, 0
	movs r1, 0x1
	adds r2, r4, 0
	movs r3, 0x4
	bl nullsub_13
	ldr r0, =gUnknown_082ED84B
	movs r1, 0x6
	adds r2, r4, 0
	bl nullsub_5
	ldr r0, =gUnknown_082ED85B
	movs r1, 0x16
	adds r2, r4, 0
	bl nullsub_5
	movs r1, 0x80
	lsls r1, 17
	adds r5, r1
	adds r6, 0x1
	cmp r6, 0x3
	ble _0801238C
	ldr r5, =gUnknown_03007890
	ldr r1, [r5]
	ldr r4, =gUnknown_03005000
	ldr r0, =0x00000c3e
	adds r4, r0
	ldrb r0, [r4]
	lsls r0, 5
	adds r1, r0
	ldrh r0, [r1, 0x18]
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x4
	bl nullsub_13
	ldrb r1, [r4]
	lsls r1, 5
	adds r1, 0x14
	ldr r0, [r5]
	adds r0, r1
	adds r0, 0x6
	movs r1, 0x6
	movs r2, 0x3
	bl nullsub_5
	ldrb r1, [r4]
	lsls r1, 5
	adds r1, 0x14
	ldr r0, [r5]
	adds r0, r1
	adds r0, 0x15
	movs r1, 0x16
	movs r2, 0x3
	bl nullsub_5
	b _080124AA
	.pool
_08012414:
	movs r6, 0
	ldr r1, =gUnknown_03007890
	ldr r0, [r1]
	ldrb r0, [r0, 0x8]
	cmp r6, r0
	bge _08012470
	adds r7, r1, 0
	movs r1, 0x14
	mov r8, r1
_08012426:
	ldr r0, [r7]
	lsls r5, r6, 5
	adds r1, r0, r5
	ldrb r0, [r1, 0x16]
	cmp r0, 0xFF
	beq _08012462
	ldrh r0, [r1, 0x18]
	adds r4, r6, 0x3
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0x1
	adds r2, r4, 0
	movs r3, 0x4
	bl nullsub_13
	ldr r0, [r7]
	adds r0, r5
	ldrh r0, [r0, 0x14]
	movs r1, 0x6
	adds r2, r4, 0
	movs r3, 0x4
	bl nullsub_13
	ldr r0, [r7]
	add r0, r8
	adds r0, 0x15
	movs r1, 0x16
	adds r2, r4, 0
	bl nullsub_5
_08012462:
	movs r0, 0x20
	add r8, r0
	adds r6, 0x1
	ldr r0, [r7]
	ldrb r0, [r0, 0x8]
	cmp r6, r0
	blt _08012426
_08012470:
	cmp r6, 0x3
	bgt _080124AA
	lsls r0, r6, 24
	movs r1, 0xC0
	lsls r1, 18
	adds r5, r0, r1
_0801247C:
	lsrs r4, r5, 24
	movs r0, 0
	movs r1, 0x1
	adds r2, r4, 0
	movs r3, 0x4
	bl nullsub_13
	ldr r0, =gUnknown_082ED84B
	movs r1, 0x6
	adds r2, r4, 0
	bl nullsub_5
	ldr r0, =gUnknown_082ED85B
	movs r1, 0x16
	adds r2, r4, 0
	bl nullsub_5
	movs r0, 0x80
	lsls r0, 17
	adds r5, r0
	adds r6, 0x1
	cmp r6, 0x3
	ble _0801247C
_080124AA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801229C

	thumb_func_start sub_80124C0
sub_80124C0: @ 80124C0
	ldr r0, =gUnknown_03005000
	ldr r1, =0x00000c1a
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.pool
	thumb_func_end sub_80124C0

	thumb_func_start sub_80124D4
sub_80124D4: @ 80124D4
	ldr r0, =gUnknown_03005000
	ldr r1, =0x000009e6
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.pool
	thumb_func_end sub_80124D4

	thumb_func_start nullsub_89
nullsub_89: @ 80124E8
	bx lr
	thumb_func_end nullsub_89

	thumb_func_start sub_80124EC
sub_80124EC: @ 80124EC
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r1, 0
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r2, 24
	lsrs r5, r2, 24
	adds r0, r6, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	lsls r4, 8
	movs r0, 0x90
	lsls r0, 6
	cmp r4, r0
	beq _08012588
	cmp r4, r0
	bgt _08012526
	movs r0, 0x80
	lsls r0, 2
	cmp r4, r0
	beq _08012538
	movs r0, 0x80
	lsls r0, 3
	cmp r4, r0
	beq _08012544
	b _080125A6
_08012526:
	movs r0, 0x94
	lsls r0, 6
	cmp r4, r0
	beq _08012554
	movs r0, 0xD4
	lsls r0, 6
	cmp r4, r0
	beq _08012564
	b _080125A6
_08012538:
	ldr r1, =gUnknown_082EDB60
	subs r0, r5, 0x1
	lsls r0, 2
	b _0801256C
	.pool
_08012544:
	ldr r1, =gUnknown_082EDB60
	subs r0, r5, 0x1
	lsls r0, 2
	adds r1, 0x14
	b _0801256C
	.pool
_08012554:
	ldr r1, =gUnknown_082EDB60
	subs r0, r5, 0x1
	lsls r0, 2
	adds r1, 0x28
	b _0801256C
	.pool
_08012564:
	ldr r1, =gUnknown_082EDB60
	subs r0, r5, 0x1
	lsls r0, 2
	adds r1, 0x3C
_0801256C:
	adds r0, r1
	ldr r2, [r0]
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	adds r0, r6, 0
	movs r1, 0x1
	movs r3, 0
	bl sub_80173E0
	b _080125A6
	.pool
_08012588:
	ldr r1, =gUnknown_082EDB60
	subs r0, r5, 0x1
	lsls r0, 2
	adds r1, 0x50
	adds r0, r1
	ldr r2, [r0]
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	adds r0, r6, 0
	movs r1, 0x1
	movs r3, 0
	bl sub_80173E0
_080125A6:
	adds r0, r6, 0
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80124EC

	thumb_func_start sub_80125BC
sub_80125BC: @ 80125BC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x28
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r6, =gSaveBlock2Ptr
	ldr r2, [r6]
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0
	mov r8, r0
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0x1
	movs r3, 0
	bl sub_80173E0
	ldr r1, =gUnknown_082ED8CC
	add r0, sp, 0x8
	bl StringCopy
	adds r5, r0, 0
	ldr r0, [r6]
	adds r0, 0xA
	bl sub_8015658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	movs r2, 0x2
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	movs r0, 0x11
	str r0, [sp]
	mov r0, r8
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0x1
	add r2, sp, 0x8
	movs r3, 0
	bl sub_80173E0
	add sp, 0x28
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80125BC

	thumb_func_start sub_801262C
sub_801262C: @ 801262C
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	subs r0, r1, 0x1
	cmp r0, 0x1B
	bhi _080126C0
	lsls r0, 2
	ldr r1, =_08012648
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08012648:
	.4byte _080126B8
	.4byte _080126B8
	.4byte _080126B8
	.4byte _080126B8
	.4byte _080126C0
	.4byte _080126C0
	.4byte _080126C0
	.4byte _080126C0
	.4byte _080126B8
	.4byte _080126B8
	.4byte _080126B8
	.4byte _080126C0
	.4byte _080126C0
	.4byte _080126B8
	.4byte _080126B8
	.4byte _080126B8
	.4byte _080126C0
	.4byte _080126C0
	.4byte _080126C0
	.4byte _080126C0
	.4byte _080126B8
	.4byte _080126B8
	.4byte _080126B8
	.4byte _080126B8
	.4byte _080126B8
	.4byte _080126B8
	.4byte _080126B8
	.4byte _080126B8
_080126B8:
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_082ED960
	bl StringExpandPlaceholders
_080126C0:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801262C

	thumb_func_start sub_80126CC
sub_80126CC: @ 80126CC
	push {lr}
	subs r0, 0x9
	cmp r0, 0x12
	bhi _08012734
	lsls r0, 2
	ldr r1, =_080126E4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_080126E4:
	.4byte _08012730
	.4byte _08012730
	.4byte _08012730
	.4byte _08012734
	.4byte _08012734
	.4byte _08012734
	.4byte _08012730
	.4byte _08012730
	.4byte _08012734
	.4byte _08012734
	.4byte _08012734
	.4byte _08012734
	.4byte _08012734
	.4byte _08012734
	.4byte _08012730
	.4byte _08012730
	.4byte _08012730
	.4byte _08012730
	.4byte _08012730
_08012730:
	movs r0, 0x1
	b _08012736
_08012734:
	movs r0, 0
_08012736:
	pop {r1}
	bx r1
	thumb_func_end sub_80126CC

	thumb_func_start BerryBlenderLinkBecomeLeader
BerryBlenderLinkBecomeLeader: @ 801273C
	push {lr}
	ldr r0, =sub_8012780
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, =gUnknown_02022C30
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, =gTasks + 0x8
	adds r1, r0
	str r1, [r2]
	ldr r0, =gUnknown_03000DA0
	str r1, [r0]
	movs r0, 0
	strb r0, [r1, 0xC]
	strb r0, [r1, 0xD]
	ldr r1, =gUnknown_020375F0
	strh r0, [r1]
	pop {r0}
	bx r0
	.pool
	thumb_func_end BerryBlenderLinkBecomeLeader

	thumb_func_start sub_8012780
sub_8012780: @ 8012780
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, =gUnknown_02022C30
	ldr r6, [r0]
	ldrb r0, [r6, 0xC]
	cmp r0, 0x1E
	bls _0801279A
	bl _08012F50
_0801279A:
	lsls r0, 2
	ldr r1, =_080127AC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_080127AC:
	.4byte _08012828
	.4byte _08012F50
	.4byte _08012F50
	.4byte _080128A0
	.4byte _080129C8
	.4byte _08012A50
	.4byte _08012A6C
	.4byte _08012B8C
	.4byte _08012F50
	.4byte _08012AFC
	.4byte _08012B14
	.4byte _08012BA8
	.4byte _08012C5C
	.4byte _08012D5A
	.4byte _08012D78
	.4byte _08012D8A
	.4byte _08012DA8
	.4byte _08012E62
	.4byte _08012E78
	.4byte _08012DF2
	.4byte _08012E10
	.4byte _08012ED0
	.4byte _08012EFC
	.4byte _08012ED0
	.4byte _08012EE6
	.4byte _08012F50
	.4byte _08012F14
	.4byte _08012F50
	.4byte _08012F50
	.4byte _08012B54
	.4byte _08012EB6
_08012828:
	ldr r0, =gUnknown_020375E0
	ldrh r2, [r0]
	adds r3, r0, 0
	cmp r2, 0x14
	bne _08012848
	ldr r0, =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, =0x00000ca9
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _08012848
	adds r0, r2, 0x1
	strh r0, [r3]
_08012848:
	ldr r2, =gUnknown_02022C2C
	ldr r1, =gUnknown_082F00C4
	ldrh r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	strb r0, [r2]
	ldr r4, =gUnknown_02022C2D
	ldrh r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsrs r0, 8
	strb r0, [r4]
	ldrb r0, [r2]
	movs r1, 0
	movs r2, 0
	bl sub_8010F84
	bl sub_800B488
	bl sub_8009734
	ldrb r1, [r4]
	movs r0, 0xF
	ands r0, r1
	bl sub_8011C10
	movs r0, 0x3
	strb r0, [r6, 0xC]
	b _08012F50
	.pool
_080128A0:
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r6, 0x4]
	movs r0, 0xA0
	bl AllocZeroed
	str r0, [r6]
	movs r0, 0xA0
	bl AllocZeroed
	str r0, [r6, 0x8]
	ldr r0, [r6, 0x4]
	movs r1, 0x4
	bl sub_80175EC
	ldr r0, [r6]
	movs r1, 0x5
	bl sub_8017580
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x10
	bl sub_800DF90
	ldr r1, [r6]
	movs r3, 0
	movs r0, 0
	strh r0, [r1, 0x18]
	ldr r2, [r6]
	ldrb r1, [r2, 0x1A]
	subs r0, 0x4
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1A]
	ldr r2, [r6]
	ldrb r1, [r2, 0x1A]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1A]
	ldr r0, [r6]
	strb r3, [r0, 0x1B]
	ldr r0, [r6, 0x4]
	movs r1, 0xFF
	bl sub_8016FC0
	strb r0, [r6, 0x17]
	ldr r0, =gUnknown_082F00BC
	bl AddWindow
	strb r0, [r6, 0x10]
	ldr r0, =gUnknown_02022C2D
	ldrb r0, [r0]
	movs r1, 0xF
	ands r1, r0
	cmp r1, 0x2
	blt _08012938
	cmp r1, 0x4
	ble _08012928
	cmp r1, 0x5
	beq _08012930
	b _08012938
	.pool
_08012928:
	ldr r0, =gUnknown_082F011C
	b _08012932
	.pool
_08012930:
	ldr r0, =gUnknown_082F0124
_08012932:
	bl AddWindow
	strb r0, [r6, 0xF]
_08012938:
	ldr r0, =gUnknown_082F012C
	bl AddWindow
	strb r0, [r6, 0x11]
	ldrb r0, [r6, 0x10]
	movs r1, 0x22
	bl FillWindowPixelBuffer
	ldrb r0, [r6, 0x10]
	ldr r2, =gUnknown_082EDBC4
	movs r3, 0x1
	mov r8, r3
	str r3, [sp]
	movs r4, 0x4
	str r4, [sp, 0x4]
	movs r1, 0
	movs r3, 0x8
	bl sub_80173E0
	ldrb r0, [r6, 0x10]
	bl PutWindowTilemap
	ldrb r0, [r6, 0x10]
	movs r1, 0x2
	bl CopyWindowToVram
	ldrb r0, [r6, 0xF]
	movs r1, 0
	bl sub_81973FC
	ldr r0, =gUnknown_03006310
	adds r2, r0, 0
	ldr r1, =gUnknown_082F015C
	ldm r1!, {r3,r5,r7}
	stm r2!, {r3,r5,r7}
	ldm r1!, {r3,r5,r7}
	stm r2!, {r3,r5,r7}
	ldrb r1, [r6, 0xF]
	strb r1, [r0, 0x10]
	movs r1, 0
	movs r2, 0
	bl ListMenuInit
	strb r0, [r6, 0x12]
	ldrb r0, [r6, 0x11]
	movs r1, 0
	bl sub_81973FC
	ldrb r0, [r6, 0x11]
	bl PutWindowTilemap
	ldrb r0, [r6, 0x11]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	mov r5, r8
	strb r5, [r6, 0x13]
	strb r4, [r6, 0xC]
	b _08012F50
	.pool
_080129C8:
	ldr r0, =gStringVar1
	ldr r2, =gUnknown_082F0048
	ldr r4, =gUnknown_02022C2C
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r0, =gUnknown_02022C2D
	ldrb r2, [r0]
	lsrs r0, r2, 4
	cmp r0, 0
	beq _08012A2C
	ldrb r1, [r6, 0x13]
	subs r0, 0x1
	cmp r1, r0
	ble _08012A18
	movs r0, 0xF
	ands r0, r2
	cmp r0, 0
	beq _08012A18
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_082ED990
	bl StringExpandPlaceholders
	b _08012A34
	.pool
_08012A18:
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_082ED960
	bl StringExpandPlaceholders
	b _08012A34
	.pool
_08012A2C:
	ldr r0, =gStringVar4
	ldrb r1, [r4]
	bl sub_801262C
_08012A34:
	ldrb r0, [r6, 0x11]
	ldr r1, =gUnknown_02022C2D
	ldrb r1, [r1]
	ldrb r2, [r6, 0x13]
	bl sub_80124EC
	movs r0, 0x5
	strb r0, [r6, 0xC]
	b _08012F50
	.pool
_08012A50:
	adds r0, r6, 0
	adds r0, 0xD
	ldr r1, =gStringVar4
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	bne _08012A62
	b _08012F50
_08012A62:
	movs r0, 0x6
	strb r0, [r6, 0xC]
	b _08012F50
	.pool
_08012A6C:
	adds r0, r6, 0
	movs r1, 0x7
	movs r2, 0xA
	bl sub_801320C
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08012AA8
	ldrb r0, [r6, 0x13]
	cmp r0, 0x1
	bne _08012A90
	movs r0, 0x17
	b _08012AA6
	.pool
_08012A90:
	ldr r0, =gUnknown_02022C2D
	ldrb r1, [r0]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	beq _08012AA4
	movs r0, 0x1E
	b _08012AA6
	.pool
_08012AA4:
	movs r0, 0x13
_08012AA6:
	strb r0, [r6, 0xC]
_08012AA8:
	ldr r0, =gUnknown_02022C2D
	ldrb r2, [r0]
	lsrs r0, r2, 4
	cmp r0, 0
	beq _08012ADE
	ldrb r1, [r6, 0x13]
	subs r0, 0x1
	cmp r1, r0
	ble _08012ADE
	movs r4, 0xF
	adds r0, r4, 0
	ands r0, r2
	cmp r0, 0
	beq _08012ADE
	bl sub_8012240
	cmp r0, 0
	beq _08012ADE
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08012ADE
	strb r4, [r6, 0xC]
	bl sub_800EF38
_08012ADE:
	ldrb r0, [r6, 0xC]
	cmp r0, 0x6
	beq _08012AE6
	b _08012F50
_08012AE6:
	bl sub_80105EC
	cmp r0, 0
	bne _08012AF0
	b _08012F50
_08012AF0:
	b _08012C56
	.pool
_08012AFC:
	bl sub_80105EC
	cmp r0, 0
	beq _08012B06
	b _08012F50
_08012B06:
	movs r0, 0x6
	strb r0, [r6, 0xC]
	ldr r0, [r6]
	bl sub_8013398
	strb r0, [r6, 0x13]
	b _08012F50
_08012B14:
	movs r3, 0
	ldr r0, =gUnknown_02022C2C
	ldrb r1, [r0]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x2
	bne _08012B24
	movs r3, 0x1
_08012B24:
	adds r0, r6, 0
	adds r0, 0xD
	ldr r2, =gUnknown_082EDDC4
	lsls r1, r3, 2
	adds r1, r2
	ldr r1, [r1]
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	bne _08012B3C
	b _08012F50
_08012B3C:
	ldr r0, [r6]
	bl sub_8013398
	strb r0, [r6, 0x13]
	ldrb r0, [r6, 0x12]
	bl sub_81AE70C
	b _08012E5C
	.pool
_08012B54:
	ldr r0, =gUnknown_02022C2D
	ldrb r0, [r0]
	movs r1, 0xF
	ands r1, r0
	movs r0, 0x2
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r3, r0, 31
	adds r0, r6, 0
	adds r0, 0xD
	ldr r2, =gUnknown_082EDDC4
	lsls r1, r3, 2
	adds r1, r2
	ldr r1, [r1]
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	bne _08012B7E
	b _08012F50
_08012B7E:
	movs r0, 0x15
	strb r0, [r6, 0xC]
	b _08012F50
	.pool
_08012B8C:
	adds r0, r6, 0
	adds r0, 0xD
	ldr r1, =gStringVar4
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	bne _08012B9E
	b _08012F50
_08012B9E:
	movs r0, 0xB
	strb r0, [r6, 0xC]
	b _08012F50
	.pool
_08012BA8:
	adds r4, r6, 0
	adds r4, 0xD
	ldrb r1, [r6, 0x13]
	lsls r1, 5
	ldr r0, [r6]
	adds r0, r1
	adds r0, 0x2
	bl sub_8015658
	lsls r0, 16
	lsrs r0, 16
	ldrb r2, [r6, 0x13]
	lsls r2, 5
	ldr r1, [r6]
	adds r1, r2
	adds r1, 0x10
	bl sub_801064C
	adds r1, r0, 0
	adds r0, r4, 0
	bl sub_80170B8
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08012C28
	cmp r1, r0
	bgt _08012BEC
	subs r0, 0x2
	cmp r1, r0
	beq _08012C56
	b _08012F50
_08012BEC:
	cmp r1, 0
	beq _08012BF6
	cmp r1, 0x1
	beq _08012C28
	b _08012F50
_08012BF6:
	bl sub_800E0E8
	movs r0, 0
	movs r1, 0
	bl sub_800DFB4
	movs r0, 0x5
	strb r0, [r6, 0x19]
	ldrb r1, [r6, 0x13]
	lsls r1, 5
	ldr r0, [r6]
	adds r0, r1
	adds r0, 0x2
	bl sub_8015658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldrb r0, [r6, 0x13]
	lsls r0, 5
	ldr r2, [r6]
	adds r2, r0
	adds r2, 0x10
	movs r0, 0x5
	b _08012C4C
_08012C28:
	movs r0, 0x6
	strb r0, [r6, 0x19]
	ldrb r1, [r6, 0x13]
	lsls r1, 5
	ldr r0, [r6]
	adds r0, r1
	adds r0, 0x2
	bl sub_8015658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldrb r0, [r6, 0x13]
	lsls r0, 5
	ldr r2, [r6]
	adds r2, r0
	adds r2, 0x10
	movs r0, 0x6
_08012C4C:
	bl sub_8010688
	movs r0, 0xC
	strb r0, [r6, 0xC]
	b _08012F50
_08012C56:
	movs r0, 0x9
	strb r0, [r6, 0xC]
	b _08012F50
_08012C5C:
	ldrb r1, [r6, 0x13]
	lsls r1, 5
	ldr r0, [r6]
	adds r0, r1
	adds r0, 0x2
	bl sub_8015658
	lsls r0, 16
	lsrs r0, 16
	ldrb r2, [r6, 0x13]
	lsls r2, 5
	ldr r1, [r6]
	adds r1, r2
	adds r1, 0x10
	bl sub_8010714
	cmp r0, 0x1
	bne _08012D4A
	ldrb r0, [r6, 0x19]
	cmp r0, 0x5
	bne _08012D04
	ldr r1, [r6]
	ldrb r0, [r6, 0x13]
	lsls r0, 5
	adds r1, r0
	movs r0, 0
	strb r0, [r1, 0x1B]
	ldrb r0, [r6, 0x12]
	bl sub_81AE70C
	ldrb r0, [r6, 0x13]
	adds r0, 0x1
	strb r0, [r6, 0x13]
	ldr r1, =gUnknown_02022C2D
	ldrb r1, [r1]
	movs r3, 0xF
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r3, 0
	ands r0, r1
	cmp r2, r0
	bne _08012D40
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	bne _08012CBC
	cmp r2, 0x4
	bne _08012CC4
_08012CBC:
	strb r3, [r6, 0xC]
	b _08012CE0
	.pool
_08012CC4:
	ldr r0, =gStringVar1
	ldrb r2, [r6, 0x13]
	lsls r2, 5
	subs r2, 0x20
	ldr r1, [r6]
	adds r1, r2
	bl sub_8018404
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_082EDC9C
	bl StringExpandPlaceholders
	movs r0, 0xD
	strb r0, [r6, 0xC]
_08012CE0:
	bl sub_800EF38
	ldrb r0, [r6, 0x11]
	ldr r1, =gUnknown_02022C2D
	ldrb r1, [r1]
	ldrb r2, [r6, 0x13]
	bl sub_80124EC
	b _08012D44
	.pool
_08012D04:
	ldrb r1, [r6, 0x13]
	lsls r1, 5
	ldr r0, [r6]
	adds r0, r1
	adds r4, r0, 0
	adds r4, 0x10
	adds r0, 0x2
	bl sub_8015658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8011DC0
	ldr r1, [r6]
	ldrb r0, [r6, 0x13]
	lsls r0, 5
	adds r1, r0
	ldrb r2, [r1, 0x1A]
	movs r0, 0x4
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1A]
	ldr r0, [r6]
	bl sub_8013398
	ldrb r0, [r6, 0x12]
	bl sub_81AE70C
_08012D40:
	movs r0, 0x4
	strb r0, [r6, 0xC]
_08012D44:
	movs r0, 0
	strb r0, [r6, 0x19]
	b _08012F50
_08012D4A:
	cmp r0, 0x2
	beq _08012D50
	b _08012F50
_08012D50:
	movs r0, 0
	movs r1, 0
	bl sub_8011A64
	b _08012E5C
_08012D5A:
	adds r0, r6, 0
	adds r0, 0xD
	ldr r1, =gStringVar4
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	bne _08012D6C
	b _08012F50
_08012D6C:
	movs r0, 0xE
	strb r0, [r6, 0xC]
	b _08012F50
	.pool
_08012D78:
	ldrb r0, [r6, 0xE]
	adds r0, 0x1
	strb r0, [r6, 0xE]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x78
	bhi _08012D88
	b _08012F50
_08012D88:
	b _08012DCE
_08012D8A:
	adds r0, r6, 0
	adds r0, 0xD
	ldr r1, =gUnknown_082EDC5C
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	bne _08012D9C
	b _08012F50
_08012D9C:
	movs r0, 0x10
	strb r0, [r6, 0xC]
	b _08012F50
	.pool
_08012DA8:
	adds r0, r6, 0
	adds r0, 0xD
	movs r1, 0
	bl sub_80170B8
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08012DCE
	cmp r1, 0
	bgt _08012DC8
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08012DD4
	b _08012F50
_08012DC8:
	cmp r1, 0x1
	beq _08012DD4
	b _08012F50
_08012DCE:
	movs r0, 0x11
	strb r0, [r6, 0xC]
	b _08012F50
_08012DD4:
	ldr r0, =gUnknown_02022C2D
	ldrb r1, [r0]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	beq _08012DEC
	movs r0, 0x1E
	strb r0, [r6, 0xC]
	b _08012F50
	.pool
_08012DEC:
	movs r0, 0x13
	strb r0, [r6, 0xC]
	b _08012F50
_08012DF2:
	adds r0, r6, 0
	adds r0, 0xD
	ldr r1, =gUnknown_082EDC78
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	bne _08012E04
	b _08012F50
_08012E04:
	movs r0, 0x14
	strb r0, [r6, 0xC]
	b _08012F50
	.pool
_08012E10:
	adds r0, r6, 0
	adds r0, 0xD
	movs r1, 0
	bl sub_80170B8
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08012EC6
	cmp r1, 0
	bgt _08012E30
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08012E36
	b _08012F50
_08012E30:
	cmp r1, 0x1
	beq _08012E36
	b _08012F50
_08012E36:
	ldr r0, =gUnknown_02022C2D
	ldrb r2, [r0]
	movs r0, 0xF0
	ands r0, r2
	cmp r0, 0
	beq _08012E4C
	movs r0, 0xF
	strb r0, [r6, 0xC]
	b _08012F50
	.pool
_08012E4C:
	movs r3, 0xF
	ldrb r1, [r6, 0x13]
	adds r0, r3, 0
	ands r0, r2
	cmp r1, r0
	bne _08012E5C
	strb r3, [r6, 0xC]
	b _08012F50
_08012E5C:
	movs r0, 0x4
	strb r0, [r6, 0xC]
	b _08012F50
_08012E62:
	adds r0, r6, 0
	movs r1, 0x7
	movs r2, 0x1D
	bl sub_801320C
	lsls r0, 24
	cmp r0, 0
	bne _08012F50
	movs r0, 0x12
	strb r0, [r6, 0xC]
	b _08012F50
_08012E78:
	bl sub_800EF1C
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08012EAE
	movs r0, 0
	bl sub_800EF58
	cmp r0, 0
	beq _08012E94
	movs r0, 0x1A
	strb r0, [r6, 0xC]
	b _08012F50
_08012E94:
	ldrh r0, [r6, 0x1A]
	adds r0, 0x1
	strh r0, [r6, 0x1A]
	lsls r0, 16
	movs r1, 0x96
	lsls r1, 17
	cmp r0, r1
	bls _08012F50
	movs r0, 0x1D
	strb r0, [r6, 0xC]
	movs r0, 0
	strb r0, [r6, 0xD]
	b _08012F50
_08012EAE:
	movs r0, 0x1D
	strb r0, [r6, 0xC]
	strb r1, [r6, 0xD]
	b _08012F50
_08012EB6:
	adds r0, r6, 0
	adds r0, 0xD
	ldr r1, =gUnknown_082EDD58
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	beq _08012F50
_08012EC6:
	movs r0, 0x17
	strb r0, [r6, 0xC]
	b _08012F50
	.pool
_08012ED0:
	bl sub_800E084
	bl sub_800EDD4
	adds r0, r6, 0
	bl sub_8012F64
	ldrb r0, [r6, 0xC]
	adds r0, 0x1
	strb r0, [r6, 0xC]
	b _08012F50
_08012EE6:
	bl script_env_2_enable_and_set_ctx_running
	adds r0, r4, 0
	bl DestroyTask
	ldr r1, =gUnknown_020375F0
	movs r0, 0x5
	strh r0, [r1]
	b _08012F50
	.pool
_08012EFC:
	bl script_env_2_enable_and_set_ctx_running
	adds r0, r4, 0
	bl DestroyTask
	ldr r1, =gUnknown_020375F0
	movs r0, 0x8
	strh r0, [r1]
	b _08012F50
	.pool
_08012F14:
	bl sub_8011A80
	cmp r0, 0
	beq _08012F22
	movs r0, 0x1D
	strb r0, [r6, 0xC]
	b _08012F50
_08012F22:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	beq _08012F50
	ldr r0, =gUnknown_02022C2C
	ldrb r0, [r0]
	bl sub_80126CC
	cmp r0, 0
	beq _08012F3A
	bl sub_801103C
_08012F3A:
	movs r0, 0x1
	bl sub_8011068
	bl sub_80149C4
	adds r0, r6, 0
	bl sub_8012F64
	adds r0, r4, 0
	bl DestroyTask
_08012F50:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8012780

	thumb_func_start sub_8012F64
sub_8012F64: @ 8012F64
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x11]
	bl ClearWindowTilemap
	ldrb r0, [r4, 0x11]
	movs r1, 0
	bl sub_819746C
	ldrb r0, [r4, 0x12]
	movs r1, 0
	movs r2, 0
	bl sub_81AE6C8
	ldrb r0, [r4, 0x10]
	bl ClearWindowTilemap
	ldrb r0, [r4, 0xF]
	movs r1, 0
	bl sub_819746C
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r4, 0x11]
	bl RemoveWindow
	ldrb r0, [r4, 0xF]
	bl RemoveWindow
	ldrb r0, [r4, 0x10]
	bl RemoveWindow
	ldrb r0, [r4, 0x17]
	bl DestroyTask
	ldr r0, [r4, 0x8]
	bl Free
	ldr r0, [r4]
	bl Free
	ldr r0, [r4, 0x4]
	bl Free
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8012F64

	thumb_func_start sub_8012FC4
sub_8012FC4: @ 8012FC4
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	subs r0, r1, 0x1
	cmp r0, 0x1B
	bhi _08013070
	lsls r0, 2
	ldr r1, =_08012FE0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08012FE0:
	.4byte _08013050
	.4byte _08013050
	.4byte _08013068
	.4byte _08013050
	.4byte _08013070
	.4byte _08013070
	.4byte _08013070
	.4byte _08013070
	.4byte _08013068
	.4byte _08013068
	.4byte _08013068
	.4byte _08013070
	.4byte _08013070
	.4byte _08013050
	.4byte _08013068
	.4byte _08013068
	.4byte _08013070
	.4byte _08013070
	.4byte _08013070
	.4byte _08013070
	.4byte _08013058
	.4byte _08013058
	.4byte _08013068
	.4byte _08013068
	.4byte _08013068
	.4byte _08013068
	.4byte _08013068
	.4byte _08013050
_08013050:
	ldr r1, =gUnknown_082EDBE8
	b _0801305A
	.pool
_08013058:
	ldr r1, =gUnknown_082EDC0C
_0801305A:
	adds r0, r2, 0
	bl StringExpandPlaceholders
	b _08013070
	.pool
_08013068:
	ldr r1, =gUnknown_082EDC34
	adds r0, r2, 0
	bl StringExpandPlaceholders
_08013070:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8012FC4

	thumb_func_start sub_8013078
sub_8013078: @ 8013078
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0x44
	beq _08013098
	cmp r1, 0x44
	bgt _0801308E
	cmp r1, 0x41
	beq _08013098
	b _080130AA
_0801308E:
	cmp r2, 0x45
	beq _080130A4
	cmp r2, 0x48
	beq _080130A4
	b _080130AA
_08013098:
	ldr r1, =gUnknown_082EE560
	bl StringExpandPlaceholders
	b _080130AA
	.pool
_080130A4:
	ldr r1, =gUnknown_082EE57C
	bl StringExpandPlaceholders
_080130AA:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8013078

	thumb_func_start sub_80130B4
sub_80130B4: @ 80130B4
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	subs r0, r1, 0x1
	cmp r0, 0x1B
	bhi _08013158
	lsls r0, 2
	ldr r1, =_080130D0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_080130D0:
	.4byte _08013140
	.4byte _08013140
	.4byte _08013150
	.4byte _08013140
	.4byte _08013158
	.4byte _08013158
	.4byte _08013158
	.4byte _08013158
	.4byte _08013150
	.4byte _08013150
	.4byte _08013150
	.4byte _08013158
	.4byte _08013158
	.4byte _08013140
	.4byte _08013150
	.4byte _08013150
	.4byte _08013158
	.4byte _08013158
	.4byte _08013158
	.4byte _08013158
	.4byte _08013140
	.4byte _08013140
	.4byte _08013150
	.4byte _08013150
	.4byte _08013150
	.4byte _08013150
	.4byte _08013150
	.4byte _08013140
_08013140:
	ldr r1, =gUnknown_082EFC3C
	adds r0, r2, 0
	bl StringExpandPlaceholders
	b _08013158
	.pool
_08013150:
	ldr r1, =gUnknown_082EFC54
	adds r0, r2, 0
	bl StringExpandPlaceholders
_08013158:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80130B4

	thumb_func_start sub_8013160
sub_8013160: @ 8013160
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	subs r0, r1, 0x1
	cmp r0, 0x1B
	bhi _08013204
	lsls r0, 2
	ldr r1, =_0801317C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801317C:
	.4byte _080131EC
	.4byte _080131EC
	.4byte _080131FC
	.4byte _080131EC
	.4byte _08013204
	.4byte _08013204
	.4byte _08013204
	.4byte _08013204
	.4byte _080131FC
	.4byte _080131FC
	.4byte _080131FC
	.4byte _08013204
	.4byte _08013204
	.4byte _080131EC
	.4byte _080131FC
	.4byte _080131FC
	.4byte _08013204
	.4byte _08013204
	.4byte _08013204
	.4byte _08013204
	.4byte _080131EC
	.4byte _080131EC
	.4byte _080131FC
	.4byte _080131FC
	.4byte _080131FC
	.4byte _080131FC
	.4byte _080131FC
	.4byte _080131EC
_080131EC:
	ldr r1, =gUnknown_082EDDF4
	adds r0, r2, 0
	bl StringExpandPlaceholders
	b _08013204
	.pool
_080131FC:
	ldr r1, =gUnknown_082EDE0C
	adds r0, r2, 0
	bl StringExpandPlaceholders
_08013204:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8013160

	thumb_func_start sub_801320C
sub_801320C: @ 801320C
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	adds r5, r2, 0
	ldr r0, [r4]
	bl sub_80132D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08013228
	cmp r0, 0x2
	beq _0801325C
	b _08013270
_08013228:
	movs r0, 0x2
	bl audio_play
	ldrb r0, [r4, 0x12]
	bl sub_81AE70C
	ldr r0, =gStringVar2
	ldrb r2, [r4, 0x13]
	lsls r2, 5
	ldr r1, [r4]
	adds r1, r2
	bl sub_8018404
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_02022C2C
	ldrb r1, [r1]
	bl sub_8012FC4
	strb r6, [r4, 0xC]
	b _08013270
	.pool
_0801325C:
	movs r0, 0
	movs r1, 0
	bl sub_8011A64
	ldrb r0, [r4, 0x12]
	bl sub_81AE70C
	strb r5, [r4, 0xC]
	movs r0, 0x1
	b _08013272
_08013270:
	movs r0, 0
_08013272:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_801320C

	thumb_func_start sub_8013278
sub_8013278: @ 8013278
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r0, =gUnknown_02022C30
	ldr r3, [r0]
	movs r2, 0
	ldr r1, [r3]
	lsls r0, r4, 5
	adds r1, r0
	ldrb r0, [r1, 0x1A]
	lsls r0, 30
	lsrs r0, 30
	cmp r0, 0x1
	beq _080132A8
	cmp r0, 0x2
	beq _080132B2
	b _080132B4
	.pool
_080132A8:
	ldrb r0, [r1, 0x1B]
	cmp r0, 0
	beq _080132B4
	movs r2, 0x2
	b _080132B4
_080132B2:
	movs r2, 0x1
_080132B4:
	lsls r0, r4, 5
	ldr r3, [r3]
	adds r3, r0
	str r2, [sp]
	lsls r0, r4, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0
	adds r2, r6, 0
	bl sub_80178A0
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8013278

	thumb_func_start sub_80132D4
sub_80132D4: @ 80132D4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r0, =gUnknown_02022C30
	ldr r5, [r0]
	movs r0, 0
	mov r8, r0
	movs r3, 0x1
_080132E8:
	ldr r0, [r5]
	lsls r6, r3, 5
	adds r2, r0, r6
	ldrb r0, [r2, 0x1A]
	lsls r0, 30
	lsrs r0, 30
	mov r9, r0
	cmp r0, 0x1
	bne _08013348
	ldr r1, [r5, 0x4]
	adds r0, r2, 0
	str r3, [sp]
	bl sub_80176E4
	adds r4, r0, 0
	ldr r3, [sp]
	cmp r4, 0xFF
	beq _08013330
	ldr r1, [r5]
	ldr r0, [r5, 0x4]
	lsls r2, r4, 3
	subs r2, r4
	lsls r2, 2
	adds r1, r6
	adds r0, r2
	ldm r0!, {r2,r4,r7}
	stm r1!, {r2,r4,r7}
	ldm r0!, {r2,r4,r7}
	stm r1!, {r2,r4,r7}
	ldr r0, [r5]
	adds r0, r6
	mov r1, r9
	strh r1, [r0, 0x18]
	b _08013348
	.pool
_08013330:
	ldr r2, [r5]
	adds r2, r6
	ldrb r1, [r2, 0x1A]
	movs r4, 0x4
	negs r4, r4
	adds r0, r4, 0
	ands r1, r0
	movs r0, 0x2
	orrs r1, r0
	strb r1, [r2, 0x1A]
	movs r7, 0x2
	mov r8, r7
_08013348:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x4
	bls _080132E8
	movs r6, 0
	movs r4, 0x3
_08013356:
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	adds r1, r6
	movs r2, 0x5
	bl sub_8017734
	adds r6, 0x1C
	subs r4, 0x1
	ldr r0, [r5]
	cmp r4, 0
	bge _08013356
	mov r1, r8
	cmp r1, 0x2
	beq _08013388
	adds r1, r0, 0
	movs r4, 0x4
_08013376:
	ldrb r0, [r1, 0x1B]
	cmp r0, 0
	beq _08013380
	movs r2, 0x1
	mov r8, r2
_08013380:
	adds r1, 0x20
	subs r4, 0x1
	cmp r4, 0
	bge _08013376
_08013388:
	mov r0, r8
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80132D4

	thumb_func_start sub_8013398
sub_8013398: @ 8013398
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, =gUnknown_02022C30
	ldr r4, [r0]
	movs r3, 0
_080133A8:
	ldr r0, [r4, 0x8]
	lsls r2, r3, 5
	ldr r1, [r4]
	adds r0, r2
	adds r1, r2
	ldm r1!, {r2,r5,r6}
	stm r0!, {r2,r5,r6}
	ldm r1!, {r2,r5,r7}
	stm r0!, {r2,r5,r7}
	ldm r1!, {r6,r7}
	stm r0!, {r6,r7}
	adds r3, 0x1
	ldr r0, [r4, 0x8]
	ldr r1, [r4]
	cmp r3, 0x4
	ble _080133A8
	movs r5, 0
	mov r8, r1
	mov r9, r0
	movs r3, 0x4
_080133D0:
	mov r1, r9
	ldrb r0, [r1, 0x1A]
	lsls r0, 30
	lsrs r0, 30
	cmp r0, 0x1
	bne _080133F2
	lsls r0, r5, 5
	add r0, r8
	ldm r1!, {r2,r6,r7}
	stm r0!, {r2,r6,r7}
	ldm r1!, {r2,r6,r7}
	stm r0!, {r2,r6,r7}
	ldm r1!, {r2,r6}
	stm r0!, {r2,r6}
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_080133F2:
	movs r7, 0x20
	add r9, r7
	subs r3, 0x1
	cmp r3, 0
	bge _080133D0
	mov r10, r5
	cmp r5, 0x4
	bhi _08013454
	ldr r0, =gUnknown_082F045C
	mov r9, r0
	movs r1, 0
	mov r12, r1
	movs r2, 0x4
	negs r2, r2
	mov r8, r2
_08013410:
	ldr r1, [r4]
	lsls r3, r5, 5
	adds r1, r3
	mov r0, r9
	ldm r0!, {r2,r6,r7}
	stm r1!, {r2,r6,r7}
	ldm r0!, {r2,r6,r7}
	stm r1!, {r2,r6,r7}
	ldr r0, [r4]
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x18]
	ldr r1, [r4]
	adds r1, r3
	ldrb r2, [r1, 0x1A]
	mov r0, r8
	ands r0, r2
	strb r0, [r1, 0x1A]
	ldr r1, [r4]
	adds r1, r3
	ldrb r2, [r1, 0x1A]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1A]
	ldr r0, [r4]
	adds r0, r3
	mov r6, r12
	strb r6, [r0, 0x1B]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _08013410
_08013454:
	movs r3, 0
	ldr r1, [r4]
	ldrb r0, [r1, 0x1A]
	lsls r0, 30
	lsrs r0, 30
	cmp r0, 0x1
	bne _08013474
	ldrb r0, [r1, 0x1B]
	cmp r0, 0x40
	bne _08013474
	mov r10, r3
	b _08013494
	.pool
_08013474:
	adds r3, 0x1
	cmp r3, 0x4
	bgt _08013494
	lsls r0, r3, 5
	adds r2, r1, r0
	ldrb r0, [r2, 0x1A]
	lsls r0, 30
	lsrs r0, 30
	cmp r0, 0x1
	bne _08013474
	ldrb r0, [r2, 0x1B]
	cmp r0, 0x40
	bne _08013474
	lsls r0, r3, 24
	lsrs r0, 24
	mov r10, r0
_08013494:
	mov r0, r10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8013398

	thumb_func_start BerryBlenderLinkJoinGroup
BerryBlenderLinkJoinGroup: @ 80134A4
	push {lr}
	ldr r0, =sub_80134E8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, =gUnknown_02022C30
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, =gTasks + 0x8
	adds r1, r0
	str r1, [r2]
	ldr r0, =gUnknown_03000DA4
	str r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x8]
	strb r0, [r1, 0x9]
	ldr r1, =gUnknown_020375F0
	strh r0, [r1]
	pop {r0}
	bx r0
	.pool
	thumb_func_end BerryBlenderLinkJoinGroup

	thumb_func_start sub_80134E8
sub_80134E8: @ 80134E8
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, =gUnknown_02022C30
	ldr r6, [r0]
	ldrb r0, [r6, 0x8]
	cmp r0, 0x17
	bls _080134FC
	b _08013B82
_080134FC:
	lsls r0, 2
	ldr r1, =_08013510
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08013510:
	.4byte _08013570
	.4byte _080135E0
	.4byte _0801360C
	.4byte _080136D8
	.4byte _08013B82
	.4byte _08013788
	.4byte _080137C4
	.4byte _08013A10
	.4byte _08013A2C
	.4byte _08013A7A
	.4byte _08013A8C
	.4byte _08013B14
	.4byte _08013A8C
	.4byte _08013AE4
	.4byte _08013A8C
	.4byte _08013B24
	.4byte _08013B82
	.4byte _08013B82
	.4byte _08013A8C
	.4byte _08013B44
	.4byte _08013A8C
	.4byte _08013B78
	.4byte _08013B82
	.4byte _08013B68
_08013570:
	ldr r0, =gUnknown_020375E0
	ldrh r2, [r0]
	adds r3, r0, 0
	cmp r2, 0x14
	bne _08013590
	ldr r0, =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, =0x00000ca9
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _08013590
	adds r0, r2, 0x1
	strh r0, [r3]
_08013590:
	ldr r2, =gUnknown_02022C2C
	ldr r1, =gUnknown_082F0530
	ldrh r0, [r3]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r2]
	movs r1, 0
	movs r2, 0
	bl sub_8010F84
	bl sub_800B488
	bl sub_8009734
	bl sub_8011C5C
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r6, 0x4]
	movs r0, 0x80
	lsls r0, 2
	bl AllocZeroed
	str r0, [r6]
	movs r0, 0x1
	strb r0, [r6, 0x8]
	b _08013B82
	.pool
_080135E0:
	adds r0, r6, 0
	adds r0, 0x9
	ldr r2, =gUnknown_082EFB70
	ldr r1, =gUnknown_020375E0
	ldrh r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	bne _080135FC
	b _08013B82
_080135FC:
	movs r0, 0x2
	strb r0, [r6, 0x8]
	b _08013B82
	.pool
_0801360C:
	ldr r0, [r6, 0x4]
	movs r1, 0x4
	bl sub_80175EC
	ldr r0, [r6]
	movs r1, 0x10
	bl sub_8017580
	ldr r0, [r6, 0x4]
	ldr r1, =gUnknown_020375E0
	ldrh r1, [r1]
	bl sub_8016FC0
	movs r4, 0
	strb r0, [r6, 0x11]
	ldr r0, =gUnknown_082F00BC
	bl AddWindow
	strb r0, [r6, 0xC]
	ldr r0, =gUnknown_082F0174
	bl AddWindow
	strb r0, [r6, 0xB]
	ldr r0, =gUnknown_082F017C
	bl AddWindow
	strb r0, [r6, 0xD]
	ldrb r0, [r6, 0xC]
	movs r1, 0x22
	bl FillWindowPixelBuffer
	ldrb r0, [r6, 0xC]
	ldr r2, =gUnknown_082EF7DC
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x4
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0x8
	bl sub_80173E0
	ldrb r0, [r6, 0xC]
	bl PutWindowTilemap
	ldrb r0, [r6, 0xC]
	movs r1, 0x2
	bl CopyWindowToVram
	ldrb r0, [r6, 0xB]
	movs r1, 0
	bl sub_81973FC
	ldr r0, =gUnknown_03006310
	adds r2, r0, 0
	ldr r1, =gUnknown_082F0204
	ldm r1!, {r3,r5,r7}
	stm r2!, {r3,r5,r7}
	ldm r1!, {r3,r5,r7}
	stm r2!, {r3,r5,r7}
	ldrb r1, [r6, 0xB]
	strb r1, [r0, 0x10]
	movs r1, 0
	movs r2, 0
	bl ListMenuInit
	strb r0, [r6, 0xE]
	ldrb r0, [r6, 0xD]
	movs r1, 0
	bl sub_81973FC
	ldrb r0, [r6, 0xD]
	bl PutWindowTilemap
	ldrb r0, [r6, 0xD]
	bl sub_80125BC
	ldrb r0, [r6, 0xD]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	strb r4, [r6, 0xF]
	movs r0, 0x3
	strb r0, [r6, 0x8]
	b _08013B82
	.pool
_080136D8:
	bl sub_8013E44
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080136F2
	cmp r4, 0x1
	beq _080136EA
	b _08013A72
_080136EA:
	movs r0, 0x2
	bl audio_play
	b _08013A72
_080136F2:
	ldrb r0, [r6, 0xE]
	bl ListMenuHandleInput
	adds r4, r0, 0
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08013770
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08013770
	ldr r0, [r6]
	lsls r1, r4, 5
	adds r0, r1
	ldrb r1, [r0, 0xA]
	ldrb r0, [r0, 0x1A]
	lsls r0, 30
	lsrs r0, 30
	cmp r0, 0x1
	bne _08013768
	lsrs r0, r1, 7
	cmp r0, 0
	bne _08013768
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_8013B8C
	adds r1, r0, 0
	cmp r1, 0
	bne _08013744
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_8013BD8
	movs r0, 0x5
	b _08013756
	.pool
_08013744:
	ldr r0, =gStringVar4
	ldr r2, =gUnknown_082EDD50
	subs r1, 0x1
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	movs r0, 0x12
_08013756:
	strb r0, [r6, 0x8]
	movs r0, 0x6E
	bl audio_play
	b _08013B82
	.pool
_08013768:
	movs r0, 0x7
	bl audio_play
	b _08013B82
_08013770:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0801377E
	b _08013B82
_0801377E:
	movs r0, 0xA
	strb r0, [r6, 0x8]
	b _08013B82
	.pool
_08013788:
	ldr r4, =gStringVar4
	ldr r0, =gUnknown_02022C2C
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_80130B4
	adds r0, r6, 0
	adds r0, 0x9
	adds r1, r4, 0
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	bne _080137A6
	b _08013B82
_080137A6:
	ldr r0, =gStringVar1
	ldrb r2, [r6, 0xF]
	lsls r2, 5
	ldr r1, [r6]
	adds r1, r2
	bl sub_8018404
	b _08013A86
	.pool
_080137C4:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	beq _0801387A
	ldr r4, =gUnknown_02022C2C
	ldr r1, [r6]
	ldrb r0, [r6, 0xF]
	lsls r0, 5
	adds r1, r0
	ldrb r0, [r1, 0xA]
	lsls r0, 25
	lsrs r0, 25
	strb r0, [r4]
	movs r0, 0
	movs r1, 0
	bl sub_8011A64
	ldrb r0, [r4]
	subs r0, 0x1
	cmp r0, 0x1B
	bhi _0801387A
	lsls r0, 2
	ldr r1, =_08013804
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08013804:
	.4byte _08013874
	.4byte _08013874
	.4byte _08013874
	.4byte _08013874
	.4byte _08013874
	.4byte _0801387A
	.4byte _0801387A
	.4byte _0801387A
	.4byte _08013874
	.4byte _08013874
	.4byte _08013874
	.4byte _0801387A
	.4byte _08013874
	.4byte _08013874
	.4byte _08013874
	.4byte _08013874
	.4byte _0801387A
	.4byte _0801387A
	.4byte _0801387A
	.4byte _0801387A
	.4byte _08013874
	.4byte _08013874
	.4byte _08013874
	.4byte _08013874
	.4byte _08013874
	.4byte _08013874
	.4byte _08013874
	.4byte _08013874
_08013874:
	movs r0, 0x14
	strb r0, [r6, 0x8]
	b _08013B82
_0801387A:
	bl sub_8011A74
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x8
	bls _0801388A
	b _080139EC
_0801388A:
	lsls r0, 2
	ldr r1, =_08013898
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08013898:
	.4byte _080138BC
	.4byte _080138C2
	.4byte _080139EC
	.4byte _080139EC
	.4byte _080138C8
	.4byte _080138C2
	.4byte _08013934
	.4byte _080139EC
	.4byte _080138C2
_080138BC:
	movs r0, 0xC
	strb r0, [r6, 0x8]
	b _080139EC
_080138C2:
	movs r0, 0xE
	strb r0, [r6, 0x8]
	b _080139EC
_080138C8:
	ldr r5, =gStringVar4
	ldr r4, =gUnknown_02022C2C
	ldrb r1, [r4]
	adds r0, r5, 0
	bl sub_8013160
	adds r0, r6, 0
	adds r0, 0x9
	adds r1, r5, 0
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	bne _080138E6
	b _080139EC
_080138E6:
	ldrb r0, [r4]
	cmp r0, 0x1C
	beq _080138F0
	cmp r0, 0xE
	bne _08013904
_080138F0:
	movs r0, 0xC
	movs r1, 0
	bl sub_8011A64
	b _080139EC
	.pool
_08013904:
	movs r0, 0x7
	movs r1, 0
	bl sub_8011A64
	ldr r0, =gStringVar1
	ldr r2, =gUnknown_082F0048
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r1, =gUnknown_082EDE48
	adds r0, r5, 0
	bl StringExpandPlaceholders
	b _080139EC
	.pool
_08013934:
	ldrb r0, [r6, 0x15]
	adds r2, r0, 0
	cmp r2, 0xF0
	bls _0801395C
	adds r0, r6, 0
	adds r0, 0x9
	ldr r1, =gStringVar4
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	beq _080139EC
	movs r0, 0xC
	movs r1, 0
	bl sub_8011A64
	movs r0, 0
	b _080139EA
	.pool
_0801395C:
	ldr r0, =gUnknown_02022C2C
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, 0x1B
	bhi _080139E8
	lsls r0, 2
	ldr r1, =_08013978
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08013978:
	.4byte _080139EC
	.4byte _080139EC
	.4byte _080139E8
	.4byte _080139EC
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139EC
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139E8
	.4byte _080139EC
_080139E8:
	adds r0, r2, 0x1
_080139EA:
	strb r0, [r6, 0x15]
_080139EC:
	bl sub_8011A74
	lsls r0, 24
	cmp r0, 0
	beq _080139F8
	b _08013B82
_080139F8:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08013A06
	b _08013B82
_08013A06:
	movs r0, 0x7
	strb r0, [r6, 0x8]
	b _08013B82
	.pool
_08013A10:
	adds r0, r6, 0
	adds r0, 0x9
	ldr r1, =gUnknown_082EDE64
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	bne _08013A22
	b _08013B82
_08013A22:
	movs r0, 0x8
	strb r0, [r6, 0x8]
	b _08013B82
	.pool
_08013A2C:
	adds r4, r6, 0
	adds r4, 0x9
	bl sub_8011A74
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_80170B8
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08013A6A
	cmp r1, r0
	bgt _08013A58
	subs r0, 0x2
	cmp r1, r0
	beq _08013A6E
	b _08013B82
_08013A58:
	cmp r1, 0
	beq _08013A62
	cmp r1, 0x1
	beq _08013A6A
	b _08013B82
_08013A62:
	bl sub_80106D4
	movs r0, 0x9
	b _08013A70
_08013A6A:
	movs r0, 0x5
	b _08013A70
_08013A6E:
	movs r0, 0x6
_08013A70:
	strb r0, [r6, 0x8]
_08013A72:
	ldrb r0, [r6, 0xE]
	bl sub_81AE70C
	b _08013B82
_08013A7A:
	bl sub_8011A74
	lsls r0, 24
	cmp r0, 0
	bne _08013A86
	b _08013B82
_08013A86:
	movs r0, 0x6
	strb r0, [r6, 0x8]
	b _08013B82
_08013A8C:
	ldrb r0, [r6, 0xD]
	bl ClearWindowTilemap
	ldrb r0, [r6, 0xD]
	movs r1, 0
	bl sub_819746C
	ldrb r0, [r6, 0xE]
	movs r1, 0
	movs r2, 0
	bl sub_81AE6C8
	ldrb r0, [r6, 0xC]
	bl ClearWindowTilemap
	ldrb r0, [r6, 0xB]
	movs r1, 0
	bl sub_819746C
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r6, 0xD]
	bl RemoveWindow
	ldrb r0, [r6, 0xB]
	bl RemoveWindow
	ldrb r0, [r6, 0xC]
	bl RemoveWindow
	ldrb r0, [r6, 0x11]
	bl DestroyTask
	ldr r0, [r6]
	bl Free
	ldr r0, [r6, 0x4]
	bl Free
	ldrb r0, [r6, 0x8]
	adds r0, 0x1
	strb r0, [r6, 0x8]
	b _08013B82
_08013AE4:
	bl sub_800E084
	adds r5, r6, 0
	adds r5, 0x9
	ldr r4, =gUnknown_082EDE9C
	bl sub_8011A74
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	beq _08013B82
	ldr r0, =gUnknown_020375F0
	movs r1, 0x6
	b _08013B58
	.pool
_08013B14:
	bl sub_800E084
	ldr r0, =gUnknown_020375F0
	movs r1, 0x5
	b _08013B58
	.pool
_08013B24:
	bl sub_800E084
	adds r5, r6, 0
	adds r5, 0x9
	ldr r4, =gUnknown_082EDE9C
	bl sub_8011A74
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	b _08013B4A
	.pool
_08013B44:
	adds r0, r6, 0
	adds r0, 0x9
	ldr r1, =gStringVar4
_08013B4A:
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	beq _08013B82
	ldr r0, =gUnknown_020375F0
	movs r1, 0x8
_08013B58:
	strh r1, [r0]
	movs r0, 0x17
	strb r0, [r6, 0x8]
	b _08013B82
	.pool
_08013B68:
	adds r0, r4, 0
	bl DestroyTask
	bl sub_80173D4
	bl sub_800EDD4
	b _08013B82
_08013B78:
	bl sub_80149C4
	adds r0, r4, 0
	bl DestroyTask
_08013B82:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80134E8

	thumb_func_start sub_8013B8C
sub_8013B8C: @ 8013B8C
	push {lr}
	lsls r1, 5
	ldr r0, [r0]
	adds r3, r0, r1
	ldr r0, =gUnknown_02022C2C
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _08013BCE
	ldrb r1, [r3, 0x1]
	movs r0, 0x3C
	ands r0, r1
	cmp r0, 0xC
	beq _08013BCE
	ldr r0, =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r1, [r0, 0x9]
	movs r2, 0x80
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _08013BC4
	movs r0, 0x1
	b _08013BD4
	.pool
_08013BC4:
	ldrb r1, [r3]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08013BD2
_08013BCE:
	movs r0, 0
	b _08013BD4
_08013BD2:
	movs r0, 0x2
_08013BD4:
	pop {r1}
	bx r1
	thumb_func_end sub_8013B8C

	thumb_func_start sub_8013BD8
sub_8013BD8: @ 8013BD8
	push {r4,lr}
	adds r4, r0, 0
	strb r1, [r4, 0xF]
	bl sub_800E0E8
	movs r0, 0
	movs r1, 0
	bl sub_800DFB4
	ldrb r0, [r4, 0xE]
	bl sub_81AE70C
	ldr r0, =gStringVar1
	ldrb r2, [r4, 0xF]
	lsls r2, 5
	ldr r1, [r4]
	adds r1, r2
	bl sub_8018404
	ldr r1, =gUnknown_082F0530
	ldr r0, =gUnknown_020375E0
	ldrh r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0x1
	bl sub_8011090
	ldrb r1, [r4, 0xF]
	lsls r1, 5
	ldr r0, [r4]
	adds r0, r1
	adds r4, r0, 0
	adds r4, 0x10
	adds r0, 0x2
	bl sub_8015658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8011FC8
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8013BD8

	thumb_func_start sub_8013C40
sub_8013C40: @ 8013C40
	push {lr}
	ldr r0, =sub_8013C7C
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r3, =gUnknown_02022C30
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, =gTasks + 0x8
	adds r1, r2
	str r1, [r3]
	movs r2, 0
	strb r2, [r1, 0x8]
	strb r2, [r1, 0x9]
	ldr r2, =gUnknown_03000DA4
	str r1, [r2]
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8013C40

	thumb_func_start sub_8013C7C
sub_8013C7C: @ 8013C7C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, =gUnknown_02022C30
	ldr r4, [r0]
	ldrb r0, [r4, 0x8]
	cmp r0, 0xB
	bhi _08013D80
	lsls r0, 2
	ldr r1, =_08013CA0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08013CA0:
	.4byte _08013CD0
	.4byte _08013D80
	.4byte _08013D04
	.4byte _08013D28
	.4byte _08013D80
	.4byte _08013D80
	.4byte _08013D80
	.4byte _08013D80
	.4byte _08013D80
	.4byte _08013D80
	.4byte _08013D58
	.4byte _08013D76
_08013CD0:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_8010F84
	bl sub_800B488
	bl sub_8009734
	bl sub_8011C5C
	movs r0, 0x1
	bl sub_80111B0
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r4, 0x4]
	movs r0, 0x80
	lsls r0, 2
	bl AllocZeroed
	str r0, [r4]
	movs r0, 0x2
	strb r0, [r4, 0x8]
	b _08013D80
_08013D04:
	ldr r0, [r4, 0x4]
	movs r1, 0x4
	bl sub_80175EC
	ldr r0, [r4]
	movs r1, 0x10
	bl sub_8017580
	ldr r0, [r4, 0x4]
	movs r1, 0xFF
	bl sub_8016FC0
	movs r1, 0
	strb r0, [r4, 0x11]
	strb r1, [r4, 0xF]
	movs r0, 0x3
	strb r0, [r4, 0x8]
	b _08013D80
_08013D28:
	bl sub_8013E44
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08013D3A
	movs r0, 0x2
	bl audio_play
_08013D3A:
	ldr r0, =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x26
	ldrsh r0, [r1, r2]
	cmp r0, 0xFF
	bne _08013D80
	movs r0, 0xA
	strb r0, [r4, 0x8]
	b _08013D80
	.pool
_08013D58:
	ldrb r0, [r4, 0x11]
	bl DestroyTask
	ldr r0, [r4]
	bl Free
	ldr r0, [r4, 0x4]
	bl Free
	bl sub_800EDD4
	ldrb r0, [r4, 0x8]
	adds r0, 0x1
	strb r0, [r4, 0x8]
	b _08013D80
_08013D76:
	bl sub_800EDD4
	adds r0, r5, 0
	bl DestroyTask
_08013D80:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8013C7C

	thumb_func_start sub_8013D88
sub_8013D88: @ 8013D88
	push {lr}
	adds r2, r0, 0
	cmp r1, 0xFF
	bne _08013D94
_08013D90:
	movs r0, 0x1
	b _08013DB8
_08013D94:
	cmp r1, 0x16
	bhi _08013DB6
	ldr r0, =gUnknown_082F04D8
	lsls r1, 2
	adds r1, r0
	ldr r1, [r1]
	b _08013DB0
	.pool
_08013DA8:
	ldrb r0, [r1]
	cmp r0, r2
	beq _08013D90
	adds r1, 0x1
_08013DB0:
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08013DA8
_08013DB6:
	movs r0, 0
_08013DB8:
	pop {r1}
	bx r1
	thumb_func_end sub_8013D88

	thumb_func_start sub_8013DBC
sub_8013DBC: @ 8013DBC
	push {lr}
	ldr r0, [r0]
	lsls r1, 5
	adds r1, r0, r1
	ldrb r2, [r1, 0x1A]
	lsls r0, r2, 30
	lsrs r0, 30
	cmp r0, 0x1
	bne _08013DEE
	ldrb r0, [r1, 0xA]
	lsrs r0, 7
	cmp r0, 0
	beq _08013DDA
	movs r0, 0x3
	b _08013DF0
_08013DDA:
	lsls r0, r2, 29
	cmp r0, 0
	bge _08013DE4
	movs r0, 0x1
	b _08013DF0
_08013DE4:
	ldrb r0, [r1, 0x1B]
	cmp r0, 0
	beq _08013DEE
	movs r0, 0x2
	b _08013DF0
_08013DEE:
	movs r0, 0
_08013DF0:
	pop {r1}
	bx r1
	thumb_func_end sub_8013DBC

	thumb_func_start sub_8013DF4
sub_8013DF4: @ 8013DF4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r0, =gUnknown_02022C30
	ldr r0, [r0]
	mov r8, r0
	bl sub_8013DBC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r4, 5
	mov r2, r8
	ldr r3, [r2]
	adds r3, r1
	str r0, [sp]
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0x8
	adds r2, r6, 0
	bl sub_80177B8
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8013DF4

	thumb_func_start sub_8013E44
sub_8013E44: @ 8013E44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r0, =gUnknown_02022C30
	ldr r6, [r0]
	movs r7, 0
	movs r3, 0
_08013E54:
	ldr r0, [r6]
	lsls r5, r3, 5
	adds r2, r0, r5
	ldrb r0, [r2, 0x1A]
	lsls r0, 30
	mov r8, r5
	cmp r0, 0
	beq _08013F20
	ldr r1, [r6, 0x4]
	adds r0, r2, 0
	str r3, [sp]
	bl sub_80176E4
	adds r4, r0, 0
	ldr r3, [sp]
	cmp r4, 0xFF
	beq _08013EEE
	ldr r0, [r6]
	adds r2, r0, r5
	ldrb r1, [r2, 0x1A]
	lsls r0, r1, 30
	lsrs r0, 30
	cmp r0, 0x1
	bne _08013ECC
	lsls r0, r4, 3
	subs r0, r4
	lsls r4, r0, 2
	ldr r1, [r6, 0x4]
	adds r1, r4
	adds r0, r2, 0
	bl sub_8017678
	ldr r3, [sp]
	cmp r0, 0
	beq _08013EB0
	ldr r1, [r6]
	ldr r0, [r6, 0x4]
	adds r1, r5
	adds r0, r4
	ldm r0!, {r2,r4,r7}
	stm r1!, {r2,r4,r7}
	ldm r0!, {r2,r4,r7}
	stm r1!, {r2,r4,r7}
	b _08013EDA
	.pool
_08013EB0:
	ldr r0, [r6]
	adds r1, r0, r5
	ldrb r0, [r1, 0x1B]
	cmp r0, 0
	beq _08013EE4
	subs r0, 0x1
	strb r0, [r1, 0x1B]
	ldr r0, [r6]
	adds r0, r5
	ldrb r0, [r0, 0x1B]
	cmp r0, 0
	bne _08013EE4
	movs r7, 0x2
	b _08013EE4
_08013ECC:
	movs r4, 0x4
	negs r4, r4
	adds r0, r4, 0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1A]
_08013EDA:
	ldr r0, [r6]
	adds r0, r5
	movs r1, 0x40
	strb r1, [r0, 0x1B]
	movs r7, 0x1
_08013EE4:
	ldr r0, [r6]
	add r0, r8
	movs r1, 0
	strh r1, [r0, 0x18]
	b _08013F20
_08013EEE:
	ldr r0, [r6]
	adds r1, r0, r5
	ldrb r0, [r1, 0x1A]
	lsls r0, 30
	lsrs r0, 30
	cmp r0, 0x2
	beq _08013F20
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	strh r0, [r1, 0x18]
	ldr r0, [r6]
	adds r2, r0, r5
	ldrh r1, [r2, 0x18]
	ldr r0, =0x0000012b
	cmp r1, r0
	bls _08013F20
	ldrb r0, [r2, 0x1A]
	movs r7, 0x4
	negs r7, r7
	adds r1, r7, 0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2, 0x1A]
	movs r7, 0x2
_08013F20:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xF
	bls _08013E54
	movs r5, 0
	movs r4, 0x3
_08013F2E:
	ldr r0, [r6]
	ldr r1, [r6, 0x4]
	adds r1, r5
	movs r2, 0x10
	bl sub_8017734
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08013F44
	movs r7, 0x1
_08013F44:
	adds r5, 0x1C
	subs r4, 0x1
	cmp r4, 0
	bge _08013F2E
	adds r0, r7, 0
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8013E44

	thumb_func_start sub_8013F60
sub_8013F60: @ 8013F60
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80773AC
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8013F60

	thumb_func_start sub_8013F78
sub_8013F78: @ 8013F78
	push {lr}
	ldr r0, =sub_8013F60
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8013F78

	thumb_func_start sub_8013F90
sub_8013F90: @ 8013F90
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, =gUnknown_02022C40
	mov r8, r0
	bl link_get_multiplayer_id
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_8018120
	adds r7, r0, 0
	ldr r1, =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08013FFC
	cmp r0, 0x1
	bgt _08013FD4
	cmp r0, 0
	beq _08013FDE
	b _080140BC
	.pool
_08013FD4:
	cmp r0, 0x2
	beq _08014038
	cmp r0, 0x3
	beq _08014070
	b _080140BC
_08013FDE:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, =gPlayerParty
	adds r1, r0
	movs r0, 0
	movs r2, 0x64
	bl link_0800A448
	b _080140BC
	.pool
_08013FFC:
	bl sub_800A550
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _080140BC
	bl link_get_multiplayer_id
	adds r1, r0, 0
	ldr r0, =gEnemyParty
	movs r2, 0x1
	eors r1, r2
	lsls r1, 24
	lsrs r1, 16
	ldr r2, =gUnknown_020223C4
	adds r1, r2
	movs r2, 0x64
	bl memcpy
	movs r0, 0x32
	bl sav12_xor_increment
	bl sub_800A5B4
	b _0801405A
	.pool
_08014038:
	ldr r4, =gUnknown_020228C4
	ldr r0, =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r0, =0x00002be0
	adds r1, r0
	adds r0, r4, 0
	movs r2, 0xDC
	bl memcpy
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0xDC
	bl link_0800A448
	lsls r0, 24
	cmp r0, 0
	beq _080140BC
_0801405A:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080140BC
	.pool
_08014070:
	bl sub_800A550
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _080140BC
	ldr r4, =gUnknown_020321C0
	bl link_get_multiplayer_id
	adds r1, r0, 0
	movs r0, 0x1
	eors r1, r0
	lsls r1, 24
	lsrs r1, 16
	ldr r0, =gUnknown_020223C4
	adds r1, r0
	adds r0, r4, 0
	movs r2, 0xD8
	bl memcpy
	bl sub_800A5B4
	ldr r1, =gUnknown_02032298
	strb r7, [r1]
	movs r0, 0x6
	strb r0, [r1, 0x1]
	ldr r1, =gMain
	ldr r0, =c2_exit_to_overworld_2_switch
	str r0, [r1, 0x8]
	ldr r0, =sub_807AE50
	bl SetMainCallback2
	mov r0, r8
	bl sub_801807C
	adds r0, r6, 0
	bl DestroyTask
_080140BC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8013F90

	thumb_func_start sub_80140E0
sub_80140E0: @ 80140E0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08014104
	cmp r0, 0x1
	beq _0801411C
	b _0801419E
	.pool
_08014104:
	bl link_get_multiplayer_id
	lsls r0, 24
	cmp r0, 0
	bne _08014114
	movs r0, 0x2
	bl sub_800A4D8
_08014114:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0801419E
_0801411C:
	bl sub_800A550
	adds r4, r0, 0
	bl sub_800A9D8
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _0801419E
	movs r4, 0
	ldr r5, =gUnknown_020229E8
	b _08014152
	.pool
_08014138:
	lsls r1, r4, 8
	ldr r0, =gUnknown_020223C4
	adds r3, r1, r0
	movs r0, 0x64
	muls r0, r4
	ldr r1, =gUnknown_02039B58
	adds r0, r1
	ldrb r2, [r5]
	adds r1, r3, 0
	bl sub_80C3120
	adds r5, 0x1C
	adds r4, 0x1
_08014152:
	bl sub_8009FCC
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _08014138
	bl sub_8009FCC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08014190
	bl link_get_multiplayer_id
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 16
	ldr r1, =gUnknown_020223C4
	adds r3, r0, r1
	adds r0, r3, 0
	adds r0, 0x60
	ldrh r0, [r0]
	bl sub_801B94C
	b _08014194
	.pool
_08014190:
	bl sub_801B940
_08014194:
	bl sub_800A5B4
	adds r0, r6, 0
	bl DestroyTask
_0801419E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80140E0

	thumb_func_start sub_80141A4
sub_80141A4: @ 80141A4
	push {r4,lr}
	ldr r0, =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _080141C0
	cmp r0, 0x1
	beq _080141D4
	b _080141F2
	.pool
_080141C0:
	ldr r0, =sub_80140E0
	movs r1, 0x5
	bl CreateTask
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _080141F2
	.pool
_080141D4:
	ldr r0, =sub_80140E0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _080141F2
	bl link_get_multiplayer_id
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r1, =c2_exit_to_overworld_2_switch
	bl sub_80C4E74
_080141F2:
	bl RunTasks
	bl RunTextPrinters
	bl CallObjectCallbacks
	bl PrepareSpritesForOamLoad
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80141A4

	thumb_func_start sub_8014210
sub_8014210: @ 8014210
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	bl sp000_heal_pokemon
	bl copy_player_party_to_sav1
	bl copy_bags_and_unk_data_from_save_blocks
	ldr r5, =gUnknown_020229E8
	ldr r0, =0x00002211
	str r0, [r5, 0x14]
	bl link_get_multiplayer_id
	adds r4, r0, 0
	bl link_get_multiplayer_id
	lsls r4, 24
	lsrs r4, 24
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x18]
	bl link_get_multiplayer_id
	adds r4, r0, 0
	bl link_get_multiplayer_id
	movs r2, 0x1
	eors r4, r2
	lsls r4, 24
	lsrs r4, 24
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	adds r1, r5
	eors r0, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x18]
	ldr r1, =gMain
	ldr r0, =sub_80B360C
	str r0, [r1, 0x8]
	ldr r0, =gBattleTypeFlags
	str r6, [r0]
	bl sub_806E64C
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8014210

	thumb_func_start sub_8014290
sub_8014290: @ 8014290
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r3, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r0, =0x00004087
	adds r1, r3, 0
	bl VarSet
	ldr r6, =gSaveBlock1Ptr
	ldr r1, [r6]
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	mov r8, r2
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	str r5, [sp]
	adds r3, r4, 0
	bl warp1_set
	ldr r0, [r6]
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	movs r2, 0x5
	ldrsb r2, [r0, r2]
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0
	mov r3, r8
	bl saved_warp2_set_2
	bl warp_in
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8014290

	thumb_func_start sub_8014304
sub_8014304: @ 8014304
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	mov r8, r2
	adds r6, r3, 0
	ldr r1, [sp, 0x18]
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r0, =gUnknown_020375E0
	strh r1, [r0]
	ldr r0, =0x00004087
	bl VarSet
	bl sub_8009FCC
	ldr r1, =gUnknown_03005DB8
	strb r0, [r1]
	bl link_get_multiplayer_id
	ldr r1, =gUnknown_03005DB4
	strb r0, [r1]
	bl sub_809D2BC
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	movs r2, 0x1
	negs r2, r2
	mov r0, r8
	lsls r0, 24
	asrs r0, 24
	mov r8, r0
	lsls r6, 24
	asrs r6, 24
	str r6, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	mov r3, r8
	bl warp1_set
	bl warp_in
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8014304

	thumb_func_start sub_8014384
sub_8014384: @ 8014384
	push {r4,lr}
	ldr r0, =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _080143A0
	cmp r0, 0x1
	beq _080143B4
	b _080143C6
	.pool
_080143A0:
	ldr r0, =sub_80140E0
	movs r1, 0x5
	bl CreateTask
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _080143C6
	.pool
_080143B4:
	ldr r0, =sub_80140E0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _080143C6
	ldr r0, =sub_8086074
	bl SetMainCallback2
_080143C6:
	bl RunTasks
	bl RunTextPrinters
	bl CallObjectCallbacks
	bl PrepareSpritesForOamLoad
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8014384

	thumb_func_start sub_80143E4
sub_80143E4: @ 80143E4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_80C30A4
	cmp r5, 0
	beq _080143FE
	bl sub_801B39C
	adds r1, r4, 0
	adds r1, 0x60
	strh r0, [r1]
	b _08014404
_080143FE:
	adds r0, r4, 0
	adds r0, 0x60
	strh r5, [r0]
_08014404:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80143E4

	thumb_func_start sub_801440C
sub_801440C: @ 801440C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_801B940
	ldr r0, =gUnknown_02022C2C
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, 0xE
	bhi _08014474
	lsls r0, 2
	ldr r1, =_08014434
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08014434:
	.4byte _08014470
	.4byte _08014470
	.4byte _08014470
	.4byte _08014470
	.4byte _08014474
	.4byte _08014474
	.4byte _08014474
	.4byte _08014474
	.4byte _08014470
	.4byte _08014470
	.4byte _08014470
	.4byte _08014474
	.4byte _08014470
	.4byte _08014474
	.4byte _08014470
_08014470:
	bl sub_800E3A8
_08014474:
	ldr r0, =gUnknown_02022C2C
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, 0x50
	bls _08014480
	b _08014764
_08014480:
	lsls r0, 2
	ldr r1, =_08014494
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08014494:
	.4byte _080145F4
	.4byte _08014620
	.4byte _0801464C
	.4byte _08014678
	.4byte _080146D8
	.4byte _08014764
	.4byte _08014764
	.4byte _080146FC
	.4byte _08014714
	.4byte _08014734
	.4byte _0801474C
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014698
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _080145D8
	.4byte _08014764
	.4byte _08014764
	.4byte _080146C4
	.4byte _080146D8
	.4byte _08014764
	.4byte _08014764
	.4byte _080146FC
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _08014764
	.4byte _080145D8
_080145D8:
	bl overworld_free_bg_tilemaps
	ldr r1, =gMain
	ldr r0, =sub_801AC54
	str r0, [r1, 0x8]
	movs r0, 0x3
	bl sub_81B8518
	b _08014764
	.pool
_080145F4:
	bl overworld_free_bg_tilemaps
	ldr r0, =gUnknown_020228C4
	movs r1, 0x1
	bl sub_80143E4
	bl sp000_heal_pokemon
	bl copy_player_party_to_sav1
	bl copy_bags_and_unk_data_from_save_blocks
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x19
	movs r1, 0x18
	movs r2, 0x6
	movs r3, 0x8
	b _080146B0
	.pool
_08014620:
	bl overworld_free_bg_tilemaps
	bl sp000_heal_pokemon
	bl copy_player_party_to_sav1
	bl copy_bags_and_unk_data_from_save_blocks
	ldr r0, =gUnknown_020228C4
	movs r1, 0x1
	bl sub_80143E4
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x19
	movs r1, 0x18
	movs r2, 0x6
	movs r3, 0x8
	b _080146B0
	.pool
_0801464C:
	bl overworld_free_bg_tilemaps
	bl sp000_heal_pokemon
	bl copy_player_party_to_sav1
	bl copy_bags_and_unk_data_from_save_blocks
	ldr r0, =gUnknown_020228C4
	movs r1, 0x1
	bl sub_80143E4
	movs r0, 0x5
	str r0, [sp]
	movs r0, 0x19
	movs r1, 0x1B
	movs r2, 0x5
	movs r3, 0x8
	b _080146B0
	.pool
_08014678:
	ldr r0, =gUnknown_020228C4
	movs r1, 0x1
	bl sub_80143E4
	bl overworld_free_bg_tilemaps
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x19
	movs r1, 0x19
	movs r2, 0x5
	movs r3, 0x8
	b _080146B0
	.pool
_08014698:
	ldr r0, =gUnknown_020228C4
	movs r1, 0x1
	bl sub_80143E4
	bl overworld_free_bg_tilemaps
	movs r0, 0x4
	str r0, [sp]
	movs r0, 0x19
	movs r1, 0x1A
	movs r2, 0x8
	movs r3, 0x9
_080146B0:
	bl sub_8014304
	ldr r0, =sub_8014384
	bl SetMainCallback2
	b _08014764
	.pool
_080146C4:
	bl overworld_free_bg_tilemaps
	ldr r0, =sub_8013F90
	movs r1, 0
	bl CreateTask
	b _08014764
	.pool
_080146D8:
	bl link_get_multiplayer_id
	lsls r0, 24
	cmp r0, 0
	bne _080146E8
	bl sub_800ED10
	b _080146F6
_080146E8:
	bl sub_800ED28
	movs r0, 0x45
	movs r1, 0
	movs r2, 0x1
	bl sub_8010F84
_080146F6:
	bl sub_801DD98
	b _08014764
_080146FC:
	ldr r0, =gUnknown_020228C4
	movs r1, 0
	bl sub_80143E4
	ldr r0, =sub_80141A4
	bl SetMainCallback2
	b _08014764
	.pool
_08014714:
	movs r0, 0x8
	movs r1, 0x5
	movs r2, 0x1
	bl sub_8014290
	bl brm_get_pokemon_selection
	lsls r0, 24
	lsrs r0, 24
	ldr r1, =c2_load_new_map
	bl sub_802A9A8
	b _08014764
	.pool
_08014734:
	movs r0, 0x7
	movs r1, 0x9
	movs r2, 0x1
	bl sub_8014290
	ldr r0, =c2_load_new_map
	bl sub_8020C70
	b _08014764
	.pool
_0801474C:
	movs r0, 0x8
	movs r1, 0x5
	movs r2, 0x1
	bl sub_8014290
	bl brm_get_pokemon_selection
	lsls r0, 24
	lsrs r0, 24
	ldr r1, =c2_load_new_map
	bl sub_802493C
_08014764:
	adds r0, r4, 0
	bl DestroyTask
	ldr r1, =gUnknown_020375F0
	movs r0, 0x1
	strh r0, [r1]
	ldr r0, =gUnknown_02022C2C
	ldrb r0, [r0]
	cmp r0, 0x44
	beq _0801477C
	bl script_env_2_disable
_0801477C:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801440C

	thumb_func_start sub_8014790
sub_8014790: @ 8014790
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, =gTasks + 0x8
	adds r7, r0, r1
	ldr r0, =gUnknown_020228C4
	mov r9, r0
	movs r1, 0
	ldrsh r0, [r7, r1]
	mov r2, r9
	cmp r0, 0x8
	bls _080147B6
	b _080149B2
_080147B6:
	lsls r0, 2
	ldr r1, =_080147CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_080147CC:
	.4byte _080147F0
	.4byte _080148CC
	.4byte _080148E4
	.4byte _0801491E
	.4byte _08014934
	.4byte _0801494A
	.4byte _08014986
	.4byte _08014992
	.4byte _0801499C
_080147F0:
	ldr r1, =gUnknown_020375F0
	movs r0, 0x1
	strh r0, [r1]
	ldr r0, =gUnknown_02022C2C
	ldrb r0, [r0]
	subs r0, 0xE
	cmp r0, 0xE
	bhi _080148C2
	lsls r0, 2
	ldr r1, =_08014818
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08014818:
	.4byte _08014854
	.4byte _080148C2
	.4byte _080148B8
	.4byte _080148C2
	.4byte _080148C2
	.4byte _080148C2
	.4byte _080148C2
	.4byte _080148C2
	.4byte _080148C2
	.4byte _080148B8
	.4byte _080148B8
	.4byte _080148B8
	.4byte _080148B8
	.4byte _080148B8
	.4byte _08014854
_08014854:
	ldr r1, =gUnknown_020229E8
	ldr r0, =0x00002211
	str r0, [r1, 0x14]
	movs r2, 0
	mov r8, r2
	mov r0, r8
	strh r0, [r1, 0x18]
	movs r0, 0x2
	strh r0, [r1, 0x34]
	ldr r6, =gUnknown_0203CEF8
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, =gUnknown_02024488
	adds r0, r4
	movs r1, 0xB
	bl GetMonData
	mov r1, r9
	strh r0, [r1]
	ldrb r0, [r6, 0x1]
	muls r0, r5
	adds r0, r4
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	mov r2, r9
	strh r0, [r2, 0x2]
	ldr r0, =gMain
	mov r1, r8
	str r1, [r0, 0x8]
	movs r0, 0x4
	strh r0, [r7]
	bl sub_800E3A8
	bl sub_800A5B4
	b _080149B2
	.pool
_080148B8:
	bl sub_800E3A8
	adds r0, r4, 0
	bl DestroyTask
_080148C2:
	bl script_env_2_enable_and_set_ctx_running
	movs r0, 0x1
	strh r0, [r7]
	b _080149B2
_080148CC:
	bl script_env_context_is_running
	lsls r0, 24
	cmp r0, 0
	bne _080149B2
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	movs r0, 0x2
	strh r0, [r7]
	b _080149B2
_080148E4:
	ldr r0, =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080149B2
	ldr r0, =gUnknown_02022C2C
	ldrb r0, [r0]
	cmp r0, 0x1D
	bne _08014914
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, =sub_80773AC
	bl SetMainCallback2
	b _080149B2
	.pool
_08014914:
	bl sub_800ADF8
	movs r0, 0x3
	strh r0, [r7]
	b _080149B2
_0801491E:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _080149B2
	adds r0, r4, 0
	bl DestroyTask
	bl sub_80149D8
	b _080149B2
_08014934:
	movs r0, 0
	adds r1, r2, 0
	movs r2, 0xE
	bl link_0800A448
	lsls r0, 24
	cmp r0, 0
	beq _080149B2
	movs r0, 0x5
	strh r0, [r7]
	b _080149B2
_0801494A:
	bl sub_800A550
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _080149B2
	bl sub_800A5B4
	ldr r0, =gUnknown_020223C4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r0, r2
	bl sub_80B2AF4
	cmp r0, 0
	beq _08014980
	ldr r0, =gUnknown_020375F0
	movs r1, 0xB
	strh r1, [r0]
	movs r0, 0x7
	strh r0, [r7]
	b _080149B2
	.pool
_08014980:
	movs r0, 0x6
	strh r0, [r7]
	b _080149B2
_08014986:
	bl script_env_2_enable_and_set_ctx_running
	adds r0, r4, 0
	bl DestroyTask
	b _080149B2
_08014992:
	bl sub_800AC34
	movs r0, 0x8
	strh r0, [r7]
	b _080149B2
_0801499C:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _080149B2
	bl sub_800E084
	bl script_env_2_enable_and_set_ctx_running
	adds r0, r4, 0
	bl DestroyTask
_080149B2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8014790

	thumb_func_start sub_80149C4
sub_80149C4: @ 80149C4
	push {lr}
	ldr r0, =sub_8014790
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80149C4

	thumb_func_start sub_80149D8
sub_80149D8: @ 80149D8
	push {lr}
	ldr r0, =sub_801440C
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80149D8

	thumb_func_start sub_8014A00
sub_8014A00: @ 8014A00
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, =sub_8014A40
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, =gUnknown_02022C30
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, =gTasks + 0x8
	adds r1, r0
	str r1, [r2]
	movs r2, 0
	strb r2, [r1, 0xC]
	strb r2, [r1, 0xD]
	strb r4, [r1, 0x18]
	ldr r0, =gUnknown_020375F0
	strh r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8014A00

	thumb_func_start sub_8014A40
sub_8014A40: @ 8014A40
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, =gUnknown_02022C30
	ldr r5, [r0]
	ldrb r0, [r5, 0xC]
	cmp r0, 0x11
	bls _08014A54
	b _08014EF2
_08014A54:
	lsls r0, 2
	ldr r1, =_08014A68
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08014A68:
	.4byte _08014AB0
	.4byte _08014AEC
	.4byte _08014BBC
	.4byte _08014BEC
	.4byte _08014BFC
	.4byte _08014C4C
	.4byte _08014C24
	.4byte _08014C52
	.4byte _08014CF2
	.4byte _08014DBC
	.4byte _08014DCC
	.4byte _08014DE2
	.4byte _08014DFA
	.4byte _08014E16
	.4byte _08014E4E
	.4byte _08014E74
	.4byte _08014EA8
	.4byte _08014EE2
_08014AB0:
	ldr r1, =gUnknown_02022C2C
	ldrb r0, [r5, 0x18]
	strb r0, [r1]
	ldr r1, =gUnknown_02022C2D
	movs r0, 0x2
	strb r0, [r1]
	ldrb r0, [r5, 0x18]
	movs r1, 0
	movs r2, 0
	bl sub_8010F84
	movs r0, 0
	movs r1, 0
	bl sub_8010FA0
	bl sub_800B488
	bl sub_8009734
	movs r0, 0x2
	bl sub_8011C10
	movs r0, 0x1
	strb r0, [r5, 0xC]
	b _08014EF2
	.pool
_08014AEC:
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r5, 0x4]
	movs r0, 0xA0
	bl AllocZeroed
	str r0, [r5]
	movs r0, 0xA0
	bl AllocZeroed
	str r0, [r5, 0x8]
	ldr r0, [r5, 0x4]
	movs r1, 0x4
	bl sub_80175EC
	ldr r0, [r5]
	movs r1, 0x5
	bl sub_8017580
	ldr r0, [r5]
	adds r1, r0, 0
	adds r1, 0x10
	bl sub_800DF90
	ldr r1, [r5]
	movs r3, 0
	movs r0, 0
	strh r0, [r1, 0x18]
	ldr r2, [r5]
	ldrb r1, [r2, 0x1A]
	subs r0, 0x4
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1A]
	ldr r2, [r5]
	ldrb r1, [r2, 0x1A]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1A]
	ldr r0, [r5]
	strb r3, [r0, 0x1B]
	ldr r0, [r5, 0x4]
	movs r1, 0xFF
	bl sub_8016FC0
	strb r0, [r5, 0x17]
	ldr r0, =gUnknown_082F011C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	bl sub_8019930
	lsls r0, 16
	ldr r2, =0x0000ffff
	ldr r1, [sp, 0x4]
	ands r1, r2
	orrs r1, r0
	ldr r0, =0xffff00ff
	ands r1, r0
	movs r0, 0xC0
	lsls r0, 4
	orrs r1, r0
	str r1, [sp, 0x4]
	mov r0, sp
	bl AddWindow
	strb r0, [r5, 0xF]
	ldrb r0, [r5, 0xF]
	bl sub_8018784
	ldr r0, =gUnknown_03006310
	adds r2, r0, 0
	ldr r1, =gUnknown_082F015C
	ldm r1!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	ldm r1!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	ldrb r1, [r5, 0xF]
	strb r1, [r0, 0x10]
	movs r1, 0
	movs r2, 0
	bl ListMenuInit
	strb r0, [r5, 0x12]
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	strb r0, [r5, 0x13]
	b _08014C42
	.pool
_08014BBC:
	ldr r0, =gStringVar1
	ldr r2, =gUnknown_082F0048
	ldr r4, =gUnknown_02022C2C
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r0, =gStringVar4
	ldrb r1, [r4]
	bl sub_801262C
	movs r0, 0x3
	strb r0, [r5, 0xC]
	b _08014EF2
	.pool
_08014BEC:
	ldr r0, =gStringVar4
	bl sub_8018884
	movs r0, 0x4
	strb r0, [r5, 0xC]
	b _08014EF2
	.pool
_08014BFC:
	adds r0, r5, 0
	movs r1, 0x5
	movs r2, 0x6
	bl sub_801320C
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08014C14
	b _08014EF2
_08014C14:
	movs r0, 0xD
	strb r0, [r5, 0xC]
	bl sub_800E084
	b _08014EF2
	.pool
_08014C24:
	adds r0, r5, 0
	adds r0, 0xD
	ldr r1, =gUnknown_082EDF40
	bl mevent_0814257C
	cmp r0, 0
	bne _08014C34
	b _08014EF2
_08014C34:
	ldr r0, [r5]
	bl sub_8013398
	strb r0, [r5, 0x13]
	ldrb r0, [r5, 0x12]
	bl sub_81AE70C
_08014C42:
	movs r0, 0x2
	strb r0, [r5, 0xC]
	b _08014EF2
	.pool
_08014C4C:
	movs r0, 0x7
	strb r0, [r5, 0xC]
	b _08014EF2
_08014C52:
	adds r0, r5, 0
	adds r0, 0xD
	adds r1, r5, 0
	adds r1, 0x14
	ldr r3, =gStringVar4
	movs r2, 0
	bl sub_8018B08
	lsls r0, 24
	asrs r4, r0, 24
	cmp r4, 0
	beq _08014C82
	cmp r4, 0
	bgt _08014C7C
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08014CC4
	b _08014EF2
	.pool
_08014C7C:
	cmp r4, 0x1
	beq _08014CC4
	b _08014EF2
_08014C82:
	bl sub_800E0E8
	movs r0, 0
	movs r1, 0
	bl sub_800DFB4
	ldr r1, [r5]
	ldrb r0, [r5, 0x13]
	lsls r0, 5
	adds r1, r0
	strb r4, [r1, 0x1B]
	ldrb r0, [r5, 0x12]
	bl sub_81AE70C
	movs r0, 0x5
	strb r0, [r5, 0x19]
	ldrb r1, [r5, 0x13]
	lsls r1, 5
	ldr r0, [r5]
	adds r0, r1
	adds r0, 0x2
	bl sub_8015658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldrb r0, [r5, 0x13]
	lsls r0, 5
	ldr r2, [r5]
	adds r2, r0
	adds r2, 0x10
	movs r0, 0x5
	b _08014CE8
_08014CC4:
	movs r0, 0x6
	strb r0, [r5, 0x19]
	ldrb r1, [r5, 0x13]
	lsls r1, 5
	ldr r0, [r5]
	adds r0, r1
	adds r0, 0x2
	bl sub_8015658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldrb r0, [r5, 0x13]
	lsls r0, 5
	ldr r2, [r5]
	adds r2, r0
	adds r2, 0x10
	movs r0, 0x6
_08014CE8:
	bl sub_8010688
	movs r0, 0x8
	strb r0, [r5, 0xC]
	b _08014EF2
_08014CF2:
	ldrb r1, [r5, 0x13]
	lsls r1, 5
	ldr r0, [r5]
	adds r0, r1
	adds r0, 0x2
	bl sub_8015658
	lsls r0, 16
	lsrs r0, 16
	ldrb r2, [r5, 0x13]
	lsls r2, 5
	ldr r1, [r5]
	adds r1, r2
	adds r1, 0x10
	bl sub_8010714
	adds r4, r0, 0
	cmp r4, 0x1
	bne _08014DAA
	ldrb r0, [r5, 0x19]
	cmp r0, 0x5
	bne _08014D64
	ldr r1, [r5]
	ldrb r0, [r5, 0x13]
	lsls r0, 5
	adds r1, r0
	movs r0, 0
	strb r0, [r1, 0x1B]
	ldrb r0, [r5, 0x12]
	bl sub_81AE70C
	ldrb r0, [r5, 0x13]
	adds r0, 0x1
	strb r0, [r5, 0x13]
	ldr r0, =gStringVar1
	ldrb r2, [r5, 0x13]
	lsls r2, 5
	subs r2, 0x20
	ldr r1, [r5]
	adds r1, r2
	bl sub_8018404
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_082EDC9C
	bl StringExpandPlaceholders
	movs r0, 0x9
	strb r0, [r5, 0xC]
	bl sub_800EF38
	b _08014DA4
	.pool
_08014D64:
	ldrb r1, [r5, 0x13]
	lsls r1, 5
	ldr r0, [r5]
	adds r0, r1
	adds r4, r0, 0
	adds r4, 0x10
	adds r0, 0x2
	bl sub_8015658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8011DC0
	ldr r1, [r5]
	ldrb r0, [r5, 0x13]
	lsls r0, 5
	adds r1, r0
	ldrb r2, [r1, 0x1A]
	movs r0, 0x4
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1A]
	ldr r0, [r5]
	bl sub_8013398
	ldrb r0, [r5, 0x12]
	bl sub_81AE70C
	movs r0, 0x2
	strb r0, [r5, 0xC]
_08014DA4:
	movs r0, 0
	strb r0, [r5, 0x19]
	b _08014EF2
_08014DAA:
	cmp r4, 0x2
	beq _08014DB0
	b _08014EF2
_08014DB0:
	movs r0, 0
	movs r1, 0
	bl sub_8011A64
	strb r4, [r5, 0xC]
	b _08014EF2
_08014DBC:
	ldr r0, =gStringVar4
	bl sub_8018884
	movs r0, 0xA
	strb r0, [r5, 0xC]
	b _08014EF2
	.pool
_08014DCC:
	ldrb r0, [r5, 0xE]
	adds r0, 0x1
	strb r0, [r5, 0xE]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x78
	bhi _08014DDC
	b _08014EF2
_08014DDC:
	movs r0, 0xB
	strb r0, [r5, 0xC]
	b _08014EF2
_08014DE2:
	adds r0, r5, 0
	movs r1, 0x5
	movs r2, 0x6
	bl sub_801320C
	lsls r0, 24
	cmp r0, 0
	beq _08014DF4
	b _08014EF2
_08014DF4:
	movs r0, 0xC
	strb r0, [r5, 0xC]
	b _08014EF2
_08014DFA:
	bl sub_800EF1C
	lsls r0, 24
	cmp r0, 0
	beq _08014E10
	movs r0, 0
	bl sub_800EF58
	movs r0, 0xF
	strb r0, [r5, 0xC]
	b _08014EF2
_08014E10:
	movs r0, 0x6
	strb r0, [r5, 0xC]
	b _08014EF2
_08014E16:
	bl sub_800E084
	bl sub_800EDD4
	ldrb r0, [r5, 0x12]
	movs r1, 0
	movs r2, 0
	bl sub_81AE6C8
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r5, 0xF]
	bl RemoveWindow
	ldrb r0, [r5, 0x17]
	bl DestroyTask
	ldr r0, [r5, 0x8]
	bl Free
	ldr r0, [r5]
	bl Free
	ldr r0, [r5, 0x4]
	bl Free
	b _08014EDA
_08014E4E:
	adds r0, r5, 0
	adds r0, 0xD
	ldr r1, =gUnknown_082ED8D0
	bl mevent_0814257C
	cmp r0, 0
	beq _08014EF2
	adds r0, r4, 0
	bl DestroyTask
	ldr r1, =gUnknown_020375F0
	movs r0, 0x5
	strh r0, [r1]
	b _08014EF2
	.pool
_08014E74:
	bl sub_8011A74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08014E8C
	bl sub_8011A74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08014E92
_08014E8C:
	movs r0, 0xD
	strb r0, [r5, 0xC]
	b _08014EF2
_08014E92:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	beq _08014EF2
	movs r0, 0x1
	bl sub_8011068
	b _08014EDA
	.pool
_08014EA8:
	ldrb r0, [r5, 0x12]
	movs r1, 0
	movs r2, 0
	bl sub_81AE6C8
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r5, 0xF]
	bl RemoveWindow
	ldrb r0, [r5, 0x17]
	bl DestroyTask
	ldr r0, [r5, 0x8]
	bl Free
	ldr r0, [r5]
	bl Free
	ldr r0, [r5, 0x4]
	bl Free
	bl sub_800ADF8
_08014EDA:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
	b _08014EF2
_08014EE2:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08014EF2
	adds r0, r4, 0
	bl DestroyTask
_08014EF2:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8014A40

	thumb_func_start sub_8014EFC
sub_8014EFC: @ 8014EFC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, =sub_8014F48
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, =gUnknown_02022C30
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, =gTasks + 0x8
	adds r1, r0
	str r1, [r2]
	ldr r0, =gUnknown_03000DA4
	str r1, [r0]
	movs r2, 0
	strb r2, [r1, 0x8]
	strb r2, [r1, 0x9]
	subs r4, 0x15
	strb r4, [r1, 0x12]
	ldr r0, =gUnknown_020375F0
	strh r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8014EFC

	thumb_func_start sub_8014F48
sub_8014F48: @ 8014F48
	push {r4-r7,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, =gUnknown_02022C30
	ldr r7, [r0]
	ldrb r0, [r7, 0x8]
	cmp r0, 0xC
	bls _08014F5C
	b _080152A0
_08014F5C:
	lsls r0, 2
	ldr r1, =_08014F70
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08014F70:
	.4byte _08014FA4
	.4byte _08014FD8
	.4byte _08014FE8
	.4byte _080150B8
	.4byte _08015180
	.4byte _080151A4
	.4byte _08015204
	.4byte _08015260
	.4byte _08015204
	.4byte _0801523A
	.4byte _08015204
	.4byte _08015284
	.4byte _08015290
_08014FA4:
	ldrb r0, [r7, 0x12]
	adds r0, 0x15
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	movs r2, 0
	bl sub_8010F84
	bl sub_800B488
	bl sub_8009734
	bl sub_8011C5C
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r7, 0x4]
	movs r0, 0x80
	lsls r0, 2
	bl AllocZeroed
	str r0, [r7]
	movs r0, 0x1
	strb r0, [r7, 0x8]
	b _080152A0
_08014FD8:
	ldr r0, =gUnknown_082EF7F8
	bl sub_8018884
	movs r0, 0x2
	strb r0, [r7, 0x8]
	b _080152A0
	.pool
_08014FE8:
	ldr r0, [r7, 0x4]
	movs r1, 0x4
	bl sub_80175EC
	ldr r0, [r7]
	movs r1, 0x10
	bl sub_8017580
	ldr r0, [r7, 0x4]
	ldrb r1, [r7, 0x12]
	adds r1, 0x7
	bl sub_8016FC0
	movs r6, 0
	strb r0, [r7, 0x11]
	ldr r0, =gUnknown_082F0174
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	bl sub_8019930
	lsls r0, 16
	ldr r2, =0x0000ffff
	ldr r1, [sp, 0x4]
	ands r1, r2
	orrs r1, r0
	ldr r5, =0xffff00ff
	ands r1, r5
	movs r4, 0xC0
	lsls r4, 4
	orrs r1, r4
	str r1, [sp, 0x4]
	mov r0, sp
	bl AddWindow
	strb r0, [r7, 0xB]
	ldr r0, =gUnknown_082F017C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	add r0, sp, 0x8
	ldr r1, [r0, 0x4]
	ands r1, r5
	orrs r1, r4
	str r1, [r0, 0x4]
	bl AddWindow
	strb r0, [r7, 0xD]
	ldrb r0, [r7, 0xB]
	bl sub_8018784
	ldr r0, =gUnknown_03006310
	adds r2, r0, 0
	ldr r1, =gUnknown_082F0204
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	ldrb r1, [r7, 0xB]
	strb r1, [r0, 0x10]
	movs r1, 0
	movs r2, 0
	bl ListMenuInit
	strb r0, [r7, 0xE]
	ldrb r0, [r7, 0xD]
	bl sub_8018784
	ldrb r0, [r7, 0xD]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r7, 0xD]
	bl PutWindowTilemap
	ldrb r0, [r7, 0xD]
	bl sub_80125BC
	ldrb r0, [r7, 0xD]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	strb r6, [r7, 0xF]
	movs r0, 0x3
	strb r0, [r7, 0x8]
	b _080152A0
	.pool
_080150B8:
	bl sub_8013E44
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _080150D6
	cmp r2, 0x1
	bne _080150CE
	movs r0, 0x2
	bl audio_play
_080150CE:
	ldrb r0, [r7, 0xE]
	bl sub_81AE70C
	b _080152A0
_080150D6:
	ldrb r0, [r7, 0xE]
	bl ListMenuHandleInput
	adds r2, r0, 0
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08015168
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _08015168
	ldr r0, [r7]
	lsls r1, r2, 5
	adds r0, r1
	ldrb r1, [r0, 0xA]
	ldrb r0, [r0, 0x1A]
	lsls r0, 30
	lsrs r0, 30
	cmp r0, 0x1
	bne _08015160
	lsrs r0, r1, 7
	cmp r0, 0
	bne _08015160
	strb r2, [r7, 0xF]
	bl sub_800E0E8
	movs r0, 0
	movs r1, 0
	bl sub_800DFB4
	ldrb r0, [r7, 0xE]
	bl sub_81AE70C
	ldr r0, =gStringVar1
	ldrb r2, [r7, 0xF]
	lsls r2, 5
	ldr r1, [r7]
	adds r1, r2
	bl sub_8018404
	ldrb r1, [r7, 0xF]
	lsls r1, 5
	ldr r0, [r7]
	adds r0, r1
	adds r4, r0, 0
	adds r4, 0x10
	adds r0, 0x2
	bl sub_8015658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8011FC8
	movs r0, 0x6E
	bl audio_play
	movs r0, 0x4
	strb r0, [r7, 0x8]
	b _080152A0
	.pool
_08015160:
	movs r0, 0x7
	bl audio_play
	b _080152A0
_08015168:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08015176
	b _080152A0
_08015176:
	movs r0, 0x6
	strb r0, [r7, 0x8]
	b _080152A0
	.pool
_08015180:
	ldr r0, =gUnknown_082EFC3C
	bl sub_8018884
	ldr r0, =gStringVar1
	ldrb r2, [r7, 0xF]
	lsls r2, 5
	ldr r1, [r7]
	adds r1, r2
	bl sub_8018404
	movs r0, 0x5
	strb r0, [r7, 0x8]
	b _080152A0
	.pool
_080151A4:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	beq _080151C2
	ldr r2, =gUnknown_02022C2C
	ldr r1, [r7]
	ldrb r0, [r7, 0xF]
	lsls r0, 5
	adds r1, r0
	ldrb r0, [r1, 0xA]
	lsls r0, 25
	lsrs r0, 25
	strb r0, [r2]
	movs r0, 0xA
	strb r0, [r7, 0x8]
_080151C2:
	bl sub_8011A74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	beq _080151EE
	cmp r0, 0x5
	bgt _080151E4
	cmp r0, 0x2
	bgt _080152A0
	cmp r0, 0x1
	blt _080152A0
	b _080151E8
	.pool
_080151E4:
	cmp r0, 0x6
	bne _080152A0
_080151E8:
	movs r0, 0x8
	strb r0, [r7, 0x8]
	b _080152A0
_080151EE:
	ldr r0, =gUnknown_082EDDF4
	bl sub_8018884
	movs r0, 0
	movs r1, 0
	bl sub_8011A64
	b _080152A0
	.pool
_08015204:
	ldrb r0, [r7, 0xE]
	movs r1, 0
	movs r2, 0
	bl sub_81AE6C8
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r7, 0xD]
	bl RemoveWindow
	ldrb r0, [r7, 0xB]
	bl RemoveWindow
	ldrb r0, [r7, 0x11]
	bl DestroyTask
	ldr r0, [r7]
	bl Free
	ldr r0, [r7, 0x4]
	bl Free
	ldrb r0, [r7, 0x8]
	adds r0, 0x1
	strb r0, [r7, 0x8]
	b _080152A0
_0801523A:
	adds r5, r7, 0
	adds r5, 0x9
	ldr r4, =gUnknown_082EDF80
	bl sub_8011A74
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl mevent_0814257C
	cmp r0, 0
	beq _080152A0
	bl sub_800E084
	b _0801526A
	.pool
_08015260:
	bl sub_800E084
	ldr r0, =gUnknown_082ED8D0
	bl sub_8018884
_0801526A:
	adds r0, r6, 0
	bl DestroyTask
	bl sub_800EDD4
	ldr r1, =gUnknown_020375F0
	movs r0, 0x5
	strh r0, [r1]
	b _080152A0
	.pool
_08015284:
	ldrb r0, [r7, 0x8]
	adds r0, 0x1
	strb r0, [r7, 0x8]
	bl sub_800ADF8
	b _080152A0
_08015290:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _080152A0
	adds r0, r6, 0
	bl DestroyTask
_080152A0:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8014F48

	thumb_func_start sub_80152A8
sub_80152A8: @ 80152A8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, =task00_081182DC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, =gUnknown_02022C30
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, =gTasks + 0x8
	adds r1, r0
	str r1, [r2]
	ldr r0, =gUnknown_03000DA4
	str r1, [r0]
	movs r2, 0
	strb r2, [r1, 0x8]
	strb r2, [r1, 0x9]
	subs r4, 0x15
	strb r4, [r1, 0x12]
	ldr r0, =gUnknown_020375F0
	strh r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80152A8

	thumb_func_start task00_081182DC
task00_081182DC: @ 80152F4
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, =gUnknown_02022C30
	ldr r5, [r0]
	ldrb r0, [r5, 0x8]
	cmp r0, 0xE
	bls _08015308
	b _08015604
_08015308:
	lsls r0, 2
	ldr r1, =_0801531C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801531C:
	.4byte _08015358
	.4byte _08015386
	.4byte _08015398
	.4byte _08015420
	.4byte _080154E0
	.4byte _08015504
	.4byte _08015564
	.4byte _080155A8
	.4byte _08015564
	.4byte _0801559A
	.4byte _08015564
	.4byte _080155B4
	.4byte _08015564
	.4byte _080155E8
	.4byte _080155F4
_08015358:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_8010F84
	bl sub_800B488
	bl sub_8009734
	bl sub_8011C5C
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r5, 0x4]
	movs r0, 0x80
	lsls r0, 2
	bl AllocZeroed
	str r0, [r5]
	movs r0, 0x1
	strb r0, [r5, 0x8]
	b _08015604
_08015386:
	ldr r0, =gUnknown_082EFBC8
	bl sub_8018884
	movs r0, 0x2
	strb r0, [r5, 0x8]
	b _08015604
	.pool
_08015398:
	ldr r0, [r5, 0x4]
	movs r1, 0x4
	bl sub_80175EC
	ldr r0, [r5]
	movs r1, 0x10
	bl sub_8017580
	ldr r0, [r5, 0x4]
	ldrb r1, [r5, 0x12]
	adds r1, 0x7
	bl sub_8016FF0
	strb r0, [r5, 0x11]
	ldrb r0, [r5, 0x13]
	cmp r0, 0
	beq _08015404
	ldr r0, =gUnknown_082F0174
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	bl sub_8019930
	lsls r0, 16
	ldr r2, =0x0000ffff
	ldr r1, [sp, 0x4]
	ands r1, r2
	orrs r1, r0
	str r1, [sp, 0x4]
	mov r0, sp
	bl AddWindow
	strb r0, [r5, 0xB]
	ldrb r0, [r5, 0xB]
	bl sub_8018784
	ldr r0, =gUnknown_03006310
	adds r2, r0, 0
	ldr r1, =gUnknown_082F0204
	ldm r1!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	ldm r1!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	ldrb r1, [r5, 0xB]
	strb r1, [r0, 0x10]
	movs r1, 0
	movs r2, 0
	bl ListMenuInit
	strb r0, [r5, 0xE]
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_08015404:
	movs r0, 0
	strb r0, [r5, 0xF]
	movs r0, 0x3
	strb r0, [r5, 0x8]
	b _08015604
	.pool
_08015420:
	bl sub_8013E44
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08015446
	cmp r0, 0x1
	bne _08015436
	movs r0, 0x2
	bl audio_play
_08015436:
	ldrb r0, [r5, 0x13]
	cmp r0, 0
	bne _0801543E
	b _08015604
_0801543E:
	ldrb r0, [r5, 0xE]
	bl sub_81AE70C
	b _08015604
_08015446:
	ldrb r0, [r5, 0x13]
	cmp r0, 0
	beq _08015452
	ldrb r0, [r5, 0xE]
	bl ListMenuHandleInput
_08015452:
	ldrb r0, [r5, 0x14]
	cmp r0, 0x78
	bls _080154C0
	ldr r2, [r5]
	ldrb r1, [r2, 0x1A]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _080154D4
	ldrb r1, [r2, 0xA]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080154D4
	ldrb r1, [r5, 0x12]
	adds r1, 0x7
	adds r0, r2, 0
	bl sub_8016F1C
	cmp r0, 0
	beq _080154B4
	strb r4, [r5, 0xF]
	strb r4, [r5, 0x14]
	bl sub_800E0E8
	movs r0, 0
	movs r1, 0
	bl sub_800DFB4
	ldr r0, [r5]
	adds r4, r0, 0
	adds r4, 0x10
	adds r0, 0x2
	bl sub_8015658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8011FC8
	movs r0, 0x6E
	bl audio_play
	movs r0, 0x4
	strb r0, [r5, 0x8]
	b _080154D4
_080154B4:
	movs r0, 0x16
	bl audio_play
	movs r0, 0xA
	strb r0, [r5, 0x8]
	b _080154D4
_080154C0:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080154D4
	movs r1, 0
	movs r0, 0x6
	strb r0, [r5, 0x8]
	strb r1, [r5, 0x14]
_080154D4:
	ldrb r0, [r5, 0x14]
	adds r0, 0x1
	strb r0, [r5, 0x14]
	b _08015604
	.pool
_080154E0:
	ldr r0, =gUnknown_082EFC90
	bl sub_8018884
	ldr r0, =gStringVar1
	ldrb r2, [r5, 0xF]
	lsls r2, 5
	ldr r1, [r5]
	adds r1, r2
	bl sub_8018404
	movs r0, 0x5
	strb r0, [r5, 0x8]
	b _08015604
	.pool
_08015504:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	beq _08015522
	ldr r2, =gUnknown_02022C2C
	ldr r1, [r5]
	ldrb r0, [r5, 0xF]
	lsls r0, 5
	adds r1, r0
	ldrb r0, [r1, 0xA]
	lsls r0, 25
	lsrs r0, 25
	strb r0, [r2]
	movs r0, 0xC
	strb r0, [r5, 0x8]
_08015522:
	bl sub_8011A74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	beq _0801554E
	cmp r0, 0x5
	bgt _08015544
	cmp r0, 0x2
	bgt _08015604
	cmp r0, 0x1
	blt _08015604
	b _08015548
	.pool
_08015544:
	cmp r0, 0x6
	bne _08015604
_08015548:
	movs r0, 0x8
	strb r0, [r5, 0x8]
	b _08015604
_0801554E:
	ldr r0, =gUnknown_082EDEC4
	bl sub_8018884
	movs r0, 0
	movs r1, 0
	bl sub_8011A64
	b _08015604
	.pool
_08015564:
	ldrb r0, [r5, 0x13]
	cmp r0, 0
	beq _08015580
	ldrb r0, [r5, 0xE]
	movs r1, 0
	movs r2, 0
	bl sub_81AE6C8
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r5, 0xB]
	bl RemoveWindow
_08015580:
	ldrb r0, [r5, 0x11]
	bl DestroyTask
	ldr r0, [r5]
	bl Free
	ldr r0, [r5, 0x4]
	bl Free
	ldrb r0, [r5, 0x8]
	adds r0, 0x1
	strb r0, [r5, 0x8]
	b _08015604
_0801559A:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r1, =gUnknown_082EDF04
	b _080155C2
	.pool
_080155A8:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r1, =gUnknown_082ED8F8
	b _080155C2
	.pool
_080155B4:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r2, =gUnknown_082EFD58
	ldrb r1, [r5, 0x12]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
_080155C2:
	bl mevent_0814257C
	cmp r0, 0
	beq _08015604
	bl sub_800E084
	adds r0, r4, 0
	bl DestroyTask
	bl sub_800EDD4
	ldr r1, =gUnknown_020375F0
	movs r0, 0x5
	strh r0, [r1]
	b _08015604
	.pool
_080155E8:
	ldrb r0, [r5, 0x8]
	adds r0, 0x1
	strb r0, [r5, 0x8]
	bl sub_800ADF8
	b _08015604
_080155F4:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08015604
	adds r0, r4, 0
	bl DestroyTask
_08015604:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end task00_081182DC

	thumb_func_start UnionRoomSpecial
UnionRoomSpecial: @ 801560C
	push {r4,lr}
	bl sub_8010F60
	ldr r0, =sub_80156E0
	movs r1, 0xA
	bl CreateTask
	ldr r4, =gUnknown_02022C30
	movs r0, 0x9B
	lsls r0, 2
	bl AllocZeroed
	str r0, [r4]
	ldr r1, =gUnknown_03000DA8
	str r0, [r1]
	movs r1, 0
	strb r1, [r0, 0x14]
	strb r1, [r0, 0x16]
	strh r1, [r0, 0x10]
	strh r1, [r0, 0x12]
	ldr r0, =gUnknown_020375F0
	strh r1, [r0]
	movs r0, 0xD0
	movs r1, 0x1
	bl sub_819A2BC
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end UnionRoomSpecial

	thumb_func_start sub_8015658
sub_8015658: @ 8015658
	ldrb r1, [r0, 0x1]
	lsls r1, 8
	ldrb r0, [r0]
	orrs r0, r1
	bx lr
	thumb_func_end sub_8015658

	thumb_func_start sub_8015664
sub_8015664: @ 8015664
	push {lr}
	adds r3, r1, 0
	ldr r1, =gUnknown_02022C30
	ldr r2, [r1]
	movs r1, 0x8
	strb r1, [r2, 0x14]
	strb r0, [r2, 0x15]
	ldr r0, =gStringVar4
	cmp r3, r0
	beq _0801567E
	adds r1, r3, 0
	bl StringExpandPlaceholders
_0801567E:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8015664

	thumb_func_start sub_801568C
sub_801568C: @ 801568C
	push {lr}
	adds r2, r0, 0
	ldr r0, =gUnknown_02022C30
	ldr r1, [r0]
	movs r0, 0x1A
	strb r0, [r1, 0x14]
	ldr r0, =gStringVar4
	cmp r2, r0
	beq _080156A4
	adds r1, r2, 0
	bl StringExpandPlaceholders
_080156A4:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801568C

	thumb_func_start sub_80156B0
sub_80156B0: @ 80156B0
	push {lr}
	ldr r3, =0x0201ff00
	ldr r1, [r0]
	movs r2, 0x80
	lsls r2, 1
	adds r0, r3, 0
	bl memcpy
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80156B0

	thumb_func_start sub_80156C8
sub_80156C8: @ 80156C8
	push {lr}
	ldr r0, [r0]
	ldr r1, =0x0201ff00
	movs r2, 0x80
	lsls r2, 1
	bl memcpy
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80156C8

	thumb_func_start sub_80156E0
sub_80156E0: @ 80156E0
	push {r4-r7,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	ldr r0, =gUnknown_02022C30
	ldr r6, [r0]
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, =gTasks + 0x8
	adds r7, r0, r1
	ldrb r0, [r6, 0x14]
	cmp r0, 0x38
	bls _08015702
	bl _08016878
_08015702:
	lsls r0, 2
	ldr r1, =_08015718
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08015718:
	.4byte _080157FC
	.4byte _08015854
	.4byte _08015878
	.4byte _080158C8
	.4byte _080159A6
	.4byte _08015E5C
	.4byte _08015C54
	.4byte _08015E5C
	.4byte _08016864
	.4byte _080161C8
	.4byte _080162D4
	.4byte _080160AC
	.4byte _080160C6
	.4byte _08016324
	.4byte _08016348
	.4byte _08016350
	.4byte _08016360
	.4byte _0801638E
	.4byte _080163A2
	.4byte _08015F32
	.4byte _08015FB8
	.4byte _08015FD6
	.4byte _0801604A
	.4byte _08015ADA
	.4byte _08015B00
	.4byte _08015B78
	.4byte _08016838
	.4byte _08015D4C
	.4byte _08015D34
	.4byte _08015DD0
	.4byte _08015C2A
	.4byte _08015DA6
	.4byte _08015D9C
	.4byte _08016158
	.4byte _08016178
	.4byte _080161B8
	.4byte _080162DC
	.4byte _08016318
	.4byte _08015BF4
	.4byte _08016104
	.4byte _08015E94
	.4byte _08015EC4
	.4byte _080163CC
	.4byte _0801645C
	.4byte _080165A8
	.4byte _08016610
	.4byte _0801662C
	.4byte _08016478
	.4byte _08016634
	.4byte _08016738
	.4byte _0801676C
	.4byte _080167F4
	.4byte _0801652C
	.4byte _080164E0
	.4byte _080164F4
	.4byte _0801658C
	.4byte _080165DC
_080157FC:
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r6, 0x4]
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r6, 0xC]
	movs r0, 0x80
	lsls r0, 1
	bl AllocZeroed
	str r0, [r6]
	movs r0, 0x20
	bl AllocZeroed
	str r0, [r6, 0x8]
	ldr r0, [r6]
	movs r1, 0x8
	bl sub_8017580
	ldr r1, =gUnknown_02022C2C
	movs r0, 0x40
	strb r0, [r1]
	ldr r0, [r6, 0xC]
	ldr r1, [r6, 0x4]
	movs r2, 0x9
	bl sub_8016DF0
	adds r1, r6, 0
	adds r1, 0x20
	strb r0, [r1]
	adds r0, r6, 0
	adds r0, 0xA0
	bl sub_8019BA8
	bl sub_8019F2C
	movs r0, 0x1
	bl _08016876
	.pool
_08015854:
	adds r0, r6, 0
	adds r0, 0x21
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl sub_8019E70
	ldrh r0, [r7]
	adds r0, 0x1
	strh r0, [r7]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	beq _08015872
	bl _08016878
_08015872:
	movs r0, 0x2
	bl _08016876
_08015878:
	movs r0, 0x40
	movs r1, 0
	movs r2, 0
	bl sub_8010F84
	ldr r2, =gUnknown_02022C40
	ldrh r0, [r2, 0x2]
	ldrh r1, [r2, 0xA]
	ldrh r2, [r2, 0xC]
	bl sub_8010FCC
	bl sub_800B488
	bl sub_8009734
	bl sub_8011C84
	ldr r0, [r6, 0x8]
	movs r1, 0x1
	bl sub_8017580
	ldr r0, [r6, 0x4]
	movs r1, 0x4
	bl sub_80175EC
	ldr r0, [r6, 0xC]
	movs r1, 0x4
	bl sub_80175EC
	ldr r1, =gUnknown_020375F0
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x3
	bl _08016876
	.pool
_080158C8:
	bl sub_81B1360
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	beq _080158E0
	bl sub_81B1360
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bne _080159A0
_080158E0:
	ldr r4, =gUnknown_02022C40
	ldrh r0, [r4]
	cmp r0, 0
	beq _080159A0
	bl brm_get_pokemon_selection
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _08015900
	cmp r0, 0x2
	beq _08015950
	b _0801598E
	.pool
_08015900:
	movs r0, 0x54
	movs r1, 0
	movs r2, 0x1
	bl sub_8011090
	cmp r5, 0x5
	bls _0801592C
	adds r0, r4, 0
	bl sub_801807C
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_8010FCC
	ldr r0, =gUnknown_082EF4FC
	bl sub_801568C
	b _0801598E
	.pool
_0801592C:
	bl brm_get_pokemon_selection
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl sub_80180A0
	cmp r0, 0
	bne _0801594C
	ldr r1, =gUnknown_082EF47C
	movs r0, 0x34
	bl sub_8015664
	b _0801598E
	.pool
_0801594C:
	movs r0, 0x37
	b _0801598C
_08015950:
	adds r0, r6, 0
	bl sub_80156C8
	ldrb r0, [r4, 0x8]
	strh r0, [r7, 0x2]
	cmp r5, 0x5
	bls _0801596C
	ldr r0, =gUnknown_082EF544
	bl sub_801568C
	b _0801598E
	.pool
_0801596C:
	movs r0, 0x54
	movs r1, 0
	movs r2, 0x1
	bl sub_8011090
	ldr r1, =gUnknown_02022C2C
	movs r0, 0x44
	strb r0, [r1]
	bl brm_get_pokemon_selection
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl sub_80180E8
	movs r0, 0x33
_0801598C:
	strb r0, [r6, 0x14]
_0801598E:
	ldr r1, =gUnknown_02022C40
	movs r0, 0
	strh r0, [r1]
	bl _08016878
	.pool
_080159A0:
	movs r0, 0x4
	bl _08016876
_080159A6:
	ldr r4, =gUnknown_020375F0
	ldrh r0, [r4]
	cmp r0, 0
	beq _08015A0A
	cmp r0, 0x9
	bne _080159E0
	movs r0, 0x54
	movs r1, 0
	movs r2, 0x1
	bl sub_8011090
	movs r0, 0x2
	bl audio_play
	ldr r0, =gStringVar1
	ldr r1, =gSaveBlock2Ptr
	ldr r1, [r1]
	bl StringCopy
	movs r1, 0
	movs r0, 0x2A
	b _08015A02
	.pool
_080159E0:
	cmp r0, 0xB
	bne _080159F4
	movs r0, 0x54
	movs r1, 0
	movs r2, 0x1
	bl sub_8011090
	movs r1, 0
	movs r0, 0x17
	b _08015A02
_080159F4:
	movs r0, 0
	strh r0, [r7]
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r7, 0x2]
	movs r1, 0
	movs r0, 0x18
_08015A02:
	strb r0, [r6, 0x14]
	strh r1, [r4]
	bl _08016878
_08015A0A:
	bl script_env_2_is_enabled
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08015A1A
	bl _08016878
_08015A1A:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08015A80
	ldr r0, [r6]
	adds r2, r7, 0x2
	adds r3, r6, 0
	adds r3, 0x21
	adds r1, r7, 0
	bl sub_801A2A8
	cmp r0, 0
	beq _08015A4C
	movs r0, 0x5
	bl audio_play
	bl sub_80181CC
	movs r0, 0x18
	bl _08016876
	.pool
_08015A4C:
	bl sub_8017940
	cmp r0, 0
	beq _08015A80
	movs r0, 0x54
	movs r1, 0
	movs r2, 0x1
	bl sub_8011090
	movs r0, 0x2
	bl audio_play
	bl sub_80181CC
	ldr r0, =gStringVar1
	ldr r1, =gSaveBlock2Ptr
	ldr r1, [r1]
	bl StringCopy
	movs r0, 0x2D
	bl _08016876
	.pool
_08015A80:
	bl sub_8016B00
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _08015AA2
	cmp r0, 0x2
	bgt _08015A96
	cmp r0, 0x1
	beq _08015A9C
	b _08015AD0
_08015A96:
	cmp r0, 0x4
	beq _08015AAA
	b _08015AD0
_08015A9C:
	movs r0, 0x2
	bl audio_play
_08015AA2:
	adds r0, r6, 0
	bl sub_801A274
	b _08015AD0
_08015AAA:
	movs r0, 0xB
	strb r0, [r6, 0x14]
	bl sub_80181CC
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_8010FCC
	adds r0, r6, 0
	bl sub_80181DC
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x53
	movs r2, 0
	bl sub_8011090
_08015AD0:
	adds r0, r6, 0
	bl sub_801A284
	bl _08016878
_08015ADA:
	ldr r0, =sub_809FA34
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _08015AEA
	bl _08016878
_08015AEA:
	movs r0, 0x40
	movs r1, 0
	movs r2, 0
	bl sub_8011090
	movs r0, 0x4
	bl _08016876
	.pool
_08015B00:
	bl sub_801704C
	movs r3, 0x2
	ldrsh r0, [r7, r3]
	ldr r1, [r6]
	bl sub_8017CF8
	adds r4, r0, 0
	movs r0, 0x54
	movs r1, 0
	movs r2, 0x1
	bl sub_8011090
	ldr r0, [r6]
	ldrb r1, [r7]
	ldrb r2, [r7, 0x2]
	adds r3, r4, 0
	bl sub_80179D4
	cmp r0, 0x1
	beq _08015B44
	cmp r0, 0x1
	bgt _08015B36
	cmp r0, 0
	beq _08015B3E
	bl _08016878
_08015B36:
	cmp r0, 0x2
	beq _08015B68
	bl _08016878
_08015B3E:
	movs r0, 0x1A
	bl _08016876
_08015B44:
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	lsls r0, 5
	ldr r1, [r6]
	adds r1, r0
	adds r0, r1, 0
	adds r0, 0x10
	ldr r2, =gUnknown_02022C2C
	ldrb r2, [r2]
	bl sub_8012188
	strh r5, [r6, 0x12]
	movs r0, 0x19
	bl _08016876
	.pool
_08015B68:
	ldr r1, =gStringVar4
	movs r0, 0x13
	bl sub_8015664
	bl _08016878
	.pool
_08015B78:
	bl sub_801704C
	bl sub_8011A74
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	blt _08015BBE
	cmp r4, 0x2
	ble _08015B9A
	cmp r4, 0x4
	bne _08015BBE
	movs r0, 0x1
	bl sub_801818C
	strb r4, [r6, 0x14]
	b _08015BBE
_08015B9A:
	bl sub_8011B90
	cmp r0, 0x1
	bne _08015BB0
	ldr r0, =gUnknown_082EE6C8
	bl sub_801568C
	b _08015BB8
	.pool
_08015BB0:
	ldr r1, =gUnknown_082EE6C8
	movs r0, 0x1E
	bl sub_8015664
_08015BB8:
	ldr r1, =gUnknown_02022C2C
	movs r0, 0x40
	strb r0, [r1]
_08015BBE:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _08015BCA
	bl _08016878
_08015BCA:
	ldr r0, =gUnknown_020228C4
	movs r1, 0x1
	bl sub_80143E4
	ldr r0, =sub_80140E0
	movs r1, 0x5
	bl CreateTask
	movs r0, 0x26
	bl _08016876
	.pool
_08015BF4:
	ldr r0, =sub_80140E0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _08015C04
	bl _08016878
_08015C04:
	ldr r0, =gUnknown_02022C2C
	ldrb r0, [r0]
	cmp r0, 0x44
	bne _08015C24
	ldr r1, =gUnknown_082EE004
	movs r0, 0x1F
	bl sub_8015664
	bl _08016878
	.pool
_08015C24:
	movs r0, 0x5
	bl _08016876
_08015C2A:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	beq _08015C36
	bl _08016878
_08015C36:
	movs r0, 0
	bl sub_801818C
	movs r2, 0
	ldrsh r0, [r7, r2]
	movs r3, 0x2
	ldrsh r1, [r7, r3]
	ldr r2, [r6]
	bl sub_801A3D0
	movs r0, 0x2
	bl _08016876
	.pool
_08015C54:
	adds r0, r6, 0
	adds r0, 0x16
	adds r1, r6, 0
	adds r1, 0x1B
	adds r2, r6, 0
	adds r2, 0x1C
	ldr r3, =gUnknown_082F021C
	ldr r4, =gUnknown_082F0244
	str r4, [sp]
	bl sub_8017178
	adds r5, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	bne _08015C78
	bl _08016878
_08015C78:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _08015C94
	movs r0, 0x1C
	bl _08016876
	.pool
_08015C94:
	adds r1, r6, 0
	adds r1, 0x98
	movs r0, 0
	strh r0, [r1]
	movs r2, 0x2
	ldrsh r0, [r7, r2]
	ldr r1, [r6]
	bl sub_8017CF8
	movs r0, 0x2
	negs r0, r0
	cmp r5, r0
	beq _08015CB2
	cmp r5, 0x40
	bne _08015CE4
_08015CB2:
	adds r0, r6, 0
	adds r0, 0x4C
	movs r1, 0x40
	strh r1, [r0]
	bl sub_800FE50
	ldr r0, =gStringVar4
	ldr r2, =gUnknown_082EEB80
	ldr r1, =gUnknown_020229E8
	ldrb r1, [r1, 0x13]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	movs r0, 0x20
	bl _08016876
	.pool
_08015CE4:
	ldr r0, =gUnknown_02022C2C
	strb r5, [r0]
	ldr r1, =gUnknown_02022C2D
	lsrs r0, r5, 8
	strb r0, [r1]
	lsls r0, r5, 24
	lsrs r0, 24
	cmp r0, 0x41
	bne _08015D18
	bl sub_8018024
	cmp r0, 0
	bne _08015D18
	ldr r1, =gUnknown_082EEBD0
	movs r0, 0x5
	bl sub_8015664
	bl _08016878
	.pool
_08015D18:
	ldr r0, =gUnknown_02022C2C
	ldrb r0, [r0]
	movs r1, 0x40
	orrs r1, r0
	adds r0, r6, 0
	adds r0, 0x4C
	strh r1, [r0]
	bl sub_800FE50
	movs r0, 0x1B
	bl _08016876
	.pool
_08015D34:
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_082EEB88
	bl StringCopy
	movs r0, 0x24
	bl _08016876
	.pool
_08015D4C:
	adds r0, r6, 0
	bl sub_8017FD8
	movs r3, 0x2
	ldrsh r0, [r7, r3]
	ldr r1, [r6]
	bl sub_8017CF8
	adds r4, r0, 0
	adds r0, r6, 0
	adds r0, 0x4C
	ldrh r1, [r0]
	movs r0, 0x3F
	ands r0, r1
	bl sub_8017984
	adds r5, r0, 0
	adds r0, r6, 0
	adds r0, 0x16
	ldr r3, =gUnknown_082EE82C
	lsls r1, r5, 2
	lsls r2, r4, 4
	adds r1, r2
	adds r1, r3
	ldr r1, [r1]
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	bne _08015D8C
	bl _08016878
_08015D8C:
	movs r0, 0
	strh r0, [r7, 0x6]
	movs r0, 0x1D
	bl _08016876
	.pool
_08015D9C:
	bl sub_800AC34
	movs r0, 0x24
	bl _08016876
_08015DA6:
	adds r0, r6, 0
	adds r0, 0x4C
	movs r1, 0x44
	strh r1, [r0]
	ldr r2, =gUnknown_02022C40
	ldrh r1, [r2, 0xE]
	adds r3, r6, 0
	adds r3, 0x4E
	strh r1, [r3]
	ldrh r2, [r2, 0x10]
	adds r1, r6, 0
	adds r1, 0x50
	strh r2, [r1]
	bl sub_800FE50
	movs r0, 0x1D
	bl _08016876
	.pool
_08015DD0:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _08015DF4
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_082EEB88
	bl StringCopy
	movs r0, 0x1C
	bl _08016876
	.pool
_08015DF4:
	adds r0, r6, 0
	bl sub_8017FD8
	adds r0, r6, 0
	adds r0, 0x98
	ldrh r0, [r0]
	cmp r0, 0x51
	bne _08015E2A
	ldr r0, =gUnknown_02022C2C
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _08015E24
	ldr r0, =gStringVar4
	adds r1, r6, 0
	movs r2, 0
	bl sub_8018220
	movs r0, 0x28
	bl _08016876
	.pool
_08015E24:
	movs r0, 0xD
	bl _08016876
_08015E2A:
	cmp r0, 0x52
	beq _08015E32
	bl _08016878
_08015E32:
	movs r5, 0
	movs r0, 0x20
	strb r0, [r6, 0x14]
	ldr r0, =gStringVar4
	ldr r4, =gUnknown_02022C2C
	ldrb r2, [r4]
	movs r1, 0x40
	orrs r1, r2
	ldr r2, =gUnknown_020229E8
	ldrb r2, [r2, 0x13]
	bl sub_8017D9C
	strb r5, [r4]
	bl _08016878
	.pool
_08015E5C:
	movs r0, 0x2
	ldrsh r1, [r7, r0]
	lsls r1, 5
	ldr r0, [r6]
	adds r0, r1
	bl sub_80179AC
	adds r5, r0, 0
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	ldr r1, [r6]
	bl sub_8017CF8
	adds r4, r0, 0
	ldr r2, =gUnknown_082EE24C
	lsls r0, r4, 2
	lsls r1, r5, 3
	adds r0, r1
	adds r0, r2
	ldr r1, [r0]
	movs r0, 0x6
	bl sub_8015664
	bl _08016878
	.pool
_08015E94:
	adds r0, r6, 0
	adds r0, 0x16
	ldr r1, =gStringVar4
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	bne _08015EA8
	bl _08016878
_08015EA8:
	movs r4, 0
	movs r0, 0x29
	strb r0, [r6, 0x14]
	bl sub_800ADF8
	adds r0, r6, 0
	adds r0, 0x98
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	bl _08016878
	.pool
_08015EC4:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	bne _08015ED2
	bl _08016878
_08015ED2:
	bl link_get_multiplayer_id
	lsls r0, 24
	cmp r0, 0
	bne _08015F2C
	ldr r5, =gStringVar1
	bl link_get_multiplayer_id
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r4, =gUnknown_020229F0
	adds r1, r4
	adds r0, r5, 0
	bl StringCopy
	ldrh r0, [r4, 0x18]
	adds r4, 0x1C
	adds r1, r4, 0
	bl sub_800E540
	adds r5, r0, 0
	ldr r0, =gStringVar4
	ldr r2, =gUnknown_082EE378
	lsls r1, r5, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringExpandPlaceholders
	movs r0, 0x21
	bl _08016876
	.pool
_08015F2C:
	movs r0, 0x7
	bl _08016876
_08015F32:
	adds r0, r6, 0
	adds r0, 0x16
	movs r1, 0
	bl sub_80170B8
	lsls r0, 24
	asrs r5, r0, 24
	cmp r5, 0
	beq _08015F5C
	cmp r5, 0
	bgt _08015F54
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	beq _08015F98
	bl _08016878
_08015F54:
	cmp r5, 0x1
	beq _08015F98
	bl _08016878
_08015F5C:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r4, =gUnknown_02022C2C
	movs r0, 0x45
	strb r0, [r4]
	movs r0, 0x45
	movs r1, 0
	movs r2, 0x1
	bl sub_8011090
	movs r2, 0x2
	ldrsh r0, [r7, r2]
	lsls r0, 5
	ldr r1, [r6]
	adds r1, r0
	adds r0, r1, 0
	adds r0, 0x10
	ldrb r2, [r4]
	bl sub_8012188
	ldrh r0, [r7, 0x2]
	strh r0, [r6, 0x12]
	movs r0, 0x14
	strb r0, [r6, 0x14]
	strh r5, [r7, 0x6]
	bl _08016878
	.pool
_08015F98:
	movs r3, 0x2
	ldrsh r0, [r7, r3]
	ldr r1, [r6]
	bl sub_8017CF8
	adds r4, r0, 0
	ldr r1, =gUnknown_082EEC9C
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	bl sub_801568C
	bl _08016878
	.pool
_08015FB8:
	ldrh r0, [r7, 0x4]
	adds r0, 0x1
	strh r0, [r7, 0x4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	bgt _08015FCA
	bl _08016878
_08015FCA:
	movs r1, 0
	movs r0, 0x15
	strb r0, [r6, 0x14]
	strh r1, [r7, 0x4]
	bl _08016878
_08015FD6:
	bl sub_8011A74
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	beq _0801603C
	cmp r4, 0x3
	ble _08015FF4
	cmp r4, 0x4
	bne _08016040
	movs r0, 0x1
	bl sub_801818C
	strb r4, [r6, 0x14]
	b _08016040
_08015FF4:
	cmp r4, 0x1
	blt _08016040
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	ldr r1, [r6]
	bl sub_8017CF8
	adds r4, r0, 0
	movs r0, 0x54
	movs r1, 0
	movs r2, 0x1
	bl sub_8011090
	bl sub_8011B90
	cmp r0, 0x1
	bne _08016028
	ldr r0, =gUnknown_082EED3C
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r1]
	bl sub_801568C
	b _08016040
	.pool
_08016028:
	ldr r0, =gUnknown_082EED3C
	lsls r1, r4, 2
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x1E
	bl sub_8015664
	b _08016040
	.pool
_0801603C:
	movs r0, 0x16
	strb r0, [r6, 0x14]
_08016040:
	ldrh r0, [r7, 0x6]
	adds r0, 0x1
	strh r0, [r7, 0x6]
	bl _08016878
_0801604A:
	bl sub_8011A80
	cmp r0, 0
	beq _08016092
	movs r2, 0x2
	ldrsh r0, [r7, r2]
	ldr r1, [r6]
	bl sub_8017CF8
	adds r4, r0, 0
	movs r0, 0x54
	movs r1, 0
	movs r2, 0x1
	bl sub_8011090
	bl sub_8011B90
	cmp r0, 0x1
	bne _08016084
	ldr r0, =gUnknown_082EED3C
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r1]
	bl sub_801568C
	b _08016092
	.pool
_08016084:
	ldr r0, =gUnknown_082EED3C
	lsls r1, r4, 2
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x1E
	bl sub_8015664
_08016092:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801609E
	bl _08016878
_0801609E:
	movs r0, 0x10
	bl _08016876
	.pool
_080160AC:
	movs r0, 0x49
	bl audio_play
	bl sub_800EF7C
	movs r0, 0
	movs r1, 0xC
	strb r1, [r6, 0x14]
	adds r1, r6, 0
	adds r1, 0x9A
	strh r0, [r1]
	bl _08016878
_080160C6:
	bl sub_8011A80
	cmp r0, 0
	beq _080160DA
	movs r0, 0
	bl sub_801818C
	movs r0, 0x2
	bl _08016876
_080160DA:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _080160E4
	b _08016878
_080160E4:
	ldr r0, =gUnknown_020228C4
	movs r1, 0x1
	bl sub_80143E4
	ldr r0, =sub_80140E0
	movs r1, 0x5
	bl CreateTask
	movs r0, 0x27
	b _08016876
	.pool
_08016104:
	adds r0, r6, 0
	bl sub_801689C
	ldr r0, =sub_80140E0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _08016118
	b _08016878
_08016118:
	movs r0, 0x21
	strb r0, [r6, 0x14]
	ldr r0, =gStringVar1
	ldr r4, =gUnknown_02022A0C
	adds r1, r4, 0
	bl StringCopy
	adds r0, r4, 0
	subs r0, 0x24
	ldrh r0, [r0, 0x20]
	adds r1, r4, 0
	bl sub_800E540
	adds r5, r0, 0
	ldr r0, =gStringVar4
	ldr r2, =gUnknown_082EE324
	lsls r1, r5, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringExpandPlaceholders
	b _08016878
	.pool
_08016158:
	adds r0, r6, 0
	bl sub_801689C
	adds r0, r6, 0
	adds r0, 0x16
	ldr r1, =gStringVar4
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	bne _08016170
	b _08016878
_08016170:
	movs r0, 0x22
	b _08016876
	.pool
_08016178:
	adds r0, r6, 0
	bl sub_801689C
	adds r0, r6, 0
	bl sub_80168DC
	cmp r0, 0
	bne _0801618A
	b _08016878
_0801618A:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08016198
	b _08016878
_08016198:
	movs r0, 0x1
	bl sub_8011DE0
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_082EE598
	bl StringCopy
	movs r0, 0x24
	b _08016876
	.pool
_080161B8:
	ldr r1, =gStringVar4
	movs r0, 0x9
	bl sub_8015664
	b _08016878
	.pool
_080161C8:
	adds r0, r6, 0
	adds r0, 0x16
	movs r1, 0
	bl sub_80170B8
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080161EE
	cmp r1, 0
	bgt _080161E8
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080162AE
	b _08016878
_080161E8:
	cmp r1, 0x1
	beq _080162AE
	b _08016878
_080161EE:
	adds r0, r6, 0
	adds r0, 0x4C
	movs r1, 0x51
	strh r1, [r0]
	ldr r1, =gUnknown_02022C2C
	ldrb r1, [r1]
	adds r5, r0, 0
	cmp r1, 0x45
	bne _08016220
	movs r4, 0x40
	orrs r4, r1
	movs r0, 0x1
	bl sub_801100C
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	movs r2, 0
	bl sub_8011090
	b _0801623E
	.pool
_08016220:
	movs r0, 0x40
	adds r4, r1, 0
	orrs r4, r0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl sub_801100C
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	movs r2, 0x1
	bl sub_8011090
_0801623E:
	ldr r1, [r6, 0x8]
	movs r0, 0
	strb r0, [r1, 0x1B]
	strh r0, [r7, 0x6]
	ldr r0, =gUnknown_02022C2C
	ldrb r0, [r0]
	cmp r0, 0x41
	bne _08016286
	bl sub_8018024
	cmp r0, 0
	bne _0801627C
	movs r0, 0x52
	strh r0, [r5]
	adds r0, r5, 0
	bl sub_800FE50
	movs r0, 0xA
	strb r0, [r6, 0x14]
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_082EEC14
	bl StringCopy
	b _08016878
	.pool
_0801627C:
	adds r0, r5, 0
	bl sub_800FE50
	movs r0, 0xD
	b _08016876
_08016286:
	cmp r0, 0x48
	bne _080162A4
	adds r0, r5, 0
	bl sub_800FE50
	ldr r0, =gStringVar4
	adds r1, r6, 0
	movs r2, 0x1
	bl sub_8018220
	movs r0, 0x28
	b _08016876
	.pool
_080162A4:
	adds r0, r5, 0
	bl sub_800FE50
	movs r0, 0xD
	b _08016876
_080162AE:
	adds r0, r6, 0
	adds r0, 0x4C
	movs r1, 0x52
	strh r1, [r0]
	bl sub_800FE50
	movs r0, 0xA
	strb r0, [r6, 0x14]
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_02022C2C
	ldrb r1, [r1]
	bl sub_8013078
	b _08016878
	.pool
_080162D4:
	bl sub_800AC34
	movs r0, 0x24
	b _08016876
_080162DC:
	ldr r0, =gUnknown_03003124
	ldrb r4, [r0]
	cmp r4, 0
	beq _080162E6
	b _08016878
_080162E6:
	ldr r1, =gUnknown_02022C2C
	movs r0, 0x40
	strb r0, [r1]
	ldr r1, =gStringVar4
	movs r0, 0x25
	bl sub_8015664
	adds r0, r6, 0
	adds r0, 0x4C
	movs r1, 0
	movs r2, 0xC
	bl memset
	adds r0, r6, 0
	adds r0, 0x9A
	strh r4, [r0]
	subs r0, 0x2
	strh r4, [r0]
	b _08016878
	.pool
_08016318:
	movs r0, 0x2
	strb r0, [r6, 0x14]
	movs r0, 0
	bl sub_801818C
	b _08016878
_08016324:
	ldr r4, =gStringVar4
	ldr r0, =gUnknown_02022C2C
	ldrb r0, [r0]
	movs r1, 0x40
	orrs r1, r0
	adds r0, r4, 0
	bl sub_8017E00
	movs r0, 0xE
	adds r1, r4, 0
	bl sub_8015664
	b _08016878
	.pool
_08016348:
	bl sub_800ADF8
	movs r0, 0xF
	b _08016876
_08016350:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	bne _0801635C
	b _08016878
_0801635C:
	movs r0, 0x10
	b _08016876
_08016360:
	ldr r0, [r6, 0x8]
	bl Free
	ldr r0, [r6]
	bl Free
	ldr r0, [r6, 0xC]
	bl Free
	ldr r0, [r6, 0x4]
	bl Free
	adds r0, r6, 0
	adds r0, 0x20
	ldrb r0, [r0]
	bl DestroyTask
	adds r0, r6, 0
	adds r0, 0x21
	bl sub_8019F04
	movs r0, 0x11
	b _08016876
_0801638E:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x12
	b _08016876
_080163A2:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	beq _080163AE
	b _08016878
_080163AE:
	bl sub_8019E3C
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, =gUnknown_02022C30
	ldr r0, [r0]
	bl Free
	bl sub_80149D8
	b _08016878
	.pool
_080163CC:
	bl sub_800F7DC
	ldrh r1, [r0, 0x8]
	ldr r4, =0x000003ff
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _080163E4
	movs r0, 0x2B
	b _08016876
	.pool
_080163E4:
	bl sub_800F7DC
	ldrh r1, [r0, 0x8]
	adds r0, r4, 0
	ands r0, r1
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	bne _08016408
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_082EF590
	bl StringCopy
	b _0801643E
	.pool
_08016408:
	ldr r4, =gStringVar1
	bl sub_800F7DC
	ldrh r0, [r0, 0x8]
	lsls r0, 22
	lsrs r0, 22
	movs r1, 0xB
	muls r1, r0
	ldr r0, =gSpeciesNames
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	ldr r4, =gStringVar2
	bl sub_800F7DC
	ldrb r1, [r0, 0xB]
	lsrs r1, 1
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_082EF564
	bl StringExpandPlaceholders
_0801643E:
	ldr r1, =gStringVar4
	movs r0, 0x2C
	bl sub_8015664
	b _08016878
	.pool
_0801645C:
	adds r0, r6, 0
	adds r0, 0x16
	ldr r1, =gUnknown_082EF20C
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	bne _0801646E
	b _08016878
_0801646E:
	movs r0, 0x2F
	b _08016876
	.pool
_08016478:
	adds r0, r6, 0
	adds r0, 0x16
	adds r1, r6, 0
	adds r1, 0x1D
	adds r2, r6, 0
	adds r2, 0x1E
	ldr r3, =gUnknown_082F025C
	ldr r4, =gUnknown_082F027C
	str r4, [sp]
	bl sub_8017178
	adds r5, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	bne _0801649A
	b _08016878
_0801649A:
	subs r0, 0x1
	cmp r5, r0
	beq _080164A4
	cmp r5, 0x3
	bne _080164B8
_080164A4:
	movs r0, 0x4
	strb r0, [r6, 0x14]
	movs r0, 0x1
	bl sub_801818C
	b _08016878
	.pool
_080164B8:
	cmp r5, 0x1
	beq _080164C2
	cmp r5, 0x2
	beq _080164D0
	b _08016878
_080164C2:
	ldr r1, =gUnknown_082EF4C4
	movs r0, 0x35
	bl sub_8015664
	b _08016878
	.pool
_080164D0:
	ldr r1, =gUnknown_082EF298
	movs r0, 0x2F
	bl sub_8015664
	b _08016878
	.pool
_080164E0:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x36
	b _08016876
_080164F4:
	ldr r0, =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08016502
	b _08016878
_08016502:
	ldr r1, =gUnknown_02022C40
	movs r0, 0x1
	strh r0, [r1]
	ldr r1, =gUnknown_03005DAC
	ldr r0, =sub_80AF128
	str r0, [r1]
	ldr r1, =c2_exit_to_overworld_2_switch
	movs r0, 0x8
	bl sub_81B8904
	b _08016878
	.pool
_0801652C:
	adds r0, r6, 0
	adds r0, 0x16
	adds r1, r6, 0
	adds r1, 0x1D
	adds r2, r6, 0
	adds r2, 0x1E
	ldr r3, =gUnknown_082F0294
	ldr r4, =gUnknown_082F032C
	str r4, [sp]
	bl sub_8017178
	adds r5, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	bne _0801654E
	b _08016878
_0801654E:
	subs r0, 0x1
	cmp r5, r0
	beq _08016558
	cmp r5, 0x12
	bne _08016580
_08016558:
	ldr r0, =gUnknown_02022C40
	bl sub_801807C
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_8010FCC
	ldr r0, =gUnknown_082EF4FC
	bl sub_801568C
	b _08016878
	.pool
_08016580:
	ldr r0, =gUnknown_02022C40
	strh r5, [r0, 0x2]
	movs r0, 0x37
	b _08016876
	.pool
_0801658C:
	ldr r2, =gUnknown_02022C40
	ldrh r0, [r2, 0x2]
	ldrh r1, [r2, 0xA]
	ldrh r2, [r2, 0xC]
	bl sub_8010FCC
	ldr r0, =gUnknown_082EF520
	bl sub_801568C
	b _08016878
	.pool
_080165A8:
	adds r0, r6, 0
	adds r0, 0x16
	movs r1, 0
	bl sub_80170B8
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080165CE
	cmp r1, 0
	bgt _080165C8
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080165D2
	b _08016878
_080165C8:
	cmp r1, 0x1
	beq _080165D2
	b _08016878
_080165CE:
	movs r0, 0x38
	b _08016876
_080165D2:
	movs r0, 0x1
	bl sub_801818C
	movs r0, 0x4
	b _08016876
_080165DC:
	adds r0, r6, 0
	adds r0, 0x16
	ldr r1, =gUnknown_082EF5B8
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	bne _080165EE
	b _08016878
_080165EE:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_8010FCC
	ldr r0, =gUnknown_02022C40
	bl sub_801807C
	movs r0, 0x1
	bl sub_801818C
	movs r0, 0x4
	b _08016876
	.pool
_08016610:
	adds r0, r6, 0
	adds r0, 0x16
	ldr r1, =gUnknown_082EF1EC
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	bne _08016622
	b _08016878
_08016622:
	movs r0, 0x2E
	b _08016876
	.pool
_0801662C:
	bl sub_80173B0
	movs r0, 0x30
	b _08016876
_08016634:
	adds r0, r6, 0
	adds r0, 0x16
	adds r1, r6, 0
	adds r1, 0x1D
	adds r2, r6, 0
	adds r2, 0x4A
	adds r3, r6, 0
	adds r3, 0x1E
	ldr r4, =gUnknown_082F034C
	str r4, [sp]
	ldr r4, =gUnknown_082F03A4
	str r4, [sp, 0x4]
	ldr r4, [r6]
	str r4, [sp, 0x8]
	bl sub_80172A0
	adds r5, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	bne _08016660
	b _08016878
_08016660:
	subs r0, 0x1
	cmp r5, r0
	beq _0801666A
	cmp r5, 0x8
	bne _0801667C
_0801666A:
	movs r0, 0x1
	bl sub_801818C
	movs r0, 0x4
	b _08016876
	.pool
_0801667C:
	bl sub_80173B0
	ldr r1, [r6]
	lsls r4, r5, 5
	adds r1, r4
	ldrb r0, [r1, 0x9]
	lsrs r0, 2
	ldrh r1, [r1, 0x8]
	lsls r1, 22
	lsrs r1, 22
	bl sub_8017D04
	cmp r0, 0x1
	beq _080166C8
	cmp r0, 0x1
	bgt _080166A2
	cmp r0, 0
	beq _080166A8
	b _08016878
_080166A2:
	cmp r0, 0x2
	beq _080166FC
	b _08016878
_080166A8:
	ldr r0, =gStringVar1
	ldr r1, [r6]
	adds r1, r4
	bl sub_8018404
	ldr r1, =gUnknown_082EF65C
	movs r0, 0x31
	bl sub_8015664
	strh r5, [r7, 0x2]
	b _08016878
	.pool
_080166C8:
	ldr r0, =gStringVar1
	ldr r1, [r6]
	adds r1, r4
	bl sub_8018404
	ldr r0, =gStringVar2
	ldr r1, [r6]
	adds r1, r4
	ldrb r2, [r1, 0x9]
	lsrs r2, 2
	lsls r1, r2, 3
	subs r1, r2
	ldr r2, =gTypeNames
	adds r1, r2
	bl StringCopy
	ldr r1, =gUnknown_082EF6E4
	b _0801671E
	.pool
_080166FC:
	ldr r0, =gStringVar1
	ldr r1, [r6]
	adds r1, r4
	bl sub_8018404
	ldr r0, =gStringVar2
	ldr r1, [r6]
	adds r1, r4
	ldrb r2, [r1, 0x9]
	lsrs r2, 2
	lsls r1, r2, 3
	subs r1, r2
	ldr r2, =gTypeNames
	adds r1, r2
	bl StringCopy
	ldr r1, =gUnknown_082EF718
_0801671E:
	movs r0, 0x2E
	bl sub_8015664
	b _08016878
	.pool
_08016738:
	adds r0, r6, 0
	adds r0, 0x16
	movs r1, 0
	bl sub_80170B8
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0801675E
	cmp r1, 0
	bgt _08016758
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08016762
	b _08016878
_08016758:
	cmp r1, 0x1
	beq _08016762
	b _08016878
_0801675E:
	movs r0, 0x32
	b _08016876
_08016762:
	movs r0, 0x1
	bl sub_801818C
	movs r0, 0x4
	b _08016876
_0801676C:
	adds r0, r6, 0
	adds r0, 0x16
	ldr r1, =gUnknown_082EF4C4
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	bne _0801677E
	b _08016878
_0801677E:
	ldr r4, =gUnknown_02022C40
	movs r0, 0x2
	strh r0, [r4]
	ldr r2, =gUnknown_02022C38
	movs r3, 0x2
	ldrsh r0, [r7, r3]
	ldr r1, [r6]
	lsls r0, 5
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	ldr r2, =gUnknown_02022C3E
	ldr r1, [r6]
	movs r3, 0x2
	ldrsh r0, [r7, r3]
	lsls r0, 5
	adds r1, r0
	ldrb r0, [r1, 0x9]
	lsrs r0, 2
	strb r0, [r2]
	ldr r2, =gUnknown_02022C3C
	ldr r1, [r6]
	movs r3, 0x2
	ldrsh r0, [r7, r3]
	lsls r0, 5
	adds r1, r0
	ldrh r0, [r1, 0x8]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r2]
	ldr r1, =gUnknown_03005DAC
	ldr r0, =sub_80AF128
	str r0, [r1]
	ldr r1, =c2_exit_to_overworld_2_switch
	movs r0, 0x9
	bl sub_81B8904
	adds r0, r6, 0
	bl sub_80156B0
	ldrh r0, [r7, 0x2]
	strb r0, [r4, 0x8]
	b _08016878
	.pool
_080167F4:
	ldr r1, =gUnknown_02022C2C
	movs r0, 0x44
	strb r0, [r1]
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	lsls r0, 5
	ldr r1, [r6]
	adds r1, r0
	adds r0, r1, 0
	adds r0, 0x10
	movs r2, 0x44
	bl sub_8012188
	ldr r0, =gStringVar1
	movs r3, 0x2
	ldrsh r2, [r7, r3]
	lsls r2, 5
	ldr r1, [r6]
	adds r1, r2
	bl sub_8018404
	ldr r0, =gUnknown_082EE17C
	ldr r0, [r0, 0x8]
	bl sub_8017020
	movs r0, 0x19
	b _08016876
	.pool
_08016838:
	adds r0, r6, 0
	adds r0, 0x16
	ldr r1, =gStringVar4
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	beq _08016878
	movs r0, 0x1
	bl sub_801818C
	movs r1, 0
	ldrsh r0, [r7, r1]
	movs r2, 0x2
	ldrsh r1, [r7, r2]
	ldr r2, [r6]
	bl sub_801A3D0
	movs r0, 0x4
	b _08016876
	.pool
_08016864:
	adds r0, r6, 0
	adds r0, 0x16
	ldr r1, =gStringVar4
	bl sub_8017064
	lsls r0, 24
	cmp r0, 0
	beq _08016878
	ldrb r0, [r6, 0x15]
_08016876:
	strb r0, [r6, 0x14]
_08016878:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80156E0

	thumb_func_start var_800D_set_xB
var_800D_set_xB: @ 8016884
	push {lr}
	bl InUnionRoom
	cmp r0, 0x1
	bne _08016894
	ldr r1, =gUnknown_020375F0
	movs r0, 0xB
	strh r0, [r1]
_08016894:
	pop {r0}
	bx r0
	.pool
	thumb_func_end var_800D_set_xB

	thumb_func_start sub_801689C
sub_801689C: @ 801689C
	push {r4,r5,lr}
	adds r2, r0, 0
	ldr r3, =gUnknown_03003090
	ldrh r5, [r3, 0x12]
	adds r4, r5, 0
	cmp r4, 0
	beq _080168D0
	ldrh r0, [r3, 0x10]
	movs r1, 0xFF
	lsls r1, 8
	ands r1, r0
	movs r0, 0xBC
	lsls r0, 6
	cmp r1, r0
	bne _080168D0
	adds r0, r2, 0
	adds r0, 0x9A
	strh r5, [r0]
	cmp r4, 0x44
	bne _080168D0
	ldrh r1, [r3, 0x14]
	adds r0, 0x2
	strh r1, [r0]
	ldrh r1, [r3, 0x16]
	adds r0, 0x2
	strh r1, [r0]
_080168D0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801689C

	thumb_func_start sub_80168DC
sub_80168DC: @ 80168DC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r4, 0
	adds r5, 0x9A
	ldrh r0, [r5]
	cmp r0, 0
	beq _0801692C
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_020229E8
	adds r1, 0x2F
	ldrb r1, [r1]
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_8017EA0
	cmp r0, 0
	beq _0801692C
	cmp r0, 0x1
	bne _0801691C
	movs r0, 0x23
	strb r0, [r4, 0x14]
	ldr r1, =gUnknown_02022C2C
	ldrh r0, [r5]
	strb r0, [r1]
	movs r0, 0
	b _0801692E
	.pool
_0801691C:
	cmp r0, 0x2
	bne _0801692C
	movs r0, 0x24
	strb r0, [r4, 0x14]
	bl sub_800AC34
	movs r0, 0
	b _0801692E
_0801692C:
	movs r0, 0x1
_0801692E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80168DC

	thumb_func_start sub_8016934
sub_8016934: @ 8016934
	push {r4,r5,lr}
	ldr r5, =gUnknown_02022C20
	movs r0, 0xFF
	strb r0, [r5]
	ldr r0, =task00_081199FC
	movs r1, 0
	bl CreateTask
	ldr r4, =gUnknown_02022C30
	movs r0, 0x9B
	lsls r0, 2
	bl AllocZeroed
	str r0, [r4]
	ldr r1, =gUnknown_03000DA8
	str r0, [r1]
	movs r1, 0
	strb r1, [r0, 0x14]
	strb r1, [r0, 0x16]
	strh r1, [r0, 0x10]
	strh r1, [r0, 0x12]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8016934

	thumb_func_start task00_081199FC
task00_081199FC: @ 801697C
	push {r4-r6,lr}
	sub sp, 0x20
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, =gUnknown_02022C30
	ldr r5, [r0]
	ldrb r0, [r5, 0x14]
	cmp r0, 0x4
	bls _08016990
	b _08016AC8
_08016990:
	lsls r0, 2
	ldr r1, =_080169A4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_080169A4:
	.4byte _080169B8
	.4byte _080169BE
	.4byte _080169E0
	.4byte _08016A30
	.4byte _08016A94
_080169B8:
	movs r0, 0x1
	strb r0, [r5, 0x14]
	b _08016AC8
_080169BE:
	movs r0, 0xC
	movs r1, 0
	movs r2, 0
	bl sub_8010F84
	bl sub_800B488
	bl sub_8009734
	bl sub_8011C84
	movs r0, 0x1
	bl sub_80111B0
	movs r0, 0x2
	strb r0, [r5, 0x14]
	b _08016AC8
_080169E0:
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r5, 0x4]
	movs r1, 0x4
	bl sub_80175EC
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r5, 0xC]
	movs r1, 0x4
	bl sub_80175EC
	movs r0, 0x80
	lsls r0, 1
	bl AllocZeroed
	str r0, [r5]
	movs r1, 0x8
	bl sub_8017580
	movs r0, 0x20
	bl AllocZeroed
	str r0, [r5, 0x8]
	movs r1, 0x1
	bl sub_8017580
	ldr r0, [r5, 0xC]
	ldr r1, [r5, 0x4]
	movs r2, 0xA
	bl sub_8016DF0
	adds r1, r5, 0
	adds r1, 0x20
	strb r0, [r1]
	movs r0, 0x3
	strb r0, [r5, 0x14]
	b _08016AC8
_08016A30:
	bl sub_8016B00
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	blt _08016AC8
	cmp r0, 0x2
	bgt _08016AC8
	ldr r0, =gUnknown_02022C20
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08016AC8
	movs r6, 0
_08016A4A:
	ldr r0, [r5]
	lsls r4, r6, 5
	adds r1, r0, r4
	ldrb r0, [r1, 0x1A]
	lsls r0, 30
	lsrs r0, 30
	cmp r0, 0x1
	bne _08016A78
	mov r0, sp
	bl sub_8018404
	ldr r0, [r5]
	adds r0, r4
	adds r0, 0x2
	bl sub_8015658
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	bl sub_800E540
	cmp r0, 0
	bne _08016A84
_08016A78:
	adds r6, 0x1
	cmp r6, 0x7
	ble _08016A4A
	b _08016AC8
	.pool
_08016A84:
	ldr r0, =gUnknown_02022C20
	mov r1, sp
	bl StringCopy
	b _08016AC8
	.pool
_08016A94:
	ldr r0, [r5, 0x8]
	bl Free
	ldr r0, [r5]
	bl Free
	ldr r0, [r5, 0xC]
	bl Free
	ldr r0, [r5, 0x4]
	bl Free
	adds r0, r5, 0
	adds r0, 0x20
	ldrb r0, [r0]
	bl DestroyTask
	ldr r0, =gUnknown_02022C30
	ldr r0, [r0]
	bl Free
	bl sub_800EDD4
	adds r0, r4, 0
	bl DestroyTask
_08016AC8:
	add sp, 0x20
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end task00_081199FC

	thumb_func_start sp182_move_string
sp182_move_string: @ 8016AD4
	push {r4,lr}
	ldr r4, =gUnknown_02022C20
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _08016AE8
	movs r0, 0
	b _08016AF6
	.pool
_08016AE8:
	ldr r0, =gStringVar1
	adds r1, r4, 0
	bl StringCopy
	movs r0, 0xFF
	strb r0, [r4]
	movs r0, 0x1
_08016AF6:
	pop {r4}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sp182_move_string

	thumb_func_start sub_8016B00
sub_8016B00: @ 8016B00
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, =gUnknown_02022C30
	ldr r4, [r0]
	movs r7, 0
	movs r6, 0
	movs r5, 0
_08016B12:
	ldr r0, [r4, 0xC]
	adds r0, r5
	ldr r1, =gUnknown_082F045C
	bl sub_8017630
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	bne _08016B5C
	ldr r1, [r4, 0xC]
	ldr r0, [r4, 0x8]
	adds r1, r5
	ldm r1!, {r2,r5,r6}
	stm r0!, {r2,r5,r6}
	ldm r1!, {r2,r5,r6}
	stm r0!, {r2,r5,r6}
	ldr r1, [r4, 0x8]
	movs r0, 0
	strh r0, [r1, 0x18]
	ldr r2, [r4, 0x8]
	ldrb r1, [r2, 0x1A]
	movs r5, 0x4
	negs r5, r5
	adds r0, r5, 0
	ands r1, r0
	movs r0, 0x1
	orrs r1, r0
	strb r1, [r2, 0x1A]
	ldr r0, [r4, 0x8]
	strb r3, [r0, 0x1B]
	movs r0, 0x4
	b _08016C90
	.pool
_08016B5C:
	adds r5, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	ble _08016B12
	movs r6, 0
	mov r9, r6
_08016B68:
	ldr r0, [r4]
	mov r1, r9
	lsls r5, r1, 5
	adds r2, r0, r5
	ldrb r0, [r2, 0x1A]
	lsls r0, 30
	mov r8, r5
	cmp r0, 0
	beq _08016C5C
	ldr r1, [r4, 0x4]
	adds r0, r2, 0
	bl sub_80176E4
	adds r6, r0, 0
	cmp r6, 0xFF
	beq _08016C02
	ldr r0, [r4]
	adds r2, r0, r5
	ldrb r1, [r2, 0x1A]
	lsls r0, r1, 30
	lsrs r0, 30
	cmp r0, 0x1
	bne _08016BE0
	lsls r0, r6, 3
	subs r0, r6
	lsls r6, r0, 2
	ldr r1, [r4, 0x4]
	adds r1, r6
	adds r0, r2, 0
	bl sub_8017678
	cmp r0, 0
	beq _08016BC6
	ldr r1, [r4]
	ldr r0, [r4, 0x4]
	adds r1, r5
	adds r0, r6
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldr r0, [r4]
	adds r0, r5
	movs r1, 0x40
	strb r1, [r0, 0x1B]
	movs r7, 0x1
	b _08016BF8
_08016BC6:
	ldr r0, [r4]
	adds r1, r0, r5
	ldrb r0, [r1, 0x1B]
	cmp r0, 0
	beq _08016BF8
	subs r0, 0x1
	strb r0, [r1, 0x1B]
	ldr r0, [r4]
	adds r0, r5
	ldrb r0, [r0, 0x1B]
	cmp r0, 0
	bne _08016BF8
	b _08016BF6
_08016BE0:
	movs r3, 0x4
	negs r3, r3
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1A]
	ldr r0, [r4]
	adds r0, r5
	movs r1, 0
	strb r1, [r0, 0x1B]
_08016BF6:
	movs r7, 0x2
_08016BF8:
	ldr r0, [r4]
	add r0, r8
	movs r1, 0
	strh r1, [r0, 0x18]
	b _08016C5C
_08016C02:
	ldr r0, [r4]
	adds r1, r0, r5
	ldrb r0, [r1, 0x1A]
	lsls r2, r0, 30
	lsrs r0, r2, 30
	cmp r0, 0x2
	beq _08016C3C
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	strh r0, [r1, 0x18]
	ldr r0, [r4]
	adds r2, r0, r5
	ldrh r1, [r2, 0x18]
	ldr r0, =0x00000257
	cmp r1, r0
	bls _08016C5C
	ldrb r0, [r2, 0x1A]
	movs r5, 0x4
	negs r5, r5
	adds r1, r5, 0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2, 0x1A]
	movs r7, 0x2
	b _08016C5C
	.pool
_08016C3C:
	lsrs r0, r2, 30
	cmp r0, 0x2
	bne _08016C5C
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	strh r0, [r1, 0x18]
	ldr r0, [r4]
	adds r2, r0, r5
	ldrh r1, [r2, 0x18]
	ldr r0, =0x00000383
	cmp r1, r0
	bls _08016C5C
	adds r0, r2, 0
	movs r1, 0x1
	bl sub_8017580
_08016C5C:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r0, 0x7
	bhi _08016C6C
	b _08016B68
_08016C6C:
	movs r5, 0
	movs r6, 0x3
_08016C70:
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	adds r1, r5
	movs r2, 0x8
	bl sub_8017734
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08016C86
	movs r7, 0x1
_08016C86:
	adds r5, 0x1C
	subs r6, 0x1
	cmp r6, 0
	bge _08016C70
	adds r0, r7, 0
_08016C90:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8016B00

	thumb_func_start sub_8016CA0
sub_8016CA0: @ 8016CA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r0, 2
	add r0, r10
	lsls r0, 3
	ldr r1, =gTasks + 0x8
	adds r6, r0, r1
	movs r7, 0
	mov r0, sp
	adds r0, 0x10
	str r0, [sp, 0x18]
_08016CC4:
	lsls r2, r7, 24
	lsrs r2, 24
	mov r0, sp
	ldr r1, [sp, 0x18]
	bl sub_800DE7C
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, sp
	ldrb r0, [r0, 0xA]
	lsls r0, 25
	lsrs r0, 25
	mov r2, r10
	lsls r1, r2, 2
	add r1, r10
	lsls r1, 3
	ldr r3, =gTasks
	adds r1, r3
	movs r5, 0x10
	ldrsh r1, [r1, r5]
	bl sub_8013D88
	cmp r0, 0
	bne _08016D00
	mov r1, sp
	ldr r0, =gUnknown_082F045C
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
_08016D00:
	mov r0, sp
	ldrb r1, [r0]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _08016D18
	mov r1, sp
	ldr r0, =gUnknown_082F045C
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
_08016D18:
	cmp r4, 0
	bne _08016D9C
	lsls r0, r7, 3
	mov r8, r0
	adds r1, r7, 0x1
	mov r9, r1
	cmp r7, 0
	ble _08016D58
	movs r2, 0
	str r2, [sp, 0x1C]
	adds r4, r7, 0
_08016D2E:
	ldr r0, [r6, 0x4]
	ldr r3, [sp, 0x1C]
	adds r0, r3
	mov r1, sp
	bl sub_8017630
	lsls r0, 24
	cmp r0, 0
	bne _08016D4C
	mov r1, sp
	ldr r0, =gUnknown_082F045C
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
_08016D4C:
	ldr r5, [sp, 0x1C]
	adds r5, 0x1C
	str r5, [sp, 0x1C]
	subs r4, 0x1
	cmp r4, 0
	bne _08016D2E
_08016D58:
	ldr r1, [r6, 0x4]
	mov r0, r8
	subs r4, r0, r7
	lsls r4, 2
	adds r1, r4
	mov r0, sp
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldr r0, [r6, 0x4]
	adds r0, r4
	ldr r1, =gUnknown_082F045C
	bl sub_8017630
	ldr r3, [r6, 0x4]
	adds r3, r4
	movs r2, 0x1
	ands r2, r0
	ldrb r0, [r3, 0x18]
	movs r4, 0x2
	negs r4, r4
	adds r1, r4, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x18]
	b _08016DD4
	.pool
_08016D9C:
	ldr r1, [r6]
	lsls r4, r7, 3
	subs r4, r7
	lsls r4, 2
	adds r1, r4
	mov r0, sp
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldr r0, [r6]
	adds r0, r4
	ldr r1, =gUnknown_082F045C
	bl sub_8017630
	ldr r3, [r6]
	adds r3, r4
	movs r2, 0x1
	ands r2, r0
	ldrb r0, [r3, 0x18]
	movs r4, 0x2
	negs r4, r4
	adds r1, r4, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x18]
	adds r7, 0x1
	mov r9, r7
_08016DD4:
	mov r7, r9
	cmp r7, 0x3
	bgt _08016DDC
	b _08016CC4
_08016DDC:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8016CA0

	thumb_func_start sub_8016DF0
sub_8016DF0: @ 8016DF0
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r0, =sub_8016CA0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, =gTasks + 0x8
	adds r3, r1, r2
	str r4, [r3]
	str r5, [r3, 0x4]
	adds r2, r1
	strh r6, [r2, 0x8]
	pop {r4-r6}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8016DF0

	thumb_func_start sub_8016E24
sub_8016E24: @ 8016E24
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r0, 2
	add r0, r10
	lsls r0, 3
	ldr r1, =gTasks + 0x8
	adds r6, r0, r1
	movs r3, 0
_08016E42:
	lsls r4, r3, 3
	subs r0, r4, r3
	lsls r5, r0, 2
	ldr r0, [r6]
	adds r0, r5
	adds r1, r0, 0
	adds r1, 0x10
	lsls r2, r3, 24
	lsrs r2, 24
	str r3, [sp]
	bl sub_800DE7C
	ldr r0, [r6]
	adds r0, r5
	ldrb r0, [r0, 0xA]
	lsls r0, 25
	lsrs r0, 25
	mov r2, r10
	lsls r1, r2, 2
	add r1, r10
	lsls r1, 3
	ldr r7, =gTasks
	adds r1, r7
	movs r2, 0xC
	ldrsh r1, [r1, r2]
	bl sub_8013D88
	mov r8, r4
	ldr r3, [sp]
	cmp r0, 0
	bne _08016E8E
	ldr r1, [r6]
	adds r1, r5
	ldr r0, =gUnknown_082F045C
	ldm r0!, {r2,r4,r7}
	stm r1!, {r2,r4,r7}
	ldm r0!, {r2,r4,r7}
	stm r1!, {r2,r4,r7}
_08016E8E:
	adds r4, r3, 0x1
	mov r9, r4
	cmp r3, 0
	ble _08016ED2
	str r5, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	adds r4, r3, 0
_08016E9E:
	ldr r1, [r6]
	ldr r7, [sp, 0x8]
	adds r0, r1, r7
	ldr r2, [sp, 0x4]
	adds r1, r2
	str r3, [sp]
	bl sub_8017630
	lsls r0, 24
	ldr r3, [sp]
	cmp r0, 0
	bne _08016EC6
	ldr r1, [r6]
	ldr r5, [sp, 0x4]
	adds r1, r5
	ldr r0, =gUnknown_082F045C
	ldm r0!, {r2,r5,r7}
	stm r1!, {r2,r5,r7}
	ldm r0!, {r2,r5,r7}
	stm r1!, {r2,r5,r7}
_08016EC6:
	ldr r7, [sp, 0x8]
	adds r7, 0x1C
	str r7, [sp, 0x8]
	subs r4, 0x1
	cmp r4, 0
	bne _08016E9E
_08016ED2:
	mov r0, r8
	subs r4, r0, r3
	lsls r4, 2
	ldr r0, [r6]
	adds r0, r4
	ldr r1, =gUnknown_082F045C
	bl sub_8017630
	ldr r3, [r6]
	adds r3, r4
	movs r2, 0x1
	ands r2, r0
	ldrb r0, [r3, 0x18]
	movs r4, 0x2
	negs r4, r4
	adds r1, r4, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x18]
	mov r3, r9
	cmp r3, 0x3
	ble _08016E42
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8016E24

	thumb_func_start sub_8016F1C
sub_8016F1C: @ 8016F1C
	push {lr}
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7
	bne _08016F2C
	ldrb r1, [r0]
	movs r0, 0x20
	b _08016F34
_08016F2C:
	cmp r1, 0x8
	bne _08016F3E
	ldrb r1, [r0]
	movs r0, 0x10
_08016F34:
	ands r0, r1
	cmp r0, 0
	beq _08016F3E
	movs r0, 0x1
	b _08016F40
_08016F3E:
	movs r0, 0
_08016F40:
	pop {r1}
	bx r1
	thumb_func_end sub_8016F1C

	thumb_func_start sub_8016F44
sub_8016F44: @ 8016F44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, =gTasks + 0x8
	adds r4, r1, r0
	movs r6, 0
	subs r0, 0x8
	movs r5, 0
	adds r1, r0
	mov r8, r1
_08016F62:
	ldr r0, [r4]
	adds r0, r5
	adds r1, r0, 0
	adds r1, 0x10
	lsls r2, r6, 24
	lsrs r2, 24
	bl sub_800DF34
	lsls r0, 24
	cmp r0, 0
	beq _08016F86
	ldr r0, [r4]
	adds r0, r5
	mov r2, r8
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	bl sub_8016F1C
_08016F86:
	ldr r0, [r4]
	adds r0, r5
	ldr r1, =gUnknown_082F045C
	bl sub_8017630
	ldr r3, [r4]
	adds r3, r5
	movs r2, 0x1
	ands r2, r0
	ldrb r0, [r3, 0x18]
	movs r7, 0x2
	negs r7, r7
	adds r1, r7, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x18]
	adds r5, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	ble _08016F62
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8016F44

	thumb_func_start sub_8016FC0
sub_8016FC0: @ 8016FC0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, =sub_8016E24
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	ldr r1, =gTasks + 0x8
	adds r3, r2, r1
	str r4, [r3]
	adds r1, r2
	strh r5, [r1, 0x4]
	pop {r4,r5}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8016FC0

	thumb_func_start sub_8016FF0
sub_8016FF0: @ 8016FF0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, =sub_8016F44
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	ldr r1, =gTasks + 0x8
	adds r3, r2, r1
	str r4, [r3]
	adds r1, r2
	strh r5, [r1, 0x4]
	pop {r4,r5}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8016FF0

	thumb_func_start sub_8017020
sub_8017020: @ 8017020
	push {r4,lr}
	adds r4, r0, 0
	bl sub_81973A4
	movs r0, 0
	movs r1, 0x1
	bl sub_81973C4
	ldr r0, =gStringVar4
	adds r1, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0x1
	bl AddTextPrinterWithCustomSpeedForMessage
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8017020

	thumb_func_start sub_801704C
sub_801704C: @ 801704C
	push {lr}
	bl sub_8197224
	lsls r0, 16
	cmp r0, 0
	beq _0801705C
	movs r0, 0
	b _0801705E
_0801705C:
	movs r0, 0x1
_0801705E:
	pop {r1}
	bx r1
	thumb_func_end sub_801704C

	thumb_func_start sub_8017064
sub_8017064: @ 8017064
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _08017076
	cmp r0, 0x1
	beq _0801709C
	b _080170AE
_08017076:
	bl sub_81973A4
	movs r0, 0
	movs r1, 0x1
	bl sub_81973C4
	ldr r0, =gStringVar4
	adds r1, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0x1
	bl AddTextPrinterForMessage_2
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _080170AE
	.pool
_0801709C:
	bl sub_8197224
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _080170AE
	strb r0, [r4]
	movs r0, 0x1
	b _080170B0
_080170AE:
	movs r0, 0
_080170B0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8017064

	thumb_func_start sub_80170B8
sub_80170B8: @ 80170B8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _080170CA
	cmp r0, 0x1
	beq _080170E0
	b _0801710C
_080170CA:
	cmp r5, 0
	beq _080170D4
	movs r0, 0x3
	negs r0, r0
	b _08017110
_080170D4:
	bl sub_8197930
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0801710C
_080170E0:
	cmp r5, 0
	beq _080170F2
	bl sub_8198C78
	movs r0, 0
	strb r0, [r4]
	movs r0, 0x3
	negs r0, r0
	b _08017110
_080170F2:
	bl sub_8198C58
	lsls r0, 24
	asrs r1, r0, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x2
	bhi _0801710C
	strb r5, [r4]
	adds r0, r1, 0
	b _08017110
_0801710C:
	movs r0, 0x2
	negs r0, r0
_08017110:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80170B8

	thumb_func_start sub_8017118
sub_8017118: @ 8017118
	push {r4,lr}
	sub sp, 0x8
	bl AddWindow
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0
	bl sub_81973FC
	adds r0, r4, 0
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	ldr r2, =gUnknown_082EFD94
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0x1
	movs r3, 0x8
	bl sub_80173E0
	adds r0, r4, 0
	movs r1, 0x2
	bl CopyWindowToVram
	adds r0, r4, 0
	bl PutWindowTilemap
	adds r0, r4, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8017118

	thumb_func_start sub_8017168
sub_8017168: @ 8017168
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl RemoveWindow
	pop {r0}
	bx r0
	thumb_func_end sub_8017168

	thumb_func_start sub_8017178
sub_8017178: @ 8017178
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	adds r7, r0, 0
	adds r5, r1, 0
	mov r9, r2
	ldrb r4, [r7]
	cmp r4, 0
	beq _08017194
	cmp r4, 0x1
	beq _08017228
	b _0801728E
_08017194:
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, [sp, 0x24]
	bl sub_81DB41C
	adds r1, r0, 0
	ldr r2, [sp]
	lsrs r0, r2, 24
	cmp r0, r1
	ble _080171B6
	lsls r1, 24
	ldr r0, =0x00ffffff
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
_080171B6:
	ldr r2, [sp]
	lsrs r0, r2, 8
	lsls r0, 24
	lsrs r0, 24
	lsrs r1, r2, 24
	adds r0, r1
	cmp r0, 0x1D
	ble _080171DC
	movs r0, 0x1D
	subs r0, r1
	cmp r0, 0
	bge _080171D0
	movs r0, 0
_080171D0:
	lsls r1, r0, 24
	lsrs r1, 16
	ldr r0, =0xffff00ff
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
_080171DC:
	mov r0, sp
	bl AddWindow
	strb r0, [r5]
	ldrb r0, [r5]
	movs r1, 0
	bl sub_81973FC
	ldr r0, =gUnknown_03006310
	adds r2, r0, 0
	ldr r1, [sp, 0x24]
	ldm r1!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	ldm r1!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	ldrb r1, [r5]
	strb r1, [r0, 0x10]
	movs r1, 0
	movs r2, 0
	bl ListMenuInit
	mov r1, r9
	strb r0, [r1]
	ldrb r0, [r5]
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	b _0801728E
	.pool
_08017228:
	mov r3, r9
	ldrb r0, [r3]
	bl ListMenuHandleInput
	mov r8, r0
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	ands r4, r1
	cmp r4, 0
	beq _08017264
	mov r4, r9
	ldrb r0, [r4]
	movs r1, 0
	movs r2, 0
	bl sub_81AE6C8
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_819746C
	ldrb r0, [r5]
	bl RemoveWindow
	movs r0, 0
	strb r0, [r7]
	mov r0, r8
	b _08017292
	.pool
_08017264:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0801728E
	mov r6, r9
	ldrb r0, [r6]
	movs r1, 0
	movs r2, 0
	bl sub_81AE6C8
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_819746C
	ldrb r0, [r5]
	bl RemoveWindow
	strb r4, [r7]
	movs r0, 0x2
	negs r0, r0
	b _08017292
_0801728E:
	movs r0, 0x1
	negs r0, r0
_08017292:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8017178

	thumb_func_start sub_80172A0
sub_80172A0: @ 80172A0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r10, r2
	mov r9, r3
	ldrb r4, [r5]
	cmp r4, 0x1
	beq _0801730C
	cmp r4, 0x1
	bgt _080172C2
	cmp r4, 0
	beq _080172C8
	b _0801739C
_080172C2:
	cmp r4, 0x2
	beq _0801731C
	b _0801739C
_080172C8:
	ldr r0, =gUnknown_082F0344
	bl sub_8017118
	mov r1, r9
	strb r0, [r1]
	ldr r0, [sp, 0x20]
	bl AddWindow
	strb r0, [r6]
	ldrb r0, [r6]
	movs r1, 0
	bl sub_81973FC
	ldr r0, =gUnknown_03006310
	adds r2, r0, 0
	ldr r1, [sp, 0x24]
	ldm r1!, {r3,r4,r7}
	stm r2!, {r3,r4,r7}
	ldm r1!, {r3,r4,r7}
	stm r2!, {r3,r4,r7}
	ldrb r1, [r6]
	strb r1, [r0, 0x10]
	movs r1, 0
	movs r2, 0x1
	bl ListMenuInit
	mov r1, r10
	strb r0, [r1]
	b _08017314
	.pool
_0801730C:
	ldrb r0, [r6]
	movs r1, 0x1
	bl CopyWindowToVram
_08017314:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _0801739C
_0801731C:
	mov r3, r10
	ldrb r0, [r3]
	bl ListMenuHandleInput
	adds r1, r0, 0
	ldr r0, =gMain
	ldrh r2, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r2
	cmp r0, 0
	beq _0801739C
	cmp r1, 0x8
	beq _0801733E
	ands r4, r2
	mov r8, r4
	cmp r4, 0
	beq _08017368
_0801733E:
	mov r4, r10
	ldrb r0, [r4]
	movs r1, 0
	movs r2, 0
	bl sub_81AE6C8
	ldrb r0, [r6]
	bl RemoveWindow
	mov r7, r9
	ldrb r0, [r7]
	bl sub_8017168
	movs r0, 0
	strb r0, [r5]
	movs r0, 0x2
	negs r0, r0
	b _080173A0
	.pool
_08017368:
	ldr r0, [sp, 0x28]
	bl sub_8017CB0
	adds r4, r0, 0
	cmp r4, 0
	blt _08017396
	mov r1, r10
	ldrb r0, [r1]
	movs r1, 0
	movs r2, 0
	bl sub_81AE6C8
	ldrb r0, [r6]
	bl RemoveWindow
	mov r3, r9
	ldrb r0, [r3]
	bl sub_8017168
	mov r7, r8
	strb r7, [r5]
	adds r0, r4, 0
	b _080173A0
_08017396:
	movs r0, 0x7
	bl audio_play
_0801739C:
	movs r0, 0x1
	negs r0, r0
_080173A0:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80172A0

	thumb_func_start sub_80173B0
sub_80173B0: @ 80173B0
	push {lr}
	sub sp, 0xC
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0xC
	pop {r0}
	bx r0
	thumb_func_end sub_80173B0

	thumb_func_start sub_80173D4
sub_80173D4: @ 80173D4
	push {lr}
	bl script_env_2_enable_and_set_ctx_running
	pop {r0}
	bx r0
	thumb_func_end sub_80173D4

	thumb_func_start sub_80173E0
sub_80173E0: @ 80173E0
	push {r4,r5,lr}
	sub sp, 0x10
	ldr r5, [sp, 0x1C]
	ldr r4, [sp, 0x20]
	lsls r3, 24
	lsrs r3, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	str r2, [sp]
	mov r2, sp
	strb r0, [r2, 0x4]
	mov r0, sp
	strb r1, [r0, 0x5]
	strb r3, [r0, 0x6]
	strb r5, [r0, 0x7]
	strb r3, [r0, 0x8]
	strb r5, [r0, 0x9]
	ldrb r1, [r2, 0xC]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0xC]
	ldr r2, =gUnknown_03003014
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	cmp r4, 0x6
	bls _08017422
	b _0801756E
_08017422:
	lsls r0, r4, 2
	ldr r1, =_08017434
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08017434:
	.4byte _08017450
	.4byte _0801747C
	.4byte _080174A8
	.4byte _080174D4
	.4byte _08017500
	.4byte _0801752C
	.4byte _08017544
_08017450:
	mov r0, sp
	movs r1, 0
	strb r1, [r0, 0xA]
	strb r1, [r0, 0xB]
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r3, 0xF
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2, 0xC]
	ldrb r1, [r2, 0xD]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0xD]
	ands r0, r3
	movs r1, 0x30
	b _0801756A
_0801747C:
	mov r0, sp
	movs r1, 0
	strb r1, [r0, 0xA]
	strb r1, [r0, 0xB]
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r3, 0xF
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2, 0xC]
	ldrb r1, [r2, 0xD]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0xD]
	ands r0, r3
	movs r1, 0x50
	b _0801756A
_080174A8:
	mov r0, sp
	movs r1, 0
	strb r1, [r0, 0xA]
	strb r1, [r0, 0xB]
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r3, 0xF
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x60
	orrs r0, r1
	strb r0, [r2, 0xC]
	ldrb r1, [r2, 0xD]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0xD]
	ands r0, r3
	movs r1, 0x70
	b _0801756A
_080174D4:
	mov r0, sp
	movs r1, 0
	strb r1, [r0, 0xA]
	strb r1, [r0, 0xB]
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r3, 0xF
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r2, 0xC]
	ldrb r1, [r2, 0xD]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0xD]
	ands r0, r3
	movs r1, 0x30
	b _0801756A
_08017500:
	mov r0, sp
	movs r1, 0
	strb r1, [r0, 0xA]
	strb r1, [r0, 0xB]
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r3, 0xF
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r2, 0xC]
	ldrb r1, [r2, 0xD]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2, 0xD]
	ands r0, r3
	movs r1, 0x30
	b _0801756A
_0801752C:
	mov r0, sp
	movs r1, 0
	strb r1, [r0, 0xA]
	strb r1, [r0, 0xB]
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r4, 0xF
	movs r3, 0xF
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x70
	b _0801755A
_08017544:
	mov r0, sp
	movs r1, 0
	strb r1, [r0, 0xA]
	strb r1, [r0, 0xB]
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r4, 0xF
	movs r3, 0xF
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0xE0
_0801755A:
	orrs r0, r1
	strb r0, [r2, 0xC]
	mov r1, sp
	ldrb r0, [r1, 0xD]
	orrs r0, r4
	strb r0, [r1, 0xD]
	ands r0, r3
	movs r1, 0x90
_0801756A:
	orrs r0, r1
	strb r0, [r2, 0xD]
_0801756E:
	mov r0, sp
	movs r1, 0xFF
	movs r2, 0
	bl AddTextPrinter
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80173E0

	thumb_func_start sub_8017580
sub_8017580: @ 8017580
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	beq _080175D8
	ldr r2, =gUnknown_082F045C
	mov r8, r2
	movs r5, 0
	mov r9, r5
	movs r6, 0x4
	negs r6, r6
	mov r12, r6
	adds r2, r0, 0
	adds r2, 0x18
	adds r4, r0, 0
	movs r7, 0xFF
	mov r10, r7
	adds r3, r1, 0
_080175AC:
	adds r1, r4, 0
	mov r0, r8
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	mov r0, r10
	strh r0, [r2]
	ldrb r1, [r2, 0x2]
	mov r0, r12
	ands r0, r1
	movs r1, 0x5
	negs r1, r1
	ands r0, r1
	strb r0, [r2, 0x2]
	mov r5, r9
	strb r5, [r2, 0x3]
	adds r2, 0x20
	adds r4, 0x20
	subs r3, 0x1
	cmp r3, 0
	bne _080175AC
_080175D8:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8017580

	thumb_func_start sub_80175EC
sub_80175EC: @ 80175EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r1, =gUnknown_082F045C
	mov r12, r1
	movs r5, 0x2
	negs r5, r5
	mov r8, r5
	adds r2, r0, 0
	adds r2, 0x18
	adds r3, r0, 0
	movs r4, 0x3
_08017604:
	adds r1, r3, 0
	mov r0, r12
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldrb r1, [r2]
	mov r0, r8
	ands r0, r1
	strb r0, [r2]
	adds r2, 0x1C
	adds r3, 0x1C
	subs r4, 0x1
	cmp r4, 0
	bge _08017604
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80175EC

	thumb_func_start sub_8017630
sub_8017630: @ 8017630
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	movs r2, 0
	adds r4, r5, 0x2
	adds r3, r6, 0x2
_0801763C:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08017664
	adds r2, 0x1
	cmp r2, 0x1
	ble _0801763C
	movs r2, 0
	adds r4, r5, 0
	adds r4, 0x10
	adds r3, r6, 0
	adds r3, 0x10
_08017658:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08017668
_08017664:
	movs r0, 0x1
	b _08017670
_08017668:
	adds r2, 0x1
	cmp r2, 0x7
	ble _08017658
	movs r0, 0
_08017670:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8017630

	thumb_func_start sub_8017678
sub_8017678: @ 8017678
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldrb r3, [r5, 0xA]
	movs r0, 0x7F
	ldrb r2, [r6, 0xA]
	adds r1, r0, 0
	ands r1, r3
	ands r0, r2
	cmp r1, r0
	bne _080176DC
	movs r0, 0x80
	adds r1, r0, 0
	ands r1, r3
	ands r0, r2
	cmp r1, r0
	bne _080176DC
	movs r2, 0
	adds r4, r5, 0x4
	adds r3, r6, 0x4
_080176A0:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080176DC
	adds r2, 0x1
	cmp r2, 0x3
	ble _080176A0
	ldrh r2, [r5, 0x8]
	ldr r0, =0x000003ff
	ldrh r3, [r6, 0x8]
	adds r1, r0, 0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bne _080176DC
	ldrb r2, [r5, 0x9]
	movs r0, 0xFC
	ldrb r3, [r6, 0x9]
	adds r1, r0, 0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bne _080176DC
	movs r0, 0
	b _080176DE
	.pool
_080176DC:
	movs r0, 0x1
_080176DE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8017678

	thumb_func_start sub_80176E4
sub_80176E4: @ 80176E4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, 0xFF
	movs r6, 0
	adds r4, r1, 0
	adds r4, 0x18
	adds r5, r1, 0
_080176F6:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0801771E
	mov r0, r8
	adds r1, r5, 0
	bl sub_8017630
	lsls r0, 24
	cmp r0, 0
	bne _0801771E
	lsls r0, r6, 24
	lsrs r7, r0, 24
	ldrb r0, [r4]
	movs r2, 0x2
	negs r2, r2
	adds r1, r2, 0
	ands r0, r1
	strb r0, [r4]
_0801771E:
	adds r4, 0x1C
	adds r5, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	ble _080176F6
	adds r0, r7, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80176E4

	thumb_func_start sub_8017734
sub_8017734: @ 8017734
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r3, r0, 0
	mov r8, r1
	lsls r2, 24
	lsrs r6, r2, 24
	ldrb r1, [r1, 0x18]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080177A8
	movs r5, 0
	cmp r5, r6
	bge _080177A8
	movs r0, 0x4
	negs r0, r0
	mov r9, r0
	movs r1, 0x2
	negs r1, r1
	mov r12, r1
	adds r2, r3, 0
	adds r2, 0x18
	adds r1, r3, 0
_08017766:
	ldrb r0, [r2, 0x2]
	movs r3, 0x3
	ands r3, r0
	cmp r3, 0
	bne _0801779E
	mov r0, r8
	ldm r0!, {r4,r6,r7}
	stm r1!, {r4,r6,r7}
	ldm r0!, {r4,r6,r7}
	stm r1!, {r4,r6,r7}
	strh r3, [r2]
	ldrb r1, [r2, 0x2]
	mov r0, r9
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x2]
	movs r0, 0x40
	strb r0, [r2, 0x3]
	mov r0, r8
	ldrb r1, [r0, 0x18]
	mov r0, r12
	ands r0, r1
	mov r1, r8
	strb r0, [r1, 0x18]
	lsls r0, r5, 24
	lsrs r0, 24
	b _080177AA
_0801779E:
	adds r2, 0x20
	adds r1, 0x20
	adds r5, 0x1
	cmp r5, r6
	blt _08017766
_080177A8:
	movs r0, 0xFF
_080177AA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8017734

	thumb_func_start sub_80177B8
sub_80177B8: @ 80177B8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	adds r4, r1, 0
	adds r6, r3, 0
	ldr r3, [sp, 0x2C]
	ldr r1, [sp, 0x30]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	lsls r1, 24
	lsrs r1, 24
	ldr r5, =gStringVar4
	adds r1, 0x1
	adds r0, r5, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r1, =gUnknown_082ED8C8
	adds r0, r5, 0
	bl StringAppend
	str r7, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	mov r0, r8
	movs r1, 0x1
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_80173E0
	adds r4, 0x12
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r6, 0xA]
	lsls r0, 25
	lsrs r2, r0, 25
	ldrb r1, [r6, 0x1A]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _08017884
	movs r0, 0x40
	ands r2, r0
	cmp r2, 0
	bne _08017884
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_8018404
	str r7, [sp]
	mov r0, r9
	str r0, [sp, 0x4]
	mov r0, r8
	movs r1, 0x1
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_80173E0
	ldrb r1, [r6, 0x2]
	ldrb r0, [r6, 0x3]
	lsls r0, 8
	orrs r1, r0
	add r0, sp, 0x8
	movs r2, 0x2
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	ldr r1, =gUnknown_082ED8CC
	adds r0, r5, 0
	bl StringCopy
	adds r0, r5, 0
	add r1, sp, 0x8
	bl StringAppend
	movs r0, 0x1
	adds r1, r5, 0
	movs r2, 0x88
	bl GetStringRightAlignXOffset
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	str r7, [sp]
	mov r0, r9
	str r0, [sp, 0x4]
	mov r0, r8
	movs r1, 0x1
	adds r2, r5, 0
	bl sub_80173E0
_08017884:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80177B8

	thumb_func_start sub_80178A0
sub_80178A0: @ 80178A0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	adds r5, r3, 0
	ldr r3, [sp, 0x2C]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r7, r3, 24
	ldrb r1, [r5, 0x1A]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _0801792A
	ldr r4, =gStringVar4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8018404
	mov r0, r8
	str r0, [sp]
	str r7, [sp, 0x4]
	mov r0, r9
	movs r1, 0x1
	adds r2, r4, 0
	adds r3, r6, 0
	bl sub_80173E0
	ldrb r1, [r5, 0x2]
	ldrb r0, [r5, 0x3]
	lsls r0, 8
	orrs r1, r0
	add r0, sp, 0x8
	movs r2, 0x2
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	ldr r1, =gUnknown_082ED8CC
	adds r0, r4, 0
	bl StringCopy
	adds r0, r4, 0
	add r1, sp, 0x8
	bl StringAppend
	movs r0, 0x1
	adds r1, r4, 0
	movs r2, 0x68
	bl GetStringRightAlignXOffset
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	str r0, [sp]
	str r7, [sp, 0x4]
	mov r0, r9
	movs r1, 0x1
	adds r2, r4, 0
	bl sub_80173E0
_0801792A:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80178A0

	thumb_func_start sub_8017940
sub_8017940: @ 8017940
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x9
	bne _08017978
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	bne _08017978
	ldr r0, =gUnknown_02037590
	ldrb r0, [r0, 0x3]
	cmp r0, 0x2
	beq _0801796E
	cmp r0, 0
	bne _08017978
_0801796E:
	movs r0, 0x1
	b _0801797A
	.pool
_08017978:
	movs r0, 0
_0801797A:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8017940

	thumb_func_start sub_8017984
sub_8017984: @ 8017984
	push {lr}
	cmp r0, 0x4
	beq _0801799C
	cmp r0, 0x4
	ble _080179A4
	cmp r0, 0x5
	beq _08017998
	cmp r0, 0x8
	beq _080179A0
	b _080179A4
_08017998:
	movs r0, 0x1
	b _080179A6
_0801799C:
	movs r0, 0x2
	b _080179A6
_080179A0:
	movs r0, 0x3
	b _080179A6
_080179A4:
	movs r0, 0
_080179A6:
	pop {r1}
	bx r1
	thumb_func_end sub_8017984

	thumb_func_start sub_80179AC
sub_80179AC: @ 80179AC
	push {r4,lr}
	sub sp, 0x20
	adds r4, r0, 0
	mov r0, sp
	adds r1, r4, 0
	bl sub_8018404
	adds r4, 0x2
	adds r0, r4, 0
	bl sub_8015658
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	bl sub_800E540
	add sp, 0x20
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80179AC

	thumb_func_start sub_80179D4
sub_80179D4: @ 80179D4
	push {r4-r6,lr}
	adds r6, r3, 0
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r2, 19
	adds r5, r0, r2
	ldrb r1, [r5, 0xA]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08017A4C
	cmp r4, 0
	bne _08017A4C
	ldr r4, =gStringVar1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8018404
	adds r0, r5, 0x2
	bl sub_8015658
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl sub_800E540
	adds r2, r0, 0
	ldrb r1, [r5, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x45
	bne _08017A38
	ldr r0, =gStringVar4
	ldr r3, =gUnknown_082EE6B8
	lsls r1, r6, 2
	lsls r2, 3
	adds r1, r2
	adds r1, r3
	ldr r1, [r1]
	bl StringExpandPlaceholders
	movs r0, 0x2
	b _08017B2A
	.pool
_08017A38:
	ldr r0, =gUnknown_082EE17C
	lsls r1, r2, 2
	adds r1, r0
	ldr r0, [r1]
	bl sub_8017020
	movs r0, 0x1
	b _08017B2A
	.pool
_08017A4C:
	ldr r0, =gStringVar1
	adds r1, r5, 0
	bl sub_8018404
	cmp r4, 0
	beq _08017A62
	adds r0, r5, r4
	ldrb r0, [r0, 0x3]
	lsrs r6, r0, 3
	movs r0, 0x1
	ands r6, r0
_08017A62:
	ldrb r0, [r5, 0xA]
	lsls r0, 25
	lsrs r0, 25
	movs r1, 0x3F
	ands r1, r0
	cmp r1, 0x4
	beq _08017AB0
	cmp r1, 0x4
	bgt _08017A80
	cmp r1, 0x1
	beq _08017A8A
	b _08017B20
	.pool
_08017A80:
	cmp r1, 0x5
	beq _08017AD0
	cmp r1, 0x8
	beq _08017AF4
	b _08017B20
_08017A8A:
	ldr r5, =gStringVar4
	ldr r4, =gUnknown_082EEEAC
	bl Random
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 14
	lsls r0, r6, 4
	adds r1, r0
	adds r1, r4
	ldr r1, [r1]
	b _08017B0E
	.pool
_08017AB0:
	ldr r5, =gStringVar4
	ldr r4, =gUnknown_082EF1CC
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	lsls r0, 2
	lsls r1, r6, 4
	b _08017B08
	.pool
_08017AD0:
	ldr r5, =gStringVar4
	ldr r4, =gUnknown_082EF010
	bl Random
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 14
	lsls r0, r6, 4
	adds r1, r0
	adds r1, r4
	ldr r1, [r1]
	b _08017B0E
	.pool
_08017AF4:
	ldr r5, =gStringVar4
	ldr r4, =gUnknown_082EF100
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	lsls r0, 2
	lsls r1, r6, 3
_08017B08:
	adds r0, r1
	adds r0, r4
	ldr r1, [r0]
_08017B0E:
	adds r0, r5, 0
	bl StringExpandPlaceholders
	b _08017B28
	.pool
_08017B20:
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_082EE6C8
	bl StringExpandPlaceholders
_08017B28:
	movs r0, 0
_08017B2A:
	pop {r4-r6}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_80179D4

	thumb_func_start nullsub_14
nullsub_14: @ 8017B38
	bx lr
	thumb_func_end nullsub_14

	thumb_func_start sub_8017B3C
sub_8017B3C: @ 8017B3C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	ldr r4, [sp, 0x28]
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r4, 24
	lsrs r4, 24
	ldrh r0, [r2, 0x8]
	lsls r0, 22
	lsrs r0, 22
	mov r8, r0
	ldrb r0, [r2, 0x9]
	lsrs r7, r0, 2
	ldrb r0, [r2, 0xB]
	lsrs r0, 1
	mov r9, r0
	str r5, [sp]
	str r4, [sp, 0x4]
	adds r0, r6, 0
	movs r1, 0x1
	adds r2, r3, 0
	movs r3, 0x8
	bl sub_80173E0
	movs r0, 0xCE
	lsls r0, 1
	cmp r8, r0
	bne _08017B94
	ldr r2, =gUnknown_082EF7D0
	str r5, [sp]
	str r4, [sp, 0x4]
	adds r0, r6, 0
	movs r1, 0x1
	movs r3, 0x44
	bl sub_80173E0
	b _08017BD4
	.pool
_08017B94:
	adds r1, r7, 0x1
	adds r0, r6, 0
	movs r2, 0x44
	adds r3, r5, 0
	bl blit_move_info_icon
	movs r0, 0xB
	mov r2, r8
	muls r2, r0
	ldr r0, =gSpeciesNames
	adds r2, r0
	str r5, [sp]
	str r4, [sp, 0x4]
	adds r0, r6, 0
	movs r1, 0x1
	movs r3, 0x76
	bl sub_80173E0
	add r0, sp, 0x8
	mov r1, r9
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	str r5, [sp]
	str r4, [sp, 0x4]
	adds r0, r6, 0
	movs r1, 0x1
	add r2, sp, 0x8
	movs r3, 0xC6
	bl sub_80173E0
_08017BD4:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8017B3C

	thumb_func_start sub_8017BE8
sub_8017BE8: @ 8017BE8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r0, =gUnknown_02022C30
	ldr r0, [r0]
	mov r8, r0
	movs r0, 0x3
	negs r0, r0
	cmp r4, r0
	bne _08017C6C
	ldr r0, =gUnknown_082F03A4
	ldrb r0, [r0, 0x14]
	lsls r0, 28
	lsrs r0, 28
	cmp r7, r0
	bne _08017C6C
	bl sub_800F7DC
	adds r2, r0, 0
	ldrh r1, [r2, 0x8]
	ldr r0, =0x000003ff
	ands r0, r1
	cmp r0, 0
	beq _08017CA0
	ldr r0, =gSaveBlock2Ptr
	ldr r3, [r0]
	movs r0, 0x5
	str r0, [sp]
	mov r0, r9
	adds r1, r7, 0
	bl sub_8017B3C
	b _08017CA0
	.pool
_08017C4C:
	mov r0, r12
	adds r1, r0, r4
	add r0, sp, 0x4
	bl sub_8018404
	mov r0, r8
	ldr r2, [r0]
	adds r2, r4
	movs r0, 0x6
	str r0, [sp]
	mov r0, r9
	adds r1, r7, 0
	add r3, sp, 0x4
	bl sub_8017B3C
	b _08017CA0
_08017C6C:
	movs r5, 0
	movs r1, 0
	mov r2, r8
	ldr r2, [r2]
	mov r12, r2
	adds r2, 0x8
	movs r3, 0
	adds r6, r4, 0x1
_08017C7C:
	ldrb r0, [r2, 0x12]
	lsls r0, 30
	lsrs r0, 30
	adds r4, r3, 0
	cmp r0, 0x1
	bne _08017C92
	ldrh r0, [r2]
	lsls r0, 22
	cmp r0, 0
	beq _08017C92
	adds r5, 0x1
_08017C92:
	cmp r5, r6
	beq _08017C4C
	adds r2, 0x20
	adds r3, 0x20
	adds r1, 0x1
	cmp r1, 0x7
	ble _08017C7C
_08017CA0:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8017BE8

	thumb_func_start sub_8017CB0
sub_8017CB0: @ 8017CB0
	push {r4-r7,lr}
	movs r4, 0
	movs r3, 0
	movs r7, 0x3
	ldr r6, =0x000003ff
	adds r2, r0, 0
	adds r2, 0x8
	adds r5, r1, 0x1
_08017CC0:
	ldrb r1, [r2, 0x12]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0x1
	bne _08017CD6
	ldrh r1, [r2]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	beq _08017CD6
	adds r4, 0x1
_08017CD6:
	cmp r4, r5
	bne _08017CE4
	adds r0, r3, 0
	b _08017CF0
	.pool
_08017CE4:
	adds r2, 0x20
	adds r3, 0x1
	cmp r3, 0x7
	ble _08017CC0
	movs r0, 0x1
	negs r0, r0
_08017CF0:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8017CB0

	thumb_func_start sub_8017CF8
sub_8017CF8: @ 8017CF8
	lsls r0, 5
	adds r0, r1
	ldrb r0, [r0, 0xB]
	lsls r0, 31
	lsrs r0, 31
	bx lr
	thumb_func_end sub_8017CF8

	thumb_func_start sub_8017D04
sub_8017D04: @ 8017D04
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bne _08017D44
	movs r4, 0
	b _08017D2E
_08017D14:
	movs r0, 0x64
	muls r0, r4
	ldr r1, =gPlayerParty
	adds r0, r1
	movs r1, 0x41
	bl GetMonData
	adds r1, r0, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	beq _08017D74
	adds r4, 0x1
_08017D2E:
	ldr r0, =gUnknown_020244E9
	ldrb r0, [r0]
	cmp r4, r0
	blt _08017D14
	movs r0, 0x2
	b _08017D90
	.pool
_08017D44:
	movs r4, 0
	ldr r0, =gUnknown_020244E9
	ldrb r0, [r0]
	cmp r4, r0
	bge _08017D8E
	ldr r6, =gBaseStats
_08017D50:
	movs r0, 0x64
	muls r0, r4
	ldr r1, =gPlayerParty
	adds r0, r1
	movs r1, 0x41
	bl GetMonData
	adds r1, r0, 0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r0, r6
	ldrb r0, [r1, 0x6]
	cmp r0, r5
	beq _08017D74
	ldrb r0, [r1, 0x7]
	cmp r0, r5
	bne _08017D84
_08017D74:
	movs r0, 0
	b _08017D90
	.pool
_08017D84:
	adds r4, 0x1
	ldr r0, =gUnknown_020244E9
	ldrb r0, [r0]
	cmp r4, r0
	blt _08017D50
_08017D8E:
	movs r0, 0x1
_08017D90:
	pop {r4-r6}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8017D04

	thumb_func_start sub_8017D9C
sub_8017D9C: @ 8017D9C
	push {lr}
	adds r3, r0, 0
	cmp r1, 0x44
	beq _08017DD8
	cmp r1, 0x44
	bgt _08017DAE
	cmp r1, 0x41
	beq _08017DB8
	b _08017DF6
_08017DAE:
	cmp r1, 0x45
	beq _08017DC8
	cmp r1, 0x48
	beq _08017DE8
	b _08017DF6
_08017DB8:
	ldr r0, =gUnknown_082EEA68
	lsls r1, r2, 2
	adds r1, r0
	ldr r1, [r1]
	b _08017DDA
	.pool
_08017DC8:
	ldr r0, =gUnknown_082EED3C
	lsls r1, r2, 2
	adds r1, r0
	ldr r1, [r1]
	b _08017DDA
	.pool
_08017DD8:
	ldr r1, =gUnknown_082EF7B0
_08017DDA:
	adds r0, r3, 0
	bl StringExpandPlaceholders
	b _08017DF6
	.pool
_08017DE8:
	ldr r0, =gUnknown_082EEB08
	lsls r1, r2, 2
	adds r1, r0
	ldr r1, [r1]
	adds r0, r3, 0
	bl StringExpandPlaceholders
_08017DF6:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8017D9C

	thumb_func_start sub_8017E00
sub_8017E00: @ 8017E00
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	adds r6, r4, 0
	bl link_get_multiplayer_id
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, =gUnknown_020229E8
	movs r0, 0x1
	adds r1, r3, 0
	eors r1, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x13]
	cmp r4, 0x44
	beq _08017E54
	cmp r4, 0x44
	bgt _08017E38
	cmp r4, 0x41
	beq _08017E3E
	b _08017E94
	.pool
_08017E38:
	cmp r6, 0x45
	beq _08017E78
	b _08017E94
_08017E3E:
	ldr r2, =gUnknown_082EE984
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 3
	adds r1, r0
	b _08017E66
	.pool
_08017E54:
	ldr r2, =gUnknown_082EE984
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 3
	adds r1, r0
	adds r2, 0x8
_08017E66:
	adds r1, r2
	ldr r1, [r1]
	adds r0, r5, 0
	bl StringCopy
	b _08017E94
	.pool
_08017E78:
	ldr r2, =gUnknown_082EE984
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 3
	adds r1, r0
	adds r2, 0x4
	adds r1, r2
	ldr r1, [r1]
	adds r0, r5, 0
	bl StringCopy
_08017E94:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8017E00

	thumb_func_start sub_8017EA0
sub_8017EA0: @ 8017EA0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r5, r2, 0
	adds r6, r3, 0
	movs r2, 0
	mov r8, r2
	ldrh r0, [r5]
	subs r0, 0x40
	cmp r0, 0x8
	bls _08017EBA
	b _08017FC6
_08017EBA:
	lsls r0, 2
	ldr r1, =_08017EC8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08017EC8:
	.4byte _08017FBC
	.4byte _08017EEC
	.4byte _08017FC6
	.4byte _08017FC6
	.4byte _08017EFC
	.4byte _08017EF4
	.4byte _08017FC6
	.4byte _08017FC6
	.4byte _08017FAC
_08017EEC:
	ldr r1, =gUnknown_082EE3DC
	b _08017FAE
	.pool
_08017EF4:
	ldr r1, =gUnknown_082EE430
	b _08017FAE
	.pool
_08017EFC:
	adds r0, r6, 0
	adds r0, 0x58
	ldr r4, =gUnknown_02022C40
	ldrh r1, [r4, 0xC]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r0, r6, 0
	adds r0, 0x68
	ldrh r2, [r4, 0xA]
	movs r1, 0xB
	muls r1, r2
	ldr r2, =gSpeciesNames
	adds r1, r2
	bl StringCopy
	movs r4, 0
	b _08017F2E
	.pool
_08017F2C:
	adds r4, 0x1
_08017F2E:
	cmp r4, 0x3
	bgt _08017F64
	ldr r0, =gUnknown_03007890
	ldr r0, [r0]
	lsls r1, r4, 5
	adds r0, r1
	ldrh r0, [r0, 0x18]
	cmp r0, 0x2
	bne _08017F2C
	ldrh r1, [r5, 0x4]
	adds r0, r6, 0
	adds r0, 0x78
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldrh r1, [r5, 0x2]
	movs r0, 0xB
	muls r1, r0
	ldr r0, =gSpeciesNames
	adds r1, r0
	adds r0, r6, 0
	adds r0, 0x88
	bl StringCopy
	ldrh r5, [r5, 0x2]
	mov r8, r5
_08017F64:
	movs r0, 0xCE
	lsls r0, 1
	cmp r8, r0
	bne _08017F84
	ldr r1, =gUnknown_082EE4F0
	adds r0, r7, 0
	bl StringCopy
	b _08017FB4
	.pool
_08017F84:
	movs r4, 0
	adds r5, r6, 0
	adds r5, 0x58
_08017F8A:
	lsls r0, r4, 24
	lsrs r0, 24
	adds r1, r5, 0
	bl sub_81AFC0C
	adds r5, 0x10
	adds r4, 0x1
	cmp r4, 0x3
	ble _08017F8A
	ldr r1, =gUnknown_082EE47C
	adds r0, r7, 0
	bl sub_81AFC28
	b _08017FB4
	.pool
_08017FAC:
	ldr r1, =gUnknown_082EE380
_08017FAE:
	adds r0, r7, 0
	bl StringExpandPlaceholders
_08017FB4:
	movs r2, 0x1
	b _08017FC6
	.pool
_08017FBC:
	ldr r1, =gUnknown_082EE544
	adds r0, r7, 0
	bl StringExpandPlaceholders
	movs r2, 0x2
_08017FC6:
	adds r0, r2, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8017EA0

	thumb_func_start sub_8017FD8
sub_8017FD8: @ 8017FD8
	push {lr}
	adds r2, r0, 0
	ldr r0, =gUnknown_03003090
	ldrh r1, [r0, 0x2]
	cmp r1, 0
	beq _08017FFC
	cmp r1, 0x51
	beq _08017FEC
	cmp r1, 0x52
	bne _08017FFC
_08017FEC:
	adds r0, r2, 0
	adds r0, 0x98
	strh r1, [r0]
	movs r0, 0x1
	b _08017FFE
	.pool
_08017FFC:
	movs r0, 0
_08017FFE:
	pop {r1}
	bx r1
	thumb_func_end sub_8017FD8

	thumb_func_start InUnionRoom
InUnionRoom: @ 8018004
	push {lr}
	movs r2, 0
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	ldr r0, =0x00003c19
	cmp r1, r0
	bne _08018016
	movs r2, 0x1
_08018016:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.pool
	thumb_func_end InUnionRoom

	thumb_func_start sub_8018024
sub_8018024: @ 8018024
	push {r4-r6,lr}
	movs r6, 0
	movs r5, 0
	ldr r0, =gUnknown_020244E9
	ldrb r0, [r0]
	cmp r6, r0
	bge _08018064
_08018032:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x1E
	bhi _0801805A
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0801805A
	adds r6, 0x1
_0801805A:
	adds r5, 0x1
	ldr r0, =gUnknown_020244E9
	ldrb r0, [r0]
	cmp r5, r0
	blt _08018032
_08018064:
	cmp r6, 0x1
	bgt _08018074
	movs r0, 0
	b _08018076
	.pool
_08018074:
	movs r0, 0x1
_08018076:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8018024

	thumb_func_start sub_801807C
sub_801807C: @ 801807C
	movs r1, 0
	strh r1, [r0]
	strh r1, [r0, 0x2]
	str r1, [r0, 0x4]
	strh r1, [r0, 0xA]
	strh r1, [r0, 0xC]
	strh r1, [r0, 0xE]
	strh r1, [r0, 0x10]
	str r1, [r0, 0x14]
	bx lr
	thumb_func_end sub_801807C

	thumb_func_start sub_8018090
sub_8018090: @ 8018090
	push {lr}
	ldr r0, =gUnknown_02022C40
	bl sub_801807C
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8018090

	thumb_func_start sub_80180A0
sub_80180A0: @ 80180A0
	push {r4,r5,lr}
	adds r5, r1, 0
	movs r1, 0x64
	adds r4, r0, 0
	muls r4, r1
	ldr r0, =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	strh r0, [r5, 0xA]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	strh r0, [r5, 0xC]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [r5, 0x4]
	ldrh r1, [r5, 0xA]
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	beq _080180E0
	movs r0, 0
	b _080180E2
	.pool
_080180E0:
	movs r0, 0x1
_080180E2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80180A0

	thumb_func_start sub_80180E8
sub_80180E8: @ 80180E8
	push {r4,r5,lr}
	adds r5, r1, 0
	movs r1, 0x64
	adds r4, r0, 0
	muls r4, r1
	ldr r0, =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	strh r0, [r5, 0xE]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	strh r0, [r5, 0x10]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [r5, 0x14]
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80180E8

	thumb_func_start sub_8018120
sub_8018120: @ 8018120
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r1, 24
	movs r2, 0
	mov r8, r2
	cmp r1, 0
	bne _0801813E
	ldrh r7, [r0, 0xA]
	ldr r6, [r0, 0x4]
	b _08018142
_08018136:
	lsls r0, r5, 16
	lsrs r0, 16
	mov r8, r0
	b _08018176
_0801813E:
	ldrh r7, [r0, 0xE]
	ldr r6, [r0, 0x14]
_08018142:
	movs r5, 0
	b _0801816E
_08018146:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	cmp r0, r6
	bne _0801816C
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r7
	beq _08018136
_0801816C:
	adds r5, 0x1
_0801816E:
	ldr r0, =gUnknown_020244E9
	ldrb r0, [r0]
	cmp r5, r0
	blt _08018146
_08018176:
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8018120

	thumb_func_start sub_801818C
sub_801818C: @ 801818C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80173B0
	bl script_env_2_disable
	bl sub_8098524
	ldr r1, =gUnknown_02022C2C
	movs r0, 0
	strb r0, [r1]
	cmp r4, 0
	beq _080181BC
	ldr r2, =gUnknown_02022C40
	ldrh r0, [r2, 0x2]
	ldrh r1, [r2, 0xA]
	ldrh r2, [r2, 0xC]
	bl sub_8010FCC
	movs r0, 0x40
	movs r1, 0
	movs r2, 0
	bl sub_8011090
_080181BC:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801818C

	thumb_func_start sub_80181CC
sub_80181CC: @ 80181CC
	push {lr}
	bl script_env_2_enable
	bl sub_80983E8
	pop {r0}
	bx r0
	thumb_func_end sub_80181CC

	thumb_func_start sub_80181DC
sub_80181DC: @ 80181DC
	push {r4,lr}
	movs r3, 0x80
	movs r2, 0
	ldr r4, [r0, 0xC]
_080181E4:
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r1, r4, r0
	ldrb r0, [r1, 0x18]
	lsls r0, 31
	cmp r0, 0
	beq _0801820C
	ldrb r0, [r1, 0xB]
	lsls r0, 31
	lsrs r0, 31
	lsls r0, 3
	orrs r3, r0
	ldrb r1, [r1, 0x2]
	movs r0, 0x7
	ands r0, r1
	orrs r3, r0
	lsls r0, r3, 24
	lsrs r3, r0, 24
	b _08018216
_0801820C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080181E4
_08018216:
	adds r0, r3, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80181DC

	thumb_func_start sub_8018220
sub_8018220: @ 8018220
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	bl link_get_multiplayer_id
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, =gUnknown_02039B58
	adds r1, r0
	mov r8, r1
	bl sub_81AFBF0
	mov r6, r9
	adds r6, 0xC0
	bl sub_8068BB0
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xD
	muls r1, r0
	ldr r0, =gTrainerClassNames
	adds r1, r0
	adds r0, r6, 0
	bl StringCopy
	movs r0, 0
	adds r1, r6, 0
	bl sub_81AFC0C
	mov r1, r8
	adds r1, 0x30
	movs r0, 0x1
	bl sub_81AFC0C
	movs r4, 0xBA
	lsls r4, 1
	add r4, r9
	ldr r1, =gUnknown_082EFF50
	mov r2, r8
	ldrb r0, [r2, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_81AFC0C
	mov r5, r9
	adds r5, 0xDE
	mov r0, r8
	ldrh r1, [r0, 0xC]
	adds r0, r5, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x3
	adds r1, r5, 0
	bl sub_81AFC0C
	movs r2, 0xED
	add r2, r9
	mov r10, r2
	mov r0, r8
	ldrh r1, [r0, 0x10]
	mov r0, r10
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	mov r4, r9
	adds r4, 0xFC
	mov r2, r8
	ldrh r1, [r2, 0x12]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	movs r0, 0x4
	mov r1, r10
	bl sub_81AFC0C
	movs r0, 0x5
	adds r1, r4, 0
	bl sub_81AFC0C
	movs r4, 0xD2
	lsls r4, 1
	add r4, r9
	ldr r1, =gUnknown_082EFF64
	adds r0, r4, 0
	bl sub_81AFC28
	ldr r0, =gStringVar4
	adds r1, r4, 0
	bl StringCopy
	mov r0, r8
	ldrh r1, [r0, 0x14]
	ldr r4, =0x0000270f
	cmp r1, r4
	ble _0801830C
	adds r1, r4, 0
_0801830C:
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	movs r0, 0
	adds r1, r6, 0
	bl sub_81AFC0C
	mov r2, r8
	ldrh r1, [r2, 0x16]
	cmp r1, r4
	ble _08018328
	adds r1, r4, 0
_08018328:
	mov r4, r9
	adds r4, 0xCF
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_81AFC0C
	mov r0, r8
	ldrh r1, [r0, 0x20]
	adds r0, r5, 0
	movs r2, 0
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	movs r0, 0x3
	adds r1, r5, 0
	bl sub_81AFC0C
	movs r7, 0
	movs r6, 0x80
	lsls r6, 19
	mov r5, r8
	adds r5, 0x28
	mov r4, r10
_08018360:
	ldrh r1, [r5]
	adds r0, r4, 0
	bl CopyEasyChatWord
	lsrs r0, r6, 24
	adds r1, r4, 0
	bl sub_81AFC0C
	movs r2, 0x80
	lsls r2, 17
	adds r6, r2
	adds r5, 0x2
	adds r4, 0xF
	adds r7, 0x1
	cmp r7, 0x3
	ble _08018360
	movs r4, 0xD2
	lsls r4, 1
	add r4, r9
	ldr r1, =gUnknown_082EFFA4
	adds r0, r4, 0
	bl sub_81AFC28
	ldr r5, =gStringVar4
	adds r0, r5, 0
	adds r1, r4, 0
	bl StringAppend
	ldr r0, [sp]
	cmp r0, 0x1
	bne _080183D0
	ldr r1, =gUnknown_082F0020
	adds r0, r4, 0
	bl sub_81AFC28
	adds r0, r5, 0
	adds r1, r4, 0
	bl StringAppend
	b _080183F0
	.pool
_080183D0:
	ldr r2, [sp]
	cmp r2, 0
	bne _080183F0
	ldr r0, =gUnknown_082F0018
	mov r2, r8
	ldrb r1, [r2]
	lsls r1, 2
	adds r1, r0
	ldr r1, [r1]
	adds r0, r4, 0
	bl sub_81AFC28
	adds r0, r5, 0
	adds r1, r4, 0
	bl StringAppend
_080183F0:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8018220

	thumb_func_start sub_8018404
sub_8018404: @ 8018404
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r1, 0x10
	bl StringCopy7
	ldrb r1, [r4]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r5, 0
	bl ConvertInternationalString
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8018404

	thumb_func_start sub_8018424
sub_8018424: @ 8018424
	push {lr}
	bl ProcessObjectCopyRequests
	bl LoadOamFromSprites
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8018424

	thumb_func_start sub_8018438
sub_8018438: @ 8018438
	push {lr}
	bl RunTasks
	bl RunTextPrinters
	bl CallObjectCallbacks
	bl PrepareSpritesForOamLoad
	pop {r0}
	bx r0
	thumb_func_end sub_8018438

	thumb_func_start sub_8018450
sub_8018450: @ 8018450
	push {r4-r7,lr}
	sub sp, 0xC
	adds r7, r0, 0
	ldr r0, =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r6, r0, r1
	ldrb r0, [r6]
	cmp r0, 0x1
	bne _08018466
	b _08018574
_08018466:
	cmp r0, 0x1
	bgt _08018474
	cmp r0, 0
	beq _08018482
	b _08018644
	.pool
_08018474:
	cmp r0, 0x2
	bne _0801847A
	b _080185F8
_0801847A:
	cmp r0, 0x3
	bne _08018480
	b _08018618
_08018480:
	b _08018644
_08018482:
	movs r0, 0
	bl SetVBlankCallback
	bl ResetPaletteFade
	bl ResetAllObjectData
	bl ResetObjectPaletteAllocator
	bl ResetTasks
	bl remove_some_task
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, =gUnknown_082F0598
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r4, 0x80
	lsls r4, 4
	adds r0, r4, 0
	bl Alloc
	adds r1, r0, 0
	movs r0, 0x3
	bl SetBgTilemapBuffer
	adds r0, r4, 0
	bl Alloc
	adds r1, r0, 0
	movs r0, 0x2
	bl SetBgTilemapBuffer
	adds r0, r4, 0
	bl Alloc
	adds r1, r0, 0
	movs r0, 0x1
	bl SetBgTilemapBuffer
	adds r0, r4, 0
	bl Alloc
	adds r1, r0, 0
	movs r0, 0
	bl SetBgTilemapBuffer
	movs r0, 0x3
	bl bgid_upload_textbox_1
	ldr r0, =gUnknown_082F05A8
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r1, 0xC0
	lsls r1, 7
	movs r0, 0
	bl ClearGpuRegBits
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	b _08018610
	.pool
_08018574:
	ldr r0, =gUnknown_082F0548
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0x2
	bl stdpal_get
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0xC0
	bl sub_81978B0
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xE0
	bl sub_809882C
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xF0
	bl box_border_load_tiles_and_pal
	movs r4, 0x20
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r5, 0x11
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r0, 0x3
	bl sub_8018798
	lsls r0, r7, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_80186EC
	b _08018610
	.pool
_080185F8:
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_08018610:
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _08018644
_08018618:
	movs r0, 0
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	ldr r0, =0x0000021d
	bl song_play_for_text
	ldr r0, =sub_8018424
	bl SetVBlankCallback
	movs r0, 0xC5
	bl EnableInterrupts
	movs r0, 0x1
	b _08018646
	.pool
_08018644:
	movs r0, 0
_08018646:
	add sp, 0xC
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8018450

	thumb_func_start c2_mystery_gift
c2_mystery_gift: @ 8018650
	push {lr}
	movs r0, 0
	bl sub_8018450
	cmp r0, 0
	beq _0801866C
	ldr r0, =sub_8018438
	bl SetMainCallback2
	ldr r1, =gUnknown_02022C60
	movs r0, 0
	strb r0, [r1]
	bl task_add_00_mystery_gift
_0801866C:
	bl RunTasks
	pop {r0}
	bx r0
	.pool
	thumb_func_end c2_mystery_gift

	thumb_func_start sub_801867C
sub_801867C: @ 801867C
	push {lr}
	movs r0, 0x1
	bl sub_8018450
	cmp r0, 0
	beq _08018698
	ldr r0, =sub_8018438
	bl SetMainCallback2
	ldr r1, =gUnknown_02022C60
	movs r0, 0x1
	strb r0, [r1]
	bl sub_81D5014
_08018698:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801867C

	thumb_func_start sub_80186A4
sub_80186A4: @ 80186A4
	push {lr}
	ldr r1, =gUnknown_02022C60
	movs r0, 0
	strb r0, [r1]
	bl FreeAllWindowBuffers
	movs r0, 0
	bl GetBgTilemapBuffer
	bl Free
	movs r0, 0x1
	bl GetBgTilemapBuffer
	bl Free
	movs r0, 0x2
	bl GetBgTilemapBuffer
	bl Free
	movs r0, 0x3
	bl GetBgTilemapBuffer
	bl Free
	ldr r0, =c2_title_screen_1
	bl SetMainCallback2
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80186A4

	thumb_func_start sub_80186EC
sub_80186EC: @ 80186EC
	push {r4-r7,lr}
	sub sp, 0x14
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	cmp r4, 0
	bne _0801871C
	ldr r0, =gUnknown_085EF654
	ldr r7, =gUnknown_085EF678
	cmp r5, 0
	bne _08018720
	ldr r7, =gUnknown_085EF664
	b _08018720
	.pool
_0801871C:
	ldr r0, =gUnknown_085EDFBF
	ldr r7, =gUnknown_085EDFC9
_08018720:
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	ldr r6, =gUnknown_082F0720
	str r6, [sp, 0x8]
	movs r5, 0x1
	negs r5, r5
	str r5, [sp, 0xC]
	str r0, [sp, 0x10]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x4
	movs r3, 0x1
	bl AddTextPrinterParametrized2
	movs r0, 0
	adds r1, r7, 0
	movs r2, 0xDE
	bl GetStringRightAlignXOffset
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	str r5, [sp, 0xC]
	str r7, [sp, 0x10]
	movs r0, 0
	movs r1, 0
	movs r3, 0x1
	bl AddTextPrinterParametrized2
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0
	bl PutWindowTilemap
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80186EC

	thumb_func_start sub_8018784
sub_8018784: @ 8018784
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	movs r2, 0xF
	bl sub_8098858
	pop {r0}
	bx r0
	thumb_func_end sub_8018784

	thumb_func_start sub_8018798
sub_8018798: @ 8018798
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r4, r0, 0
	movs r0, 0
	mov r9, r0
	lsls r4, 24
	lsrs r0, r4, 24
	movs r1, 0x20
	str r1, [sp]
	movs r1, 0x2
	str r1, [sp, 0x4]
	movs r1, 0x11
	str r1, [sp, 0x8]
	movs r1, 0x3
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	mov r8, r4
	movs r4, 0x1
_080187C8:
	movs r7, 0
	mov r0, r9
	adds r0, 0x2
	movs r1, 0x1
	add r1, r9
	mov r10, r1
	lsls r5, r0, 24
	movs r6, 0
_080187D8:
	mov r1, r9
	ands r1, r4
	adds r0, r7, 0
	ands r0, r4
	cmp r1, r0
	beq _080187FC
	lsrs r2, r6, 24
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	mov r1, r8
	lsrs r0, r1, 24
	movs r1, 0x1
	lsrs r3, r5, 24
	bl FillBgTilemapBufferRect
	b _08018812
_080187FC:
	lsrs r2, r6, 24
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	mov r1, r8
	lsrs r0, r1, 24
	movs r1, 0x2
	lsrs r3, r5, 24
	bl FillBgTilemapBufferRect
_08018812:
	movs r0, 0x80
	lsls r0, 17
	adds r6, r0
	adds r7, 0x1
	cmp r7, 0x1F
	ble _080187D8
	mov r9, r10
	mov r1, r9
	cmp r1, 0x11
	ble _080187C8
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8018798

	thumb_func_start sub_8018838
sub_8018838: @ 8018838
	push {lr}
	sub sp, 0xC
	cmp r0, 0
	beq _08018846
	cmp r0, 0x1
	beq _0801885E
	b _08018876
_08018846:
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	b _08018876
_0801885E:
	movs r0, 0x20
	str r0, [sp]
	movs r0, 0x1E
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect
_08018876:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0xC
	pop {r0}
	bx r0
	thumb_func_end sub_8018838

	thumb_func_start sub_8018884
sub_8018884: @ 8018884
	push {r4,lr}
	sub sp, 0x14
	adds r1, r0, 0
	ldr r4, =gStringVar4
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0x1
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	ldr r0, =gUnknown_082F0728
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x1
	bl AddTextPrinterParametrized2
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0xF
	bl sub_8098858
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8018884

	thumb_func_start sub_80188DC
sub_80188DC: @ 80188DC
	push {lr}
	movs r0, 0x1
	bl rbox_fill_rectangle
	movs r0, 0x1
	bl ClearWindowTilemap
	movs r0, 0x1
	movs r1, 0x1
	bl CopyWindowToVram
	pop {r0}
	bx r0
	thumb_func_end sub_80188DC

	thumb_func_start mevent_0814257C
mevent_0814257C: @ 80188F8
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	adds r0, r1, 0
	ldrb r2, [r4]
	cmp r2, 0x1
	beq _08018920
	cmp r2, 0x1
	bgt _08018910
	cmp r2, 0
	beq _0801891A
	b _08018980
_08018910:
	cmp r2, 0x2
	beq _08018954
	cmp r2, 0xFF
	beq _0801897C
	b _08018980
_0801891A:
	bl sub_8018884
	b _08018944
_08018920:
	movs r0, 0
	str r0, [sp]
	ldr r0, =gUnknown_02022C58
	str r0, [sp, 0x4]
	adds r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0xD0
	movs r2, 0x14
	movs r3, 0x1
	bl DrawDownArrow
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08018980
_08018944:
	ldrb r0, [r4]
	adds r0, 0x1
	b _0801897E
	.pool
_08018954:
	movs r0, 0x1
	str r0, [sp]
	ldr r0, =gUnknown_02022C58
	str r0, [sp, 0x4]
	adds r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0xD0
	movs r2, 0x14
	movs r3, 0x1
	bl DrawDownArrow
	movs r0, 0
	strb r0, [r4]
	bl sub_80188DC
	movs r0, 0x1
	b _08018982
	.pool
_0801897C:
	movs r0, 0x2
_0801897E:
	strb r0, [r4]
_08018980:
	movs r0, 0
_08018982:
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end mevent_0814257C

	thumb_func_start sub_801898C
sub_801898C: @ 801898C
	push {lr}
	sub sp, 0xC
	movs r0, 0
	str r0, [sp]
	ldr r0, =gUnknown_02022C58
	str r0, [sp, 0x4]
	adds r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0xD0
	movs r2, 0x14
	movs r3, 0x1
	bl DrawDownArrow
	add sp, 0xC
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801898C

	thumb_func_start sub_80189B4
sub_80189B4: @ 80189B4
	push {lr}
	sub sp, 0xC
	movs r0, 0x1
	str r0, [sp]
	ldr r0, =gUnknown_02022C58
	str r0, [sp, 0x4]
	adds r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0xD0
	movs r2, 0x14
	movs r3, 0x1
	bl DrawDownArrow
	add sp, 0xC
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80189B4

	thumb_func_start sub_80189DC
sub_80189DC: @ 80189DC
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _080189EC
	cmp r0, 0x1
	beq _08018A08
	b _08018A14
_080189EC:
	bl sub_801898C
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08018A14
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08018A14
	.pool
_08018A08:
	bl sub_80189B4
	movs r0, 0
	strb r0, [r4]
	movs r0, 0x1
	b _08018A16
_08018A14:
	movs r0, 0
_08018A16:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80189DC

	thumb_func_start sub_8018A1C
sub_8018A1C: @ 8018A1C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	bne _08018A2C
	adds r0, r1, 0
	bl sub_8018884
_08018A2C:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x78
	bhi _08018A3E
	movs r0, 0
	b _08018A48
_08018A3E:
	movs r0, 0
	strb r0, [r4]
	bl sub_80188DC
	movs r0, 0x1
_08018A48:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8018A1C

	thumb_func_start sub_8018A50
sub_8018A50: @ 8018A50
	push {r4,r5,lr}
	sub sp, 0x24
	lsls r2, 24
	add r1, sp, 0x4
	ldr r0, =gUnknown_082F0638
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldr r0, =gUnknown_082F05E0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x1C]
	str r1, [sp, 0x20]
	cmp r2, 0
	bne _08018A80
	ldr r0, =gUnknown_082F0608
	b _08018A82
	.pool
_08018A80:
	ldr r0, =gUnknown_082F0620
_08018A82:
	str r0, [sp, 0x4]
	add r0, sp, 0x4
	bl sub_81DB41C
	adds r3, r0, 0
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _08018A96
	adds r3, 0x1
_08018A96:
	lsls r1, r3, 24
	ldr r0, =0x00ffffff
	ldr r2, [sp, 0x1C]
	ands r2, r0
	orrs r2, r1
	str r2, [sp, 0x1C]
	cmp r3, 0x1D
	bgt _08018ACC
	movs r0, 0x1E
	subs r0, r3
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	lsls r0, 24
	lsrs r0, 16
	ldr r1, =0xffff00ff
	ands r1, r2
	orrs r1, r0
	str r1, [sp, 0x1C]
	b _08018AD2
	.pool
_08018ACC:
	ldr r0, =0xffff00ff
	ands r2, r0
	str r2, [sp, 0x1C]
_08018AD2:
	add r0, sp, 0x1C
	movs r1, 0xE0
	str r1, [sp]
	add r1, sp, 0x4
	movs r2, 0x1
	movs r3, 0xA
	bl DoMysteryGiftListMenu
	adds r4, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08018AFA
	movs r0, 0x2
	bl ClearWindowTilemap
	movs r0, 0x2
	movs r1, 0x1
	bl CopyWindowToVram
_08018AFA:
	adds r0, r4, 0
	add sp, 0x24
	pop {r4,r5}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8018A50

	thumb_func_start sub_8018B08
sub_8018B08: @ 8018B08
	push {r4-r6,lr}
	sub sp, 0x1C
	adds r5, r0, 0
	adds r4, r1, 0
	adds r1, r3, 0
	lsls r2, 24
	lsrs r6, r2, 24
	ldrb r0, [r5]
	cmp r0, 0x1
	beq _08018B98
	cmp r0, 0x1
	bgt _08018B26
	cmp r0, 0
	beq _08018B30
	b _08018C3E
_08018B26:
	cmp r0, 0x2
	beq _08018BE4
	cmp r0, 0xFF
	beq _08018C1A
	b _08018C3E
_08018B30:
	ldr r0, =gStringVar4
	bl StringExpandPlaceholders
	cmp r6, 0
	bne _08018B48
	ldr r0, =gUnknown_082F05C8
	b _08018B4A
	.pool
_08018B48:
	ldr r0, =gUnknown_082F05D0
_08018B4A:
	bl AddWindow
	strh r0, [r4]
	ldrb r0, [r4]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	movs r2, 0
	str r2, [sp]
	str r2, [sp, 0x4]
	ldr r1, =gUnknown_082F0728
	str r1, [sp, 0x8]
	str r2, [sp, 0xC]
	ldr r1, =gStringVar4
	str r1, [sp, 0x10]
	movs r1, 0x1
	movs r3, 0x1
	bl AddTextPrinterParametrized2
	ldrb r0, [r4]
	movs r1, 0x1
	movs r2, 0xF
	bl sub_8098858
	ldrb r0, [r4]
	movs r1, 0x2
	bl CopyWindowToVram
	ldrb r0, [r4]
	bl PutWindowTilemap
	b _08018BD6
	.pool
_08018B98:
	ldr r0, =gUnknown_082F05E8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x14]
	str r1, [sp, 0x18]
	cmp r6, 0
	bne _08018BBC
	ldr r0, =0xff00ffff
	ldr r1, [sp, 0x14]
	ands r1, r0
	movs r0, 0x90
	lsls r0, 12
	b _08018BC6
	.pool
_08018BBC:
	ldr r0, =0xff00ffff
	ldr r1, [sp, 0x14]
	ands r1, r0
	movs r0, 0xF0
	lsls r0, 12
_08018BC6:
	orrs r1, r0
	str r1, [sp, 0x14]
	add r0, sp, 0x14
	movs r1, 0xA
	movs r2, 0xE
	movs r3, 0
	bl CreateYesNoMenu
_08018BD6:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _08018C3E
	.pool
_08018BE4:
	bl sub_8198C58
	lsls r0, 24
	asrs r6, r0, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x2
	bhi _08018C3E
	movs r0, 0
	strb r0, [r5]
	ldrb r0, [r4]
	bl rbox_fill_rectangle
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r4]
	bl RemoveWindow
	adds r0, r6, 0
	b _08018C42
_08018C1A:
	movs r0, 0
	strb r0, [r5]
	ldrb r0, [r4]
	bl rbox_fill_rectangle
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, 0x1
	negs r0, r0
	b _08018C42
_08018C3E:
	movs r0, 0x2
	negs r0, r0
_08018C42:
	add sp, 0x1C
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8018B08

	thumb_func_start sub_8018C4C
sub_8018C4C: @ 8018C4C
	push {r4-r6,lr}
	sub sp, 0x14
	adds r6, r0, 0
	adds r5, r1, 0
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _08018CE8
	cmp r0, 0x1
	bgt _08018C64
	cmp r0, 0
	beq _08018C6C
	b _08018D8C
_08018C64:
	cmp r0, 0xFF
	bne _08018C6A
	b _08018D68
_08018C6A:
	b _08018D8C
_08018C6C:
	cmp r2, 0
	bne _08018C84
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_085EF2FC
	bl StringExpandPlaceholders
	b _08018C8C
	.pool
_08018C84:
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_085EF330
	bl StringExpandPlaceholders
_08018C8C:
	ldr r0, =gUnknown_082F05D8
	bl AddWindow
	strh r0, [r5]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r5]
	movs r2, 0
	str r2, [sp]
	str r2, [sp, 0x4]
	ldr r1, =gUnknown_082F0728
	str r1, [sp, 0x8]
	str r2, [sp, 0xC]
	ldr r1, =gStringVar4
	str r1, [sp, 0x10]
	movs r1, 0x1
	movs r3, 0x1
	bl AddTextPrinterParametrized2
	ldrb r0, [r5]
	movs r1, 0x1
	movs r2, 0xF
	bl sub_8098858
	ldrb r0, [r5]
	movs r1, 0x2
	bl CopyWindowToVram
	ldrb r0, [r5]
	bl PutWindowTilemap
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _08018D8C
	.pool
_08018CE8:
	cmp r3, 0
	beq _08018D10
	cmp r2, 0
	bne _08018D00
	ldr r0, =gUnknown_082F05F8
	ldr r1, =gUnknown_082F06C8
	b _08018D28
	.pool
_08018D00:
	ldr r0, =gUnknown_082F0600
	ldr r1, =gUnknown_082F06F8
	b _08018D28
	.pool
_08018D10:
	cmp r2, 0
	bne _08018D24
	ldr r0, =gUnknown_082F05F0
	ldr r1, =gUnknown_082F06B0
	b _08018D28
	.pool
_08018D24:
	ldr r0, =gUnknown_082F05F8
	ldr r1, =gUnknown_082F06E0
_08018D28:
	movs r2, 0xE0
	str r2, [sp]
	movs r2, 0x1
	movs r3, 0xA
	bl DoMysteryGiftListMenu
	adds r4, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08018D8C
	movs r0, 0
	strb r0, [r6]
	ldrb r0, [r5]
	bl rbox_fill_rectangle
	ldrb r0, [r5]
	bl ClearWindowTilemap
	ldrb r0, [r5]
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r5]
	bl RemoveWindow
	adds r0, r4, 0
	b _08018D90
	.pool
_08018D68:
	movs r0, 0
	strb r0, [r6]
	ldrb r0, [r5]
	bl rbox_fill_rectangle
	ldrb r0, [r5]
	bl ClearWindowTilemap
	ldrb r0, [r5]
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r5]
	bl RemoveWindow
	movs r0, 0x2
	negs r0, r0
	b _08018D90
_08018D8C:
	movs r0, 0x1
	negs r0, r0
_08018D90:
	add sp, 0x14
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8018C4C

	thumb_func_start sub_8018D98
sub_8018D98: @ 8018D98
	push {lr}
	cmp r0, 0
	beq _08018DA4
	bl sub_801B0CC
	b _08018DA8
_08018DA4:
	bl sub_801B27C
_08018DA8:
	pop {r1}
	bx r1
	thumb_func_end sub_8018D98

	thumb_func_start sub_8018DAC
sub_8018DAC: @ 8018DAC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrb r0, [r5]
	cmp r0, 0
	beq _08018DBC
	cmp r0, 0x1
	beq _08018DE4
	b _08018E00
_08018DBC:
	cmp r1, 0
	bne _08018DD4
	bl sav1_get_mevent_buffer_1
	adds r4, r0, 0
	bl sav1_get_mevent_buffer_2
	adds r1, r0, 0
	adds r0, r4, 0
	bl sub_801BAAC
	b _08018DDC
_08018DD4:
	bl sub_801B00C
	bl sub_801C6C8
_08018DDC:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _08018E00
_08018DE4:
	cmp r1, 0
	bne _08018DF2
	bl sub_801BB74
_08018DEC:
	cmp r0, 0
	bne _08018DF8
	b _08018E00
_08018DF2:
	bl sub_801C758
	b _08018DEC
_08018DF8:
	movs r0, 0
	strb r0, [r5]
	movs r0, 0x1
	b _08018E02
_08018E00:
	movs r0, 0
_08018E02:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8018DAC

	thumb_func_start sub_8018E08
sub_8018E08: @ 8018E08
	push {lr}
	cmp r0, 0
	bne _08018E14
	bl sub_801B1E8
	b _08018E18
_08018E14:
	bl sub_801B06C
_08018E18:
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8018E08

	thumb_func_start sub_8018E20
sub_8018E20: @ 8018E20
	push {lr}
	cmp r0, 0
	bne _08018E36
	adds r0, r1, 0
	bl sub_801BDA4
	cmp r0, 0
	beq _08018E40
	bl sub_801BB48
	b _08018E48
_08018E36:
	adds r0, r1, 0
	bl sub_801CA50
	cmp r0, 0
	bne _08018E44
_08018E40:
	movs r0, 0
	b _08018E4A
_08018E44:
	bl sub_801C72C
_08018E48:
	movs r0, 0x1
_08018E4A:
	pop {r1}
	bx r1
	thumb_func_end sub_8018E20

	thumb_func_start sub_8018E50
sub_8018E50: @ 8018E50
	push {lr}
	cmp r2, 0
	beq _08018E60
	ldr r3, =gUnknown_085EF55C
	b _08018E62
	.pool
_08018E60:
	ldr r3, =gUnknown_085EF520
_08018E62:
	movs r2, 0x1
	bl sub_8018B08
	lsls r0, 24
	asrs r0, 24
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8018E50

	thumb_func_start mevent_message_was_thrown_away
mevent_message_was_thrown_away: @ 8018E74
	push {lr}
	cmp r1, 0
	beq _08018E84
	ldr r1, =gUnknown_085EF630
	b _08018E86
	.pool
_08018E84:
	ldr r1, =gUnknown_085EF60C
_08018E86:
	bl mevent_0814257C
	pop {r1}
	bx r1
	.pool
	thumb_func_end mevent_message_was_thrown_away

	thumb_func_start mevent_save_game
mevent_save_game: @ 8018E94
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x4
	bhi _08018F04
	lsls r0, 2
	ldr r1, =_08018EAC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08018EAC:
	.4byte _08018EC0
	.4byte _08018ECC
	.4byte _08018ED4
	.4byte _08018EE0
	.4byte _08018EF8
_08018EC0:
	ldr r0, =gUnknown_085EF5BC
	bl sub_8018884
	b _08018EEC
	.pool
_08018ECC:
	movs r0, 0
	bl save_game_when_memory_present
	b _08018EEC
_08018ED4:
	ldr r0, =gUnknown_085EF5E0
	bl sub_8018884
	b _08018EEC
	.pool
_08018EE0:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08018F04
_08018EEC:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08018F04
	.pool
_08018EF8:
	movs r0, 0
	strb r0, [r4]
	bl sub_80188DC
	movs r0, 0x1
	b _08018F06
_08018F04:
	movs r0, 0
_08018F06:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end mevent_save_game

	thumb_func_start mevent_message
mevent_message: @ 8018F0C
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r2, 0
	str r2, [r4]
	cmp r3, 0xE
	bls _08018F22
	b _08019034
_08018F22:
	lsls r0, r3, 2
	ldr r1, =_08018F30
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08018F30:
	.4byte _08018F6C
	.4byte _08018F78
	.4byte _08018F84
	.4byte _08018F9C
	.4byte _08018FB4
	.4byte _08018FC0
	.4byte _08018FCC
	.4byte _08018FD8
	.4byte _08018FE4
	.4byte _08018FF0
	.4byte _08018FFC
	.4byte _08019014
	.4byte _08019020
	.4byte _0801902C
	.4byte _08019030
_08018F6C:
	movs r0, 0
	str r0, [r4]
	ldr r2, =gUnknown_085EF2E4
	b _08019034
	.pool
_08018F78:
	movs r0, 0
	str r0, [r4]
	ldr r2, =gUnknown_085EF244
	b _08019034
	.pool
_08018F84:
	movs r0, 0x1
	str r0, [r4]
	ldr r2, =gUnknown_085EF0C8
	cmp r5, 0
	bne _08019034
	ldr r2, =gUnknown_085EF124
	b _08019034
	.pool
_08018F9C:
	movs r0, 0x1
	str r0, [r4]
	ldr r2, =gUnknown_085EF0F4
	cmp r5, 0
	bne _08019034
	ldr r2, =gUnknown_085EF14C
	b _08019034
	.pool
_08018FB4:
	movs r0, 0x1
	str r0, [r4]
	ldr r2, =gUnknown_085EF178
	b _08019034
	.pool
_08018FC0:
	movs r0, 0
	str r0, [r4]
	ldr r2, =gUnknown_085EF1B4
	b _08019034
	.pool
_08018FCC:
	movs r0, 0
	str r0, [r4]
	ldr r2, =gUnknown_085EF200
	b _08019034
	.pool
_08018FD8:
	movs r0, 0
	str r0, [r4]
	ldr r2, =gUnknown_085EF1D8
	b _08019034
	.pool
_08018FE4:
	movs r0, 0
	str r0, [r4]
	ldr r2, =gUnknown_085EF21C
	b _08019034
	.pool
_08018FF0:
	movs r0, 0
	str r0, [r4]
	ldr r2, =gUnknown_085EF02C
	b _08019034
	.pool
_08018FFC:
	movs r0, 0
	str r0, [r4]
	ldr r2, =gUnknown_085EF2B4
	cmp r6, 0
	bne _08019034
	ldr r2, =gUnknown_085EF280
	b _08019034
	.pool
_08019014:
	movs r0, 0
	str r0, [r4]
	ldr r2, =gUnknown_085EF014
	b _08019034
	.pool
_08019020:
	movs r0, 0x1
	str r0, [r4]
	ldr r2, =gUnknown_085EF198
	b _08019034
	.pool
_0801902C:
	movs r0, 0x1
	b _08019032
_08019030:
	movs r0, 0
_08019032:
	str r0, [r4]
_08019034:
	adds r0, r2, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end mevent_message

	thumb_func_start mevent_08142CE8
mevent_08142CE8: @ 801903C
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r0, r1, 0
	adds r5, r2, 0
	ldrb r4, [r6]
	cmp r4, 0x1
	beq _0801906E
	cmp r4, 0x1
	bgt _08019054
	cmp r4, 0
	beq _0801905A
	b _0801909A
_08019054:
	cmp r4, 0x2
	beq _08019084
	b _0801909A
_0801905A:
	cmp r0, 0
	beq _08019062
	bl sub_8018884
_08019062:
	movs r0, 0xB9
	lsls r0, 1
	bl fanfare_play
	strh r4, [r5]
	b _0801907C
_0801906E:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xF0
	bls _0801909A
_0801907C:
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _0801909A
_08019084:
	bl task_is_not_running_overworld_fanfare
	lsls r0, 24
	cmp r0, 0
	beq _0801909A
	movs r0, 0
	strb r0, [r6]
	bl sub_80188DC
	movs r0, 0x1
	b _0801909C
_0801909A:
	movs r0, 0
_0801909C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end mevent_08142CE8

	thumb_func_start mevent_message_stamp_card_etc_send_status
mevent_message_stamp_card_etc_send_status: @ 80190A4
	push {r4,lr}
	adds r3, r0, 0
	ldr r1, =gUnknown_085EF014
	movs r0, 0
	str r0, [r3]
	adds r4, r1, 0
	cmp r2, 0xE
	bhi _08019166
	lsls r0, r2, 2
	ldr r1, =_080190C8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_080190C8:
	.4byte _08019104
	.4byte _0801910C
	.4byte _08019114
	.4byte _0801911C
	.4byte _08019128
	.4byte _08019130
	.4byte _08019138
	.4byte _08019140
	.4byte _08019148
	.4byte _08019150
	.4byte _08019164
	.4byte _08019158
	.4byte _0801915C
	.4byte _0801915C
	.4byte _08019164
_08019104:
	ldr r1, =gUnknown_085EF2E4
	b _08019166
	.pool
_0801910C:
	ldr r1, =gUnknown_085EF244
	b _08019166
	.pool
_08019114:
	ldr r1, =gUnknown_085EF39C
	b _0801911E
	.pool
_0801911C:
	ldr r1, =gUnknown_085EF3C4
_0801911E:
	movs r0, 0x1
	str r0, [r3]
	b _08019166
	.pool
_08019128:
	ldr r1, =gUnknown_085EF3F0
	b _08019166
	.pool
_08019130:
	ldr r1, =gUnknown_085EF42C
	b _08019166
	.pool
_08019138:
	ldr r1, =gUnknown_085EF494
	b _08019166
	.pool
_08019140:
	ldr r1, =gUnknown_085EF460
	b _08019166
	.pool
_08019148:
	ldr r1, =gUnknown_085EF21C
	b _08019166
	.pool
_08019150:
	ldr r1, =gUnknown_085EF4C4
	b _08019166
	.pool
_08019158:
	adds r1, r4, 0
	b _08019166
_0801915C:
	ldr r1, =gUnknown_085EF410
	b _08019166
	.pool
_08019164:
	ldr r1, =gUnknown_085EF4F0
_08019166:
	adds r0, r1, 0
	pop {r4}
	pop {r1}
	bx r1
	.pool
	thumb_func_end mevent_message_stamp_card_etc_send_status

	thumb_func_start sub_8019174
sub_8019174: @ 8019174
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	adds r1, r2, 0
	adds r2, r3, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, sp
	bl mevent_message_stamp_card_etc_send_status
	adds r1, r0, 0
	ldr r0, [sp]
	cmp r0, 0
	bne _0801919A
	adds r0, r4, 0
	bl mevent_0814257C
	b _080191A2
_0801919A:
	adds r0, r4, 0
	adds r2, r5, 0
	bl mevent_08142CE8
_080191A2:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8019174

	thumb_func_start task_add_00_mystery_gift
task_add_00_mystery_gift: @ 80191AC
	push {r4,lr}
	ldr r0, =task00_mystery_gift
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, =gTasks + 0x8
	adds r4, r0
	movs r0, 0
	strb r0, [r4, 0x8]
	strb r0, [r4, 0x9]
	strb r0, [r4, 0xA]
	strb r0, [r4, 0xB]
	strb r0, [r4, 0xC]
	strb r0, [r4, 0xD]
	movs r1, 0
	strh r0, [r4]
	strh r0, [r4, 0x2]
	strh r0, [r4, 0x4]
	strh r0, [r4, 0x6]
	strb r1, [r4, 0xE]
	movs r0, 0x40
	bl AllocZeroed
	str r0, [r4, 0x10]
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end task_add_00_mystery_gift

	thumb_func_start task00_mystery_gift
task00_mystery_gift: @ 80191F4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, =gTasks + 0x8
	adds r5, r0, r1
	ldrb r0, [r5, 0x8]
	cmp r0, 0x25
	bls _0801920E
	b _08019922
_0801920E:
	lsls r0, 2
	ldr r1, =_08019220
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08019220:
	.4byte _080192B8
	.4byte _080192BE
	.4byte _08019300
	.4byte _08019338
	.4byte _0801935C
	.4byte _080193AC
	.4byte _0801940C
	.4byte _08019444
	.4byte _08019454
	.4byte _080194CC
	.4byte _080194F0
	.4byte _08019508
	.4byte _08019538
	.4byte _08019574
	.4byte _0801958C
	.4byte _080195BC
	.4byte _080198EC
	.4byte _0801961A
	.4byte _0801962A
	.4byte _08019922
	.4byte _0801963C
	.4byte _08019688
	.4byte _080196FE
	.4byte _0801972E
	.4byte _08019764
	.4byte _0801977E
	.4byte _08019792
	.4byte _0801979E
	.4byte _080197B2
	.4byte _080197C6
	.4byte _080197F8
	.4byte _0801982C
	.4byte _08019870
	.4byte _08019884
	.4byte _080198A0
	.4byte _080198B8
	.4byte _080198EC
	.4byte _0801990C
_080192B8:
	movs r0, 0x1
	strb r0, [r5, 0x8]
	b _08019922
_080192BE:
	adds r0, r5, 0
	adds r0, 0x9
	adds r1, r5, 0
	movs r2, 0
	bl sub_8018A50
	adds r1, r0, 0
	cmp r1, 0x1
	beq _080192E8
	cmp r1, 0x1
	bcc _080192DE
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _080192FA
	b _08019922
_080192DE:
	movs r0, 0
	strb r0, [r5, 0xC]
	bl sub_801B27C
	b _080192EE
_080192E8:
	strb r1, [r5, 0xC]
	bl sub_801B0CC
_080192EE:
	cmp r0, 0x1
	bne _080192F4
	b _08019820
_080192F4:
	movs r0, 0x2
	strb r0, [r5, 0x8]
	b _08019922
_080192FA:
	movs r0, 0x25
	strb r0, [r5, 0x8]
	b _08019922
_08019300:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _08019314
	adds r0, r5, 0
	adds r0, 0x9
	ldr r1, =gUnknown_085EEEF0
	b _0801931A
	.pool
_08019314:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r1, =gUnknown_085EEF2C
_0801931A:
	bl mevent_0814257C
	cmp r0, 0
	bne _08019324
	b _08019922
_08019324:
	movs r0, 0x3
	strb r0, [r5, 0x8]
	movs r0, 0
	movs r1, 0x1
	bl sub_80186EC
	b _08019922
	.pool
_08019338:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _0801934C
	ldr r0, =gUnknown_085EEF68
	bl sub_8018884
	b _08019352
	.pool
_0801934C:
	ldr r0, =gUnknown_085EEF94
	bl sub_8018884
_08019352:
	movs r0, 0x4
	strb r0, [r5, 0x8]
	b _08019922
	.pool
_0801935C:
	adds r0, r5, 0
	adds r0, 0x9
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_8018A50
	adds r4, r0, 0
	cmp r4, 0x1
	beq _0801938A
	cmp r4, 0x1
	bcc _0801937C
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _08019396
	b _08019922
_0801937C:
	bl sub_80188DC
	movs r1, 0
	movs r0, 0x5
	strb r0, [r5, 0x8]
	strb r1, [r5, 0xD]
	b _08019922
_0801938A:
	bl sub_80188DC
	movs r0, 0x5
	strb r0, [r5, 0x8]
	strb r4, [r5, 0xD]
	b _08019922
_08019396:
	bl sub_80188DC
	ldrb r0, [r5, 0xC]
	bl sub_8018D98
	cmp r0, 0
	beq _080193A6
	b _08019820
_080193A6:
	strb r0, [r5, 0x8]
	movs r0, 0
	b _080198FE
_080193AC:
	ldr r0, =gStringVar1
	movs r1, 0xFF
	strb r1, [r0]
	ldr r0, =gStringVar2
	strb r1, [r0]
	ldr r0, =gStringVar3
	strb r1, [r0]
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	beq _080193D4
	cmp r0, 0x1
	beq _080193EE
	b _08019406
	.pool
_080193D4:
	ldrb r0, [r5, 0xD]
	cmp r0, 0x1
	bne _080193E2
	movs r0, 0x15
	bl sub_8014EFC
	b _08019406
_080193E2:
	cmp r0, 0
	bne _08019406
	movs r0, 0x15
	bl sub_80152A8
	b _08019406
_080193EE:
	ldrb r0, [r5, 0xD]
	cmp r0, 0x1
	bne _080193FC
	movs r0, 0x16
	bl sub_8014EFC
	b _08019406
_080193FC:
	cmp r0, 0
	bne _08019406
	movs r0, 0x16
	bl sub_80152A8
_08019406:
	movs r0, 0x6
	strb r0, [r5, 0x8]
	b _08019922
_0801940C:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	beq _0801942C
	movs r0, 0x1
	bl sub_8018838
	movs r0, 0x7
	strb r0, [r5, 0x8]
	ldrb r0, [r5, 0xC]
	bl sub_801D484
	b _08019922
	.pool
_0801942C:
	ldr r0, =gUnknown_020375F0
	ldrh r0, [r0]
	cmp r0, 0x5
	beq _08019436
	b _08019922
_08019436:
	movs r0, 0x1
	bl sub_8018838
	b _080197C0
	.pool
_08019444:
	ldr r0, =gUnknown_085EEFE8
	bl sub_8018884
	movs r0, 0x8
	strb r0, [r5, 0x8]
	b _08019922
	.pool
_08019454:
	adds r0, r5, 0
	bl sub_801D4A8
	subs r0, 0x2
	cmp r0, 0x4
	bls _08019462
	b _08019922
_08019462:
	lsls r0, 2
	ldr r1, =_08019470
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08019470:
	.4byte _080194AE
	.4byte _080194A8
	.4byte _080194B4
	.4byte _08019492
	.4byte _08019484
_08019484:
	bl task_add_05_task_del_08FA224_when_no_RfuFunc
	ldrh r0, [r5]
	strb r0, [r5, 0xE]
	movs r0, 0xD
	strb r0, [r5, 0x8]
	b _08019922
_08019492:
	ldr r4, [r5, 0x10]
	bl sub_801D4F4
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x40
	bl memcpy
	bl sub_801D4E4
	b _08019922
_080194A8:
	movs r0, 0xA
	strb r0, [r5, 0x8]
	b _08019922
_080194AE:
	movs r0, 0x9
	strb r0, [r5, 0x8]
	b _08019922
_080194B4:
	movs r0, 0xB
	strb r0, [r5, 0x8]
	ldr r0, =gStringVar1
	ldr r1, =gUnknown_020229F0
	bl StringCopy
	b _08019922
	.pool
_080194CC:
	adds r4, r5, 0
	adds r4, 0x9
	bl sub_801D4F4
	adds r3, r0, 0
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl sub_8018B08
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0x1
	beq _08019564
	cmp r1, 0x1
	bcs _08019552
	movs r0, 0
	b _08019566
_080194F0:
	adds r4, r5, 0
	adds r4, 0x9
	bl sub_801D4F4
	adds r1, r0, 0
	adds r0, r4, 0
	bl mevent_0814257C
	cmp r0, 0
	bne _08019506
	b _08019922
_08019506:
	b _0801956A
_08019508:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r3, =gUnknown_085EF050
	adds r1, r5, 0
	movs r2, 0
	bl sub_8018B08
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0x1
	beq _08019564
	cmp r1, 0x1
	bcs _08019552
	bl sub_801B3F8
	cmp r0, 0x1
	bne _08019534
	movs r0, 0xC
	strb r0, [r5, 0x8]
	b _08019922
	.pool
_08019534:
	movs r0, 0
	b _08019566
_08019538:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r3, =gUnknown_085EF084
	adds r1, r5, 0
	movs r2, 0
	bl sub_8018B08
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0x1
	beq _08019564
	cmp r1, 0x1
	bcc _08019560
_08019552:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08019564
	b _08019922
	.pool
_08019560:
	movs r0, 0
	b _08019566
_08019564:
	movs r0, 0x1
_08019566:
	bl sub_801D500
_0801956A:
	bl sub_801D4E4
	movs r0, 0x7
	strb r0, [r5, 0x8]
	b _08019922
_08019574:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	beq _0801957E
	b _08019922
_0801957E:
	bl sub_800E084
	movs r0, 0xE
	strb r0, [r5, 0x8]
	b _08019922
	.pool
_0801958C:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r1, =gUnknown_085EEFF8
	bl sub_8018A1C
	cmp r0, 0
	bne _0801959C
	b _08019922
_0801959C:
	ldrb r0, [r5, 0xD]
	cmp r0, 0x1
	bne _080195AA
	ldr r0, =gStringVar1
	ldr r1, =gUnknown_020229F0
	bl StringCopy
_080195AA:
	movs r0, 0xF
	strb r0, [r5, 0x8]
	b _08019922
	.pool
_080195BC:
	ldrb r1, [r5, 0xC]
	ldrb r2, [r5, 0xD]
	ldrb r3, [r5, 0xE]
	mov r0, sp
	bl mevent_message
	adds r1, r0, 0
	cmp r1, 0
	bne _080195D0
	ldr r1, [r5, 0x10]
_080195D0:
	ldr r0, [sp]
	cmp r0, 0
	beq _080195E2
	adds r0, r5, 0
	adds r0, 0x9
	adds r2, r5, 0
	bl mevent_08142CE8
	b _080195EA
_080195E2:
	adds r0, r5, 0
	adds r0, 0x9
	bl mevent_0814257C
_080195EA:
	adds r1, r0, 0
	cmp r1, 0
	bne _080195F2
	b _08019922
_080195F2:
	ldrb r0, [r5, 0xE]
	cmp r0, 0x3
	bne _0801960C
	ldrb r0, [r5, 0xD]
	cmp r0, 0x1
	bne _08019606
	movs r0, 0x1
	bl sub_801DB68
	b _0801960C
_08019606:
	movs r0, 0x2
	bl sub_801DB68
_0801960C:
	ldr r0, [sp]
	cmp r0, 0
	beq _08019614
	b _080198DC
_08019614:
	strb r0, [r5, 0x8]
	movs r0, 0
	b _080198FE
_0801961A:
	adds r0, r5, 0
	adds r0, 0x9
	bl mevent_save_game
	cmp r0, 0
	bne _08019628
	b _08019922
_08019628:
	b _08019820
_0801962A:
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r1, [r5, 0xC]
	bl sub_8018DAC
	cmp r0, 0
	bne _0801963A
	b _08019922
_0801963A:
	b _080196F8
_0801963C:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _08019664
	ldr r2, =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08019652
	movs r0, 0x15
	strb r0, [r5, 0x8]
_08019652:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0801965E
	b _08019922
_0801965E:
	b _08019682
	.pool
_08019664:
	ldr r0, =gMain
	ldrh r0, [r0, 0x2E]
	bl sub_801CCD0
	cmp r0, 0
	beq _0801967C
	cmp r0, 0x1
	beq _08019682
	b _08019922
	.pool
_0801967C:
	bl sub_801CC38
	b _0801975E
_08019682:
	movs r0, 0x1B
	strb r0, [r5, 0x8]
	b _08019922
_08019688:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _080196A2
	bl sub_801B308
	cmp r0, 0
	beq _080196B6
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r2, [r5, 0xC]
	adds r1, r5, 0
	movs r3, 0
	b _080196C0
_080196A2:
	bl sub_801B128
	cmp r0, 0
	beq _080196B6
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r2, [r5, 0xC]
	adds r1, r5, 0
	movs r3, 0
	b _080196C0
_080196B6:
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r2, [r5, 0xC]
	adds r1, r5, 0
	movs r3, 0x1
_080196C0:
	bl sub_8018C4C
	adds r1, r0, 0
	cmp r1, 0x1
	beq _080196E2
	cmp r1, 0x1
	bcc _080196DC
	cmp r1, 0x2
	beq _080196E8
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _080196EE
	b _08019922
_080196DC:
	movs r0, 0x1C
	strb r0, [r5, 0x8]
	b _08019922
_080196E2:
	movs r0, 0x1D
	strb r0, [r5, 0x8]
	b _08019922
_080196E8:
	movs r0, 0x16
	strb r0, [r5, 0x8]
	b _08019922
_080196EE:
	ldrb r0, [r5, 0xC]
	cmp r0, 0x1
	bne _080196F8
	bl sub_801CC80
_080196F8:
	movs r0, 0x14
	strb r0, [r5, 0x8]
	b _08019922
_080196FE:
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r2, [r5, 0xC]
	adds r1, r5, 0
	bl sub_8018E50
	adds r1, r0, 0
	cmp r1, 0
	beq _0801971A
	cmp r1, 0
	ble _08019748
	cmp r1, 0x1
	beq _0801975E
	b _08019922
_0801971A:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _08019758
	bl sub_801B3F8
	cmp r0, 0x1
	bne _08019758
	movs r0, 0x17
	strb r0, [r5, 0x8]
	b _08019922
_0801972E:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r3, =gUnknown_085EF584
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_8018B08
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0x1
	beq _0801975E
	cmp r1, 0x1
	bcc _08019758
_08019748:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0801975E
	b _08019922
	.pool
_08019758:
	movs r0, 0x18
	strb r0, [r5, 0x8]
	b _08019922
_0801975E:
	movs r0, 0x15
	strb r0, [r5, 0x8]
	b _08019922
_08019764:
	ldrb r0, [r5, 0xC]
	movs r1, 0x1
	bl sub_8018E20
	cmp r0, 0
	bne _08019772
	b _08019922
_08019772:
	ldrb r0, [r5, 0xC]
	bl sub_8018E08
	movs r0, 0x19
	strb r0, [r5, 0x8]
	b _08019922
_0801977E:
	adds r0, r5, 0
	adds r0, 0x9
	bl mevent_save_game
	cmp r0, 0
	bne _0801978C
	b _08019922
_0801978C:
	movs r0, 0x1A
	strb r0, [r5, 0x8]
	b _08019922
_08019792:
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r1, [r5, 0xC]
	bl mevent_message_was_thrown_away
	b _080198F6
_0801979E:
	ldrb r0, [r5, 0xC]
	movs r1, 0
	bl sub_8018E20
	cmp r0, 0
	bne _080197AC
	b _08019922
_080197AC:
	movs r0, 0
	strb r0, [r5, 0x8]
	b _08019922
_080197B2:
	ldrb r0, [r5, 0xC]
	movs r1, 0x1
	bl sub_8018E20
	cmp r0, 0
	bne _080197C0
	b _08019922
_080197C0:
	movs r0, 0x3
	strb r0, [r5, 0x8]
	b _08019922
_080197C6:
	ldrb r0, [r5, 0xC]
	movs r1, 0x1
	bl sub_8018E20
	cmp r0, 0
	bne _080197D4
	b _08019922
_080197D4:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	beq _080197E0
	cmp r0, 0x1
	beq _080197E8
	b _080197EE
_080197E0:
	movs r0, 0x15
	bl sub_8014A00
	b _080197EE
_080197E8:
	movs r0, 0x16
	bl sub_8014A00
_080197EE:
	movs r0, 0x1
	strb r0, [r5, 0xD]
	movs r0, 0x1E
	strb r0, [r5, 0x8]
	b _08019922
_080197F8:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	beq _08019810
	movs r0, 0x1
	bl sub_8018838
	movs r0, 0x1F
	strb r0, [r5, 0x8]
	b _08019922
	.pool
_08019810:
	ldr r0, =gUnknown_020375F0
	ldrh r0, [r0]
	cmp r0, 0x5
	beq _0801981A
	b _08019922
_0801981A:
	movs r0, 0x1
	bl sub_8018838
_08019820:
	movs r0, 0x12
	strb r0, [r5, 0x8]
	b _08019922
	.pool
_0801982C:
	ldr r0, =gStringVar1
	movs r1, 0xFF
	strb r1, [r0]
	ldr r0, =gStringVar2
	strb r1, [r0]
	ldr r0, =gStringVar3
	strb r1, [r0]
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _0801985C
	ldr r0, =gUnknown_085EF360
	bl sub_8018884
	bl mevent_srv_new_wcard
	b _08019866
	.pool
_0801985C:
	ldr r0, =gUnknown_085EF37C
	bl sub_8018884
	bl mevent_srv_init_wnews
_08019866:
	movs r0, 0x20
	strb r0, [r5, 0x8]
	b _08019922
	.pool
_08019870:
	adds r0, r5, 0
	bl sub_801D0C4
	cmp r0, 0x3
	bne _08019922
	ldrh r0, [r5]
	strb r0, [r5, 0xE]
	movs r0, 0x21
	strb r0, [r5, 0x8]
	b _08019922
_08019884:
	bl task_add_05_task_del_08FA224_when_no_RfuFunc
	ldr r0, =gStringVar1
	ldr r1, =gUnknown_02022A0C
	bl StringCopy
	movs r0, 0x22
	strb r0, [r5, 0x8]
	b _08019922
	.pool
_080198A0:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _08019922
	bl sub_800E084
	movs r0, 0x23
	strb r0, [r5, 0x8]
	b _08019922
	.pool
_080198B8:
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r2, [r5, 0xD]
	ldrb r3, [r5, 0xE]
	adds r1, r5, 0
	bl sub_8019174
	cmp r0, 0
	beq _08019922
	ldr r0, [r5, 0xC]
	ldr r1, =0x00ffff00
	ands r0, r1
	ldr r1, =0x00030100
	cmp r0, r1
	bne _080198FA
	movs r0, 0x3
	bl sub_801DB68
_080198DC:
	movs r0, 0x11
	strb r0, [r5, 0x8]
	b _08019922
	.pool
_080198EC:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r1, =gUnknown_085EF014
	bl mevent_0814257C
_080198F6:
	cmp r0, 0
	beq _08019922
_080198FA:
	movs r0, 0
	strb r0, [r5, 0x8]
_080198FE:
	movs r1, 0
	bl sub_80186EC
	b _08019922
	.pool
_0801990C:
	bl sub_80097E8
	ldr r0, [r5, 0x10]
	bl Free
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, =sub_80186A4
	bl SetMainCallback2
_08019922:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end task00_mystery_gift

	thumb_func_start sub_8019930
sub_8019930: @ 8019930
	ldr r0, =0x000001a9
	bx lr
	.pool
	thumb_func_end sub_8019930

	thumb_func_start bgid_upload_textbox_1
bgid_upload_textbox_1: @ 8019938
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, =gUnknown_082F0568
	movs r2, 0x80
	lsls r2, 1
	movs r3, 0
	str r3, [sp]
	bl copy_decompressed_tile_data_to_vram_autofree
	add sp, 0x4
	pop {r0}
	bx r0
	.pool
	thumb_func_end bgid_upload_textbox_1

	thumb_func_start is_walking_or_running
is_walking_or_running: @ 8019958
	push {lr}
	ldr r0, =gUnknown_02037590
	ldrb r0, [r0, 0x3]
	cmp r0, 0x2
	beq _08019966
	cmp r0, 0
	bne _08019970
_08019966:
	movs r0, 0x1
	b _08019972
	.pool
_08019970:
	movs r0, 0
_08019972:
	pop {r1}
	bx r1
	thumb_func_end is_walking_or_running

	thumb_func_start sub_8019978
sub_8019978: @ 8019978
	ldr r3, =gUnknown_082F072C
	movs r2, 0x7
	ands r2, r1
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 1
	adds r2, r1
	adds r2, r3
	ldrb r0, [r2]
	bx lr
	.pool
	thumb_func_end sub_8019978

	thumb_func_start sub_8019990
sub_8019990: @ 8019990
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r4, =gUnknown_082F0740
	mov r8, r4
	lsls r0, 2
	adds r4, r0, r4
	movs r6, 0
	ldrsh r5, [r4, r6]
	ldr r6, =gUnknown_082F0760
	lsls r1, 1
	adds r4, r1, r6
	ldrb r4, [r4]
	lsls r4, 24
	asrs r4, 24
	adds r5, r4
	adds r5, 0x7
	str r5, [r2]
	movs r2, 0x2
	add r8, r2
	add r0, r8
	movs r4, 0
	ldrsh r0, [r0, r4]
	adds r6, 0x1
	adds r1, r6
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	adds r0, r1
	adds r0, 0x7
	str r0, [r3]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8019990

	thumb_func_start sub_80199E0
sub_80199E0: @ 80199E0
	push {r4-r7,lr}
	mov r12, r3
	ldr r7, =gUnknown_082F0740
	lsls r5, r0, 2
	adds r0, r5, r7
	movs r4, 0
	ldrsh r3, [r0, r4]
	ldr r6, =gUnknown_082F0760
	lsls r4, r1, 1
	adds r0, r4, r6
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r3, r0
	adds r3, 0x7
	cmp r3, r2
	bne _08019A28
	adds r0, r7, 0x2
	adds r0, r5, r0
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r0, r6, 0x1
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r1, r0
	adds r1, 0x7
	cmp r1, r12
	bne _08019A28
	movs r0, 0x1
	b _08019A2A
	.pool
_08019A28:
	movs r0, 0
_08019A2A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80199E0

	thumb_func_start sub_8019A30
sub_8019A30: @ 8019A30
	push {lr}
	ldr r1, =0x000002bf
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8019A30

	thumb_func_start flag_set_x63
flag_set_x63: @ 8019A4C
	push {lr}
	ldr r1, =0x000002bf
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	bl FlagSet
	pop {r0}
	bx r0
	.pool
	thumb_func_end flag_set_x63

	thumb_func_start flag_clear_x63
flag_clear_x63: @ 8019A64
	push {lr}
	ldr r1, =0x000002bf
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	bl FlagReset
	pop {r0}
	bx r0
	.pool
	thumb_func_end flag_clear_x63

	thumb_func_start sub_8019A7C
sub_8019A7C: @ 8019A7C
	push {lr}
	ldr r2, =0x00004010
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	bl VarSet
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8019A7C

	thumb_func_start sub_8019A98
sub_8019A98: @ 8019A98
	push {lr}
	ldr r1, =gUnknown_082F0774
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, =gSaveBlock1Ptr
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl show_sprite
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8019A98

	thumb_func_start sub_8019AB8
sub_8019AB8: @ 8019AB8
	push {lr}
	ldr r1, =gUnknown_082F0774
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, =gSaveBlock1Ptr
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl RemoveFieldObjectByLocalIdAndMap
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8019AB8

	thumb_func_start sub_8019AD8
sub_8019AD8: @ 8019AD8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r1, 0
	ldr r1, =gUnknown_082F0774
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, =gSaveBlock1Ptr
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08019B30
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, =gUnknown_02037350
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	bne _08019B30
	ldrb r1, [r5]
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	lsls r0, 24
	cmp r0, 0
	bne _08019B30
	movs r0, 0x1
	b _08019B32
	.pool
_08019B30:
	movs r0, 0
_08019B32:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8019AD8

	thumb_func_start sub_8019B3C
sub_8019B3C: @ 8019B3C
	push {r4,lr}
	sub sp, 0x4
	ldr r1, =gUnknown_082F0774
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, =gSaveBlock1Ptr
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08019B9C
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, =gUnknown_02037350
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	bne _08019B84
	movs r0, 0
	b _08019B9E
	.pool
_08019B84:
	bl script_env_2_is_enabled
	lsls r0, 24
	cmp r0, 0
	bne _08019B96
	adds r0, r4, 0
	bl npc_sync_anim_pause_bits
	b _08019B9C
_08019B96:
	adds r0, r4, 0
	bl sub_8097404
_08019B9C:
	movs r0, 0x1
_08019B9E:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8019B3C

	thumb_func_start sub_8019BA8
sub_8019BA8: @ 8019BA8
	push {lr}
	ldr r2, =gUnknown_02022C68
	movs r1, 0
	str r1, [r2]
	ldr r1, =gUnknown_02022C64
	str r0, [r1]
	movs r1, 0
	movs r2, 0x7
_08019BB8:
	strb r1, [r0]
	strb r1, [r0, 0x1]
	strb r1, [r0, 0x2]
	strb r1, [r0, 0x3]
	adds r0, 0x4
	subs r2, 0x1
	cmp r2, 0
	bge _08019BB8
	bl sub_8019DF4
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8019BA8

	thumb_func_start sub_8019BDC
sub_8019BDC: @ 8019BDC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r0, 0
	beq _08019BF0
	cmp r0, 0x1
	beq _08019C10
	b _08019C2E
_08019BF0:
	ldr r1, =gUnknown_082F078C
	adds r0, r4, 0
	bl sub_8019AD8
	cmp r0, 0x1
	bne _08019C2E
	adds r0, r4, 0
	bl flag_set_x63
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _08019C2E
	.pool
_08019C10:
	adds r0, r4, 0
	bl sub_8019B3C
	cmp r0, 0
	beq _08019C2E
	adds r0, r4, 0
	bl sub_8019AB8
	adds r0, r4, 0
	bl flag_set_x63
	movs r0, 0
	strb r0, [r5]
	movs r0, 0x1
	b _08019C30
_08019C2E:
	movs r0, 0
_08019C30:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8019BDC

	thumb_func_start sub_8019C38
sub_8019C38: @ 8019C38
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	adds r5, r1, 0
	adds r7, r2, 0
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r0, 0x2
	beq _08019CD4
	cmp r0, 0x2
	bgt _08019C54
	cmp r0, 0
	beq _08019C5A
	b _08019CE6
_08019C54:
	cmp r0, 0x3
	beq _08019CBC
	b _08019CE6
_08019C5A:
	bl is_walking_or_running
	cmp r0, 0
	beq _08019CE6
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r2, [r0, r1]
	movs r0, 0
	ldrsh r3, [r4, r0]
	adds r0, r5, 0
	movs r1, 0
	bl sub_80199E0
	cmp r0, 0x1
	beq _08019CE6
	mov r0, sp
	adds r1, r4, 0
	bl plaer_get_pos_including_state_based_drift
	mov r0, sp
	movs r1, 0
	ldrsh r2, [r0, r1]
	movs r0, 0
	ldrsh r3, [r4, r0]
	adds r0, r5, 0
	movs r1, 0
	bl sub_80199E0
	cmp r0, 0x1
	beq _08019CE6
	ldrb r1, [r7, 0x1]
	adds r0, r5, 0
	bl sub_8019A7C
	adds r0, r5, 0
	bl sub_8019A98
	adds r0, r5, 0
	bl flag_clear_x63
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
_08019CBC:
	ldr r1, =gUnknown_082F078E
	adds r0, r5, 0
	bl sub_8019AD8
	cmp r0, 0x1
	bne _08019CE6
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _08019CE6
	.pool
_08019CD4:
	adds r0, r5, 0
	bl sub_8019B3C
	cmp r0, 0
	beq _08019CE6
	movs r0, 0
	strb r0, [r6]
	movs r0, 0x1
	b _08019CE8
_08019CE6:
	movs r0, 0
_08019CE8:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8019C38

	thumb_func_start sub_8019CF0
sub_8019CF0: @ 8019CF0
	push {r4,lr}
	ldr r3, =gUnknown_02022C64
	lsls r0, 2
	ldr r4, [r3]
	adds r4, r0
	movs r0, 0x1
	strb r0, [r4, 0x3]
	adds r0, r1, 0
	adds r1, r2, 0
	bl sub_8019978
	strb r0, [r4, 0x1]
	ldrb r0, [r4]
	cmp r0, 0
	beq _08019D18
	movs r0, 0
	b _08019D1A
	.pool
_08019D18:
	movs r0, 0x1
_08019D1A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8019CF0

	thumb_func_start AGBAssert
AGBAssert: @ 8019D20
	push {lr}
	ldr r1, =gUnknown_02022C64
	lsls r0, 2
	ldr r1, [r1]
	adds r1, r0
	movs r0, 0x2
	strb r0, [r1, 0x3]
	ldrb r0, [r1]
	cmp r0, 0x1
	beq _08019D3C
	movs r0, 0
	b _08019D3E
	.pool
_08019D3C:
	movs r0, 0x1
_08019D3E:
	pop {r1}
	bx r1
	thumb_func_end AGBAssert

	thumb_func_start sub_8019D44
sub_8019D44: @ 8019D44
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r1, [r4]
	cmp r1, 0x1
	beq _08019DA6
	cmp r1, 0x1
	bgt _08019D5A
	cmp r1, 0
	beq _08019D64
	b _08019DC6
_08019D5A:
	cmp r1, 0x2
	beq _08019D70
	cmp r1, 0x3
	beq _08019DB4
	b _08019DC6
_08019D64:
	ldrb r0, [r4, 0x3]
	cmp r0, 0x1
	bne _08019DC6
	movs r0, 0x2
	strb r0, [r4]
	strb r1, [r4, 0x2]
_08019D70:
	adds r0, r5, 0
	movs r1, 0
	bl sub_8019F8C
	adds r1, r0, 0
	cmp r1, 0
	bne _08019D96
	ldrb r0, [r4, 0x3]
	cmp r0, 0x2
	bne _08019D96
	strb r1, [r4]
	strb r1, [r4, 0x2]
	adds r0, r5, 0
	bl sub_8019AB8
	adds r0, r5, 0
	bl flag_set_x63
	b _08019DC6
_08019D96:
	adds r0, r4, 0x2
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8019C38
	cmp r0, 0x1
	bne _08019DC6
	b _08019DC4
_08019DA6:
	ldrb r0, [r4, 0x3]
	cmp r0, 0x2
	bne _08019DC6
	movs r1, 0
	movs r0, 0x3
	strb r0, [r4]
	strb r1, [r4, 0x2]
_08019DB4:
	adds r0, r4, 0x2
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8019BDC
	cmp r0, 0x1
	bne _08019DC6
	movs r0, 0
_08019DC4:
	strb r0, [r4]
_08019DC6:
	movs r0, 0
	strb r0, [r4, 0x3]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8019D44

	thumb_func_start sub_8019DD0
sub_8019DD0: @ 8019DD0
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, =gUnknown_02022C64
_08019DD6:
	lsls r0, r4, 2
	ldr r1, [r5]
	adds r1, r0
	adds r0, r4, 0
	bl sub_8019D44
	adds r4, 0x1
	cmp r4, 0x7
	ble _08019DD6
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8019DD0

	thumb_func_start sub_8019DF4
sub_8019DF4: @ 8019DF4
	push {r4,lr}
	ldr r4, =sub_8019DD0
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08019E18
	adds r0, r4, 0
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	b _08019E1A
	.pool
_08019E18:
	movs r0, 0x10
_08019E1A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8019DF4

	thumb_func_start sub_8019E20
sub_8019E20: @ 8019E20
	push {lr}
	ldr r0, =sub_8019DD0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xF
	bhi _08019E34
	bl DestroyTask
_08019E34:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8019E20

	thumb_func_start sub_8019E3C
sub_8019E3C: @ 8019E3C
	push {r4,lr}
	movs r4, 0
_08019E40:
	adds r0, r4, 0
	bl sub_8019A30
	cmp r0, 0
	bne _08019E56
	adds r0, r4, 0
	bl sub_8019AB8
	adds r0, r4, 0
	bl flag_set_x63
_08019E56:
	adds r4, 0x1
	cmp r4, 0x7
	ble _08019E40
	ldr r1, =gUnknown_02022C64
	movs r0, 0
	str r0, [r1]
	bl sub_8019E20
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8019E3C

	thumb_func_start sub_8019E70
sub_8019E70: @ 8019E70
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	str r0, [sp, 0x8]
	mov r9, r1
	movs r7, 0
	mov r0, r9
	lsls r0, 2
	mov r8, r0
	ldr r0, =gUnknown_082F0740
	mov r2, r8
	adds r1, r2, r0
	ldrh r1, [r1]
	mov r2, sp
	strh r1, [r2, 0xC]
	adds r0, 0x2
	add r0, r8
	ldrh r0, [r0]
	mov r10, r0
	ldr r6, =gUnknown_082F0760
_08019E9E:
	mov r5, r8
	add r5, r9
	adds r5, r7
	adds r4, r5, 0
	subs r4, 0x38
	lsls r4, 24
	lsrs r4, 24
	movs r2, 0
	ldrsb r2, [r6, r2]
	mov r0, sp
	ldrh r0, [r0, 0xC]
	adds r2, r0, r2
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x1
	ldrsb r3, [r6, r3]
	add r3, r10
	lsls r3, 16
	asrs r3, 16
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0x41
	adds r1, r4, 0
	bl sprite_new
	ldr r1, [sp, 0x8]
	adds r5, r1, r5
	strb r0, [r5]
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8097C44
	adds r6, 0x2
	adds r7, 0x1
	cmp r7, 0x4
	ble _08019E9E
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8019E70

	thumb_func_start sub_8019F04
sub_8019F04: @ 8019F04
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r4, 0
	ldr r6, =gUnknown_02020630
_08019F0C:
	adds r0, r5, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl RemoveObjectAndFreeTiles
	adds r4, 0x1
	cmp r4, 0x27
	ble _08019F0C
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8019F04

	thumb_func_start sub_8019F2C
sub_8019F2C: @ 8019F2C
	push {r4-r7,lr}
	sub sp, 0x8
	movs r5, 0
	add r7, sp, 0x4
_08019F34:
	movs r4, 0
	adds r6, r5, 0x1
_08019F38:
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, sp
	adds r3, r7, 0
	bl sub_8019990
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	movs r2, 0
	bl sub_8088B94
	adds r4, 0x1
	cmp r4, 0x4
	ble _08019F38
	adds r5, r6, 0
	cmp r5, 0x7
	ble _08019F34
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8019F2C

	thumb_func_start sub_8019F64
sub_8019F64: @ 8019F64
	push {lr}
	adds r1, r0, 0
	cmp r1, 0
	beq _08019F78
	ldr r0, =gUnknown_082F076F
	adds r0, r1, r0
	ldrb r0, [r0]
	b _08019F88
	.pool
_08019F78:
	ldrb r1, [r2, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x45
	beq _08019F86
	movs r0, 0x4
	b _08019F88
_08019F86:
	movs r0, 0x1
_08019F88:
	pop {r1}
	bx r1
	thumb_func_end sub_8019F64

	thumb_func_start sub_8019F8C
sub_8019F8C: @ 8019F8C
	push {lr}
	adds r2, r0, 0
	lsls r0, r2, 2
	adds r0, r2
	adds r0, r1
	subs r0, 0x38
	lsls r0, 24
	lsrs r0, 24
	bl sub_8097C8C
	pop {r1}
	bx r1
	thumb_func_end sub_8019F8C

	thumb_func_start sub_8019FA4
sub_8019FA4: @ 8019FA4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	adds r5, r0, 0
	adds r6, r1, 0
	mov r9, r3
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r0, r5, 2
	adds r0, r5
	adds r7, r0, r6
	adds r0, r5, 0
	bl sub_8019F8C
	cmp r0, 0x1
	bne _08019FE2
	adds r4, r7, 0
	subs r4, 0x38
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0
	bl sub_8097C44
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8097CC4
_08019FE2:
	adds r0, r7, 0
	subs r0, 0x38
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	bl sub_8097BB4
	adds r0, r6, 0
	adds r1, r5, 0
	mov r2, r9
	bl sub_8019F64
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_801A3B0
	add r3, sp, 0x4
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, sp
	bl sub_8019990
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	movs r2, 0x1
	bl sub_8088B94
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8019FA4

	thumb_func_start sub_801A02C
sub_801A02C: @ 801A02C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r0, r4, 2
	adds r0, r4
	adds r0, r5
	subs r0, 0x38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl sub_8097CC4
	add r3, sp, 0x4
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl sub_8019990
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	movs r2, 0
	bl sub_8088B94
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_801A02C

	thumb_func_start sub_801A064
sub_801A064: @ 801A064
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r7, r0, 0
	mov r8, r1
	mov r6, sp
	adds r6, 0x2
	mov r0, sp
	adds r1, r6, 0
	bl PlayerGetDestCoords
	add r4, sp, 0x4
	mov r5, sp
	adds r5, 0x6
	adds r0, r4, 0
	adds r1, r5, 0
	bl plaer_get_pos_including_state_based_drift
	lsls r0, r7, 2
	adds r0, r7
	subs r0, 0x38
	lsls r0, 24
	lsrs r0, 24
	bl sub_8097C8C
	mov r10, r6
	mov r9, r4
	adds r6, r5, 0
	cmp r0, 0x1
	bne _0801A0F0
	mov r0, sp
	movs r1, 0
	ldrsh r2, [r0, r1]
	mov r0, r10
	movs r1, 0
	ldrsh r3, [r0, r1]
	adds r0, r7, 0
	movs r1, 0
	bl sub_80199E0
	cmp r0, 0x1
	beq _0801A15C
	movs r0, 0
	ldrsh r2, [r4, r0]
	movs r1, 0
	ldrsh r3, [r6, r1]
	adds r0, r7, 0
	movs r1, 0
	bl sub_80199E0
	cmp r0, 0x1
	beq _0801A15C
	mov r2, r8
	ldrb r0, [r2, 0xB]
	lsls r0, 31
	lsrs r0, 31
	ldrb r1, [r2, 0x2]
	bl sub_8019978
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r7, 0
	movs r1, 0
	mov r3, r8
	bl sub_8019FA4
_0801A0F0:
	movs r5, 0x1
	mov r4, r8
	adds r4, 0x4
_0801A0F6:
	ldrb r0, [r4]
	cmp r0, 0
	bne _0801A106
	adds r0, r7, 0
	adds r1, r5, 0
	bl sub_801A02C
	b _0801A154
_0801A106:
	mov r0, sp
	movs r1, 0
	ldrsh r2, [r0, r1]
	mov r0, r10
	movs r1, 0
	ldrsh r3, [r0, r1]
	adds r0, r7, 0
	adds r1, r5, 0
	bl sub_80199E0
	cmp r0, 0
	bne _0801A154
	mov r0, r9
	movs r1, 0
	ldrsh r2, [r0, r1]
	movs r0, 0
	ldrsh r3, [r6, r0]
	adds r0, r7, 0
	adds r1, r5, 0
	bl sub_80199E0
	cmp r0, 0
	bne _0801A154
	ldrb r2, [r4]
	lsrs r0, r2, 3
	movs r1, 0x1
	ands r0, r1
	movs r1, 0x7
	ands r1, r2
	bl sub_8019978
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r7, 0
	adds r1, r5, 0
	mov r3, r8
	bl sub_8019FA4
_0801A154:
	adds r4, 0x1
	adds r5, 0x1
	cmp r5, 0x4
	ble _0801A0F6
_0801A15C:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_801A064

	thumb_func_start sub_801A16C
sub_801A16C: @ 801A16C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r0, [r4, 0xA]
	lsls r0, 25
	lsrs r0, 25
	subs r0, 0x40
	cmp r0, 0x14
	bhi _0801A20E
	lsls r0, 2
	ldr r1, =_0801A18C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801A18C:
	.4byte _0801A1E0
	.4byte _0801A200
	.4byte _0801A20E
	.4byte _0801A20E
	.4byte _0801A200
	.4byte _0801A200
	.4byte _0801A20E
	.4byte _0801A20E
	.4byte _0801A200
	.4byte _0801A20E
	.4byte _0801A20E
	.4byte _0801A20E
	.4byte _0801A20E
	.4byte _0801A20E
	.4byte _0801A20E
	.4byte _0801A20E
	.4byte _0801A20E
	.4byte _0801A200
	.4byte _0801A200
	.4byte _0801A200
	.4byte _0801A1E0
_0801A1E0:
	ldrb r1, [r4, 0xB]
	lsls r1, 31
	lsrs r1, 31
	ldrb r2, [r4, 0x2]
	adds r0, r5, 0
	bl sub_8019CF0
	movs r4, 0
_0801A1F0:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_801A02C
	adds r4, 0x1
	cmp r4, 0x4
	bls _0801A1F0
	b _0801A20E
_0801A200:
	adds r0, r5, 0
	bl AGBAssert
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_801A064
_0801A20E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_801A16C

	thumb_func_start sub_801A214
sub_801A214: @ 801A214
	push {r4,r5,lr}
	adds r5, r0, 0
	bl AGBAssert
	movs r4, 0
_0801A21E:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_801A02C
	adds r4, 0x1
	cmp r4, 0x4
	ble _0801A21E
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_801A214

	thumb_func_start sub_801A234
sub_801A234: @ 801A234
	push {r4,r5,lr}
	ldr r2, =gUnknown_02022C68
	movs r1, 0
	str r1, [r2]
	movs r5, 0
	ldr r4, [r0]
_0801A240:
	ldrb r0, [r4, 0x1A]
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0x1
	bne _0801A258
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_801A16C
	b _0801A264
	.pool
_0801A258:
	cmp r1, 0x2
	bne _0801A264
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_801A214
_0801A264:
	adds r4, 0x20
	adds r5, 0x1
	cmp r5, 0x7
	ble _0801A240
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_801A234

	thumb_func_start sub_801A274
sub_801A274: @ 801A274
	ldr r1, =gUnknown_02022C68
	movs r0, 0x96
	lsls r0, 1
	str r0, [r1]
	bx lr
	.pool
	thumb_func_end sub_801A274

	thumb_func_start sub_801A284
sub_801A284: @ 801A284
	push {lr}
	adds r2, r0, 0
	ldr r0, =gUnknown_02022C68
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	movs r0, 0x96
	lsls r0, 1
	cmp r1, r0
	bls _0801A29E
	adds r0, r2, 0
	bl sub_801A234
_0801A29E:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801A284

	thumb_func_start sub_801A2A8
sub_801A2A8: @ 801A2A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	adds r5, r0, 0
	str r1, [sp, 0x4]
	str r2, [sp, 0x8]
	bl is_walking_or_running
	cmp r0, 0
	bne _0801A2F0
	b _0801A396
_0801A2C4:
	ldr r4, =gUnknown_082F076A
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r2, [r0]
	adds r0, r6, 0
	ldr r1, [sp, 0xC]
	bl sub_801A3B0
	ldr r0, [sp, 0x4]
	strh r6, [r0]
	mov r1, sp
	ldrh r2, [r1, 0xC]
	ldr r1, [sp, 0x8]
	strh r2, [r1]
	movs r0, 0x1
	b _0801A398
	.pool
_0801A2F0:
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r0, =gUnknown_082F0740
	adds r7, r5, 0
	movs r1, 0
	mov r10, r1
	adds r2, r0, 0x2
	str r2, [sp, 0x10]
	str r0, [sp, 0x14]
_0801A30E:
	movs r6, 0
	ldr r4, [sp, 0x14]
	movs r0, 0
	ldrsh r4, [r4, r0]
	mov r9, r4
	ldr r1, [sp, 0x10]
	mov r8, r1
	ldr r5, =gUnknown_082F0760
_0801A31E:
	mov r2, r10
	adds r3, r2, r6
	mov r0, sp
	movs r4, 0
	ldrsh r1, [r0, r4]
	movs r0, 0
	ldrsb r0, [r5, r0]
	add r0, r9
	adds r0, 0x7
	cmp r1, r0
	bne _0801A372
	mov r1, sp
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	mov r4, r8
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r2, 0x1
	ldrsb r2, [r5, r2]
	adds r1, r2
	adds r1, 0x7
	cmp r0, r1
	bne _0801A372
	adds r0, r3, 0
	subs r0, 0x38
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8097C8C
	cmp r0, 0
	bne _0801A372
	adds r0, r4, 0
	bl sub_8097D9C
	cmp r0, 0
	bne _0801A372
	ldrb r1, [r7, 0x1A]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	beq _0801A2C4
_0801A372:
	adds r5, 0x2
	adds r6, 0x1
	cmp r6, 0x4
	ble _0801A31E
	adds r7, 0x20
	movs r4, 0x5
	add r10, r4
	ldr r0, [sp, 0x10]
	adds r0, 0x4
	str r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	adds r1, 0x4
	str r1, [sp, 0x14]
	ldr r2, [sp, 0xC]
	adds r2, 0x1
	str r2, [sp, 0xC]
	cmp r2, 0x7
	ble _0801A30E
_0801A396:
	movs r0, 0
_0801A398:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801A2A8

	thumb_func_start sub_801A3B0
sub_801A3B0: @ 801A3B0
	push {r4,lr}
	adds r4, r0, 0
	adds r3, r1, 0
	lsls r1, r2, 24
	lsrs r1, 24
	lsls r0, r3, 2
	adds r0, r3
	subs r0, 0x38
	adds r0, r4
	lsls r0, 24
	lsrs r0, 24
	bl sub_8097B78
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_801A3B0

	thumb_func_start sub_801A3D0
sub_801A3D0: @ 801A3D0
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r3, r4, 5
	adds r3, r2
	adds r2, r3, 0
	bl sub_8019F64
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_801A3B0
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_801A3D0

	thumb_func_start sub_801A3F4
sub_801A3F4: @ 801A3F4
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0801A414
	bl RunTasks
	bl RunTextPrinters
	bl CallObjectCallbacks
	bl PrepareSpritesForOamLoad
	bl UpdatePaletteFade
_0801A414:
	pop {r0}
	bx r0
	thumb_func_end sub_801A3F4

	thumb_func_start sub_801A418
sub_801A418: @ 801A418
	push {lr}
	bl LoadOamFromSprites
	bl ProcessObjectCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_801A418

	thumb_func_start sub_801A42C
sub_801A42C: @ 801A42C
	push {lr}
	ldr r0, =sub_801A43C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801A42C

	thumb_func_start sub_801A43C
sub_801A43C: @ 801A43C
	push {r4,r5,lr}
	sub sp, 0xC
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	ldr r5, =gUnknown_03000DAC
	movs r0, 0x6C
	bl AllocZeroed
	str r0, [r5]
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, =gUnknown_082F0D34
	movs r0, 0
	movs r2, 0x2
	bl InitBgsFromTemplates
	movs r4, 0x80
	lsls r4, 4
	adds r0, r4, 0
	bl Alloc
	adds r1, r0, 0
	movs r0, 0x1
	bl SetBgTilemapBuffer
	adds r0, r4, 0
	bl Alloc
	adds r1, r0, 0
	movs r0, 0
	bl SetBgTilemapBuffer
	ldr r1, =gUnknown_082F0990
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl copy_decompressed_tile_data_to_vram_autofree
	ldr r1, =gUnknown_082F0BA0
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r0, =gUnknown_082F0D3C
	bl InitWindows
	bl DeactivateAllTextPrinters
	bl ResetPaletteFade
	bl ResetAllObjectData
	bl ResetTasks
	bl remove_some_task
	bl m4aSoundVSyncOn
	ldr r0, =sub_801A418
	bl SetVBlankCallback
	ldr r0, =sub_801A6C0
	movs r1, 0
	bl CreateTask
	ldr r1, [r5]
	adds r1, 0x60
	strb r0, [r1]
	bl sub_8013C40
	ldr r1, [r5]
	adds r1, 0x61
	strb r0, [r1]
	ldr r1, [r5]
	movs r0, 0x1
	str r0, [r1, 0x1C]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	ldr r0, =gUnknown_082F0790
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0xF0
	bl sub_81978B0
	bl sub_81AFBF0
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0xF
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	ldr r0, =sub_801A3F4
	bl SetMainCallback2
	bl RunTasks
	bl RunTextPrinters
	bl CallObjectCallbacks
	bl PrepareSpritesForOamLoad
	bl UpdatePaletteFade
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801A43C

	thumb_func_start sub_801A584
sub_801A584: @ 801A584
	push {r4,lr}
	bl FreeAllWindowBuffers
	movs r4, 0
_0801A58C:
	lsls r0, r4, 24
	lsrs r0, 24
	bl GetBgTilemapBuffer
	bl Free
	adds r4, 0x1
	cmp r4, 0x1
	ble _0801A58C
	ldr r0, =gUnknown_03000DAC
	ldr r0, [r0]
	bl Free
	ldr r0, =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801A584

	thumb_func_start sub_801A5BC
sub_801A5BC: @ 801A5BC
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _0801A5E4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xE
	bne _0801A5E0
	movs r0, 0
	strh r0, [r1]
_0801A5E0:
	movs r0, 0
	strh r0, [r2]
_0801A5E4:
	movs r2, 0
	ldrsh r0, [r1, r2]
	adds r0, 0x2
	lsls r0, 5
	ldr r1, =gUnknown_082F0790
	adds r0, r1
	movs r1, 0
	movs r2, 0x10
	bl LoadPalette
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801A5BC

	thumb_func_start sub_801A600
sub_801A600: @ 801A600
	push {r4,r5,lr}
	sub sp, 0x8
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x2
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r5, =gUnknown_082F0D5C
	ldr r4, [r5]
	movs r0, 0x1
	adds r1, r4, 0
	movs r2, 0xC0
	bl GetStringCenterAlignXOffset
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x6
	str r0, [sp]
	movs r0, 0x3
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	adds r2, r4, 0
	bl sub_801A8B0
	movs r1, 0
_0801A644:
	adds r4, r1, 0x1
	lsls r0, r4, 2
	adds r0, r5
	ldr r2, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 25
	movs r1, 0x80
	lsls r1, 20
	adds r0, r1
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r1, 0x1
	movs r3, 0
	bl sub_801A8B0
	adds r1, r4, 0
	cmp r4, 0x2
	ble _0801A644
	ldr r1, =gUnknown_082F0D5C
	adds r0, r4, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r0, r4, 4
	subs r0, r4
	lsls r0, 25
	movs r1, 0x80
	lsls r1, 20
	adds r0, r1
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x1
	movs r3, 0
	bl sub_801A8B0
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801A600

	thumb_func_start sub_801A6C0
sub_801A6C0: @ 801A6C0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x5
	bls _0801A6E2
	b _0801A89C
_0801A6E2:
	lsls r0, 2
	ldr r1, =_0801A6F4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801A6F4:
	.4byte _0801A70C
	.4byte _0801A728
	.4byte _0801A74C
	.4byte _0801A768
	.4byte _0801A85C
	.4byte _0801A884
_0801A70C:
	bl sub_801A600
	ldr r0, =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0801A89C
	.pool
_0801A728:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0x1
	bl ShowBg
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl ShowBg
	b _0801A86C
_0801A74C:
	ldr r0, =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0801A75A
	b _0801A89C
_0801A75A:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r2
	b _0801A876
	.pool
_0801A768:
	ldr r0, =gUnknown_03000DAC
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x10
	adds r2, r0, 0
	adds r2, 0x20
	adds r3, r0, 0
	adds r3, 0x61
	ldrb r3, [r3]
	bl sub_801AA30
	lsls r1, r5, 2
	mov r8, r1
	cmp r0, 0
	beq _0801A7F8
	movs r0, 0x2
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r4, 0
	ldr r6, =gStringVar4
	movs r7, 0x80
	lsls r7, 20
_0801A796:
	ldr r0, =gUnknown_03000DAC
	ldr r0, [r0]
	lsls r1, r4, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r6, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	cmp r4, 0x3
	beq _0801A7CC
	lsrs r0, r7, 24
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0x1
	adds r2, r6, 0
	movs r3, 0xC
	bl sub_801A8B0
	b _0801A7DE
	.pool
_0801A7CC:
	movs r0, 0x62
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r1, 0x1
	adds r2, r6, 0
	movs r3, 0xC
	bl sub_801A8B0
_0801A7DE:
	movs r2, 0xF0
	lsls r2, 21
	adds r7, r2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0801A796
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0x2
	movs r1, 0x3
	bl CopyWindowToVram
_0801A7F8:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0801A80C
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0801A836
_0801A80C:
	movs r0, 0x5
	bl audio_play
	ldr r2, =gTasks
	ldr r0, =gUnknown_03000DAC
	ldr r0, [r0]
	adds r0, 0x61
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0xFF
	strh r1, [r0, 0x26]
	mov r0, r8
	adds r1, r0, r5
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_0801A836:
	mov r2, r8
	adds r1, r2, r5
	lsls r1, 3
	ldr r0, =gTasks + 0x8
	adds r1, r0
	adds r0, r1, 0
	adds r0, 0xE
	adds r1, 0x10
	bl sub_801A5BC
	b _0801A89C
	.pool
_0801A85C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0801A86C:
	ldr r1, =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
_0801A876:
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _0801A89C
	.pool
_0801A884:
	ldr r0, =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0801A89C
	ldr r0, =sub_801A584
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0801A89C:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801A6C0

	thumb_func_start sub_801A8B0
sub_801A8B0: @ 801A8B0
	push {r4-r7,lr}
	sub sp, 0x18
	mov r12, r2
	ldr r2, [sp, 0x2C]
	ldr r4, [sp, 0x30]
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r3, 24
	lsrs r5, r3, 24
	lsls r2, 24
	lsrs r3, r2, 24
	lsls r4, 24
	lsrs r0, r4, 24
	cmp r0, 0x4
	bhi _0801A93A
	lsls r0, 2
	ldr r1, =_0801A8E0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801A8E0:
	.4byte _0801A8F4
	.4byte _0801A902
	.4byte _0801A910
	.4byte _0801A91E
	.4byte _0801A92C
_0801A8F4:
	add r1, sp, 0x14
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	movs r0, 0x3
	b _0801A938
_0801A902:
	add r1, sp, 0x14
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	movs r0, 0x3
	b _0801A938
_0801A910:
	add r1, sp, 0x14
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	movs r0, 0x5
	b _0801A938
_0801A91E:
	add r1, sp, 0x14
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x7
	strb r0, [r1, 0x1]
	movs r0, 0x6
	b _0801A938
_0801A92C:
	add r1, sp, 0x14
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	movs r0, 0x2
_0801A938:
	strb r0, [r1, 0x2]
_0801A93A:
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	add r0, sp, 0x14
	str r0, [sp, 0x8]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0xC]
	mov r0, r12
	str r0, [sp, 0x10]
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl AddTextPrinterParametrized2
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_801A8B0

	thumb_func_start sub_801A960
sub_801A960: @ 801A960
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r12, r0
	adds r7, r1, 0
	ldrb r0, [r0, 0xA]
	lsls r0, 25
	lsrs r0, 25
	mov r8, r0
	movs r4, 0
	ldr r0, =gUnknown_082F0D70
	mov r9, r0
	movs r1, 0x1
	add r1, r9
	mov r10, r1
	mov r3, r12
	adds r3, 0x4
	str r3, [sp]
_0801A98A:
	lsls r0, r4, 1
	adds r2, r0, r4
	mov r3, r9
	adds r1, r2, r3
	adds r5, r0, 0
	adds r6, r4, 0x1
	ldrb r1, [r1]
	cmp r8, r1
	bne _0801A9EE
	mov r0, r12
	ldrb r1, [r0, 0x1A]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _0801A9EE
	mov r0, r9
	adds r0, 0x2
	adds r3, r2, r0
	ldrb r0, [r3]
	cmp r0, 0
	bne _0801A9DC
	movs r2, 0
	movs r1, 0
	ldr r3, [sp]
_0801A9BA:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0801A9C4
	adds r2, 0x1
_0801A9C4:
	adds r1, 0x1
	cmp r1, 0x3
	ble _0801A9BA
	adds r2, 0x1
	adds r0, r5, r4
	add r0, r10
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r7
	b _0801A9E8
	.pool
_0801A9DC:
	mov r1, r10
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r7
	ldrb r2, [r3]
_0801A9E8:
	ldr r0, [r1]
	adds r0, r2
	str r0, [r1]
_0801A9EE:
	adds r4, r6, 0
	cmp r4, 0x1E
	bls _0801A98A
	mov r0, r8
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_801A960

	thumb_func_start sub_801AA08
sub_801AA08: @ 801AA08
	push {r4,lr}
	movs r4, 0
	adds r3, r1, 0
	adds r2, r0, 0
_0801AA10:
	ldr r1, [r2]
	ldr r0, [r3]
	cmp r1, r0
	beq _0801AA1C
	movs r0, 0x1
	b _0801AA28
_0801AA1C:
	adds r3, 0x4
	adds r2, 0x4
	adds r4, 0x1
	cmp r4, 0x3
	ble _0801AA10
	movs r0, 0
_0801AA28:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801AA08

	thumb_func_start sub_801AA30
sub_801AA30: @ 801AA30
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	adds r6, r0, 0
	mov r9, r1
	adds r5, r2, 0
	lsls r4, r3, 24
	lsrs r4, 24
	movs r0, 0
	mov r8, r0
	mov r0, sp
	movs r1, 0
	movs r2, 0x10
	bl memset
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, =gTasks + 0x8
	adds r7, r0, r1
	movs r4, 0
_0801AA5E:
	lsls r1, r4, 5
	ldr r0, [r7]
	adds r0, r1
	mov r1, sp
	bl sub_801A960
	adds r1, r0, 0
	ldr r0, [r5]
	cmp r1, r0
	beq _0801AA78
	str r1, [r5]
	movs r2, 0x1
	mov r8, r2
_0801AA78:
	adds r5, 0x4
	adds r4, 0x1
	cmp r4, 0xF
	ble _0801AA5E
	mov r0, sp
	mov r1, r9
	bl sub_801AA08
	cmp r0, 0
	bne _0801AA9C
	mov r3, r8
	cmp r3, 0x1
	beq _0801AAC4
	movs r0, 0
	b _0801AAC6
	.pool
_0801AA9C:
	adds r1, r6, 0
	mov r0, sp
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldr r0, [r0]
	str r0, [r1]
	mov r1, r9
	mov r0, sp
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r6]
	ldr r1, [r6, 0x4]
	adds r0, r1
	ldr r1, [r6, 0x8]
	adds r0, r1
	ldr r1, [r6, 0xC]
	adds r0, r1
	str r0, [r6, 0xC]
_0801AAC4:
	movs r0, 0x1
_0801AAC6:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_801AA30

	thumb_func_start sub_801AAD4
sub_801AAD4: @ 801AAD4
	push {r4-r7,lr}
	movs r0, 0xA
	bl sub_8014210
	movs r4, 0
	movs r7, 0x64
	ldr r6, =gPlayerParty
	ldr r5, =gEnemyParty
_0801AAE4:
	ldr r0, =gUnknown_0203CEF8
	adds r0, r4, r0
	ldrb r0, [r0]
	subs r0, 0x1
	adds r1, r0, 0
	muls r1, r7
	adds r1, r6
	adds r0, r5, 0
	movs r2, 0x64
	bl memcpy
	adds r5, 0x64
	adds r4, 0x1
	cmp r4, 0x1
	ble _0801AAE4
	ldr r4, =gPlayerParty
	movs r0, 0xFA
	lsls r0, 1
	adds r5, r4, r0
_0801AB0A:
	adds r0, r4, 0
	bl zero_pokemon_struct
	adds r4, 0x64
	cmp r4, r5
	ble _0801AB0A
	ldr r4, =gPlayerParty
	movs r5, 0
	adds r6, r4, 0
	adds r6, 0x64
_0801AB1E:
	ldr r1, =gEnemyParty
	adds r1, r5, r1
	adds r0, r4, 0
	movs r2, 0x64
	bl memcpy
	adds r4, 0x64
	adds r5, 0x64
	cmp r4, r6
	ble _0801AB1E
	movs r0, 0x32
	bl sav12_xor_increment
	bl calc_player_party_count
	ldr r0, =gUnknown_02038BCA
	movs r2, 0xC0
	lsls r2, 4
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, =sub_8036760
	bl SetMainCallback2
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801AAD4

	thumb_func_start sub_801AB68
sub_801AB68: @ 801AB68
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	adds r5, r0, 0
	adds r7, r1, 0
	adds r6, r2, 0
	ldr r4, [sp, 0x38]
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0
	mov r9, r0
	movs r1, 0x1
	mov r10, r1
	ldr r0, =gUnknown_082F0DE4
	mov r8, r0
	ldrb r0, [r0]
	lsls r1, r0, 4
	orrs r1, r0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	str r3, [sp, 0x14]
	bl FillWindowPixelBuffer
	mov r1, r9
	str r1, [sp]
	mov r0, r10
	str r0, [sp, 0x4]
	mov r1, r8
	str r1, [sp, 0x8]
	lsls r4, 24
	asrs r4, 24
	str r4, [sp, 0xC]
	str r7, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0x1
	adds r2, r6, 0
	ldr r3, [sp, 0x14]
	bl AddTextPrinterParametrized2
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801AB68

	thumb_func_start sub_801ABDC
sub_801ABDC: @ 801ABDC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r1, 0
	adds r5, r2, 0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0801ABF4
	cmp r0, 0x1
	beq _0801AC22
	b _0801AC36
_0801ABF4:
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xD
	bl sub_8098858
	str r5, [sp]
	movs r0, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x1
	bl sub_801AB68
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0801AC36
_0801AC22:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0801AC36
	strh r0, [r4]
	movs r0, 0x1
	b _0801AC38
_0801AC36:
	movs r0, 0
_0801AC38:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_801ABDC

	thumb_func_start sub_801AC40
sub_801AC40: @ 801AC40
	push {lr}
	bl LoadOamFromSprites
	bl ProcessObjectCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_801AC40

	thumb_func_start sub_801AC54
sub_801AC54: @ 801AC54
	push {r4,lr}
	sub sp, 0xC
	ldr r1, =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x33
	bls _0801AC6A
	b _0801AFAE
_0801AC6A:
	lsls r0, 2
	ldr r1, =_0801AC7C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801AC7C:
	.4byte _0801AD4C
	.4byte _0801ADFC
	.4byte _0801AE24
	.4byte _0801AE48
	.4byte _0801AE98
	.4byte _0801AFAE
	.4byte _0801AF7C
	.4byte _0801AF58
	.4byte _0801AF7C
	.4byte _0801AF98
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AFAE
	.4byte _0801AF24
	.4byte _0801AF40
_0801AD4C:
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	ldr r4, =gUnknown_02022C6C
	movs r0, 0x4
	bl AllocZeroed
	str r0, [r4]
	bl ResetAllObjectData
	bl ResetObjectPaletteAllocator
	bl ResetTasks
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, =gUnknown_082F0DD0
	movs r0, 0
	movs r2, 0x1
	bl InitBgsFromTemplates
	bl reset_temp_tile_data_buffers
	ldr r0, =gUnknown_082F0DD4
	bl InitWindows
	lsls r0, 16
	cmp r0, 0
	bne _0801AD8C
	b _0801AFC2
_0801AD8C:
	bl DeactivateAllTextPrinters
	movs r0, 0
	bl ClearWindowTilemap
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0xF
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xD0
	bl sub_809882C
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xD0
	bl box_border_load_tiles_and_pal
	bl sub_819789C
	ldr r0, =sub_801AC40
	bl SetVBlankCallback
	ldr r1, =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	b _0801AF8A
	.pool
_0801ADFC:
	ldr r0, =gUnknown_02022C6C
	ldr r0, [r0]
	ldr r1, =gUnknown_085EFBD2
	movs r2, 0
	bl sub_801ABDC
	cmp r0, 0
	bne _0801AE0E
	b _0801AFAE
_0801AE0E:
	ldr r1, =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _0801AF8A
	.pool
_0801AE24:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0
	bl ShowBg
	ldr r1, =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	b _0801AF8A
	.pool
_0801AE48:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	beq _0801AE54
	b _0801AFAE
_0801AE54:
	ldr r4, =gUnknown_020228C4
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x20
	bl memset
	ldr r0, =gUnknown_0203CEF8
	ldrb r1, [r0]
	ldrb r0, [r0, 0x1]
	cmn r1, r0
	bne _0801AE78
	movs r0, 0x52
	b _0801AE7A
	.pool
_0801AE78:
	movs r0, 0x51
_0801AE7A:
	strb r0, [r4]
	ldr r1, =gUnknown_020228C4
	movs r0, 0
	movs r2, 0x20
	bl link_0800A448
	ldr r1, =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _0801AF8A
	.pool
_0801AE98:
	bl sub_800A550
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0801AEA6
	b _0801AFAE
_0801AEA6:
	ldr r1, =gUnknown_020223C4
	ldrh r0, [r1]
	cmp r0, 0x51
	bne _0801AEE0
	movs r2, 0x80
	lsls r2, 1
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, 0x51
	bne _0801AEE0
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r1, 0x32
	b _0801AF16
	.pool
_0801AEE0:
	bl sub_800AC34
	ldr r4, =gUnknown_020223C4
	bl link_get_multiplayer_id
	lsls r0, 24
	lsrs r0, 16
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, 0x52
	bne _0801AF0C
	ldr r0, =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r0, r2
	movs r1, 0x6
	b _0801AF16
	.pool
_0801AF0C:
	ldr r0, =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r1, 0x8
_0801AF16:
	strb r1, [r0]
	bl sub_800A5B4
	b _0801AFAE
	.pool
_0801AF24:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0801AFAE
	bl sub_800ADF8
	ldr r1, =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _0801AF8A
	.pool
_0801AF40:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _0801AFAE
	ldr r0, =sub_801AAD4
	bl SetMainCallback2
	b _0801AFAE
	.pool
_0801AF58:
	ldr r0, =gUnknown_02022C6C
	ldr r0, [r0]
	ldr r1, =gUnknown_085EFC27
	movs r2, 0x1
	bl sub_801ABDC
	cmp r0, 0
	beq _0801AFAE
	ldr r0, =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	b _0801AFAE
	.pool
_0801AF7C:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801AFAE
	movs r0, 0x87
	lsls r0, 3
	adds r1, r2, r0
_0801AF8A:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0801AFAE
	.pool
_0801AF98:
	ldr r0, =gUnknown_02022C6C
	ldr r0, [r0]
	ldr r1, =gUnknown_085EFC0C
	movs r2, 0x1
	bl sub_801ABDC
	cmp r0, 0
	beq _0801AFAE
	ldr r0, =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
_0801AFAE:
	bl RunTasks
	bl RunTextPrinters
	bl CallObjectCallbacks
	bl PrepareSpritesForOamLoad
	bl UpdatePaletteFade
_0801AFC2:
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801AC54

	thumb_func_start sub_801AFD8
sub_801AFD8: @ 801AFD8
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r0, =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r0, =0x0000322c
	adds r1, r0
	ldr r2, =0x050000db
	mov r0, sp
	bl CpuSet
	bl sub_801B180
	bl sub_811F8BC
	add sp, 0x4
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801AFD8

	thumb_func_start sub_801B00C
sub_801B00C: @ 801B00C
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, =0x00003230
	adds r0, r1
	bx lr
	.pool
	thumb_func_end sub_801B00C

	thumb_func_start sav1_get_mevent_buffer_1
sav1_get_mevent_buffer_1: @ 801B020
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, =0x000033f0
	adds r0, r1
	bx lr
	.pool
	thumb_func_end sav1_get_mevent_buffer_1

	thumb_func_start sav1_get_mevent_buffer_2
sav1_get_mevent_buffer_2: @ 801B034
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r1, 0xD5
	lsls r1, 6
	adds r0, r1
	bx lr
	.pool
	thumb_func_end sav1_get_mevent_buffer_2

	thumb_func_start sub_801B044
sub_801B044: @ 801B044
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, =0x0000356c
	adds r0, r1
	bx lr
	.pool
	thumb_func_end sub_801B044

	thumb_func_start sub_801B058
sub_801B058: @ 801B058
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, =0x00003564
	adds r0, r1
	bx lr
	.pool
	thumb_func_end sub_801B058

	thumb_func_start sub_801B06C
sub_801B06C: @ 801B06C
	push {lr}
	bl sub_801B14C
	pop {r0}
	bx r0
	thumb_func_end sub_801B06C

	thumb_func_start sub_801B078
sub_801B078: @ 801B078
	push {r4-r7,lr}
	adds r7, r0, 0
	bl sub_801B114
	cmp r0, 0
	beq _0801B0C4
	bl sub_801B14C
	ldr r4, =gSaveBlock1Ptr
	ldr r0, [r4]
	ldr r5, =0x00003230
	adds r0, r5
	movs r6, 0xDE
	lsls r6, 1
	adds r1, r7, 0
	adds r2, r6, 0
	bl memcpy
	ldr r0, [r4]
	adds r0, r5
	adds r1, r6, 0
	bl CalcCRC16WithTable
	ldr r1, [r4]
	ldr r2, =0x0000322c
	adds r1, r2
	lsls r0, 16
	lsrs r0, 16
	str r0, [r1]
	movs r0, 0x1
	b _0801B0C6
	.pool
_0801B0C4:
	movs r0, 0
_0801B0C6:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_801B078

	thumb_func_start sub_801B0CC
sub_801B0CC: @ 801B0CC
	push {r4,lr}
	ldr r4, =gSaveBlock1Ptr
	ldr r0, [r4]
	ldr r1, =0x00003230
	adds r0, r1
	movs r1, 0xDE
	lsls r1, 1
	bl CalcCRC16WithTable
	lsls r0, 16
	lsrs r0, 16
	ldr r4, [r4]
	ldr r2, =0x0000322c
	adds r1, r4, r2
	ldr r1, [r1]
	cmp r0, r1
	bne _0801B10C
	ldr r1, =0x00003230
	adds r0, r4, r1
	bl sub_801B114
	cmp r0, 0
	beq _0801B10C
	movs r0, 0x1
	b _0801B10E
	.pool
_0801B10C:
	movs r0, 0
_0801B10E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801B0CC

	thumb_func_start sub_801B114
sub_801B114: @ 801B114
	push {lr}
	ldrh r0, [r0]
	cmp r0, 0
	beq _0801B120
	movs r0, 0x1
	b _0801B122
_0801B120:
	movs r0, 0
_0801B122:
	pop {r1}
	bx r1
	thumb_func_end sub_801B114

	thumb_func_start sub_801B128
sub_801B128: @ 801B128
	push {lr}
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, =0x00003230
	adds r0, r1
	ldrb r0, [r0, 0x2]
	cmp r0, 0
	beq _0801B144
	movs r0, 0x1
	b _0801B146
	.pool
_0801B144:
	movs r0, 0
_0801B146:
	pop {r1}
	bx r1
	thumb_func_end sub_801B128

	thumb_func_start sub_801B14C
sub_801B14C: @ 801B14C
	push {r4,lr}
	sub sp, 0x4
	movs r4, 0
	str r4, [sp]
	bl sub_801B00C
	adds r1, r0, 0
	ldr r2, =0x0500006f
	mov r0, sp
	bl CpuSet
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, =0x0000322c
	adds r0, r1
	str r4, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801B14C

	thumb_func_start sub_801B180
sub_801B180: @ 801B180
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	bl sub_801B044
	adds r1, r0, 0
	ldr r2, =0x05000001
	mov r0, sp
	bl CpuSet
	bl sub_801DBC0
	add sp, 0x4
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801B180

	thumb_func_start sub_801B1A4
sub_801B1A4: @ 801B1A4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, =0x00003230
	adds r4, r0, r1
	bl sub_801B0CC
	cmp r0, 0
	bne _0801B1C4
_0801B1B8:
	movs r0, 0
	b _0801B1DC
	.pool
_0801B1C4:
	movs r2, 0
	ldr r3, =0x000001bb
_0801B1C8:
	adds r0, r4, r2
	adds r1, r5, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0801B1B8
	adds r2, 0x1
	cmp r2, r3
	bls _0801B1C8
	movs r0, 0x1
_0801B1DC:
	pop {r4,r5}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801B1A4

	thumb_func_start sub_801B1E8
sub_801B1E8: @ 801B1E8
	push {lr}
	bl sub_801B330
	bl sub_801B368
	bl sub_801B9F8
	bl killram
	bl sub_809D4D8
	bl sub_809D570
	ldr r0, =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, =0x00000bec
	adds r0, r1
	bl sub_816534C
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801B1E8

	thumb_func_start sub_801B21C
sub_801B21C: @ 801B21C
	push {r4-r7,lr}
	adds r7, r0, 0
	bl sub_801B2CC
	cmp r0, 0
	beq _0801B274
	bl sub_801B1E8
	ldr r4, =gSaveBlock1Ptr
	ldr r0, [r4]
	ldr r5, =0x000033f0
	adds r0, r5
	movs r6, 0xA6
	lsls r6, 1
	adds r1, r7, 0
	adds r2, r6, 0
	bl memcpy
	ldr r0, [r4]
	adds r0, r5
	adds r1, r6, 0
	bl CalcCRC16WithTable
	ldr r1, [r4]
	ldr r3, =0x000033ec
	adds r2, r1, r3
	lsls r0, 16
	lsrs r0, 16
	str r0, [r2]
	movs r0, 0xD5
	lsls r0, 6
	adds r2, r1, r0
	adds r1, r5
	ldrh r0, [r1, 0x2]
	strh r0, [r2, 0x6]
	movs r0, 0x1
	b _0801B276
	.pool
_0801B274:
	movs r0, 0
_0801B276:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_801B21C

	thumb_func_start sub_801B27C
sub_801B27C: @ 801B27C
	push {r4,r5,lr}
	ldr r5, =gSaveBlock1Ptr
	ldr r0, [r5]
	ldr r1, =0x000033ec
	adds r4, r0, r1
	adds r1, 0x4
	adds r0, r1
	movs r1, 0xA6
	lsls r1, 1
	bl CalcCRC16WithTable
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [r4]
	cmp r1, r0
	bne _0801B2C4
	ldr r0, [r5]
	ldr r1, =0x000033f0
	adds r0, r1
	bl sub_801B2CC
	cmp r0, 0
	beq _0801B2C4
	bl sub_80991F8
	cmp r0, 0
	beq _0801B2C4
	movs r0, 0x1
	b _0801B2C6
	.pool
_0801B2C4:
	movs r0, 0
_0801B2C6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_801B27C

	thumb_func_start sub_801B2CC
sub_801B2CC: @ 801B2CC
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2]
	cmp r0, 0
	beq _0801B302
	ldrb r1, [r2, 0x8]
	lsls r0, r1, 30
	lsrs r0, 30
	cmp r0, 0x2
	bhi _0801B302
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _0801B2F0
	cmp r0, 0x40
	beq _0801B2F0
	cmp r0, 0x80
	bne _0801B302
_0801B2F0:
	lsls r0, r1, 26
	lsrs r0, 28
	cmp r0, 0x7
	bhi _0801B302
	ldrb r0, [r2, 0x9]
	cmp r0, 0x7
	bhi _0801B302
	movs r0, 0x1
	b _0801B304
_0801B302:
	movs r0, 0
_0801B304:
	pop {r1}
	bx r1
	thumb_func_end sub_801B2CC

	thumb_func_start sub_801B308
sub_801B308: @ 801B308
	push {lr}
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, =0x000033f0
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _0801B328
	movs r0, 0x1
	b _0801B32A
	.pool
_0801B328:
	movs r0, 0
_0801B32A:
	pop {r1}
	bx r1
	thumb_func_end sub_801B308

	thumb_func_start sub_801B330
sub_801B330: @ 801B330
	push {r4,r5,lr}
	sub sp, 0x4
	movs r5, 0
	str r5, [sp]
	ldr r4, =gSaveBlock1Ptr
	ldr r1, [r4]
	ldr r0, =0x000033f0
	adds r1, r0
	ldr r2, =0x05000053
	mov r0, sp
	bl CpuSet
	ldr r0, [r4]
	ldr r1, =0x000033ec
	adds r0, r1
	str r5, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801B330

	thumb_func_start sub_801B368
sub_801B368: @ 801B368
	push {r4,lr}
	sub sp, 0x4
	movs r4, 0
	str r4, [sp]
	bl sav1_get_mevent_buffer_2
	adds r1, r0, 0
	ldr r2, =0x05000009
	mov r0, sp
	bl CpuSet
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, =0x0000353c
	adds r0, r1
	str r4, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801B368

	thumb_func_start sub_801B39C
sub_801B39C: @ 801B39C
	push {lr}
	bl sub_801B27C
	cmp r0, 0
	bne _0801B3AA
	movs r0, 0
	b _0801B3B4
_0801B3AA:
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, =0x000033f0
	adds r0, r1
	ldrh r0, [r0]
_0801B3B4:
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801B39C

	thumb_func_start sub_801B3C0
sub_801B3C0: @ 801B3C0
	push {lr}
	adds r2, r0, 0
	ldrb r1, [r2, 0x8]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0x40
	bne _0801B3D4
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x8]
_0801B3D4:
	pop {r0}
	bx r0
	thumb_func_end sub_801B3C0

	thumb_func_start sub_801B3D8
sub_801B3D8: @ 801B3D8
	push {lr}
	lsls r0, 16
	ldr r1, =0xfc180000
	adds r0, r1
	lsrs r0, 16
	cmp r0, 0x13
	bls _0801B3F0
	movs r0, 0
	b _0801B3F2
	.pool
_0801B3F0:
	movs r0, 0x1
_0801B3F2:
	pop {r1}
	bx r1
	thumb_func_end sub_801B3D8

	thumb_func_start sub_801B3F8
sub_801B3F8: @ 801B3F8
	push {r4,lr}
	bl sub_801B39C
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_801B3D8
	cmp r0, 0
	beq _0801B430
	ldr r1, =gUnknown_082F0DE8
	ldr r2, =0xfffffc18
	adds r0, r4, r2
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0801B430
	movs r0, 0x1
	b _0801B432
	.pool
_0801B430:
	movs r0, 0
_0801B432:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801B3F8

	thumb_func_start sub_801B438
sub_801B438: @ 801B438
	push {lr}
	movs r3, 0
	cmp r3, r1
	bge _0801B45A
	adds r2, r0, 0
	adds r2, 0x8
_0801B444:
	ldrh r0, [r2, 0xE]
	cmp r0, 0
	beq _0801B452
	ldrh r0, [r2]
	cmp r0, 0
	beq _0801B452
	adds r3, 0x1
_0801B452:
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bne _0801B444
_0801B45A:
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end sub_801B438

	thumb_func_start sub_801B460
sub_801B460: @ 801B460
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r1, 0
	cmp r1, r2
	bge _0801B49A
	ldrh r6, [r4, 0x2]
	movs r0, 0x16
	adds r0, r5
	mov r12, r0
_0801B474:
	lsls r3, r1, 1
	mov r7, r12
	ldrh r0, [r7]
	cmp r0, r6
	beq _0801B48C
	adds r0, r5, 0
	adds r0, 0x8
	adds r0, r3
	ldrh r0, [r0]
	ldrh r3, [r4]
	cmp r0, r3
	bne _0801B490
_0801B48C:
	movs r0, 0x1
	b _0801B49C
_0801B490:
	movs r7, 0x2
	add r12, r7
	adds r1, 0x1
	cmp r1, r2
	blt _0801B474
_0801B49A:
	movs r0, 0
_0801B49C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_801B460

	thumb_func_start sub_801B4A4
sub_801B4A4: @ 801B4A4
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	beq _0801B4C4
	ldrh r1, [r1]
	cmp r1, 0
	beq _0801B4C4
	ldr r0, =0x0000019b
	cmp r1, r0
	bhi _0801B4C4
	movs r0, 0x1
	b _0801B4C6
	.pool
_0801B4C4:
	movs r0, 0
_0801B4C6:
	pop {r1}
	bx r1
	thumb_func_end sub_801B4A4

	thumb_func_start sub_801B4CC
sub_801B4CC: @ 801B4CC
	push {lr}
	bl sub_801B27C
	cmp r0, 0
	beq _0801B500
	ldr r0, =gSaveBlock1Ptr
	ldr r3, [r0]
	ldr r0, =0x000033f0
	adds r2, r3, r0
	ldrb r1, [r2, 0x8]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _0801B500
	movs r1, 0xD5
	lsls r1, 6
	adds r0, r3, r1
	ldrb r1, [r2, 0x9]
	bl sub_801B438
	b _0801B502
	.pool
_0801B500:
	movs r0, 0
_0801B502:
	pop {r1}
	bx r1
	thumb_func_end sub_801B4CC

	thumb_func_start sub_801B508
sub_801B508: @ 801B508
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, =gSaveBlock1Ptr
	ldr r0, [r6]
	ldr r1, =0x000033f0
	adds r0, r1
	ldrb r4, [r0, 0x9]
	adds r0, r5, 0
	bl sub_801B4A4
	cmp r0, 0
	beq _0801B572
	ldr r0, [r6]
	movs r1, 0xD5
	lsls r1, 6
	adds r0, r1
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_801B460
	cmp r0, 0
	beq _0801B54C
	b _0801B572
	.pool
_0801B540:
	ldrh r0, [r5, 0x2]
	strh r0, [r1]
	ldrh r0, [r5]
	strh r0, [r2]
	movs r0, 0x1
	b _0801B574
_0801B54C:
	movs r3, 0
	cmp r3, r4
	bge _0801B572
	ldr r0, [r6]
	ldr r6, =0x00003548
	adds r2, r0, r6
	adds r6, 0xE
	adds r1, r0, r6
_0801B55C:
	ldrh r0, [r2, 0xE]
	cmp r0, 0
	bne _0801B568
	ldrh r0, [r2]
	cmp r0, 0
	beq _0801B540
_0801B568:
	adds r2, 0x2
	adds r1, 0x2
	adds r3, 0x1
	cmp r3, r4
	blt _0801B55C
_0801B572:
	movs r0, 0
_0801B574:
	pop {r4-r6}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801B508

	thumb_func_start sub_801B580
sub_801B580: @ 801B580
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r5, r0, 0
	adds r4, r1, 0
	movs r0, 0
	str r0, [sp]
	ldr r2, =0x05000019
	mov r0, sp
	adds r1, r5, 0
	bl CpuSet
	ldr r0, =0x00000101
	str r0, [r5]
	movs r0, 0x1
	strh r0, [r5, 0x4]
	str r0, [r5, 0x8]
	cmp r4, 0
	beq _0801B5C0
	movs r0, 0x5
	strh r0, [r5, 0xC]
	ldr r0, =0x00000201
	b _0801B5C8
	.pool
_0801B5C0:
	movs r0, 0x4
	strh r0, [r5, 0xC]
	movs r0, 0x80
	lsls r0, 2
_0801B5C8:
	str r0, [r5, 0x10]
	bl sub_801B27C
	cmp r0, 0
	beq _0801B5FC
	bl sav1_get_mevent_buffer_1
	ldrh r0, [r0]
	strh r0, [r5, 0x14]
	bl sav1_get_mevent_buffer_2
	adds r1, r5, 0
	adds r1, 0x20
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	bl sav1_get_mevent_buffer_1
	ldrb r1, [r0, 0x9]
	adds r0, r5, 0
	adds r0, 0x44
	strb r1, [r0]
	b _0801B5FE
_0801B5FC:
	strh r0, [r5, 0x14]
_0801B5FE:
	adds r4, r5, 0
	adds r4, 0x4C
	ldr r0, =gSaveBlock2Ptr
	mov r8, r0
	adds r6, r5, 0
	adds r6, 0x45
	adds r7, r5, 0
	adds r7, 0x50
	movs r1, 0x5C
	adds r1, r5
	mov r9, r1
	movs r2, 0x60
	adds r2, r5
	mov r10, r2
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r3, =0x00003564
	adds r2, r0, r3
	adds r1, r5, 0
	adds r1, 0x16
	movs r3, 0x3
_0801B628:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _0801B628
	mov r0, r8
	ldr r1, [r0]
	adds r1, 0xA
	adds r0, r4, 0
	bl sub_80842F4
	mov r2, r8
	ldr r1, [r2]
	adds r0, r6, 0
	bl StringCopy
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r3, =0x00002bb0
	adds r2, r0, r3
	adds r1, r7, 0
	movs r3, 0x5
_0801B658:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _0801B658
	ldr r1, =RomHeaderGameCode
	mov r0, r9
	movs r2, 0x4
	bl memcpy
	ldr r0, =RomHeaderSoftwareVersion
	ldrb r0, [r0]
	mov r4, r10
	strb r0, [r4]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801B580

	thumb_func_start sub_801B6A0
sub_801B6A0: @ 801B6A0
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	ldr r1, [r2]
	ldr r0, =0x00000101
	cmp r1, r0
	bne _0801B6DC
	ldrh r1, [r2, 0x4]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0801B6DC
	ldr r0, [r2, 0x8]
	ands r0, r3
	cmp r0, 0
	beq _0801B6DC
	cmp r4, 0
	bne _0801B6E4
	ldrh r1, [r2, 0xC]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0801B6DC
	ldr r0, [r2, 0x10]
	movs r1, 0xE0
	lsls r1, 2
	ands r0, r1
	cmp r0, 0
	bne _0801B6E4
_0801B6DC:
	movs r0, 0
	b _0801B6E6
	.pool
_0801B6E4:
	movs r0, 0x1
_0801B6E6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801B6A0

	thumb_func_start sub_801B6EC
sub_801B6EC: @ 801B6EC
	push {lr}
	ldrh r1, [r1, 0x14]
	cmp r1, 0
	bne _0801B6F8
	movs r0, 0
	b _0801B704
_0801B6F8:
	ldrh r0, [r0]
	cmp r0, r1
	beq _0801B702
	movs r0, 0x2
	b _0801B704
_0801B702:
	movs r0, 0x1
_0801B704:
	pop {r1}
	bx r1
	thumb_func_end sub_801B6EC

	thumb_func_start sub_801B708
sub_801B708: @ 801B708
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r4, 0
	adds r5, 0x20
	adds r4, 0x44
	ldrb r1, [r4]
	adds r0, r5, 0
	bl sub_801B438
	ldrb r2, [r4]
	subs r4, r2, r0
	cmp r4, 0
	bne _0801B728
	movs r0, 0x1
	b _0801B742
_0801B728:
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_801B460
	cmp r0, 0
	beq _0801B738
	movs r0, 0x3
	b _0801B742
_0801B738:
	cmp r4, 0x1
	beq _0801B740
	movs r0, 0x2
	b _0801B742
_0801B740:
	movs r0, 0x4
_0801B742:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_801B708

	thumb_func_start sub_801B748
sub_801B748: @ 801B748
	push {r4,lr}
	movs r3, 0
	adds r2, r0, 0
	adds r2, 0x16
_0801B750:
	ldrh r0, [r2]
	ldrh r4, [r1]
	cmp r0, r4
	beq _0801B75C
	movs r0, 0
	b _0801B768
_0801B75C:
	adds r1, 0x2
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	ble _0801B750
	movs r0, 0x1
_0801B768:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801B748

	thumb_func_start sub_801B770
sub_801B770: @ 801B770
	push {lr}
	adds r2, r0, 0
	adds r2, 0x20
	adds r0, 0x44
	ldrb r1, [r0]
	adds r0, r2, 0
	bl sub_801B438
	pop {r1}
	bx r1
	thumb_func_end sub_801B770

	thumb_func_start sub_801B784
sub_801B784: @ 801B784
	push {lr}
	adds r2, r0, 0
	cmp r1, 0x4
	bhi _0801B7D0
	lsls r0, r1, 2
	ldr r1, =_0801B79C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801B79C:
	.4byte _0801B7B0
	.4byte _0801B7B4
	.4byte _0801B7B8
	.4byte _0801B7BC
	.4byte _0801B7C8
_0801B7B0:
	ldrh r0, [r2, 0x20]
	b _0801B7D2
_0801B7B4:
	ldrh r0, [r2, 0x22]
	b _0801B7D2
_0801B7B8:
	ldrh r0, [r2, 0x24]
	b _0801B7D2
_0801B7BC:
	adds r0, r2, 0
	bl sub_801B770
	lsls r0, 16
	lsrs r0, 16
	b _0801B7D2
_0801B7C8:
	adds r0, r2, 0
	adds r0, 0x44
	ldrb r0, [r0]
	b _0801B7D2
_0801B7D0:
	movs r0, 0
_0801B7D2:
	pop {r1}
	bx r1
	thumb_func_end sub_801B784

	thumb_func_start sub_801B7D8
sub_801B7D8: @ 801B7D8
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, =gSaveBlock1Ptr
	ldr r0, [r2]
	ldr r1, =0x000033f0
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x3
	ands r0, r1
	adds r3, r2, 0
	cmp r0, 0x2
	bne _0801B850
	movs r2, 0
	cmp r4, 0x4
	bhi _0801B83A
	lsls r0, r4, 2
	ldr r1, =_0801B80C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801B80C:
	.4byte _0801B820
	.4byte _0801B828
	.4byte _0801B834
	.4byte _0801B83A
	.4byte _0801B83A
_0801B820:
	ldr r0, [r3]
	movs r1, 0xD5
	lsls r1, 6
	b _0801B838
_0801B828:
	ldr r0, [r3]
	ldr r1, =0x00003542
	b _0801B838
	.pool
_0801B834:
	ldr r0, [r3]
	ldr r1, =0x00003544
_0801B838:
	adds r2, r0, r1
_0801B83A:
	cmp r2, 0
	beq _0801B850
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, =0x000003e7
	cmp r0, r1
	bls _0801B850
	strh r1, [r2]
_0801B850:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801B7D8

	thumb_func_start mevent_081445C0
mevent_081445C0: @ 801B860
	push {lr}
	cmp r0, 0x4
	bhi _0801B938
	lsls r0, 2
	ldr r1, =_0801B874
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801B874:
	.4byte _0801B888
	.4byte _0801B8AC
	.4byte _0801B8D0
	.4byte _0801B8F4
	.4byte _0801B918
_0801B888:
	ldr r0, =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r1, =0x000033f0
	adds r0, r2, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x2
	bne _0801B938
	movs r1, 0xD5
	lsls r1, 6
	adds r0, r2, r1
	ldrh r0, [r0]
	b _0801B93A
	.pool
_0801B8AC:
	ldr r0, =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r1, =0x000033f0
	adds r0, r2, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x2
	bne _0801B938
	movs r1, 0xD5
	lsls r1, 6
	adds r0, r2, r1
	ldrh r0, [r0, 0x2]
	b _0801B93A
	.pool
_0801B8D0:
	ldr r0, =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r1, =0x000033f0
	adds r0, r2, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x2
	bne _0801B938
	movs r1, 0xD5
	lsls r1, 6
	adds r0, r2, r1
	ldrh r0, [r0, 0x4]
	b _0801B93A
	.pool
_0801B8F4:
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, =0x000033f0
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _0801B938
	bl sub_801B4CC
	lsls r0, 16
	lsrs r0, 16
	b _0801B93A
	.pool
_0801B918:
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, =0x000033f0
	adds r2, r0, r1
	ldrb r1, [r2, 0x8]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _0801B938
	ldrb r0, [r2, 0x9]
	b _0801B93A
	.pool
_0801B938:
	movs r0, 0
_0801B93A:
	pop {r1}
	bx r1
	thumb_func_end mevent_081445C0

	thumb_func_start sub_801B940
sub_801B940: @ 801B940
	ldr r1, =gUnknown_02022C70
	movs r0, 0
	str r0, [r1]
	bx lr
	.pool
	thumb_func_end sub_801B940

	thumb_func_start sub_801B94C
sub_801B94C: @ 801B94C
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	adds r4, r0, 0
	ldr r5, =gUnknown_02022C70
	movs r0, 0
	str r0, [r5]
	cmp r4, 0
	beq _0801B98A
	bl sub_801B27C
	cmp r0, 0
	beq _0801B988
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, =0x000033f0
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r4
	bne _0801B988
	movs r0, 0x1
	str r0, [r5]
	b _0801B98A
	.pool
_0801B988:
	movs r0, 0
_0801B98A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_801B94C

	thumb_func_start sub_801B990
sub_801B990: @ 801B990
	push {lr}
	adds r2, r0, 0
	ldr r0, =gUnknown_02022C70
	ldr r0, [r0]
	cmp r0, 0
	beq _0801B9EC
	cmp r2, 0x1
	beq _0801B9DC
	cmp r2, 0x1
	bcc _0801B9C0
	cmp r2, 0x2
	bne _0801B9EC
	ldr r0, =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r0, =0x00003584
	adds r2, r0
	movs r0, 0x2
	b _0801B9CA
	.pool
_0801B9C0:
	ldr r0, =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r0, =0x00003570
	adds r2, r0
	movs r0, 0
_0801B9CA:
	movs r3, 0x5
	bl sub_801BA8C
	b _0801B9EC
	.pool
_0801B9DC:
	ldr r0, =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r0, =0x00003570
	adds r2, r0
	movs r0, 0x1
	movs r3, 0x5
	bl sub_801BA8C
_0801B9EC:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801B990

	thumb_func_start sub_801B9F8
sub_801B9F8: @ 801B9F8
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r0, =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r0, =0x00003570
	adds r1, r0
	ldr r2, =0x0500000a
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801B9F8

	thumb_func_start sub_801BA24
sub_801BA24: @ 801BA24
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r1, 0
	cmp r1, r2
	bge _0801BA46
	ldr r0, [r4]
	cmp r0, r5
	beq _0801BA46
	adds r3, r4, 0
_0801BA38:
	adds r3, 0x4
	adds r1, 0x1
	cmp r1, r2
	bge _0801BA46
	ldr r0, [r3]
	cmp r0, r5
	bne _0801BA38
_0801BA46:
	cmp r1, r2
	bne _0801BA68
	subs r3, r1, 0x1
	cmp r3, 0
	ble _0801BA62
	lsls r0, r3, 2
	subs r0, 0x4
	adds r2, r0, r4
_0801BA56:
	ldr r0, [r2]
	str r0, [r2, 0x4]
	subs r2, 0x4
	subs r3, 0x1
	cmp r3, 0
	bgt _0801BA56
_0801BA62:
	str r5, [r4]
	movs r0, 0x1
	b _0801BA84
_0801BA68:
	adds r3, r1, 0
	cmp r3, 0
	ble _0801BA80
	lsls r0, r3, 2
	subs r0, 0x4
	adds r2, r0, r4
_0801BA74:
	ldr r0, [r2]
	str r0, [r2, 0x4]
	subs r2, 0x4
	subs r3, 0x1
	cmp r3, 0
	bgt _0801BA74
_0801BA80:
	str r5, [r4]
	movs r0, 0
_0801BA84:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_801BA24

	thumb_func_start sub_801BA8C
sub_801BA8C: @ 801BA8C
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	adds r1, r2, 0
	adds r2, r3, 0
	bl sub_801BA24
	cmp r0, 0
	beq _0801BAA4
	adds r0, r4, 0
	bl sub_801B7D8
_0801BAA4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_801BA8C

	thumb_func_start sub_801BAAC
sub_801BAAC: @ 801BAAC
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	cmp r5, 0
	beq _0801BAC8
	cmp r6, 0
	beq _0801BAC8
	ldr r7, =gUnknown_02022C74
	ldr r0, =0x0000145c
	bl AllocZeroed
	str r0, [r7]
	cmp r0, 0
	bne _0801BAD4
_0801BAC8:
	movs r0, 0
	b _0801BB3E
	.pool
_0801BAD4:
	movs r4, 0xA6
	lsls r4, 1
	adds r1, r5, 0
	adds r2, r4, 0
	bl memcpy
	ldr r1, [r7]
	adds r1, r4
	adds r0, r6, 0
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldr r2, [r7]
	ldrb r1, [r2, 0x8]
	lsls r0, r1, 26
	lsrs r0, 28
	cmp r0, 0x7
	bls _0801BB06
	movs r0, 0x3D
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x8]
_0801BB06:
	ldr r2, [r7]
	ldrb r1, [r2, 0x8]
	lsls r0, r1, 30
	lsrs r0, 30
	cmp r0, 0x2
	bls _0801BB1A
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x8]
_0801BB1A:
	ldr r1, [r7]
	ldrb r0, [r1, 0x9]
	cmp r0, 0x7
	bls _0801BB26
	movs r0, 0
	strb r0, [r1, 0x9]
_0801BB26:
	ldr r0, [r7]
	movs r1, 0xB8
	lsls r1, 1
	adds r2, r0, r1
	ldrb r0, [r0, 0x8]
	lsls r0, 26
	lsrs r0, 28
	lsls r0, 4
	ldr r1, =gUnknown_082F1D60
	adds r0, r1
	str r0, [r2]
	movs r0, 0x1
_0801BB3E:
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801BAAC

	thumb_func_start sub_801BB48
sub_801BB48: @ 801BB48
	push {r4,lr}
	ldr r4, =gUnknown_02022C74
	ldr r0, [r4]
	cmp r0, 0
	beq _0801BB64
	ldr r2, =0x0000145c
	movs r1, 0
	bl memset
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
_0801BB64:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801BB48

	thumb_func_start sub_801BB74
sub_801BB74: @ 801BB74
	push {r4-r6,lr}
	sub sp, 0x24
	ldr r5, =gUnknown_02022C74
	ldr r0, [r5]
	cmp r0, 0
	bne _0801BB8C
	movs r0, 0x1
	negs r0, r0
	b _0801BD98
	.pool
_0801BB8C:
	movs r4, 0xBA
	lsls r4, 1
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x7
	bls _0801BB9A
	b _0801BD70
_0801BB9A:
	lsls r0, 2
	ldr r1, =_0801BBA8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801BBA8:
	.4byte _0801BBC8
	.4byte _0801BBDA
	.4byte _0801BBE8
	.4byte _0801BC8C
	.4byte _0801BD14
	.4byte _0801BD1A
	.4byte _0801BD34
	.4byte _0801BD3A
_0801BBC8:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0801BD86
_0801BBDA:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0801BBE6
	b _0801BD86
_0801BBE6:
	b _0801BD96
_0801BBE8:
	movs r5, 0x1E
	str r5, [sp]
	movs r4, 0x14
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	ldr r5, =gUnknown_02022C74
	ldr r0, [r5]
	movs r1, 0xB8
	lsls r1, 1
	adds r0, r1
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0x8
	bl decompress_and_copy_tile_data_to_vram
	ldr r4, =gUnknown_082F0E1C
	adds r0, r4, 0
	bl AddWindow
	ldr r1, [r5]
	movs r2, 0xBB
	lsls r2, 1
	adds r1, r2
	strh r0, [r1]
	adds r0, r4, 0
	adds r0, 0x8
	bl AddWindow
	ldr r1, [r5]
	movs r2, 0xBC
	lsls r2, 1
	adds r1, r2
	strh r0, [r1]
	adds r4, 0x10
	adds r0, r4, 0
	bl AddWindow
	ldr r1, [r5]
	movs r2, 0xBD
	lsls r2, 1
	adds r1, r2
	strh r0, [r1]
	b _0801BD86
	.pool
_0801BC8C:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _0801BC9A
	b _0801BD96
_0801BC9A:
	movs r0, 0x1
	bl stdpal_get
	movs r1, 0x20
	movs r2, 0x20
	bl LoadPalette
	ldr r2, =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r5, =gUnknown_02022C74
	ldr r0, [r5]
	movs r4, 0xB8
	lsls r4, 1
	adds r0, r4
	ldr r0, [r0]
	ldr r0, [r0, 0xC]
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	ldr r1, [r5]
	adds r4, r1, r4
	ldr r0, [r4]
	ldr r0, [r0, 0x8]
	ldr r4, =0x0000045c
	adds r1, r4
	bl LZ77UnCompWram
	ldr r1, [r5]
	adds r1, r4
	movs r2, 0x1E
	str r2, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	str r6, [sp, 0xC]
	str r2, [sp, 0x10]
	str r0, [sp, 0x14]
	movs r0, 0x1
	str r0, [sp, 0x18]
	movs r0, 0x8
	str r0, [sp, 0x1C]
	str r6, [sp, 0x20]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl CopyRectToBgTilemapBufferRect
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	b _0801BD86
	.pool
_0801BD14:
	bl sub_801BEF8
	b _0801BD86
_0801BD1A:
	movs r0, 0
	bl sub_801C178
	movs r0, 0x1
	bl sub_801C178
	movs r0, 0x2
	bl sub_801C178
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	b _0801BD86
_0801BD34:
	bl sub_80D2F04
	b _0801BD86
_0801BD3A:
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	ldr r2, =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	bl sub_801C4C0
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	bl UpdatePaletteFade
	b _0801BD86
	.pool
_0801BD70:
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0801BD96
	ldr r0, [r5]
	adds r0, r4
	strb r1, [r0]
	movs r0, 0x1
	b _0801BD98
_0801BD86:
	ldr r0, =gUnknown_02022C74
	ldr r1, [r0]
	movs r0, 0xBA
	lsls r0, 1
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0801BD96:
	movs r0, 0
_0801BD98:
	add sp, 0x24
	pop {r4-r6}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801BB74

	thumb_func_start sub_801BDA4
sub_801BDA4: @ 801BDA4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r2, r0, 0
	ldr r5, =gUnknown_02022C74
	ldr r0, [r5]
	cmp r0, 0
	bne _0801BDBC
	movs r0, 0x1
	negs r0, r0
	b _0801BEEC
	.pool
_0801BDBC:
	movs r4, 0xBA
	lsls r4, 1
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x5
	bls _0801BDCA
	b _0801BEC4
_0801BDCA:
	lsls r0, 2
	ldr r1, =_0801BDD8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801BDD8:
	.4byte _0801BDF0
	.4byte _0801BE02
	.4byte _0801BE0E
	.4byte _0801BE56
	.4byte _0801BE94
	.4byte _0801BE9E
_0801BDF0:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0801BEDA
_0801BE02:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	beq _0801BEDA
	b _0801BEEA
_0801BE0E:
	movs r5, 0x1E
	str r5, [sp]
	movs r4, 0x14
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	b _0801BEDA
_0801BE56:
	movs r0, 0x1
	bl HideBg
	movs r0, 0x2
	bl HideBg
	ldr r4, =gUnknown_02022C74
	ldr r0, [r4]
	movs r1, 0xBD
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r0, [r4]
	movs r1, 0xBC
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r0, [r4]
	movs r1, 0xBB
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	bl RemoveWindow
	b _0801BEDA
	.pool
_0801BE94:
	bl sub_801C61C
	bl sub_80D2F9C
	b _0801BEDA
_0801BE9E:
	ldr r0, =gUnknown_02022C60
	ldrb r0, [r0]
	adds r1, r2, 0
	bl sub_80186EC
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _0801BEDA
	.pool
_0801BEC4:
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0801BEEA
	ldr r0, [r5]
	adds r0, r4
	strb r1, [r0]
	movs r0, 0x1
	b _0801BEEC
_0801BEDA:
	ldr r0, =gUnknown_02022C74
	ldr r1, [r0]
	movs r0, 0xBA
	lsls r0, 1
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0801BEEA:
	movs r0, 0
_0801BEEC:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801BDA4

	thumb_func_start sub_801BEF8
sub_801BEF8: @ 801BEF8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r5, 0
	mov r0, sp
	movs r1, 0
	movs r2, 0x6
	bl memset
	ldr r4, =gUnknown_02022C74
	ldr r1, [r4]
	ldr r2, =0x0000018b
	adds r0, r1, r2
	adds r1, 0xA
	movs r2, 0x28
	bl memcpy
	ldr r0, [r4]
	ldr r3, =0x000001b3
	adds r1, r0, r3
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, [r4]
	movs r2, 0xDA
	lsls r2, 1
	adds r0, r1, r2
	adds r1, 0x32
	movs r2, 0x28
	bl memcpy
	ldr r0, [r4]
	movs r3, 0xEE
	lsls r3, 1
	adds r0, r3
	movs r1, 0x1
	negs r1, r1
	strb r1, [r0]
	ldr r1, [r4]
	ldr r0, [r1, 0x4]
	ldr r2, =0x000f423f
	cmp r0, r2
	bls _0801BF54
	str r2, [r1, 0x4]
_0801BF54:
	ldr r1, [r4]
	ldr r2, =0x000001dd
	adds r0, r1, r2
	ldr r1, [r1, 0x4]
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	adds r6, r4, 0
_0801BF66:
	ldr r2, [r6]
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r5
	adds r0, r4, r2
	movs r3, 0xF2
	lsls r3, 1
	adds r0, r3
	adds r1, r2
	adds r1, 0x5A
	movs r2, 0x28
	bl memcpy
	ldr r1, [r6]
	movs r0, 0x83
	lsls r0, 2
	adds r1, r0
	adds r1, r4
	movs r2, 0x1
	negs r2, r2
	adds r7, r2, 0
	movs r0, 0xFF
	strb r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _0801BF66
	ldr r6, =gUnknown_02022C74
	ldr r1, [r6]
	movs r3, 0xA2
	lsls r3, 2
	adds r0, r1, r3
	adds r1, 0xFA
	movs r2, 0x28
	bl memcpy
	ldr r0, [r6]
	movs r4, 0xAC
	lsls r4, 2
	adds r0, r4
	movs r1, 0x1
	negs r1, r1
	adds r4, r1, 0
	movs r1, 0xFF
	strb r1, [r0]
	ldr r1, [r6]
	ldrb r0, [r1, 0x8]
	lsls r0, 30
	lsrs r0, 30
	cmp r0, 0x1
	beq _0801C018
	cmp r0, 0x1
	bgt _0801BFF0
	cmp r0, 0
	beq _0801BFF6
	b _0801C168
	.pool
_0801BFF0:
	cmp r0, 0x2
	beq _0801C028
	b _0801C168
_0801BFF6:
	ldr r2, =0x000002b1
	adds r0, r1, r2
	movs r3, 0x91
	lsls r3, 1
	adds r1, r3
	movs r2, 0x28
	bl memcpy
	ldr r1, [r6]
	ldr r0, =0x000002d9
	adds r1, r0
	b _0801C01C
	.pool
_0801C018:
	ldr r2, =0x000002b1
	adds r1, r2
_0801C01C:
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	b _0801C168
	.pool
_0801C028:
	ldr r3, =0x000002b1
	adds r0, r1, r3
	ldrb r1, [r0]
	orrs r1, r7
	strb r1, [r0]
	mov r3, sp
	ldr r1, [r6]
	movs r4, 0xA6
	lsls r4, 1
	adds r0, r1, r4
	ldrh r0, [r0]
	ldr r2, =0x000003e7
	cmp r0, r2
	bls _0801C046
	adds r0, r2, 0
_0801C046:
	strh r0, [r3]
	mov r3, sp
	movs r4, 0xA7
	lsls r4, 1
	adds r0, r1, r4
	ldrh r0, [r0]
	cmp r0, r2
	bls _0801C058
	adds r0, r2, 0
_0801C058:
	strh r0, [r3, 0x2]
	mov r3, sp
	movs r4, 0xA8
	lsls r4, 1
	adds r0, r1, r4
	ldrh r0, [r0]
	cmp r0, r2
	bls _0801C06A
	adds r0, r2, 0
_0801C06A:
	strh r0, [r3, 0x4]
	movs r5, 0
_0801C06E:
	lsls r4, r5, 1
	adds r4, r5
	lsls r4, 4
	movs r0, 0xB7
	lsls r0, 2
	adds r4, r0
	ldr r0, [r6]
	adds r0, r4
	adds r0, 0x2A
	movs r1, 0xFF
	movs r2, 0x4
	bl memset
	ldr r0, [r6]
	adds r0, r4
	adds r0, 0x1
	movs r1, 0xFF
	movs r2, 0x29
	bl memset
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x7
	bls _0801C06E
	movs r5, 0
	movs r6, 0
	ldr r1, =gUnknown_02022C74
	mov r8, r1
	movs r2, 0x91
	lsls r2, 1
	mov r10, r2
	ldr r7, =0x00000175
	movs r3, 0xB7
	lsls r3, 2
	mov r9, r3
_0801C0B6:
	mov r4, r8
	ldr r2, [r4]
	mov r0, r10
	adds r1, r2, r0
	adds r0, r1, r5
	ldrb r3, [r0]
	cmp r3, 0xF7
	beq _0801C0F8
	ldr r1, =0x00000175
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 4
	adds r0, r6, r0
	ldr r4, =0x000002dd
	adds r1, r2, r4
	adds r1, r0
	strb r3, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	b _0801C15E
	.pool
_0801C0F8:
	adds r0, r5, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	cmp r3, 0x2
	bls _0801C108
	adds r0, r5, 0x2
	lsls r0, 16
	b _0801C15C
_0801C108:
	adds r0, r2, r7
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 4
	add r0, r9
	adds r0, r2, r0
	adds r0, 0x2A
	lsls r1, r3, 1
	add r1, sp
	ldrh r1, [r1]
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	mov r0, r8
	ldr r1, [r0]
	adds r0, r1, r7
	ldrb r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 4
	adds r0, r1, r0
	adds r4, r5, 0x2
	add r1, r10
	adds r1, r4
	ldrb r1, [r1]
	add r0, r9
	strb r1, [r0]
	mov r2, r8
	ldr r1, [r2]
	adds r1, r7
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, r7
	ldrb r0, [r0]
	cmp r0, 0x7
	bhi _0801C168
	movs r6, 0
	lsls r0, r4, 16
_0801C15C:
	lsrs r5, r0, 16
_0801C15E:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x27
	bls _0801C0B6
_0801C168:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_801BEF8

	thumb_func_start sub_801C178
sub_801C178: @ 801C178
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r4, r0, 24
	mov r8, r4
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r7, =gUnknown_02022C74
	ldr r0, [r7]
	lsls r1, r4, 1
	movs r2, 0xBB
	lsls r2, 1
	adds r0, r2
	adds r0, r1
	ldrh r0, [r0]
	lsls r6, r0, 24
	lsrs r5, r6, 24
	adds r0, r5, 0
	bl PutWindowTilemap
	adds r0, r5, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	cmp r4, 0x1
	beq _0801C2A0
	cmp r4, 0x1
	bgt _0801C1C4
	cmp r4, 0
	beq _0801C1D0
	mov r9, r6
	b _0801C498
	.pool
_0801C1C4:
	mov r0, r8
	cmp r0, 0x2
	bne _0801C1CC
	b _0801C304
_0801C1CC:
	mov r9, r6
	b _0801C498
_0801C1D0:
	ldr r2, [r7]
	movs r1, 0xB8
	lsls r1, 1
	mov r10, r1
	adds r0, r2, r1
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 28
	lsrs r0, 28
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, =gUnknown_082F0E10
	mov r8, r0
	add r1, r8
	str r1, [sp]
	ldr r1, [sp, 0xC]
	str r1, [sp, 0x4]
	ldr r0, =0x0000018b
	adds r2, r0
	str r2, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0x3
	movs r2, 0
	movs r3, 0x1
	bl box_print
	ldr r4, [r7]
	movs r1, 0xDA
	lsls r1, 1
	mov r9, r1
	add r4, r9
	movs r0, 0x3
	movs r1, 0x2
	bl GetFontAttribute
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x3
	adds r1, r4, 0
	bl GetStringWidth
	movs r1, 0xA0
	subs r1, r0
	cmp r1, 0
	bge _0801C22E
	movs r1, 0
_0801C22E:
	lsls r2, r1, 24
	lsrs r2, 24
	ldr r3, [r7]
	mov r1, r10
	adds r0, r3, r1
	ldr r0, [r0]
	ldrb r1, [r0]
	lsls r1, 28
	lsrs r1, 28
	lsls r0, r1, 1
	adds r0, r1
	add r0, r8
	str r0, [sp]
	ldr r0, [sp, 0xC]
	str r0, [sp, 0x4]
	add r3, r9
	str r3, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0x3
	movs r3, 0x11
	bl box_print
	ldr r2, [r7]
	ldr r0, [r2, 0x4]
	mov r9, r6
	cmp r0, 0
	bne _0801C266
	b _0801C498
_0801C266:
	mov r1, r10
	adds r0, r2, r1
	ldr r0, [r0]
	ldrb r1, [r0]
	lsls r1, 28
	lsrs r1, 28
	lsls r0, r1, 1
	adds r0, r1
	add r0, r8
	str r0, [sp]
	ldr r0, [sp, 0xC]
	str r0, [sp, 0x4]
	ldr r1, =0x000001dd
	adds r0, r2, r1
	str r0, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0xA6
	movs r3, 0x11
	bl box_print
	b _0801C498
	.pool
_0801C2A0:
	mov r9, r6
_0801C2A2:
	ldr r2, [sp, 0xC]
	lsls r4, r2, 24
	asrs r4, 24
	lsls r3, r4, 4
	adds r3, 0x2
	lsls r3, 24
	lsrs r3, 24
	ldr r0, =gUnknown_02022C74
	ldr r2, [r0]
	movs r1, 0xB8
	lsls r1, 1
	adds r0, r2, r1
	ldr r0, [r0]
	ldrb r0, [r0]
	lsrs r0, 4
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, =gUnknown_082F0E10
	adds r1, r0
	str r1, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r4
	movs r1, 0xF2
	lsls r1, 1
	adds r0, r1
	adds r2, r0
	str r2, [sp, 0x8]
	mov r2, r9
	lsrs r0, r2, 24
	movs r1, 0x3
	movs r2, 0
	bl box_print
	adds r4, 0x1
	lsls r4, 24
	lsrs r0, r4, 24
	str r0, [sp, 0xC]
	asrs r4, 24
	cmp r4, 0x3
	ble _0801C2A2
	b _0801C498
	.pool
_0801C304:
	ldr r4, =gUnknown_082F0E18
	ldr r2, [r7]
	ldrb r0, [r2, 0x8]
	lsls r0, 30
	lsrs r0, 30
	adds r0, r4
	ldrb r3, [r0]
	movs r1, 0xB8
	lsls r1, 1
	adds r0, r2, r1
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	lsls r0, 28
	lsrs r0, 28
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, =gUnknown_082F0E10
	mov r10, r0
	add r1, r10
	str r1, [sp]
	ldr r1, [sp, 0xC]
	str r1, [sp, 0x4]
	movs r1, 0xA2
	lsls r1, 2
	adds r0, r2, r1
	str r0, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0x3
	movs r2, 0
	bl box_print
	ldr r2, [r7]
	ldrb r1, [r2, 0x8]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x2
	beq _0801C398
	lsls r0, r1, 30
	lsrs r0, 30
	adds r0, r4
	ldrb r3, [r0]
	adds r3, 0x10
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0xB8
	lsls r1, 1
	adds r0, r2, r1
	ldr r0, [r0]
	ldrb r1, [r0, 0x1]
	lsls r1, 28
	lsrs r1, 28
	lsls r0, r1, 1
	adds r0, r1
	add r0, r10
	str r0, [sp]
	ldr r0, [sp, 0xC]
	str r0, [sp, 0x4]
	ldr r1, =0x000002b1
	adds r0, r2, r1
	str r0, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0x3
	movs r2, 0
	bl box_print
	mov r9, r6
	b _0801C498
	.pool
_0801C398:
	movs r2, 0
	mov r8, r2
	lsls r0, r1, 30
	lsrs r0, 30
	adds r0, r4
	ldrb r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
	movs r0, 0x3
	movs r1, 0x2
	bl GetFontAttribute
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, [r7]
	ldr r1, =0x00000175
	adds r0, r1
	mov r9, r6
	ldr r1, [sp, 0xC]
	ldrb r0, [r0]
	cmp r1, r0
	bge _0801C498
	str r5, [sp, 0x10]
	lsls r0, r4, 24
	lsrs r0, 24
	str r0, [sp, 0x14]
	mov r10, r2
_0801C3CE:
	mov r0, r8
	lsls r2, r0, 24
	lsrs r2, 24
	ldr r3, [r7]
	movs r1, 0xB8
	lsls r1, 1
	adds r0, r3, r1
	ldr r0, [r0]
	ldrb r1, [r0, 0x1]
	lsls r1, 28
	lsrs r1, 28
	lsls r0, r1, 1
	adds r0, r1
	ldr r1, =gUnknown_082F0E10
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r1, [sp, 0xC]
	lsls r0, r1, 24
	asrs r6, r0, 24
	lsls r0, r6, 1
	adds r0, r6
	lsls r5, r0, 4
	movs r0, 0xB7
	lsls r0, 2
	adds r4, r5, r0
	adds r3, r4
	adds r3, 0x1
	str r3, [sp, 0x8]
	ldr r0, [sp, 0x10]
	movs r1, 0x3
	ldr r3, [sp, 0x14]
	bl box_print
	ldr r1, [r7]
	adds r0, r1, r5
	ldr r2, =0x00000306
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _0801C482
	adds r1, r4
	adds r1, 0x1
	movs r0, 0x3
	mov r2, r10
	bl GetStringWidth
	add r8, r0
	mov r0, r8
	lsls r2, r0, 24
	lsrs r2, 24
	ldr r3, [r7]
	movs r1, 0xB8
	lsls r1, 1
	adds r0, r3, r1
	ldr r0, [r0]
	ldrb r1, [r0, 0x1]
	lsls r1, 28
	lsrs r1, 28
	lsls r0, r1, 1
	adds r0, r1
	ldr r1, =gUnknown_082F0E10
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	adds r3, r4
	adds r3, 0x2A
	str r3, [sp, 0x8]
	ldr r0, [sp, 0x10]
	movs r1, 0x3
	ldr r3, [sp, 0x14]
	bl box_print
	ldr r1, [r7]
	adds r1, r4
	adds r1, 0x2A
	movs r0, 0x3
	mov r2, r10
	bl GetStringWidth
	ldr r1, [r7]
	adds r1, r5
	movs r2, 0xB7
	lsls r2, 2
	adds r1, r2
	ldrb r1, [r1]
	adds r0, r1
	add r8, r0
_0801C482:
	adds r1, r6, 0x1
	lsls r1, 24
	lsrs r0, r1, 24
	str r0, [sp, 0xC]
	asrs r1, 24
	ldr r0, [r7]
	ldr r2, =0x00000175
	adds r0, r2
	ldrb r0, [r0]
	cmp r1, r0
	blt _0801C3CE
_0801C498:
	mov r1, r9
	lsrs r0, r1, 24
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801C178

	thumb_func_start sub_801C4C0
sub_801C4C0: @ 801C4C0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r7, 0
	ldr r4, =gUnknown_02022C74
	ldr r0, [r4]
	movs r1, 0xBE
	lsls r1, 1
	adds r0, r1
	movs r1, 0xFF
	strb r1, [r0]
	ldr r0, [r4]
	movs r2, 0xA9
	lsls r2, 1
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, 0
	beq _0801C52C
	bl sub_80D2E84
	lsls r0, 16
	lsrs r0, 16
	ldr r1, =DummyObjectCallback
	str r7, [sp]
	str r7, [sp, 0x4]
	movs r2, 0xDC
	movs r3, 0x14
	bl sub_80D2D78
	ldr r1, [r4]
	movs r2, 0xBE
	lsls r2, 1
	adds r1, r2
	strb r0, [r1]
	ldr r2, =gUnknown_02020630
	ldr r0, [r4]
	movs r1, 0xBE
	lsls r1, 1
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x5]
_0801C52C:
	ldr r1, [r4]
	ldrb r0, [r1, 0x9]
	cmp r0, 0
	beq _0801C5EE
	ldrb r1, [r1, 0x8]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _0801C5EE
	ldr r0, =gUnknown_082F1D00
	bl LoadCompressedObjectPicUsingHeap
	ldr r0, [r4]
	movs r2, 0xB8
	lsls r2, 1
	adds r0, r2
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	lsrs r0, 4
	lsls r0, 3
	ldr r1, =gUnknown_082F1D08
	adds r0, r1
	bl LoadTaggedObjectPalette
	ldr r0, [r4]
	ldrb r0, [r0, 0x9]
	cmp r7, r0
	bcs _0801C5EE
	adds r6, r4, 0
	ldr r0, =0x0000017d
	mov r10, r0
	movs r1, 0
	mov r9, r1
	movs r2, 0xFF
	mov r8, r2
_0801C572:
	ldr r1, [r6]
	lsls r4, r7, 1
	add r1, r10
	adds r1, r4
	ldrb r0, [r1]
	mov r2, r8
	orrs r0, r2
	strb r0, [r1]
	ldr r1, [r6]
	movs r0, 0xBF
	lsls r0, 1
	adds r1, r0
	adds r1, r4
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	lsls r1, r7, 5
	movs r0, 0xD8
	subs r5, r0, r1
	ldr r0, =gUnknown_082F1D48
	adds r1, r5, 0
	movs r2, 0x90
	movs r3, 0x8
	bl AddObjectToFront
	ldr r1, [r6]
	add r1, r10
	adds r1, r4
	strb r0, [r1]
	ldr r0, [r6]
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r1
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, 0
	beq _0801C5E0
	bl sub_80D2E84
	lsls r0, 16
	lsrs r0, 16
	mov r2, r9
	str r2, [sp]
	str r2, [sp, 0x4]
	ldr r1, =DummyObjectCallback
	adds r2, r5, 0
	movs r3, 0x88
	bl sub_80D2D78
	ldr r1, [r6]
	movs r2, 0xBF
	lsls r2, 1
	adds r1, r2
	adds r1, r4
	strb r0, [r1]
_0801C5E0:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, [r6]
	ldrb r0, [r0, 0x9]
	cmp r7, r0
	bcc _0801C572
_0801C5EE:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801C4C0

	thumb_func_start sub_801C61C
sub_801C61C: @ 801C61C
	push {r4-r7,lr}
	movs r5, 0
	ldr r4, =gUnknown_02022C74
	ldr r0, [r4]
	movs r2, 0xBE
	lsls r2, 1
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _0801C640
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, =gUnknown_02020630
	adds r0, r1
	bl sub_80D2EF8
_0801C640:
	ldr r0, [r4]
	ldrb r2, [r0, 0x9]
	cmp r2, 0
	beq _0801C6B4
	ldrb r1, [r0, 0x8]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _0801C6B4
	cmp r5, r2
	bcs _0801C6A4
	adds r6, r4, 0
	ldr r7, =gUnknown_02020630
_0801C65A:
	ldr r0, [r6]
	lsls r4, r5, 1
	ldr r1, =0x0000017d
	adds r0, r1
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _0801C678
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	bl RemoveObjectAndFreeTiles
_0801C678:
	ldr r0, [r6]
	movs r2, 0xBF
	lsls r2, 1
	adds r0, r2
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _0801C696
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	bl sub_80D2EF8
_0801C696:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r6]
	ldrb r0, [r0, 0x9]
	cmp r5, r0
	bcc _0801C65A
_0801C6A4:
	movs r4, 0x80
	lsls r4, 8
	adds r0, r4, 0
	bl FreeObjectTilesByTag
	adds r0, r4, 0
	bl FreeObjectPaletteByTag
_0801C6B4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801C61C

	thumb_func_start sub_801C6C8
sub_801C6C8: @ 801C6C8
	push {r4-r6,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _0801C6DE
	ldr r5, =gUnknown_02022C78
	ldr r0, =0x000013a4
	bl AllocZeroed
	str r0, [r5]
	cmp r0, 0
	bne _0801C6EC
_0801C6DE:
	movs r0, 0
	b _0801C71C
	.pool
_0801C6EC:
	movs r6, 0xDE
	lsls r6, 1
	adds r1, r4, 0
	adds r2, r6, 0
	bl memcpy
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	cmp r0, 0x7
	bls _0801C704
	movs r0, 0
	strb r0, [r1, 0x3]
_0801C704:
	ldr r2, [r5]
	adds r3, r2, r6
	ldrb r0, [r2, 0x3]
	lsls r0, 4
	ldr r1, =gUnknown_082F24C8
	adds r0, r1
	str r0, [r3]
	ldr r0, =0x000001c1
	adds r1, r2, r0
	movs r0, 0xFF
	strb r0, [r1]
	movs r0, 0x1
_0801C71C:
	pop {r4-r6}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801C6C8

	thumb_func_start sub_801C72C
sub_801C72C: @ 801C72C
	push {r4,lr}
	ldr r4, =gUnknown_02022C78
	ldr r0, [r4]
	cmp r0, 0
	beq _0801C748
	ldr r2, =0x000013a4
	movs r1, 0
	bl memset
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
_0801C748:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801C72C

	thumb_func_start sub_801C758
sub_801C758: @ 801C758
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	ldr r5, =gUnknown_02022C78
	ldr r0, [r5]
	cmp r0, 0
	bne _0801C778
	movs r0, 0x1
	negs r0, r0
	b _0801CA3A
	.pool
_0801C778:
	movs r4, 0xE0
	lsls r4, 1
	adds r0, r4
	ldrb r0, [r0]
	lsrs r0, 1
	cmp r0, 0x6
	bls _0801C788
	b _0801CA04
_0801C788:
	lsls r0, 2
	ldr r1, =_0801C798
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801C798:
	.4byte _0801C7B4
	.4byte _0801C7C6
	.4byte _0801C82C
	.4byte _0801C8D4
	.4byte _0801C990
	.4byte _0801C996
	.4byte _0801C9A8
_0801C7B4:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0801CA1E
_0801C7C6:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	beq _0801C7D2
	b _0801CA38
_0801C7D2:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x40
	movs r1, 0xF0
	bl SetGpuReg
	ldr r1, =0x00001a98
	movs r0, 0x44
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0x1F
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x1B
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl SetGpuRegBits
	b _0801CA1E
	.pool
_0801C82C:
	movs r5, 0x1E
	str r5, [sp]
	movs r4, 0x14
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	ldr r5, =gUnknown_02022C78
	ldr r0, [r5]
	movs r1, 0xDE
	lsls r1, 1
	adds r0, r1
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0x8
	bl decompress_and_copy_tile_data_to_vram
	ldr r4, =gUnknown_082F1DE8
	adds r0, r4, 0
	bl AddWindow
	ldr r1, [r5]
	movs r2, 0xE4
	lsls r2, 1
	adds r1, r2
	strh r0, [r1]
	adds r4, 0x8
	adds r0, r4, 0
	bl AddWindow
	ldr r1, [r5]
	movs r3, 0xE5
	lsls r3, 1
	adds r1, r3
	strh r0, [r1]
	b _0801CA1E
	.pool
_0801C8D4:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0
	beq _0801C8E2
	b _0801CA38
_0801C8E2:
	movs r0, 0x1
	bl stdpal_get
	movs r1, 0x20
	movs r2, 0x20
	bl LoadPalette
	ldr r2, =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r0, =gUnknown_02022C78
	mov r8, r0
	ldr r0, [r0]
	movs r4, 0xDE
	lsls r4, 1
	adds r0, r4
	ldr r0, [r0]
	ldr r0, [r0, 0xC]
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	mov r2, r8
	ldr r1, [r2]
	adds r4, r1, r4
	ldr r0, [r4]
	ldr r0, [r0, 0x8]
	movs r6, 0xE9
	lsls r6, 2
	adds r1, r6
	bl LZ77UnCompWram
	mov r3, r8
	ldr r1, [r3]
	adds r1, r6
	movs r4, 0x1E
	str r4, [sp]
	movs r5, 0x3
	str r5, [sp, 0x4]
	str r7, [sp, 0x8]
	str r7, [sp, 0xC]
	str r4, [sp, 0x10]
	str r5, [sp, 0x14]
	movs r0, 0x1
	mov r10, r0
	str r0, [sp, 0x18]
	movs r2, 0x8
	mov r9, r2
	str r2, [sp, 0x1C]
	str r7, [sp, 0x20]
	movs r2, 0
	movs r3, 0
	bl CopyRectToBgTilemapBufferRect
	mov r3, r8
	ldr r1, [r3]
	adds r1, r6
	str r4, [sp]
	movs r0, 0x17
	str r0, [sp, 0x4]
	str r7, [sp, 0x8]
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	str r0, [sp, 0x14]
	mov r0, r10
	str r0, [sp, 0x18]
	mov r2, r9
	str r2, [sp, 0x1C]
	str r7, [sp, 0x20]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0x3
	bl CopyRectToBgTilemapBufferRect
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	b _0801CA1E
	.pool
_0801C990:
	bl sub_801CDCC
	b _0801CA1E
_0801C996:
	bl sub_801CE7C
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	b _0801CA1E
_0801C9A8:
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	ldr r2, =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r4, =gUnknown_02022C78
	ldr r1, [r4]
	movs r3, 0xE5
	lsls r3, 2
	adds r0, r1, r3
	movs r2, 0xE3
	lsls r2, 1
	adds r1, r2
	bl AddScrollIndicatorArrowPair
	ldr r1, [r4]
	ldr r3, =0x000001c1
	adds r2, r1, r3
	movs r1, 0
	strb r0, [r2]
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	bl UpdatePaletteFade
	b _0801CA1E
	.pool
_0801CA04:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0801CA38
	ldr r0, [r5]
	adds r0, r4
	ldrb r2, [r0]
	movs r1, 0x1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0x1
	b _0801CA3A
_0801CA1E:
	ldr r0, =gUnknown_02022C78
	ldr r2, [r0]
	movs r0, 0xE0
	lsls r0, 1
	adds r2, r0
	ldrb r3, [r2]
	lsrs r1, r3, 1
	adds r1, 0x1
	lsls r1, 1
	movs r0, 0x1
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_0801CA38:
	movs r0, 0
_0801CA3A:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801C758

	thumb_func_start sub_801CA50
sub_801CA50: @ 801CA50
	push {r4,r5,lr}
	sub sp, 0x8
	adds r2, r0, 0
	ldr r5, =gUnknown_02022C78
	ldr r0, [r5]
	cmp r0, 0
	bne _0801CA68
	movs r0, 0x1
	negs r0, r0
	b _0801CC2A
	.pool
_0801CA68:
	movs r4, 0xE0
	lsls r4, 1
	adds r0, r4
	ldrb r0, [r0]
	lsrs r0, 1
	cmp r0, 0x5
	bls _0801CA78
	b _0801CBF4
_0801CA78:
	lsls r0, 2
	ldr r1, =_0801CA88
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801CA88:
	.4byte _0801CAA0
	.4byte _0801CAB2
	.4byte _0801CAF4
	.4byte _0801CB54
	.4byte _0801CB84
	.4byte _0801CBC0
_0801CAA0:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0801CC0E
_0801CAB2:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	beq _0801CABE
	b _0801CC28
_0801CABE:
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl ClearGpuRegBits
	b _0801CC0E
_0801CAF4:
	movs r4, 0x1E
	str r4, [sp]
	movs r5, 0x14
	str r5, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	movs r5, 0x18
	str r5, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	b _0801CC0E
_0801CB54:
	movs r0, 0x1
	bl HideBg
	movs r0, 0x2
	bl HideBg
	ldr r4, =gUnknown_02022C78
	ldr r0, [r4]
	movs r1, 0xE5
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r0, [r4]
	movs r2, 0xE4
	lsls r2, 1
	adds r0, r2
	ldrb r0, [r0]
	bl RemoveWindow
	b _0801CC0E
	.pool
_0801CB84:
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	ldr r4, =gUnknown_02022C78
	ldr r0, [r4]
	ldr r2, =0x000001c1
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _0801CC0E
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	ldr r2, =0x000001c1
	adds r1, r0, r2
	movs r0, 0xFF
	strb r0, [r1]
	b _0801CC0E
	.pool
_0801CBC0:
	ldr r0, =gUnknown_02022C60
	ldrb r0, [r0]
	adds r1, r2, 0
	bl sub_80186EC
	movs r0, 0x3
	bl sub_8018798
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _0801CC0E
	.pool
_0801CBF4:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0801CC28
	ldr r0, [r5]
	adds r0, r4
	ldrb r2, [r0]
	movs r1, 0x1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0x1
	b _0801CC2A
_0801CC0E:
	ldr r0, =gUnknown_02022C78
	ldr r2, [r0]
	movs r0, 0xE0
	lsls r0, 1
	adds r2, r0
	ldrb r3, [r2]
	lsrs r1, r3, 1
	adds r1, 0x1
	lsls r1, 1
	movs r0, 0x1
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_0801CC28:
	movs r0, 0
_0801CC2A:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801CA50

	thumb_func_start sub_801CC38
sub_801CC38: @ 801CC38
	push {r4,r5,lr}
	ldr r4, =gUnknown_02022C78
	ldr r2, [r4]
	movs r5, 0xE0
	lsls r5, 1
	adds r0, r2, r5
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0801CC72
	ldr r0, =0x000001c1
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _0801CC72
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	ldr r2, =0x000001c1
	adds r1, r0, r2
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1]
_0801CC72:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801CC38

	thumb_func_start sub_801CC80
sub_801CC80: @ 801CC80
	push {r4,lr}
	ldr r4, =gUnknown_02022C78
	ldr r2, [r4]
	movs r1, 0xE0
	lsls r1, 1
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0801CCC0
	movs r3, 0xE5
	lsls r3, 2
	adds r0, r2, r3
	movs r3, 0xE3
	lsls r3, 1
	adds r1, r2, r3
	bl AddScrollIndicatorArrowPair
	ldr r1, [r4]
	ldr r2, =0x000001c1
	adds r1, r2
	strb r0, [r1]
	ldr r1, [r4]
	movs r3, 0xE0
	lsls r3, 1
	adds r1, r3
	ldrb r2, [r1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
_0801CCC0:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801CC80

	thumb_func_start sub_801CCD0
sub_801CCD0: @ 801CCD0
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r3, r4, 0
	ldr r2, =gUnknown_02022C78
	ldr r0, [r2]
	mov r12, r0
	movs r0, 0xE1
	lsls r0, 1
	add r0, r12
	ldrb r1, [r0]
	movs r5, 0x1
	adds r0, r5, 0
	ands r0, r1
	adds r6, r2, 0
	cmp r0, 0
	beq _0801CD00
	bl sub_801CFA4
_0801CCF6:
	movs r0, 0xFF
	b _0801CDC6
	.pool
_0801CD00:
	cmp r4, 0x2
	beq _0801CD1C
	cmp r4, 0x2
	bgt _0801CD0E
	cmp r4, 0x1
	beq _0801CD18
	b _0801CCF6
_0801CD0E:
	cmp r3, 0x40
	beq _0801CD20
	cmp r3, 0x80
	beq _0801CD50
	b _0801CCF6
_0801CD18:
	movs r0, 0
	b _0801CDC6
_0801CD1C:
	movs r0, 0x1
	b _0801CDC6
_0801CD20:
	movs r0, 0xE3
	lsls r0, 1
	add r0, r12
	ldrh r0, [r0]
	cmp r0, 0
	beq _0801CCF6
	movs r0, 0xE0
	lsls r0, 1
	add r0, r12
	ldrb r1, [r0]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _0801CCF6
	ldr r2, =0x000001c3
	add r2, r12
	ldrb r1, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	b _0801CD7E
	.pool
_0801CD50:
	movs r0, 0xE3
	lsls r0, 1
	add r0, r12
	movs r1, 0xE2
	lsls r1, 1
	add r1, r12
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	beq _0801CCF6
	movs r0, 0xE0
	lsls r0, 1
	add r0, r12
	ldrb r1, [r0]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _0801CCF6
	ldr r2, =0x000001c3
	add r2, r12
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
_0801CD7E:
	strb r0, [r2]
	ldr r2, [r6]
	movs r4, 0xE1
	lsls r4, 1
	adds r2, r4
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r3, [r6]
	adds r3, r4
	ldrb r1, [r3]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	ldr r1, [r6]
	adds r4, 0x1
	adds r1, r4
	ldrb r3, [r1]
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	ands r2, r0
	cmp r2, 0
	beq _0801CDC4
	movs r0, 0x3
	b _0801CDC6
	.pool
_0801CDC4:
	movs r0, 0x2
_0801CDC6:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_801CCD0

	thumb_func_start sub_801CDCC
sub_801CDCC: @ 801CDCC
	push {r4-r6,lr}
	movs r5, 0
	ldr r4, =gUnknown_02022C78
	ldr r1, [r4]
	movs r2, 0xE7
	lsls r2, 1
	adds r0, r1, r2
	adds r1, 0x4
	movs r2, 0x28
	bl memcpy
	ldr r0, [r4]
	movs r3, 0xFB
	lsls r3, 1
	adds r1, r0, r3
	movs r0, 0xFF
	strb r0, [r1]
	adds r6, r4, 0
_0801CDF0:
	ldr r2, [r6]
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r5
	adds r0, r4, r2
	ldr r3, =0x000001f7
	adds r0, r3
	adds r1, r2
	adds r1, 0x2C
	movs r2, 0x28
	bl memcpy
	ldr r0, [r6]
	ldr r1, =0x0000021f
	adds r0, r1
	adds r0, r4
	movs r1, 0xFF
	strb r1, [r0]
	cmp r5, 0x7
	bls _0801CE34
	ldr r1, [r6]
	ldr r2, =0x000001f7
	adds r0, r1, r2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _0801CE34
	movs r3, 0xE2
	lsls r3, 1
	adds r1, r3
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0801CE34:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x9
	bls _0801CDF0
	ldr r2, =gUnknown_02022C78
	ldr r1, [r2]
	movs r4, 0xE5
	lsls r4, 2
	adds r1, r4
	ldr r0, =gUnknown_082F1DF8
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldr r0, [r0]
	str r0, [r1]
	ldr r2, [r2]
	movs r5, 0xE2
	lsls r5, 1
	adds r0, r2, r5
	ldrh r1, [r0]
	movs r3, 0xE7
	lsls r3, 2
	adds r0, r2, r3
	strh r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801CDCC

	thumb_func_start sub_801CE7C
sub_801CE7C: @ 801CE7C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	movs r5, 0
	ldr r6, =gUnknown_02022C78
	ldr r0, [r6]
	movs r7, 0xE4
	lsls r7, 1
	adds r0, r7
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r6]
	movs r4, 0xE5
	lsls r4, 1
	adds r0, r4
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r6]
	adds r0, r7
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r4, [r6]
	movs r0, 0xE7
	lsls r0, 1
	mov r8, r0
	add r4, r8
	movs r0, 0x3
	movs r1, 0x2
	bl GetFontAttribute
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x3
	adds r1, r4, 0
	bl GetStringWidth
	movs r1, 0xE0
	subs r1, r0
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	cmp r1, 0
	bge _0801CEEC
	movs r1, 0
_0801CEEC:
	ldr r4, [r6]
	adds r0, r4, r7
	ldrb r0, [r0]
	lsls r2, r1, 24
	lsrs r2, 24
	movs r3, 0xDE
	lsls r3, 1
	adds r1, r4, r3
	ldr r1, [r1]
	ldrb r1, [r1]
	lsls r1, 28
	lsrs r1, 28
	lsls r3, r1, 1
	adds r3, r1
	ldr r1, =gUnknown_082F1DE0
	adds r3, r1
	str r3, [sp]
	str r5, [sp, 0x4]
	add r4, r8
	str r4, [sp, 0x8]
	movs r1, 0x3
	movs r3, 0x6
	bl box_print
_0801CF1C:
	ldr r6, =gUnknown_02022C78
	ldr r4, [r6]
	movs r1, 0xE5
	lsls r1, 1
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r3, r5, 4
	adds r3, 0x2
	lsls r3, 24
	lsrs r3, 24
	movs r2, 0xDE
	lsls r2, 1
	adds r1, r4, r2
	ldr r1, [r1]
	ldrb r1, [r1]
	lsrs r1, 4
	lsls r2, r1, 1
	adds r2, r1
	ldr r1, =gUnknown_082F1DE0
	adds r2, r1
	str r2, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r5
	ldr r2, =0x000001f7
	adds r1, r2
	adds r4, r1
	str r4, [sp, 0x8]
	movs r1, 0x3
	movs r2, 0
	bl box_print
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x9
	bls _0801CF1C
	ldr r0, [r6]
	movs r3, 0xE4
	lsls r3, 1
	adds r0, r3
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r0, [r6]
	movs r1, 0xE5
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801CE7C

	thumb_func_start sub_801CFA4
sub_801CFA4: @ 801CFA4
	push {r4-r6,lr}
	ldr r0, =gUnknown_02022C78
	ldr r1, [r0]
	movs r2, 0xE1
	lsls r2, 1
	adds r0, r1, r2
	ldrb r0, [r0]
	lsrs r4, r0, 1
	lsls r4, 8
	ldr r6, =0x000001c3
	adds r0, r1, r6
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0801CFE4
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0x1
	bl ChangeBgY
	movs r0, 0x3
	adds r1, r4, 0
	movs r2, 0x1
	bl ChangeBgY
	b _0801CFF8
	.pool
_0801CFE4:
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0x2
	bl ChangeBgY
	movs r0, 0x3
	adds r1, r4, 0
	movs r2, 0x2
	bl ChangeBgY
_0801CFF8:
	ldr r3, =gUnknown_02022C78
	ldr r0, [r3]
	ldr r2, =0x000001c3
	adds r5, r0, r2
	ldrb r4, [r5]
	lsrs r1, r4, 1
	movs r6, 0xE1
	lsls r6, 1
	adds r0, r6
	ldrb r0, [r0]
	lsrs r0, 1
	adds r1, r0
	lsls r1, 1
	movs r6, 0x1
	adds r0, r6, 0
	ands r0, r4
	orrs r0, r1
	strb r0, [r5]
	ldr r1, [r3]
	adds r2, r1, r2
	ldrb r2, [r2]
	lsrs r0, r2, 1
	cmp r0, 0xF
	bls _0801D070
	adds r0, r6, 0
	ands r0, r2
	cmp r0, 0
	beq _0801D044
	movs r0, 0xE3
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	b _0801D04E
	.pool
_0801D044:
	movs r2, 0xE3
	lsls r2, 1
	adds r1, r2
	ldrh r0, [r1]
	subs r0, 0x1
_0801D04E:
	strh r0, [r1]
	ldr r0, [r3]
	movs r6, 0xE1
	lsls r6, 1
	adds r2, r0, r6
	ldrb r1, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	ldr r1, =0x000001c3
	adds r2, r0, r1
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	strb r0, [r2]
_0801D070:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801CFA4

	thumb_func_start mevent_srv_init_wnews
mevent_srv_init_wnews: @ 801D07C
	push {r4,lr}
	ldr r4, =gUnknown_02022C7C
	movs r0, 0x60
	bl AllocZeroed
	str r0, [r4]
	ldr r1, =gUnknown_082F298C
	movs r2, 0
	movs r3, 0x1
	bl mevent_srv_init_common
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end mevent_srv_init_wnews

	thumb_func_start mevent_srv_new_wcard
mevent_srv_new_wcard: @ 801D0A0
	push {r4,lr}
	ldr r4, =gUnknown_02022C7C
	movs r0, 0x60
	bl AllocZeroed
	str r0, [r4]
	ldr r1, =gUnknown_082F29EC
	movs r2, 0
	movs r3, 0x1
	bl mevent_srv_init_common
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end mevent_srv_new_wcard

	thumb_func_start sub_801D0C4
sub_801D0C4: @ 801D0C4
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r4, =gUnknown_02022C7C
	ldr r0, [r4]
	cmp r0, 0
	bne _0801D0D8
	movs r0, 0x3
	b _0801D0F8
	.pool
_0801D0D8:
	bl mevent_dispatch_08145600
	adds r5, r0, 0
	cmp r5, 0x3
	bne _0801D0F6
	ldr r0, [r4]
	ldr r1, [r0, 0x4]
	strh r1, [r6]
	bl mevent_srv_free_resources
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
_0801D0F6:
	adds r0, r5, 0
_0801D0F8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_801D0C4

	thumb_func_start mevent_srv_init_common
mevent_srv_init_common: @ 801D100
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r4, r0, 0
	adds r6, r1, 0
	mov r8, r2
	mov r9, r3
	movs r5, 0
	str r5, [r4]
	str r5, [r4, 0x8]
	movs r0, 0xA6
	lsls r0, 1
	bl AllocZeroed
	str r0, [r4, 0x18]
	movs r0, 0xDE
	lsls r0, 1
	bl AllocZeroed
	str r0, [r4, 0x1C]
	movs r0, 0x80
	lsls r0, 3
	bl AllocZeroed
	str r0, [r4, 0x14]
	movs r0, 0x64
	bl AllocZeroed
	str r0, [r4, 0x20]
	str r6, [r4, 0x10]
	str r5, [r4, 0xC]
	adds r4, 0x38
	adds r0, r4, 0
	mov r1, r8
	mov r2, r9
	bl sub_801D8D8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end mevent_srv_init_common

	thumb_func_start mevent_srv_free_resources
mevent_srv_free_resources: @ 801D158
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x18]
	bl Free
	ldr r0, [r4, 0x1C]
	bl Free
	ldr r0, [r4, 0x14]
	bl Free
	ldr r0, [r4, 0x20]
	bl Free
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end mevent_srv_free_resources

	thumb_func_start mevent_srv_814501C
mevent_srv_814501C: @ 801D17C
	push {lr}
	adds r0, 0x38
	bl sub_801D904
	pop {r0}
	bx r0
	thumb_func_end mevent_srv_814501C

	thumb_func_start sub_801D188
sub_801D188: @ 801D188
	push {lr}
	cmp r0, 0
	bne _0801D190
	adds r0, r1, 0
_0801D190:
	pop {r1}
	bx r1
	thumb_func_end sub_801D188

	thumb_func_start sub_801D194
sub_801D194: @ 801D194
	push {lr}
	cmp r1, r0
	bcs _0801D19E
	movs r0, 0
	b _0801D1A8
_0801D19E:
	cmp r1, r0
	beq _0801D1A6
	movs r0, 0x2
	b _0801D1A8
_0801D1A6:
	movs r0, 0x1
_0801D1A8:
	pop {r1}
	bx r1
	thumb_func_end sub_801D194

	thumb_func_start sub_801D1AC
sub_801D1AC: @ 801D1AC
	movs r1, 0x4
	str r1, [r0, 0x8]
	movs r0, 0
	bx lr
	thumb_func_end sub_801D1AC

	thumb_func_start sub_801D1B4
sub_801D1B4: @ 801D1B4
	movs r0, 0x3
	bx lr
	thumb_func_end sub_801D1B4

	thumb_func_start sub_801D1B8
sub_801D1B8: @ 801D1B8
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x38
	bl sub_801D8C0
	cmp r0, 0
	beq _0801D1CA
	movs r0, 0x4
	str r0, [r4, 0x8]
_0801D1CA:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801D1B8

	thumb_func_start sub_801D1D4
sub_801D1D4: @ 801D1D4
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x38
	bl sub_801D8CC
	cmp r0, 0
	beq _0801D1E6
	movs r0, 0x4
	str r0, [r4, 0x8]
_0801D1E6:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801D1D4

	thumb_func_start sub_801D1F0
sub_801D1F0: @ 801D1F0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0xC]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r2, [r5, 0x10]
	adds r3, r2, r1
	adds r0, 0x1
	str r0, [r5, 0xC]
	ldr r0, [r3]
	cmp r0, 0x1E
	bls _0801D20C
	b _0801D464
_0801D20C:
	lsls r0, 2
	ldr r1, =_0801D21C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801D21C:
	.4byte _0801D298
	.4byte _0801D2A2
	.4byte _0801D2A8
	.4byte _0801D2E2
	.4byte _0801D2D8
	.4byte _0801D2BA
	.4byte _0801D2C6
	.4byte _0801D2EC
	.4byte _0801D300
	.4byte _0801D308
	.4byte _0801D31E
	.4byte _0801D32E
	.4byte _0801D33A
	.4byte _0801D360
	.4byte _0801D348
	.4byte _0801D390
	.4byte _0801D378
	.4byte _0801D3DC
	.4byte _0801D3A8
	.4byte _0801D3C0
	.4byte _0801D3CE
	.4byte _0801D406
	.4byte _0801D3EA
	.4byte _0801D3F8
	.4byte _0801D40E
	.4byte _0801D418
	.4byte _0801D422
	.4byte _0801D43C
	.4byte _0801D450
	.4byte _0801D458
	.4byte _0801D2CC
_0801D298:
	movs r0, 0x1
	str r0, [r5, 0x8]
	ldr r0, [r3, 0x4]
	str r0, [r5, 0x4]
	b _0801D464
_0801D2A2:
	movs r0, 0x3
	str r0, [r5, 0x8]
	b _0801D464
_0801D2A8:
	adds r0, r5, 0
	adds r0, 0x38
	ldr r1, [r3, 0x4]
	ldr r2, [r5, 0x14]
	bl sub_801D928
	movs r0, 0x2
	str r0, [r5, 0x8]
	b _0801D464
_0801D2BA:
	ldr r0, [r5, 0x20]
	ldr r1, [r5, 0x14]
	movs r2, 0x64
	bl memcpy
	b _0801D464
_0801D2C6:
	ldr r0, [r5, 0x20]
	movs r1, 0
	b _0801D2D0
_0801D2CC:
	ldr r0, [r5, 0x20]
	movs r1, 0x1
_0801D2D0:
	bl sub_801B6A0
	str r0, [r5, 0x4]
	b _0801D464
_0801D2D8:
	ldr r1, [r5, 0x4]
	ldr r0, [r3, 0x4]
	cmp r1, r0
	beq _0801D2E2
	b _0801D464
_0801D2E2:
	movs r0, 0
	str r0, [r5, 0xC]
	ldr r0, [r3, 0x8]
	str r0, [r5, 0x10]
	b _0801D464
_0801D2EC:
	ldr r0, [r3, 0x8]
	ldr r1, [r5, 0x18]
	bl sub_801D188
	adds r2, r0, 0
	ldr r1, [r5, 0x20]
	bl sub_801B6EC
	str r0, [r5, 0x4]
	b _0801D464
_0801D300:
	ldr r0, [r5, 0x14]
	ldr r0, [r0]
	str r0, [r5, 0x4]
	b _0801D464
_0801D308:
	ldr r0, [r3, 0x8]
	adds r1, r5, 0
	adds r1, 0x34
	bl sub_801D188
	adds r2, r0, 0
	ldr r1, [r5, 0x20]
	bl sub_801B708
	str r0, [r5, 0x4]
	b _0801D464
_0801D31E:
	ldr r0, [r5, 0x20]
	ldr r1, [r3, 0x4]
	bl sub_801B784
	lsls r0, 16
	lsrs r0, 16
	str r0, [r5, 0x4]
	b _0801D464
_0801D32E:
	ldr r0, [r5, 0x20]
	ldr r1, [r3, 0x8]
	bl sub_801B748
	str r0, [r5, 0x4]
	b _0801D464
_0801D33A:
	ldr r0, [r3, 0x8]
	ldr r1, [r5, 0x14]
	ldr r1, [r1]
	bl sub_801D194
	str r0, [r5, 0x4]
	b _0801D464
_0801D348:
	ldr r0, [r3, 0x8]
	ldr r1, [r5, 0x1C]
	bl sub_801D188
	adds r2, r0, 0
	movs r3, 0xDE
	lsls r3, 1
	adds r0, r5, 0
	movs r1, 0x17
	bl mevent_srv_814501C
	b _0801D464
_0801D360:
	ldr r0, [r3, 0x8]
	ldr r1, [r5, 0x18]
	bl sub_801D188
	adds r2, r0, 0
	movs r3, 0xA6
	lsls r3, 1
	adds r0, r5, 0
	movs r1, 0x16
	bl mevent_srv_814501C
	b _0801D464
_0801D378:
	ldr r0, [r3, 0x8]
	adds r1, r5, 0
	adds r1, 0x34
	bl sub_801D188
	adds r2, r0, 0
	adds r0, r5, 0
	movs r1, 0x18
	movs r3, 0x4
	bl mevent_srv_814501C
	b _0801D464
_0801D390:
	ldr r2, [r3, 0x8]
	cmp r2, 0
	bne _0801D39C
	ldr r2, [r5, 0x24]
	ldr r3, [r5, 0x28]
	b _0801D39E
_0801D39C:
	ldr r3, [r3, 0x4]
_0801D39E:
	adds r0, r5, 0
	movs r1, 0x19
	bl mevent_srv_814501C
	b _0801D464
_0801D3A8:
	ldr r2, [r3, 0x8]
	cmp r2, 0
	bne _0801D3B4
	ldr r2, [r5, 0x2C]
	ldr r3, [r5, 0x30]
	b _0801D3B6
_0801D3B4:
	ldr r3, [r3, 0x4]
_0801D3B6:
	adds r0, r5, 0
	movs r1, 0x10
	bl mevent_srv_814501C
	b _0801D464
_0801D3C0:
	ldr r2, [r3, 0x8]
	adds r0, r5, 0
	movs r1, 0x1A
	movs r3, 0xBC
	bl mevent_srv_814501C
	b _0801D464
_0801D3CE:
	ldr r2, [r3, 0x8]
	ldr r3, [r3, 0x4]
	adds r0, r5, 0
	movs r1, 0x15
	bl mevent_srv_814501C
	b _0801D464
_0801D3DC:
	ldr r2, [r3, 0x8]
	ldr r3, [r3, 0x4]
	adds r0, r5, 0
	movs r1, 0x1C
	bl mevent_srv_814501C
	b _0801D464
_0801D3EA:
	ldr r0, [r5, 0x18]
	ldr r1, [r3, 0x8]
	movs r2, 0xA6
	lsls r2, 1
	bl memcpy
	b _0801D464
_0801D3F8:
	ldr r0, [r5, 0x1C]
	ldr r1, [r3, 0x8]
	movs r2, 0xDE
	lsls r2, 1
	bl memcpy
	b _0801D464
_0801D406:
	ldr r0, [r3, 0x8]
	ldr r0, [r0]
	str r0, [r5, 0x34]
	b _0801D464
_0801D40E:
	ldr r0, [r3, 0x8]
	str r0, [r5, 0x24]
	ldr r0, [r3, 0x4]
	str r0, [r5, 0x28]
	b _0801D464
_0801D418:
	ldr r0, [r3, 0x8]
	str r0, [r5, 0x2C]
	ldr r0, [r3, 0x4]
	str r0, [r5, 0x30]
	b _0801D464
_0801D422:
	ldr r4, [r5, 0x18]
	bl sav1_get_mevent_buffer_1
	adds r1, r0, 0
	movs r2, 0xA6
	lsls r2, 1
	adds r0, r4, 0
	bl memcpy
	ldr r0, [r5, 0x18]
	bl sub_801B3C0
	b _0801D464
_0801D43C:
	ldr r4, [r5, 0x1C]
	bl sub_801B00C
	adds r1, r0, 0
	movs r2, 0xDE
	lsls r2, 1
	adds r0, r4, 0
	bl memcpy
	b _0801D464
_0801D450:
	bl sub_8099244
	str r0, [r5, 0x24]
	b _0801D464
_0801D458:
	ldr r2, [r3, 0x8]
	ldr r3, [r3, 0x4]
	adds r0, r5, 0
	movs r1, 0x1B
	bl mevent_srv_814501C
_0801D464:
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_801D1F0

	thumb_func_start mevent_dispatch_08145600
mevent_dispatch_08145600: @ 801D46C
	push {lr}
	ldr r2, =gUnknown_082F2548
	ldr r1, [r0, 0x8]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r1}
	bx r1
	.pool
	thumb_func_end mevent_dispatch_08145600

	thumb_func_start sub_801D484
sub_801D484: @ 801D484
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, =gUnknown_02022C80
	movs r0, 0x50
	bl AllocZeroed
	str r0, [r4]
	movs r1, 0x1
	movs r2, 0
	bl mevent_srv_ish_init
	ldr r0, [r4]
	str r5, [r0, 0x4C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801D484

	thumb_func_start sub_801D4A8
sub_801D4A8: @ 801D4A8
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r4, =gUnknown_02022C80
	ldr r0, [r4]
	cmp r0, 0
	bne _0801D4BC
	movs r0, 0x6
	b _0801D4DC
	.pool
_0801D4BC:
	bl mevent_srv_ish_exec
	adds r5, r0, 0
	cmp r5, 0x6
	bne _0801D4DA
	ldr r0, [r4]
	ldr r1, [r0, 0x4]
	strh r1, [r6]
	bl sub_801D55C
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
_0801D4DA:
	adds r0, r5, 0
_0801D4DC:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_801D4A8

	thumb_func_start sub_801D4E4
sub_801D4E4: @ 801D4E4
	ldr r0, =gUnknown_02022C80
	ldr r1, [r0]
	ldr r0, [r1, 0xC]
	adds r0, 0x1
	str r0, [r1, 0xC]
	bx lr
	.pool
	thumb_func_end sub_801D4E4

	thumb_func_start sub_801D4F4
sub_801D4F4: @ 801D4F4
	ldr r0, =gUnknown_02022C80
	ldr r0, [r0]
	ldr r0, [r0, 0x20]
	bx lr
	.pool
	thumb_func_end sub_801D4F4

	thumb_func_start sub_801D500
sub_801D500: @ 801D500
	ldr r1, =gUnknown_02022C80
	ldr r1, [r1]
	str r0, [r1, 0x4]
	bx lr
	.pool
	thumb_func_end sub_801D500

	thumb_func_start mevent_srv_ish_init
mevent_srv_ish_init: @ 801D50C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	adds r6, r1, 0
	mov r8, r2
	movs r0, 0
	str r0, [r4]
	str r0, [r4, 0x8]
	str r0, [r4, 0xC]
	movs r5, 0x80
	lsls r5, 3
	adds r0, r5, 0
	bl AllocZeroed
	str r0, [r4, 0x14]
	adds r0, r5, 0
	bl AllocZeroed
	str r0, [r4, 0x18]
	adds r0, r5, 0
	bl AllocZeroed
	str r0, [r4, 0x1C]
	movs r0, 0x40
	bl AllocZeroed
	str r0, [r4, 0x20]
	adds r4, 0x24
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, r8
	bl sub_801D8D8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end mevent_srv_ish_init

	thumb_func_start sub_801D55C
sub_801D55C: @ 801D55C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x14]
	bl Free
	ldr r0, [r4, 0x18]
	bl Free
	ldr r0, [r4, 0x1C]
	bl Free
	ldr r0, [r4, 0x20]
	bl Free
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_801D55C

	thumb_func_start sub_801D580
sub_801D580: @ 801D580
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x1C]
	ldr r1, [r4, 0x18]
	movs r2, 0x80
	lsls r2, 3
	bl memcpy
	movs r0, 0
	str r0, [r4, 0x10]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_801D580

	thumb_func_start sub_801D59C
sub_801D59C: @ 801D59C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r1, 0
	adds r5, r2, 0
	movs r0, 0
	str r0, [sp]
	ldr r1, [r4, 0x14]
	ldr r2, =0x05000100
	mov r0, sp
	bl CpuSet
	ldr r2, [r4, 0x14]
	str r5, [r2]
	adds r4, 0x24
	adds r0, r4, 0
	adds r1, r6, 0
	movs r3, 0x4
	bl sub_801D904
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801D59C

	thumb_func_start sub_801D5D0
sub_801D5D0: @ 801D5D0
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x1C]
	ldr r1, =gUnknown_082F2598
	movs r2, 0x80
	lsls r2, 3
	bl memcpy
	movs r1, 0
	str r1, [r4, 0x10]
	movs r0, 0x4
	str r0, [r4, 0x8]
	str r1, [r4, 0xC]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801D5D0

	thumb_func_start sub_801D5F8
sub_801D5F8: @ 801D5F8
	movs r0, 0x6
	bx lr
	thumb_func_end sub_801D5F8

	thumb_func_start sub_801D5FC
sub_801D5FC: @ 801D5FC
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x24
	bl sub_801D8C0
	cmp r0, 0
	beq _0801D612
	movs r0, 0x4
	str r0, [r4, 0x8]
	movs r0, 0
	str r0, [r4, 0xC]
_0801D612:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801D5FC

	thumb_func_start sub_801D61C
sub_801D61C: @ 801D61C
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x24
	bl sub_801D8CC
	cmp r0, 0
	beq _0801D632
	movs r0, 0x4
	str r0, [r4, 0x8]
	movs r0, 0
	str r0, [r4, 0xC]
_0801D632:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801D61C

	thumb_func_start sub_801D63C
sub_801D63C: @ 801D63C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x10]
	lsls r2, r0, 3
	ldr r1, [r4, 0x1C]
	adds r2, r1, r2
	adds r0, 0x1
	str r0, [r4, 0x10]
	ldr r0, [r2]
	cmp r0, 0x15
	bls _0801D654
	b _0801D804
_0801D654:
	lsls r0, 2
	ldr r1, =_0801D664
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801D664:
	.4byte _0801D804
	.4byte _0801D6BC
	.4byte _0801D6C4
	.4byte _0801D6D4
	.4byte _0801D70E
	.4byte _0801D716
	.4byte _0801D6FE
	.4byte _0801D708
	.4byte _0801D764
	.4byte _0801D790
	.4byte _0801D788
	.4byte _0801D72C
	.4byte _0801D742
	.4byte _0801D758
	.4byte _0801D77C
	.4byte _0801D7B8
	.4byte _0801D7BC
	.4byte _0801D7C4
	.4byte _0801D7D0
	.4byte _0801D6EA
	.4byte _0801D6D8
	.4byte _0801D7F0
_0801D6BC:
	ldr r0, [r2, 0x4]
	str r0, [r4, 0x4]
	movs r0, 0x1
	b _0801D7FE
_0801D6C4:
	adds r0, r4, 0
	adds r0, 0x24
	ldr r1, [r2, 0x4]
	ldr r2, [r4, 0x18]
	bl sub_801D928
	movs r0, 0x2
	b _0801D7FE
_0801D6D4:
	movs r0, 0x3
	b _0801D7FE
_0801D6D8:
	adds r0, r4, 0
	adds r0, 0x24
	ldr r2, [r4, 0x14]
	movs r1, 0x14
	movs r3, 0
	bl sub_801D904
	movs r0, 0x3
	b _0801D7FE
_0801D6EA:
	ldrb r0, [r2, 0x4]
	bl sub_80847F8
	adds r2, r0, 0
	adds r0, r4, 0
	movs r1, 0x12
	bl sub_801D59C
	movs r0, 0x3
	b _0801D7FE
_0801D6FE:
	ldr r0, [r4, 0x4]
	cmp r0, 0
	beq _0801D706
	b _0801D804
_0801D706:
	b _0801D70E
_0801D708:
	ldr r0, [r4, 0x4]
	cmp r0, 0x1
	bne _0801D804
_0801D70E:
	adds r0, r4, 0
	bl sub_801D580
	b _0801D804
_0801D716:
	ldr r0, [r4, 0x20]
	ldr r1, [r4, 0x18]
	movs r2, 0x40
	bl memcpy
	movs r0, 0x5
	str r0, [r4, 0x8]
	movs r0, 0
	str r0, [r4, 0xC]
	movs r0, 0x2
	b _0801D806
_0801D72C:
	ldr r0, [r4, 0x20]
	ldr r1, [r4, 0x18]
	movs r2, 0x40
	bl memcpy
	movs r0, 0x5
	str r0, [r4, 0x8]
	movs r0, 0
	str r0, [r4, 0xC]
	movs r0, 0x3
	b _0801D806
_0801D742:
	ldr r0, [r4, 0x20]
	ldr r1, [r4, 0x18]
	movs r2, 0x40
	bl memcpy
	movs r0, 0x5
	str r0, [r4, 0x8]
	movs r0, 0
	str r0, [r4, 0xC]
	movs r0, 0x5
	b _0801D806
_0801D758:
	movs r0, 0x5
	str r0, [r4, 0x8]
	movs r0, 0
	str r0, [r4, 0xC]
	movs r0, 0x4
	b _0801D806
_0801D764:
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x4C]
	bl sub_801B580
	adds r0, r4, 0
	adds r0, 0x24
	ldr r2, [r4, 0x14]
	movs r1, 0x11
	movs r3, 0x64
	bl sub_801D904
	b _0801D804
_0801D77C:
	ldr r2, [r4, 0x4]
	adds r0, r4, 0
	movs r1, 0x13
	bl sub_801D59C
	b _0801D804
_0801D788:
	ldr r0, [r4, 0x18]
	bl sub_801B21C
	b _0801D804
_0801D790:
	ldr r0, [r4, 0x18]
	bl sub_801B1A4
	cmp r0, 0
	bne _0801D7AC
	ldr r0, [r4, 0x18]
	bl sub_801B078
	adds r0, r4, 0
	movs r1, 0x13
	movs r2, 0
	bl sub_801D59C
	b _0801D804
_0801D7AC:
	adds r0, r4, 0
	movs r1, 0x13
	movs r2, 0x1
	bl sub_801D59C
	b _0801D804
_0801D7B8:
	movs r0, 0x6
	b _0801D7FE
_0801D7BC:
	ldr r0, [r4, 0x18]
	bl sub_801B508
	b _0801D804
_0801D7C4:
	ldr r0, [r4, 0x18]
	movs r1, 0xFA
	lsls r1, 2
	bl sub_80992A0
	b _0801D804
_0801D7D0:
	ldr r0, =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, =0x00000bec
	adds r0, r1
	ldr r1, [r4, 0x18]
	movs r2, 0xBC
	bl memcpy
	bl sub_81652B4
	b _0801D804
	.pool
_0801D7F0:
	ldr r0, =0x0201c000
	ldr r1, [r4, 0x18]
	movs r2, 0x80
	lsls r2, 3
	bl memcpy
	movs r0, 0x7
_0801D7FE:
	str r0, [r4, 0x8]
	movs r0, 0
	str r0, [r4, 0xC]
_0801D804:
	movs r0, 0x1
_0801D806:
	pop {r4}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801D63C

	thumb_func_start sub_801D810
sub_801D810: @ 801D810
	push {lr}
	adds r1, r0, 0
	ldr r0, [r1, 0xC]
	cmp r0, 0
	beq _0801D822
	movs r0, 0x4
	str r0, [r1, 0x8]
	movs r0, 0
	str r0, [r1, 0xC]
_0801D822:
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_801D810

	thumb_func_start sub_801D828
sub_801D828: @ 801D828
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0xC]
	cmp r0, 0
	beq _0801D838
	cmp r0, 0x1
	beq _0801D846
	b _0801D858
_0801D838:
	ldr r0, [r4, 0x18]
	bl sub_8153870
	ldr r0, [r4, 0xC]
	adds r0, 0x1
	str r0, [r4, 0xC]
	b _0801D858
_0801D846:
	adds r0, r4, 0x4
	bl sub_8153884
	adds r1, r0, 0
	cmp r1, 0
	bne _0801D858
	movs r0, 0x4
	str r0, [r4, 0x8]
	str r1, [r4, 0xC]
_0801D858:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801D828

	thumb_func_start sub_801D860
sub_801D860: @ 801D860
	push {r4,lr}
	adds r4, r0, 0
	ldr r3, =0x0201c000
	adds r0, r4, 0x4
	ldr r1, =gSaveBlock2Ptr
	ldr r1, [r1]
	ldr r2, =gSaveBlock1Ptr
	ldr r2, [r2]
	bl _call_via_r3
	cmp r0, 0x1
	bne _0801D880
	movs r0, 0x4
	str r0, [r4, 0x8]
	movs r0, 0
	str r0, [r4, 0xC]
_0801D880:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801D860

	thumb_func_start mevent_srv_ish_exec
mevent_srv_ish_exec: @ 801D894
	push {r4,r5,lr}
	sub sp, 0x20
	mov r2, sp
	ldr r1, =gUnknown_082F255C
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	ldm r1!, {r3,r4}
	stm r2!, {r3,r4}
	ldr r1, [r0, 0x8]
	lsls r1, 2
	add r1, sp
	ldr r1, [r1]
	bl _call_via_r1
	add sp, 0x20
	pop {r4,r5}
	pop {r1}
	bx r1
	.pool
	thumb_func_end mevent_srv_ish_exec

	thumb_func_start sub_801D8C0
sub_801D8C0: @ 801D8C0
	push {lr}
	ldr r1, [r0, 0x20]
	bl _call_via_r1
	pop {r1}
	bx r1
	thumb_func_end sub_801D8C0

	thumb_func_start sub_801D8CC
sub_801D8CC: @ 801D8CC
	push {lr}
	ldr r1, [r0, 0x24]
	bl _call_via_r1
	pop {r1}
	bx r1
	thumb_func_end sub_801D8CC

	thumb_func_start sub_801D8D8
sub_801D8D8: @ 801D8D8
	movs r3, 0
	strb r1, [r0, 0x4]
	strb r2, [r0, 0x5]
	str r3, [r0]
	strh r3, [r0, 0x12]
	strh r3, [r0, 0x14]
	strh r3, [r0, 0x10]
	strh r3, [r0, 0xA]
	strh r3, [r0, 0xC]
	strh r3, [r0, 0x8]
	str r3, [r0, 0x1C]
	str r3, [r0, 0x18]
	ldr r1, =sub_801DA5C
	str r1, [r0, 0x24]
	ldr r1, =sub_801D988
	str r1, [r0, 0x20]
	bx lr
	.pool
	thumb_func_end sub_801D8D8

	thumb_func_start sub_801D904
sub_801D904: @ 801D904
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	str r0, [r4]
	strh r1, [r4, 0xE]
	strh r0, [r4, 0x10]
	strh r0, [r4, 0x12]
	cmp r3, 0
	beq _0801D91A
	strh r3, [r4, 0x14]
	b _0801D920
_0801D91A:
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r4, 0x14]
_0801D920:
	str r2, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_801D904

	thumb_func_start sub_801D928
sub_801D928: @ 801D928
	movs r3, 0
	str r3, [r0]
	strh r1, [r0, 0x6]
	strh r3, [r0, 0x8]
	strh r3, [r0, 0xA]
	strh r3, [r0, 0xC]
	str r2, [r0, 0x18]
	bx lr
	thumb_func_end sub_801D928

	thumb_func_start sub_801D938
sub_801D938: @ 801D938
	push {lr}
	adds r3, r0, 0
	adds r0, r1, 0
	lsls r3, 8
	ldr r1, =gUnknown_020223C4
	adds r3, r1
	adds r1, r3, 0
	bl memcpy
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801D938

	thumb_func_start sub_801D954
sub_801D954: @ 801D954
	push {r4,lr}
	adds r4, r0, 0
	bl sub_800A550
	lsls r0, 24
	lsrs r0, 24
	asrs r0, r4
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0801D96E
	movs r0, 0
	b _0801D970
_0801D96E:
	movs r0, 0x1
_0801D970:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801D954

	thumb_func_start sub_801D978
sub_801D978: @ 801D978
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_800A5EC
	pop {r0}
	bx r0
	thumb_func_end sub_801D978

	thumb_func_start sub_801D988
sub_801D988: @ 801D988
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r6, [r5]
	cmp r6, 0x1
	beq _0801D9EC
	cmp r6, 0x1
	bgt _0801D99E
	cmp r6, 0
	beq _0801D9A4
	b _0801DA52
_0801D99E:
	cmp r6, 0x2
	beq _0801DA38
	b _0801DA52
_0801D9A4:
	ldrb r0, [r5, 0x5]
	bl sub_801D954
	cmp r0, 0
	beq _0801DA52
	ldrb r0, [r5, 0x5]
	mov r4, sp
	mov r1, sp
	movs r2, 0x8
	bl sub_801D938
	ldrh r1, [r4, 0x4]
	strh r1, [r5, 0xC]
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0xA]
	lsls r1, 16
	movs r0, 0x80
	lsls r0, 19
	cmp r1, r0
	bls _0801D9D2
_0801D9CC:
	bl sub_8010198
	b _0801DA52
_0801D9D2:
	mov r1, sp
	ldrh r0, [r5, 0x6]
	ldrh r1, [r1]
	cmp r0, r1
	bne _0801D9CC
	strh r6, [r5, 0x8]
	ldrb r0, [r5, 0x5]
	bl sub_801D978
	ldr r0, [r5]
	adds r0, 0x1
	str r0, [r5]
	b _0801DA52
_0801D9EC:
	ldrb r0, [r5, 0x5]
	bl sub_801D954
	cmp r0, 0
	beq _0801DA52
	ldrh r0, [r5, 0x8]
	lsls r1, r0, 6
	subs r1, r0
	lsls r3, r1, 2
	ldrh r0, [r5, 0xC]
	subs r2, r0, r3
	cmp r2, 0xFC
	bhi _0801DA1E
	ldrb r0, [r5, 0x5]
	ldr r1, [r5, 0x18]
	adds r1, r3
	bl sub_801D938
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	ldr r0, [r5]
	adds r0, 0x1
	str r0, [r5]
	b _0801DA30
_0801DA1E:
	ldrb r0, [r5, 0x5]
	ldr r1, [r5, 0x18]
	adds r1, r3
	movs r2, 0xFC
	bl sub_801D938
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_0801DA30:
	ldrb r0, [r5, 0x5]
	bl sub_801D978
	b _0801DA52
_0801DA38:
	ldr r0, [r5, 0x18]
	ldrh r1, [r5, 0xC]
	bl CalcCRC16WithTable
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r5, 0xA]
	cmp r0, r1
	bne _0801D9CC
	movs r0, 0
	str r0, [r5]
	movs r0, 0x1
	b _0801DA54
_0801DA52:
	movs r0, 0
_0801DA54:
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_801D988

	thumb_func_start sub_801DA5C
sub_801DA5C: @ 801DA5C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r5, [r4]
	cmp r5, 0x1
	beq _0801DAC8
	cmp r5, 0x1
	bgt _0801DA72
	cmp r5, 0
	beq _0801DA7C
	b _0801DB5E
_0801DA72:
	cmp r5, 0x2
	beq _0801DB1C
	cmp r5, 0x3
	beq _0801DB46
	b _0801DB5E
_0801DA7C:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _0801DB5E
	ldrh r1, [r4, 0xE]
	ldr r2, =0xffff0000
	ldr r0, [sp]
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	ldrh r1, [r4, 0x14]
	ldr r0, [sp, 0x4]
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x4]
	ldr r0, [r4, 0x1C]
	bl CalcCRC16WithTable
	lsls r0, 16
	ldr r2, =0x0000ffff
	ldr r1, [sp]
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	lsrs r1, 16
	strh r1, [r4, 0x12]
	strh r5, [r4, 0x10]
	movs r0, 0
	mov r1, sp
	movs r2, 0x8
	bl link_0800A448
	b _0801DB3E
	.pool
_0801DAC8:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _0801DB5E
	ldrb r0, [r4, 0x4]
	bl sub_801D954
	cmp r0, 0
	beq _0801DB5E
	ldrb r0, [r4, 0x4]
	bl sub_801D978
	ldrh r1, [r4, 0x10]
	lsls r0, r1, 6
	subs r0, r1
	lsls r3, r0, 2
	ldrh r0, [r4, 0x14]
	subs r0, r3
	cmp r0, 0xFC
	bhi _0801DB08
	ldr r1, [r4, 0x1C]
	adds r1, r3
	lsls r2, r0, 16
	lsrs r2, 16
	movs r0, 0
	bl link_0800A448
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	b _0801DB3E
_0801DB08:
	ldr r1, [r4, 0x1C]
	adds r1, r3
	movs r0, 0
	movs r2, 0xFC
	bl link_0800A448
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	b _0801DB5E
_0801DB1C:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _0801DB5E
	ldr r0, [r4, 0x1C]
	ldrh r1, [r4, 0x14]
	bl CalcCRC16WithTable
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4, 0x12]
	cmp r0, r1
	beq _0801DB3E
	bl sub_8010198
	b _0801DB5E
_0801DB3E:
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	b _0801DB5E
_0801DB46:
	ldrb r0, [r4, 0x4]
	bl sub_801D954
	cmp r0, 0
	beq _0801DB5E
	ldrb r0, [r4, 0x4]
	bl sub_801D978
	movs r0, 0
	str r0, [r4]
	movs r0, 0x1
	b _0801DB60
_0801DB5E:
	movs r0, 0
_0801DB60:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_801DA5C

	thumb_func_start sub_801DB68
sub_801DB68: @ 801DB68
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_801B044
	adds r5, r0, 0
	movs r0, 0x3
	adds r1, r4, 0
	ands r1, r0
	ldrb r2, [r5]
	movs r0, 0x4
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	cmp r4, 0x2
	bhi _0801DB8E
	cmp r4, 0x1
	bcs _0801DB94
	b _0801DBB8
_0801DB8E:
	cmp r4, 0x3
	beq _0801DBA6
	b _0801DBB8
_0801DB94:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	bl __umodsi3
	adds r0, 0x10
	b _0801DBB6
_0801DBA6:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	bl __umodsi3
	adds r0, 0x1
_0801DBB6:
	strb r0, [r5, 0x1]
_0801DBB8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_801DB68

	thumb_func_start sub_801DBC0
sub_801DBC0: @ 801DBC0
	push {lr}
	bl sub_801B044
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0, 0x1]
	ldr r0, =0x0000402e
	bl VarSet
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801DBC0

	thumb_func_start sub_801DBDC
sub_801DBDC: @ 801DBDC
	push {r4,lr}
	ldr r0, =0x0000402e
	bl GetVarPointer
	adds r4, r0, 0
	bl sub_801B044
	adds r2, r0, 0
	ldr r0, [r2]
	lsls r0, 24
	lsrs r0, 29
	cmp r0, 0x4
	bls _0801DC10
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	ldr r1, =0x01f30000
	cmp r0, r1
	bls _0801DC10
	ldrb r0, [r2]
	movs r1, 0x1F
	ands r1, r0
	strb r1, [r2]
	movs r0, 0
	strh r0, [r4]
_0801DC10:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801DBDC

	thumb_func_start sub_801DC20
sub_801DC20: @ 801DC20
	push {r4-r6,lr}
	ldr r6, =gUnknown_020375F0
	bl sub_801B044
	adds r4, r0, 0
	bl sub_809D490
	cmp r0, 0
	beq _0801DC3A
	bl sub_801B0CC
	cmp r0, 0
	bne _0801DC44
_0801DC3A:
	movs r0, 0
	b _0801DCA6
	.pool
_0801DC44:
	adds r0, r4, 0
	bl sub_801DD44
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x6
	bhi _0801DCA4
	lsls r0, r5, 2
	ldr r1, =_0801DC60
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801DC60:
	.4byte _0801DCA4
	.4byte _0801DC7C
	.4byte _0801DC7C
	.4byte _0801DCA4
	.4byte _0801DC86
	.4byte _0801DC96
	.4byte _0801DCA4
_0801DC7C:
	adds r0, r4, 0
	bl sub_801DCAC
	strh r0, [r6]
	b _0801DCA4
_0801DC86:
	adds r0, r4, 0
	bl sub_801DCAC
	strh r0, [r6]
	adds r0, r4, 0
	bl sub_801DCD8
	b _0801DCA4
_0801DC96:
	adds r0, r4, 0
	bl sub_801DCAC
	strh r0, [r6]
	adds r0, r4, 0
	bl sub_801DCCC
_0801DCA4:
	adds r0, r5, 0
_0801DCA6:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_801DC20

	thumb_func_start sub_801DCAC
sub_801DCAC: @ 801DCAC
	push {r4,lr}
	ldrb r2, [r0]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrb r4, [r0, 0x1]
	adds r4, 0x84
	movs r1, 0
	strb r1, [r0, 0x1]
	bl sub_801DD10
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801DCAC

	thumb_func_start sub_801DCCC
sub_801DCCC: @ 801DCCC
	ldrb r2, [r0]
	movs r1, 0x1D
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end sub_801DCCC

	thumb_func_start sub_801DCD8
sub_801DCD8: @ 801DCD8
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, [r3]
	lsls r0, 27
	lsrs r0, 29
	adds r0, 0x1
	movs r1, 0x7
	ands r0, r1
	lsls r0, 2
	ldrb r1, [r3]
	movs r4, 0x1D
	negs r4, r4
	adds r2, r4, 0
	ands r2, r1
	orrs r2, r0
	strb r2, [r3]
	ldr r0, [r3]
	lsls r0, 27
	lsrs r0, 29
	cmp r0, 0x4
	bls _0801DD0A
	ands r2, r4
	movs r0, 0x10
	orrs r2, r0
	strb r2, [r3]
_0801DD0A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_801DCD8

	thumb_func_start sub_801DD10
sub_801DD10: @ 801DD10
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, [r3]
	lsls r0, 24
	lsrs r0, 29
	adds r0, 0x1
	lsls r0, 5
	ldrb r1, [r3]
	movs r4, 0x1F
	adds r2, r4, 0
	ands r2, r1
	orrs r2, r0
	strb r2, [r3]
	ldr r0, [r3]
	lsls r0, 24
	lsrs r0, 29
	cmp r0, 0x5
	bls _0801DD3C
	ands r2, r4
	movs r0, 0xA0
	orrs r2, r0
	strb r2, [r3]
_0801DD3C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_801DD10

	thumb_func_start sub_801DD44
sub_801DD44: @ 801DD44
	push {lr}
	adds r2, r0, 0
	ldrb r1, [r2]
	movs r0, 0xE0
	ands r0, r1
	cmp r0, 0xA0
	bne _0801DD56
	movs r0, 0x6
	b _0801DD92
_0801DD56:
	ldr r1, [r2]
	lsls r0, r1, 30
	lsrs r0, 30
	cmp r0, 0x1
	beq _0801DD78
	cmp r0, 0x1
	bgt _0801DD6A
	cmp r0, 0
	beq _0801DD74
	b _0801DD90
_0801DD6A:
	cmp r0, 0x2
	beq _0801DD7C
	cmp r0, 0x3
	beq _0801DD80
	b _0801DD90
_0801DD74:
	movs r0, 0x3
	b _0801DD92
_0801DD78:
	movs r0, 0x1
	b _0801DD92
_0801DD7C:
	movs r0, 0x2
	b _0801DD92
_0801DD80:
	lsls r0, r1, 27
	lsrs r0, 29
	cmp r0, 0x2
	bhi _0801DD8C
	movs r0, 0x4
	b _0801DD92
_0801DD8C:
	movs r0, 0x5
	b _0801DD92
_0801DD90:
	movs r0, 0
_0801DD92:
	pop {r1}
	bx r1
	thumb_func_end sub_801DD44

	thumb_func_start sub_801DD98
sub_801DD98: @ 801DD98
	push {r4,lr}
	ldr r4, =gUnknown_02022C84
	movs r0, 0xDE
	lsls r0, 1
	bl Alloc
	str r0, [r4]
	bl sub_801DDD0
	ldr r1, =gKeyRepeatStartDelay
	movs r0, 0x14
	strh r0, [r1]
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, =c2_081284E0
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801DD98

	thumb_func_start sub_801DDD0
sub_801DDD0: @ 801DDD0
	push {r4-r7,lr}
	adds r4, r0, 0
	movs r5, 0
	movs r0, 0
	strh r0, [r4, 0x4]
	strh r0, [r4, 0x6]
	strb r5, [r4, 0x10]
	strb r5, [r4, 0x11]
	strb r5, [r4, 0x12]
	strb r5, [r4, 0x14]
	strb r5, [r4, 0x15]
	strb r5, [r4, 0x16]
	movs r0, 0xFF
	strb r0, [r4, 0x1A]
	bl sub_8009FCC
	strb r0, [r4, 0xD]
	bl link_get_multiplayer_id
	strb r0, [r4, 0x13]
	strb r5, [r4, 0x17]
	strb r5, [r4, 0x18]
	movs r1, 0xC8
	lsls r1, 1
	adds r0, r4, r1
	bl sub_801EF1C
	ldr r7, =gSaveBlock1Ptr
	ldr r6, =0x00003c88
	adds r4, 0xB9
	movs r5, 0x9
_0801DE0E:
	ldr r1, [r7]
	adds r1, r6
	adds r0, r4, 0
	bl StringCopy
	adds r6, 0x15
	adds r4, 0x15
	subs r5, 0x1
	cmp r5, 0
	bge _0801DE0E
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801DDD0

	thumb_func_start sub_801DE30
sub_801DE30: @ 801DE30
	push {r4,lr}
	ldr r4, =gUnknown_02022C84
	ldr r0, [r4]
	ldrb r0, [r0, 0xE]
	bl DestroyTask
	ldr r0, [r4]
	ldrb r0, [r0, 0xF]
	bl DestroyTask
	ldr r0, [r4]
	bl Free
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801DE30

	thumb_func_start c2_081284E0
c2_081284E0: @ 801DE54
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r6, r0, r1
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _0801DE8C
	cmp r0, 0x1
	bgt _0801DE74
	cmp r0, 0
	beq _0801DE7A
	b _0801DF04
	.pool
_0801DE74:
	cmp r0, 0x2
	beq _0801DEC8
	b _0801DF04
_0801DE7A:
	bl ResetTasks
	bl ResetAllObjectData
	bl ResetObjectPaletteAllocator
	bl sub_801F4D0
	b _0801DEBC
_0801DE8C:
	bl sub_801F5B8
	bl sub_801F534
	adds r5, r0, 0
	cmp r5, 0
	bne _0801DF04
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	str r5, [sp]
	adds r0, r4, 0
	adds r1, r4, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, =sub_801DF20
	bl SetVBlankCallback
_0801DEBC:
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _0801DF04
	.pool
_0801DEC8:
	bl UpdatePaletteFade
	ldr r0, =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0801DF04
	ldr r0, =sub_801DF38
	bl SetMainCallback2
	ldr r0, =sub_801DF54
	movs r1, 0x8
	bl CreateTask
	ldr r4, =gUnknown_02022C84
	ldr r1, [r4]
	strb r0, [r1, 0xE]
	ldr r0, =sub_801F2B4
	movs r1, 0x7
	bl CreateTask
	ldr r1, [r4]
	strb r0, [r1, 0xF]
	bl sub_800E0E8
	movs r0, 0xE8
	movs r1, 0x96
	bl sub_800DFB4
_0801DF04:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end c2_081284E0

	thumb_func_start sub_801DF20
sub_801DF20: @ 801DF20
	push {lr}
	bl TransferPlttBuffer
	bl LoadOamFromSprites
	bl ProcessObjectCopyRequests
	bl sub_80BA0A8
	pop {r0}
	bx r0
	thumb_func_end sub_801DF20

	thumb_func_start sub_801DF38
sub_801DF38: @ 801DF38
	push {lr}
	bl RunTasks
	bl sub_801F5B8
	bl CallObjectCallbacks
	bl PrepareSpritesForOamLoad
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_801DF38

	thumb_func_start sub_801DF54
sub_801DF54: @ 801DF54
	push {r4,lr}
	ldr r4, =gUnknown_02022C84
	ldr r0, [r4]
	ldrb r0, [r0, 0x17]
	cmp r0, 0x2
	beq _0801DF7A
	cmp r0, 0x2
	bgt _0801DF70
	cmp r0, 0x1
	beq _0801DF76
	b _0801DF8A
	.pool
_0801DF70:
	cmp r0, 0x3
	beq _0801DF7E
	b _0801DF8A
_0801DF76:
	movs r0, 0x6
	b _0801DF80
_0801DF7A:
	movs r0, 0x7
	b _0801DF80
_0801DF7E:
	movs r0, 0x8
_0801DF80:
	bl sub_801EBD4
	ldr r1, [r4]
	movs r0, 0
	strb r0, [r1, 0x17]
_0801DF8A:
	ldr r1, =gUnknown_082F2A7C
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	ldrh r0, [r0, 0x4]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801DF54

	thumb_func_start sub_801DFAC
sub_801DFAC: @ 801DFAC
	push {r4,lr}
	ldr r4, =gUnknown_02022C84
	ldr r0, [r4]
	ldrh r1, [r0, 0x6]
	cmp r1, 0x1
	beq _0801DFE0
	cmp r1, 0x1
	bgt _0801DFC8
	cmp r1, 0
	beq _0801DFCE
	b _0801E028
	.pool
_0801DFC8:
	cmp r1, 0x2
	beq _0801E018
	b _0801E028
_0801DFCE:
	movs r1, 0xC8
	lsls r1, 1
	adds r0, r1
	bl sub_801EF24
	ldr r1, [r4]
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
_0801DFE0:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _0801E028
	bl sub_8011A9C
	cmp r0, 0
	bne _0801E028
	ldr r4, =gUnknown_02022C84
	ldr r1, [r4]
	movs r0, 0xC8
	lsls r0, 1
	adds r1, r0
	movs r0, 0
	movs r2, 0x28
	bl link_0800A448
	lsls r0, 24
	cmp r0, 0
	beq _0801E028
	ldr r1, [r4]
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	b _0801E028
	.pool
_0801E018:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _0801E028
	movs r0, 0x1
	bl sub_801EBD4
_0801E028:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_801DFAC

	thumb_func_start sub_801E030
sub_801E030: @ 801E030
	push {r4,r5,lr}
	ldr r5, =gUnknown_02022C84
	ldr r3, [r5]
	ldrh r0, [r3, 0x6]
	cmp r0, 0
	beq _0801E048
	cmp r0, 0x1
	beq _0801E0F6
	b _0801E118
	.pool
_0801E048:
	ldr r1, =gMain
	ldrh r2, [r1, 0x2E]
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _0801E068
	ldrb r0, [r3, 0x15]
	cmp r0, 0
	beq _0801E118
	movs r0, 0x4
	bl sub_801EBD4
	b _0801E118
	.pool
_0801E068:
	movs r0, 0x4
	ands r0, r2
	cmp r0, 0
	beq _0801E078
	movs r0, 0x2
	bl sub_801EBD4
	b _0801E118
_0801E078:
	ldrh r1, [r1, 0x30]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0801E0A4
	ldrb r0, [r3, 0x15]
	cmp r0, 0
	beq _0801E09C
	bl sub_801ED68
	movs r0, 0x8
	movs r1, 0
	bl sub_801F5EC
	ldr r1, [r5]
	movs r0, 0x1
	strh r0, [r1, 0x6]
	b _0801E118
_0801E09C:
	movs r0, 0x3
	bl sub_801EBD4
	b _0801E118
_0801E0A4:
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r2
	cmp r0, 0
	beq _0801E0C0
	bl sub_801EC94
	movs r0, 0x8
	movs r1, 0
	bl sub_801F5EC
	movs r0, 0x2
	movs r1, 0x1
	b _0801E0EC
_0801E0C0:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r2
	cmp r0, 0
	beq _0801E0E0
	ldrb r0, [r3, 0x10]
	cmp r0, 0x3
	beq _0801E0D8
	bl sub_801ED94
	movs r0, 0x8
	b _0801E0EA
_0801E0D8:
	movs r0, 0x5
	bl sub_801EBD4
	b _0801E118
_0801E0E0:
	bl sub_801EBE4
	cmp r0, 0
	beq _0801E118
	movs r0, 0x1
_0801E0EA:
	movs r1, 0
_0801E0EC:
	bl sub_801F5EC
	ldr r0, [r5]
	strh r4, [r0, 0x6]
	b _0801E118
_0801E0F6:
	movs r0, 0
	bl sub_801F644
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl sub_801F644
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r4, 0
	bne _0801E118
	cmp r1, 0
	bne _0801E118
	ldr r0, [r5]
	strh r1, [r0, 0x6]
_0801E118:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_801E030

	thumb_func_start sub_801E120
sub_801E120: @ 801E120
	push {r4-r6,lr}
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	ldrh r0, [r0, 0x6]
	cmp r0, 0x4
	bls _0801E12E
	b _0801E23A
_0801E12E:
	lsls r0, 2
	ldr r1, =_0801E140
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801E140:
	.4byte _0801E154
	.4byte _0801E15E
	.4byte _0801E17C
	.4byte _0801E208
	.4byte _0801E21C
_0801E154:
	movs r0, 0x3
	movs r1, 0
	bl sub_801F5EC
	b _0801E16A
_0801E15E:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	bne _0801E23A
_0801E16A:
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	b _0801E23A
	.pool
_0801E17C:
	bl ProcessMenuInput
	lsls r0, 24
	asrs r0, 8
	lsrs r6, r0, 16
	asrs r4, r0, 16
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _0801E1B4
	adds r0, 0x1
	cmp r4, r0
	beq _0801E1D4
	movs r0, 0x4
	movs r1, 0
	bl sub_801F5EC
	ldr r5, =gUnknown_02022C84
	ldr r2, [r5]
	ldrb r0, [r2, 0x10]
	cmp r0, r4
	beq _0801E1DC
	cmp r4, 0x3
	ble _0801E1EC
	b _0801E1DC
	.pool
_0801E1B4:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0801E23A
	movs r0, 0x5
	bl audio_play
	movs r0, 0x1
	bl MoveMenuCursor
	b _0801E23A
	.pool
_0801E1D4:
	movs r0, 0x4
	movs r1, 0
	bl sub_801F5EC
_0801E1DC:
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x3
	strh r0, [r1, 0x6]
	b _0801E23A
	.pool
_0801E1EC:
	movs r1, 0
	strb r1, [r2, 0x11]
	ldr r0, [r5]
	strb r1, [r0, 0x12]
	movs r0, 0x5
	movs r1, 0x1
	bl sub_801F5EC
	ldr r0, [r5]
	strb r6, [r0, 0x10]
	ldr r1, [r5]
	movs r0, 0x4
	strh r0, [r1, 0x6]
	b _0801E23A
_0801E208:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	bne _0801E23A
	movs r0, 0x1
	bl sub_801EBD4
	b _0801E23A
_0801E21C:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	bne _0801E23A
	movs r0, 0x1
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	bne _0801E23A
	movs r0, 0x1
	bl sub_801EBD4
_0801E23A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_801E120

	thumb_func_start sub_801E240
sub_801E240: @ 801E240
	push {r4,r5,lr}
	ldr r1, =gUnknown_02022C84
	ldr r0, [r1]
	ldrh r0, [r0, 0x6]
	adds r2, r1, 0
	cmp r0, 0xA
	bls _0801E250
	b _0801E458
_0801E250:
	lsls r0, 2
	ldr r1, =_0801E264
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801E264:
	.4byte _0801E290
	.4byte _0801E2A8
	.4byte _0801E2C4
	.4byte _0801E322
	.4byte _0801E3D4
	.4byte _0801E424
	.4byte _0801E458
	.4byte _0801E458
	.4byte _0801E378
	.4byte _0801E338
	.4byte _0801E35C
_0801E290:
	movs r0, 0x6
	movs r1, 0
	bl sub_801F5EC
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x1
	strh r0, [r1, 0x6]
	b _0801E458
	.pool
_0801E2A8:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	beq _0801E2B6
	b _0801E458
_0801E2B6:
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x2
	strh r0, [r1, 0x6]
	b _0801E458
	.pool
_0801E2C4:
	bl sub_801FF08
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0801E2E6
	cmp r1, 0
	bgt _0801E2DE
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0801E396
	b _0801E458
_0801E2DE:
	cmp r1, 0x1
	beq _0801E2E4
	b _0801E458
_0801E2E4:
	b _0801E396
_0801E2E6:
	ldr r4, =gUnknown_02022C84
	ldr r1, [r4]
	ldrb r0, [r1, 0x13]
	cmp r0, 0
	bne _0801E310
	movs r2, 0xC8
	lsls r2, 1
	adds r0, r1, r2
	bl sub_801EFD0
	movs r0, 0x7
	movs r1, 0
	bl sub_801F5EC
	ldr r1, [r4]
	movs r0, 0x9
	strh r0, [r1, 0x6]
	b _0801E458
	.pool
_0801E310:
	movs r2, 0xC8
	lsls r2, 1
	adds r0, r1, r2
	bl sub_801EF7C
	ldr r1, [r4]
	movs r0, 0x4
	strh r0, [r1, 0x6]
	b _0801E458
_0801E322:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	beq _0801E330
	b _0801E458
_0801E330:
	movs r0, 0x1
	bl sub_801EBD4
	b _0801E458
_0801E338:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	beq _0801E346
	b _0801E458
_0801E346:
	movs r0, 0x14
	movs r1, 0
	bl sub_801F5EC
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0xA
	strh r0, [r1, 0x6]
	b _0801E458
	.pool
_0801E35C:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	beq _0801E36A
	b _0801E458
_0801E36A:
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x8
	strh r0, [r1, 0x6]
	b _0801E458
	.pool
_0801E378:
	bl sub_801FF08
	lsls r0, 24
	asrs r5, r0, 24
	cmp r5, 0
	beq _0801E3AC
	cmp r5, 0
	bgt _0801E392
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	beq _0801E396
	b _0801E458
_0801E392:
	cmp r5, 0x1
	bne _0801E458
_0801E396:
	movs r0, 0x7
	movs r1, 0
	bl sub_801F5EC
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x3
	strh r0, [r1, 0x6]
	b _0801E458
	.pool
_0801E3AC:
	bl sub_80104B0
	ldr r4, =gUnknown_02022C84
	ldr r0, [r4]
	movs r1, 0xC8
	lsls r1, 1
	adds r0, r1
	bl sub_801EFD0
	ldr r0, [r4]
	movs r1, 0x4
	strh r1, [r0, 0x6]
	movs r2, 0xDC
	lsls r2, 1
	adds r0, r2
	strh r5, [r0]
	b _0801E458
	.pool
_0801E3D4:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _0801E414
	bl sub_8011A9C
	cmp r0, 0
	bne _0801E414
	ldr r4, =gUnknown_02022C84
	ldr r1, [r4]
	movs r0, 0xC8
	lsls r0, 1
	adds r1, r0
	movs r0, 0
	movs r2, 0x28
	bl link_0800A448
	lsls r0, 24
	cmp r0, 0
	beq _0801E414
	ldr r1, [r4]
	ldrb r0, [r1, 0x13]
	cmp r0, 0
	bne _0801E410
	movs r0, 0x6
	b _0801E412
	.pool
_0801E410:
	movs r0, 0x5
_0801E412:
	strh r0, [r1, 0x6]
_0801E414:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801E458
	b _0801E42C
	.pool
_0801E424:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801E438
_0801E42C:
	movs r0, 0x9
	bl sub_801EBD4
	b _0801E458
	.pool
_0801E438:
	ldr r3, [r2]
	movs r1, 0xDC
	lsls r1, 1
	adds r2, r3, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	movs r1, 0x96
	lsls r1, 17
	cmp r0, r1
	bls _0801E458
	movs r0, 0
	strh r0, [r2]
	movs r0, 0x4
	strh r0, [r3, 0x6]
_0801E458:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_801E240

	thumb_func_start sub_801E460
sub_801E460: @ 801E460
	push {r4,lr}
	ldr r1, =gUnknown_02022C84
	ldr r0, [r1]
	ldrh r0, [r0, 0x6]
	adds r2, r1, 0
	cmp r0, 0x7
	bls _0801E470
	b _0801E5BC
_0801E470:
	lsls r0, 2
	ldr r1, =_0801E484
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801E484:
	.4byte _0801E4A4
	.4byte _0801E4C8
	.4byte _0801E4E8
	.4byte _0801E50C
	.4byte _0801E540
	.4byte _0801E560
	.4byte _0801E584
	.4byte _0801E5A8
_0801E4A4:
	ldr r0, =sub_801F2B4
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _0801E4B2
	b _0801E5BC
_0801E4B2:
	movs r0, 0x7
	movs r1, 0
	bl sub_801F5EC
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	b _0801E59A
	.pool
_0801E4C8:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	bne _0801E5BC
	movs r0, 0x12
	movs r1, 0
	bl sub_801F5EC
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	b _0801E59A
	.pool
_0801E4E8:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	bne _0801E5BC
	ldr r4, =gUnknown_02022C84
	ldr r0, [r4]
	movs r1, 0xC8
	lsls r1, 1
	adds r0, r1
	bl sub_801EFA8
	ldr r1, [r4]
	b _0801E59A
	.pool
_0801E50C:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _0801E5BC
	bl sub_8011A9C
	cmp r0, 0
	bne _0801E5BC
	ldr r4, =gUnknown_02022C84
	ldr r1, [r4]
	movs r0, 0xC8
	lsls r0, 1
	adds r1, r0
	movs r0, 0
	movs r2, 0x28
	bl link_0800A448
	lsls r0, 24
	cmp r0, 0
	beq _0801E5BC
	ldr r1, [r4]
	b _0801E59A
	.pool
_0801E540:
	bl sub_800A550
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0801E5BC
	bl sub_8011A9C
	cmp r0, 0
	bne _0801E5BC
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	b _0801E59A
	.pool
_0801E560:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _0801E5BC
	bl sub_8011A9C
	adds r4, r0, 0
	cmp r4, 0
	bne _0801E5BC
	bl sub_800AC34
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	strh r4, [r1, 0xA]
	b _0801E59A
	.pool
_0801E584:
	ldr r1, [r2]
	ldrh r0, [r1, 0xA]
	cmp r0, 0x95
	bhi _0801E590
	adds r0, 0x1
	strh r0, [r1, 0xA]
_0801E590:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801E5BC
	ldr r1, [r2]
_0801E59A:
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	b _0801E5BC
	.pool
_0801E5A8:
	ldr r1, [r2]
	ldrh r0, [r1, 0xA]
	cmp r0, 0x95
	bls _0801E5B8
	movs r0, 0x9
	bl sub_801EBD4
	b _0801E5BC
_0801E5B8:
	adds r0, 0x1
	strh r0, [r1, 0xA]
_0801E5BC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_801E460

	thumb_func_start sub_801E5C4
sub_801E5C4: @ 801E5C4
	push {r4,r5,lr}
	ldr r5, =gUnknown_02022C84
	ldr r1, [r5]
	ldrh r0, [r1, 0x6]
	cmp r0, 0x1
	beq _0801E604
	cmp r0, 0x1
	bgt _0801E5E0
	cmp r0, 0
	beq _0801E5EA
	b _0801E662
	.pool
_0801E5E0:
	cmp r0, 0x2
	beq _0801E62E
	cmp r0, 0x3
	beq _0801E650
	b _0801E662
_0801E5EA:
	ldr r0, =sub_801F2B4
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _0801E662
	movs r0, 0x7
	movs r1, 0
	bl sub_801F5EC
	b _0801E640
	.pool
_0801E604:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	bne _0801E662
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _0801E662
	bl sub_8011A9C
	adds r4, r0, 0
	cmp r4, 0
	bne _0801E662
	bl sub_800AC34
	ldr r1, [r5]
	strh r4, [r1, 0xA]
	b _0801E642
_0801E62E:
	ldrh r0, [r1, 0xA]
	cmp r0, 0x95
	bhi _0801E638
	adds r0, 0x1
	strh r0, [r1, 0xA]
_0801E638:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801E662
_0801E640:
	ldr r1, [r5]
_0801E642:
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	b _0801E662
	.pool
_0801E650:
	ldrh r0, [r1, 0xA]
	cmp r0, 0x95
	bls _0801E65E
	movs r0, 0x9
	bl sub_801EBD4
	b _0801E662
_0801E65E:
	adds r0, 0x1
	strh r0, [r1, 0xA]
_0801E662:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_801E5C4

	thumb_func_start sub_801E668
sub_801E668: @ 801E668
	push {r4,lr}
	ldr r1, =gUnknown_02022C84
	ldr r0, [r1]
	ldrh r0, [r0, 0x6]
	adds r2, r1, 0
	cmp r0, 0x4
	bhi _0801E75C
	lsls r0, 2
	ldr r1, =_0801E688
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801E688:
	.4byte _0801E69C
	.4byte _0801E6C8
	.4byte _0801E6F0
	.4byte _0801E724
	.4byte _0801E748
_0801E69C:
	ldr r0, =sub_801F2B4
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _0801E75C
	ldr r4, =gUnknown_02022C84
	ldr r0, [r4]
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	beq _0801E6BA
	movs r0, 0x7
	movs r1, 0
	bl sub_801F5EC
_0801E6BA:
	ldr r1, [r4]
	b _0801E73A
	.pool
_0801E6C8:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	bne _0801E75C
	ldr r4, =gUnknown_02022C84
	ldr r0, [r4]
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	beq _0801E6E6
	movs r0, 0x13
	movs r1, 0
	bl sub_801F5EC
_0801E6E6:
	ldr r1, [r4]
	b _0801E73A
	.pool
_0801E6F0:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0801E75C
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _0801E75C
	bl sub_8011A9C
	adds r4, r0, 0
	cmp r4, 0
	bne _0801E75C
	bl sub_800AC34
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	strh r4, [r1, 0xA]
	b _0801E73A
	.pool
_0801E724:
	ldr r1, [r2]
	ldrh r0, [r1, 0xA]
	cmp r0, 0x95
	bhi _0801E730
	adds r0, 0x1
	strh r0, [r1, 0xA]
_0801E730:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801E75C
	ldr r1, [r2]
_0801E73A:
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	b _0801E75C
	.pool
_0801E748:
	ldr r1, [r2]
	ldrh r0, [r1, 0xA]
	cmp r0, 0x95
	bls _0801E758
	movs r0, 0x9
	bl sub_801EBD4
	b _0801E75C
_0801E758:
	adds r0, 0x1
	strh r0, [r1, 0xA]
_0801E75C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_801E668

	thumb_func_start sub_801E764
sub_801E764: @ 801E764
	push {r4,lr}
	ldr r1, =gUnknown_02022C84
	ldr r0, [r1]
	ldrh r0, [r0, 0x6]
	adds r4, r1, 0
	cmp r0, 0x4
	bhi _0801E830
	lsls r0, 2
	ldr r1, =_0801E784
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801E784:
	.4byte _0801E798
	.4byte _0801E7C0
	.4byte _0801E7F4
	.4byte _0801E802
	.4byte _0801E820
_0801E798:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801E7AC
	movs r0, 0x1
	bl sub_801EBD4
	b _0801E830
	.pool
_0801E7AC:
	ldr r0, [r4]
	movs r1, 0xC8
	lsls r1, 1
	adds r0, r1
	bl sub_801EF4C
	ldr r1, [r4]
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
_0801E7C0:
	bl sub_800A520
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0801E830
	bl sub_8011A9C
	cmp r0, 0
	bne _0801E830
	ldr r4, =gUnknown_02022C84
	ldr r1, [r4]
	movs r0, 0xC8
	lsls r0, 1
	adds r1, r0
	movs r0, 0
	movs r2, 0x28
	bl link_0800A448
	lsls r0, 24
	cmp r0, 0
	beq _0801E830
	ldr r1, [r4]
	b _0801E812
	.pool
_0801E7F4:
	bl sub_801EE10
	movs r0, 0x8
	movs r1, 0
	bl sub_801F5EC
	b _0801E80E
_0801E802:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	bne _0801E830
_0801E80E:
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
_0801E812:
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	b _0801E830
	.pool
_0801E820:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _0801E830
	movs r0, 0x1
	bl sub_801EBD4
_0801E830:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_801E764

	thumb_func_start sub_801E838
sub_801E838: @ 801E838
	push {r4,lr}
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	ldrh r0, [r0, 0x6]
	cmp r0, 0x6
	bls _0801E846
	b _0801E968
_0801E846:
	lsls r0, 2
	ldr r1, =_0801E858
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801E858:
	.4byte _0801E874
	.4byte _0801E8A4
	.4byte _0801E8F8
	.4byte _0801E910
	.4byte _0801E920
	.4byte _0801E934
	.4byte _0801E94C
_0801E874:
	bl sub_801EDC4
	cmp r0, 0
	beq _0801E890
	movs r0, 0x9
	movs r1, 0
	bl sub_801F5EC
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x2
	b _0801E966
	.pool
_0801E890:
	movs r0, 0xD
	movs r1, 0
	bl sub_801F5EC
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x5
	b _0801E966
	.pool
_0801E8A4:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0801E8CC
	bl sub_801EDE0
	movs r0, 0xB
	movs r1, 0
	bl sub_801F5EC
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x3
	b _0801E966
	.pool
_0801E8CC:
	movs r4, 0x2
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0801E8DA
	movs r0, 0xA
	b _0801E95A
_0801E8DA:
	bl sub_801EBE4
	cmp r0, 0
	beq _0801E968
	movs r0, 0x1
	movs r1, 0
	bl sub_801F5EC
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	strh r4, [r0, 0x6]
	b _0801E968
	.pool
_0801E8F8:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	bne _0801E968
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x1
	b _0801E966
	.pool
_0801E910:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	bne _0801E968
	movs r0, 0xA
	b _0801E95A
_0801E920:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	bne _0801E968
	movs r0, 0x1
	bl sub_801EBD4
	b _0801E968
_0801E934:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	bne _0801E968
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x6
	b _0801E966
	.pool
_0801E94C:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _0801E968
	movs r0, 0x7
_0801E95A:
	movs r1, 0
	bl sub_801F5EC
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x4
_0801E966:
	strh r0, [r1, 0x6]
_0801E968:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801E838

	thumb_func_start sub_801E978
sub_801E978: @ 801E978
	push {r4,lr}
	sub sp, 0x4
	ldr r1, =gUnknown_02022C84
	ldr r0, [r1]
	ldrh r0, [r0, 0x6]
	adds r4, r1, 0
	cmp r0, 0xD
	bls _0801E98A
	b _0801EBC2
_0801E98A:
	lsls r0, 2
	ldr r1, =_0801E99C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801E99C:
	.4byte _0801E9D4
	.4byte _0801E9EE
	.4byte _0801EA14
	.4byte _0801EA58
	.4byte _0801EA7C
	.4byte _0801EA98
	.4byte _0801EADC
	.4byte _0801EB04
	.4byte _0801EB28
	.4byte _0801EB40
	.4byte _0801EB64
	.4byte _0801EB72
	.4byte _0801EB88
	.4byte _0801EBA8
_0801E9D4:
	ldr r1, [r4]
	ldrb r0, [r1, 0x18]
	cmp r0, 0
	bne _0801E9DE
	b _0801EB82
_0801E9DE:
	movs r0, 0x7
	movs r1, 0
	bl sub_801F5EC
	ldr r1, [r4]
	movs r0, 0x1
	strh r0, [r1, 0x6]
	b _0801EBC2
_0801E9EE:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	beq _0801E9FC
	b _0801EBC2
_0801E9FC:
	movs r0, 0xE
	movs r1, 0
	bl sub_801F5EC
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x2
	strh r0, [r1, 0x6]
	b _0801EBC2
	.pool
_0801EA14:
	bl sub_801FF08
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0801EA40
	cmp r1, 0
	bgt _0801EA2E
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0801EA34
	b _0801EBC2
_0801EA2E:
	cmp r1, 0x1
	beq _0801EA34
	b _0801EBC2
_0801EA34:
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	b _0801EB82
	.pool
_0801EA40:
	movs r0, 0x7
	movs r1, 0
	bl sub_801F5EC
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x3
	strh r0, [r1, 0x6]
	b _0801EBC2
	.pool
_0801EA58:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	beq _0801EA66
	b _0801EBC2
_0801EA66:
	movs r0, 0xF
	movs r1, 0
	bl sub_801F5EC
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x4
	strh r0, [r1, 0x6]
	b _0801EBC2
	.pool
_0801EA7C:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	beq _0801EA8A
	b _0801EBC2
_0801EA8A:
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x5
	strh r0, [r1, 0x6]
	b _0801EBC2
	.pool
_0801EA98:
	bl sub_801FF08
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0801EAC4
	cmp r1, 0
	bgt _0801EAB2
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0801EAB8
	b _0801EBC2
_0801EAB2:
	cmp r1, 0x1
	beq _0801EAB8
	b _0801EBC2
_0801EAB8:
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	b _0801EB82
	.pool
_0801EAC4:
	movs r0, 0x7
	movs r1, 0
	bl sub_801F5EC
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x6
	strh r0, [r1, 0x6]
	b _0801EBC2
	.pool
_0801EADC:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	bne _0801EBC2
	movs r0, 0x10
	movs r1, 0
	bl sub_801F5EC
	bl sub_801EE2C
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x7
	strh r0, [r1, 0x6]
	b _0801EBC2
	.pool
_0801EB04:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	bne _0801EBC2
	bl sub_8076D5C
	movs r0, 0
	bl save_game_when_memory_present
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x8
	strh r0, [r1, 0x6]
	b _0801EBC2
	.pool
_0801EB28:
	movs r0, 0x11
	movs r1, 0
	bl sub_801F5EC
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x9
	strh r0, [r1, 0x6]
	b _0801EBC2
	.pool
_0801EB40:
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	bne _0801EBC2
	movs r0, 0x37
	bl audio_play
	bl sav2_gender2_inplace_and_xFE
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0xA
	strh r0, [r1, 0x6]
	b _0801EBC2
	.pool
_0801EB64:
	ldr r1, [r4]
	movs r0, 0
	strb r0, [r1, 0x19]
	ldr r1, [r4]
	movs r0, 0xB
	strh r0, [r1, 0x6]
	b _0801EBC2
_0801EB72:
	ldr r0, [r4]
	ldrb r1, [r0, 0x19]
	adds r1, 0x1
	strb r1, [r0, 0x19]
	ldr r1, [r4]
	ldrb r0, [r1, 0x19]
	cmp r0, 0x78
	bls _0801EBC2
_0801EB82:
	movs r0, 0xC
	strh r0, [r1, 0x6]
	b _0801EBC2
_0801EB88:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0xD
	strh r0, [r1, 0x6]
	b _0801EBC2
	.pool
_0801EBA8:
	ldr r0, =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0801EBC2
	bl sub_801F544
	bl sub_801DE30
	ldr r0, =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
_0801EBC2:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801E978

	thumb_func_start sub_801EBD4
sub_801EBD4: @ 801EBD4
	ldr r1, =gUnknown_02022C84
	ldr r1, [r1]
	movs r2, 0
	strh r0, [r1, 0x4]
	strh r2, [r1, 0x6]
	bx lr
	.pool
	thumb_func_end sub_801EBD4

	thumb_func_start sub_801EBE4
sub_801EBE4: @ 801EBE4
	push {lr}
	ldr r0, =gMain
	ldrh r2, [r0, 0x30]
	movs r0, 0x40
	ands r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	bne _0801EC6E
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _0801EC24
	ldr r0, =gUnknown_02022C84
	ldr r2, [r0]
	ldr r1, =gUnknown_082F2AA4
	ldrb r0, [r2, 0x10]
	adds r0, r1
	ldrb r1, [r2, 0x12]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _0801EC20
	adds r0, r1, 0x1
	b _0801EC88
	.pool
_0801EC20:
	strb r3, [r2, 0x12]
	b _0801EC8A
_0801EC24:
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	ldrb r0, [r1, 0x10]
	cmp r0, 0x3
	beq _0801EC6A
	movs r0, 0x20
	ands r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _0801EC52
	ldrb r0, [r1, 0x11]
	cmp r0, 0
	beq _0801EC4C
	subs r0, 0x1
	strb r0, [r1, 0x11]
	b _0801EC8A
	.pool
_0801EC4C:
	movs r0, 0x4
	strb r0, [r1, 0x11]
	b _0801EC8A
_0801EC52:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _0801EC6A
	ldrb r0, [r1, 0x11]
	cmp r0, 0x3
	bhi _0801EC66
	adds r0, 0x1
	strb r0, [r1, 0x11]
	b _0801EC8A
_0801EC66:
	strb r3, [r1, 0x11]
	b _0801EC8A
_0801EC6A:
	movs r0, 0
	b _0801EC8C
_0801EC6E:
	ldr r0, =gUnknown_02022C84
	ldr r2, [r0]
	ldrb r0, [r2, 0x12]
	cmp r0, 0
	beq _0801EC80
	subs r0, 0x1
	b _0801EC88
	.pool
_0801EC80:
	ldr r0, =gUnknown_082F2AA4
	ldrb r1, [r2, 0x10]
	adds r1, r0
	ldrb r0, [r1]
_0801EC88:
	strb r0, [r2, 0x12]
_0801EC8A:
	movs r0, 0x1
_0801EC8C:
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801EBE4

	thumb_func_start sub_801EC94
sub_801EC94: @ 801EC94
	push {r4-r6,lr}
	sub sp, 0x18
	ldr r0, =gUnknown_02022C84
	ldr r5, [r0]
	ldrb r0, [r5, 0x10]
	cmp r0, 0x3
	beq _0801ECDC
	ldr r3, =gUnknown_082F2BA8
	ldrb r1, [r5, 0x12]
	lsls r1, 2
	adds r2, r0, 0
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r1, r3
	ldr r4, [r1]
	ldrb r0, [r5, 0x11]
	cmp r0, 0
	beq _0801ECCE
	adds r1, r0, 0
_0801ECBE:
	ldrb r0, [r4]
	cmp r0, 0xF9
	bne _0801ECC6
	adds r4, 0x1
_0801ECC6:
	adds r4, 0x1
	subs r1, 0x1
	cmp r1, 0
	bne _0801ECBE
_0801ECCE:
	movs r5, 0x1
	b _0801ED02
	.pool
_0801ECDC:
	ldrb r0, [r5, 0x12]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r0
	adds r1, 0xB9
	adds r1, r5, r1
	mov r0, sp
	bl StringCopy
	movs r1, 0
	strb r1, [r0]
	movs r1, 0xFF
	strb r1, [r0, 0x1]
	mov r4, sp
	mov r0, sp
	bl StringLength_Multibyte
	adds r5, r0, 0
_0801ED02:
	ldr r6, =gUnknown_02022C84
	ldr r1, [r6]
	ldrb r0, [r1, 0x15]
	strb r0, [r1, 0x14]
	cmp r4, 0
	beq _0801ED5A
	bl sub_801EE84
	adds r2, r0, 0
	subs r5, 0x1
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	beq _0801ED56
	ldr r0, [r6]
	ldrb r0, [r0, 0x15]
	cmp r0, 0xE
	bhi _0801ED56
	adds r3, r6, 0
_0801ED28:
	ldrb r0, [r4]
	cmp r0, 0xF9
	bne _0801ED34
	strb r0, [r2]
	adds r4, 0x1
	adds r2, 0x1
_0801ED34:
	ldrb r0, [r4]
	strb r0, [r2]
	adds r4, 0x1
	adds r2, 0x1
	ldr r1, [r3]
	ldrb r0, [r1, 0x15]
	adds r0, 0x1
	strb r0, [r1, 0x15]
	subs r5, 0x1
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	beq _0801ED56
	ldr r0, [r3]
	ldrb r0, [r0, 0x15]
	cmp r0, 0xE
	bls _0801ED28
_0801ED56:
	movs r0, 0xFF
	strb r0, [r2]
_0801ED5A:
	add sp, 0x18
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801EC94

	thumb_func_start sub_801ED68
sub_801ED68: @ 801ED68
	push {r4,lr}
	ldr r4, =gUnknown_02022C84
	ldr r1, [r4]
	ldrb r0, [r1, 0x15]
	strb r0, [r1, 0x14]
	ldr r0, [r4]
	ldrb r0, [r0, 0x15]
	cmp r0, 0
	beq _0801ED8A
	bl sub_801EEA8
	movs r1, 0xFF
	strb r1, [r0]
	ldr r1, [r4]
	ldrb r0, [r1, 0x15]
	subs r0, 0x1
	strb r0, [r1, 0x15]
_0801ED8A:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801ED68

	thumb_func_start sub_801ED94
sub_801ED94: @ 801ED94
	push {lr}
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	ldrb r0, [r1, 0x15]
	subs r0, 0x1
	strb r0, [r1, 0x14]
	bl sub_801EEA8
	adds r2, r0, 0
	ldrb r0, [r2]
	cmp r0, 0xF9
	beq _0801EDB8
	ldr r1, =gUnknown_082F2AA8
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0801EDB8
	strb r0, [r2]
_0801EDB8:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801ED94

	thumb_func_start sub_801EDC4
sub_801EDC4: @ 801EDC4
	push {lr}
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	ldrb r0, [r0, 0x15]
	cmp r0, 0
	bne _0801EDD8
	movs r0, 0
	b _0801EDDA
	.pool
_0801EDD8:
	movs r0, 0x1
_0801EDDA:
	pop {r1}
	bx r1
	thumb_func_end sub_801EDC4

	thumb_func_start sub_801EDE0
sub_801EDE0: @ 801EDE0
	push {r4,lr}
	bl sub_801F114
	adds r1, r0, 0
	ldr r4, =gUnknown_02022C84
	ldr r0, [r4]
	ldrb r3, [r0, 0x12]
	lsls r2, r3, 2
	adds r2, r3
	lsls r2, 2
	adds r2, r3
	adds r2, 0xB9
	adds r0, r2
	bl StringCopy
	ldr r1, [r4]
	movs r0, 0x1
	strb r0, [r1, 0x18]
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801EDE0

	thumb_func_start sub_801EE10
sub_801EE10: @ 801EE10
	ldr r1, =gUnknown_02022C84
	ldr r2, [r1]
	movs r0, 0xFF
	strb r0, [r2, 0x1A]
	ldr r2, [r1]
	movs r3, 0
	movs r0, 0xF
	strb r0, [r2, 0x14]
	ldr r0, [r1]
	strb r3, [r0, 0x15]
	bx lr
	.pool
	thumb_func_end sub_801EE10

	thumb_func_start sub_801EE2C
sub_801EE2C: @ 801EE2C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, =gSaveBlock1Ptr
	mov r8, r0
	ldr r7, =gUnknown_02022C84
	movs r6, 0xB9
	ldr r5, =0x00003c88
	movs r4, 0x9
_0801EE3E:
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5
	ldr r1, [r7]
	adds r1, r6
	bl StringCopy
	adds r6, 0x15
	adds r5, 0x15
	subs r4, 0x1
	cmp r4, 0
	bge _0801EE3E
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801EE2C

	thumb_func_start sub_801EE6C
sub_801EE6C: @ 801EE6C
	ldr r2, =gUnknown_02022C84
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r0
	adds r1, 0xB9
	ldr r0, [r2]
	adds r0, r1
	bx lr
	.pool
	thumb_func_end sub_801EE6C

	thumb_func_start sub_801EE84
sub_801EE84: @ 801EE84
	push {lr}
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x1A
	ldrb r0, [r0, 0x1A]
	cmp r0, 0xFF
	beq _0801EE9C
_0801EE94:
	adds r1, 0x1
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _0801EE94
_0801EE9C:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801EE84

	thumb_func_start sub_801EEA8
sub_801EEA8: @ 801EEA8
	push {lr}
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	adds r2, r0, 0
	adds r2, 0x1A
	adds r1, r2, 0
	ldrb r0, [r0, 0x1A]
	cmp r0, 0xFF
	beq _0801EECC
_0801EEBA:
	adds r2, r1, 0
	ldrb r0, [r2]
	cmp r0, 0xF9
	bne _0801EEC4
	adds r1, r2, 0x1
_0801EEC4:
	adds r1, 0x1
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _0801EEBA
_0801EECC:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801EEA8

	thumb_func_start sub_801EED8
sub_801EED8: @ 801EED8
	push {r4,lr}
	ldr r4, =gUnknown_02022C84
	ldr r0, [r4]
	adds r0, 0x1A
	bl StringLength_Multibyte
	adds r2, r0, 0
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x1A
	movs r4, 0
	cmp r2, 0xA
	bls _0801EF0C
	subs r2, 0xA
	movs r3, 0
	cmp r4, r2
	bcs _0801EF0C
_0801EEFA:
	ldrb r0, [r1]
	cmp r0, 0xF9
	bne _0801EF02
	adds r1, 0x1
_0801EF02:
	adds r1, 0x1
	adds r4, 0x1
	adds r3, 0x1
	cmp r3, r2
	bcc _0801EEFA
_0801EF0C:
	lsls r0, r4, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801EED8

	thumb_func_start sub_801EF1C
sub_801EF1C: @ 801EF1C
	movs r1, 0
	strb r1, [r0]
	bx lr
	thumb_func_end sub_801EF1C

	thumb_func_start sub_801EF24
sub_801EF24: @ 801EF24
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2
	strb r0, [r4]
	adds r0, r4, 0x1
	ldr r1, =gSaveBlock2Ptr
	ldr r1, [r1]
	bl StringCopy
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	strb r0, [r4, 0x9]
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801EF24

	thumb_func_start sub_801EF4C
sub_801EF4C: @ 801EF4C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	strb r0, [r4]
	adds r0, r4, 0x1
	ldr r1, =gSaveBlock2Ptr
	ldr r1, [r1]
	bl StringCopy
	adds r4, 0x9
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	adds r1, 0x1A
	adds r0, r4, 0
	bl StringCopy
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801EF4C

	thumb_func_start sub_801EF7C
sub_801EF7C: @ 801EF7C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x3
	strb r0, [r4]
	adds r0, r4, 0x1
	ldr r1, =gSaveBlock2Ptr
	ldr r1, [r1]
	bl StringCopy
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	strb r0, [r4, 0x9]
	bl sub_8011A50
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801EF7C

	thumb_func_start sub_801EFA8
sub_801EFA8: @ 801EFA8
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x4
	strb r0, [r4]
	adds r0, r4, 0x1
	ldr r1, =gSaveBlock2Ptr
	ldr r1, [r1]
	bl StringCopy
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	strb r0, [r4, 0x9]
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801EFA8

	thumb_func_start sub_801EFD0
sub_801EFD0: @ 801EFD0
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x5
	strb r0, [r4]
	adds r0, r4, 0x1
	ldr r1, =gSaveBlock2Ptr
	ldr r1, [r1]
	bl StringCopy
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	strb r0, [r4, 0x9]
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801EFD0

	thumb_func_start sub_801EFF8
sub_801EFF8: @ 801EFF8
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	ldrb r0, [r5]
	adds r1, r0, 0
	adds r4, r5, 0x1
	adds r5, r4, 0
	adds r5, 0x8
	cmp r0, 0x2
	beq _0801F020
	cmp r0, 0x2
	bgt _0801F016
	cmp r0, 0x1
	beq _0801F044
	b _0801F0A8
_0801F016:
	cmp r1, 0x3
	beq _0801F07A
	cmp r1, 0x5
	beq _0801F06E
	b _0801F0A8
_0801F020:
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	ldrb r1, [r4, 0x8]
	cmp r0, r1
	beq _0801F0A8
	bl sub_81AFBF0
	movs r0, 0
	adds r1, r4, 0
	bl sub_81AFC0C
	ldr r1, =gUnknown_085ED2A9
	b _0801F094
	.pool
_0801F044:
	adds r0, r6, 0
	adds r1, r4, 0
	bl StringCopy
	movs r1, 0xFC
	strb r1, [r0]
	adds r0, 0x1
	movs r1, 0x13
	strb r1, [r0]
	adds r0, 0x1
	movs r1, 0x2A
	strb r1, [r0]
	adds r0, 0x1
	movs r1, 0xF0
	strb r1, [r0]
	adds r0, 0x1
	adds r1, r5, 0
	bl StringCopy
	movs r0, 0x1
	b _0801F0AA
_0801F06E:
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	adds r0, 0x79
	adds r1, r4, 0
	bl StringCopy
_0801F07A:
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	ldrb r5, [r5]
	cmp r0, r5
	beq _0801F0A8
	bl sub_81AFBF0
	movs r0, 0
	adds r1, r4, 0
	bl sub_81AFC0C
	ldr r1, =gUnknown_085ED2BD
_0801F094:
	adds r0, r6, 0
	bl sub_81AFC28
	movs r0, 0x1
	b _0801F0AA
	.pool
_0801F0A8:
	movs r0, 0
_0801F0AA:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_801EFF8

	thumb_func_start sub_801F0B0
sub_801F0B0: @ 801F0B0
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	ldrb r0, [r0, 0x10]
	bx lr
	.pool
	thumb_func_end sub_801F0B0

	thumb_func_start sub_801F0BC
sub_801F0BC: @ 801F0BC
	ldr r2, =gUnknown_02022C84
	ldr r3, [r2]
	ldrb r2, [r3, 0x11]
	strb r2, [r0]
	ldrb r0, [r3, 0x12]
	strb r0, [r1]
	bx lr
	.pool
	thumb_func_end sub_801F0BC

	thumb_func_start sub_801F0D0
sub_801F0D0: @ 801F0D0
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	adds r0, 0x1A
	bx lr
	.pool
	thumb_func_end sub_801F0D0

	thumb_func_start sub_801F0DC
sub_801F0DC: @ 801F0DC
	push {lr}
	bl sub_801F0D0
	bl StringLength_Multibyte
	pop {r1}
	bx r1
	thumb_func_end sub_801F0DC

	thumb_func_start sub_801F0EC
sub_801F0EC: @ 801F0EC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	ldrb r3, [r0, 0x15]
	ldrb r2, [r0, 0x14]
	subs r0, r3, r2
	cmp r0, 0
	bge _0801F108
	negs r0, r0
	str r3, [r4]
	b _0801F10A
	.pool
_0801F108:
	str r2, [r4]
_0801F10A:
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_801F0EC

	thumb_func_start sub_801F114
sub_801F114: @ 801F114
	push {lr}
	bl sub_801EED8
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x1A
	cmp r2, 0
	beq _0801F13A
_0801F12A:
	ldrb r0, [r1]
	cmp r0, 0xF9
	bne _0801F132
	adds r1, 0x1
_0801F132:
	adds r1, 0x1
	subs r2, 0x1
	cmp r2, 0
	bne _0801F12A
_0801F13A:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801F114

	thumb_func_start sub_801F144
sub_801F144: @ 801F144
	push {r4,lr}
	bl sub_801EED8
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x1A
	movs r2, 0
	movs r3, 0
	cmp r2, r4
	bcs _0801F174
_0801F15E:
	ldrb r0, [r1]
	cmp r0, 0xF9
	bne _0801F166
	adds r1, 0x1
_0801F166:
	adds r1, 0x1
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	adds r3, 0x1
	cmp r3, r4
	bcc _0801F15E
_0801F174:
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_801F144

	thumb_func_start sub_801F180
sub_801F180: @ 801F180
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	adds r0, 0x39
	bx lr
	.pool
	thumb_func_end sub_801F180

	thumb_func_start sub_801F18C
sub_801F18C: @ 801F18C
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	ldrb r0, [r0, 0x16]
	bx lr
	.pool
	thumb_func_end sub_801F18C

	thumb_func_start sub_801F198
sub_801F198: @ 801F198
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	ldrb r0, [r0, 0x15]
	bx lr
	.pool
	thumb_func_end sub_801F198

	thumb_func_start sub_801F1A4
sub_801F1A4: @ 801F1A4
	push {lr}
	bl sub_801EEA8
	ldrb r1, [r0]
	cmp r1, 0xFF
	bhi _0801F1BE
	ldr r0, =gUnknown_082F2AA8
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, r1
	beq _0801F1BE
	cmp r0, 0
	bne _0801F1C8
_0801F1BE:
	movs r0, 0x3
	b _0801F1CA
	.pool
_0801F1C8:
	movs r0, 0
_0801F1CA:
	pop {r1}
	bx r1
	thumb_func_end sub_801F1A4

	thumb_func_start sub_801F1D0
sub_801F1D0: @ 801F1D0
	ldr r0, =gUnknown_02022C84
	ldr r0, [r0]
	adds r0, 0x79
	bx lr
	.pool
	thumb_func_end sub_801F1D0

	thumb_func_start copy_strings_to_sav1
copy_strings_to_sav1: @ 801F1DC
	push {r4,lr}
	ldr r4, =gSaveBlock1Ptr
	ldr r0, [r4]
	ldr r1, =0x00003c88
	adds r0, r1
	ldr r1, =gUnknown_085ED40F
	bl StringCopy
	ldr r0, [r4]
	ldr r1, =0x00003c9d
	adds r0, r1
	ldr r1, =gUnknown_085ED415
	bl StringCopy
	ldr r0, [r4]
	ldr r1, =0x00003cb2
	adds r0, r1
	ldr r1, =gUnknown_085ED41D
	bl StringCopy
	ldr r0, [r4]
	ldr r1, =0x00003cc7
	adds r0, r1
	ldr r1, =gUnknown_085ED423
	bl StringCopy
	ldr r0, [r4]
	ldr r1, =0x00003cdc
	adds r0, r1
	ldr r1, =gUnknown_085ED42A
	bl StringCopy
	ldr r0, [r4]
	ldr r1, =0x00003cf1
	adds r0, r1
	ldr r1, =gUnknown_085ED430
	bl StringCopy
	ldr r0, [r4]
	ldr r1, =0x00003d06
	adds r0, r1
	ldr r1, =gUnknown_085ED434
	bl StringCopy
	ldr r0, [r4]
	ldr r1, =0x00003d1b
	adds r0, r1
	ldr r1, =gUnknown_085ED43A
	bl StringCopy
	ldr r0, [r4]
	ldr r1, =0x00003d30
	adds r0, r1
	ldr r1, =gUnknown_085ED440
	bl StringCopy
	ldr r0, [r4]
	ldr r1, =0x00003d45
	adds r0, r1
	ldr r1, =gUnknown_085ED44A
	bl StringCopy
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end copy_strings_to_sav1

	thumb_func_start sub_801F2B4
sub_801F2B4: @ 801F2B4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, =gTasks + 0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bls _0801F2CE
	b _0801F4C4
_0801F2CE:
	lsls r0, 2
	ldr r1, =_0801F2E0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801F2E0:
	.4byte _0801F300
	.4byte _0801F30E
	.4byte _0801F4A8
	.4byte _0801F35C
	.4byte _0801F448
	.4byte _0801F480
	.4byte _0801F494
	.4byte _0801F438
_0801F300:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801F30A
	b _0801F49C
_0801F30A:
	movs r0, 0x1
	strh r0, [r4]
_0801F30E:
	bl sub_8009FCC
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	strh r0, [r4, 0x8]
	ldr r3, =gUnknown_02022C84
	ldr r0, [r3]
	ldrb r1, [r0, 0xD]
	movs r5, 0x8
	ldrsh r0, [r4, r5]
	cmp r1, r0
	beq _0801F33C
	movs r0, 0x2
	strh r0, [r4]
	ldr r0, [r3]
	strb r2, [r0, 0xD]
	b _0801F4C4
	.pool
_0801F33C:
	bl sub_800A550
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x6]
	cmp r0, 0
	bne _0801F354
	bl sub_8011A9C
	cmp r0, 0
	beq _0801F354
	b _0801F4C4
_0801F354:
	movs r0, 0
	strh r0, [r4, 0x2]
	movs r0, 0x3
	strh r0, [r4]
_0801F35C:
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bgt _0801F396
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	movs r3, 0x2
	ldrsh r1, [r4, r3]
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0801F396
	movs r2, 0x1
_0801F378:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bgt _0801F396
	movs r5, 0x6
	ldrsh r0, [r4, r5]
	movs r3, 0x2
	ldrsh r1, [r4, r3]
	asrs r0, r1
	ands r0, r2
	cmp r0, 0
	beq _0801F378
_0801F396:
	ldrh r1, [r4, 0x2]
	movs r5, 0x2
	ldrsh r0, [r4, r5]
	cmp r0, 0x5
	bne _0801F3A2
	b _0801F4C0
_0801F3A2:
	strh r1, [r4, 0x4]
	lsls r0, r1, 24
	lsrs r0, 24
	bl sub_800A5EC
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	lsls r0, 8
	ldr r1, =gUnknown_020223C4
	adds r0, r1
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, 0x4
	bhi _0801F3E4
	lsls r0, 2
	ldr r1, =_0801F3D0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801F3D0:
	.4byte _0801F3E4
	.4byte _0801F3E8
	.4byte _0801F3EC
	.4byte _0801F3F0
	.4byte _0801F3F4
_0801F3E4:
	movs r0, 0x3
	b _0801F3F6
_0801F3E8:
	movs r0, 0x3
	b _0801F3F6
_0801F3EC:
	movs r0, 0x4
	b _0801F3F6
_0801F3F0:
	movs r0, 0x5
	b _0801F3F6
_0801F3F4:
	movs r0, 0x6
_0801F3F6:
	strh r0, [r4, 0xA]
	ldr r5, =gUnknown_02022C84
	ldr r0, [r5]
	adds r0, 0x39
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	lsls r1, 8
	ldr r2, =gUnknown_020223C4
	adds r1, r2
	bl sub_801EFF8
	cmp r0, 0
	beq _0801F42C
	ldr r0, [r5]
	ldrh r1, [r4, 0x2]
	strb r1, [r0, 0x16]
	movs r0, 0xC
	movs r1, 0x2
	bl sub_801F5EC
	movs r0, 0x7
	b _0801F42E
	.pool
_0801F42C:
	ldrh r0, [r4, 0xA]
_0801F42E:
	strh r0, [r4]
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	b _0801F4C4
_0801F438:
	movs r0, 0x2
	bl sub_801F644
	lsls r0, 24
	cmp r0, 0
	bne _0801F4C4
	ldrh r0, [r4, 0xA]
	b _0801F4C2
_0801F448:
	ldr r6, =gUnknown_02022C84
	ldr r0, [r6]
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	bne _0801F47C
	movs r3, 0x4
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _0801F47C
	bl sub_8009FCC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0801F474
	bl sub_80104B0
	ldr r1, [r6]
	movs r0, 0x1
	b _0801F49A
	.pool
_0801F474:
	movs r5, 0x4
	ldrsh r0, [r4, r5]
	bl sub_8011DE0
_0801F47C:
	movs r0, 0x3
	b _0801F4C2
_0801F480:
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	ldrb r0, [r1, 0x13]
	cmp r0, 0
	beq _0801F49C
	movs r0, 0x2
	b _0801F49A
	.pool
_0801F494:
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	movs r0, 0x3
_0801F49A:
	strb r0, [r1, 0x17]
_0801F49C:
	adds r0, r5, 0
	bl DestroyTask
	b _0801F4C4
	.pool
_0801F4A8:
	bl sub_8011A9C
	cmp r0, 0
	bne _0801F4C4
	ldr r0, =gUnknown_02022C84
	ldr r1, [r0]
	ldrb r0, [r1, 0x13]
	cmp r0, 0
	bne _0801F4C0
	ldrb r0, [r1, 0xD]
	bl sub_80110B8
_0801F4C0:
	movs r0, 0x1
_0801F4C2:
	strh r0, [r4]
_0801F4C4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801F2B4

	thumb_func_start sub_801F4D0
sub_801F4D0: @ 801F4D0
	push {r4,lr}
	ldr r4, =gUnknown_02022C88
	ldr r0, =0x00002168
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	beq _0801F52C
	bl sub_8020890
	cmp r0, 0
	beq _0801F52C
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, =gUnknown_082F2C60
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	ldr r0, =gUnknown_082F2C70
	bl InitWindows
	bl reset_temp_tile_data_buffers
	bl sub_8020770
	ldr r0, [r4]
	bl sub_801F574
	bl sub_801F580
	movs r0, 0
	movs r1, 0
	bl sub_801F5EC
	movs r0, 0x1
	b _0801F52E
	.pool
_0801F52C:
	movs r0, 0
_0801F52E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801F4D0

	thumb_func_start sub_801F534
sub_801F534: @ 801F534
	push {lr}
	movs r0, 0
	bl sub_801F644
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_801F534

	thumb_func_start sub_801F544
sub_801F544: @ 801F544
	push {r4,lr}
	bl sub_80208D0
	ldr r4, =gUnknown_02022C88
	ldr r0, [r4]
	cmp r0, 0
	beq _0801F55A
	bl Free
	movs r0, 0
	str r0, [r4]
_0801F55A:
	bl FreeAllWindowBuffers
	ldr r1, =gUnknown_02039B28
	movs r0, 0x3
	strb r0, [r1, 0x15]
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801F544

	thumb_func_start sub_801F574
sub_801F574: @ 801F574
	movs r2, 0
	movs r1, 0xFF
	strh r1, [r0, 0x18]
	strh r1, [r0, 0x1E]
	strh r2, [r0, 0x1A]
	bx lr
	thumb_func_end sub_801F574

	thumb_func_start sub_801F580
sub_801F580: @ 801F580
	push {r4,r5,lr}
	ldr r1, =gUnknown_02022C88
	ldr r0, [r1]
	cmp r0, 0
	beq _0801F5A8
	movs r2, 0
	adds r4, r1, 0
	ldr r5, =sub_801FDD8
	movs r3, 0
_0801F592:
	ldr r0, [r4]
	lsls r1, r2, 3
	adds r0, r1
	str r5, [r0]
	strb r3, [r0, 0x4]
	ldr r0, [r4]
	adds r0, r1
	strb r3, [r0, 0x5]
	adds r2, 0x1
	cmp r2, 0x2
	ble _0801F592
_0801F5A8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801F580

	thumb_func_start sub_801F5B8
sub_801F5B8: @ 801F5B8
	push {r4-r6,lr}
	ldr r1, =gUnknown_02022C88
	ldr r0, [r1]
	cmp r0, 0
	beq _0801F5E0
	movs r5, 0
	adds r6, r1, 0
_0801F5C6:
	ldr r1, [r6]
	lsls r4, r5, 3
	adds r1, r4
	adds r0, r1, 0x5
	ldr r1, [r1]
	bl _call_via_r1
	ldr r1, [r6]
	adds r1, r4
	strb r0, [r1, 0x4]
	adds r5, 0x1
	cmp r5, 0x2
	ble _0801F5C6
_0801F5E0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801F5B8

	thumb_func_start sub_801F5EC
sub_801F5EC: @ 801F5EC
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	ldr r3, =gUnknown_02022C88
	ldr r0, [r3]
	lsrs r1, 21
	adds r0, r1
	ldr r2, =sub_801FDD8
	str r2, [r0]
	movs r4, 0
	adds r5, r3, 0
	adds r3, r1, 0
	mov r12, r4
	ldr r1, =gUnknown_082F2C98
	movs r7, 0x1
	adds r2, r1, 0x4
_0801F60E:
	ldrh r0, [r1]
	cmp r0, r6
	bne _0801F634
	ldr r1, [r5]
	adds r1, r3
	ldr r0, [r2]
	str r0, [r1]
	strb r7, [r1, 0x4]
	ldr r0, [r5]
	adds r0, r3
	mov r1, r12
	strb r1, [r0, 0x5]
	b _0801F63E
	.pool
_0801F634:
	adds r1, 0x8
	adds r2, 0x8
	adds r4, 0x1
	cmp r4, 0x14
	bls _0801F60E
_0801F63E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_801F5EC

	thumb_func_start sub_801F644
sub_801F644: @ 801F644
	lsls r0, 24
	ldr r1, =gUnknown_02022C88
	ldr r1, [r1]
	lsrs r0, 21
	adds r1, r0
	ldrb r0, [r1, 0x4]
	bx lr
	.pool
	thumb_func_end sub_801F644

	thumb_func_start sub_801F658
sub_801F658: @ 801F658
	push {r4,lr}
	adds r4, r0, 0
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0801F6EE
	ldrb r0, [r4]
	cmp r0, 0x6
	bhi _0801F6E4
	lsls r0, 2
	ldr r1, =_0801F67C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801F67C:
	.4byte _0801F698
	.4byte _0801F6A2
	.4byte _0801F6A8
	.4byte _0801F6AE
	.4byte _0801F6B4
	.4byte _0801F6BA
	.4byte _0801F6CC
_0801F698:
	bl sub_8020480
	bl sub_8020538
	b _0801F6E8
_0801F6A2:
	bl sub_8020584
	b _0801F6E8
_0801F6A8:
	bl sub_80205B4
	b _0801F6E8
_0801F6AE:
	bl task_tutorial_story_unknown
	b _0801F6E8
_0801F6B4:
	bl sub_8020680
	b _0801F6E8
_0801F6BA:
	bl sub_80206A4
	bl sub_80206D0
	bl sub_8020740
	bl sub_80206E8
	b _0801F6E8
_0801F6CC:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0801F6E8
	bl sub_80208E8
	bl sub_8020A68
	bl sub_8020B20
	b _0801F6E8
_0801F6E4:
	movs r0, 0
	b _0801F6F0
_0801F6E8:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_0801F6EE:
	movs r0, 0x1
_0801F6F0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801F658

	thumb_func_start sub_801F6F8
sub_801F6F8: @ 801F6F8
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0801F708
	cmp r0, 0x1
	beq _0801F716
	b _0801F720
_0801F708:
	bl sub_80203B0
	movs r0, 0x3
	movs r1, 0x3
	bl CopyWindowToVram
	b _0801F720
_0801F716:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0801F728
_0801F720:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r0, 0x1
_0801F728:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801F6F8

	thumb_func_start sub_801F730
sub_801F730: @ 801F730
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0801F740
	cmp r0, 0x1
	beq _0801F74E
	b _0801F758
_0801F740:
	bl sub_802040C
	movs r0, 0x3
	movs r1, 0x3
	bl CopyWindowToVram
	b _0801F758
_0801F74E:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0801F760
_0801F758:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r0, 0x1
_0801F760:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801F730

	thumb_func_start sub_801F768
sub_801F768: @ 801F768
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _0801F79E
	cmp r0, 0x1
	bgt _0801F77C
	cmp r0, 0
	beq _0801F782
	b _0801F7C4
_0801F77C:
	cmp r0, 0x2
	beq _0801F7AA
	b _0801F7C4
_0801F782:
	movs r0, 0x1
	bl sub_802091C
	bl sub_8020320
	cmp r0, 0
	bne _0801F7CA
	bl sub_80201A4
	movs r0, 0x2
	movs r1, 0x2
	bl CopyWindowToVram
	b _0801F7C4
_0801F79E:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	beq _0801F7C4
	b _0801F7CA
_0801F7AA:
	bl sub_8020368
	cmp r0, 0
	bne _0801F7CA
	bl sub_802093C
	movs r0, 0
	bl sub_802091C
	bl sub_8020B80
	movs r0, 0
	b _0801F7CC
_0801F7C4:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_0801F7CA:
	movs r0, 0x1
_0801F7CC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801F768

	thumb_func_start sub_801F7D4
sub_801F7D4: @ 801F7D4
	push {lr}
	bl sub_802093C
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_801F7D4

	thumb_func_start sub_801F7E0
sub_801F7E0: @ 801F7E0
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0801F7F0
	cmp r0, 0x1
	beq _0801F814
	b _0801F81E
_0801F7F0:
	movs r0, 0
	movs r1, 0
	bl sub_801FF18
	movs r0, 0x17
	movs r1, 0xB
	movs r2, 0x1
	bl sub_801FDDC
	ldr r0, =gUnknown_02022C88
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	b _0801F81E
	.pool
_0801F814:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0801F826
_0801F81E:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r0, 0x1
_0801F826:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801F7E0

	thumb_func_start sub_801F82C
sub_801F82C: @ 801F82C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0801F83C
	cmp r0, 0x1
	beq _0801F84C
	b _0801F862
_0801F83C:
	bl sub_8020094
	bl sub_801FEBC
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	b _0801F862
_0801F84C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0801F868
	bl sub_80200C8
	bl sub_801FEE4
	movs r0, 0
	b _0801F86A
_0801F862:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_0801F868:
	movs r0, 0x1
_0801F86A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801F82C

	thumb_func_start sub_801F870
sub_801F870: @ 801F870
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0801F882
	cmp r0, 0x1
	beq _0801F8BA
	b _0801F8CC
_0801F882:
	add r1, sp, 0x8
	add r0, sp, 0x4
	bl sub_801F0EC
	ldr r0, [sp, 0x4]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp, 0x8]
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0
	bl sub_80200EC
	bl sub_801F0D0
	adds r1, r0, 0
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_8020118
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	b _0801F8CC
_0801F8BA:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0801F8D2
	bl sub_8020B80
	movs r0, 0
	b _0801F8D4
_0801F8CC:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_0801F8D2:
	movs r0, 0x1
_0801F8D4:
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801F870

	thumb_func_start sub_801F8DC
sub_801F8DC: @ 801F8DC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _0801F938
	cmp r0, 0x1
	bgt _0801F8F2
	cmp r0, 0
	beq _0801F8FC
	b _0801F972
_0801F8F2:
	cmp r0, 0x2
	beq _0801F95C
	cmp r0, 0x3
	beq _0801F96E
	b _0801F972
_0801F8FC:
	bl sub_801F144
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl sub_801F114
	adds r5, r0, 0
	bl StringLength_Multibyte
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0x66
	bl sub_80200EC
	movs r0, 0x5
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x4
	bl sub_8020118
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	b _0801F972
_0801F938:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0801F978
	movs r0, 0x1
	movs r1, 0x10
	bl sub_801FF18
	ldr r0, =gUnknown_02022C88
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	b _0801F972
	.pool
_0801F95C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0801F978
	movs r0, 0x1
	bl sub_80209AC
	b _0801F972
_0801F96E:
	movs r0, 0
	b _0801F97A
_0801F972:
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
_0801F978:
	movs r0, 0x1
_0801F97A:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_801F8DC

	thumb_func_start sub_801F984
sub_801F984: @ 801F984
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _0801F9E0
	cmp r0, 0x1
	bgt _0801F99A
	cmp r0, 0
	beq _0801F9A4
	b _0801FA1A
_0801F99A:
	cmp r0, 0x2
	beq _0801FA00
	cmp r0, 0x3
	beq _0801FA16
	b _0801FA1A
_0801F9A4:
	bl sub_801F144
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl sub_801F114
	adds r5, r0, 0
	bl StringLength_Multibyte
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	bl sub_80200EC
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_8020118
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	b _0801FA1A
_0801F9E0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0801FA20
	bl sub_8020094
	ldr r0, =gUnknown_02022C88
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	b _0801FA1A
	.pool
_0801FA00:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0801FA20
	movs r0, 0
	bl sub_80209AC
	bl sub_80200C8
	b _0801FA1A
_0801FA16:
	movs r0, 0
	b _0801FA22
_0801FA1A:
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
_0801FA20:
	movs r0, 0x1
_0801FA22:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_801F984

	thumb_func_start sub_801FA2C
sub_801FA2C: @ 801FA2C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0801FA3C
	cmp r0, 0x1
	beq _0801FA50
	b _0801FA5E
_0801FA3C:
	bl sub_80201A4
	movs r0, 0x2
	movs r1, 0x2
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0801FA5E
_0801FA50:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0801FA5E
	movs r0, 0
	b _0801FA60
_0801FA5E:
	movs r0, 0x1
_0801FA60:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801FA2C

	thumb_func_start sub_801FA68
sub_801FA68: @ 801FA68
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrb r0, [r6]
	cmp r0, 0x4
	bhi _0801FB3A
	lsls r0, 2
	ldr r1, =_0801FA80
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0801FA80:
	.4byte _0801FA94
	.4byte _0801FAC0
	.4byte _0801FAF0
	.4byte _0801FB14
	.4byte _0801FADE
_0801FA94:
	ldr r0, =gUnknown_02022C88
	ldr r0, [r0]
	ldrh r5, [r0, 0x1A]
	bl sub_801F180
	adds r4, r0, 0
	bl sub_801F18C
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8020420
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	b _0801FB34
	.pool
_0801FAC0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0801FB3A
	ldr r0, =gUnknown_02022C88
	ldr r1, [r0]
	ldrh r0, [r1, 0x1A]
	cmp r0, 0x8
	bhi _0801FAE8
	adds r0, 0x1
	strh r0, [r1, 0x1A]
	movs r0, 0x4
	strb r0, [r6]
_0801FADE:
	movs r0, 0
	b _0801FB3C
	.pool
_0801FAE8:
	strh r2, [r1, 0x1C]
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
_0801FAF0:
	movs r0, 0
	movs r1, 0
	movs r2, 0x5
	movs r3, 0x11
	bl ScrollWindow
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, =gUnknown_02022C88
	ldr r1, [r0]
	ldrh r0, [r1, 0x1C]
	adds r0, 0x1
	strh r0, [r1, 0x1C]
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
_0801FB14:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0801FB3A
	ldr r0, =gUnknown_02022C88
	ldr r0, [r0]
	ldrh r0, [r0, 0x1C]
	cmp r0, 0x2
	bhi _0801FB34
	ldrb r0, [r6]
	subs r0, 0x1
	b _0801FB38
	.pool
_0801FB34:
	ldrb r0, [r6]
	adds r0, 0x1
_0801FB38:
	strb r0, [r6]
_0801FB3A:
	movs r0, 0x1
_0801FB3C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_801FA68

	thumb_func_start sub_801FB44
sub_801FB44: @ 801FB44
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0801FB54
	cmp r0, 0x1
	beq _0801FB60
	b _0801FB66
_0801FB54:
	bl sub_80209E0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0801FB66
_0801FB60:
	bl sub_8020A1C
	b _0801FB68
_0801FB66:
	movs r0, 0x1
_0801FB68:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801FB44

	thumb_func_start sub_801FB70
sub_801FB70: @ 801FB70
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0801FB80
	cmp r0, 0x1
	beq _0801FBA0
	b _0801FBAA
_0801FB80:
	movs r0, 0x3
	movs r1, 0x10
	bl sub_801FF18
	ldr r0, =gUnknown_02022C88
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0801FBAA
	.pool
_0801FBA0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0801FBAC
_0801FBAA:
	movs r0, 0x1
_0801FBAC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801FB70

	thumb_func_start sub_801FBB4
sub_801FBB4: @ 801FBB4
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0801FBC4
	cmp r0, 0x1
	beq _0801FBE4
	b _0801FBEE
_0801FBC4:
	movs r0, 0x4
	movs r1, 0
	bl sub_801FF18
	ldr r0, =gUnknown_02022C88
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0801FBEE
	.pool
_0801FBE4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0801FBF0
_0801FBEE:
	movs r0, 0x1
_0801FBF0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801FBB4

	thumb_func_start sub_801FBF8
sub_801FBF8: @ 801FBF8
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0801FC08
	cmp r0, 0x1
	beq _0801FC38
	b _0801FC42
_0801FC08:
	bl sub_81AFBF0
	bl sub_801F1D0
	adds r1, r0, 0
	movs r0, 0
	bl sub_81AFC0C
	movs r0, 0x5
	movs r1, 0
	bl sub_801FF18
	ldr r0, =gUnknown_02022C88
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0801FC42
	.pool
_0801FC38:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0801FC44
_0801FC42:
	movs r0, 0x1
_0801FC44:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801FBF8

	thumb_func_start sub_801FC4C
sub_801FC4C: @ 801FC4C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0801FC5C
	cmp r0, 0x1
	beq _0801FC88
	b _0801FC92
_0801FC5C:
	movs r0, 0x6
	movs r1, 0
	bl sub_801FF18
	movs r0, 0x17
	movs r1, 0xA
	movs r2, 0x1
	bl sub_801FDDC
	ldr r0, =gUnknown_02022C88
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0801FC92
	.pool
_0801FC88:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0801FC94
_0801FC92:
	movs r0, 0x1
_0801FC94:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801FC4C

	thumb_func_start sub_801FC9C
sub_801FC9C: @ 801FC9C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0801FCAC
	cmp r0, 0x1
	beq _0801FCD8
	b _0801FCE2
_0801FCAC:
	movs r0, 0x7
	movs r1, 0
	bl sub_801FF18
	movs r0, 0x17
	movs r1, 0xA
	movs r2, 0x1
	bl sub_801FDDC
	ldr r0, =gUnknown_02022C88
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0801FCE2
	.pool
_0801FCD8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0801FCE4
_0801FCE2:
	movs r0, 0x1
_0801FCE4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801FC9C

	thumb_func_start sub_801FCEC
sub_801FCEC: @ 801FCEC
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0801FCFC
	cmp r0, 0x1
	beq _0801FD1C
	b _0801FD26
_0801FCFC:
	movs r0, 0x8
	movs r1, 0
	bl sub_801FF18
	ldr r0, =gUnknown_02022C88
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0801FD26
	.pool
_0801FD1C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0801FD28
_0801FD26:
	movs r0, 0x1
_0801FD28:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801FCEC

	thumb_func_start sub_801FD30
sub_801FD30: @ 801FD30
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0801FD40
	cmp r0, 0x1
	beq _0801FD74
	b _0801FD7E
_0801FD40:
	bl sub_81AFBF0
	ldr r0, =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0
	bl sub_81AFC0C
	movs r0, 0x9
	movs r1, 0
	bl sub_801FF18
	ldr r0, =gUnknown_02022C88
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0801FD7E
	.pool
_0801FD74:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0801FD80
_0801FD7E:
	movs r0, 0x1
_0801FD80:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801FD30

	thumb_func_start sub_801FD88
sub_801FD88: @ 801FD88
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0801FD98
	cmp r0, 0x1
	beq _0801FDC4
	b _0801FDCE
_0801FD98:
	movs r0, 0xA
	movs r1, 0
	bl sub_801FF18
	movs r0, 0x17
	movs r1, 0xA
	movs r2, 0x1
	bl sub_801FDDC
	ldr r0, =gUnknown_02022C88
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0801FDCE
	.pool
_0801FDC4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0801FDD0
_0801FDCE:
	movs r0, 0x1
_0801FDD0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_801FD88

	thumb_func_start sub_801FDD8
sub_801FDD8: @ 801FDD8
	movs r0, 0
	bx lr
	thumb_func_end sub_801FDD8

	thumb_func_start sub_801FDDC
sub_801FDDC: @ 801FDDC
	push {r4-r7,lr}
	sub sp, 0x14
	lsls r0, 24
	lsls r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r4, =0xffffff00
	ldr r2, [sp, 0xC]
	ands r2, r4
	lsrs r0, 16
	ldr r3, =0xffff00ff
	ands r2, r3
	orrs r2, r0
	lsrs r1, 8
	ldr r0, =0xff00ffff
	ands r2, r0
	orrs r2, r1
	ldr r0, =0x00ffffff
	ands r2, r0
	movs r0, 0xC0
	lsls r0, 19
	orrs r2, r0
	str r2, [sp, 0xC]
	ldr r0, [sp, 0x10]
	ands r0, r4
	movs r1, 0x4
	orrs r0, r1
	ands r0, r3
	movs r1, 0xE0
	lsls r1, 4
	orrs r0, r1
	ldr r1, =0x0000ffff
	ands r0, r1
	movs r1, 0xA4
	lsls r1, 15
	orrs r0, r1
	str r0, [sp, 0x10]
	add r0, sp, 0xC
	bl AddWindow
	adds r1, r0, 0
	ldr r5, =gUnknown_02022C88
	ldr r0, [r5]
	movs r6, 0
	strh r1, [r0, 0x18]
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, 0xFF
	beq _0801FE94
	lsls r0, r1, 24
	lsrs r0, 24
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	ldrb r0, [r0, 0x18]
	bl PutWindowTilemap
	ldr r0, [r5]
	ldrb r0, [r0, 0x18]
	ldr r2, =gUnknown_085EAE62
	movs r1, 0x1
	str r1, [sp]
	movs r4, 0xFF
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r3, 0x8
	bl Print
	ldr r0, [r5]
	ldrb r0, [r0, 0x18]
	ldr r2, =gUnknown_085EAE66
	movs r1, 0x11
	str r1, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0x8
	bl Print
	ldr r0, [r5]
	ldrb r0, [r0, 0x18]
	movs r1, 0x1
	movs r2, 0xD
	bl sub_8098858
	ldr r0, [r5]
	ldrb r0, [r0, 0x18]
	movs r1, 0x2
	adds r2, r7, 0
	bl InitMenuInUpperLeftCornerPlaySoundWhenAPressed
_0801FE94:
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801FDDC

	thumb_func_start sub_801FEBC
sub_801FEBC: @ 801FEBC
	push {r4,lr}
	ldr r4, =gUnknown_02022C88
	ldr r0, [r4]
	ldrh r0, [r0, 0x18]
	cmp r0, 0xFF
	beq _0801FEDA
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8198070
	ldr r0, [r4]
	ldrb r0, [r0, 0x18]
	bl ClearWindowTilemap
_0801FEDA:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801FEBC

	thumb_func_start sub_801FEE4
sub_801FEE4: @ 801FEE4
	push {r4,lr}
	ldr r4, =gUnknown_02022C88
	ldr r0, [r4]
	ldrh r0, [r0, 0x18]
	cmp r0, 0xFF
	beq _0801FEFE
	lsls r0, 24
	lsrs r0, 24
	bl RemoveWindow
	ldr r1, [r4]
	movs r0, 0xFF
	strh r0, [r1, 0x18]
_0801FEFE:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801FEE4

	thumb_func_start sub_801FF08
sub_801FF08: @ 801FF08
	push {lr}
	bl ProcessMenuInput
	lsls r0, 24
	asrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_801FF08

	thumb_func_start sub_801FF18
sub_801FF18: @ 801FF18
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x1C
	adds r7, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	ldr r1, =0xffffff00
	ldr r3, [sp, 0x14]
	ands r3, r1
	ldr r2, =0xffff00ff
	ands r3, r2
	movs r0, 0x80
	lsls r0, 4
	orrs r3, r0
	ldr r0, =0xff00ffff
	ands r3, r0
	movs r0, 0x80
	lsls r0, 13
	orrs r3, r0
	ldr r5, =0x00ffffff
	ands r3, r5
	movs r0, 0xA8
	lsls r0, 21
	orrs r3, r0
	str r3, [sp, 0x14]
	ldr r0, [sp, 0x18]
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	ands r0, r2
	movs r1, 0xE0
	lsls r1, 4
	orrs r0, r1
	ldr r1, =0x0000ffff
	ands r0, r1
	movs r1, 0xD4
	lsls r1, 15
	orrs r0, r1
	str r0, [sp, 0x18]
	ldr r1, =gUnknown_082F2D40
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	adds r4, r0, r1
	ldrb r0, [r4, 0xA]
	cmp r0, 0
	beq _0801FF98
	lsls r0, r3, 16
	movs r1, 0xF9
	lsls r1, 24
	adds r0, r1
	lsrs r0, 16
	ands r2, r3
	orrs r2, r0
	lsrs r1, r2, 24
	adds r1, 0x7
	lsls r1, 24
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x14]
_0801FF98:
	add r0, sp, 0x14
	bl AddWindow
	ldr r5, =gUnknown_02022C88
	ldr r1, [r5]
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x1E]
	mov r8, r0
	cmp r0, 0xFF
	beq _08020082
	ldrb r0, [r4, 0x9]
	cmp r0, 0
	beq _0801FFE0
	adds r0, r1, 0
	adds r0, 0x22
	ldr r1, [r4]
	bl sub_81AFC28
	ldr r0, [r5]
	adds r6, r0, 0
	adds r6, 0x22
	b _0801FFE2
	.pool
_0801FFE0:
	ldr r6, [r4]
_0801FFE2:
	mov r0, r9
	lsls r1, r0, 8
	movs r0, 0
	movs r2, 0
	bl ChangeBgY
	mov r1, r8
	lsls r0, r1, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	adds r0, r5, 0
	bl PutWindowTilemap
	ldr r1, =gUnknown_082F2D40
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	adds r4, r0, r1
	ldrb r0, [r4, 0x4]
	cmp r0, 0x1
	bne _08020050
	adds r0, r5, 0
	movs r1, 0xA
	movs r2, 0x2
	bl sub_80989E0
	ldrb r3, [r4, 0x5]
	adds r3, 0x8
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4, 0x6]
	adds r0, 0x8
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	ldrb r0, [r4, 0x7]
	str r0, [sp, 0xC]
	ldrb r0, [r4, 0x8]
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0x1
	adds r2, r6, 0
	bl sub_8199F74
	b _0802007A
	.pool
_08020050:
	adds r0, r5, 0
	movs r1, 0xA
	movs r2, 0x2
	bl sub_8098858
	ldrb r3, [r4, 0x5]
	ldrb r0, [r4, 0x6]
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	ldrb r0, [r4, 0x7]
	str r0, [sp, 0xC]
	ldrb r0, [r4, 0x8]
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0x1
	adds r2, r6, 0
	bl sub_8199F74
_0802007A:
	ldr r0, =gUnknown_02022C88
	ldr r0, [r0]
	mov r1, r8
	strh r1, [r0, 0x1E]
_08020082:
	add sp, 0x1C
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_801FF18

	thumb_func_start sub_8020094
sub_8020094: @ 8020094
	push {r4,lr}
	ldr r4, =gUnknown_02022C88
	ldr r0, [r4]
	ldrh r0, [r0, 0x1E]
	cmp r0, 0xFF
	beq _080200B2
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8198070
	ldr r0, [r4]
	ldrb r0, [r0, 0x1E]
	bl ClearWindowTilemap
_080200B2:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8020094

	thumb_func_start sub_80200C8
sub_80200C8: @ 80200C8
	push {r4,lr}
	ldr r4, =gUnknown_02022C88
	ldr r0, [r4]
	ldrh r0, [r0, 0x1E]
	cmp r0, 0xFF
	beq _080200E2
	lsls r0, 24
	lsrs r0, 24
	bl RemoveWindow
	ldr r1, [r4]
	movs r0, 0xFF
	strh r0, [r1, 0x1E]
_080200E2:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80200C8

	thumb_func_start sub_80200EC
sub_80200EC: @ 80200EC
	push {lr}
	sub sp, 0x8
	adds r3, r0, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 19
	lsrs r3, 16
	lsls r1, 19
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0xE
	str r0, [sp, 0x4]
	movs r0, 0x1
	adds r1, r2, 0
	adds r2, r3, 0
	movs r3, 0x1
	bl FillWindowPixelRect
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_80200EC

	thumb_func_start sub_8020118
sub_8020118: @ 8020118
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	mov r10, r1
	ldr r1, [sp, 0x54]
	lsls r0, 16
	lsrs r5, r0, 16
	mov r9, r5
	lsls r2, 24
	lsrs r4, r2, 24
	mov r8, r4
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r1, 24
	lsrs r6, r1, 24
	cmp r4, 0
	beq _08020154
	bl sub_801F198
	adds r1, r0, 0
	subs r1, r5
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	adds r2, r4, 0
	bl sub_80200EC
_08020154:
	add r0, sp, 0xC
	mov r1, r8
	strb r1, [r0]
	strb r7, [r0, 0x1]
	strb r6, [r0, 0x2]
	add r4, sp, 0x10
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x14
	strb r0, [r4, 0x1]
	movs r0, 0x8
	strb r0, [r4, 0x2]
	mov r0, sp
	adds r0, 0x13
	mov r1, r10
	bl StringCopy
	mov r0, r9
	lsls r2, r0, 27
	lsrs r2, 24
	add r1, sp, 0xC
	str r1, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r3, 0x1
	bl box_print
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8020118

	thumb_func_start sub_80201A4
sub_80201A4: @ 80201A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4C
	movs r0, 0x2
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	bl sub_801F0B0
	lsls r0, 24
	lsrs r2, r0, 24
	add r1, sp, 0xC
	movs r0, 0
	strb r0, [r1]
	movs r0, 0xE
	strb r0, [r1, 0x1]
	movs r0, 0xD
	strb r0, [r1, 0x2]
	cmp r2, 0x3
	beq _08020240
	add r1, sp, 0x10
	movs r0, 0xFC
	strb r0, [r1]
	movs r0, 0x14
	strb r0, [r1, 0x1]
	movs r0, 0x8
	strb r0, [r1, 0x2]
	str r0, [sp, 0x40]
	str r1, [sp, 0x44]
	cmp r2, 0x2
	bne _080201EC
	movs r1, 0x6
	str r1, [sp, 0x40]
_080201EC:
	movs r7, 0
	movs r6, 0
	lsls r0, r2, 2
	ldr r1, =gUnknown_082F2BA8
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	ldr r0, [sp, 0x40]
	lsls r5, r0, 24
_080201FE:
	ldr r1, [r4]
	cmp r1, 0
	bne _08020206
	b _0802030C
_08020206:
	mov r0, sp
	adds r0, 0x13
	bl StringCopy
	lsls r3, r6, 24
	lsrs r3, 24
	add r1, sp, 0xC
	str r1, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	ldr r0, [sp, 0x44]
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	lsrs r2, r5, 24
	bl box_print
	adds r4, 0x4
	adds r7, 0x1
	adds r0, r6, 0
	adds r0, 0xC
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r7, 0x9
	ble _080201FE
	b _0802030C
	.pool
_08020240:
	movs r1, 0x4
	str r1, [sp, 0x40]
	movs r7, 0
	movs r6, 0
_08020248:
	adds r0, r7, 0
	bl sub_801EE6C
	adds r5, r0, 0
	movs r0, 0
	adds r1, r5, 0
	movs r2, 0
	bl GetStringWidth
	cmp r0, 0x28
	bgt _08020286
	lsls r3, r6, 24
	lsrs r3, 24
	add r4, sp, 0xC
	str r4, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	movs r4, 0x80
	lsls r4, 19
	lsrs r2, r4, 24
	bl box_print
	adds r0, r7, 0x1
	str r0, [sp, 0x48]
	adds r6, 0xC
	mov r10, r6
	b _08020300
_08020286:
	adds r0, r5, 0
	bl StringLength_Multibyte
	adds r4, r0, 0
	mov r1, sp
	adds r1, 0x10
	str r1, [sp, 0x44]
	ldr r0, [sp, 0x40]
	lsls r0, 24
	mov r8, r0
	lsls r1, r6, 24
	mov r9, r1
	adds r0, r7, 0x1
	str r0, [sp, 0x48]
	adds r6, 0xC
	mov r10, r6
	ldr r7, [sp, 0x40]
	adds r7, 0x23
	ldr r6, [sp, 0x44]
_080202AC:
	subs r4, 0x1
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl StringCopyN_Multibyte
	movs r0, 0
	adds r1, r6, 0
	movs r2, 0
	bl GetStringWidth
	cmp r0, 0x23
	bgt _080202AC
	mov r1, r8
	lsrs r2, r1, 24
	mov r0, r9
	lsrs r4, r0, 24
	add r1, sp, 0xC
	str r1, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	ldr r1, [sp, 0x44]
	str r1, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	adds r3, r4, 0
	bl box_print
	adds r2, r7, 0
	add r0, sp, 0xC
	str r0, [sp]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0x4]
	ldr r0, =gUnknown_082F2DC4
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	adds r3, r4, 0
	bl box_print
_08020300:
	ldr r7, [sp, 0x48]
	mov r4, r10
	lsls r0, r4, 16
	lsrs r6, r0, 16
	cmp r7, 0x9
	ble _08020248
_0802030C:
	add sp, 0x4C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80201A4

	thumb_func_start sub_8020320
sub_8020320: @ 8020320
	push {r4,lr}
	ldr r1, =gUnknown_02022C88
	ldr r2, [r1]
	ldrh r3, [r2, 0x20]
	movs r4, 0x20
	ldrsh r0, [r2, r4]
	cmp r0, 0x37
	bgt _08020354
	adds r0, r3, 0
	adds r0, 0xC
	strh r0, [r2, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x37
	ble _08020348
	movs r0, 0x38
	strh r0, [r2, 0x20]
	b _08020354
	.pool
_08020348:
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	bl sub_80207C0
	movs r0, 0x1
	b _08020360
_08020354:
	ldr r0, [r1]
	movs r4, 0x20
	ldrsh r0, [r0, r4]
	bl sub_8020818
	movs r0, 0
_08020360:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8020320

	thumb_func_start sub_8020368
sub_8020368: @ 8020368
	push {r4,lr}
	ldr r1, =gUnknown_02022C88
	ldr r2, [r1]
	ldrh r3, [r2, 0x20]
	movs r4, 0x20
	ldrsh r0, [r2, r4]
	cmp r0, 0
	ble _0802039C
	adds r0, r3, 0
	subs r0, 0xC
	strh r0, [r2, 0x20]
	lsls r0, 16
	cmp r0, 0
	bgt _08020390
	movs r0, 0
	strh r0, [r2, 0x20]
	b _0802039C
	.pool
_08020390:
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	bl sub_80207C0
	movs r0, 0x1
	b _080203A8
_0802039C:
	ldr r0, [r1]
	movs r4, 0x20
	ldrsh r0, [r0, r4]
	bl sub_8020818
	movs r0, 0
_080203A8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8020368

	thumb_func_start sub_80203B0
sub_80203B0: @ 80203B0
	push {r4,r5,lr}
	sub sp, 0xC
	movs r0, 0x3
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0xD
	bl sub_8098858
	movs r5, 0xE
	str r5, [sp]
	movs r4, 0x5
	str r4, [sp, 0x4]
	ldr r0, =gUnknown_082F2DC8
	str r0, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x2
	movs r2, 0x8
	movs r3, 0x1
	bl PrintTextArray
	bl sub_801F0B0
	lsls r0, 24
	lsrs r0, 24
	str r5, [sp]
	str r4, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x1
	bl sub_81983AC
	movs r0, 0x3
	bl PutWindowTilemap
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80203B0

	thumb_func_start sub_802040C
sub_802040C: @ 802040C
	push {lr}
	movs r0, 0x3
	movs r1, 0
	bl sub_8198070
	movs r0, 0x3
	bl ClearWindowTilemap
	pop {r0}
	bx r0
	thumb_func_end sub_802040C

	thumb_func_start sub_8020420
sub_8020420: @ 8020420
	push {r4,r5,lr}
	sub sp, 0x10
	adds r5, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 24
	add r3, sp, 0xC
	movs r1, 0x1
	strb r1, [r3]
	lsrs r2, 23
	adds r1, r2, 0x2
	strb r1, [r3, 0x1]
	adds r1, r3, 0
	adds r2, 0x3
	strb r2, [r1, 0x2]
	lsls r4, r0, 4
	subs r4, r0
	lsls r3, r4, 16
	lsrs r3, 16
	movs r0, 0xA8
	str r0, [sp]
	movs r0, 0xF
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x11
	movs r2, 0
	bl FillWindowPixelRect
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	add r0, sp, 0xC
	str r0, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	adds r3, r4, 0
	bl box_print
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8020420

	thumb_func_start sub_8020480
sub_8020480: @ 8020480
	push {lr}
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl SetGpuRegBits
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r1, 0xE0
	lsls r1, 8
	movs r0, 0
	bl ClearGpuRegBits
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl SetGpuRegBits
	ldr r1, =0x000040f0
	movs r0, 0x40
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0x90
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0x3D
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x3F
	bl SetGpuReg
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8020480

	thumb_func_start sub_8020538
sub_8020538: @ 8020538
	push {r4,lr}
	ldr r4, =gUnknown_02022C88
	ldr r1, [r4]
	movs r0, 0x94
	lsls r0, 1
	adds r1, r0
	movs r0, 0
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, =0x00000928
	adds r1, r0
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, =0x00001128
	adds r1, r0
	movs r0, 0x3
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, =0x00001928
	adds r1, r0
	movs r0, 0x2
	bl SetBgTilemapBuffer
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8020538

	thumb_func_start sub_8020584
sub_8020584: @ 8020584
	push {lr}
	sub sp, 0x8
	movs r1, 0xC0
	lsls r1, 19
	movs r0, 0
	movs r2, 0x20
	movs r3, 0x1
	bl RequestDma3Fill
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_8020584

	thumb_func_start sub_80205B4
sub_80205B4: @ 80205B4
	push {lr}
	sub sp, 0x4
	ldr r0, =gUnknown_08DD4BD0
	movs r1, 0x70
	movs r2, 0x20
	bl LoadPalette
	ldr r0, =gUnknown_08DD4BB0
	movs r1, 0xC0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, =gUnknown_08DD4BF0
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, =gUnknown_08DD4C4C
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	add sp, 0x4
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80205B4

	thumb_func_start task_tutorial_story_unknown
task_tutorial_story_unknown: @ 8020604
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, =gUnknown_08DD4860
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, =gUnknown_08DD4880
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	adds r5, r0, 0
	cmp r5, 0
	beq _0802064E
	movs r1, 0x88
	lsls r1, 2
	adds r0, r5, r1
	ldr r4, =gUnknown_02022C88
	ldr r1, [r4]
	ldr r2, =0x00002128
	adds r1, r2
	movs r2, 0x8
	bl CpuFastSet
	movs r1, 0x84
	lsls r1, 3
	adds r0, r5, r1
	ldr r1, [r4]
	ldr r2, =0x00002148
	adds r1, r2
	movs r2, 0x8
	bl CpuFastSet
_0802064E:
	ldr r1, =gUnknown_08DD4AB8
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end task_tutorial_story_unknown

	thumb_func_start sub_8020680
sub_8020680: @ 8020680
	push {lr}
	ldr r0, =gUnknown_082F2C20
	movs r1, 0x80
	movs r2, 0x20
	bl LoadPalette
	ldr r1, =0x06004020
	movs r0, 0
	movs r2, 0x20
	movs r3, 0x1
	bl RequestDma3Fill
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8020680

	thumb_func_start sub_80206A4
sub_80206A4: @ 80206A4
	push {lr}
	ldr r0, =gUnknown_082F2C40
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80206A4

	thumb_func_start sub_80206D0
sub_80206D0: @ 80206D0
	push {lr}
	movs r0, 0x2
	bl PutWindowTilemap
	bl sub_80201A4
	movs r0, 0x2
	movs r1, 0x3
	bl CopyWindowToVram
	pop {r0}
	bx r0
	thumb_func_end sub_80206D0

	thumb_func_start sub_80206E8
sub_80206E8: @ 80206E8
	push {r4,lr}
	sub sp, 0xC
	add r1, sp, 0x8
	movs r0, 0
	strb r0, [r1]
	movs r0, 0xFF
	strb r0, [r1, 0x1]
	movs r4, 0
_080206F8:
	ldr r0, =gUnknown_02022C88
	ldr r1, [r0]
	ldr r0, =0x00002128
	adds r1, r0
	lsls r2, r4, 19
	lsrs r2, 16
	movs r0, 0x8
	str r0, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r3, 0
	bl BlitBitmapToWindow
	adds r4, 0x1
	cmp r4, 0xE
	ble _080206F8
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80206E8

	thumb_func_start sub_8020740
sub_8020740: @ 8020740
	push {lr}
	movs r0, 0x3
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0xD0
	bl sub_809882C
	movs r0, 0x3
	movs r1, 0xA
	movs r2, 0x20
	bl box_border_load_tiles_and_pal
	ldr r0, =gUnknown_0860F074
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8020740

	thumb_func_start sub_8020770
sub_8020770: @ 8020770
	push {lr}
	sub sp, 0x10
	ldr r0, =0xa2600001
	str r0, [sp, 0x4]
	ldr r0, =0x04000014
	str r0, [sp]
	mov r2, sp
	movs r1, 0
	movs r0, 0x1
	strb r0, [r2, 0x8]
	mov r0, sp
	strb r1, [r0, 0x9]
	ldr r0, =gUnknown_02022C88
	ldr r0, [r0]
	strh r1, [r0, 0x20]
	str r1, [sp, 0xC]
	add r0, sp, 0xC
	ldr r1, =gUnknown_02038C28
	ldr r2, =0x010003c0
	bl CpuFastSet
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_80BA038
	add sp, 0x10
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8020770

	thumb_func_start sub_80207C0
sub_80207C0: @ 80207C0
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	strh r0, [r1]
	ldr r5, =gUnknown_02039B28
	ldrb r0, [r5, 0x14]
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 7
	ldr r4, =gUnknown_02038C28
	adds r1, r4
	ldr r2, =0x01000090
	mov r0, sp
	bl CpuSet
	mov r0, sp
	adds r0, 0x2
	movs r1, 0
	strh r1, [r0]
	ldrb r2, [r5, 0x14]
	lsls r1, r2, 4
	subs r1, r2
	lsls r1, 7
	movs r2, 0x90
	lsls r2, 1
	adds r4, r2
	adds r1, r4
	ldr r2, =0x01000010
	bl CpuSet
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80207C0

	thumb_func_start sub_8020818
sub_8020818: @ 8020818
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, sp
	strh r4, [r0]
	ldr r5, =gUnknown_02038C28
	ldr r0, =0x01000090
	mov r9, r0
	mov r0, sp
	adds r1, r5, 0
	mov r2, r9
	bl CpuSet
	mov r0, sp
	adds r0, 0x2
	movs r6, 0
	strh r6, [r0]
	movs r2, 0x90
	lsls r2, 1
	adds r1, r5, r2
	ldr r2, =0x01000010
	mov r8, r2
	bl CpuSet
	add r0, sp, 0x4
	strh r4, [r0]
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r5, r2
	mov r2, r9
	bl CpuSet
	mov r0, sp
	adds r0, 0x6
	strh r6, [r0]
	movs r1, 0x8A
	lsls r1, 4
	adds r5, r1
	adds r1, r5, 0
	mov r2, r8
	bl CpuSet
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8020818

	thumb_func_start sub_8020890
sub_8020890: @ 8020890
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, =gUnknown_082F3134
_08020896:
	adds r0, r4, 0
	bl LoadCompressedObjectPic
	adds r4, 0x8
	adds r5, 0x1
	cmp r5, 0x4
	bls _08020896
	ldr r0, =gUnknown_082F315C
	bl LoadTaggedObjectPalette
	ldr r4, =gUnknown_02022C8C
	movs r0, 0x18
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	beq _080208C8
	movs r0, 0x1
	b _080208CA
	.pool
_080208C8:
	movs r0, 0
_080208CA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8020890

	thumb_func_start sub_80208D0
sub_80208D0: @ 80208D0
	push {lr}
	ldr r0, =gUnknown_02022C8C
	ldr r0, [r0]
	cmp r0, 0
	beq _080208DE
	bl Free
_080208DE:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80208D0

	thumb_func_start sub_80208E8
sub_80208E8: @ 80208E8
	push {lr}
	ldr r0, =gUnknown_082F319C
	movs r1, 0xA
	movs r2, 0x18
	movs r3, 0
	bl AddObjectToFront
	lsls r0, 24
	lsrs r0, 24
	ldr r1, =gUnknown_02022C8C
	ldr r2, [r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, =gUnknown_02020630
	adds r1, r0
	str r1, [r2]
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80208E8

	thumb_func_start sub_802091C
sub_802091C: @ 802091C
	ldr r1, =gUnknown_02022C8C
	ldr r1, [r1]
	ldr r2, [r1]
	adds r2, 0x3E
	movs r1, 0x1
	ands r0, r1
	lsls r0, 2
	ldrb r3, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
	bx lr
	.pool
	thumb_func_end sub_802091C

	thumb_func_start sub_802093C
sub_802093C: @ 802093C
	push {r4,r5,lr}
	sub sp, 0x4
	bl sub_801F0B0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r5, sp
	adds r5, 0x1
	mov r0, sp
	adds r1, r5, 0
	bl sub_801F0BC
	cmp r4, 0x3
	beq _0802097C
	ldr r4, =gUnknown_02022C8C
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0
	bl StartObjectImageAnim
	ldr r1, [r4]
	ldr r2, [r1]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, 0xA
	strh r0, [r2, 0x20]
	ldr r2, [r1]
	b _08020992
	.pool
_0802097C:
	ldr r4, =gUnknown_02022C8C
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0x2
	bl StartObjectImageAnim
	ldr r2, [r4]
	ldr r1, [r2]
	movs r0, 0x18
	strh r0, [r1, 0x20]
	ldr r2, [r2]
_08020992:
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, 0x18
	strh r0, [r2, 0x22]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_802093C

	thumb_func_start sub_80209AC
sub_80209AC: @ 80209AC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 2
	ldr r0, =gUnknown_082F2DF2
	adds r4, r0
	movs r0, 0
	bl IndexOfObjectPaletteTag
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 4
	ldr r0, =0x01010000
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0x4
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80209AC

	thumb_func_start sub_80209E0
sub_80209E0: @ 80209E0
	push {lr}
	bl sub_801F0B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _08020A00
	ldr r0, =gUnknown_02022C8C
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, 0x1
	bl StartObjectImageAnim
	b _08020A0C
	.pool
_08020A00:
	ldr r0, =gUnknown_02022C8C
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, 0x3
	bl StartObjectImageAnim
_08020A0C:
	ldr r0, =gUnknown_02022C8C
	ldr r1, [r0]
	movs r0, 0
	strh r0, [r1, 0x14]
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80209E0

	thumb_func_start sub_8020A1C
sub_8020A1C: @ 8020A1C
	push {r4,lr}
	ldr r4, =gUnknown_02022C8C
	ldr r1, [r4]
	ldrh r0, [r1, 0x14]
	cmp r0, 0x3
	bls _08020A30
_08020A28:
	movs r0, 0
	b _08020A62
	.pool
_08020A30:
	adds r0, 0x1
	strh r0, [r1, 0x14]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bls _08020A60
	bl sub_801F0B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _08020A54
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0
	bl StartObjectImageAnim
	b _08020A28
_08020A54:
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0x2
	bl StartObjectImageAnim
	b _08020A28
_08020A60:
	movs r0, 0x1
_08020A62:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8020A1C

	thumb_func_start sub_8020A68
sub_8020A68: @ 8020A68
	push {r4,r5,lr}
	ldr r0, =gUnknown_082F31BC
	movs r1, 0x4C
	movs r2, 0x98
	movs r3, 0x2
	bl AddObjectToFront
	lsls r0, 24
	lsrs r0, 24
	ldr r5, =gUnknown_02022C8C
	ldr r2, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r4, =gUnknown_02020630
	adds r1, r4
	str r1, [r2, 0x8]
	ldr r0, =gUnknown_082F31D4
	movs r1, 0x40
	movs r2, 0x98
	movs r3, 0x1
	bl AddObjectToFront
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	str r1, [r2, 0x4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8020A68

	thumb_func_start sub_8020ABC
sub_8020ABC: @ 8020ABC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_801F198
	adds r3, r0, 0
	cmp r3, 0xF
	bne _08020AD8
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _08020AEC
_08020AD8:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r2]
	lsls r0, r3, 3
	adds r0, 0x4C
	strh r0, [r4, 0x20]
_08020AEC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8020ABC

	thumb_func_start sub_8020AF4
sub_8020AF4: @ 8020AF4
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08020B1A
	strh r2, [r1, 0x2E]
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08020B1A
	strh r2, [r1, 0x24]
_08020B1A:
	pop {r0}
	bx r0
	thumb_func_end sub_8020AF4

	thumb_func_start sub_8020B20
sub_8020B20: @ 8020B20
	push {r4,r5,lr}
	ldr r0, =gUnknown_082F322C
	movs r1, 0x8
	movs r2, 0x98
	movs r3, 0x3
	bl AddObjectToFront
	lsls r0, 24
	lsrs r0, 24
	ldr r5, =gUnknown_02022C8C
	ldr r2, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r4, =gUnknown_02020630
	adds r1, r4
	str r1, [r2, 0xC]
	ldr r0, =gUnknown_082F3244
	movs r1, 0x20
	movs r2, 0x98
	movs r3, 0x4
	bl AddObjectToFront
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	str r1, [r2, 0x10]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8020B20

	thumb_func_start sub_8020B80
sub_8020B80: @ 8020B80
	push {r4,lr}
	bl sub_801F0B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _08020BB8
	bl sub_801F0DC
	cmp r0, 0
	beq _08020BC2
	ldr r3, =gUnknown_02022C8C
	ldr r0, [r3]
	ldr r1, [r0, 0x10]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	ldr r0, [r0, 0x10]
	movs r1, 0x3
	bl StartObjectImageAnim
	b _08020BF6
	.pool
_08020BB8:
	bl sub_801F1A4
	adds r4, r0, 0
	cmp r4, 0x3
	bne _08020BD8
_08020BC2:
	ldr r0, =gUnknown_02022C8C
	ldr r0, [r0]
	ldr r1, [r0, 0x10]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	b _08020BF6
	.pool
_08020BD8:
	ldr r3, =gUnknown_02022C8C
	ldr r0, [r3]
	ldr r1, [r0, 0x10]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	ldr r0, [r0, 0x10]
	lsls r1, r4, 24
	lsrs r1, 24
	bl StartObjectImageAnim
_08020BF6:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8020B80

	thumb_func_start sub_8020C00
sub_8020C00: @ 8020C00
	ldr r0, =gUnknown_02022C90
	ldr r0, [r0]
	bx lr
	.pool
	thumb_func_end sub_8020C00

	thumb_func_start sub_8020C0C
sub_8020C0C: @ 8020C0C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, =gUnknown_02022C90
	ldr r0, [r5]
	cmp r0, 0
	bne _08020C20
	movs r0, 0x2
	b _08020C5C
	.pool
_08020C20:
	cmp r4, 0
	bne _08020C26
	ldr r4, [r0]
_08020C26:
	ldrb r0, [r0, 0xA]
	bl DestroyTask
	ldr r0, [r5]
	bl Free
	movs r0, 0
	str r0, [r5]
	adds r0, r4, 0
	bl SetMainCallback2
	ldr r0, =c2_exit_to_overworld_2_switch
	cmp r4, r0
	bne _08020C5A
	ldr r2, =gUnknown_03003014
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0xC8
	lsls r0, 1
	bl current_map_music_set
	ldr r0, =c1_overworld
	bl set_callback1
_08020C5A:
	movs r0, 0
_08020C5C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8020C0C

	thumb_func_start sub_8020C70
sub_8020C70: @ 8020C70
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	adds r4, r0, 0
	movs r0, 0
	mov r8, r0
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	beq _08020C8E
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0
	bne _08020CAC
_08020C8E:
	adds r0, r4, 0
	bl SetMainCallback2
	ldr r0, =gUnknown_03005000
	mov r1, r8
	strh r1, [r0, 0x10]
	strh r1, [r0, 0x12]
	b _08020CF8
	.pool
_08020CAC:
	bl sub_8009FCC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	bl link_get_multiplayer_id
	lsls r0, 24
	lsrs r7, r0, 24
	mov r0, r8
	cmp r0, 0x1
	bls _08020CC8
	cmp r7, r8
	bcc _08020CDC
_08020CC8:
	adds r0, r4, 0
	bl SetMainCallback2
	ldr r0, =gUnknown_03005000
	movs r1, 0
	strh r1, [r0, 0x10]
	strh r1, [r0, 0x12]
	b _08020CF8
	.pool
_08020CDC:
	ldr r6, =gUnknown_02022C90
	ldr r0, =0x000041c0
	bl AllocZeroed
	adds r5, r0, 0
	str r5, [r6]
	cmp r5, 0
	bne _08020D10
	adds r0, r4, 0
	bl SetMainCallback2
	ldr r0, =gUnknown_03005000
	strh r5, [r0, 0x10]
	strh r5, [r0, 0x12]
_08020CF8:
	adds r0, 0xEE
	ldrb r1, [r0]
	movs r1, 0x1
	strb r1, [r0]
	b _08020D74
	.pool
_08020D10:
	str r4, [r5]
	movs r4, 0
	strb r7, [r5, 0x8]
	ldr r0, [r6]
	mov r1, r8
	strb r1, [r0, 0x9]
	ldr r0, [r6]
	bl sub_8020FC4
	ldr r1, [r6]
	movs r2, 0x1
	movs r0, 0x1
	strh r0, [r1, 0x12]
	strb r2, [r1, 0xE]
	ldr r1, [r6]
	movs r0, 0x6
	strb r0, [r1, 0xF]
	ldr r0, [r6]
	adds r0, 0x36
	movs r2, 0x1
	negs r2, r2
	movs r1, 0x10
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0
	bl sub_8024604
	ldr r2, [r6]
	adds r2, 0x36
	movs r0, 0x4
	movs r1, 0x1
	bl sub_8022BEC
	ldr r0, =sub_8020F88
	bl SetMainCallback2
	ldr r0, =sub_8020FA0
	movs r1, 0x8
	bl CreateTask
	ldr r1, [r6]
	strb r0, [r1, 0xA]
	ldr r2, =gUnknown_03003014
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_08020D74:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8020C70

	thumb_func_start sub_8020D8C
sub_8020D8C: @ 8020D8C
	push {r4,lr}
	sub sp, 0xC
	ldr r1, =gUnknown_0203CE7C
	ldrh r0, [r1]
	subs r0, 0x85
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2B
	bls _08020DA8
	movs r0, 0x85
	strh r0, [r1]
	b _08020DB0
	.pool
_08020DA8:
	ldrh r0, [r1]
	movs r1, 0x1
	bl remove_item
_08020DB0:
	ldr r4, =gUnknown_02022C90
	ldr r2, [r4]
	ldrb r0, [r2, 0x8]
	lsls r0, 5
	adds r0, r2, r0
	ldr r1, =gUnknown_0203CE7C
	ldrh r1, [r1]
	subs r1, 0x85
	adds r0, 0xA4
	movs r3, 0
	strh r1, [r0]
	movs r0, 0x1
	strb r0, [r2, 0xE]
	ldr r1, [r4]
	movs r0, 0x9
	strb r0, [r1, 0xF]
	ldr r0, [r4]
	adds r0, 0x36
	movs r2, 0x1
	negs r2, r2
	movs r1, 0x10
	str r1, [sp]
	str r3, [sp, 0x4]
	str r3, [sp, 0x8]
	movs r1, 0
	bl sub_8024604
	ldr r2, [r4]
	adds r2, 0x36
	movs r0, 0x4
	movs r1, 0x1
	bl sub_8022BEC
	ldr r0, =sub_8020FA0
	movs r1, 0x8
	bl CreateTask
	ldr r1, [r4]
	strb r0, [r1, 0xA]
	ldr r0, =sub_8020F88
	bl SetMainCallback2
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8020D8C

	thumb_func_start sub_8020E1C
sub_8020E1C: @ 8020E1C
	push {lr}
	ldr r0, =gUnknown_02022C90
	ldr r0, [r0]
	ldrb r0, [r0, 0xA]
	bl DestroyTask
	ldr r0, =sub_8020D8C
	bl sub_81AABF0
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8020E1C

	thumb_func_start sub_8020E3C
sub_8020E3C: @ 8020E3C
	push {lr}
	ldr r0, =sub_8020F74
	bl SetVBlankCallback
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8020E3C

	thumb_func_start sub_8020E4C
sub_8020E4C: @ 8020E4C
	push {lr}
	movs r0, 0
	bl SetVBlankCallback
	pop {r0}
	bx r0
	thumb_func_end sub_8020E4C

	thumb_func_start sub_8020E58
sub_8020E58: @ 8020E58
	push {r4-r6,lr}
	ldr r4, =gUnknown_02022C90
	ldr r0, [r4]
	adds r0, 0x6C
	ldrh r2, [r0]
	lsls r2, 8
	movs r1, 0xF0
	lsls r1, 6
	adds r0, r2, 0
	bl sub_81515FC
	adds r2, r0, 0
	ldr r0, [r4]
	adds r0, 0x72
	ldrh r3, [r0]
	lsls r3, 8
	adds r0, r3, 0
	adds r1, r2, 0
	bl sub_81515FC
	adds r3, r0, 0
	ldr r0, =0x0000ffff
	ands r3, r0
	ldr r2, [r4]
	strh r3, [r2, 0x16]
	ldrb r0, [r2, 0x9]
	cmp r0, 0x3
	beq _08020EDC
	cmp r0, 0x3
	bgt _08020EA4
	cmp r0, 0x2
	beq _08020EAE
	b _08020F48
	.pool
_08020EA4:
	cmp r0, 0x4
	beq _08020EEC
	cmp r0, 0x5
	beq _08020F20
	b _08020F48
_08020EAE:
	ldr r5, =gSaveBlock2Ptr
	ldr r1, [r5]
	movs r0, 0xF6
	lsls r0, 1
	adds r1, r0
	lsls r0, r3, 16
	lsrs r0, 16
	ldrh r1, [r1]
	cmp r0, r1
	bls _08020F48
	adds r2, 0x25
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r5]
	ldr r1, [r4]
	ldrh r1, [r1, 0x16]
	movs r2, 0xF6
	lsls r2, 1
	b _08020F14
	.pool
_08020EDC:
	ldr r5, =gSaveBlock2Ptr
	ldr r0, [r5]
	movs r6, 0xF7
	lsls r6, 1
	b _08020F28
	.pool
_08020EEC:
	ldr r5, =gSaveBlock2Ptr
	ldr r1, [r5]
	movs r0, 0xF8
	lsls r0, 1
	adds r1, r0
	lsls r0, r3, 16
	lsrs r0, 16
	ldrh r1, [r1]
	cmp r0, r1
	bls _08020F48
	adds r2, 0x25
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r5]
	ldr r1, [r4]
	ldrh r1, [r1, 0x16]
	movs r2, 0xF8
	lsls r2, 1
_08020F14:
	adds r0, r2
	strh r1, [r0]
	b _08020F48
	.pool
_08020F20:
	ldr r5, =gSaveBlock2Ptr
	ldr r0, [r5]
	movs r6, 0xF9
	lsls r6, 1
_08020F28:
	adds r1, r0, r6
	lsls r0, r3, 16
	lsrs r0, 16
	ldrh r1, [r1]
	cmp r0, r1
	bls _08020F48
	adds r2, 0x25
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldr r1, [r5]
	ldr r0, [r4]
	ldrh r0, [r0, 0x16]
	adds r1, r6
	strh r0, [r1]
_08020F48:
	ldr r4, =gUnknown_02022C90
	ldr r1, [r4]
	ldr r0, [r1, 0x68]
	str r0, [r1, 0x1C]
	bl sub_8024700
	lsls r0, 24
	cmp r0, 0
	bne _08020F66
	ldr r0, [r4]
	adds r0, 0x25
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
_08020F66:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8020E58

	thumb_func_start sub_8020F74
sub_8020F74: @ 8020F74
	push {lr}
	bl TransferPlttBuffer
	bl LoadOamFromSprites
	bl ProcessObjectCopyRequests
	pop {r0}
	bx r0
	thumb_func_end sub_8020F74

	thumb_func_start sub_8020F88
sub_8020F88: @ 8020F88
	push {lr}
	bl RunTasks
	bl RunTextPrinters
	bl CallObjectCallbacks
	bl PrepareSpritesForOamLoad
	pop {r0}
	bx r0
	thumb_func_end sub_8020F88

	thumb_func_start sub_8020FA0
sub_8020FA0: @ 8020FA0
	push {r4,lr}
	ldr r4, =gUnknown_02022C90
	ldr r0, [r4]
	ldr r2, [r0, 0x4]
	cmp r2, 0
	beq _08020FB4
	adds r1, r0, 0
	adds r1, 0x36
	bl _call_via_r2
_08020FB4:
	ldr r0, [r4]
	bl sub_8021450
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8020FA0

	thumb_func_start sub_8020FC4
sub_8020FC4: @ 8020FC4
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r5, 0
	b _08020FE6
_08020FCC:
	lsls r0, r5, 5
	adds r0, 0x98
	adds r0, r6, r0
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	ldr r2, =gUnknown_020229F0
	adds r1, r2
	bl StringCopy
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08020FE6:
	ldrb r0, [r6, 0x9]
	cmp r5, r0
	bcc _08020FCC
	cmp r5, 0x4
	bhi _08021012
_08020FF0:
	lsls r4, r5, 5
	adds r0, r4, 0
	adds r0, 0x98
	adds r0, r6, r0
	movs r1, 0x1
	movs r2, 0x7
	bl memset
	adds r4, r6, r4
	adds r4, 0x9F
	movs r0, 0xFF
	strb r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _08020FF0
_08021012:
	ldr r0, =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x14]
	lsls r0, 29
	lsrs r0, 29
	cmp r0, 0x1
	beq _0802103E
	cmp r0, 0x1
	bgt _08021034
	cmp r0, 0
	beq _0802103A
	b _08021046
	.pool
_08021034:
	cmp r0, 0x2
	beq _08021042
	b _08021046
_0802103A:
	movs r0, 0x8
	b _08021044
_0802103E:
	movs r0, 0x4
	b _08021044
_08021042:
	movs r0, 0x1
_08021044:
	strb r0, [r6, 0xB]
_08021046:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8020FC4

	thumb_func_start sub_802104C
sub_802104C: @ 802104C
	push {r4,r5,lr}
	sub sp, 0xC
	bl sub_8020C00
	adds r5, r0, 0
	cmp r5, 0
	bne _08021060
	movs r0, 0x1
	negs r0, r0
	b _08021304
_08021060:
	ldrb r0, [r5, 0xC]
	cmp r0, 0x9
	bls _08021068
	b _080212FC
_08021068:
	lsls r0, 2
	ldr r1, =_08021078
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08021078:
	.4byte _080210A0
	.4byte _080210BE
	.4byte _080210E4
	.4byte _080210F2
	.4byte _08021178
	.4byte _080211BE
	.4byte _080211EC
	.4byte _0802121C
	.4byte _08021278
	.4byte _080212B4
_080210A0:
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	bl remove_some_task
	bl reset_temp_tile_data_buffers
	b _080212FC
_080210BE:
	add r0, sp, 0x8
	movs r4, 0
	strh r4, [r0]
	movs r1, 0xE0
	lsls r1, 19
	ldr r2, =0x01000200
	bl CpuSet
	ldr r0, =gUnknown_0300301C
	strb r4, [r0]
	movs r0, 0x3
	bl sub_8034C54
	b _080212FC
	.pool
_080210E4:
	bl ResetPaletteFade
	bl ResetAllObjectData
	bl ResetObjectPaletteAllocator
	b _080212FC
_080210F2:
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, =gUnknown_082F32C8
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	movs r0, 0xE0
	lsls r0, 1
	adds r1, r5, r0
	movs r0, 0x1
	bl SetBgTilemapBuffer
	movs r0, 0x87
	lsls r0, 6
	adds r1, r5, r0
	movs r0, 0x2
	bl SetBgTilemapBuffer
	movs r0, 0xC7
	lsls r0, 6
	adds r1, r5, r0
	movs r0, 0x3
	bl SetBgTilemapBuffer
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	b _080212FC
	.pool
_08021178:
	movs r4, 0x20
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	movs r0, 0x40
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	b _080212FC
_080211BE:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	ldr r1, =gUnknown_08DE34B8
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	b _080212FC
	.pool
_080211EC:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	cmp r0, 0
	beq _080211F8
	b _08021302
_080211F8:
	bl sub_81971D0
	bl sub_8197200
	adds r0, r5, 0
	bl sub_8022588
	adds r0, r5, 0
	bl sub_8022600
	ldr r0, =gPaletteFade
	ldrb r1, [r0, 0x8]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0, 0x8]
	b _080212FC
	.pool
_0802121C:
	ldr r0, =gUnknown_08DE3398
	movs r2, 0xC0
	lsls r2, 1
	movs r1, 0
	bl LoadPalette
	ldr r1, =gUnknown_082F3C8C
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r1, =gUnknown_082F3DBC
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r1, =gUnknown_082F3F54
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	adds r0, r5, 0
	bl sub_80226D0
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	b _080212FC
	.pool
_08021278:
	bl sub_800E0E8
	movs r0, 0
	movs r1, 0
	bl sub_800DFB4
	adds r0, r5, 0
	bl sub_8022730
	ldr r0, =gUnknown_02021BBE
	ldrh r1, [r0]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x16
	bl SetGpuReg
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	b _080212FC
	.pool
_080212B4:
	ldr r2, =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl SetGpuRegBits
	bl sub_8020E3C
	movs r0, 0
	strb r0, [r5, 0xC]
	movs r0, 0x1
	b _08021304
	.pool
_080212FC:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
_08021302:
	movs r0, 0
_08021304:
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_802104C

	thumb_func_start sub_802130C
sub_802130C: @ 802130C
	push {r4,r5,lr}
	sub sp, 0x8
	bl sub_8020C00
	adds r5, r0, 0
	cmp r5, 0
	bne _08021320
	movs r0, 0x1
	negs r0, r0
	b _08021446
_08021320:
	ldrb r0, [r5, 0xC]
	cmp r0, 0x7
	bls _08021328
	b _0802143E
_08021328:
	lsls r0, 2
	ldr r1, =_08021338
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08021338:
	.4byte _08021358
	.4byte _0802135E
	.4byte _08021368
	.4byte _0802137E
	.4byte _0802138A
	.4byte _080213E6
	.4byte _08021426
	.4byte _08021436
_08021358:
	bl sub_8010434
	b _0802143E
_0802135E:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08021444
_08021368:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	bl UpdatePaletteFade
	b _0802143E
_0802137E:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	beq _0802143E
	b _08021444
_0802138A:
	movs r4, 0x20
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	b _0802143E
_080213E6:
	bl FreeAllWindowBuffers
	movs r0, 0
	bl HideBg
	movs r0, 0
	bl UnsetBgTilemapBuffer
	movs r0, 0x1
	bl HideBg
	movs r0, 0x1
	bl UnsetBgTilemapBuffer
	movs r0, 0x2
	bl HideBg
	movs r0, 0x2
	bl UnsetBgTilemapBuffer
	movs r0, 0x3
	bl HideBg
	movs r0, 0x3
	bl UnsetBgTilemapBuffer
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl ClearGpuRegBits
	b _0802143E
_08021426:
	bl sub_800E084
	adds r0, r5, 0
	bl sub_8022960
	bl sub_8034CC8
	b _0802143E
_08021436:
	movs r0, 0
	strb r0, [r5, 0xC]
	movs r0, 0x1
	b _08021446
_0802143E:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
_08021444:
	movs r0, 0
_08021446:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_802130C

	thumb_func_start sub_8021450
sub_8021450: @ 8021450
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, =gUnknown_02021BBE
	ldrh r1, [r4, 0x2C]
	ldrh r2, [r4, 0x2A]
	adds r1, r2
	strh r1, [r0]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x16
	bl SetGpuReg
	ldrh r0, [r4, 0x12]
	cmp r0, 0x7
	bne _0802147C
	movs r1, 0x9C
	lsls r1, 1
	adds r0, r4, r1
	ldrh r1, [r4, 0x28]
	bl sub_8022524
_0802147C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8021450

	thumb_func_start sub_8021488
sub_8021488: @ 8021488
	movs r1, 0
	ldr r2, =0x0000ff98
	strh r2, [r0, 0x2A]
	strh r1, [r0, 0x2C]
	ldr r0, =gUnknown_02021BBC
	strh r1, [r0]
	ldr r0, =gUnknown_02021BBE
	strh r2, [r0]
	bx lr
	.pool
	thumb_func_end sub_8021488

	thumb_func_start sub_80214A8
sub_80214A8: @ 80214A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r10, r0
	str r1, [sp]
	movs r0, 0
	mov r9, r0
	mov r1, r10
	ldrb r1, [r1, 0x9]
	cmp r9, r1
	bcc _080214C6
	b _080215E4
_080214C6:
	ldr r1, =gUnknown_082F41E8
	mov r2, r9
	lsls r0, r2, 1
	adds r0, r1
	ldrh r2, [r0]
	mov r1, r9
	lsls r0, r1, 5
	add r0, r10
	adds r0, 0xA4
	ldrh r3, [r0]
	adds r3, 0x85
	lsls r3, 16
	lsrs r3, 16
	ldr r0, =gUnknown_082F436C
	adds r1, r2, 0
	bl AddItemIconObjectWithCustomObjectTemplate
	lsls r0, 24
	lsrs r0, 24
	mov r2, r9
	lsls r3, r2, 2
	ldr r1, [sp]
	adds r1, 0x38
	adds r6, r1, r3
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, =gUnknown_02020630
	adds r1, r0
	str r1, [r6]
	ldrb r0, [r1, 0x5]
	movs r2, 0xC
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldr r2, [r6]
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, [r6]
	ldr r0, [sp]
	adds r0, 0xC
	adds r0, r3
	mov r8, r0
	ldr r0, [r0]
	ldrh r0, [r0, 0x8]
	adds r0, 0x78
	strh r0, [r1, 0x20]
	ldr r1, [r6]
	ldr r0, =0x0000fff0
	strh r0, [r1, 0x22]
	ldr r3, [r6]
	adds r5, r3, 0
	adds r5, 0x2E
	movs r0, 0x80
	lsls r0, 2
	strh r0, [r5, 0x2]
	movs r0, 0x20
	strh r0, [r5, 0x4]
	movs r0, 0x70
	strh r0, [r5, 0xE]
	mov r2, r8
	ldr r1, [r2]
	ldrh r0, [r1, 0xA]
	ldrh r1, [r1, 0x8]
	subs r0, r1
	lsls r0, 16
	asrs r1, r0, 16
	adds r0, r1, 0
	cmp r1, 0
	bge _08021558
	adds r0, r1, 0x3
_08021558:
	asrs r0, 2
	strh r0, [r5, 0xC]
	lsls r0, r1, 23
	lsrs r7, r0, 16
	movs r2, 0x80
	lsls r2, 2
	adds r2, 0x20
	lsrs r2, 1
	movs r0, 0x7
	movs r1, 0xFE
	lsls r1, 6
	str r3, [sp, 0x4]
	bl sub_81515D4
	adds r4, r0, 0
	ldr r0, [r6]
	ldrh r0, [r0, 0x20]
	lsls r0, 7
	ldr r3, [sp, 0x4]
	strh r0, [r3, 0x2E]
	lsls r1, r7, 16
	asrs r1, 16
	lsls r4, 16
	asrs r4, 16
	movs r0, 0x7
	adds r2, r4, 0
	bl sub_81515D4
	strh r0, [r5, 0x6]
	movs r0, 0x7
	adds r1, r4, 0
	movs r2, 0x55
	bl sub_8151550
	adds r2, r0, 0
	movs r0, 0
	strh r0, [r5, 0x8]
	lsls r2, 16
	asrs r2, 16
	movs r0, 0x7
	movs r1, 0xFE
	lsls r1, 6
	bl sub_81515D4
	strh r0, [r5, 0xA]
	ldrh r0, [r5, 0xE]
	ldr r2, =0xffff8000
	adds r1, r2, 0
	orrs r0, r1
	strh r0, [r5, 0xE]
	mov r1, r8
	ldr r0, [r1]
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bge _080215D0
	ldr r0, [r6]
	movs r1, 0x1
	bl StartObjectRotScalAnim
_080215D0:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	mov r0, r10
	ldrb r0, [r0, 0x9]
	cmp r9, r0
	bcs _080215E4
	b _080214C6
_080215E4:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80214A8

	thumb_func_start sub_8021608
sub_8021608: @ 8021608
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r5, 0
	adds r4, 0x2E
	ldrh r0, [r4, 0x4]
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 24
	ldrh r2, [r5, 0x26]
	adds r0, r2
	strh r0, [r5, 0x26]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	movs r6, 0x80
	lsls r6, 8
	ands r0, r6
	cmp r0, 0
	beq _0802166E
	ldrh r0, [r4, 0x6]
	ldrh r2, [r5, 0x2E]
	adds r0, r2
	strh r0, [r5, 0x2E]
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x8]
	adds r0, r1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 23
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r5, 0x24]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	ands r0, r6
	cmp r0, 0
	beq _0802166E
	ldrh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 23
	cmp r0, 0x7E
	ble _0802166E
	movs r0, 0
	strh r0, [r5, 0x24]
	ldrh r1, [r4, 0xE]
	ldr r0, =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xE]
_0802166E:
	ldrh r0, [r4]
	lsls r0, 16
	asrs r0, 23
	strh r0, [r5, 0x20]
	movs r2, 0x22
	ldrsh r1, [r5, r2]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	adds r1, r0
	ldrh r2, [r4, 0xE]
	ldr r0, =0x00007fff
	ands r0, r2
	cmp r1, r0
	blt _0802169A
	ldr r0, =DummyObjectCallback
	str r0, [r5, 0x1C]
	adds r0, r5, 0
	bl obj_free_rotscale_entry
	adds r0, r5, 0
	bl RemoveObjectAndFreeTiles
_0802169A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8021608

	thumb_func_start sub_80216A8
sub_80216A8: @ 80216A8
	push {r4-r7,lr}
	adds r6, r0, 0
	movs r5, 0
	ldrb r0, [r6, 0x9]
	cmp r5, r0
	bcs _080216D4
	ldr r7, =gUnknown_082F41E8
_080216B6:
	lsls r0, r5, 1
	adds r0, r7
	ldrh r4, [r0]
	adds r0, r4, 0
	bl FreeObjectPaletteByTag
	adds r0, r4, 0
	bl FreeObjectTilesByTag
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r6, 0x9]
	cmp r5, r0
	bcc _080216B6
_080216D4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80216A8

	thumb_func_start sub_80216E0
sub_80216E0: @ 80216E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r6, r0, 0
	str r1, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r1, 0x4E
	adds r1, r6
	mov r10, r1
	mov r9, r0
	ldrb r2, [r6, 0x9]
	cmp r0, r2
	bcs _080217AE
	ldr r7, =gUnknown_082F41CC
_08021704:
	mov r3, r10
	ldrh r0, [r3, 0xA]
	mov r4, r9
	lsls r1, r4, 1
	add r1, r9
	asrs r0, r1
	lsls r0, 16
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	lsrs r1, 16
	mov r8, r1
	cmp r1, 0
	beq _0802179E
	ldr r0, [sp, 0x4]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08021748
	lsls r4, 2
	ldr r5, [sp]
	adds r5, 0x24
	adds r0, r5, r4
	ldr r0, [r0]
	movs r1, 0x1
	bl StartObjectImageAnim
	b _0802175A
	.pool
_08021748:
	mov r0, r9
	lsls r4, r0, 2
	ldr r5, [sp]
	adds r5, 0x24
	adds r0, r5, r4
	ldr r0, [r0]
	movs r1, 0
	bl StartObjectImageAnim
_0802175A:
	adds r3, r5, r4
	ldr r2, [r3]
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r4, 0x5
	negs r4, r4
	adds r1, r4, 0
	ands r0, r1
	strb r0, [r2]
	ldr r2, [r3]
	adds r2, 0x2C
	ldrb r0, [r2]
	subs r4, 0x3C
	adds r1, r4, 0
	ands r0, r1
	strb r0, [r2]
	ldr r2, [r3]
	movs r0, 0x3
	mov r1, r8
	ands r1, r0
	mov r8, r1
	subs r1, 0x1
	lsls r1, 1
	adds r0, r1, r7
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r2, 0x24]
	ldr r2, [r3]
	ldr r3, =gUnknown_082F41CD
	adds r1, r3
	movs r0, 0
	ldrsb r0, [r1, r0]
	strh r0, [r2, 0x26]
_0802179E:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldrb r4, [r6, 0x9]
	cmp r9, r4
	bcc _08021704
_080217AE:
	ldr r0, [sp, 0x4]
	cmp r0, 0
	bne _080217C0
	adds r2, r6, 0
	adds r2, 0x25
	ldrb r1, [r2]
	b _0802189C
	.pool
_080217C0:
	ldrh r0, [r6, 0x28]
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r1, r8
	str r1, [sp, 0x8]
	movs r2, 0
	mov r9, r2
	mov r3, r10
	ldrh r1, [r3, 0xC]
	lsls r0, r1, 1
	adds r0, 0x3
	adds r6, 0x25
	str r6, [sp, 0xC]
	adds r3, r1, 0
	cmp r9, r0
	bge _08021890
_080217E8:
	mov r4, r9
	lsls r1, r4, 2
	ldr r0, [sp]
	adds r0, 0x4C
	adds r7, r0, r1
	ldr r2, [r7]
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0802187E
	ldr r0, =sub_8022B28
	str r0, [r2, 0x1C]
	lsls r1, r4, 1
	ldr r3, =gUnknown_082F41D2
	adds r0, r1, r3
	movs r4, 0
	ldrsb r4, [r0, r4]
	adds r0, r4, 0
	adds r0, 0x78
	strh r0, [r2, 0x20]
	ldr r2, [r7]
	ldr r0, =gUnknown_082F41D3
	adds r1, r0
	movs r6, 0
	ldrsb r6, [r1, r6]
	mov r1, r8
	lsls r0, r1, 2
	subs r0, 0x88
	subs r0, r6, r0
	strh r0, [r2, 0x22]
	ldr r5, [r7]
	ldr r2, [sp, 0x8]
	lsls r1, r2, 2
	adds r0, r4, 0
	bl __divsi3
	adds r4, r0
	strh r4, [r5, 0x24]
	ldr r0, [r7]
	strh r6, [r0, 0x26]
	mov r3, r10
	ldrb r1, [r3, 0x4]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08021860
	ldr r0, [r7]
	movs r1, 0x1
	bl StartObjectImageAnim
	b _08021868
	.pool
_08021860:
	ldr r0, [r7]
	movs r1, 0
	bl StartObjectImageAnim
_08021868:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r4, r10
	ldrh r3, [r4, 0xC]
	cmp r0, 0x3
	bls _0802187E
	movs r0, 0
	mov r8, r0
_0802187E:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r0, r3, 1
	adds r0, 0x3
	cmp r9, r0
	blt _080217E8
_08021890:
	ldr r2, [sp, 0xC]
	ldrb r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080218A6
_0802189C:
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	b _080218C4
_080218A6:
	ldr r3, [sp, 0x4]
	cmp r3, 0x1
	bne _080218B4
	movs r0, 0x4E
	bl audio_play
	b _080218BA
_080218B4:
	movs r0, 0x4D
	bl audio_play
_080218BA:
	ldr r4, [sp, 0xC]
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
_080218C4:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80216E0

	thumb_func_start sub_80218D4
sub_80218D4: @ 80218D4
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	movs r2, 0
	ldrb r0, [r5, 0x9]
	cmp r2, r0
	bcs _08021906
	adds r4, r6, 0
	adds r4, 0x24
	movs r7, 0x4
	adds r3, r0, 0
_080218EA:
	lsls r0, r2, 2
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, 0x3E
	ldrb r1, [r0]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _08021920
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r3
	bcc _080218EA
_08021906:
	movs r2, 0
	adds r3, r6, 0
	adds r3, 0x4C
	movs r4, 0x4
_0802190E:
	lsls r0, r2, 2
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, 0x3E
	ldrb r1, [r0]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _08021924
_08021920:
	movs r0, 0
	b _0802193C
_08021924:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xA
	bls _0802190E
	movs r1, 0x2C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0802193A
	movs r0, 0
	strh r0, [r5, 0x2C]
_0802193A:
	movs r0, 0x1
_0802193C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80218D4

	thumb_func_start sub_8021944
sub_8021944: @ 8021944
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r4, r1, 16
	lsrs r4, 16
	movs r7, 0
	movs r5, 0xE1
	lsls r5, 4
	adds r0, r4, 0
	adds r1, r5, 0
	bl __udivsi3
	strh r0, [r6, 0x4]
	adds r0, r4, 0
	adds r1, r5, 0
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3C
	bl __udivsi3
	strh r0, [r6, 0x6]
	adds r0, r4, 0
	movs r1, 0x3C
	bl __umodsi3
	lsls r0, 24
	asrs r0, 16
	movs r1, 0x4
	bl sub_8151534
	adds r2, r7, 0
	lsls r0, 16
	asrs r3, r0, 16
	movs r0, 0x7
	mov r12, r0
	ldr r5, =gUnknown_082F334C
	movs r4, 0x1
_08021990:
	mov r0, r12
	subs r1, r0, r2
	adds r0, r3, 0
	asrs r0, r1
	ands r0, r4
	cmp r0, 0
	beq _080219A6
	lsls r0, r2, 2
	adds r0, r5
	ldr r0, [r0]
	adds r7, r0
_080219A6:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _08021990
	ldr r1, =0x000f4240
	adds r0, r7, 0
	bl __udivsi3
	strh r0, [r6, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8021944

	thumb_func_start sub_80219C8
sub_80219C8: @ 80219C8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	mov r8, r3
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x2
	mov r1, r8
	bl GetStringWidth
	lsls r4, 2
	lsrs r0, 1
	subs r4, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r5, 1
	adds r0, r5
	ldr r1, =gUnknown_082F32D8
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	mov r0, r8
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0
	bl box_print
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80219C8

	thumb_func_start sub_8021A28
sub_8021A28: @ 8021A28
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	str r0, [sp, 0xC]
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x10]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x14]
	lsls r3, 24
	movs r0, 0
	str r0, [sp, 0x18]
	movs r1, 0
	str r1, [sp, 0x1C]
	ldr r2, [sp, 0xC]
	adds r2, 0x68
	str r2, [sp, 0x20]
	movs r4, 0xF0
	lsls r4, 24
	adds r3, r4
	lsrs r3, 24
	ldr r0, [sp, 0x10]
	cmp r0, 0x2
	bne _08021A68
	adds r0, r3, 0
	subs r0, 0x2A
	lsls r0, 24
	lsrs r3, r0, 24
_08021A68:
	ldr r2, [sp, 0xC]
	ldrb r1, [r2, 0x9]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	subs r6, r3, r0
	cmp r6, 0
	ble _08021A84
	lsrs r0, r6, 31
	adds r0, r6, r0
	asrs r0, 1
	adds r6, r0, 0
	adds r6, 0x10
	b _08021A86
_08021A84:
	movs r6, 0x10
_08021A86:
	movs r5, 0
	ldr r3, [sp, 0xC]
	ldrb r3, [r3, 0x9]
	cmp r5, r3
	bcc _08021A92
	b _08021D14
_08021A92:
	ldr r4, [sp, 0x10]
	lsls r4, 2
	str r4, [sp, 0x24]
_08021A98:
	bl sub_81AFBF0
	ldr r0, [sp, 0x10]
	cmp r0, 0x1
	beq _08021B48
	cmp r0, 0x1
	bgt _08021AC0
	cmp r0, 0
	beq _08021ADE
	ldr r4, [sp, 0x14]
	subs r4, 0x4
	lsls r1, r6, 24
	mov r10, r1
	ldr r2, [sp, 0x1C]
	adds r2, 0xA2
	mov r9, r2
	ldr r3, [sp, 0x18]
	lsls r3, 5
	mov r8, r3
	b _08021C5A
_08021AC0:
	ldr r4, [sp, 0x10]
	cmp r4, 0x2
	bne _08021AC8
	b _08021C1C
_08021AC8:
	ldr r4, [sp, 0x14]
	subs r4, 0x4
	lsls r0, r6, 24
	mov r10, r0
	ldr r1, [sp, 0x1C]
	adds r1, 0xA2
	mov r9, r1
	ldr r2, [sp, 0x18]
	lsls r2, 5
	mov r8, r2
	b _08021C5A
_08021ADE:
	ldr r0, [sp, 0x20]
	adds r0, 0x20
	adds r0, r5
	ldrb r0, [r0]
	str r0, [sp, 0x18]
	lsls r3, r5, 1
	ldr r2, [sp, 0x20]
	adds r2, 0xC
	cmp r5, 0
	beq _08021B04
	adds r0, r2, r3
	subs r1, r5, 0x1
	lsls r1, 1
	adds r1, r2, r1
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	beq _08021B04
	str r5, [sp, 0x1C]
_08021B04:
	ldr r4, [sp, 0x24]
	ldr r1, [sp, 0x10]
	adds r0, r4, r1
	lsls r0, 1
	adds r0, r3, r0
	adds r0, r2, r0
	ldrh r1, [r0]
	ldr r0, =gStringVar4
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	ldr r0, =gUnknown_082F43B4
	adds r0, r4, r0
	ldr r1, [r0]
	ldr r0, =gStringVar4
	bl StringAppend
	ldr r4, [sp, 0x14]
	subs r4, 0x4
	lsls r2, r6, 24
	mov r10, r2
	ldr r3, [sp, 0x1C]
	adds r3, 0xA2
	mov r9, r3
	ldr r0, [sp, 0x18]
	lsls r0, 5
	mov r8, r0
	b _08021C5A
	.pool
_08021B48:
	ldr r1, [sp, 0x20]
	adds r0, r1, r5
	adds r0, 0x28
	ldrb r0, [r0]
	str r0, [sp, 0x18]
	lsls r3, r5, 1
	adds r2, r1, 0
	adds r2, 0xC
	cmp r5, 0
	beq _08021B72
	adds r0, r3, 0
	adds r0, 0xA
	adds r0, r2, r0
	adds r1, r3, 0
	adds r1, 0x8
	adds r1, r2, r1
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	beq _08021B72
	str r5, [sp, 0x1C]
_08021B72:
	ldr r0, [sp, 0x24]
	ldr r1, [sp, 0x10]
	adds r4, r0, r1
	lsls r4, 1
	adds r4, r3, r4
	adds r4, r2, r4
	ldrh r1, [r4]
	lsrs r1, 4
	ldr r0, =gStringVar1
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r7, 0
	ldrb r0, [r4]
	movs r3, 0xF
	ands r3, r0
	movs r2, 0
	ldr r4, [sp, 0x10]
	lsls r4, 2
	str r4, [sp, 0x28]
	ldr r4, [sp, 0x14]
	subs r4, 0x4
	lsls r0, r6, 24
	mov r10, r0
	ldr r1, [sp, 0x1C]
	adds r1, 0xA2
	mov r9, r1
	ldr r0, [sp, 0x18]
	lsls r0, 5
	mov r8, r0
	adds r6, 0xE
	adds r5, 0x1
	ldr r1, =gUnknown_082F334C
	mov r12, r1
_08021BB8:
	movs r0, 0x3
	subs r1, r0, r2
	adds r0, r3, 0
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08021BD0
	lsls r0, r2, 2
	add r0, r12
	ldr r0, [r0]
	adds r7, r0
_08021BD0:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _08021BB8
	adds r0, r7, 0
	ldr r1, =0x000f4240
	bl __udivsi3
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, =gStringVar2
	adds r1, r3, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, =gUnknown_082F43B4
	ldr r2, [sp, 0x28]
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, =gStringVar4
	bl StringExpandPlaceholders
	b _08021C5E
	.pool
_08021C1C:
	str r5, [sp, 0x18]
	str r5, [sp, 0x1C]
	lsls r7, r5, 5
	ldr r3, [sp, 0xC]
	adds r0, r3, r7
	adds r0, 0xA4
	ldrb r2, [r0]
	cmp r2, 0x2B
	bls _08021C30
	movs r2, 0
_08021C30:
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r0, =gBerries
	adds r1, r0
	ldr r0, =gStringVar1
	bl StringCopy
	ldr r0, =gUnknown_082F43B4
	ldr r1, [r0, 0x8]
	ldr r0, =gStringVar4
	bl StringExpandPlaceholders
	ldr r4, [sp, 0x14]
	subs r4, 0x4
	lsls r0, r6, 24
	mov r10, r0
	movs r1, 0xA2
	adds r1, r5
	mov r9, r1
	mov r8, r7
_08021C5A:
	adds r6, 0xE
	adds r5, 0x1
_08021C5E:
	movs r0, 0x2
	ldr r1, =gStringVar4
	adds r2, r4, 0
	bl GetStringRightAlignXOffset
	adds r2, r0, 0
	ldr r3, [sp, 0xC]
	movs r4, 0xDD
	lsls r4, 1
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r2, 24
	lsrs r2, 24
	mov r1, r10
	lsrs r3, r1, 24
	ldr r1, =gUnknown_082F32D8
	str r1, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r1, =gStringVar4
	str r1, [sp, 0x8]
	movs r1, 0x2
	bl box_print
	ldr r3, [sp, 0x18]
	ldr r2, [sp, 0xC]
	ldrb r2, [r2, 0x8]
	cmp r3, r2
	bne _08021CC0
	ldr r0, =gStringVar3
	ldr r1, =gUnknown_085ED7D4
	bl StringCopy
	b _08021CC8
	.pool
_08021CC0:
	ldr r0, =gStringVar3
	ldr r1, =gUnknown_085ED7E0
	bl StringCopy
_08021CC8:
	ldr r4, =gStringVar3
	mov r3, r9
	strb r3, [r4]
	mov r1, r8
	adds r1, 0x98
	ldr r0, [sp, 0xC]
	adds r1, r0, r1
	movs r0, 0
	bl sub_81AFC0C
	ldr r0, =gStringVar4
	adds r1, r4, 0
	bl sub_81AFC28
	ldr r1, [sp, 0xC]
	movs r2, 0xDD
	lsls r2, 1
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r4, r10
	lsrs r3, r4, 24
	ldr r1, =gUnknown_082F32D8
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	ldr r2, =gStringVar4
	str r2, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x4
	bl box_print
	lsls r0, r5, 24
	lsrs r5, r0, 24
	ldr r3, [sp, 0xC]
	ldrb r3, [r3, 0x9]
	cmp r5, r3
	bcs _08021D14
	b _08021A98
_08021D14:
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8021A28

	thumb_func_start sub_8021D34
sub_8021D34: @ 8021D34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	mov r8, r0
	movs r0, 0
	mov r10, r0
	movs r6, 0
	movs r1, 0
	str r1, [sp, 0xC]
	mov r2, r8
	adds r2, 0x68
	str r2, [sp, 0x10]
	movs r4, 0xDD
	lsls r4, 1
	add r4, r8
	mov r9, r4
	ldrb r0, [r4]
	movs r1, 0x4
	bl GetWindowAttribute
	lsls r0, 27
	movs r1, 0xD6
	lsls r1, 24
	adds r0, r1
	lsrs r7, r0, 24
	movs r0, 0x9C
	lsls r0, 1
	add r0, r8
	ldr r2, [sp, 0x10]
	ldrh r1, [r2, 0x4]
	bl sub_8021944
	ldrb r0, [r4]
	ldr r4, =gUnknown_082F32D8
	str r4, [sp]
	str r6, [sp, 0x4]
	ldr r1, =gUnknown_085ED808
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0
	adds r3, r7, 0
	bl box_print
	ldr r4, =gUnknown_085ED840
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	movs r1, 0xB0
	subs r0, r1, r0
	lsls r0, 24
	lsrs r6, r0, 24
	mov r2, r9
	ldrb r0, [r2]
	ldr r1, =gUnknown_082F32D8
	str r1, [sp]
	mov r2, r10
	str r2, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	adds r2, r6, 0
	adds r3, r7, 0
	bl box_print
	movs r0, 0x9F
	lsls r0, 1
	add r0, r8
	movs r4, 0
	ldrsh r1, [r0, r4]
	ldr r0, =gStringVar1
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, =gStringVar2
	movs r1, 0xA0
	lsls r1, 1
	add r1, r8
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r5, =gStringVar4
	ldr r1, =gUnknown_085ED838
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0x2
	adds r1, r5, 0
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	subs r0, r6, r0
	lsls r0, 24
	lsrs r6, r0, 24
	mov r4, r9
	ldrb r0, [r4]
	ldr r1, =gUnknown_082F32D8
	str r1, [sp]
	mov r2, r10
	str r2, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0x2
	adds r2, r6, 0
	adds r3, r7, 0
	bl box_print
	ldr r4, =gUnknown_085ED830
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	subs r0, r6, r0
	lsls r0, 24
	lsrs r6, r0, 24
	mov r1, r9
	ldrb r0, [r1]
	ldr r2, =gUnknown_082F32D8
	str r2, [sp]
	mov r1, r10
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	adds r2, r6, 0
	adds r3, r7, 0
	bl box_print
	movs r0, 0x9E
	lsls r0, 1
	add r0, r8
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldr r0, =gStringVar1
	movs r2, 0x2
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	ldr r1, =gUnknown_085ED82C
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0x2
	adds r1, r5, 0
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	subs r0, r6, r0
	lsls r0, 24
	lsrs r6, r0, 24
	mov r4, r9
	ldrb r0, [r4]
	ldr r1, =gUnknown_082F32D8
	str r1, [sp]
	mov r2, r10
	str r2, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0x2
	adds r2, r6, 0
	adds r3, r7, 0
	bl box_print
	adds r0, r7, 0
	adds r0, 0xE
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r4]
	ldr r4, =gUnknown_082F32D8
	str r4, [sp]
	mov r1, r10
	str r1, [sp, 0x4]
	ldr r1, =gUnknown_085ED810
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0
	adds r3, r7, 0
	bl box_print
	ldr r4, =gUnknown_085ED850
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	movs r2, 0xB0
	subs r0, r2, r0
	lsls r0, 24
	str r0, [sp, 0x18]
	lsrs r6, r0, 24
	mov r1, r9
	ldrb r0, [r1]
	ldr r2, =gUnknown_082F32D8
	str r2, [sp]
	mov r1, r10
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	adds r2, r6, 0
	adds r3, r7, 0
	bl box_print
	mov r4, r8
	ldrb r2, [r4, 0x16]
	ldrh r0, [r4, 0x16]
	mov r12, r0
	movs r1, 0x7
	mov r9, r1
	movs r5, 0x1
	ldr r3, =gUnknown_082F334C
_08021EEC:
	mov r4, r9
	mov r0, r10
	subs r1, r4, r0
	adds r0, r2, 0
	asrs r0, r1
	ands r0, r5
	cmp r0, 0
	beq _08021F0A
	mov r1, r10
	lsls r0, r1, 2
	adds r0, r3
	ldr r0, [r0]
	ldr r4, [sp, 0xC]
	adds r4, r0
	str r4, [sp, 0xC]
_08021F0A:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	cmp r0, 0x7
	bls _08021EEC
	ldr r0, =gStringVar1
	mov r2, r12
	lsrs r1, r2, 8
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, =gStringVar2
	ldr r1, =0x000f4240
	ldr r0, [sp, 0xC]
	bl __udivsi3
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r4, =gStringVar4
	ldr r1, =gUnknown_085ED848
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x2
	adds r1, r4, 0
	bl GetStringWidth
	subs r0, r6, r0
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r8
	adds r0, 0x25
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08021FC4
	movs r0, 0xDD
	lsls r0, 1
	add r0, r8
	ldrb r0, [r0]
	ldr r1, =gUnknown_082F32E7
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	adds r2, r6, 0
	adds r3, r7, 0
	bl box_print
	b _08021FDE
	.pool
_08021FC4:
	movs r0, 0xDD
	lsls r0, 1
	add r0, r8
	ldrb r0, [r0]
	ldr r1, =gUnknown_082F32D8
	str r1, [sp]
	str r2, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	adds r2, r6, 0
	adds r3, r7, 0
	bl box_print
_08021FDE:
	adds r0, r7, 0
	adds r0, 0xE
	lsls r0, 24
	lsrs r7, r0, 24
	movs r4, 0xDD
	lsls r4, 1
	add r8, r4
	mov r1, r8
	ldrb r0, [r1]
	ldr r2, =gUnknown_082F32D8
	mov r9, r2
	str r2, [sp]
	movs r5, 0
	str r5, [sp, 0x4]
	ldr r1, =gUnknown_085ED820
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0
	adds r3, r7, 0
	bl box_print
	ldr r0, =gStringVar1
	ldr r4, [sp, 0x10]
	ldrh r1, [r4, 0x8]
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, =gStringVar4
	ldr r1, =gUnknown_085ED85C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x2
	adds r1, r4, 0
	bl GetStringWidth
	movs r1, 0xB0
	subs r1, r0
	lsls r1, 24
	lsrs r6, r1, 24
	mov r1, r8
	ldrb r0, [r1]
	mov r2, r9
	str r2, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	adds r2, r6, 0
	adds r3, r7, 0
	bl box_print
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8021D34

	thumb_func_start sub_8022070
sub_8022070: @ 8022070
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r6, r1, 0
	adds r0, r6, 0
	adds r0, 0x80
	ldrb r0, [r0]
	cmp r0, 0x5
	bls _08022084
	b _08022218
_08022084:
	lsls r0, 2
	ldr r1, =_08022094
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08022094:
	.4byte _080220AC
	.4byte _080220F8
	.4byte _0802210C
	.4byte _08022130
	.4byte _080221F8
	.4byte _08022200
_080220AC:
	ldrb r0, [r4, 0x9]
	subs r0, 0x2
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r6, 0
	bl sub_8022554
	ldrh r0, [r4, 0x12]
	lsls r0, 3
	ldr r2, =gUnknown_082F32CC
	mov r1, sp
	adds r0, r2
	ldm r0!, {r2,r3}
	stm r1!, {r2,r3}
	ldrh r0, [r4, 0x12]
	cmp r0, 0xD
	bne _080220DC
	ldr r0, =gUnknown_082F3344
	adds r0, 0x4
	b _080220DE
	.pool
_080220DC:
	ldr r0, =gUnknown_082F3344
_080220DE:
	adds r0, r5, r0
	ldrb r1, [r0]
	mov r0, sp
	strb r1, [r0, 0x4]
	mov r0, sp
	bl AddWindow
	adds r1, r6, 0
	adds r1, 0x82
	strb r0, [r1]
	b _08022218
	.pool
_080220F8:
	adds r4, r6, 0
	adds r4, 0x82
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, 0
	bl FillWindowPixelBuffer
	b _08022218
_0802210C:
	adds r5, r6, 0
	adds r5, 0x82
	ldrb r0, [r5]
	ldr r4, =0x0000021d
	adds r1, r4, 0
	movs r2, 0xD0
	bl box_border_load_tiles_and_pal
	ldrb r0, [r5]
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0xD
	bl SetWindowBorderStyle
	b _08022218
	.pool
_08022130:
	ldrb r0, [r4, 0x9]
	subs r0, 0x2
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r4, 0x12]
	cmp r0, 0xC
	beq _08022184
	cmp r0, 0xC
	bgt _08022148
	cmp r0, 0xB
	beq _0802214E
	b _08022218
_08022148:
	cmp r0, 0xD
	beq _080221C8
	b _08022218
_0802214E:
	adds r0, r6, 0
	adds r0, 0x82
	ldrb r0, [r0]
	ldr r3, =gUnknown_085ED860
	movs r1, 0x14
	movs r2, 0x3
	bl sub_80219C8
	ldr r0, =gUnknown_082F3344
	adds r0, r5, r0
	ldrb r3, [r0]
	lsls r3, 27
	lsrs r3, 24
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xA0
	bl sub_8021A28
	adds r1, r6, 0
	adds r1, 0x80
	movs r0, 0x5
	b _08022220
	.pool
_08022184:
	adds r0, r6, 0
	adds r0, 0x82
	ldrb r0, [r0]
	ldr r2, =gUnknown_082F43B4
	adds r1, r4, 0
	adds r1, 0x8F
	ldrb r1, [r1]
	adds r1, 0x3
	lsls r1, 2
	adds r1, r2
	ldr r3, [r1]
	movs r1, 0x14
	movs r2, 0x4
	bl sub_80219C8
	ldr r0, =gUnknown_082F3344
	adds r0, r5, r0
	ldrb r3, [r0]
	lsls r3, 27
	lsrs r3, 24
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0xA0
	bl sub_8021A28
	adds r1, r6, 0
	adds r1, 0x80
	movs r0, 0x5
	b _08022220
	.pool
_080221C8:
	adds r0, r6, 0
	adds r0, 0x82
	ldrb r0, [r0]
	ldr r3, =gUnknown_085ED878
	movs r1, 0x16
	movs r2, 0x3
	bl sub_80219C8
	ldr r0, =gUnknown_082F3344
	adds r0, 0x4
	adds r0, r5, r0
	ldrb r3, [r0]
	lsls r3, 27
	lsrs r3, 24
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0xB0
	bl sub_8021A28
	b _08022218
	.pool
_080221F8:
	adds r0, r4, 0
	bl sub_8021D34
	b _08022218
_08022200:
	adds r0, r6, 0
	adds r0, 0x82
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram
	adds r1, r6, 0
	adds r1, 0x80
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	b _08022224
_08022218:
	adds r1, r6, 0
	adds r1, 0x80
	ldrb r0, [r1]
	adds r0, 0x1
_08022220:
	strb r0, [r1]
	movs r0, 0
_08022224:
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8022070

	thumb_func_start sub_802222C
sub_802222C: @ 802222C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0xDD
	lsls r0, 1
	adds r5, r4, r0
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8198070
	ldrb r0, [r5]
	bl RemoveWindow
	adds r0, r4, 0
	bl sub_8022600
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_802222C

	thumb_func_start sub_8022250
sub_8022250: @ 8022250
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	mov r9, r0
	movs r1, 0
	str r1, [sp, 0xC]
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, =gTasks + 0x8
	adds r6, r0, r1
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0x1
	beq _080222D0
	cmp r0, 0x1
	bgt _08022288
	cmp r0, 0
	beq _08022296
	b _080224BA
	.pool
_08022288:
	cmp r0, 0x2
	bne _0802228E
	b _08022480
_0802228E:
	cmp r0, 0x3
	bne _08022294
	b _08022494
_08022294:
	b _080224BA
_08022296:
	ldr r0, =gUnknown_082F32EC
	bl AddWindow
	strh r0, [r6, 0x2]
	lsls r0, 24
	lsrs r0, 24
	bl PutWindowTilemap
	ldrb r0, [r6, 0x2]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldrb r0, [r6, 0x2]
	ldr r4, =0x0000021d
	adds r1, r4, 0
	movs r2, 0xD0
	bl box_border_load_tiles_and_pal
	ldrb r0, [r6, 0x2]
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0xD
	bl SetWindowBorderStyle
	b _080224BA
	.pool
_080222D0:
	ldr r0, =gUnknown_085ED8D0
	mov r10, r0
	movs r1, 0x1
	negs r1, r1
	mov r8, r1
	movs r0, 0x1
	mov r1, r10
	mov r2, r8
	bl GetStringWidth
	lsrs r0, 1
	movs r4, 0x60
	subs r0, r4, r0
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r6, 0x2]
	ldr r5, =gUnknown_082F32E1
	str r5, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	mov r1, r10
	str r1, [sp, 0x8]
	movs r1, 0x1
	adds r2, r7, 0
	movs r3, 0x1
	bl box_print
	ldr r0, =gUnknown_085ED8DC
	mov r10, r0
	movs r0, 0x1
	mov r1, r10
	mov r2, r8
	bl GetStringWidth
	lsrs r0, 1
	subs r4, r0
	lsls r4, 24
	lsrs r7, r4, 24
	ldrb r0, [r6, 0x2]
	str r5, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	mov r1, r10
	str r1, [sp, 0x8]
	movs r1, 0x1
	adds r2, r7, 0
	movs r3, 0x11
	bl box_print
	movs r0, 0x29
	mov r10, r0
_08022336:
	mov r1, r9
	adds r1, 0x2
	ldr r0, =gStringVar1
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_085ED8F4
	bl StringExpandPlaceholders
	ldrb r0, [r6, 0x2]
	ldr r1, =gUnknown_082F32D8
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	ldr r1, =gStringVar4
	str r1, [sp, 0x8]
	movs r1, 0x1
	movs r2, 0
	mov r3, r10
	bl box_print
	movs r0, 0x1
	ldr r1, =gUnknown_085ED850
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	movs r1, 0xC0
	subs r1, r0
	lsls r1, 24
	lsrs r7, r1, 24
	ldrb r0, [r6, 0x2]
	ldr r1, =gUnknown_082F32D8
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	ldr r1, =gUnknown_085ED850
	str r1, [sp, 0x8]
	movs r1, 0x1
	adds r2, r7, 0
	mov r3, r10
	bl box_print
	movs r2, 0
	mov r0, r9
	lsls r4, r0, 1
	mov r1, r10
	adds r1, 0x10
	str r1, [sp, 0x10]
	movs r0, 0x1
	add r9, r0
	adds r0, r4, r6
	ldrb r3, [r0, 0x4]
	movs r1, 0x7
	mov r12, r1
	movs r0, 0x1
	mov r8, r0
	ldr r5, =gUnknown_082F334C
_080223AE:
	mov r0, r12
	subs r1, r0, r2
	adds r0, r3, 0
	asrs r0, r1
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _080223CA
	lsls r0, r2, 2
	adds r0, r5
	ldr r0, [r0]
	ldr r1, [sp, 0xC]
	adds r1, r0
	str r1, [sp, 0xC]
_080223CA:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _080223AE
	adds r0, r4, r6
	ldrh r1, [r0, 0x4]
	lsrs r1, 8
	ldr r0, =gStringVar1
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, [sp, 0xC]
	ldr r1, =0x000f4240
	bl __udivsi3
	adds r1, r0, 0
	ldr r0, =gStringVar2
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, =gStringVar4
	ldr r1, =gUnknown_085ED848
	bl StringExpandPlaceholders
	movs r0, 0x1
	ldr r1, =gStringVar4
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	subs r0, r7, r0
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r6, 0x2]
	ldr r1, =gUnknown_082F32D8
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	ldr r1, =gStringVar4
	str r1, [sp, 0x8]
	movs r1, 0x1
	adds r2, r7, 0
	mov r3, r10
	bl box_print
	ldr r1, [sp, 0x10]
	lsls r0, r1, 24
	lsrs r0, 24
	mov r10, r0
	movs r0, 0
	str r0, [sp, 0xC]
	mov r1, r9
	lsls r0, r1, 24
	lsrs r0, 24
	mov r9, r0
	cmp r0, 0x3
	bhi _08022444
	b _08022336
_08022444:
	ldrb r0, [r6, 0x2]
	movs r1, 0x3
	bl CopyWindowToVram
	b _080224BA
	.pool
_08022480:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _080224BA
	b _080224C0
	.pool
_08022494:
	ldrb r0, [r6, 0x2]
	movs r1, 0x1
	bl sub_8198070
	ldrb r0, [r6, 0x2]
	bl ClearWindowTilemap
	ldrb r0, [r6, 0x2]
	bl RemoveWindow
	adds r0, r4, 0
	bl DestroyTask
	bl script_env_2_enable_and_set_ctx_running
	bl script_env_2_disable
	mov r0, r9
	b _080224BE
_080224BA:
	ldrh r0, [r6]
	adds r0, 0x1
_080224BE:
	strh r0, [r6]
_080224C0:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8022250

	thumb_func_start sub_80224D0
sub_80224D0: @ 80224D0
	push {lr}
	bl script_env_2_enable
	ldr r0, =sub_8022250
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, =gSaveBlock2Ptr
	ldr r2, [r0]
	movs r3, 0xF6
	lsls r3, 1
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1, 0xC]
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1, 0xE]
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1, 0x10]
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1, 0x12]
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80224D0

	thumb_func_start sub_8022524
sub_8022524: @ 8022524
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	bl sub_8021944
	movs r0, 0x4
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl sub_8035044
	movs r0, 0x6
	ldrsh r1, [r4, r0]
	movs r0, 0x1
	bl sub_8035044
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	movs r0, 0x2
	bl sub_8035044
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8022524

	thumb_func_start sub_8022554
sub_8022554: @ 8022554
	push {lr}
	ldr r2, [r0, 0x78]
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2]
	ldr r1, [r0, 0x7C]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x1
	bl sub_803547C
	movs r0, 0x1
	movs r1, 0x1
	bl sub_803547C
	movs r0, 0
	movs r1, 0x1
	bl sub_803547C
	pop {r0}
	bx r0
	thumb_func_end sub_8022554

	thumb_func_start sub_8022588
sub_8022588: @ 8022588
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r6, 0
	ldrb r0, [r5, 0x9]
	cmp r6, r0
	bcs _080225E8
	ldr r7, =gUnknown_082F417C
_08022596:
	lsls r0, r6, 2
	movs r1, 0xA2
	lsls r1, 1
	adds r2, r5, r1
	adds r2, r0
	ldrb r1, [r5, 0x9]
	subs r1, 0x2
	lsls r0, r1, 2
	adds r0, r1
	adds r0, r6, r0
	adds r0, r7
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, =gUnknown_082F4190
	adds r0, r1
	str r0, [r2]
	ldrb r0, [r0]
	lsls r0, 3
	ldr r1, =gUnknown_082F32F4
	adds r0, r1
	bl AddWindow
	ldr r1, =0x000001bb
	adds r4, r5, r1
	adds r4, r6
	strb r0, [r4]
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, 0
	bl FillWindowPixelBuffer
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r5, 0x9]
	cmp r6, r0
	bcc _08022596
_080225E8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8022588

	thumb_func_start sub_8022600
sub_8022600: @ 8022600
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r6, r0, 0
	movs r7, 0
	ldrb r0, [r6, 0x9]
	cmp r7, r0
	bcs _080226B6
	movs r1, 0
	mov r8, r1
_08022616:
	ldr r1, =0x000001bb
	adds r0, r6, r1
	adds r5, r0, r7
	ldrb r0, [r5]
	bl PutWindowTilemap
	ldrb r0, [r6, 0x8]
	cmp r7, r0
	bne _08022668
	lsls r4, r7, 5
	adds r4, 0x98
	adds r4, r6, r4
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	lsrs r0, 1
	movs r2, 0x24
	subs r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r0, [r5]
	mov r1, r8
	str r1, [sp]
	str r1, [sp, 0x4]
	ldr r1, =gUnknown_082F32DB
	str r1, [sp, 0x8]
	mov r1, r8
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x2
	movs r3, 0x1
	bl AddTextPrinterParametrized2
	b _0802269C
	.pool
_08022668:
	lsls r4, r7, 5
	adds r4, 0x98
	adds r4, r6, r4
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	lsrs r0, 1
	movs r2, 0x24
	subs r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r0, [r5]
	mov r1, r8
	str r1, [sp]
	str r1, [sp, 0x4]
	ldr r1, =gUnknown_082F32DE
	str r1, [sp, 0x8]
	mov r1, r8
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x2
	movs r3, 0x1
	bl AddTextPrinterParametrized2
_0802269C:
	ldr r1, =0x000001bb
	adds r0, r6, r1
	adds r0, r7
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r6, 0x9]
	cmp r7, r0
	bcc _08022616
_080226B6:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8022600

	thumb_func_start sub_80226D0
sub_80226D0: @ 80226D0
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	movs r5, 0
	ldr r0, =gUnknown_08DE3FD4
	ldr r4, =0x0201c000
	adds r1, r4, 0
	bl LZ77UnCompWram
	b _0802271A
	.pool
_080226EC:
	lsls r1, r5, 2
	movs r2, 0xA2
	lsls r2, 1
	adds r0, r6, r2
	adds r0, r1
	ldr r3, [r0]
	ldrb r0, [r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	ldrb r2, [r3, 0x1]
	ldrb r3, [r3, 0x2]
	movs r0, 0xA
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x3
	bl CopyToBgTilemapBufferRect
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0802271A:
	ldrb r0, [r6, 0x9]
	cmp r5, r0
	bcc _080226EC
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80226D0

	thumb_func_start sub_8022730
sub_8022730: @ 8022730
	push {r4-r7,lr}
	adds r6, r0, 0
	movs r5, 0
	ldr r0, =0x0000ff98
	strh r0, [r6, 0x2A]
	strh r5, [r6, 0x2C]
	ldr r1, =gUnknown_02021BBC
	strh r5, [r1]
	ldr r1, =gUnknown_02021BBE
	strh r0, [r1]
	ldr r4, =gUnknown_082F41F4
_08022746:
	lsls r0, r5, 3
	adds r0, r4
	bl LoadCompressedObjectPic
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _08022746
	ldr r0, =gUnknown_082F421C
	bl LoadTaggedObjectPalettes
	ldr r0, =gUnknown_082F430C
	movs r1, 0x78
	movs r2, 0x58
	movs r3, 0x5
	bl AddObjectToFront
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0xAC
	lsls r0, 1
	adds r3, r6, r0
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r1, =gUnknown_02020630
	adds r0, r1
	str r0, [r3]
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r1, [r3]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1]
	ldr r1, [r3]
	adds r1, 0x2C
	ldrb r0, [r1]
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r1]
	movs r5, 0
	ldrb r1, [r6, 0x9]
	cmp r5, r1
	bcs _08022822
	movs r7, 0x4
_080227AA:
	lsls r4, r5, 2
	movs r3, 0xA2
	lsls r3, 1
	adds r0, r6, r3
	adds r0, r4
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	adds r1, 0x78
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r0, 0x6]
	adds r2, 0x20
	lsls r2, 16
	asrs r2, 16
	ldr r0, =gUnknown_082F4324
	movs r3, 0
	bl AddObjectToFront
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0xAE
	lsls r0, 1
	adds r3, r6, r0
	adds r3, r4
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r0, =gUnknown_02020630
	adds r1, r0
	str r1, [r3]
	ldrb r0, [r1, 0x5]
	movs r4, 0xD
	negs r4, r4
	adds r2, r4, 0
	ands r0, r2
	orrs r0, r7
	strb r0, [r1, 0x5]
	ldr r1, [r3]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r7
	strb r0, [r1]
	ldr r2, [r3]
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldr r2, [r3]
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r6, 0x9]
	cmp r5, r0
	bcc _080227AA
_08022822:
	movs r5, 0
	ldr r4, =gUnknown_082F41D2
	adds r7, r4, 0x1
_08022828:
	lsls r2, r5, 1
	adds r0, r2, r4
	movs r1, 0
	ldrsb r1, [r0, r1]
	adds r1, 0x78
	adds r2, r7
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	adds r2, 0x88
	ldr r0, =gUnknown_082F433C
	movs r3, 0x6
	bl AddObjectToFront
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r5, 2
	movs r1, 0xC2
	lsls r1, 1
	adds r3, r6, r1
	adds r3, r0
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r1, =gUnknown_02020630
	adds r0, r1
	str r0, [r3]
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r2, [r3]
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r2, [r3]
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	strh r5, [r0, 0x2E]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xA
	bls _08022828
	movs r5, 0
_0802288E:
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 19
	movs r3, 0xB0
	lsls r3, 16
	adds r1, r3
	asrs r1, 16
	ldr r0, =gUnknown_082F4354
	movs r2, 0x8
	movs r3, 0
	bl AddObjectToFront
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r5, 2
	movs r4, 0xD8
	lsls r4, 1
	adds r3, r6, r4
	adds r3, r0
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r1, =gUnknown_02020630
	adds r0, r1
	str r0, [r3]
	ldrb r1, [r0, 0x5]
	movs r4, 0xD
	negs r4, r4
	adds r2, r4, 0
	ands r1, r2
	strb r1, [r0, 0x5]
	ldr r2, [r3]
	adds r2, 0x3E
	ldrb r0, [r2]
	adds r4, 0x8
	adds r1, r4, 0
	ands r0, r1
	strb r0, [r2]
	ldr r2, [r3]
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r3, 0x41
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	strb r0, [r2]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _0802288E
	ldr r4, =gUnknown_082F4384
	movs r0, 0
	movs r1, 0
	adds r2, r4, 0
	bl sub_8034D14
	adds r2, r4, 0
	adds r2, 0x10
	movs r0, 0x1
	movs r1, 0
	bl sub_8034D14
	adds r4, 0x20
	movs r0, 0x2
	movs r1, 0
	adds r2, r4, 0
	bl sub_8034D14
	ldrh r0, [r6, 0x12]
	cmp r0, 0x1
	bne _08022928
	movs r4, 0x9C
	lsls r4, 1
	adds r0, r6, r4
	bl sub_8022554
_08022928:
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8022730

	thumb_func_start sub_8022960
sub_8022960: @ 8022960
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r4, 0
	movs r0, 0x4
	bl FreeObjectTilesByTag
	movs r0, 0x3
	bl FreeObjectTilesByTag
	movs r0, 0x2
	bl FreeObjectTilesByTag
	movs r0, 0x1
	bl FreeObjectTilesByTag
	movs r0, 0x4
	bl FreeObjectPaletteByTag
	movs r0, 0x2
	bl FreeObjectPaletteByTag
	movs r0, 0x1
	bl FreeObjectPaletteByTag
	movs r0, 0xD8
	lsls r0, 1
	adds r6, r5, r0
_08022996:
	lsls r0, r4, 2
	adds r0, r6, r0
	ldr r0, [r0]
	bl RemoveObjectAndFreeTiles
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bls _08022996
	movs r0, 0x2
	bl sub_80353DC
	movs r0, 0x1
	bl sub_80353DC
	movs r0, 0
	bl sub_80353DC
	movs r4, 0
	movs r1, 0xC2
	lsls r1, 1
	adds r6, r5, r1
_080229C4:
	lsls r0, r4, 2
	adds r0, r6, r0
	ldr r0, [r0]
	bl RemoveObjectAndFreeTiles
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xA
	bls _080229C4
	movs r4, 0
	ldrb r2, [r5, 0x9]
	cmp r4, r2
	bcs _080229FC
_080229E0:
	lsls r1, r4, 2
	movs r2, 0xAE
	lsls r2, 1
	adds r0, r5, r2
	adds r0, r1
	ldr r0, [r0]
	bl RemoveObjectAndFreeTiles
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5, 0x9]
	cmp r4, r0
	bcc _080229E0
_080229FC:
	movs r1, 0xAC
	lsls r1, 1
	adds r0, r5, r1
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08022A18
	adds r0, r2, 0
	bl RemoveObjectAndFreeTiles
_08022A18:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8022960

	thumb_func_start sub_8022A20
sub_8022A20: @ 8022A20
	push {lr}
	adds r3, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08022A46
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
_08022A46:
	pop {r0}
	bx r0
	thumb_func_end sub_8022A20

	thumb_func_start sub_8022A4C
sub_8022A4C: @ 8022A4C
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r1, 0
	ldr r5, =DummyObjectCallback
	adds r2, r3, 0
	adds r2, 0x2E
	movs r4, 0
_08022A5A:
	lsls r0, r1, 1
	adds r0, r2, r0
	strh r4, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _08022A5A
	movs r0, 0
	strh r0, [r3, 0x24]
	strh r0, [r3, 0x26]
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	str r5, [r3, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8022A4C

	thumb_func_start sub_8022A94
sub_8022A94: @ 8022A94
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r5, 0
	adds r4, 0x2E
	ldrh r0, [r4, 0x4]
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 24
	ldrh r2, [r5, 0x26]
	adds r0, r2
	strh r0, [r5, 0x26]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	movs r6, 0x80
	lsls r6, 8
	ands r0, r6
	cmp r0, 0
	beq _08022AFA
	ldrh r0, [r4, 0x6]
	ldrh r2, [r5, 0x2E]
	adds r0, r2
	strh r0, [r5, 0x2E]
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x8]
	adds r0, r1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 23
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r5, 0x24]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	ands r0, r6
	cmp r0, 0
	beq _08022AFA
	ldrh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 23
	cmp r0, 0x7E
	ble _08022AFA
	movs r0, 0
	strh r0, [r5, 0x24]
	ldrh r1, [r4, 0xE]
	ldr r0, =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xE]
_08022AFA:
	ldrh r0, [r4]
	lsls r0, 16
	asrs r0, 23
	strh r0, [r5, 0x20]
	movs r2, 0x22
	ldrsh r1, [r5, r2]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	adds r1, r0
	ldrh r2, [r4, 0xE]
	ldr r0, =0x00007fff
	ands r0, r2
	cmp r1, r0
	ble _08022B1A
	ldr r0, =sub_8022A4C
	str r0, [r5, 0x1C]
_08022B1A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8022A94

	thumb_func_start sub_8022B28
sub_8022B28: @ 8022B28
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r7, r6, 0
	adds r7, 0x2E
	movs r0, 0
	mov r8, r0
	movs r2, 0xA0
	lsls r2, 2
	strh r2, [r7, 0x2]
	movs r0, 0x20
	strh r0, [r7, 0x4]
	movs r1, 0xA8
	strh r1, [r7, 0xE]
	movs r0, 0x24
	ldrsh r4, [r6, r0]
	lsls r4, 23
	lsrs r4, 16
	ldrh r0, [r6, 0x22]
	subs r1, r0
	lsls r1, 23
	asrs r1, 16
	adds r2, 0x20
	asrs r2, 1
	movs r0, 0x7
	bl sub_81515D4
	adds r5, r0, 0
	ldrh r0, [r6, 0x20]
	lsls r0, 7
	strh r0, [r6, 0x2E]
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	movs r0, 0x7
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_81515D4
	strh r0, [r7, 0x6]
	movs r0, 0x7
	adds r1, r5, 0
	movs r2, 0x55
	bl sub_8151550
	adds r2, r0, 0
	mov r1, r8
	strh r1, [r7, 0x8]
	movs r1, 0xFE
	lsls r1, 6
	lsls r2, 16
	asrs r2, 16
	movs r0, 0x7
	bl sub_81515D4
	strh r0, [r7, 0xA]
	movs r2, 0x24
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bge _08022BA6
	adds r0, 0x3
_08022BA6:
	asrs r0, 2
	strh r0, [r7, 0xC]
	ldrh r0, [r7, 0xE]
	ldr r2, =0xffff8000
	adds r1, r2, 0
	orrs r0, r1
	strh r0, [r7, 0xE]
	mov r0, r8
	strh r0, [r6, 0x26]
	strh r0, [r6, 0x24]
	ldr r0, =sub_8022A94
	str r0, [r6, 0x1C]
	adds r2, r6, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r2, 0x12
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8022B28

	thumb_func_start sub_8022BEC
sub_8022BEC: @ 8022BEC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r2, 0
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	mov r8, r4
	bl sub_8020C00
	adds r6, r0, 0
	cmp r5, 0x19
	bls _08022C0A
	movs r5, 0
_08022C0A:
	cmp r4, 0
	beq _08022C14
	cmp r4, 0x1
	beq _08022C40
	b _08022C4A
_08022C14:
	cmp r5, 0
	beq _08022C28
	ldr r0, =gUnknown_082F43CC
	lsls r1, r5, 2
	adds r1, r0
	ldr r2, [r1]
	adds r0, r6, 0
	adds r1, r7, 0
	bl _call_via_r2
_08022C28:
	ldrb r0, [r6, 0xE]
	cmp r0, 0x19
	bls _08022C32
	mov r0, r8
	strb r0, [r6, 0xE]
_08022C32:
	ldr r0, =gUnknown_082F43CC
	ldrb r1, [r6, 0xE]
	lsls r1, 2
	b _08022C44
	.pool
_08022C40:
	ldr r0, =gUnknown_082F43CC
	lsls r1, r5, 2
_08022C44:
	adds r1, r0
	ldr r0, [r1]
	str r0, [r6, 0x4]
_08022C4A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8022BEC

	thumb_func_start sub_8022C58
sub_8022C58: @ 8022C58
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldrb r2, [r1]
	ldrb r3, [r1, 0x1]
	lsls r3, 8
	orrs r2, r3
	ldrb r3, [r1, 0x2]
	lsls r3, 16
	orrs r2, r3
	ldrb r3, [r1, 0x3]
	lsls r3, 24
	adds r0, r2, 0
	orrs r0, r3
	ldrb r2, [r1, 0x9]
	strb r2, [r1]
	ldrb r4, [r1, 0x8]
	lsls r4, 8
	ldrb r2, [r1, 0x7]
	orrs r4, r2
	ldr r5, =gPaletteFade
	ldrb r3, [r5, 0x8]
	movs r2, 0x7F
	ands r2, r3
	strb r2, [r5, 0x8]
	movs r5, 0x4
	ldrsb r5, [r1, r5]
	ldrb r2, [r1, 0x5]
	ldrb r3, [r1, 0x6]
	str r4, [sp]
	adds r1, r5, 0
	bl BeginNormalPaletteFade
	bl UpdatePaletteFade
	movs r0, 0x2
	strb r0, [r6, 0xE]
	movs r0, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8022C58

	thumb_func_start sub_8022CB0
sub_8022CB0: @ 8022CB0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0xC]
	cmp r0, 0x1
	beq _08022CE4
	cmp r0, 0x1
	bgt _08022CC6
	cmp r0, 0
	beq _08022CD0
	b _08022D06
_08022CC6:
	cmp r0, 0x2
	beq _08022CEA
	cmp r0, 0x3
	beq _08022CF6
	b _08022D06
_08022CD0:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _08022D0C
	ldrb r0, [r5]
	cmp r0, 0
	bne _08022D06
	movs r0, 0x3
	b _08022D0A
_08022CE4:
	bl sub_8010434
	b _08022D06
_08022CEA:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	bne _08022D06
	b _08022D0C
_08022CF6:
	ldrb r0, [r4, 0xF]
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	movs r0, 0
	strb r0, [r4, 0xC]
	b _08022D0E
_08022D06:
	ldrb r0, [r4, 0xC]
	adds r0, 0x1
_08022D0A:
	strb r0, [r4, 0xC]
_08022D0C:
	movs r0, 0
_08022D0E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8022CB0

	thumb_func_start sub_8022D14
sub_8022D14: @ 8022D14
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r7, r0, 0
	adds r5, r1, 0
	ldrb r4, [r5, 0x3]
	lsls r4, 8
	ldrb r0, [r5, 0x2]
	orrs r4, r0
	ldrb r6, [r7, 0xC]
	cmp r6, 0x1
	beq _08022DC0
	cmp r6, 0x1
	bgt _08022D38
	cmp r6, 0
	beq _08022D42
	b _08022E08
_08022D38:
	cmp r6, 0x2
	beq _08022DD8
	cmp r6, 0x3
	beq _08022DE8
	b _08022E08
_08022D42:
	movs r0, 0
	movs r1, 0
	bl sub_81973C4
	ldrb r1, [r5, 0x1]
	movs r0, 0x2
	mov r8, r0
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _08022D90
	ldr r4, =gStringVar4
	ldr r1, =gUnknown_082F32A4
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldrb r3, [r7, 0xB]
	str r6, [sp]
	mov r0, r8
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x1
	adds r2, r4, 0
	bl AddTextPrinterParametrized
	b _08022DB2
	.pool
_08022D90:
	ldr r1, =gUnknown_082F32A4
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	ldrb r3, [r7, 0xB]
	str r4, [sp]
	mov r0, r8
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x1
	bl AddTextPrinterParametrized
_08022DB2:
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	b _08022E08
	.pool
_08022DC0:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _08022E0E
	cmp r4, 0
	bne _08022E08
	ldrb r0, [r7, 0xC]
	adds r0, 0x1
	strb r0, [r7, 0xC]
	b _08022E08
_08022DD8:
	ldr r0, =gMain
	ldrh r0, [r0, 0x2E]
	ands r4, r0
	cmp r4, 0
	bne _08022E08
	b _08022E0E
	.pool
_08022DE8:
	ldrb r1, [r5, 0x1]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08022DFA
	movs r0, 0
	movs r1, 0x1
	bl sub_8197434
_08022DFA:
	ldrb r0, [r7, 0xE]
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	ldrb r0, [r5, 0x4]
	b _08022E0C
_08022E08:
	ldrb r0, [r7, 0xC]
	adds r0, 0x1
_08022E0C:
	strb r0, [r7, 0xC]
_08022E0E:
	movs r0, 0
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8022D14

	thumb_func_start sub_8022E1C
sub_8022E1C: @ 8022E1C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_802104C
	cmp r0, 0
	beq _08022E34
	ldrb r0, [r4, 0xE]
	adds r2, r4, 0
	adds r2, 0x36
	movs r1, 0
	bl sub_8022BEC
_08022E34:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8022E1C

	thumb_func_start sub_8022E3C
sub_8022E3C: @ 8022E3C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_802130C
	cmp r0, 0
	beq _08022E54
	ldrb r0, [r4, 0xE]
	adds r2, r4, 0
	adds r2, 0x36
	movs r1, 0
	bl sub_8022BEC
_08022E54:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8022E3C

	thumb_func_start sub_8022E5C
sub_8022E5C: @ 8022E5C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xC]
	cmp r0, 0
	beq _08022E6C
	cmp r0, 0x1
	beq _08022E72
	b _08022E9C
_08022E6C:
	bl sub_8010434
	b _08022E9C
_08022E72:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08022EA2
	ldr r0, =0x000001e5
	bl current_map_music_set
	movs r0, 0x7
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	movs r1, 0
	movs r0, 0x3
	strh r0, [r4, 0x12]
	strb r1, [r4, 0xC]
	b _08022EA2
	.pool
_08022E9C:
	ldrb r0, [r4, 0xC]
	adds r0, 0x1
	strb r0, [r4, 0xC]
_08022EA2:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8022E5C

	thumb_func_start sub_8022EAC
sub_8022EAC: @ 8022EAC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0xC]
	cmp r0, 0
	beq _08022EC2
	cmp r0, 0x1
	beq _08022EE8
	adds r0, 0x1
	b _08022EF8
_08022EC2:
	adds r0, r4, 0
	bl sub_8024578
	movs r0, 0x1
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x1
	movs r3, 0
	bl sub_8024644
	movs r0, 0x7
	strb r0, [r4, 0xE]
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	b _08022EFA
_08022EE8:
	movs r0, 0x8
	strb r0, [r4, 0xE]
	movs r0, 0x5
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	movs r0, 0x2
_08022EF8:
	strb r0, [r4, 0xC]
_08022EFA:
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8022EAC

	thumb_func_start sub_8022F04
sub_8022F04: @ 8022F04
	push {lr}
	movs r1, 0
	str r1, [r0, 0x4]
	ldr r0, =sub_8020E1C
	bl SetMainCallback2
	movs r0, 0
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8022F04

	thumb_func_start sub_8022F1C
sub_8022F1C: @ 8022F1C
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r2, r1, 0
	ldrb r0, [r5, 0xC]
	cmp r0, 0x5
	bls _08022F2C
	b _08023060
_08022F2C:
	lsls r0, 2
	ldr r1, =_08022F3C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08022F3C:
	.4byte _08022F54
	.4byte _08022F74
	.4byte _08022F7A
	.4byte _08022FAA
	.4byte _08022FBA
	.4byte _08023044
_08022F54:
	movs r0, 0x1
	str r0, [sp]
	adds r0, r2, 0
	movs r1, 0x1
	movs r2, 0
	movs r3, 0
	bl sub_8024644
	movs r0, 0x9
	strb r0, [r5, 0xE]
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	b _08023066
_08022F74:
	bl sub_8010434
	b _08023060
_08022F7A:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08023066
	adds r4, r5, 0
	adds r4, 0x42
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xC
	bl memset
	ldrb r0, [r5, 0x8]
	lsls r0, 5
	adds r0, r5, r0
	adds r0, 0xA4
	ldrh r0, [r0]
	strh r0, [r4]
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0x2
	bl link_0800A448
	b _08023060
_08022FAA:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08023066
	movs r0, 0
	strh r0, [r5, 0x10]
	b _08023060
_08022FBA:
	bl sub_800A550
	ldr r2, =gUnknown_082F4448
	ldrb r4, [r5, 0x9]
	subs r1, r4, 0x2
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _08023066
	movs r3, 0
	cmp r3, r4
	bcs _0802301E
	ldr r7, =gUnknown_020223C4
	movs r6, 0
	ldr r4, =gUnknown_0858AB24
_08022FDC:
	lsls r0, r3, 5
	adds r0, r5, r0
	lsls r1, r3, 8
	adds r1, r7
	ldrh r1, [r1]
	adds r2, r0, 0
	adds r2, 0xA4
	strh r1, [r2]
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0xB0
	bls _08022FF6
	strh r6, [r2]
_08022FF6:
	ldrh r1, [r2]
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r5, 0x18]
	ldrb r1, [r1]
	adds r0, r1
	strh r0, [r5, 0x18]
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x2]
	ldr r0, [r5, 0x1C]
	adds r0, r1
	str r0, [r5, 0x1C]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r5, 0x9]
	cmp r3, r0
	bcc _08022FDC
_0802301E:
	movs r0, 0
	strh r0, [r5, 0x10]
	bl sub_800A5B4
	movs r1, 0x18
	ldrsh r0, [r5, r1]
	lsls r0, 8
	movs r1, 0x80
	lsls r1, 6
	bl sub_81515FC
	str r0, [r5, 0x20]
	b _08023060
	.pool
_08023044:
	movs r0, 0
	movs r1, 0x1
	bl sub_8197434
	movs r0, 0xA
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	movs r1, 0
	movs r0, 0x4
	strh r0, [r5, 0x12]
	strb r1, [r5, 0xC]
	b _08023066
_08023060:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
_08023066:
	movs r0, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8022F1C

	thumb_func_start sub_8023070
sub_8023070: @ 8023070
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xC]
	cmp r0, 0x6
	bls _0802307C
	b _080231A8
_0802307C:
	lsls r0, 2
	ldr r1, =_0802308C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0802308C:
	.4byte _080230A8
	.4byte _080230BA
	.4byte _080230E8
	.4byte _08023120
	.4byte _08023150
	.4byte _08023172
	.4byte _08023184
_080230A8:
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r4, r0
	adds r0, r4, 0
	bl sub_80214A8
	bl sub_8010434
	b _080231A8
_080230BA:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _080231AE
	movs r2, 0x9C
	lsls r2, 1
	adds r1, r4, r2
	movs r0, 0
	strb r0, [r1]
	ldr r3, =0x00000139
	adds r1, r4, r3
	strb r0, [r1]
	adds r2, 0x2
	adds r1, r4, r2
	strb r0, [r1]
	adds r3, 0x2
	adds r1, r4, r3
	strb r0, [r1]
	b _080231A8
	.pool
_080230E8:
	movs r0, 0x9C
	lsls r0, 1
	adds r3, r4, r0
	ldrb r0, [r3]
	lsls r0, 2
	movs r2, 0xB8
	lsls r2, 1
	adds r1, r4, r2
	adds r0, r1, r0
	ldr r2, [r0]
	ldr r0, =sub_8021608
	str r0, [r2, 0x1C]
	ldrb r0, [r3]
	lsls r0, 2
	adds r1, r0
	ldr r1, [r1]
	adds r1, 0x2C
	ldrb r2, [r1]
	movs r0, 0x7F
	ands r0, r2
	strb r0, [r1]
	movs r0, 0x3D
	bl audio_play
	b _080231A8
	.pool
_08023120:
	movs r3, 0x9C
	lsls r3, 1
	adds r2, r4, r3
	ldrb r0, [r2]
	lsls r0, 2
	adds r3, 0x38
	adds r1, r4, r3
	adds r3, r1, r0
	ldr r0, [r3]
	ldr r1, [r0, 0x1C]
	ldr r0, =sub_8021608
	cmp r1, r0
	beq _080231AE
	movs r0, 0
	str r0, [r3]
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	bl sub_8010434
	b _080231A8
	.pool
_08023150:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _080231AE
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r4, r0
	ldrb r0, [r1]
	ldrb r2, [r4, 0x9]
	cmp r0, r2
	bcs _0802316C
	movs r0, 0x2
	b _080231AC
_0802316C:
	movs r0, 0
	strb r0, [r1]
	b _080231A8
_08023172:
	movs r3, 0x9C
	lsls r3, 1
	adds r1, r4, r3
	adds r0, r4, 0
	bl sub_80216A8
	bl sub_8010434
	b _080231A8
_08023184:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _080231AE
	movs r0, 0x2B
	bl audio_play
	movs r0, 0xB
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	movs r1, 0
	movs r0, 0x5
	strh r0, [r4, 0x12]
	strb r1, [r4, 0xC]
	b _080231AE
_080231A8:
	ldrb r0, [r4, 0xC]
	adds r0, 0x1
_080231AC:
	strb r0, [r4, 0xC]
_080231AE:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8023070

	thumb_func_start sub_80231B8
sub_80231B8: @ 80231B8
	push {r4-r7,lr}
	adds r4, r0, 0
	ldrb r1, [r4, 0xC]
	cmp r1, 0x1
	beq _0802321C
	cmp r1, 0x1
	bgt _080231CC
	cmp r1, 0
	beq _080231D6
	b _080232DC
_080231CC:
	cmp r1, 0x2
	beq _0802329C
	cmp r1, 0x3
	beq _080232BE
	b _080232DC
_080231D6:
	ldrh r0, [r4, 0x2A]
	adds r0, 0x4
	strh r0, [r4, 0x2A]
	lsls r0, 16
	cmp r0, 0
	bge _080231E4
	b _080232E2
_080231E4:
	strh r1, [r4, 0x2A]
	ldr r0, =0x00000139
	adds r3, r4, r0
	movs r0, 0x4
	strb r0, [r3]
	movs r2, 0x9C
	lsls r2, 1
	adds r1, r4, r2
	movs r0, 0
	strb r0, [r1]
	ldr r2, =gUnknown_082F326C
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	adds r0, r2
	ldrb r0, [r0]
	movs r2, 0x9D
	lsls r2, 1
	adds r1, r4, r2
	strb r0, [r1]
	movs r0, 0xD6
	bl audio_play
	b _080232DC
	.pool
_0802321C:
	ldr r7, =gUnknown_082F326C
	movs r0, 0x9C
	lsls r0, 1
	adds r6, r4, r0
	ldr r1, =0x00000139
	adds r5, r4, r1
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	ldrb r2, [r6]
	adds r0, r2
	adds r0, r7
	movs r1, 0
	ldrsb r1, [r0, r1]
	strh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x12
	bl SetGpuReg
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1A
	bl SetGpuReg
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1E
	bl SetGpuReg
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	movs r1, 0x9D
	lsls r1, 1
	adds r2, r4, r1
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r2]
	cmp r0, r1
	bcc _080232E2
	ldrb r0, [r5]
	cmp r0, 0
	beq _080232DC
	subs r0, 0x1
	strb r0, [r5]
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	adds r0, r7
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0
	strb r0, [r6]
	b _080232E2
	.pool
_0802329C:
	movs r0, 0
	strh r0, [r4, 0x2C]
	movs r0, 0x12
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1A
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1E
	movs r1, 0
	bl SetGpuReg
	bl sub_8010434
	b _080232DC
_080232BE:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _080232E2
	movs r0, 0xC
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	movs r1, 0
	movs r0, 0x6
	strh r0, [r4, 0x12]
	strb r1, [r4, 0xC]
	b _080232E2
_080232DC:
	ldrb r0, [r4, 0xC]
	adds r0, 0x1
	strb r0, [r4, 0xC]
_080232E2:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80231B8

	thumb_func_start sub_80232EC
sub_80232EC: @ 80232EC
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrb r0, [r4, 0xC]
	cmp r0, 0x1
	beq _0802330C
	cmp r0, 0x1
	bgt _08023302
	cmp r0, 0
	beq _08023332
	b _0802338C
_08023302:
	cmp r0, 0x2
	beq _0802332A
	cmp r0, 0x3
	beq _08023338
	b _0802338C
_0802330C:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08023392
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x78
	movs r3, 0x50
	bl sub_802EB24
	b _0802338C
_0802332A:
	bl sub_802EB84
	cmp r0, 0
	bne _08023392
_08023332:
	bl sub_8010434
	b _0802338C
_08023338:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08023392
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r4, r0
	movs r0, 0
	strb r0, [r1]
	ldr r2, =0x00000139
	adds r1, r4, r2
	strb r0, [r1]
	adds r2, 0x1
	adds r1, r4, r2
	strb r0, [r1]
	adds r2, 0x1
	adds r1, r4, r2
	strb r0, [r1]
	strh r0, [r4, 0x10]
	ldrb r0, [r4, 0x8]
	cmp r0, 0
	bne _08023378
	movs r0, 0xD
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	b _08023382
	.pool
_08023378:
	movs r0, 0xE
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
_08023382:
	movs r1, 0
	movs r0, 0x7
	strh r0, [r4, 0x12]
	strb r1, [r4, 0xC]
	b _08023392
_0802338C:
	ldrb r0, [r4, 0xC]
	adds r0, 0x1
	strb r0, [r4, 0xC]
_08023392:
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80232EC

	thumb_func_start sub_802339C
sub_802339C: @ 802339C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r0, 0
	movs r0, 0
	mov r8, r0
	movs r2, 0
	adds r7, r2, 0
	ldrb r1, [r4, 0x9]
	cmp r7, r1
	bcs _080234AA
	movs r2, 0x5E
	adds r2, r4
	mov r9, r2
	ldr r3, =gUnknown_082F325C
	mov r10, r3
_080233C0:
	lsls r0, r7, 4
	ldr r1, =gUnknown_03003090
	adds r2, r0, r1
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	movs r3, 0xBC
	lsls r3, 6
	cmp r0, r3
	bne _0802349E
	ldrh r0, [r2, 0x2]
	cmp r0, 0x2
	bne _0802349E
	ldrb r1, [r2, 0x4]
	movs r0, 0x4
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08023496
	mov r0, r9
	ldrb r2, [r0]
	lsrs r1, r2, 3
	mov r3, r10
	adds r0, r7, r3
	ldrb r0, [r0]
	orrs r1, r0
	lsls r1, 3
	movs r0, 0x7
	ands r0, r2
	orrs r0, r1
	mov r1, r9
	strb r0, [r1]
	lsls r2, r7, 5
	adds r3, r4, r2
	mov r12, r3
	mov r1, r12
	adds r1, 0xB5
	movs r0, 0x1
	strb r0, [r1]
	subs r1, 0x7
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	subs r1, 0x8
	ldrh r0, [r4, 0x28]
	ldrh r1, [r1]
	subs r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	mov r5, r12
	adds r5, 0xAA
	ldrh r1, [r5]
	subs r0, r1, 0x1
	adds r6, r2, 0
	cmp r3, r0
	blt _08023468
	adds r0, r1, 0x1
	cmp r3, r0
	bgt _08023468
	mov r1, r12
	adds r1, 0xA8
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	strh r3, [r5]
	mov r0, r12
	adds r0, 0xAC
	ldrh r1, [r1]
	ldrh r2, [r0]
	cmp r1, r2
	bls _08023476
	strh r1, [r0]
	b _08023476
	.pool
_08023468:
	adds r0, r4, r6
	adds r2, r0, 0
	adds r2, 0xA8
	movs r1, 0
	strh r1, [r2]
	adds r0, 0xAA
	strh r3, [r0]
_08023476:
	adds r1, r4, r6
	ldrh r0, [r4, 0x28]
	adds r3, r1, 0
	adds r3, 0xA6
	movs r2, 0
	strh r0, [r3]
	adds r1, 0xB4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bls _0802349E
	strb r2, [r1]
	b _0802349E
_08023496:
	lsls r0, r7, 5
	adds r0, r4, r0
	adds r0, 0xB5
	strb r1, [r0]
_0802349E:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r3, [r4, 0x9]
	cmp r7, r3
	bcc _080233C0
_080234AA:
	mov r0, r8
	cmp r0, 0x1
	bls _080234E0
	movs r7, 0
	ldrb r1, [r4, 0x9]
	cmp r7, r1
	bcs _080234E0
	movs r3, 0x2
_080234BA:
	lsls r0, r7, 5
	adds r1, r4, r0
	adds r2, r1, 0
	adds r2, 0xB5
	ldrb r0, [r2]
	cmp r0, 0
	beq _080234D4
	orrs r0, r3
	strb r0, [r2]
	adds r1, 0xB0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080234D4:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r2, [r4, 0x9]
	cmp r7, r2
	bcc _080234BA
_080234E0:
	mov r3, r8
	cmp r3, 0
	beq _08023548
	ldrh r0, [r4, 0x2E]
	add r0, r8
	strh r0, [r4, 0x2E]
	ldr r1, =gUnknown_082F3264
	mov r0, r8
	subs r0, 0x1
	adds r0, r1
	ldrb r0, [r0]
	add r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrh r0, [r4, 0x34]
	add r0, r8
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x1A]
	add r0, r8
	strh r0, [r4, 0x1A]
	movs r1, 0x18
	ldrsh r0, [r4, r1]
	movs r3, 0x1A
	ldrsh r2, [r4, r3]
	subs r0, r2
	cmp r0, 0
	ble _08023534
	lsls r2, 8
	ldr r1, [r4, 0x20]
	adds r0, r2, 0
	bl sub_81515FC
	adds r2, r0, 0
	asrs r2, 8
	adds r0, r4, 0
	adds r0, 0x24
	strb r2, [r0]
	b _08023548
	.pool
_08023534:
	adds r1, r4, 0
	adds r1, 0x24
	movs r0, 0x20
	strb r0, [r1]
	adds r2, r4, 0
	adds r2, 0x5E
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_08023548:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_802339C

	thumb_func_start sub_8023558
sub_8023558: @ 8023558
	push {r4-r6,lr}
	adds r3, r0, 0
	movs r6, 0
	movs r1, 0
	adds r4, r1, 0
	ldrb r0, [r3, 0x9]
	cmp r4, r0
	bcs _080235B0
	adds r5, r3, 0
	adds r5, 0x64
_0802356C:
	lsls r0, r4, 5
	adds r1, r3, r0
	adds r0, r1, 0
	adds r0, 0xB5
	ldrb r2, [r0]
	cmp r2, 0
	beq _080235A4
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r1, 0
	adds r0, 0xB4
	ldrb r0, [r0]
	adds r1, r0, 0x1
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _08023594
	movs r0, 0x4
	orrs r1, r0
_08023594:
	lsls r0, r4, 1
	adds r0, r4
	lsls r1, r0
	lsls r0, r1, 16
	lsrs r1, r0, 16
	ldrh r0, [r5]
	orrs r1, r0
	strh r1, [r5]
_080235A4:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r1, [r3, 0x9]
	cmp r4, r1
	bcc _0802356C
_080235B0:
	adds r0, r3, 0
	adds r0, 0x24
	ldrb r1, [r0]
	adds r0, 0x3C
	strh r1, [r0]
	cmp r6, 0
	bne _080235D4
	ldr r2, =0x0000013b
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080236A0
	movs r4, 0x9C
	lsls r4, 1
	adds r1, r3, r4
	b _08023612
	.pool
_080235D4:
	ldr r5, =0x0000013b
	adds r2, r3, r5
	ldrb r0, [r2]
	cmp r0, 0
	beq _0802361A
	ldr r0, =0x00000139
	adds r1, r3, r0
	ldrb r2, [r1]
	cmp r6, r2
	beq _0802360C
	subs r0, r6, 0x1
	strb r0, [r1]
	ldr r1, =gUnknown_082F3290
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0x9D
	lsls r4, 1
	adds r1, r3, r4
	strb r0, [r1]
	b _08023640
	.pool
_0802360C:
	movs r5, 0x9C
	lsls r5, 1
	adds r1, r3, r5
_08023612:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08023640
_0802361A:
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r3, r0
	movs r0, 0
	strb r0, [r1]
	subs r0, r6, 0x1
	ldr r4, =0x00000139
	adds r1, r3, r4
	strb r0, [r1]
	ldr r1, =gUnknown_082F3290
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r5, 0x9D
	lsls r5, 1
	adds r1, r3, r5
	strb r0, [r1]
	movs r0, 0x1
	strb r0, [r2]
_08023640:
	ldr r0, =0x0000013b
	adds r4, r3, r0
	ldrb r0, [r4]
	cmp r0, 0
	beq _080236A0
	movs r2, 0x9C
	lsls r2, 1
	adds r1, r3, r2
	movs r5, 0x9D
	lsls r5, 1
	adds r2, r3, r5
	ldrb r0, [r1]
	ldrb r5, [r2]
	cmp r0, r5
	bcc _0802367C
	movs r0, 0
	strb r0, [r1]
	ldr r5, =0x00000139
	adds r1, r3, r5
	strb r0, [r1]
	strb r0, [r2]
	strb r0, [r4]
	movs r1, 0
	b _08023690
	.pool
_0802367C:
	ldr r2, =gUnknown_082F3290
	ldrb r1, [r1]
	ldr r4, =0x00000139
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, 0x1
	adds r1, r0
	adds r1, r2
	ldrb r1, [r1]
_08023690:
	adds r0, r3, 0
	adds r0, 0x5F
	strb r1, [r0]
	b _080236A8
	.pool
_080236A0:
	adds r1, r3, 0
	adds r1, 0x5F
	movs r0, 0
	strb r0, [r1]
_080236A8:
	ldrh r1, [r3, 0x26]
	adds r0, r3, 0
	adds r0, 0x62
	strh r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8023558

	thumb_func_start sub_80236B8
sub_80236B8: @ 80236B8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	ldr r3, =gMain
	ldrh r1, [r3, 0x2E]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _080236DA
	adds r2, r5, 0
	adds r2, 0x5E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080236DA:
	ldrh r1, [r3, 0x2C]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _080236FA
	ldrb r0, [r5, 0x8]
	lsls r0, 5
	adds r0, r5, r0
	adds r1, r0, 0
	adds r1, 0xB2
	ldrh r0, [r1]
	ldrh r2, [r5, 0x28]
	cmp r0, r2
	bcs _080236FA
	adds r0, 0x1
	strh r0, [r1]
_080236FA:
	ldrb r0, [r5, 0x8]
	adds r7, r5, 0
	adds r7, 0x5E
	cmp r0, 0
	beq _08023710
	ldrb r1, [r7]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _08023710
	b _0802384C
_08023710:
	adds r4, r5, 0
	adds r4, 0x5C
	movs r0, 0x2
	strh r0, [r4]
	ldrh r0, [r5, 0x28]
	movs r1, 0x1E
	bl __umodsi3
	lsls r0, 16
	mov r8, r4
	adds r6, r5, 0
	adds r6, 0x25
	cmp r0, 0
	bne _08023768
	movs r0, 0x2E
	ldrsh r2, [r5, r0]
	ldr r1, =gUnknown_082F4444
	ldrb r0, [r5, 0x9]
	subs r0, 0x2
	adds r0, r1
	ldrb r0, [r0]
	cmp r2, r0
	ble _08023754
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	ldrb r0, [r6]
	movs r1, 0x10
	orrs r0, r1
	b _0802375C
	.pool
_08023754:
	ldrb r1, [r6]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
_0802375C:
	strb r0, [r6]
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
_08023768:
	ldrh r0, [r5, 0x28]
	movs r1, 0xF
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _080237DE
	movs r0, 0x34
	ldrsh r2, [r5, r0]
	ldr r3, =gUnknown_082F4434
	ldrb r0, [r5, 0x9]
	subs r0, 0x2
	lsls r1, r0, 2
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r2, r0
	bge _08023798
	ldrb r1, [r6]
	movs r0, 0x1F
	ands r0, r1
	strb r0, [r6]
	b _080237D8
	.pool
_08023798:
	adds r0, r3, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r2, r0
	bge _080237AC
	ldrb r0, [r6]
	movs r1, 0x1F
	ands r1, r0
	movs r0, 0x20
	b _080237D4
_080237AC:
	adds r0, r3, 0x2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r2, r0
	bge _080237BC
	movs r0, 0x2
	strh r0, [r5, 0x34]
	b _080237D8
_080237BC:
	adds r0, r3, 0x3
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r2, r0
	bge _080237CC
	movs r0, 0x3
	strh r0, [r5, 0x34]
	b _080237D8
_080237CC:
	ldrb r0, [r6]
	movs r1, 0x1F
	ands r1, r0
	movs r0, 0x80
_080237D4:
	orrs r1, r0
	strb r1, [r6]
_080237D8:
	movs r0, 0
	strh r0, [r5, 0x34]
	b _0802380A
_080237DE:
	ldrh r0, [r5, 0x10]
	adds r0, 0x1
	strh r0, [r5, 0x10]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3C
	bls _0802380A
	cmp r0, 0x46
	bls _080237FA
	bl sub_8011AC8
	movs r0, 0
	strh r0, [r5, 0x10]
	b _0802380A
_080237FA:
	ldrb r0, [r7]
	movs r4, 0xF8
	ands r4, r0
	cmp r4, 0
	bne _0802380A
	bl sub_8011AC8
	strh r4, [r5, 0x10]
_0802380A:
	ldrh r1, [r5, 0x28]
	ldr r0, =0x00008c9f
	cmp r1, r0
	bls _0802381A
	ldrb r0, [r7]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r7]
_0802381A:
	ldrb r1, [r6]
	lsls r1, 27
	lsrs r1, 31
	lsls r1, 1
	ldrb r2, [r7]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7]
	ldrb r0, [r6]
	lsrs r0, 5
	adds r2, r5, 0
	adds r2, 0x66
	strh r0, [r2]
	adds r4, r5, 0
	adds r4, 0x42
	adds r0, r4, 0
	mov r1, r8
	movs r2, 0xC
	bl memcpy
	adds r0, r4, 0
	bl sub_800FE50
_0802384C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80236B8

	thumb_func_start sub_802385C
sub_802385C: @ 802385C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
	ldr r3, =gUnknown_03003090
	ldrb r0, [r5, 0x9]
	cmp r4, r0
	bcs _08023880
	movs r1, 0
_0802386C:
	lsls r0, r4, 5
	adds r0, r5, r0
	adds r0, 0xB5
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5, 0x9]
	cmp r4, r0
	bcc _0802386C
_08023880:
	adds r2, r3, 0
	ldrh r0, [r2]
	movs r1, 0xFF
	lsls r1, 8
	ands r1, r0
	movs r0, 0xBC
	lsls r0, 6
	cmp r1, r0
	bne _08023898
	ldrh r0, [r2, 0x2]
	cmp r0, 0x2
	beq _080238AC
_08023898:
	adds r2, r5, 0
	adds r2, 0x25
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	b _080238EA
	.pool
_080238AC:
	adds r4, r5, 0
	adds r4, 0x4E
	adds r0, r4, 0
	adds r1, r3, 0
	movs r2, 0xE
	bl memcpy
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x2A]
	movs r0, 0x5
	ldrsb r0, [r4, r0]
	strh r0, [r5, 0x2C]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x28]
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r5, r0
	adds r0, r5, 0
	bl sub_80216E0
	ldrb r1, [r4, 0x4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080238EA
	adds r0, r5, 0
	adds r0, 0x25
	ldrb r1, [r0]
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0]
_080238EA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_802385C

	thumb_func_start sub_80238F0
sub_80238F0: @ 80238F0
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x5C
	movs r1, 0
	movs r2, 0xC
	bl memset
	adds r0, r4, 0
	adds r0, 0x4E
	movs r1, 0
	movs r2, 0xE
	bl memset
	adds r0, r4, 0
	bl sub_802385C
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x12
	bl SetGpuReg
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1A
	bl SetGpuReg
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1E
	bl SetGpuReg
	adds r0, r4, 0
	adds r0, 0x25
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08023978
	ldrh r1, [r4, 0x28]
	ldr r0, =0x00008c9f
	cmp r1, r0
	bls _08023964
	adds r0, 0x1
	strh r0, [r4, 0x28]
	movs r0, 0x10
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	b _0802396E
	.pool
_08023964:
	movs r0, 0xF
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
_0802396E:
	movs r1, 0
	movs r0, 0
	strh r0, [r4, 0x10]
	strb r1, [r4, 0xC]
	b _08023992
_08023978:
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	bl sub_802339C
	adds r0, r4, 0
	bl sub_8023558
	adds r0, r4, 0
	bl sub_80236B8
	movs r0, 0
_08023992:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80238F0

	thumb_func_start sub_8023998
sub_8023998: @ 8023998
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x5C
	movs r1, 0
	movs r2, 0xC
	bl memset
	adds r0, r4, 0
	adds r0, 0x4E
	movs r1, 0
	movs r2, 0xE
	bl memset
	adds r0, r4, 0
	bl sub_802385C
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x12
	bl SetGpuReg
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1A
	bl SetGpuReg
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1E
	bl SetGpuReg
	adds r0, r4, 0
	adds r0, 0x25
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08023A20
	ldrh r1, [r4, 0x28]
	ldr r0, =0x00008c9f
	cmp r1, r0
	bls _08023A0C
	adds r0, 0x1
	strh r0, [r4, 0x28]
	movs r0, 0x10
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	b _08023A16
	.pool
_08023A0C:
	movs r0, 0xF
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
_08023A16:
	movs r1, 0
	movs r0, 0
	strh r0, [r4, 0x10]
	strb r1, [r4, 0xC]
	b _08023A28
_08023A20:
	adds r0, r4, 0
	bl sub_80236B8
	movs r0, 0
_08023A28:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8023998

	thumb_func_start sub_8023A30
sub_8023A30: @ 8023A30
	push {r4-r7,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xC]
	cmp r0, 0x5
	bls _08023A3C
	b _08023BB2
_08023A3C:
	lsls r0, 2
	ldr r1, =_08023A4C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08023A4C:
	.4byte _08023A64
	.4byte _08023A8C
	.4byte _08023ADC
	.4byte _08023B5C
	.4byte _08023B7A
	.4byte _08023B94
_08023A64:
	movs r0, 0x8
	strh r0, [r4, 0x12]
	movs r0, 0xD6
	bl audio_play
	movs r0, 0x1
	negs r0, r0
	ldr r2, =0x000003ff
	movs r1, 0x8
	bl BlendPalettes
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r4, r0
	movs r0, 0x2
	strb r0, [r1]
	b _08023BB2
	.pool
_08023A8C:
	movs r1, 0x9C
	lsls r1, 1
	adds r5, r4, r1
	ldrb r0, [r5]
	subs r0, 0x1
	strb r0, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08023AA2
	b _08023BB8
_08023AA2:
	movs r0, 0x1
	negs r0, r0
	ldr r2, =0x000003ff
	movs r1, 0
	bl BlendPalettes
	ldr r2, =0x00000139
	adds r1, r4, r2
	movs r0, 0x4
	strb r0, [r1]
	movs r0, 0
	strb r0, [r5]
	ldr r2, =gUnknown_082F326C
	ldrb r1, [r1]
	lsls r0, r1, 3
	subs r0, r1
	adds r0, r2
	ldrb r0, [r0]
	movs r2, 0x9D
	lsls r2, 1
	adds r1, r4, r2
	strb r0, [r1]
	b _08023BB2
	.pool
_08023ADC:
	ldr r7, =gUnknown_082F326C
	movs r0, 0x9C
	lsls r0, 1
	adds r6, r4, r0
	ldr r1, =0x00000139
	adds r5, r4, r1
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	ldrb r2, [r6]
	adds r0, r2
	adds r0, r7
	movs r1, 0
	ldrsb r1, [r0, r1]
	strh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x12
	bl SetGpuReg
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1A
	bl SetGpuReg
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1E
	bl SetGpuReg
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	movs r1, 0x9D
	lsls r1, 1
	adds r2, r4, r1
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r2]
	cmp r0, r1
	bcc _08023BB8
	ldrb r0, [r5]
	cmp r0, 0
	beq _08023BB2
	subs r0, 0x1
	strb r0, [r5]
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	adds r0, r7
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0
	strb r0, [r6]
	b _08023BB8
	.pool
_08023B5C:
	movs r0, 0
	strh r0, [r4, 0x2C]
	movs r0, 0x12
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1A
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1E
	movs r1, 0
	bl SetGpuReg
	b _08023BB2
_08023B7A:
	movs r2, 0x9C
	lsls r2, 1
	adds r1, r4, r2
	adds r0, r4, 0
	bl sub_80218D4
	cmp r0, 0
	beq _08023BB8
	bl sub_8010434
	movs r0, 0
	strh r0, [r4, 0x10]
	b _08023BB2
_08023B94:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08023BB8
	movs r0, 0x11
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	movs r1, 0
	movs r0, 0
	strh r0, [r4, 0x10]
	strb r1, [r4, 0xC]
	b _08023BBA
_08023BB2:
	ldrb r0, [r4, 0xC]
	adds r0, 0x1
	strb r0, [r4, 0xC]
_08023BB8:
	movs r0, 0
_08023BBA:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8023A30

	thumb_func_start sub_8023BC0
sub_8023BC0: @ 8023BC0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	ldrb r0, [r5, 0xC]
	cmp r0, 0x1
	beq _08023C04
	cmp r0, 0x1
	bgt _08023BD8
	cmp r0, 0
	beq _08023BE2
	b _08023C9C
_08023BD8:
	cmp r0, 0x2
	beq _08023C2A
	cmp r0, 0x3
	beq _08023C5C
	b _08023C9C
_08023BE2:
	movs r0, 0x9
	strh r0, [r5, 0x12]
	movs r0, 0x20
	bl audio_play
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x8
	movs r2, 0x1F
	bl BlendPalettes
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r5, r0
	movs r0, 0x4
	strb r0, [r1]
	b _08023C9C
_08023C04:
	movs r0, 0x9C
	lsls r0, 1
	adds r4, r5, r0
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _08023CA2
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	movs r2, 0x1F
	bl BlendPalettes
	movs r0, 0
	strb r0, [r4]
	b _08023C9C
_08023C2A:
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r5, r0
	adds r0, r5, 0
	bl sub_80218D4
	cmp r0, 0
	beq _08023CA2
	bl sub_8010434
	movs r0, 0
	strh r0, [r5, 0x10]
	movs r0, 0x12
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1A
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1E
	movs r1, 0
	bl SetGpuReg
	b _08023C9C
_08023C5C:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08023CA2
	ldr r0, =gStringVar1
	ldr r1, [r5, 0x1C]
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	movs r4, 0
	str r4, [sp]
	adds r0, r6, 0
	movs r1, 0x7
	movs r2, 0x1
	movs r3, 0
	bl sub_8024644
	movs r0, 0x13
	strb r0, [r5, 0xE]
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	movs r0, 0
	strh r4, [r5, 0x10]
	b _08023CA0
	.pool
_08023C9C:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
_08023CA0:
	strb r0, [r5, 0xC]
_08023CA2:
	movs r0, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8023BC0

	thumb_func_start sub_8023CAC
sub_8023CAC: @ 8023CAC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r7, r0, 0
	ldrb r0, [r7, 0xC]
	cmp r0, 0x7
	bls _08023CC2
	b _0802402E
_08023CC2:
	lsls r0, 2
	ldr r1, =_08023CD0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08023CD0:
	.4byte _08023CF0
	.4byte _08023D2A
	.4byte _08023D38
	.4byte _08023DA0
	.4byte _08023F20
	.4byte _08023FD0
	.4byte _08023FDC
	.4byte _08024010
_08023CF0:
	adds r4, r7, 0
	adds r4, 0x42
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x4
	bl memset
	ldrb r0, [r7, 0x8]
	lsls r0, 5
	adds r0, r7, r0
	adds r2, r0, 0
	adds r2, 0xB2
	ldrh r1, [r7, 0x28]
	ldrh r0, [r2]
	cmp r0, r1
	bls _08023D12
	strh r1, [r2]
_08023D12:
	ldrb r0, [r7, 0x8]
	lsls r0, 5
	adds r0, r7, r0
	adds r0, 0xB2
	ldrh r0, [r0]
	strh r0, [r4]
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0x2
	bl link_0800A448
	b _0802402E
_08023D2A:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	bne _08023D36
	b _08024034
_08023D36:
	b _08024004
_08023D38:
	bl sub_800A550
	ldr r2, =gUnknown_082F4448
	ldrb r3, [r7, 0x9]
	subs r1, r3, 0x2
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	beq _08023D50
	b _08024034
_08023D50:
	movs r0, 0
	mov r8, r0
	adds r4, r7, 0
	adds r4, 0x42
	cmp r8, r3
	bcs _08023D7E
	ldr r2, =gUnknown_020223C4
_08023D5E:
	mov r3, r8
	lsls r1, r3, 5
	adds r1, r7, r1
	lsls r0, r3, 8
	adds r0, r2
	ldrh r0, [r0]
	adds r1, 0xB2
	strh r0, [r1]
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r6, [r7, 0x9]
	cmp r8, r6
	bcc _08023D5E
_08023D7E:
	movs r0, 0
	strh r0, [r7, 0x10]
	strh r0, [r4]
	bl sub_800A5B4
	ldrb r0, [r7, 0x8]
	cmp r0, 0
	bne _08023D9C
	movs r0, 0x3
	b _08024032
	.pool
_08023D9C:
	movs r0, 0x6
	b _08024032
_08023DA0:
	adds r0, r7, 0
	adds r0, 0x68
	movs r1, 0
	movs r2, 0x30
	bl memset
	ldrh r1, [r7, 0x28]
	adds r0, r7, 0
	adds r0, 0x6C
	strh r1, [r0]
	movs r0, 0x18
	ldrsh r4, [r7, r0]
	ldrh r0, [r7, 0x28]
	movs r1, 0x3C
	bl __udivsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl __divsi3
	adds r1, r7, 0
	adds r1, 0x6E
	strh r0, [r1]
	movs r1, 0x30
	ldrsh r0, [r7, r1]
	lsls r0, 8
	movs r4, 0xC8
	lsls r4, 6
	adds r1, r4, 0
	bl sub_8151574
	adds r2, r0, 0
	movs r3, 0x32
	ldrsh r1, [r7, r3]
	lsls r1, 8
	bl sub_81515FC
	adds r2, r0, r4
	asrs r2, 8
	movs r1, 0x7F
	adds r0, r2, 0
	ands r0, r1
	adds r1, r7, 0
	adds r1, 0x70
	strh r0, [r1]
	lsls r2, 8
	movs r1, 0xC8
	lsls r1, 7
	adds r0, r2, 0
	bl sub_81515FC
	adds r2, r0, 0
	ldrb r1, [r7, 0x9]
	ldr r0, [r7, 0x1C]
	muls r0, r1
	lsls r4, r0, 8
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_8151574
	adds r4, r0, 0
	asrs r0, r4, 8
	str r0, [r7, 0x68]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r1, r7, 0
	adds r1, 0x8F
	strb r0, [r1]
	movs r6, 0
	mov r8, r6
	mov r9, r1
	ldrb r0, [r7, 0x9]
	cmp r8, r0
	bcc _08023E44
	b _0802402E
_08023E44:
	adds r0, r7, 0
	adds r0, 0x88
	add r0, r8
	mov r1, r8
	strb r1, [r0]
	adds r0, r7, 0
	adds r0, 0x90
	add r0, r8
	strb r1, [r0]
	mov r3, r8
	lsls r2, r3, 1
	adds r1, r7, 0
	adds r1, 0x74
	adds r1, r2
	lsls r0, r3, 5
	adds r3, r7, r0
	adds r5, r3, 0
	adds r5, 0xAE
	ldrh r0, [r5]
	strh r0, [r1]
	adds r1, r7, 0
	adds r1, 0x72
	ldrh r6, [r1]
	adds r0, r6
	strh r0, [r1]
	mov r1, r9
	ldrb r0, [r1]
	adds r6, r2, 0
	cmp r0, 0x1
	beq _08023EAE
	cmp r0, 0x1
	bgt _08023E8A
	cmp r0, 0
	beq _08023E90
	b _08023F04
_08023E8A:
	cmp r0, 0x2
	beq _08023ECC
	b _08023F04
_08023E90:
	ldrh r0, [r5]
	cmp r0, 0
	beq _08023ED2
	adds r0, r3, 0
	adds r0, 0xAC
	ldrh r2, [r0]
	lsls r2, 8
	adds r0, r2, 0
	movs r1, 0xC8
	lsls r1, 7
	bl sub_8151574
	adds r2, r0, 0
	ldrh r4, [r5]
	b _08023EFA
_08023EAE:
	ldrh r0, [r5]
	cmp r0, 0
	beq _08023ED2
	adds r0, r3, 0
	adds r0, 0xB0
	ldrh r2, [r0]
	lsls r2, 8
	adds r0, r2, 0
	movs r1, 0xC8
	lsls r1, 7
	bl sub_8151574
	adds r2, r0, 0
	ldrh r4, [r5]
	b _08023EFA
_08023ECC:
	ldrh r0, [r5]
	cmp r0, 0
	bne _08023ED6
_08023ED2:
	movs r4, 0
	b _08023F04
_08023ED6:
	adds r1, r3, 0
	adds r1, 0xB2
	ldrh r0, [r1]
	ldrh r2, [r7, 0x28]
	cmp r0, r2
	bcc _08023EE8
	movs r4, 0xC8
	lsls r4, 7
	b _08023F04
_08023EE8:
	ldrh r2, [r1]
	lsls r2, 8
	adds r0, r2, 0
	movs r1, 0xC8
	lsls r1, 7
	bl sub_8151574
	adds r2, r0, 0
	ldrh r4, [r7, 0x28]
_08023EFA:
	lsls r4, 8
	adds r1, r4, 0
	bl sub_81515FC
	adds r4, r0, 0
_08023F04:
	asrs r4, 4
	adds r0, r7, 0
	adds r0, 0x7E
	adds r0, r6
	strh r4, [r0]
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r3, [r7, 0x9]
	cmp r8, r3
	bcc _08023E44
	b _0802402E
_08023F20:
	movs r6, 0
	mov r8, r6
	ldrb r0, [r7, 0x9]
	subs r0, 0x1
	adds r1, r7, 0
	adds r1, 0x68
	str r1, [sp, 0xC]
	cmp r8, r0
	bge _08023FC4
_08023F32:
	ldrb r0, [r7, 0x9]
	subs r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	mov r2, r8
	adds r2, 0x1
	str r2, [sp, 0x8]
	cmp r4, r8
	bls _08023FB4
	adds r3, r7, 0
	adds r3, 0x74
	str r3, [sp]
	adds r6, r7, 0
	adds r6, 0x88
	str r6, [sp, 0x4]
	movs r0, 0x90
	adds r0, r7
	mov r10, r0
	movs r1, 0x7E
	adds r1, r7
	mov r9, r1
_08023F5C:
	subs r2, r4, 0x1
	mov r12, r2
	lsls r6, r2, 1
	ldr r0, [sp]
	adds r3, r0, r6
	lsls r5, r4, 1
	adds r1, r0, r5
	ldrh r2, [r3]
	ldrh r0, [r1]
	cmp r2, r0
	bcs _08023F86
	ldrh r0, [r1]
	strh r2, [r1]
	strh r0, [r3]
	ldr r1, [sp, 0x4]
	adds r2, r1, r4
	ldrb r3, [r2]
	add r1, r12
	ldrb r0, [r1]
	strb r0, [r2]
	strb r3, [r1]
_08023F86:
	mov r2, r9
	adds r3, r2, r6
	adds r1, r2, r5
	ldrh r2, [r3]
	ldrh r6, [r1]
	cmp r2, r6
	bcs _08023FAA
	ldrh r0, [r1]
	strh r2, [r1]
	strh r0, [r3]
	mov r0, r10
	adds r2, r0, r4
	ldrb r3, [r2]
	mov r1, r10
	add r1, r12
	ldrb r0, [r1]
	strb r0, [r2]
	strb r3, [r1]
_08023FAA:
	mov r1, r12
	lsls r0, r1, 24
	lsrs r4, r0, 24
	cmp r4, r8
	bhi _08023F5C
_08023FB4:
	ldr r2, [sp, 0x8]
	lsls r0, r2, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r0, [r7, 0x9]
	subs r0, 0x1
	cmp r8, r0
	blt _08023F32
_08023FC4:
	movs r0, 0
	ldr r1, [sp, 0xC]
	movs r2, 0x30
	bl link_0800A448
	b _0802402E
_08023FD0:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08024034
	b _08024004
_08023FDC:
	bl sub_800A550
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08024034
	adds r4, r7, 0
	adds r4, 0x68
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x30
	bl memset
	ldr r1, =gUnknown_020223C4
	adds r0, r4, 0
	movs r2, 0x30
	bl memcpy
	bl sub_800A5B4
_08024004:
	movs r0, 0
	strh r0, [r7, 0x10]
	b _0802402E
	.pool
_08024010:
	bl sub_8020E58
	movs r0, 0x12
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	movs r0, 0
	movs r1, 0xB
	strh r1, [r7, 0x12]
	strb r0, [r7, 0xC]
	adds r1, r7, 0
	adds r1, 0x24
	strb r0, [r1]
	b _08024034
_0802402E:
	ldrb r0, [r7, 0xC]
	adds r0, 0x1
_08024032:
	strb r0, [r7, 0xC]
_08024034:
	movs r0, 0
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8023CAC

	thumb_func_start sub_8024048
sub_8024048: @ 8024048
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	ldrb r0, [r5, 0xC]
	cmp r0, 0x4
	bhi _08024124
	lsls r0, 2
	ldr r1, =_08024064
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08024064:
	.4byte _08024078
	.4byte _0802408A
	.4byte _0802409C
	.4byte _080240CC
	.4byte _080240DC
_08024078:
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r5, r0
	adds r0, r5, 0
	bl sub_8022070
	cmp r0, 0
	bne _08024124
	b _0802412A
_0802408A:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r5, r0
	movs r0, 0x1E
	strb r0, [r1]
	b _08024124
_0802409C:
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080240AE
	subs r0, 0x1
	strb r0, [r1]
	b _0802412A
_080240AE:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0802412A
	movs r0, 0x5
	bl audio_play
	adds r0, r5, 0
	bl sub_802222C
	b _08024124
	.pool
_080240CC:
	ldrh r0, [r5, 0x12]
	cmp r0, 0xC
	bhi _08024124
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0x12]
	strb r1, [r5, 0xC]
	b _0802412A
_080240DC:
	ldr r0, =gStringVar1
	ldr r1, [r5, 0x1C]
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	ldr r4, =gStringVar2
	bl sub_80247BC
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	movs r4, 0
	str r4, [sp]
	adds r0, r6, 0
	movs r1, 0x2
	movs r2, 0x3
	movs r3, 0
	bl sub_8024644
	movs r0, 0x13
	strb r0, [r5, 0xE]
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	strb r4, [r5, 0xC]
	b _0802412A
	.pool
_08024124:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
_0802412A:
	movs r0, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8024048

	thumb_func_start sub_8024134
sub_8024134: @ 8024134
	push {r4,r5,lr}
	sub sp, 0x10
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r0, [r5, 0xC]
	cmp r0, 0x4
	bhi _08024218
	lsls r0, 2
	ldr r1, =_08024150
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08024150:
	.4byte _08024164
	.4byte _080241A0
	.4byte _080241A6
	.4byte _080241F0
	.4byte _08024204
_08024164:
	ldrh r1, [r5, 0x28]
	ldr r0, =0x00008c9f
	cmp r1, r0
	bls _08024176
	movs r1, 0x9C
	lsls r1, 1
	adds r0, r5, r1
	bl sub_8022554
_08024176:
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x8
	movs r2, 0
	movs r3, 0
	bl sub_8024644
	movs r4, 0
	movs r0, 0x13
	strb r0, [r5, 0xE]
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	strb r4, [r5, 0xC]
	b _0802421E
	.pool
_080241A0:
	bl sub_8010434
	b _08024218
_080241A6:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _0802421E
	movs r0, 0
	movs r1, 0
	bl sub_81973C4
	ldr r2, =gUnknown_082C8959
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x1
	movs r3, 0
	bl AddTextPrinterParametrized
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r0, =sub_8153688
	movs r1, 0
	bl CreateTask
	b _08024218
	.pool
_080241F0:
	ldr r0, =sub_8153688
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _08024218
	b _0802421E
	.pool
_08024204:
	movs r0, 0x14
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	movs r1, 0
	movs r0, 0xF
	strh r0, [r5, 0x12]
	strb r1, [r5, 0xC]
	b _0802421E
_08024218:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
_0802421E:
	movs r0, 0
	add sp, 0x10
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8024134

	thumb_func_start sub_8024228
sub_8024228: @ 8024228
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	ldrb r0, [r5, 0xC]
	cmp r0, 0x1
	beq _0802426A
	cmp r0, 0x1
	bgt _08024240
	cmp r0, 0
	beq _08024246
	b _080242D0
_08024240:
	cmp r0, 0x2
	beq _08024270
	b _080242D0
_08024246:
	movs r0, 0x1
	str r0, [sp]
	adds r0, r6, 0
	movs r1, 0x4
	movs r2, 0
	movs r3, 0
	bl sub_8024644
	movs r0, 0x14
	strb r0, [r5, 0xE]
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	movs r0, 0
	strb r0, [r5, 0xC]
	b _080242D8
_0802426A:
	bl sub_8197930
	b _080242D0
_08024270:
	bl sub_8198C58
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _080242D6
	adds r0, r5, 0
	adds r0, 0x42
	movs r1, 0
	movs r2, 0xC
	bl memset
	cmp r4, 0
	bne _080242A2
	bl sub_80D67C4
	lsls r0, 24
	cmp r0, 0
	beq _0802429E
	strh r4, [r5, 0x14]
	b _080242A6
_0802429E:
	movs r0, 0x3
	b _080242A4
_080242A2:
	movs r0, 0x1
_080242A4:
	strh r0, [r5, 0x14]
_080242A6:
	movs r0, 0
	movs r1, 0x1
	bl sub_8197434
	movs r4, 0
	str r4, [sp]
	adds r0, r6, 0
	movs r1, 0x8
	movs r2, 0
	movs r3, 0
	bl sub_8024644
	movs r0, 0x15
	strb r0, [r5, 0xE]
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	strb r4, [r5, 0xC]
	b _080242D6
_080242D0:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
_080242D6:
	movs r0, 0
_080242D8:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8024228

	thumb_func_start sub_80242E0
sub_80242E0: @ 80242E0
	push {r4-r7,lr}
	adds r4, r0, 0
	movs r5, 0
	ldrb r0, [r4, 0xC]
	cmp r0, 0x1
	beq _08024306
	cmp r0, 0x1
	bgt _080242F6
	cmp r0, 0
	beq _08024300
	b _080243AC
_080242F6:
	cmp r0, 0x2
	beq _08024328
	cmp r0, 0x3
	beq _08024336
	b _080243AC
_08024300:
	bl sub_8010434
	b _080243AC
_08024306:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _080243B2
	ldrh r0, [r4, 0x14]
	adds r1, r4, 0
	adds r1, 0x42
	strh r0, [r1]
	adds r0, r4, 0
	adds r0, 0x4E
	strh r5, [r0]
	movs r0, 0
	movs r2, 0x2
	bl link_0800A448
	b _080243AC
_08024328:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _080243B2
	strh r5, [r4, 0x10]
	b _080243AC
_08024336:
	bl sub_800A550
	ldr r2, =gUnknown_082F4448
	ldrb r3, [r4, 0x9]
	subs r1, r3, 0x2
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _080243B2
	adds r7, r4, 0
	adds r7, 0x42
	adds r6, r4, 0
	adds r6, 0x4E
	cmp r5, r3
	bcs _08024374
	adds r1, r6, 0
	ldr r2, =gUnknown_020223C4
_0802435C:
	lsls r0, r5, 8
	adds r0, r2
	ldrh r0, [r0]
	ldrh r3, [r1]
	adds r0, r3
	strh r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r4, 0x9]
	cmp r5, r0
	bcc _0802435C
_08024374:
	ldrh r0, [r6]
	cmp r0, 0
	beq _08024390
	movs r0, 0x17
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	b _0802439A
	.pool
_08024390:
	movs r0, 0x16
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
_0802439A:
	bl sub_800A5B4
	movs r1, 0
	movs r0, 0
	strh r0, [r7]
	strh r0, [r6]
	strh r0, [r4, 0x10]
	strb r1, [r4, 0xC]
	b _080243B4
_080243AC:
	ldrb r0, [r4, 0xC]
	adds r0, 0x1
	strb r0, [r4, 0xC]
_080243B2:
	movs r0, 0
_080243B4:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80242E0

	thumb_func_start sub_80243BC
sub_80243BC: @ 80243BC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldrb r4, [r5, 0xC]
	cmp r4, 0x1
	beq _080243EA
	cmp r4, 0x1
	bgt _080243D2
	cmp r4, 0
	beq _080243DC
	b _08024434
_080243D2:
	cmp r4, 0x2
	beq _080243F6
	cmp r4, 0x3
	beq _0802441A
	b _08024434
_080243DC:
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x10
	b _08024410
_080243EA:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	beq _08024434
	b _0802443A
_080243F6:
	movs r0, 0
	movs r1, 0x1
	bl sub_8197434
	adds r0, r5, 0
	bl sub_8021488
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
_08024410:
	bl BeginNormalPaletteFade
	bl UpdatePaletteFade
	b _08024434
_0802441A:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0802443A
	movs r0, 0x7
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	movs r0, 0
	strh r4, [r5, 0x12]
	b _08024438
_08024434:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
_08024438:
	strb r0, [r5, 0xC]
_0802443A:
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80243BC

	thumb_func_start sub_8024444
sub_8024444: @ 8024444
	push {r4,r5,lr}
	sub sp, 0x10
	adds r5, r0, 0
	ldrb r4, [r5, 0xC]
	cmp r4, 0x1
	beq _080244BC
	cmp r4, 0x1
	bgt _0802445A
	cmp r4, 0
	beq _08024460
	b _080244F6
_0802445A:
	cmp r4, 0x2
	beq _080244D4
	b _080244F6
_08024460:
	movs r0, 0
	movs r1, 0
	bl sub_81973C4
	ldrh r1, [r5, 0x14]
	cmp r1, 0x3
	bne _08024490
	ldr r0, =gUnknown_082F32A4
	ldr r2, [r0, 0x14]
	ldrb r3, [r5, 0xB]
	str r4, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	movs r0, 0
	movs r1, 0x1
	bl AddTextPrinterParametrized
	b _080244AC
	.pool
_08024490:
	ldr r0, =gUnknown_082F32A4
	ldr r2, [r0, 0x18]
	ldrb r3, [r5, 0xB]
	str r4, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x1
	bl AddTextPrinterParametrized
_080244AC:
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	b _080244F6
	.pool
_080244BC:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _080244FC
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r5, r0
	movs r0, 0x78
	strb r0, [r1]
	b _080244F6
_080244D4:
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r4, r0, 0
	cmp r4, 0
	beq _080244E8
	subs r0, 0x1
	strb r0, [r1]
	b _080244FC
_080244E8:
	movs r0, 0x18
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	strb r4, [r5, 0xC]
	b _080244FC
_080244F6:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
_080244FC:
	movs r0, 0
	add sp, 0x10
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8024444

	thumb_func_start sub_8024508
sub_8024508: @ 8024508
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrb r4, [r5, 0xC]
	cmp r4, 0x1
	beq _08024528
	cmp r4, 0x1
	bgt _0802451C
	cmp r4, 0
	beq _08024522
	b _08024558
_0802451C:
	cmp r4, 0x2
	beq _08024538
	b _08024558
_08024522:
	bl sub_8010434
	b _08024558
_08024528:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _0802455E
	bl sub_800AC34
	b _08024558
_08024538:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _0802455E
	movs r0, 0x19
	strb r0, [r5, 0xE]
	movs r0, 0x5
	movs r1, 0x1
	movs r2, 0
	bl sub_8022BEC
	strb r4, [r5, 0xC]
	b _0802455E
	.pool
_08024558:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
_0802455E:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8024508

	thumb_func_start sub_8024568
sub_8024568: @ 8024568
	push {lr}
	movs r0, 0
	bl sub_8020C0C
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8024568

	thumb_func_start sub_8024578
sub_8024578: @ 8024578
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r5, 0
	movs r0, 0x33
	bl sav12_xor_increment
	strb r5, [r4, 0xD]
	movs r1, 0
	strh r5, [r4, 0x10]
	movs r0, 0x2
	strh r0, [r4, 0x12]
	strh r5, [r4, 0x14]
	str r5, [r4, 0x1C]
	strh r5, [r4, 0x18]
	strh r5, [r4, 0x1A]
	str r5, [r4, 0x20]
	adds r0, r4, 0
	adds r0, 0x24
	strb r1, [r0]
	adds r1, r4, 0
	adds r1, 0x25
	movs r0, 0
	strb r0, [r1]
	strh r5, [r4, 0x26]
	strh r5, [r4, 0x28]
	strh r5, [r4, 0x2E]
	ldr r0, =0x0000ffff
	strh r0, [r4, 0x32]
	strh r5, [r4, 0x30]
	strh r5, [r4, 0x34]
	movs r6, 0
	movs r3, 0
_080245B8:
	lsls r0, r5, 5
	adds r2, r4, r0
	adds r1, r2, 0
	adds r1, 0xA4
	ldr r0, =0x0000ffff
	strh r0, [r1]
	adds r0, r2, 0
	adds r0, 0xA6
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r1, 0x6
	movs r0, 0x1
	strh r0, [r1]
	adds r0, r2, 0
	adds r0, 0xAC
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r0, 0x2
	strb r6, [r0]
	adds r0, 0x1
	strb r6, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _080245B8
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8024578

	thumb_func_start sub_8024604
sub_8024604: @ 8024604
	push {r4-r6,lr}
	sub sp, 0x8
	str r2, [sp, 0x4]
	ldr r5, [sp, 0x18]
	ldr r6, [sp, 0x1C]
	ldr r4, [sp, 0x20]
	mov r2, sp
	strh r4, [r2]
	add r4, sp, 0x4
	ldrb r2, [r4]
	strb r2, [r0]
	ldrb r2, [r4, 0x1]
	strb r2, [r0, 0x1]
	ldrb r2, [r4, 0x2]
	strb r2, [r0, 0x2]
	ldrb r2, [r4, 0x3]
	strb r2, [r0, 0x3]
	strb r3, [r0, 0x4]
	strb r5, [r0, 0x5]
	strb r6, [r0, 0x6]
	mov r2, sp
	ldrb r2, [r2]
	strb r2, [r0, 0x7]
	mov r2, sp
	ldrb r2, [r2, 0x1]
	strb r2, [r0, 0x8]
	strb r1, [r0, 0x9]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8024604

	thumb_func_start sub_8024644
sub_8024644: @ 8024644
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, [sp, 0x10]
	mov r4, sp
	strh r3, [r4]
	strb r1, [r0]
	strb r2, [r0, 0x1]
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r0, 0x2]
	mov r1, sp
	ldrb r1, [r1, 0x1]
	strb r1, [r0, 0x3]
	strb r5, [r0, 0x4]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8024644

	thumb_func_start sub_8024668
sub_8024668: @ 8024668
	ldr r1, =gSaveBlock2Ptr
	ldr r1, [r1]
	adds r1, 0xAC
	ldr r0, [r0]
	ldr r1, [r1]
	eors r0, r1
	bx lr
	.pool
	thumb_func_end sub_8024668

	thumb_func_start sub_802467C
sub_802467C: @ 802467C
	ldr r2, =gSaveBlock2Ptr
	ldr r2, [r2]
	adds r2, 0xAC
	ldr r2, [r2]
	eors r2, r1
	str r2, [r0]
	bx lr
	.pool
	thumb_func_end sub_802467C

	thumb_func_start sub_8024690
sub_8024690: @ 8024690
	push {lr}
	adds r1, r0, 0
	ldr r0, =gSaveBlock2Ptr
	ldr r0, [r0]
	movs r2, 0xFA
	lsls r2, 1
	adds r0, r2
	bl apply_u32_xor_crypto
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8024690

	thumb_func_start sub_80246AC
sub_80246AC: @ 80246AC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, =gSaveBlock2Ptr
	ldr r0, [r0]
	movs r1, 0xFA
	lsls r1, 1
	adds r0, r1
	bl sub_8024668
	cmp r0, r4
	bcc _080246CC
	movs r0, 0x1
	b _080246CE
	.pool
_080246CC:
	movs r0, 0
_080246CE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80246AC

	thumb_func_start sub_80246D4
sub_80246D4: @ 80246D4
	push {lr}
	ldr r0, =gSaveBlock2Ptr
	ldr r0, [r0]
	movs r1, 0xFA
	lsls r1, 1
	adds r0, r1
	bl sub_8024668
	ldr r1, =gUnknown_020375E0
	ldrh r1, [r1]
	cmp r0, r1
	bcc _080246F8
	movs r0, 0x1
	b _080246FA
	.pool
_080246F8:
	movs r0, 0
_080246FA:
	pop {r1}
	bx r1
	thumb_func_end sub_80246D4

	thumb_func_start sub_8024700
sub_8024700: @ 8024700
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, =gSaveBlock2Ptr
	ldr r0, [r0]
	movs r1, 0xFA
	lsls r1, 1
	adds r5, r0, r1
	adds r0, r5, 0
	bl sub_8024668
	adds r1, r0, r4
	ldr r2, =0x0001869f
	cmp r1, r2
	bhi _08024730
	adds r0, r5, 0
	bl sub_802467C
	movs r0, 0x1
	b _0802473A
	.pool
_08024730:
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_802467C
	movs r0, 0
_0802473A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8024700

	thumb_func_start sub_8024740
sub_8024740: @ 8024740
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, =gSaveBlock2Ptr
	ldr r0, [r0]
	movs r1, 0xFA
	lsls r1, 1
	adds r4, r0, r1
	adds r0, r5, 0
	bl sub_80246AC
	lsls r0, 24
	cmp r0, 0
	beq _08024774
	adds r0, r4, 0
	bl sub_8024668
	adds r1, r0, 0
	subs r1, r5
	adds r0, r4, 0
	bl sub_802467C
	movs r0, 0x1
	b _08024776
	.pool
_08024774:
	movs r0, 0
_08024776:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8024740

	thumb_func_start sub_802477C
sub_802477C: @ 802477C
	push {r4,r5,lr}
	ldr r0, =gSaveBlock2Ptr
	ldr r0, [r0]
	movs r1, 0xFA
	lsls r1, 1
	adds r4, r0, r1
	ldr r5, =gUnknown_020375E0
	ldrh r0, [r5]
	bl sub_80246AC
	lsls r0, 24
	cmp r0, 0
	beq _080247B4
	adds r0, r4, 0
	bl sub_8024668
	adds r1, r0, 0
	ldrh r0, [r5]
	subs r1, r0
	adds r0, r4, 0
	bl sub_802467C
	movs r0, 0x1
	b _080247B6
	.pool
_080247B4:
	movs r0, 0
_080247B6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_802477C

	thumb_func_start sub_80247BC
sub_80247BC: @ 80247BC
	push {lr}
	ldr r0, =gSaveBlock2Ptr
	ldr r0, [r0]
	movs r1, 0xFA
	lsls r1, 1
	adds r0, r1
	bl sub_8024668
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_80247BC

	thumb_func_start sub_80247D4
sub_80247D4: @ 80247D4
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0xC
	adds r6, r0, 0
	mov r8, r2
	adds r4, r3, 0
	ldr r5, [sp, 0x24]
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, =gStringVar1
	mov r9, r0
	movs r2, 0x1
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x1
	mov r2, r9
	mov r3, r8
	bl Print
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80247D4

	thumb_func_start sub_802482C
sub_802482C: @ 802482C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	mov r8, r3
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	movs r1, 0
	adds r2, r4, 0
	adds r3, r5, 0
	bl SetWindowBorderStyle
	ldr r2, =gUnknown_085EDCDE
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x1
	movs r3, 0
	bl Print
	str r4, [sp]
	adds r0, r6, 0
	mov r1, r8
	movs r2, 0x1A
	movs r3, 0x11
	bl sub_80247D4
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_802482C

	thumb_func_start sub_802488C
sub_802488C: @ 802488C
	push {lr}
	sub sp, 0x4
	bl sub_80247BC
	adds r1, r0, 0
	ldr r0, =gUnknown_02022C94
	ldrb r0, [r0]
	movs r2, 0
	str r2, [sp]
	movs r2, 0x1A
	movs r3, 0x11
	bl sub_80247D4
	add sp, 0x4
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_802488C

	thumb_func_start sub_80248B0
sub_80248B0: @ 80248B0
	push {r4,r5,lr}
	sub sp, 0x18
	movs r0, 0x7
	str r0, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	movs r0, 0xF
	str r0, [sp, 0x8]
	movs r0, 0x1C
	str r0, [sp, 0xC]
	add r0, sp, 0x10
	movs r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl rbox_template_set
	ldr r4, =gUnknown_02022C94
	add r0, sp, 0x10
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	ldr r5, =0x0000021d
	adds r1, r5, 0
	movs r2, 0xD0
	bl box_border_load_tiles_and_pal
	ldrb r4, [r4]
	bl sub_80247BC
	adds r3, r0, 0
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0xD
	bl sub_802482C
	add sp, 0x18
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80248B0

	thumb_func_start sub_8024918
sub_8024918: @ 8024918
	push {r4,lr}
	ldr r4, =gUnknown_02022C94
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8198070
	ldrb r0, [r4]
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8024918

	thumb_func_start sub_802493C
sub_802493C: @ 802493C
	push {r4-r6,lr}
	adds r5, r1, 0
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, =gUnknown_03000DB0
	movs r0, 0
	str r0, [r1]
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	beq _08024A10
	ldr r4, =gUnknown_02022C98
	ldr r0, =0x00003330
	bl AllocZeroed
	str r0, [r4]
	cmp r0, 0
	beq _08024A10
	bl sub_8024A1C
	ldr r0, [r4]
	bl sub_8024A30
	ldr r0, [r4]
	str r5, [r0]
	bl link_get_multiplayer_id
	ldr r1, [r4]
	adds r1, 0x28
	strb r0, [r1]
	ldr r1, [r4]
	ldr r2, =0x000032cc
	adds r0, r1, r2
	adds r2, r1, 0
	adds r2, 0x28
	ldrb r3, [r2]
	lsls r2, r3, 4
	subs r2, r3
	lsls r2, 2
	adds r1, r2
	ldr r2, =0x000031a0
	adds r1, r2
	movs r2, 0x3C
	bl memcpy
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x28
	ldrb r1, [r1]
	lsls r1, 2
	ldr r2, =0x0000318c
	adds r1, r2
	adds r0, r1
	movs r1, 0x64
	muls r1, r6
	ldr r2, =gPlayerParty
	adds r1, r2
	bl sub_80261F8
	ldr r0, =sub_8024BC8
	movs r1, 0x1
	bl CreateTask
	ldr r0, =sub_80261CC
	bl SetMainCallback2
	bl sub_80273F0
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x24
	ldrb r0, [r0]
	adds r1, r2, 0
	adds r1, 0x44
	adds r2, 0x48
	bl sub_8026B5C
	bl sub_80A2F30
	ldr r0, =0x0000021e
	bl current_map_music_set
	b _08024A16
	.pool
_08024A10:
	adds r0, r5, 0
	bl SetMainCallback2
_08024A16:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_802493C

	thumb_func_start sub_8024A1C
sub_8024A1C: @ 8024A1C
	push {lr}
	bl ResetTasks
	bl ResetAllObjectData
	bl ResetObjectPaletteAllocator
	pop {r0}
	bx r0
	thumb_func_end sub_8024A1C

	thumb_func_start sub_8024A30
sub_8024A30: @ 8024A30
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	adds r2, r0, 0
	movs r0, 0
	strb r0, [r2, 0xC]
	strb r0, [r2, 0x10]
	strb r0, [r2, 0x14]
	strb r0, [r2, 0x18]
	strb r0, [r2, 0x1C]
	movs r3, 0x8E
	lsls r3, 1
	adds r1, r2, r3
	str r0, [r1]
	movs r7, 0x90
	lsls r7, 1
	adds r1, r2, r7
	str r0, [r1]
	adds r1, r2, 0
	adds r1, 0x30
	strb r0, [r1]
	adds r1, 0x10
	strb r0, [r1]
	subs r1, 0x4
	strb r0, [r1]
	adds r3, 0x10
	adds r1, r2, r3
	str r0, [r1]
	movs r5, 0
	adds r1, r2, 0
	adds r1, 0x98
	movs r3, 0
_08024A76:
	adds r0, r1, r5
	strb r3, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _08024A76
	movs r5, 0
	adds r7, r2, 0
	adds r7, 0xA8
	str r7, [sp]
	adds r0, r2, 0
	adds r0, 0xB0
	str r0, [sp, 0xC]
	movs r1, 0x4A
	adds r1, r2
	mov r10, r1
	movs r3, 0x4C
	adds r3, r2
	mov r9, r3
	movs r7, 0x4E
	adds r7, r2
	mov r12, r7
	subs r0, 0x60
	str r0, [sp, 0x24]
	adds r6, r2, 0
	adds r6, 0x54
	adds r1, r2, 0
	adds r1, 0xD0
	str r1, [sp, 0x1C]
	adds r3, r2, 0
	adds r3, 0xDC
	str r3, [sp, 0x20]
	adds r7, r2, 0
	adds r7, 0xC4
	str r7, [sp, 0x14]
	adds r0, 0xA4
	str r0, [sp, 0x4]
	adds r1, 0x25
	str r1, [sp, 0x8]
	subs r3, 0xBC
	str r3, [sp, 0x10]
	movs r7, 0x24
	adds r7, r2
	mov r8, r7
	subs r0, 0xC0
	str r0, [sp, 0x18]
	movs r3, 0
	movs r1, 0x86
	lsls r1, 1
	adds r4, r2, r1
	movs r7, 0x98
	lsls r7, 1
	adds r2, r7
_08024AE2:
	ldr r1, [sp]
	adds r0, r1, r5
	strb r3, [r0]
	ldr r7, [sp, 0xC]
	adds r0, r7, r5
	strb r3, [r0]
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 2
	mov r7, r10
	adds r1, r7, r0
	strh r3, [r1]
	mov r7, r9
	adds r1, r7, r0
	strh r3, [r1]
	mov r7, r12
	adds r1, r7, r0
	strh r3, [r1]
	ldr r7, [sp, 0x24]
	adds r1, r7, r0
	strh r3, [r1]
	adds r0, r6, r0
	strh r3, [r0]
	adds r0, r4, r5
	strb r3, [r0]
	lsls r0, r5, 2
	adds r0, r2, r0
	str r3, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _08024AE2
	movs r5, 0
	movs r3, 0
	movs r4, 0xFF
	ldr r6, [sp, 0x1C]
_08024B2C:
	adds r0, r6, r5
	strb r3, [r0]
	ldr r1, [sp, 0x20]
	adds r0, r1, r5
	strb r3, [r0]
	ldr r7, [sp, 0x14]
	adds r0, r7, r5
	strb r3, [r0]
	lsls r1, r5, 1
	ldr r0, [sp, 0x4]
	adds r2, r0, r1
	ldrb r0, [r2]
	orrs r0, r4
	strb r0, [r2]
	ldr r7, [sp, 0x8]
	adds r1, r7, r1
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xA
	bls _08024B2C
	bl link_get_multiplayer_id
	movs r1, 0
	lsls r0, 24
	cmp r0, 0
	bne _08024B6A
	movs r1, 0x1
_08024B6A:
	ldr r0, [sp, 0x10]
	strb r1, [r0]
	bl sub_8009FCC
	mov r1, r8
	strb r0, [r1]
	bl link_get_multiplayer_id
	ldr r3, [sp, 0x18]
	strb r0, [r3]
	movs r5, 0x1
	mov r7, r8
	ldrb r7, [r7]
	cmp r5, r7
	bcs _08024BB6
	ldr r7, [sp, 0x18]
	mov r6, r8
_08024B8C:
	adds r4, r7, r5
	subs r0, r5, 0x1
	adds r0, r7, r0
	ldrb r0, [r0]
	adds r0, 0x1
	strb r0, [r4]
	ldrb r2, [r4]
	ldrb r1, [r6]
	subs r0, r1, 0x1
	cmp r2, r0
	ble _08024BAA
	adds r0, r2, 0
	bl __umodsi3
	strb r0, [r4]
_08024BAA:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r6]
	cmp r5, r0
	bcc _08024B8C
_08024BB6:
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8024A30

	thumb_func_start sub_8024BC8
sub_8024BC8: @ 8024BC8
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	ldrb r0, [r0, 0xC]
	cmp r0, 0x7
	bls _08024BDC
	b _08024D34
_08024BDC:
	lsls r0, 2
	ldr r1, =_08024BF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08024BF0:
	.4byte _08024C10
	.4byte _08024C24
	.4byte _08024C4C
	.4byte _08024C5A
	.4byte _08024C80
	.4byte _08024CD4
	.4byte _08024CE6
	.4byte _08024D10
_08024C10:
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, =sub_8025910
	movs r1, 0x4
	bl sub_802620C
	b _08024D20
	.pool
_08024C24:
	ldr r0, =sub_8025910
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _08024C32
	b _08024D40
_08024C32:
	ldr r4, =gUnknown_02022C98
	ldr r0, [r4]
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r1
	bl sub_8029274
	ldr r1, [r4]
	b _08024D24
	.pool
_08024C4C:
	bl sub_802A770
	cmp r0, 0
	bne _08024D40
	bl sub_8010434
	b _08024D20
_08024C5A:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08024D40
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	beq _08024D20
	bl sub_800E0E8
	movs r0, 0
	movs r1, 0
	bl sub_800DFB4
	b _08024D20
	.pool
_08024C80:
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	adds r0, 0x24
	ldrb r5, [r0]
	bl sub_80283A8
	movs r4, 0
	cmp r4, r5
	bcs _08024CBA
_08024C92:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x34
	adds r0, r4
	ldrb r2, [r0]
	lsls r0, r2, 2
	ldr r3, =0x0000318c
	adds r0, r3
	adds r0, r1, r0
	adds r1, 0x24
	ldrb r3, [r1]
	adds r1, r4, 0
	bl sub_8028408
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08024C92
_08024CBA:
	ldr r4, =gUnknown_02022C98
	ldr r0, [r4]
	adds r0, 0x24
	ldrb r1, [r0]
	movs r0, 0
	bl sub_802868C
	ldr r1, [r4]
	b _08024D24
	.pool
_08024CD4:
	bl sub_8028A34
	bl sub_8028A88
	bl sub_8028D44
	bl sub_8028734
	b _08024D20
_08024CE6:
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, =sub_80261E4
	bl SetVBlankCallback
	b _08024D20
	.pool
_08024D10:
	bl UpdatePaletteFade
	ldr r0, =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08024D40
_08024D20:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
_08024D24:
	ldrb r0, [r1, 0xC]
	adds r0, 0x1
	strb r0, [r1, 0xC]
	b _08024D40
	.pool
_08024D34:
	adds r0, r1, 0
	bl DestroyTask
	ldr r0, =sub_802589C
	bl sub_802621C
_08024D40:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8024BC8

	thumb_func_start sub_8024D4C
sub_8024D4C: @ 8024D4C
	push {lr}
	bl sub_8025D04
	ldr r1, =gUnknown_082F7AC4
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	ldrb r0, [r0, 0x18]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, =gUnknown_03000DB0
	ldr r0, [r0]
	cmp r0, 0
	bne _08024D70
	bl sub_8026AF4
_08024D70:
	bl sub_8025D50
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8024D4C

	thumb_func_start sub_8024D84
sub_8024D84: @ 8024D84
	push {lr}
	bl sub_8025E0C
	ldr r1, =gUnknown_082F7AF4
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	ldrb r0, [r0, 0x18]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, =gUnknown_03000DB0
	ldr r0, [r0]
	cmp r0, 0
	bne _08024DA8
	bl sub_8026B28
_08024DA8:
	bl sub_8025ED8
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8024D84

	thumb_func_start sub_8024DBC
sub_8024DBC: @ 8024DBC
	push {r4,lr}
	ldr r4, =gUnknown_02022C98
	ldr r0, [r4]
	ldrb r0, [r0, 0x10]
	cmp r0, 0
	beq _08024DD4
	cmp r0, 0x1
	beq _08024DEA
	b _08024DF8
	.pool
_08024DD4:
	movs r0, 0x1
	bl sub_8028504
	movs r0, 0x1
	bl sub_80292E0
	ldr r1, [r4]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _08024DF8
_08024DEA:
	bl sub_802A770
	cmp r0, 0
	bne _08024DF8
	movs r0, 0x1
	bl sub_8026240
_08024DF8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8024DBC

	thumb_func_start sub_8024E00
sub_8024E00: @ 8024E00
	push {r4,lr}
	ldr r4, =gUnknown_02022C98
	ldr r1, [r4]
	ldrb r0, [r1, 0x10]
	cmp r0, 0
	bne _08024E20
	bl sub_80262C0
	ldr r1, [r4]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _08024E30
	.pool
_08024E20:
	movs r0, 0x8C
	lsls r0, 1
	adds r1, r0
	movs r0, 0x1
	str r0, [r1]
	movs r0, 0x2
	bl sub_8026240
_08024E30:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8024E00

	thumb_func_start sub_8024E38
sub_8024E38: @ 8024E38
	push {r4,lr}
	sub sp, 0x4
	ldr r1, =gUnknown_02022C98
	ldr r0, [r1]
	ldrb r0, [r0, 0x10]
	adds r4, r1, 0
	cmp r0, 0x5
	bhi _08024F08
	lsls r0, 2
	ldr r1, =_08024E5C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08024E5C:
	.4byte _08024E74
	.4byte _08024E90
	.4byte _08024EA0
	.4byte _08024EC4
	.4byte _08024ED8
	.4byte _08024EF8
_08024E74:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x7
	movs r1, 0x8
	movs r2, 0x78
	movs r3, 0x50
	bl sub_802EB24
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	b _08024EF0
	.pool
_08024E90:
	bl sub_8010434
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	b _08024EF0
	.pool
_08024EA0:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08024F08
	ldr r2, =gUnknown_02022C98
	ldr r1, [r2]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	movs r3, 0
	strb r0, [r1, 0x10]
	ldr r0, [r2]
	adds r0, 0x30
	strb r3, [r0]
	b _08024F08
	.pool
_08024EC4:
	bl sub_802EB84
	cmp r0, 0
	bne _08024F08
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	b _08024EF0
	.pool
_08024ED8:
	ldr r1, [r4]
	adds r1, 0x30
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bls _08024F08
	bl sub_8010434
	ldr r1, [r4]
_08024EF0:
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _08024F08
_08024EF8:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08024F08
	movs r0, 0x3
	bl sub_8026240
_08024F08:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8024E38

	thumb_func_start sub_8024F10
sub_8024F10: @ 8024F10
	push {lr}
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	ldrb r0, [r1, 0x10]
	cmp r0, 0
	bne _08024F2E
	movs r2, 0x8E
	lsls r2, 1
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, 0
	beq _08024F2E
	movs r0, 0x4
	bl sub_8026240
_08024F2E:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8024F10

	thumb_func_start sub_8024F38
sub_8024F38: @ 8024F38
	push {r4,lr}
	ldr r4, =gUnknown_02022C98
	ldr r2, [r4]
	ldrb r0, [r2, 0x10]
	cmp r0, 0
	bne _08024FF6
	adds r0, r2, 0
	adds r0, 0x40
	ldrb r0, [r0]
	cmp r0, 0x9
	bhi _08024FE8
	adds r0, r2, 0
	adds r0, 0xA8
	ldrb r0, [r0]
	cmp r0, 0
	bne _08024FEE
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08024F88
	ldr r1, =0x000031cc
	adds r0, r2, r1
	ldrb r1, [r0]
	cmp r1, 0
	bne _08024FEE
	ldr r3, =0x000031d0
	adds r0, r2, r3
	strb r1, [r0]
	movs r0, 0x2
	b _08024FC2
	.pool
_08024F88:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08024FA8
	ldr r3, =0x000031cc
	adds r0, r2, r3
	ldrb r1, [r0]
	cmp r1, 0
	bne _08024FEE
	adds r3, 0x4
	adds r0, r2, r3
	strb r1, [r0]
	movs r0, 0x1
	b _08024FC2
	.pool
_08024FA8:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08024FD4
	ldr r3, =0x000031cc
	adds r0, r2, r3
	ldrb r1, [r0]
	cmp r1, 0
	bne _08024FEE
	adds r3, 0x4
	adds r0, r2, r3
	strb r1, [r0]
	movs r0, 0x3
_08024FC2:
	bl sub_8027518
	ldr r1, [r4]
	ldr r2, =0x000031cc
	adds r1, r2
	strb r0, [r1]
	b _08024FEE
	.pool
_08024FD4:
	movs r0, 0
	bl sub_8027518
	ldr r1, [r4]
	ldr r3, =0x000031cc
	adds r1, r3
	strb r0, [r1]
	b _08024FEE
	.pool
_08024FE8:
	movs r0, 0xB
	bl sub_8026240
_08024FEE:
	bl sub_802671C
	bl sub_8025F48
_08024FF6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8024F38

	thumb_func_start sub_8024FFC
sub_8024FFC: @ 8024FFC
	push {lr}
	ldr r0, =gUnknown_02022C98
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x40
	ldrb r0, [r0]
	cmp r0, 0x9
	bhi _080250C4
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0802504C
	adds r0, r2, 0
	adds r0, 0x28
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r0, r2, r0
	ldr r1, =0x000031cc
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080250CA
	ldr r3, =0x000032f8
	adds r1, r2, r3
	movs r0, 0x2
	strb r0, [r1]
	b _080250CA
	.pool
_0802504C:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08025080
	adds r0, r2, 0
	adds r0, 0x28
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r0, r2, r0
	ldr r1, =0x000031cc
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080250CA
	ldr r3, =0x000032f8
	adds r1, r2, r3
	movs r0, 0x1
	strb r0, [r1]
	b _080250CA
	.pool
_08025080:
	movs r0, 0x20
	ands r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _080250B8
	adds r0, r2, 0
	adds r0, 0x28
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r0, r2, r0
	ldr r1, =0x000031cc
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080250CA
	ldr r3, =0x000032f8
	adds r1, r2, r3
	movs r0, 0x3
	strb r0, [r1]
	b _080250CA
	.pool
_080250B8:
	ldr r3, =0x000032f8
	adds r0, r2, r3
	strb r1, [r0]
	b _080250CA
	.pool
_080250C4:
	movs r0, 0xB
	bl sub_8026240
_080250CA:
	bl sub_8026044
	pop {r0}
	bx r0
	thumb_func_end sub_8024FFC

	thumb_func_start sub_80250D4
sub_80250D4: @ 80250D4
	push {r4,r5,lr}
	bl sub_802671C
	bl sub_8025F48
	bl sub_8026C50
	cmp r0, 0x1
	bne _080250F2
	bl sub_80272A4
	movs r0, 0x5
	bl sub_8026240
	b _08025150
_080250F2:
	ldr r0, =gUnknown_02022C98
	ldr r2, [r0]
	movs r1, 0x96
	lsls r1, 1
	adds r4, r2, r1
	movs r1, 0x1
	str r1, [r4]
	movs r3, 0x1
	adds r1, r2, 0
	adds r1, 0x24
	adds r5, r0, 0
	ldrb r1, [r1]
	cmp r3, r1
	bcs _08025150
	movs r1, 0x9A
	lsls r1, 1
	adds r0, r2, r1
	ldr r0, [r0]
	cmp r0, 0x1
	beq _08025124
	movs r0, 0
	str r0, [r4]
	b _08025150
	.pool
_08025124:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r3, r0
	bcs _08025150
	lsls r0, r3, 2
	movs r4, 0x98
	lsls r4, 1
	adds r1, r2, r4
	adds r1, r0
	ldr r0, [r1]
	cmp r0, 0x1
	beq _08025124
	movs r0, 0x96
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0
	str r0, [r1]
_08025150:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80250D4

	thumb_func_start sub_8025158
sub_8025158: @ 8025158
	push {lr}
	bl sub_8026044
	bl sub_8026C90
	cmp r0, 0x1
	bne _0802516C
	movs r0, 0x5
	bl sub_8026240
_0802516C:
	pop {r0}
	bx r0
	thumb_func_end sub_8025158

	thumb_func_start sub_8025170
sub_8025170: @ 8025170
	push {r4,lr}
	bl sub_800A550
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_800A9D8
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	beq _0802518C
	movs r0, 0
	b _08025192
_0802518C:
	bl sub_800A5B4
	movs r0, 0x1
_08025192:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8025170

	thumb_func_start sub_8025198
sub_8025198: @ 8025198
	push {r4,r5,lr}
	ldr r5, =gUnknown_02022C98
	ldr r1, [r5]
	ldrb r4, [r1, 0x10]
	cmp r4, 0x1
	beq _080251D0
	cmp r4, 0x1
	bgt _080251B4
	cmp r4, 0
	beq _080251BA
	b _0802520C
	.pool
_080251B4:
	cmp r4, 0x2
	beq _080251DC
	b _0802520C
_080251BA:
	adds r1, 0x4A
	movs r0, 0
	movs r2, 0x3C
	bl link_0800A448
	lsls r0, 24
	cmp r0, 0
	beq _08025226
	ldr r0, [r5]
	strb r4, [r0, 0x8]
	b _08025202
_080251D0:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08025226
	b _08025202
_080251DC:
	bl sub_8025170
	cmp r0, 0
	beq _080251EE
	ldr r0, [r5]
	adds r1, r0, 0
	adds r1, 0x24
	ldrb r1, [r1]
	strb r1, [r0, 0x8]
_080251EE:
	ldr r2, [r5]
	adds r1, r2, 0
	adds r1, 0x24
	ldrb r0, [r2, 0x8]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08025226
	ldrb r0, [r2, 0x14]
	adds r0, 0x1
	strb r0, [r2, 0x14]
_08025202:
	ldr r1, [r5]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _08025226
_0802520C:
	movs r0, 0x1
	bl ducking_tick
	lsls r0, 24
	cmp r0, 0
	beq _08025226
	movs r0, 0x6
	bl sub_8026240
	ldr r0, =0x0000020b
	movs r1, 0x4
	bl sub_80A2F88
_08025226:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8025198

	thumb_func_start sub_8025230
sub_8025230: @ 8025230
	push {r4,r5,lr}
	ldr r5, =gUnknown_02022C98
	ldr r2, [r5]
	ldrb r4, [r2, 0x10]
	cmp r4, 0x1
	beq _08025274
	cmp r4, 0x1
	bgt _0802524C
	cmp r4, 0
	beq _08025252
	b _080252DC
	.pool
_0802524C:
	cmp r4, 0x2
	beq _08025282
	b _080252DC
_08025252:
	ldrb r0, [r2, 0x14]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, 0x4A
	adds r1, r2, r1
	movs r0, 0
	movs r2, 0x3C
	bl link_0800A448
	lsls r0, 24
	cmp r0, 0
	beq _08025316
	ldr r0, [r5]
	strb r4, [r0, 0x8]
	ldr r1, [r5]
	b _080252CC
_08025274:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08025316
	ldr r1, [r5]
	b _080252CC
_08025282:
	bl sub_8025170
	cmp r0, 0
	beq _080252B4
	movs r4, 0
	b _080252AA
_0802528E:
	ldr r0, [r5]
	adds r0, 0x4A
	ldr r1, =gUnknown_020223C4
	movs r2, 0x3C
	bl memcpy
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x24
	ldrb r0, [r0]
	strb r0, [r1, 0x8]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080252AA:
	ldr r0, [r5]
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r4, r0
	bcc _0802528E
_080252B4:
	ldr r3, =gUnknown_02022C98
	ldr r2, [r3]
	adds r1, r2, 0
	adds r1, 0x24
	ldrb r0, [r2, 0x8]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08025316
	ldrb r0, [r2, 0x14]
	adds r0, 0x1
	strb r0, [r2, 0x14]
	ldr r1, [r3]
_080252CC:
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _08025316
	.pool
_080252DC:
	movs r0, 0x1
	bl ducking_tick
	lsls r0, 24
	cmp r0, 0
	beq _08025316
	ldr r0, =gUnknown_02022C98
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r0, r2, 0
	adds r0, 0x54
	adds r0, r1
	ldrh r1, [r0]
	movs r3, 0x8A
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	movs r0, 0x6
	bl sub_8026240
	ldr r0, =0x0000020b
	movs r1, 0x4
	bl sub_80A2F88
_08025316:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8025230

	thumb_func_start sub_8025324
sub_8025324: @ 8025324
	push {r4,r5,lr}
	sub sp, 0x4
	movs r1, 0x1
	mov r0, sp
	strb r1, [r0]
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	ldrb r0, [r0, 0x10]
	cmp r0, 0x4
	bls _0802533A
	b _08025458
_0802533A:
	lsls r0, 2
	ldr r1, =_0802534C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0802534C:
	.4byte _08025360
	.4byte _08025384
	.4byte _0802539C
	.4byte _080253BC
	.4byte _080253DC
_08025360:
	bl sub_802749C
	movs r0, 0x1
	bl sub_80289E8
	bl sub_8028DFC
	movs r0, 0x1
	bl sub_8028EC8
	movs r0, 0x2
	bl sub_80292E0
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	b _08025448
	.pool
_08025384:
	bl sub_802A770
	cmp r0, 0
	bne _08025466
	movs r0, 0x5
	bl sub_80292E0
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	b _08025448
	.pool
_0802539C:
	bl sub_802A794
	mov r1, sp
	strb r0, [r1]
	movs r0, 0
	movs r2, 0x1
	bl link_0800A448
	lsls r0, 24
	cmp r0, 0
	beq _08025466
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	b _08025448
	.pool
_080253BC:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _08025466
	ldr r3, =gUnknown_02022C98
	ldr r1, [r3]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1, 0x10]
	ldr r0, [r3]
	strb r2, [r0, 0x8]
	b _08025466
	.pool
_080253DC:
	bl sub_8025170
	cmp r0, 0
	beq _08025422
	movs r2, 0
	ldr r1, =gUnknown_02022C98
	ldr r0, [r1]
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r2, r0
	bcs _08025422
	adds r3, r1, 0
	movs r5, 0x86
	lsls r5, 1
	ldr r4, =gUnknown_020223C4
_080253FA:
	ldr r1, [r3]
	adds r1, r2, r1
	adds r1, r5
	lsls r0, r2, 8
	adds r0, r4
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, [r3]
	adds r0, r1, 0
	adds r0, 0x24
	ldrb r0, [r0]
	strb r0, [r1, 0x8]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, [r3]
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080253FA
_08025422:
	ldr r4, =gUnknown_02022C98
	ldr r2, [r4]
	adds r1, r2, 0
	adds r1, 0x24
	ldrb r0, [r2, 0x8]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08025466
	ldrb r0, [r2, 0x14]
	adds r0, 0x1
	strb r0, [r2, 0x14]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x77
	bls _08025466
	movs r0, 0x6
	bl sub_80292E0
	ldr r1, [r4]
_08025448:
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _08025466
	.pool
_08025458:
	bl sub_802A770
	cmp r0, 0
	bne _08025466
	movs r0, 0x7
	bl sub_8026240
_08025466:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8025324

	thumb_func_start sub_8025470
sub_8025470: @ 8025470
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r4, =gUnknown_02022C98
	ldr r0, [r4]
	ldrb r0, [r0, 0x10]
	cmp r0, 0x7
	bls _08025480
	b _08025606
_08025480:
	lsls r0, 2
	ldr r1, =_08025494
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08025494:
	.4byte _080254B4
	.4byte _080254D4
	.4byte _080254F0
	.4byte _08025504
	.4byte _08025520
	.4byte _0802553C
	.4byte _08025564
	.4byte _08025578
_080254B4:
	bl sub_8027748
	ldr r1, =0x00000bb7
	cmp r0, r1
	bls _080254C4
	movs r0, 0x4
	bl sub_80292E0
_080254C4:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	b _080255E8
	.pool
_080254D4:
	bl sub_802A770
	cmp r0, 0
	beq _080254DE
	b _0802563C
_080254DE:
	movs r0, 0x3
	bl sub_80292E0
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	b _080255E8
	.pool
_080254F0:
	bl sub_8028FCC
	bl sub_80272E8
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	b _080255E8
	.pool
_08025504:
	bl sub_802A794
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	cmp r0, 0
	bne _08025516
	b _0802563C
_08025516:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	b _080255E8
	.pool
_08025520:
	bl sub_802A770
	cmp r0, 0
	beq _0802552A
	b _0802563C
_0802552A:
	movs r0, 0x5
	bl sub_80292E0
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	b _080255E8
	.pool
_0802553C:
	bl sub_802A794
	mov r1, sp
	strb r0, [r1]
	movs r0, 0
	movs r2, 0x1
	bl link_0800A448
	lsls r0, 24
	cmp r0, 0
	beq _0802563C
	ldr r2, =gUnknown_02022C98
	ldr r1, [r2]
	movs r0, 0
	strb r0, [r1, 0x8]
	ldr r1, [r2]
	b _080255E8
	.pool
_08025564:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _0802563C
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	b _080255E8
	.pool
_08025578:
	bl sub_8025170
	cmp r0, 0
	beq _080255BE
	movs r2, 0
	ldr r1, =gUnknown_02022C98
	ldr r0, [r1]
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080255BE
	adds r3, r1, 0
	movs r5, 0x86
	lsls r5, 1
	ldr r4, =gUnknown_020223C4
_08025596:
	ldr r1, [r3]
	adds r1, r2, r1
	adds r1, r5
	lsls r0, r2, 8
	adds r0, r4
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, [r3]
	adds r0, r1, 0
	adds r0, 0x24
	ldrb r0, [r0]
	strb r0, [r1, 0x8]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, [r3]
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r2, r0
	bcc _08025596
_080255BE:
	ldr r4, =gUnknown_02022C98
	ldr r2, [r4]
	adds r1, r2, 0
	adds r1, 0x24
	ldrb r0, [r2, 0x8]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _080255F8
	ldrb r0, [r2, 0x14]
	adds r0, 0x1
	strb r0, [r2, 0x14]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x77
	bls _0802563C
	bl sub_8027608
	movs r0, 0x6
	bl sub_80292E0
	ldr r1, [r4]
_080255E8:
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _0802563C
	.pool
_080255F8:
	bl sub_8027554
	b _0802563C
_080255FE:
	movs r0, 0x8
	bl sub_8026240
	b _0802563C
_08025606:
	bl sub_802A770
	cmp r0, 0
	bne _0802563C
	movs r2, 0
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r2, r0
	bcs _08025636
	movs r4, 0x86
	lsls r4, 1
	adds r3, r1, r4
	adds r1, r0, 0
_08025624:
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080255FE
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r1
	bcc _08025624
_08025636:
	movs r0, 0xA
	bl sub_8026240
_0802563C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8025470

	thumb_func_start sub_8025644
sub_8025644: @ 8025644
	push {r4,lr}
	ldr r4, =gUnknown_02022C98
	ldr r0, [r4]
	ldrb r0, [r0, 0x10]
	cmp r0, 0x1
	beq _08025672
	cmp r0, 0x1
	bgt _08025660
	cmp r0, 0
	beq _08025666
	b _08025692
	.pool
_08025660:
	cmp r0, 0x2
	beq _0802567C
	b _08025692
_08025666:
	bl sub_800AC34
	movs r0, 0x7
	bl sub_80292E0
	b _08025688
_08025672:
	bl sub_802A770
	cmp r0, 0
	bne _080256A0
	b _08025688
_0802567C:
	bl sub_802A794
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _080256A0
_08025688:
	ldr r1, [r4]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _080256A0
_08025692:
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _080256A0
	movs r0, 0x9
	bl sub_8026240
_080256A0:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8025644

	thumb_func_start sub_80256AC
sub_80256AC: @ 80256AC
	push {r4,lr}
	sub sp, 0x4
	ldr r4, =gUnknown_02022C98
	ldr r0, [r4]
	ldrb r1, [r0, 0x10]
	cmp r1, 0x1
	beq _080256E0
	cmp r1, 0x1
	bgt _080256C8
	cmp r1, 0
	beq _080256CE
	b _08025728
	.pool
_080256C8:
	cmp r1, 0x2
	beq _080256F8
	b _08025728
_080256CE:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0802571A
_080256E0:
	bl UpdatePaletteFade
	ldr r0, =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0802574C
	b _0802571A
	.pool
_080256F8:
	bl sub_8028B80
	bl sub_80287E4
	ldr r0, [r4]
	adds r0, 0x24
	ldrb r0, [r0]
	bl sub_8028614
	bl sub_8028E84
	ldr r1, =gUnknown_03000DB0
	movs r0, 0x1
	str r0, [r1]
	movs r0, 0x8
	bl sub_80292E0
_0802571A:
	ldr r1, [r4]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _0802574C
	.pool
_08025728:
	bl sub_802A770
	cmp r0, 0
	bne _0802574C
	ldr r4, =gUnknown_02022C98
	ldr r0, [r4]
	ldr r0, [r0]
	bl SetMainCallback2
	ldr r0, [r4]
	ldrb r0, [r0, 0x4]
	bl DestroyTask
	ldr r0, [r4]
	bl Free
	bl FreeAllWindowBuffers
_0802574C:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80256AC

	thumb_func_start sub_8025758
sub_8025758: @ 8025758
	push {r4,lr}
	sub sp, 0x4
	ldr r4, =gUnknown_02022C98
	ldr r1, [r4]
	ldrb r0, [r1, 0x10]
	cmp r0, 0x6
	bls _08025768
	b _0802585C
_08025768:
	lsls r0, 2
	ldr r1, =_0802577C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0802577C:
	.4byte _08025798
	.4byte _08025838
	.4byte _080257B0
	.4byte _08025802
	.4byte _08025808
	.4byte _08025818
	.4byte _08025838
_08025798:
	movs r0, 0x9
	bl sub_80292E0
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _08025848
_080257B0:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	b _08025848
_08025802:
	bl sub_80A2F30
	b _08025848
_08025808:
	ldr r0, =0x0000021e
	bl current_map_music_set
	bl sub_8028E4C
	b _08025848
	.pool
_08025818:
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _08025848
_08025838:
	bl UpdatePaletteFade
	ldr r0, =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0802588C
_08025848:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _0802588C
	.pool
_0802585C:
	ldrb r0, [r1, 0x4]
	bl DestroyTask
	ldr r0, =sub_802589C
	bl sub_802621C
	bl sub_802903C
	ldr r0, [r4]
	bl sub_8024A30
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _08025882
	ldr r0, [r4]
	adds r0, 0x24
	movs r1, 0x1
	strb r1, [r0]
_08025882:
	bl sub_80273F0
	movs r0, 0
	bl sub_8028EC8
_0802588C:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8025758

	thumb_func_start sub_802589C
sub_802589C: @ 802589C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, =gUnknown_02022C98
	ldr r0, [r1]
	ldrb r0, [r0, 0x10]
	adds r4, r1, 0
	cmp r0, 0x1
	beq _080258C8
	cmp r0, 0x1
	bgt _080258BC
	cmp r0, 0
	beq _080258C2
	b _080258E0
	.pool
_080258BC:
	cmp r0, 0x2
	beq _080258CE
	b _080258E0
_080258C2:
	bl sub_8026264
	b _080258D2
_080258C8:
	bl sub_80286E4
	b _080258D6
_080258CE:
	bl sub_8028828
_080258D2:
	cmp r0, 0x1
	bne _08025904
_080258D6:
	ldr r1, [r4]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _08025904
_080258E0:
	ldr r0, [r4]
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0
	beq _080258F8
	ldr r0, =sub_8024D4C
	bl sub_802621C
	b _080258FE
	.pool
_080258F8:
	ldr r0, =sub_8024D84
	bl sub_802621C
_080258FE:
	adds r0, r5, 0
	bl DestroyTask
_08025904:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_802589C

	thumb_func_start sub_8025910
sub_8025910: @ 8025910
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, =gTasks + 0x8
	adds r5, r0, r1
	movs r0, 0
	ldrsh r4, [r5, r0]
	cmp r4, 0x1
	beq _0802596C
	cmp r4, 0x1
	bgt _08025938
	cmp r4, 0
	beq _0802593E
	b _080259E8
	.pool
_08025938:
	cmp r4, 0x2
	beq _0802597E
	b _080259E8
_0802593E:
	ldr r6, =gUnknown_02022C98
	ldr r1, [r6]
	adds r0, r1, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 2
	ldr r2, =0x0000318c
	adds r0, r2
	adds r1, r0
	movs r0, 0
	movs r2, 0x1
	bl link_0800A448
	lsls r0, 24
	cmp r0, 0
	beq _080259E8
	ldr r0, [r6]
	strb r4, [r0, 0x8]
	b _08025976
	.pool
_0802596C:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _080259E8
_08025976:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _080259E8
_0802597E:
	bl sub_8025170
	cmp r0, 0
	beq _080259C4
	movs r2, 0
	ldr r1, =gUnknown_02022C98
	ldr r0, [r1]
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080259C4
	adds r3, r1, 0
	ldr r5, =gUnknown_020223C4
	ldr r4, =0x0000318c
_0802599A:
	ldr r0, [r3]
	lsls r1, r2, 2
	adds r1, r0
	adds r1, r4
	lsls r0, r2, 8
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, [r3]
	adds r0, r1, 0
	adds r0, 0x24
	ldrb r0, [r0]
	strb r0, [r1, 0x8]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, [r3]
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r2, r0
	bcc _0802599A
_080259C4:
	ldr r4, =gUnknown_02022C98
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x24
	ldrb r0, [r0, 0x8]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _080259E8
	adds r0, r6, 0
	bl DestroyTask
	movs r0, 0x6
	bl sub_80292E0
	ldr r1, [r4]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
_080259E8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8025910

	thumb_func_start sub_80259FC
sub_80259FC: @ 80259FC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x18
	ldr r6, =gUnknown_02022C98
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x24
	ldrb r7, [r1]
	ldr r2, =0x000031a0
	adds r1, r0, r2
	ldr r3, =0x000031cc
	adds r2, r0, r3
	ldr r4, =0x00003208
	adds r3, r0, r4
	ldr r5, =0x00003244
	adds r4, r0, r5
	str r4, [sp]
	adds r5, 0x3C
	adds r4, r0, r5
	str r4, [sp, 0x4]
	adds r5, 0x3C
	adds r4, r0, r5
	str r4, [sp, 0x8]
	adds r4, r0, 0
	adds r4, 0x40
	str r4, [sp, 0xC]
	movs r5, 0x90
	lsls r5, 1
	adds r4, r0, r5
	str r4, [sp, 0x10]
	movs r4, 0x96
	lsls r4, 1
	adds r0, r4
	str r0, [sp, 0x14]
	movs r0, 0
	bl sub_8028164
	ldr r1, [r6]
	ldr r5, =0x000031b0
	adds r2, r1, r5
	str r0, [r2]
	movs r0, 0x94
	lsls r0, 1
	adds r1, r0
	movs r0, 0x1
	strb r0, [r1]
	movs r5, 0x1
	cmp r5, r7
	bcs _08025AA4
_08025A60:
	ldr r1, [r6]
	adds r0, r1, 0
	adds r0, 0xA8
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0
	bne _08025A9A
	lsls r0, r5, 4
	subs r0, r5
	lsls r4, r0, 2
	adds r1, r4, r1
	ldr r2, =0x000031cc
	adds r1, r2
	adds r0, r5, 0
	bl sub_8028318
	adds r1, r0, 0
	cmp r1, 0
	bne _08025A9A
	ldr r0, [r6]
	adds r0, r4
	ldr r3, =0x000031cc
	adds r0, r3
	strb r1, [r0]
	ldr r0, [r6]
	movs r4, 0x94
	lsls r4, 1
	adds r0, r4
	strb r1, [r0]
_08025A9A:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _08025A60
_08025AA4:
	ldr r5, =gUnknown_02022C98
	ldr r1, [r5]
	movs r6, 0x92
	lsls r6, 1
	adds r1, r6
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bls _08025B02
	ldr r1, [r5]
	movs r2, 0x94
	lsls r2, 1
	adds r0, r1, r2
	ldrb r4, [r0]
	cmp r4, 0
	beq _08025AF0
	bl sub_8011AC8
	ldr r0, [r5]
	adds r0, r6
	movs r1, 0
	strb r1, [r0]
	b _08025B02
	.pool
_08025AF0:
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, 0x46
	bls _08025B02
	bl sub_8011AC8
	ldr r0, [r5]
	adds r0, r6
	strb r4, [r0]
_08025B02:
	movs r5, 0
	cmp r5, r7
	bcs _08025BF6
	ldr r3, =0x000031cc
	mov r12, r3
	ldr r4, =gUnknown_02022C98
	mov r8, r4
_08025B10:
	mov r6, r8
	ldr r2, [r6]
	lsls r0, r5, 4
	subs r1, r0, r5
	lsls r1, 2
	adds r1, r2, r1
	add r1, r12
	ldrb r1, [r1]
	adds r6, r0, 0
	cmp r1, 0
	beq _08025B36
	adds r0, r2, 0
	adds r0, 0xA8
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, 0
	bne _08025B36
	movs r0, 0x1
	strb r0, [r1]
_08025B36:
	adds r3, r4, 0
	ldr r1, [r3]
	adds r0, r1, 0
	adds r0, 0xA8
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0x3
	bgt _08025B54
	cmp r0, 0x1
	bge _08025B5A
	b _08025BEC
	.pool
_08025B54:
	cmp r0, 0x4
	beq _08025BA8
	b _08025BEC
_08025B5A:
	adds r1, 0xB0
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bls _08025BEC
	ldr r0, [r3]
	adds r0, 0xB0
	adds r0, r5
	strb r2, [r0]
	ldr r0, [r3]
	adds r0, 0xA8
	adds r0, r5
	strb r2, [r0]
	ldr r0, [r3]
	subs r1, r6, r5
	lsls r1, 2
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldr r0, [r3]
	adds r0, r1
	ldr r6, =0x000031d0
	adds r0, r6
	strb r2, [r0]
	ldr r0, [r3]
	adds r0, r1
	ldr r1, =0x000031d4
	adds r0, r1
	b _08025BEA
	.pool
_08025BA8:
	adds r1, 0xB0
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x27
	bls _08025BEC
	ldr r0, [r4]
	adds r0, 0xB0
	adds r0, r5
	strb r2, [r0]
	ldr r0, [r4]
	adds r0, 0xA8
	adds r0, r5
	strb r2, [r0]
	ldr r0, [r4]
	subs r1, r6, r5
	lsls r1, 2
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldr r0, [r4]
	adds r0, r1
	ldr r3, =0x000031d0
	adds r0, r3
	strb r2, [r0]
	ldr r0, [r4]
	adds r0, r1
	ldr r6, =0x000031d4
	adds r0, r6
_08025BEA:
	strb r2, [r0]
_08025BEC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _08025B10
_08025BF6:
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80259FC

	thumb_func_start sub_8025C0C
sub_8025C0C: @ 8025C0C
	push {r4-r7,lr}
	sub sp, 0x18
	ldr r5, =gUnknown_02022C98
	ldr r0, [r5]
	adds r1, r0, 0
	adds r1, 0x24
	ldrb r6, [r1]
	ldr r2, =0x000031a0
	adds r1, r0, r2
	ldr r3, =0x000031cc
	adds r2, r0, r3
	ldr r4, =0x00003208
	adds r3, r0, r4
	ldr r7, =0x00003244
	adds r4, r0, r7
	str r4, [sp]
	adds r7, 0x3C
	adds r4, r0, r7
	str r4, [sp, 0x4]
	adds r7, 0x3C
	adds r4, r0, r7
	str r4, [sp, 0x8]
	adds r4, r0, 0
	adds r4, 0x40
	str r4, [sp, 0xC]
	movs r7, 0x90
	lsls r7, 1
	adds r4, r0, r7
	str r4, [sp, 0x10]
	movs r4, 0x96
	lsls r4, 1
	adds r0, r4
	str r0, [sp, 0x14]
	movs r0, 0
	bl sub_8028164
	ldr r1, [r5]
	ldr r7, =0x000031b0
	adds r2, r1, r7
	str r0, [r2]
	movs r0, 0x94
	lsls r0, 1
	adds r1, r0
	movs r0, 0x1
	strb r0, [r1]
	movs r4, 0x1
	cmp r4, r6
	bcs _08025C9C
_08025C6C:
	adds r0, r4, 0
	bl sub_8028374
	cmp r0, 0
	beq _08025C92
	ldr r0, =gUnknown_02022C98
	ldr r2, [r0]
	lsls r1, r4, 2
	movs r3, 0x98
	lsls r3, 1
	adds r0, r2, r3
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
	movs r7, 0x94
	lsls r7, 1
	adds r1, r2, r7
	movs r0, 0
	strb r0, [r1]
_08025C92:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _08025C6C
_08025C9C:
	ldr r5, =gUnknown_02022C98
	ldr r1, [r5]
	movs r6, 0x92
	lsls r6, 1
	adds r1, r6
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bls _08025CFA
	ldr r1, [r5]
	movs r2, 0x94
	lsls r2, 1
	adds r0, r1, r2
	ldrb r4, [r0]
	cmp r4, 0
	beq _08025CE8
	bl sub_8011AC8
	ldr r0, [r5]
	adds r0, r6
	movs r1, 0
	strb r1, [r0]
	b _08025CFA
	.pool
_08025CE8:
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, 0x46
	bls _08025CFA
	bl sub_8011AC8
	ldr r0, [r5]
	adds r0, r6
	strb r4, [r0]
_08025CFA:
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8025C0C

	thumb_func_start sub_8025D04
sub_8025D04: @ 8025D04
	push {r4,r5,lr}
	ldr r5, =gUnknown_02022C98
	ldr r0, [r5]
	ldrb r0, [r0, 0x18]
	cmp r0, 0x4
	beq _08025D40
	cmp r0, 0x4
	bgt _08025D20
	cmp r0, 0x3
	beq _08025D26
	b _08025D4A
	.pool
_08025D20:
	cmp r0, 0xB
	beq _08025D46
	b _08025D4A
_08025D26:
	bl sub_8026BB8
	adds r4, r0, 0
	cmp r4, 0x1
	bne _08025D4A
	bl sub_8026C28
	ldr r0, [r5]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r1
	str r4, [r0]
	b _08025D4A
_08025D40:
	bl sub_80259FC
	b _08025D4A
_08025D46:
	bl sub_8025C0C
_08025D4A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8025D04

	thumb_func_start sub_8025D50
sub_8025D50: @ 8025D50
	push {r4-r6,lr}
	sub sp, 0x14
	ldr r0, =gUnknown_02022C98
	ldr r5, [r0]
	ldrb r0, [r5, 0x18]
	cmp r0, 0x4
	beq _08025D68
	cmp r0, 0xB
	beq _08025DB8
	b _08025DF4
	.pool
_08025D68:
	ldr r1, =0x000032cc
	adds r0, r5, r1
	ldr r2, =0x000031cc
	adds r1, r5, r2
	ldr r3, =0x00003208
	adds r2, r5, r3
	ldr r4, =0x00003244
	adds r3, r5, r4
	movs r6, 0xCA
	lsls r6, 6
	adds r4, r5, r6
	str r4, [sp]
	adds r6, 0x3C
	adds r4, r5, r6
	str r4, [sp, 0x4]
	adds r4, r5, 0
	adds r4, 0x40
	ldrb r4, [r4]
	str r4, [sp, 0x8]
	movs r6, 0x90
	lsls r6, 1
	adds r4, r5, r6
	ldr r4, [r4]
	str r4, [sp, 0xC]
	adds r6, 0xC
	adds r4, r5, r6
	ldr r4, [r4]
	str r4, [sp, 0x10]
	bl sub_8027E30
	b _08025DF4
	.pool
_08025DB8:
	ldr r1, =0x000032cc
	adds r0, r5, r1
	ldr r2, =0x000031cc
	adds r1, r5, r2
	ldr r3, =0x00003208
	adds r2, r5, r3
	ldr r4, =0x00003244
	adds r3, r5, r4
	movs r6, 0xCA
	lsls r6, 6
	adds r4, r5, r6
	str r4, [sp]
	adds r6, 0x3C
	adds r4, r5, r6
	str r4, [sp, 0x4]
	adds r4, r5, 0
	adds r4, 0x40
	ldrb r4, [r4]
	str r4, [sp, 0x8]
	movs r6, 0x90
	lsls r6, 1
	adds r4, r5, r6
	ldr r4, [r4]
	str r4, [sp, 0xC]
	adds r6, 0xC
	adds r4, r5, r6
	ldr r4, [r4]
	str r4, [sp, 0x10]
	bl sub_8027E30
_08025DF4:
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8025D50

	thumb_func_start sub_8025E0C
sub_8025E0C: @ 8025E0C
	push {r4-r6,lr}
	sub sp, 0x18
	ldr r0, =gUnknown_02022C98
	ldr r5, [r0]
	ldrb r0, [r5, 0x18]
	cmp r0, 0x4
	beq _08025E24
	cmp r0, 0xB
	beq _08025E7C
	b _08025EC0
	.pool
_08025E24:
	adds r0, r5, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 2
	ldr r2, =0x000031a0
	adds r1, r2
	adds r1, r5, r1
	ldr r3, =0x000031cc
	adds r2, r5, r3
	ldr r4, =0x00003208
	adds r3, r5, r4
	ldr r6, =0x00003244
	adds r4, r5, r6
	str r4, [sp]
	adds r6, 0x3C
	adds r4, r5, r6
	str r4, [sp, 0x4]
	adds r6, 0x3C
	adds r4, r5, r6
	str r4, [sp, 0x8]
	adds r4, r5, 0
	adds r4, 0x40
	str r4, [sp, 0xC]
	movs r6, 0x90
	lsls r6, 1
	adds r4, r5, r6
	str r4, [sp, 0x10]
	adds r6, 0xC
	adds r4, r5, r6
	str r4, [sp, 0x14]
	bl sub_8028164
	b _08025EC0
	.pool
_08025E7C:
	adds r0, r5, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 2
	ldr r2, =0x000031a0
	adds r1, r2
	adds r1, r5, r1
	ldr r3, =0x000031cc
	adds r2, r5, r3
	ldr r4, =0x00003208
	adds r3, r5, r4
	ldr r6, =0x00003244
	adds r4, r5, r6
	str r4, [sp]
	adds r6, 0x3C
	adds r4, r5, r6
	str r4, [sp, 0x4]
	adds r6, 0x3C
	adds r4, r5, r6
	str r4, [sp, 0x8]
	adds r4, r5, 0
	adds r4, 0x40
	str r4, [sp, 0xC]
	movs r6, 0x90
	lsls r6, 1
	adds r4, r5, r6
	str r4, [sp, 0x10]
	adds r6, 0xC
	adds r4, r5, r6
	str r4, [sp, 0x14]
	bl sub_8028164
_08025EC0:
	add sp, 0x18
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8025E0C

	thumb_func_start sub_8025ED8
sub_8025ED8: @ 8025ED8
	push {r4,lr}
	ldr r4, =gUnknown_02022C98
	ldr r1, [r4]
	ldrb r0, [r1, 0x18]
	cmp r0, 0x4
	beq _08025F0E
	cmp r0, 0x4
	bgt _08025EF4
	cmp r0, 0x3
	beq _08025EFA
	b _08025F40
	.pool
_08025EF4:
	cmp r0, 0xB
	beq _08025F24
	b _08025F40
_08025EFA:
	movs r0, 0x1
	bl sub_8027DD0
	ldr r0, [r4]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
	b _08025F40
_08025F0E:
	ldr r2, =0x000032f8
	adds r1, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _08025F40
	bl sub_80282EC
	b _08025F40
	.pool
_08025F24:
	movs r2, 0x90
	lsls r2, 1
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, 0
	bne _08025F40
	adds r2, 0xC
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, 0
	bne _08025F40
	movs r0, 0x1
	bl sub_8028350
_08025F40:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8025ED8

	thumb_func_start sub_8025F48
sub_8025F48: @ 8025F48
	push {r4-r6,lr}
	ldr r6, =gUnknown_02022C98
	ldr r2, [r6]
	adds r0, r2, 0
	adds r0, 0x28
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r1, r2, r0
	ldr r3, =0x000031cc
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _08025F88
	bl mplay_has_finished_maybe
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08025FEA
	ldr r0, [r6]
	movs r2, 0xA2
	lsls r2, 1
	adds r0, r2
	strb r1, [r0]
	b _08025FEA
	.pool
_08025F88:
	ldr r3, =0x000031d0
	adds r0, r1, r3
	ldrb r4, [r0]
	cmp r4, 0x1
	bne _08025FB8
	movs r1, 0xA2
	lsls r1, 1
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08025FEA
	movs r0, 0x1F
	bl m4aSongNumStop
	movs r0, 0x1F
	bl audio_play
	ldr r0, [r6]
	movs r2, 0xA2
	lsls r2, 1
	adds r0, r2
	b _08025FE8
	.pool
_08025FB8:
	ldr r3, =0x000031d4
	adds r0, r1, r3
	ldrb r4, [r0]
	cmp r4, 0x1
	bne _08025FEA
	movs r5, 0xA2
	lsls r5, 1
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, 0
	bne _08025FEA
	bl mplay_has_finished_maybe
	lsls r0, 24
	cmp r0, 0
	bne _08025FEA
	movs r0, 0x16
	bl audio_play
	movs r0, 0x1
	bl sub_80284CC
	ldr r0, [r6]
	adds r0, r5
_08025FE8:
	strb r4, [r0]
_08025FEA:
	ldr r0, =gUnknown_02022C98
	ldr r2, [r0]
	movs r5, 0xAA
	lsls r5, 1
	adds r1, r2, r5
	ldrb r1, [r1]
	adds r4, r0, 0
	cmp r1, 0
	bne _0802601C
	adds r0, r2, 0
	adds r0, 0x40
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _0802601C
	bl sub_80A2F30
	ldr r0, [r4]
	adds r0, r5
	movs r1, 0x1
	b _0802603A
	.pool
_0802601C:
	ldr r0, [r4]
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0802603C
	movs r0, 0xB
	bl pause_music_for_sound_maybe
	ldr r0, [r4]
	movs r2, 0xAA
	lsls r2, 1
	adds r0, r2
	movs r1, 0x2
_0802603A:
	strb r1, [r0]
_0802603C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8025F48

	thumb_func_start sub_8026044
sub_8026044: @ 8026044
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r6, =gUnknown_02022C98
	ldr r2, [r6]
	adds r0, r2, 0
	adds r0, 0x44
	ldrb r0, [r0]
	mov r8, r0
	adds r0, r2, 0
	adds r0, 0x48
	ldrb r7, [r0]
	subs r0, 0x20
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r1, r2, r0
	ldr r3, =0x000031cc
	adds r0, r1, r3
	ldrb r3, [r0]
	cmp r3, 0
	bne _0802609C
	ldr r4, =0x000031d0
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080260FE
	adds r4, 0x4
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080260FE
	movs r1, 0xA2
	lsls r1, 1
	adds r0, r2, r1
	strb r3, [r0]
	b _080260FE
	.pool
_0802609C:
	ldr r3, =0x000031d0
	adds r0, r1, r3
	ldrb r4, [r0]
	cmp r4, 0x1
	bne _080260CC
	movs r1, 0xA2
	lsls r1, 1
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080260FE
	movs r0, 0x1F
	bl m4aSongNumStop
	movs r0, 0x1F
	bl audio_play
	ldr r0, [r6]
	movs r3, 0xA2
	lsls r3, 1
	adds r0, r3
	b _080260FC
	.pool
_080260CC:
	ldr r4, =0x000031d4
	adds r0, r1, r4
	ldrb r4, [r0]
	cmp r4, 0x1
	bne _080260FE
	movs r5, 0xA2
	lsls r5, 1
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, 0
	bne _080260FE
	bl mplay_has_finished_maybe
	lsls r0, 24
	cmp r0, 0
	bne _080260FE
	movs r0, 0x16
	bl audio_play
	movs r0, 0x1
	bl sub_80284CC
	ldr r0, [r6]
	adds r0, r5
_080260FC:
	strb r4, [r0]
_080260FE:
	mov r4, r8
	cmp r4, r7
	bcs _08026172
	ldr r5, =gUnknown_02022C98
_08026106:
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0x28
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	ldr r1, =0x000031a0
	adds r0, r1
	adds r0, r2, r0
	adds r1, r0, 0
	adds r1, 0x14
	adds r0, 0x1F
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _0802615C
	movs r3, 0xA4
	lsls r3, 1
	adds r0, r2, r3
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _08026168
	adds r0, r1, r4
	ldrb r0, [r0]
	adds r0, 0x4A
	bl audio_play
	ldr r0, [r5]
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r1
	adds r0, r4
	movs r1, 0x1
	b _08026166
	.pool
_0802615C:
	movs r3, 0xA4
	lsls r3, 1
	adds r0, r2, r3
	adds r0, r4
	movs r1, 0
_08026166:
	strb r1, [r0]
_08026168:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r7
	bcc _08026106
_08026172:
	ldr r0, =gUnknown_02022C98
	ldr r2, [r0]
	movs r5, 0xAA
	lsls r5, 1
	adds r1, r2, r5
	ldrb r1, [r1]
	adds r4, r0, 0
	cmp r1, 0
	bne _080261A0
	adds r0, r2, 0
	adds r0, 0x40
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _080261A0
	bl sub_80A2F30
	ldr r0, [r4]
	adds r0, r5
	movs r1, 0x1
	b _080261BE
	.pool
_080261A0:
	ldr r0, [r4]
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080261C0
	movs r0, 0xB
	bl pause_music_for_sound_maybe
	ldr r0, [r4]
	movs r3, 0xAA
	lsls r3, 1
	adds r0, r3
	movs r1, 0x2
_080261BE:
	strb r1, [r0]
_080261C0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8026044

	thumb_func_start sub_80261CC
sub_80261CC: @ 80261CC
	push {lr}
	bl RunTasks
	bl CallObjectCallbacks
	bl PrepareSpritesForOamLoad
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80261CC

	thumb_func_start sub_80261E4
sub_80261E4: @ 80261E4
	push {lr}
	bl TransferPlttBuffer
	bl LoadOamFromSprites
	bl ProcessObjectCopyRequests
	pop {r0}
	bx r0
	thumb_func_end sub_80261E4

	thumb_func_start sub_80261F8
sub_80261F8: @ 80261F8
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	bl sub_806EBA4
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80261F8

	thumb_func_start sub_802620C
sub_802620C: @ 802620C
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	bl CreateTask
	pop {r0}
	bx r0
	thumb_func_end sub_802620C

	thumb_func_start sub_802621C
sub_802621C: @ 802621C
	push {lr}
	movs r1, 0x1
	bl CreateTask
	ldr r1, =gUnknown_02022C98
	ldr r3, [r1]
	movs r2, 0
	strb r0, [r3, 0x4]
	ldr r0, [r1]
	strb r2, [r0, 0x10]
	ldr r0, [r1]
	strb r2, [r0, 0xC]
	ldr r0, [r1]
	strb r2, [r0, 0x14]
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_802621C

	thumb_func_start sub_8026240
sub_8026240: @ 8026240
	push {r4,lr}
	ldr r2, =gUnknown_02022C98
	ldr r1, [r2]
	ldrb r3, [r1, 0x18]
	movs r4, 0
	strb r3, [r1, 0x1C]
	ldr r1, [r2]
	strb r0, [r1, 0x18]
	ldr r0, [r2]
	strb r4, [r0, 0x10]
	ldr r0, [r2]
	strb r4, [r0, 0x14]
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8026240

	thumb_func_start sub_8026264
sub_8026264: @ 8026264
	push {r4,lr}
	ldr r3, =gUnknown_02022C98
	ldr r1, [r3]
	ldrb r0, [r1, 0x14]
	lsrs r2, r0, 2
	adds r0, 0x1
	strb r0, [r1, 0x14]
	cmp r2, 0
	beq _080262B8
	ldr r3, [r3]
	ldrb r0, [r3, 0x14]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _080262B8
	ldr r1, =gUnknown_082F7A94
	adds r0, r3, 0
	adds r0, 0x24
	ldrb r0, [r0]
	subs r0, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080262A0
	movs r0, 0x1
	b _080262BA
	.pool
_080262A0:
	lsls r4, r2, 3
	adds r1, r4, 0
	movs r0, 0x14
	bl SetGpuReg
	negs r4, r4
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x18
	adds r1, r4, 0
	bl SetGpuReg
_080262B8:
	movs r0, 0
_080262BA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8026264

	thumb_func_start sub_80262C0
sub_80262C0: @ 80262C0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r2, =gUnknown_02022C98
	ldr r0, [r2]
	adds r1, r0, 0
	adds r1, 0x44
	adds r0, 0x48
	ldrb r5, [r0]
	ldrb r1, [r1]
	cmp r1, r5
	bcs _0802630C
	mov r8, r2
	ldr r0, =0x000032e0
	mov r12, r0
	movs r7, 0
	movs r6, 0x1
_080262E2:
	mov r2, r8
	ldr r0, [r2]
	mov r2, r12
	adds r4, r0, r2
	ldr r2, =0x000032eb
	adds r0, r2
	adds r2, r0, r1
	movs r3, 0
	adds r0, r1, 0
	ands r0, r6
	cmp r0, 0
	bne _080262FC
	movs r3, 0x1
_080262FC:
	strb r3, [r2]
	adds r0, r4, r1
	strb r7, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r5
	bcc _080262E2
_0802630C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80262C0

	thumb_func_start sub_8026324
sub_8026324: @ 8026324
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x44
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r1, 0
	adds r0, 0x48
	ldrb r0, [r0]
	str r0, [sp, 0x4]
	adds r0, r1, 0
	adds r0, 0x24
	ldrb r0, [r0]
	str r0, [sp, 0x8]
	adds r0, r1, 0
	adds r0, 0x40
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _08026358
	b _08026614
_08026358:
	movs r6, 0
	ldr r0, [sp, 0x8]
	cmp r6, r0
	bcs _08026440
_08026360:
	ldr r3, =gUnknown_02022C98
	lsls r0, r6, 4
	subs r1, r0, r6
	lsls r1, 2
	ldr r2, [r3]
	adds r1, r2
	ldr r4, =0x000031cc
	adds r4, r1
	mov r8, r4
	ldrb r1, [r4]
	mov r9, r0
	adds r0, r6, 0x1
	str r0, [sp, 0xC]
	cmp r1, 0
	beq _08026434
	adds r0, r2, 0
	adds r0, 0xA8
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08026434
	ldr r1, [sp]
	mov r10, r1
	ldr r2, [sp, 0x4]
	cmp r10, r2
	bcs _08026434
	adds r7, r3, 0
_08026396:
	ldr r0, =gUnknown_082F449C
	add r0, r10
	ldrb r5, [r0]
	ldr r1, [r7]
	lsls r4, r5, 1
	adds r0, r1, 0
	adds r0, 0xF4
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, r6
	beq _08026434
	adds r0, r1, 0
	adds r0, 0xF5
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, r6
	beq _08026434
	mov r0, r8
	ldrb r1, [r0]
	adds r0, r6, 0
	adds r2, r5, 0
	bl sub_8026634
	cmp r0, 0x1
	bne _08026410
	movs r2, 0
	ldr r3, =gUnknown_02022C98
	mov r8, r4
_080263CE:
	ldr r0, [r3]
	mov r4, r8
	adds r1, r2, r4
	adds r0, 0xF4
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08026404
	strb r6, [r1]
	ldr r0, [r3]
	adds r0, 0xA8
	adds r0, r6
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, 0xC4
	adds r0, r5
	movs r1, 0x1
	strb r1, [r0]
	b _08026434
	.pool
_08026404:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1
	bls _080263CE
	b _08026434
_08026410:
	ldr r0, [r7]
	mov r2, r9
	subs r1, r2, r6
	lsls r1, 2
	adds r0, r1
	ldr r4, =0x000031d4
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08026434
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, [sp, 0x4]
	cmp r10, r0
	bcc _08026396
_08026434:
	ldr r1, [sp, 0xC]
	lsls r0, r1, 24
	lsrs r6, r0, 24
	ldr r2, [sp, 0x8]
	cmp r6, r2
	bcc _08026360
_08026440:
	ldr r4, [sp]
	mov r10, r4
	ldr r0, [sp, 0x4]
	cmp r10, r0
	bcc _0802644C
	b _08026614
_0802644C:
	ldr r1, =gUnknown_02022C98
	mov r9, r1
_08026450:
	movs r6, 0xFF
	ldr r0, =gUnknown_082F449C
	add r0, r10
	ldrb r5, [r0]
	mov r2, r9
	ldr r0, [r2]
	adds r0, 0xC4
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08026468
	b _08026602
_08026468:
	adds r0, r5, 0
	bl sub_8026D8C
	mov r1, r9
	ldr r4, [r1]
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r1, 0x90
	adds r1, r0
	ldrb r0, [r1]
	movs r1, 0x7
	bl __udivsi3
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	bls _0802648E
	movs r3, 0x2
_0802648E:
	ldr r2, =gUnknown_082F7A88
	ldr r0, =0x000031b4
	adds r1, r4, r0
	adds r1, r5
	lsls r0, r3, 1
	adds r0, r3
	ldrb r1, [r1]
	adds r0, r1
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r4, 0
	adds r0, 0xD0
	adds r0, r5
	ldrb r0, [r0]
	subs r2, r1, r0
	cmp r2, 0x5
	bgt _080264BC
	adds r1, r4, 0
	adds r1, 0x9C
	adds r1, r5
	ldrb r0, [r1]
	adds r0, r2
	strb r0, [r1]
_080264BC:
	mov r2, r9
	ldr r1, [r2]
	adds r1, 0x9C
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	movs r4, 0xFF
	ands r0, r4
	cmp r0, 0x5
	bhi _080264D6
	b _08026602
_080264D6:
	mov r1, r9
	ldr r0, [r1]
	adds r0, 0x9C
	adds r0, r5
	strb r2, [r0]
	ldr r3, [r1]
	lsls r1, r5, 1
	adds r0, r3, 0
	adds r0, 0xF4
	adds r2, r0, r1
	ldrb r0, [r2]
	mov r8, r1
	cmp r0, 0xFF
	bne _08026518
	adds r0, r3, 0
	adds r0, 0xF5
	add r0, r8
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08026500
	b _08026602
_08026500:
	b _08026528
	.pool
_08026518:
	adds r0, r3, 0
	adds r0, 0xF5
	add r0, r8
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08026528
	ldrb r4, [r2]
	b _0802654E
_08026528:
	mov r2, r9
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0xF4
	add r0, r8
	ldrb r7, [r0]
	adds r1, 0xF5
	add r1, r8
	ldrb r6, [r1]
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	bne _0802654A
	adds r4, r7, 0
	b _0802654E
_0802654A:
	adds r4, r6, 0
	adds r6, r7, 0
_0802654E:
	mov r1, r9
	ldr r0, [r1]
	ldr r2, =0x000032eb
	adds r0, r2
	adds r0, r5
	movs r1, 0x7
	strb r1, [r0]
	mov r1, r9
	ldr r0, [r1]
	adds r0, 0xC4
	adds r0, r5
	movs r1, 0x2
	strb r1, [r0]
	mov r2, r9
	ldr r0, [r2]
	adds r0, 0xA8
	adds r0, r4
	movs r1, 0x3
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0xB8
	adds r0, r5
	strb r4, [r0]
	ldr r1, [r2]
	lsls r0, r4, 4
	subs r0, r4
	lsls r0, 2
	adds r1, r0
	ldr r2, =0x000031d0
	adds r1, r2
	movs r0, 0x1
	strb r0, [r1]
	mov r2, r9
	ldr r1, [r2]
	lsls r0, r6, 4
	subs r0, r6
	lsls r0, 2
	adds r1, r0
	ldr r0, =0x000031d4
	adds r1, r0
	movs r2, 0x1
	strb r2, [r1]
	mov r0, r9
	ldr r1, [r0]
	lsls r0, r4, 1
	adds r1, 0x86
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8026F1C
	movs r0, 0x1
	bl sub_8027234
	adds r0, r4, 0
	bl sub_8026D1C
	mov r1, r9
	ldr r0, [r1]
	adds r1, r0, 0
	adds r1, 0xE8
	adds r1, r5
	ldr r2, =0x000032e0
	adds r0, r2
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	mov r4, r9
	ldr r0, [r4]
	adds r0, r2
	adds r0, r5
	movs r1, 0x3
	strb r1, [r0]
	ldr r1, [r4]
	adds r1, 0xF4
	add r1, r8
	ldrb r0, [r1]
	movs r2, 0xFF
	orrs r0, r2
	strb r0, [r1]
	ldr r1, [r4]
	adds r1, 0xF5
	add r1, r8
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
_08026602:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r4, [sp, 0x4]
	cmp r10, r4
	bcs _08026614
	b _08026450
_08026614:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8026324

	thumb_func_start sub_8026634
sub_8026634: @ 8026634
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	movs r7, 0
	ldr r2, =gUnknown_02022C98
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0x24
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, =0x000032e0
	adds r1, r0
	mov r12, r2
	cmp r3, 0x2
	beq _08026670
	cmp r3, 0x2
	bgt _08026676
	cmp r3, 0x1
	beq _08026674
	b _08026676
	.pool
_08026670:
	movs r7, 0x1
	b _08026676
_08026674:
	movs r7, 0x2
_08026676:
	adds r0, r1, 0
	adds r0, 0xB
	adds r0, r6
	ldrb r0, [r0]
	subs r0, 0x6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080266D4
	ldr r0, =gUnknown_082F45AF
	lsls r1, r4, 1
	adds r1, r4
	adds r1, r7, r1
	lsls r2, r5, 4
	subs r2, r5
	adds r1, r2
	adds r1, r0
	ldrb r1, [r1]
	cmp r6, r1
	bne _0802670A
	mov r0, r12
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0xC4
	adds r0, r6
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080266D0
	lsls r0, r4, 4
	subs r0, r4
	lsls r0, 2
	adds r0, r1, r0
	ldr r1, =0x000031d4
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	b _0802670A
	.pool
_080266D0:
	movs r0, 0x1
	b _0802670C
_080266D4:
	ldr r0, =gUnknown_082F45AF
	lsls r1, r4, 1
	adds r1, r4
	adds r1, r7, r1
	lsls r2, r5, 4
	subs r2, r5
	adds r1, r2
	adds r1, r0
	ldrb r1, [r1]
	cmp r6, r1
	bne _0802670A
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0xA8
	adds r0, r4
	movs r1, 0x4
	strb r1, [r0]
	mov r0, r12
	ldr r1, [r0]
	lsls r0, r4, 4
	subs r0, r4
	lsls r0, 2
	adds r1, r0
	ldr r0, =0x000031d4
	adds r1, r0
	movs r0, 0x1
	strb r0, [r1]
_0802670A:
	movs r0, 0
_0802670C:
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8026634

	thumb_func_start sub_802671C
sub_802671C: @ 802671C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r2, =gUnknown_02022C98
	ldr r4, [r2]
	adds r0, r4, 0
	adds r0, 0x44
	ldrb r1, [r0]
	adds r0, 0x4
	ldrb r0, [r0]
	mov r9, r0
	movs r3, 0
	mov r10, r3
	movs r5, 0x90
	lsls r5, 1
	adds r0, r4, r5
	str r3, [r0]
	adds r5, r1, 0
	mov r0, r9
	subs r0, 0x1
	cmp r5, r0
	blt _0802674E
	b _08026974
_0802674E:
	mov r8, r2
_08026750:
	mov r0, r8
	ldr r4, [r0]
	adds r0, r4, 0
	adds r0, 0xC4
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _08026762
	b _0802686C
_08026762:
	movs r1, 0x90
	lsls r1, 1
	adds r0, r4, r1
	movs r2, 0x1
	str r2, [r0]
	ldr r1, =0x000032eb
	adds r0, r4, r1
	adds r6, r0, r5
	ldrb r0, [r6]
	cmp r0, 0x9
	bls _080267FC
	movs r7, 0
	movs r0, 0xA
	strb r0, [r6]
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xC4
	adds r0, r5
	movs r1, 0x3
	strb r1, [r0]
	mov r1, r8
	ldr r0, [r1]
	movs r6, 0xA4
	lsls r6, 1
	adds r0, r6
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, 0
	bne _080267AC
	strb r2, [r1]
	ldr r2, =0x000032e0
	adds r0, r4, r2
	adds r0, r5
	ldrb r0, [r0]
	adds r0, 0x4A
	bl audio_play
_080267AC:
	mov r0, r8
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x40
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _080267C2
	mov r2, r10
	cmp r2, 0x1
	beq _080267C2
	b _08026964
_080267C2:
	movs r0, 0x1
	mov r10, r0
	adds r0, r1, r6
	adds r0, r5
	strb r7, [r0]
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, 0
	adds r1, 0x40
	ldrb r0, [r1]
	cmp r0, 0x9
	bhi _080267DE
	adds r0, 0x1
	strb r0, [r1]
_080267DE:
	movs r0, 0x3
	adds r1, r5, 0
	movs r2, 0
	bl sub_8026F1C
	movs r0, 0
	bl sub_8027234
	b _08026964
	.pool
_080267FC:
	adds r0, r5, 0
	bl sub_8026D8C
	mov r2, r8
	ldr r7, [r2]
	lsls r0, 24
	lsrs r0, 24
	adds r1, r7, 0
	adds r1, 0x90
	adds r1, r0
	ldrb r0, [r1]
	movs r1, 0x7
	bl __udivsi3
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	bls _08026822
	movs r3, 0x2
_08026822:
	ldr r2, =gUnknown_082F7A88
	ldr r0, =0x000032e0
	adds r1, r4, r0
	adds r1, r5
	lsls r0, r3, 1
	adds r0, r3
	ldrb r1, [r1]
	adds r0, r1
	adds r0, r2
	ldrb r2, [r0]
	adds r1, r7, 0
	adds r1, 0xD0
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	movs r3, 0
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r2
	bcc _0802685C
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xD0
	adds r0, r5
	strb r3, [r0]
_0802685C:
	bl sub_8026324
	b _08026964
	.pool
_0802686C:
	cmp r0, 0x2
	bne _080268F4
	movs r2, 0x90
	lsls r2, 1
	adds r0, r4, r2
	movs r6, 0x1
	str r6, [r0]
	adds r1, r4, 0
	adds r1, 0xDC
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	movs r3, 0
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bls _08026964
	mov r0, r8
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0xB8
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r2, r0
	ldr r1, =0x000031d0
	adds r2, r1
	strb r3, [r2]
	mov r2, r8
	ldr r0, [r2]
	adds r0, 0xDC
	adds r0, r5
	strb r3, [r0]
	ldr r0, [r2]
	adds r0, 0xD0
	adds r0, r5
	strb r3, [r0]
	ldr r0, [r2]
	adds r0, 0xC4
	adds r0, r5
	strb r3, [r0]
	ldr r1, =0x000032eb
	adds r0, r4, r1
	adds r0, r5
	strb r6, [r0]
	adds r0, r5, 0
	bl sub_8026D8C
	lsls r0, 24
	lsrs r0, 24
	adds r1, r5, 0
	bl sub_8026DB0
	ldr r2, =0x000032e0
	adds r1, r4, r2
	adds r1, r5
	strb r0, [r1]
	b _08026964
	.pool
_080268F4:
	cmp r0, 0x3
	bne _08026964
	adds r1, r4, 0
	adds r1, 0xDC
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bls _08026964
	mov r0, r8
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x40
	ldrb r0, [r0]
	cmp r0, 0x9
	bhi _08026964
	adds r0, r1, 0
	adds r0, 0xDC
	adds r0, r5
	strb r2, [r0]
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xD0
	adds r0, r5
	strb r2, [r0]
	ldr r0, [r1]
	adds r0, 0xC4
	adds r0, r5
	strb r2, [r0]
	ldr r2, =0x000032eb
	adds r0, r4, r2
	adds r0, r5
	movs r1, 0x1
	strb r1, [r0]
	mov r0, r8
	ldr r1, [r0]
	adds r1, 0xE8
	adds r1, r5
	subs r2, 0xB
	adds r4, r2
	adds r4, r5
	ldrb r0, [r4]
	strb r0, [r1]
	adds r0, r5, 0
	bl sub_8026D8C
	lsls r0, 24
	lsrs r0, 24
	adds r1, r5, 0
	bl sub_8026DB0
	strb r0, [r4]
_08026964:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r9
	subs r0, 0x1
	cmp r5, r0
	bge _08026974
	b _08026750
_08026974:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_802671C

	thumb_func_start sub_8026988
sub_8026988: @ 8026988
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x44
	adds r0, 0x48
	ldrb r0, [r0]
	mov r8, r0
	ldrb r6, [r1]
	cmp r6, r8
	bcs _08026A7A
	ldr r0, =gUnknown_082F449C
	mov r9, r0
_080269A8:
	ldr r0, =gUnknown_02022C98
	ldr r3, [r0]
	adds r0, r3, 0
	adds r0, 0x28
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	ldr r2, =0x000031a0
	adds r0, r2
	adds r7, r3, r0
	movs r0, 0xB
	adds r2, r1, 0
	muls r2, r0
	adds r2, r6, r2
	adds r3, 0x24
	ldrb r1, [r3]
	subs r1, 0x1
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 3
	subs r0, r1
	adds r2, r0
	add r2, r9
	ldrb r4, [r2]
	adds r0, r7, 0
	adds r0, 0x1F
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080269FC
	adds r0, r6, 0
	movs r1, 0
	bl sub_8028BF8
	b _08026A04
	.pool
_080269FC:
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_8028BF8
_08026A04:
	adds r0, r7, 0
	adds r0, 0x1F
	adds r5, r0, r4
	ldrb r0, [r5]
	cmp r0, 0x9
	bls _08026A30
	adds r0, r7, 0
	adds r0, 0x14
	adds r0, r4
	ldrb r1, [r0]
	adds r1, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8028CA4
	ldrb r1, [r5]
	lsls r1, 25
	movs r0, 0xFF
	lsls r0, 24
	adds r1, r0
	b _08026A52
_08026A30:
	adds r0, r7, 0
	adds r0, 0x14
	adds r3, r0, r4
	ldrb r0, [r3]
	cmp r0, 0x3
	bne _08026A5C
	movs r0, 0x7
	strb r0, [r5]
	adds r0, r6, 0
	movs r1, 0x6
	bl sub_8028CA4
	ldrb r1, [r5]
	lsls r1, 25
	movs r2, 0xFF
	lsls r2, 24
	adds r1, r2
_08026A52:
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8028C7C
	b _08026A70
_08026A5C:
	ldrb r1, [r3]
	adds r0, r6, 0
	bl sub_8028CA4
	ldrb r1, [r5]
	lsls r1, 25
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8028C7C
_08026A70:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r8
	bcc _080269A8
_08026A7A:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8026988

	thumb_func_start sub_8026A88
sub_8026A88: @ 8026A88
	push {r4-r6,lr}
	ldr r1, =gUnknown_02022C98
	ldr r0, [r1]
	adds r0, 0x24
	ldrb r5, [r0]
	movs r4, 0
	cmp r4, r5
	bcs _08026ABA
	adds r6, r1, 0
_08026A9A:
	lsls r0, r4, 4
	subs r0, r4
	lsls r0, 2
	ldr r1, [r6]
	adds r0, r1
	ldr r1, =0x000031cc
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_80286B4
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08026A9A
_08026ABA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8026A88

	thumb_func_start sub_8026AC8
sub_8026AC8: @ 8026AC8
	push {r4,r5,lr}
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	adds r0, 0x24
	ldrb r5, [r0]
	movs r4, 0
	cmp r4, r5
	bcs _08026AEA
_08026AD8:
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_80286B4
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08026AD8
_08026AEA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8026AC8

	thumb_func_start sub_8026AF4
sub_8026AF4: @ 8026AF4
	push {lr}
	bl sub_8026988
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	adds r0, 0x40
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _08026B10
	bl sub_8026AC8
	b _08026B14
	.pool
_08026B10:
	bl sub_8026A88
_08026B14:
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	adds r0, 0x40
	ldrb r0, [r0]
	bl sub_80288D4
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8026AF4

	thumb_func_start sub_8026B28
sub_8026B28: @ 8026B28
	push {lr}
	bl sub_8026988
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	adds r0, 0x40
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _08026B44
	bl sub_8026AC8
	b _08026B48
	.pool
_08026B44:
	bl sub_8026A88
_08026B48:
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	adds r0, 0x40
	ldrb r0, [r0]
	bl sub_80288D4
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8026B28

	thumb_func_start sub_8026B5C
sub_8026B5C: @ 8026B5C
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x4
	bhi _08026BB4
	lsls r0, 2
	ldr r1, =_08026B78
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08026B78:
	.4byte _08026B8C
	.4byte _08026B94
	.4byte _08026B9C
	.4byte _08026BA4
	.4byte _08026BAC
_08026B8C:
	movs r0, 0x4
	strb r0, [r3]
	movs r0, 0x7
	b _08026BB2
_08026B94:
	movs r0, 0x3
	strb r0, [r3]
	movs r0, 0x8
	b _08026BB2
_08026B9C:
	movs r0, 0x2
	strb r0, [r3]
	movs r0, 0x9
	b _08026BB2
_08026BA4:
	movs r0, 0x1
	strb r0, [r3]
	movs r0, 0xA
	b _08026BB2
_08026BAC:
	movs r0, 0
	strb r0, [r3]
	movs r0, 0xB
_08026BB2:
	strb r0, [r2]
_08026BB4:
	pop {r0}
	bx r0
	thumb_func_end sub_8026B5C

	thumb_func_start sub_8026BB8
sub_8026BB8: @ 8026BB8
	push {r4-r6,lr}
	ldr r1, =gUnknown_02022C98
	ldr r0, [r1]
	adds r0, 0x24
	ldrb r5, [r0]
	movs r4, 0x1
	cmp r4, r5
	bcs _08026C1E
	adds r6, r1, 0
_08026BCA:
	ldr r0, [r6]
	movs r1, 0xAC
	lsls r1, 1
	adds r0, r1
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _08026BEC
	adds r0, r4, 0
	bl sub_8027DFC
	ldr r1, [r6]
	movs r2, 0xAC
	lsls r2, 1
	adds r1, r2
	adds r1, r4
	strb r0, [r1]
_08026BEC:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08026BCA
	cmp r4, r5
	bcs _08026C1E
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	movs r2, 0xAC
	lsls r2, 1
	adds r1, r0, r2
_08026C04:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _08026C14
	movs r0, 0
	b _08026C20
	.pool
_08026C14:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08026C04
_08026C1E:
	movs r0, 0x1
_08026C20:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8026BB8

	thumb_func_start sub_8026C28
sub_8026C28: @ 8026C28
	push {r4,lr}
	movs r1, 0
	ldr r4, =gUnknown_02022C98
	movs r3, 0xAC
	lsls r3, 1
	movs r2, 0
_08026C34:
	ldr r0, [r4]
	adds r0, r3
	adds r0, r1
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _08026C34
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8026C28

	thumb_func_start sub_8026C50
sub_8026C50: @ 8026C50
	push {r4,lr}
	ldr r3, =gUnknown_02022C98
	ldr r1, [r3]
	adds r2, r1, 0
	adds r2, 0x40
	ldrb r0, [r2]
	cmp r0, 0x9
	bls _08026C88
	movs r4, 0x90
	lsls r4, 1
	adds r0, r1, r4
	ldr r0, [r0]
	cmp r0, 0
	bne _08026C88
	movs r0, 0xA
	strb r0, [r2]
	ldr r0, [r3]
	movs r1, 0x96
	lsls r1, 1
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _08026C88
	movs r0, 0x1
	b _08026C8A
	.pool
_08026C88:
	movs r0, 0
_08026C8A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8026C50

	thumb_func_start sub_8026C90
sub_8026C90: @ 8026C90
	push {r4-r6,lr}
	ldr r4, =gUnknown_02022C98
	ldr r1, [r4]
	adds r2, r1, 0
	adds r2, 0x40
	ldrb r0, [r2]
	cmp r0, 0x9
	bls _08026D14
	adds r0, r1, 0
	adds r0, 0x44
	ldrb r3, [r0]
	adds r0, 0x4
	ldrb r5, [r0]
	movs r0, 0xA
	strb r0, [r2]
	ldr r4, [r4]
	mov r12, r4
	movs r0, 0x96
	lsls r0, 1
	add r0, r12
	ldr r0, [r0]
	cmp r0, 0
	beq _08026D14
	adds r4, r3, 0
	cmp r4, r5
	bcs _08026D04
	mov r0, r12
	adds r0, 0x28
	ldrb r3, [r0]
	lsls r1, r3, 4
	subs r1, r3
	lsls r1, 2
	ldr r6, =gUnknown_082F449C
	subs r0, 0x4
	ldrb r2, [r0]
	subs r2, 0x1
	add r1, r12
	movs r0, 0xB
	muls r3, r0
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 3
	subs r2, r0, r2
	ldr r0, =0x000031bf
	adds r1, r0
_08026CEA:
	adds r0, r4, r3
	adds r0, r2
	adds r0, r6
	ldrb r0, [r0]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0xA
	bne _08026D14
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08026CEA
_08026D04:
	movs r0, 0x1
	b _08026D16
	.pool
_08026D14:
	movs r0, 0
_08026D16:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8026C90

	thumb_func_start sub_8026D1C
sub_8026D1C: @ 8026D1C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, =gUnknown_082F7A9C
	mov r8, r0
	ldr r0, =gUnknown_02022C98
	ldr r6, [r0]
	adds r0, r6, 0
	adds r0, 0x90
	adds r0, r5
	mov r9, r0
	ldrb r7, [r0]
	adds r0, r7, 0
	movs r1, 0x7
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	add r4, r8
	adds r0, r7, 0
	movs r1, 0x7
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldrb r4, [r4]
	adds r0, r4
	lsls r0, 24
	lsls r5, 1
	adds r6, 0x86
	adds r6, r5
	ldrh r1, [r6]
	lsrs r0, 24
	cmp r1, r0
	bcc _08026D76
	adds r0, r7, 0x1
	mov r1, r9
	strb r0, [r1]
_08026D76:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8026D1C

	thumb_func_start sub_8026D8C
sub_8026D8C: @ 8026D8C
	lsls r0, 24
	lsrs r0, 24
	ldr r3, =gUnknown_082F4648
	ldr r1, =gUnknown_02022C98
	ldr r1, [r1]
	adds r1, 0x24
	ldrb r1, [r1]
	subs r1, 0x1
	movs r2, 0xB
	muls r1, r2
	adds r0, r1
	adds r0, r3
	ldrb r0, [r0]
	bx lr
	.pool
	thumb_func_end sub_8026D8C

	thumb_func_start sub_8026DB0
sub_8026DB0: @ 8026DB0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r4, =gUnknown_02022C98
	ldr r1, [r4]
	adds r1, 0x24
	ldrb r2, [r1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, =gUnknown_082F45FA
	lsls r1, r0, 1
	adds r1, r0
	lsls r0, r2, 4
	subs r0, r2
	adds r1, r0
	adds r0, r1, r3
	ldrb r0, [r0]
	mov r12, r0
	adds r0, r3, 0x1
	adds r0, r1, r0
	ldrb r7, [r0]
	adds r3, 0x2
	adds r1, r3
	ldrb r1, [r1]
	mov r8, r1
	movs r3, 0
	ldr r1, =gUnknown_082F467F
	lsls r0, r2, 2
	adds r2, r0, r2
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08026E18
	adds r6, r1, 0
_08026DFE:
	adds r0, r3, r2
	adds r0, r6
	ldrb r0, [r0]
	cmp r5, r0
	beq _08026E3C
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r3, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08026DFE
_08026E18:
	ldr r0, [r4]
	adds r0, 0x90
	mov r1, r12
	adds r2, r0, r1
	adds r1, r0, r7
	ldrb r0, [r2]
	ldrb r3, [r1]
	cmp r0, r3
	bls _08026E46
	adds r1, r0, 0
	b _08026E48
	.pool
_08026E3C:
	ldr r0, [r4]
	adds r0, 0x90
	adds r0, r7
	ldrb r0, [r0]
	b _08026E5A
_08026E46:
	ldrb r1, [r1]
_08026E48:
	ldr r0, [r4]
	adds r0, 0x90
	mov r2, r8
	adds r4, r0, r2
	ldrb r0, [r4]
	cmp r0, r1
	bls _08026E58
	adds r1, r0, 0
_08026E58:
	adds r0, r1, 0
_08026E5A:
	adds r1, r5, 0
	bl sub_8026E70
	lsls r0, 24
	lsrs r0, 24
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8026DB0

	thumb_func_start sub_8026E70
sub_8026E70: @ 8026E70
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, =gUnknown_02022C98
	ldr r2, [r2]
	adds r2, 0xE8
	adds r2, r1
	ldrb r4, [r2]
	movs r1, 0x7
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bhi _08026EDE
	lsls r0, 2
	ldr r1, =_08026EA4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08026EA4:
	.4byte _08026EDE
	.4byte _08026ED6
	.4byte _08026EE2
	.4byte _08026EC0
	.4byte _08026EC6
	.4byte _08026ECC
	.4byte _08026ED2
_08026EC0:
	cmp r4, 0
	beq _08026ED6
	b _08026EDE
_08026EC6:
	cmp r4, 0
	beq _08026EE2
	b _08026EDE
_08026ECC:
	cmp r4, 0x2
	beq _08026ED6
	b _08026EE2
_08026ED2:
	cmp r4, 0
	bne _08026EDA
_08026ED6:
	movs r0, 0x1
	b _08026EE4
_08026EDA:
	cmp r4, 0x1
	beq _08026EE2
_08026EDE:
	movs r0, 0
	b _08026EE4
_08026EE2:
	movs r0, 0x2
_08026EE4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8026E70

	thumb_func_start sub_8026EEC
sub_8026EEC: @ 8026EEC
	push {r4-r6,lr}
	movs r6, 0
	movs r5, 0
	adds r4, r0, 0
	b _08026EFE
_08026EF6:
	ldrh r0, [r4, 0x6]
	adds r6, r0
	adds r4, 0xC
	adds r5, 0x1
_08026EFE:
	bl sub_8009FCC
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	blt _08026EF6
	cmp r6, 0xA
	bgt _08026F12
	movs r0, 0
	b _08026F14
_08026F12:
	movs r0, 0x1
_08026F14:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8026EEC

	thumb_func_start sub_8026F1C
sub_8026F1C: @ 8026F1C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r6, =gUnknown_02022C98
	ldr r1, [r6]
	adds r0, r1, 0
	adds r0, 0x24
	ldrb r5, [r0]
	cmp r3, 0
	bge _08026F3A
	b _0802722C
_08026F3A:
	cmp r3, 0x2
	ble _08026F48
	cmp r3, 0x3
	beq _08026F78
	b _0802722C
	.pool
_08026F48:
	ldr r3, =0x000031b4
	adds r0, r1, r3
	adds r0, r4
	ldrb r4, [r0]
	lsls r4, 1
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r4, r0
	adds r0, r1, 0
	adds r0, 0x4A
	adds r0, r4
	ldrh r0, [r0]
	ldr r1, =0x00004e20
	bl sub_8027A28
	ldr r1, [r6]
	adds r1, 0x4A
	adds r1, r4
	b _0802722A
	.pool
_08026F78:
	adds r0, r1, 0
	adds r0, 0x4A
	bl sub_8026EEC
	cmp r0, 0
	beq _08026F86
	b _0802722C
_08026F86:
	cmp r5, 0x3
	bne _08026F8C
	b _08027154
_08026F8C:
	cmp r5, 0x3
	bgt _08026F98
	cmp r5, 0x2
	bne _08026F96
	b _080271E8
_08026F96:
	b _0802722C
_08026F98:
	cmp r5, 0x4
	bne _08026F9E
	b _08027090
_08026F9E:
	cmp r5, 0x5
	beq _08026FA4
	b _0802722C
_08026FA4:
	cmp r4, 0x9
	bls _08026FAA
	b _0802722C
_08026FAA:
	lsls r0, r4, 2
	ldr r1, =_08026FB8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08026FB8:
	.4byte _08026FE0
	.4byte _08026FF8
	.4byte _08027004
	.4byte _0802701C
	.4byte _08027028
	.4byte _08027040
	.4byte _0802704C
	.4byte _08027060
	.4byte _0802706C
	.4byte _08027084
_08026FE0:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0x68
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x74
	b _08027226
	.pool
_08026FF8:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r1, 0x74
	b _08027226
	.pool
_08027004:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0x74
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x80
	b _08027226
	.pool
_0802701C:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r1, 0x80
	b _08027226
	.pool
_08027028:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0x80
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x50
	b _08027226
	.pool
_08027040:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r1, 0x50
	b _08027226
	.pool
_0802704C:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0x50
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	b _08027224
	.pool
_08027060:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	b _08027224
	.pool
_0802706C:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0x5C
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x68
	b _08027226
	.pool
_08027084:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r1, 0x68
	b _08027226
	.pool
_08027090:
	subs r0, r4, 0x1
	cmp r0, 0x7
	bls _08027098
	b _0802722C
_08027098:
	lsls r0, 2
	ldr r1, =_080270A8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_080270A8:
	.4byte _080270C8
	.4byte _080270E0
	.4byte _080270EC
	.4byte _08027104
	.4byte _08027110
	.4byte _08027124
	.4byte _08027130
	.4byte _08027148
_080270C8:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0x68
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x74
	b _08027226
	.pool
_080270E0:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r1, 0x74
	b _08027226
	.pool
_080270EC:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0x74
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x50
	b _08027226
	.pool
_08027104:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r1, 0x50
	b _08027226
	.pool
_08027110:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0x50
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	b _08027224
	.pool
_08027124:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	b _08027224
	.pool
_08027130:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0x5C
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x68
	b _08027226
	.pool
_08027148:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r1, 0x68
	b _08027226
	.pool
_08027154:
	subs r0, r4, 0x2
	cmp r0, 0x5
	bhi _0802722C
	lsls r0, 2
	ldr r1, =_08027168
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08027168:
	.4byte _08027180
	.4byte _08027198
	.4byte _080271A4
	.4byte _080271BC
	.4byte _080271C8
	.4byte _080271DC
_08027180:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0x5C
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x68
	b _08027226
	.pool
_08027198:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r1, 0x68
	b _08027226
	.pool
_080271A4:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0x68
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x50
	b _08027226
	.pool
_080271BC:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r1, 0x50
	b _08027226
	.pool
_080271C8:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0x50
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	b _08027224
	.pool
_080271DC:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	b _08027224
	.pool
_080271E8:
	cmp r4, 0x4
	beq _0802720E
	cmp r4, 0x4
	bgt _080271F6
	cmp r4, 0x3
	beq _08027200
	b _0802722C
_080271F6:
	cmp r4, 0x5
	beq _08027214
	cmp r4, 0x6
	beq _08027222
	b _0802722C
_08027200:
	ldr r1, [r6]
	adds r2, r1, 0
	adds r2, 0x50
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	b _08027224
_0802720E:
	ldr r1, [r6]
	adds r1, 0x50
	b _08027226
_08027214:
	ldr r1, [r6]
	adds r2, r1, 0
	adds r2, 0x50
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	b _08027224
_08027222:
	ldr r1, [r6]
_08027224:
	adds r1, 0x5C
_08027226:
	ldrh r0, [r1]
	adds r0, 0x1
_0802722A:
	strh r0, [r1]
_0802722C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8026F1C

	thumb_func_start sub_8027234
sub_8027234: @ 8027234
	push {r4,r5,lr}
	adds r1, r0, 0
	ldr r4, =gUnknown_02022C98
	ldr r3, [r4]
	adds r0, r3, 0
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r0, 0x5
	bne _0802729E
	cmp r1, 0x1
	bne _08027280
	movs r5, 0x89
	lsls r5, 1
	adds r1, r3, r5
	ldrh r0, [r1]
	adds r2, r0, 0x1
	strh r2, [r1]
	movs r0, 0x8A
	lsls r0, 1
	adds r1, r3, r0
	lsls r0, r2, 16
	lsrs r0, 16
	ldrh r3, [r1]
	cmp r0, r3
	bls _08027268
	strh r2, [r1]
_08027268:
	ldr r0, [r4]
	adds r2, r0, r5
	ldrh r0, [r2]
	ldr r1, =0x0000270f
	cmp r0, r1
	bls _0802729E
	strh r1, [r2]
	b _0802729E
	.pool
_08027280:
	movs r2, 0x89
	lsls r2, 1
	adds r0, r3, r2
	movs r5, 0x8A
	lsls r5, 1
	adds r1, r3, r5
	ldrh r0, [r0]
	ldrh r3, [r1]
	cmp r0, r3
	bls _08027296
	strh r0, [r1]
_08027296:
	ldr r0, [r4]
	adds r0, r2
	movs r1, 0
	strh r1, [r0]
_0802729E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8027234

	thumb_func_start sub_80272A4
sub_80272A4: @ 80272A4
	push {r4,r5,lr}
	movs r3, 0
	ldr r2, =gUnknown_02022C98
	ldr r0, [r2]
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r3, r0
	bcs _080272DC
	adds r5, r2, 0
	movs r4, 0x8A
	lsls r4, 1
_080272BA:
	ldr r2, [r5]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r1, r2, 0
	adds r1, 0x54
	adds r1, r0
	adds r0, r2, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r2, 0x24
	ldrb r2, [r2]
	cmp r3, r2
	bcc _080272BA
_080272DC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80272A4

	thumb_func_start sub_80272E8
sub_80272E8: @ 80272E8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r5, 0
	ldr r7, =gUnknown_02022C98
	movs r4, 0
	ldr r0, =0x000031bf
	mov r10, r0
_080272FC:
	movs r2, 0
	lsls r6, r5, 4
	lsls r1, r5, 1
	mov r8, r1
	lsls r0, r5, 3
	mov r12, r0
	adds r1, r5, 0x1
	mov r9, r1
	subs r0, r6, r5
	lsls r3, r0, 2
_08027310:
	ldr r0, [r7]
	adds r1, r2, r3
	add r0, r10
	adds r0, r1
	strb r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xA
	bls _08027310
	ldr r0, [r7]
	subs r1, r6, r5
	lsls r1, 2
	adds r0, r1
	ldr r2, =0x000031cc
	adds r0, r2
	strb r4, [r0]
	ldr r0, [r7]
	adds r0, r1
	ldr r1, =0x000031d0
	adds r0, r1
	strb r4, [r0]
	ldr r0, [r7]
	adds r0, 0x90
	adds r0, r5
	strb r4, [r0]
	ldr r1, [r7]
	adds r0, r1, 0
	adds r0, 0x86
	add r0, r8
	strh r4, [r0]
	add r1, r12
	ldr r2, =0x00003308
	adds r1, r2
	strb r4, [r1]
	ldr r2, [r7]
	ldr r1, =0x0000330c
	adds r0, r2, r1
	add r0, r12
	str r4, [r0]
	mov r0, r8
	adds r1, r0, r5
	lsls r1, 2
	adds r0, r2, 0
	adds r0, 0x4A
	adds r0, r1
	strh r4, [r0]
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r1
	strh r4, [r0]
	adds r0, r2, 0
	adds r0, 0x4E
	adds r0, r1
	strh r4, [r0]
	adds r0, r2, 0
	adds r0, 0x50
	adds r0, r1
	strh r4, [r0]
	adds r0, r2, 0
	adds r0, 0x52
	adds r0, r1
	strh r4, [r0]
	adds r0, r2, 0
	adds r0, 0x54
	adds r0, r1
	strh r4, [r0]
	mov r1, r9
	lsls r0, r1, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _080272FC
	ldr r2, =gUnknown_02022C98
	ldr r0, [r2]
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r1
	movs r2, 0
	strb r2, [r0]
	ldr r1, =gUnknown_02022C98
	ldr r0, [r1]
	movs r1, 0x89
	lsls r1, 1
	adds r3, r0, r1
	movs r1, 0
	strh r2, [r3]
	adds r0, 0x40
	strb r1, [r0]
	bl sub_8026A88
	bl sub_8026988
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80272E8

	thumb_func_start sub_80273F0
sub_80273F0: @ 80273F0
	push {r4,r5,lr}
	movs r4, 0
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r0, 0x4
	beq _0802740C
	cmp r0, 0x5
	beq _08027410
	b _08027412
	.pool
_0802740C:
	movs r4, 0x1
	b _08027412
_08027410:
	movs r4, 0x2
_08027412:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	lsls r1, r4, 2
	ldr r5, =gUnknown_02022C98
	ldr r2, =gUnknown_082F7AA4
	adds r1, r4
	lsls r1, 1
	adds r0, r1
	adds r0, r2
	ldrb r2, [r0]
_08027436:
	ldr r1, [r5]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r1, 0x52
	adds r1, r0
	strh r2, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x4
	bls _08027436
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80273F0

	thumb_func_start sub_802745C
sub_802745C: @ 802745C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, =gUnknown_02022C98
	ldr r2, [r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r0, r2, 0
	adds r0, 0x4A
	adds r0, r1
	ldrh r3, [r0]
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r1
	ldrh r0, [r0]
	adds r2, 0x4E
	adds r2, r1
	adds r3, r0
	ldrh r2, [r2]
	adds r0, r3, r2
	ldr r1, =0x0000270f
	cmp r0, r1
	bls _0802748E
	adds r0, r1, 0
_0802748E:
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_802745C

	thumb_func_start sub_802749C
sub_802749C: @ 802749C
	push {r4-r6,lr}
	ldr r5, =gUnknown_02022C98
	ldr r0, [r5]
	adds r0, 0x28
	ldrb r0, [r0]
	bl sub_802745C
	ldr r1, =0x0000270f
	bl sub_8027A38
	adds r4, r0, 0
	ldr r0, [r5]
	adds r0, 0x28
	ldrb r0, [r0]
	bl sub_80276C0
	ldr r1, =0x000f4236
	bl sub_8027A38
	adds r2, r0, 0
	ldr r3, =gSaveBlock2Ptr
	ldr r0, [r3]
	movs r6, 0x83
	lsls r6, 2
	adds r1, r0, r6
	ldr r0, [r1]
	cmp r0, r2
	bcs _080274D6
	str r2, [r1]
_080274D6:
	ldr r0, [r3]
	movs r2, 0x84
	lsls r2, 2
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, r4
	bcs _080274E6
	strh r4, [r1]
_080274E6:
	ldr r0, [r3]
	ldr r6, =0x00000212
	adds r2, r0, r6
	ldr r0, [r5]
	movs r1, 0x8A
	lsls r1, 1
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	cmp r0, r1
	bcs _080274FE
	strh r1, [r2]
_080274FE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_802749C

	thumb_func_start sub_8027518
sub_8027518: @ 8027518
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, =gUnknown_02022C98
	ldr r0, [r1]
	adds r0, 0x9B
	ldrb r6, [r0]
	movs r3, 0x3
	adds r5, r1, 0
	adds r4, r5, 0
_0802752C:
	ldr r0, [r4]
	adds r0, 0x98
	adds r2, r0, r3
	subs r1, r3, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r1, 24
	lsrs r3, r1, 24
	cmp r3, 0
	bne _0802752C
	ldr r0, [r5]
	adds r0, 0x98
	strb r7, [r0]
	adds r0, r6, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8027518

	thumb_func_start sub_8027554
sub_8027554: @ 8027554
	push {r4,lr}
	ldr r4, =gUnknown_02022C98
	ldr r3, [r4]
	adds r0, r3, 0
	adds r0, 0x28
	ldrb r1, [r0]
	adds r0, 0x88
	adds r2, r0, r1
	ldrb r0, [r2]
	cmp r0, 0
	bne _080275FC
	ldr r0, =gMain
	ldrh r2, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	beq _08027594
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r0, r3, r0
	ldr r1, =0x000031cc
	adds r0, r1
	movs r1, 0x2
	b _080275CA
	.pool
_08027594:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _080275B0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r0, r3, r0
	ldr r1, =0x000031cc
	adds r0, r1
	movs r1, 0x3
	b _080275CA
	.pool
_080275B0:
	movs r0, 0x10
	ands r0, r2
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _080275E8
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r0, r3, r0
	ldr r1, =0x000031cc
	adds r0, r1
	movs r1, 0x1
_080275CA:
	strb r1, [r0]
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x28
	adds r0, 0xB0
	ldrb r1, [r1]
	adds r0, r1
	movs r1, 0x6
	strb r1, [r0]
	movs r0, 0xD4
	bl audio_play
	b _08027600
	.pool
_080275E8:
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r0, r3, r0
	ldr r1, =0x000031cc
	adds r0, r1
	strb r2, [r0]
	b _08027600
	.pool
_080275FC:
	subs r0, 0x1
	strb r0, [r2]
_08027600:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8027554

	thumb_func_start sub_8027608
sub_8027608: @ 8027608
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x28
	ldrb r2, [r0]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 2
	adds r1, r0
	ldr r0, =0x000031cc
	adds r1, r0
	movs r0, 0
	strb r0, [r1]
	bx lr
	.pool
	thumb_func_end sub_8027608

	thumb_func_start sub_802762C
sub_802762C: @ 802762C
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x28
	ldrb r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, 0x52
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x85
	lsls r0, 16
	lsrs r0, 16
	bx lr
	.pool
	thumb_func_end sub_802762C

	thumb_func_start sub_8027650
sub_8027650: @ 8027650
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	adds r0, 0x24
	ldrb r0, [r0]
	bx lr
	.pool
	thumb_func_end sub_8027650

	thumb_func_start sub_8027660
sub_8027660: @ 8027660
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, =gUnknown_03003124
	ldrb r0, [r0]
	cmp r0, 0
	bne _0802768C
	ldr r0, =gUnknown_02022C98
	lsls r1, r2, 4
	subs r1, r2
	lsls r1, 2
	ldr r2, =0x000031a0
	adds r1, r2
	ldr r0, [r0]
	b _08027694
	.pool
_0802768C:
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	ldr r1, =gUnknown_020229F0
_08027694:
	adds r0, r1
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8027660

	thumb_func_start sub_80276A0
sub_80276A0: @ 80276A0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r2, =gUnknown_02022C98
	ldr r3, [r2]
	lsrs r1, 23
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	adds r1, r2
	adds r3, 0x4A
	adds r3, r1
	ldrh r0, [r3]
	bx lr
	.pool
	thumb_func_end sub_80276A0

	thumb_func_start sub_80276C0
sub_80276C0: @ 80276C0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	movs r3, 0
	ldr r0, =gUnknown_02022C98
	mov r9, r0
	ldr r2, =gUnknown_082F7B24
	mov r10, r2
	ldr r2, [r0]
	lsls r1, r4, 1
	adds r0, r1, r4
	lsls r0, 2
	str r0, [sp]
	adds r6, r2, 0
	adds r6, 0x4A
	mov r12, r1
	mov r8, r10
_080276EE:
	lsls r1, r3, 1
	ldr r7, [sp]
	adds r0, r1, r7
	adds r0, r6, r0
	ldrh r2, [r0]
	add r1, r8
	movs r7, 0
	ldrsh r0, [r1, r7]
	muls r0, r2
	adds r5, r0
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x2
	bls _080276EE
	mov r0, r9
	ldr r1, [r0]
	mov r2, r12
	adds r0, r2, r4
	lsls r0, 2
	adds r1, 0x50
	adds r1, r0
	ldrh r1, [r1]
	mov r3, r10
	movs r7, 0x6
	ldrsh r0, [r3, r7]
	muls r0, r1
	cmp r5, r0
	bls _08027734
	subs r0, r5, r0
	b _08027736
	.pool
_08027734:
	movs r0, 0
_08027736:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80276C0

	thumb_func_start sub_8027748
sub_8027748: @ 8027748
	push {r4-r6,lr}
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	adds r0, 0x24
	ldrb r6, [r0]
	movs r0, 0
	bl sub_80276C0
	adds r5, r0, 0
	movs r4, 0x1
	cmp r4, r6
	bcs _08027776
_08027760:
	adds r0, r4, 0
	bl sub_80276C0
	cmp r0, r5
	bls _0802776C
	adds r5, r0, 0
_0802776C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _08027760
_08027776:
	ldr r1, =0x000f4236
	adds r0, r5, 0
	bl sub_8027A38
	pop {r4-r6}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8027748

	thumb_func_start sub_802778C
sub_802778C: @ 802778C
	push {r4,r5,lr}
	lsls r0, 24
	ldr r1, =gUnknown_02022C98
	ldr r2, [r1]
	adds r1, r2, 0
	adds r1, 0x24
	ldrb r5, [r1]
	lsrs r4, r0, 23
	adds r2, 0x4A
	adds r0, r2, r4
	ldrh r3, [r0]
	movs r1, 0
	cmp r1, r5
	bcs _080277C4
_080277A8:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, r3
	bls _080277BA
	adds r3, r0, 0
_080277BA:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r5
	bcc _080277A8
_080277C4:
	adds r0, r3, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_802778C

	thumb_func_start sub_80277D0
sub_80277D0: @ 80277D0
	push {r4-r7,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0x1
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	adds r0, 0x24
	ldrb r5, [r0]
	movs r4, 0
	cmp r4, r5
	bcs _080277FE
_080277E8:
	adds r0, r4, 0
	bl sub_80276C0
	lsls r1, r4, 2
	add r1, sp
	str r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _080277E8
_080277FE:
	lsls r7, 2
	mov r12, r7
	cmp r6, 0
	beq _08027838
	subs r7, r5, 0x1
_08027808:
	movs r6, 0
	movs r4, 0
	cmp r6, r7
	bge _08027834
	adds r5, r7, 0
_08027812:
	lsls r0, r4, 2
	mov r2, sp
	adds r1, r2, r0
	adds r4, 0x1
	lsls r0, r4, 2
	adds r3, r2, r0
	ldr r0, [r1]
	ldr r2, [r3]
	cmp r0, r2
	bcs _0802782C
	str r2, [r1]
	str r0, [r3]
	movs r6, 0x1
_0802782C:
	lsls r0, r4, 24
	lsrs r4, r0, 24
	cmp r4, r5
	blt _08027812
_08027834:
	cmp r6, 0
	bne _08027808
_08027838:
	mov r0, sp
	add r0, r12
	ldr r0, [r0]
	add sp, 0x14
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_80277D0

	thumb_func_start sub_802784C
sub_802784C: @ 802784C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0
	mov r10, r0
	mov r8, r0
	mov r9, r0
	ldr r6, =gUnknown_02022C98
	ldr r0, [r6]
	adds r0, 0x24
	ldrb r5, [r0]
	bl sub_8027748
	bl sub_8027748
	cmp r0, 0
	bne _080278A0
	movs r4, 0
	cmp r9, r5
	bcs _080278A0
	adds r2, r6, 0
	ldr r1, =0x00003308
	mov r12, r1
	movs r7, 0
	movs r6, 0x4
	ldr r3, =0x0000330c
_08027884:
	ldr r0, [r2]
	lsls r1, r4, 3
	adds r0, r1
	add r0, r12
	strb r6, [r0]
	ldr r0, [r2]
	adds r0, r3
	adds r0, r1
	str r7, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08027884
_080278A0:
	movs r4, 0
	cmp r4, r5
	bcs _080278CA
_080278A6:
	adds r0, r4, 0
	bl sub_80276C0
	ldr r1, =0x000f4236
	bl sub_8027A38
	ldr r1, =gUnknown_02022C98
	ldr r1, [r1]
	lsls r2, r4, 3
	ldr r3, =0x0000330c
	adds r1, r3
	adds r1, r2
	str r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _080278A6
_080278CA:
	mov r0, r10
	bl sub_80277D0
	adds r6, r0, 0
	mov r3, r8
	movs r4, 0
	cmp r4, r5
	bcs _08027916
	ldr r7, =gUnknown_02022C98
	mov r10, r7
_080278DE:
	mov r0, r10
	ldr r2, [r0]
	lsls r1, r4, 3
	ldr r7, =0x0000330c
	adds r0, r2, r7
	adds r0, r1
	ldr r0, [r0]
	cmp r6, r0
	bne _0802790C
	adds r0, r2, r1
	ldr r1, =0x00003308
	adds r0, r1
	strb r3, [r0]
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0802790C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _080278DE
_08027916:
	mov r10, r8
	cmp r9, r5
	bcc _080278CA
	movs r0, 0
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_802784C

	thumb_func_start sub_802793C
sub_802793C: @ 802793C
	lsls r1, 24
	ldr r2, =gUnknown_02022C98
	ldr r2, [r2]
	lsrs r1, 21
	ldr r3, =0x00003308
	adds r2, r3
	adds r2, r1
	ldr r1, [r2]
	ldr r2, [r2, 0x4]
	str r1, [r0]
	str r2, [r0, 0x4]
	bx lr
	.pool
	thumb_func_end sub_802793C

	thumb_func_start sub_802795C
sub_802795C: @ 802795C
	push {r4-r7,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r6, r0, 24
	movs r7, 0
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	adds r0, 0x24
	ldrb r5, [r0]
	mov r0, sp
	movs r1, 0
	movs r2, 0x14
	bl memset
	movs r4, 0
	cmp r7, r5
	bcs _08027994
_0802797E:
	adds r0, r4, 0
	bl sub_80276C0
	lsls r1, r4, 2
	add r1, sp
	str r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _0802797E
_08027994:
	lsls r0, r6, 2
	add r0, sp
	ldr r1, [r0]
	movs r4, 0
_0802799C:
	cmp r4, r6
	beq _080279B0
	lsls r0, r4, 2
	add r0, sp
	ldr r0, [r0]
	cmp r1, r0
	bcs _080279B0
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080279B0:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _0802799C
	adds r0, r7, 0
	add sp, 0x14
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_802795C

	thumb_func_start sub_80279C8
sub_80279C8: @ 80279C8
	push {r4-r6,lr}
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	adds r0, 0x28
	ldrb r4, [r0]
	bl sub_802762C
	lsls r0, 16
	lsrs r5, r0, 16
	adds r6, r5, 0
	adds r0, r4, 0
	bl sub_80276C0
	adds r4, r0, 0
	bl sub_8027748
	cmp r4, r0
	beq _080279F4
	movs r0, 0x3
	b _08027A22
	.pool
_080279F4:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80D6800
	lsls r0, 24
	cmp r0, 0
	bne _08027A06
	movs r0, 0x2
	b _08027A22
_08027A06:
	adds r0, r6, 0
	movs r1, 0x1
	bl bag_add_item
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_80D6800
	lsls r0, 24
	cmp r0, 0
	beq _08027A20
	movs r0, 0
	b _08027A22
_08027A20:
	movs r0, 0x1
_08027A22:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80279C8

	thumb_func_start sub_8027A28
sub_8027A28: @ 8027A28
	push {lr}
	adds r2, r0, 0
	adds r0, r1, 0
	cmp r2, r0
	bcs _08027A34
	adds r0, r2, 0x1
_08027A34:
	pop {r1}
	bx r1
	thumb_func_end sub_8027A28

	thumb_func_start sub_8027A38
sub_8027A38: @ 8027A38
	push {lr}
	adds r2, r0, 0
	adds r0, r1, 0
	cmp r2, r0
	bcs _08027A44
	adds r0, r2, 0
_08027A44:
	pop {r1}
	bx r1
	thumb_func_end sub_8027A38

	thumb_func_start sub_8027A48
sub_8027A48: @ 8027A48
	lsls r0, 24
	lsrs r0, 24
	ldr r1, =gUnknown_02022C98
	ldr r1, [r1]
	adds r1, 0x34
	adds r1, r0
	ldrb r0, [r1]
	bx lr
	.pool
	thumb_func_end sub_8027A48

	thumb_func_start sub_8027A5C
sub_8027A5C: @ 8027A5C
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, =gUnknown_020375F0
_08027A62:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _08027A94
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0x55
	bne _08027A94
	movs r0, 0x1
	strh r0, [r6]
	b _08027AA0
	.pool
_08027A94:
	adds r5, 0x1
	cmp r5, 0x5
	ble _08027A62
	ldr r1, =gUnknown_020375F0
	movs r0, 0
	strh r0, [r1]
_08027AA0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8027A5C

	thumb_func_start sub_8027AAC
sub_8027AAC: @ 8027AAC
	push {r4,lr}
	ldr r4, =sub_8027ACC
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8027AAC

	thumb_func_start sub_8027ACC
sub_8027ACC: @ 8027ACC
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, =gTasks + 0x8
	adds r7, r0, r1
	movs r1, 0
	ldrsh r0, [r7, r1]
	cmp r0, 0x1
	beq _08027B94
	cmp r0, 0x1
	bgt _08027AF4
	cmp r0, 0
	beq _08027AFE
	b _08027BE2
	.pool
_08027AF4:
	cmp r0, 0x2
	beq _08027BA0
	cmp r0, 0x3
	beq _08027BC8
	b _08027BE2
_08027AFE:
	ldr r0, =gUnknown_082F7B2C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r1, =gUnknown_085EDCE5
	movs r0, 0x1
	movs r2, 0
	bl GetStringWidth
	adds r4, r0, 0
	movs r6, 0
	ldr r5, =gUnknown_082F7B34
_08027B18:
	ldr r1, [r5]
	movs r0, 0x1
	movs r2, 0
	bl GetStringWidth
	adds r0, 0x32
	cmp r0, r4
	ble _08027B2A
	adds r4, r0, 0
_08027B2A:
	adds r5, 0x4
	adds r6, 0x1
	cmp r6, 0x2
	bls _08027B18
	adds r0, r4, 0x7
	cmp r0, 0
	bge _08027B3A
	adds r0, 0x7
_08027B3A:
	asrs r4, r0, 3
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _08027B46
	adds r4, 0x1
_08027B46:
	movs r1, 0x1E
	subs r1, r4
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	lsls r1, 24
	lsrs r1, 16
	ldr r2, =0xffff00ff
	ldr r0, [sp]
	ands r0, r2
	orrs r0, r1
	lsls r2, r4, 24
	ldr r1, =0x00ffffff
	ands r0, r1
	orrs r0, r2
	str r0, [sp]
	mov r0, sp
	bl AddWindow
	strh r0, [r7, 0x2]
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl sub_8027BEC
	ldrb r0, [r7, 0x2]
	movs r1, 0x3
	b _08027BB6
	.pool
_08027B94:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08027BE2
	b _08027BBA
_08027BA0:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08027BE2
	ldrb r0, [r7, 0x2]
	bl rbox_fill_rectangle
	ldrb r0, [r7, 0x2]
	movs r1, 0x1
_08027BB6:
	bl CopyWindowToVram
_08027BBA:
	ldrh r0, [r7]
	adds r0, 0x1
	strh r0, [r7]
	b _08027BE2
	.pool
_08027BC8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08027BE2
	ldrb r0, [r7, 0x2]
	bl RemoveWindow
	adds r0, r4, 0
	bl DestroyTask
	bl script_env_2_enable_and_set_ctx_running
_08027BE2:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8027ACC

	thumb_func_start sub_8027BEC
sub_8027BEC: @ 8027BEC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	str r1, [sp, 0x18]
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r2, 0x84
	lsls r2, 2
	adds r0, r1, r2
	ldrh r0, [r0]
	str r0, [sp, 0xC]
	subs r2, 0x4
	adds r0, r1, r2
	ldr r0, [r0]
	str r0, [sp, 0x10]
	ldr r0, =0x00000212
	adds r1, r0
	ldrh r0, [r1]
	str r0, [sp, 0x14]
	ldr r4, =0x0000021d
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0xD0
	bl box_border_load_tiles_and_pal
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0xD
	bl sub_8098858
	adds r0, r7, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r4, =gUnknown_085EDCE5
	ldr r0, [sp, 0x18]
	lsls r2, r0, 3
	movs r0, 0x1
	adds r1, r4, 0
	bl GetStringCenterAlignXOffset
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0x1
	adds r2, r4, 0
	bl Print
	movs r6, 0
	ldr r2, =gStringVar1
	mov r8, r2
	movs r0, 0xFF
	mov r10, r0
	mov r9, r6
	mov r2, sp
	adds r2, 0xC
	str r2, [sp, 0x1C]
_08027C76:
	lsls r4, r6, 2
	ldr r0, [sp, 0x1C]
	ldm r0!, {r1}
	str r0, [sp, 0x1C]
	ldr r0, =gUnknown_082F7B40
	adds r0, r6, r0
	ldrb r3, [r0]
	mov r0, r8
	movs r2, 0
	bl ConvertIntToDecimalStringN
	movs r0, 0x1
	mov r1, r8
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	adds r5, r0, 0
	ldr r0, =gUnknown_082F7B34
	adds r4, r0
	ldr r2, [r4]
	ldr r0, =gUnknown_082F7B44
	lsls r4, r6, 1
	adds r0, r4, r0
	ldrb r0, [r0]
	str r0, [sp]
	mov r0, r10
	str r0, [sp, 0x4]
	mov r0, r9
	str r0, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0x1
	movs r3, 0
	bl Print
	ldr r2, [sp, 0x18]
	lsls r3, r2, 3
	subs r3, r5
	lsls r3, 24
	lsrs r3, 24
	ldr r0, =gUnknown_082F7B4A
	adds r4, r0
	ldrb r0, [r4]
	str r0, [sp]
	mov r0, r10
	str r0, [sp, 0x4]
	mov r2, r9
	str r2, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0x1
	mov r2, r8
	bl Print
	adds r6, 0x1
	cmp r6, 0x2
	ble _08027C76
	adds r0, r7, 0
	bl PutWindowTilemap
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8027BEC

	thumb_func_start sub_8027D20
sub_8027D20: @ 8027D20
	push {lr}
	bl sub_8009FCC
	ldr r1, =gUnknown_02022C98
	ldr r1, [r1]
	adds r1, 0x24
	strb r0, [r1]
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8027D20

	thumb_func_start sub_8027D38
sub_8027D38: @ 8027D38
	push {r4-r7,lr}
	ldr r0, =gUnknown_02022C98
	ldr r0, [r0]
	adds r0, 0x24
	ldrb r4, [r0]
	cmp r4, 0x4
	bhi _08027D66
	ldr r5, =gUnknown_082F7B90
_08027D48:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r1, =gUnknown_020229F0
	adds r0, r1
	lsls r1, r4, 2
	adds r1, r5
	ldr r1, [r1]
	bl StringCopy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _08027D48
_08027D66:
	ldr r0, =gUnknown_02022C98
	ldr r1, [r0]
	adds r1, 0x24
	movs r2, 0x5
	strb r2, [r1]
	movs r1, 0
	mov r12, r0
_08027D74:
	movs r4, 0
	mov r2, r12
	ldr r0, [r2]
	adds r0, 0x24
	adds r5, r1, 0x1
	ldrb r0, [r0]
	cmp r4, r0
	bcs _08027DB2
	ldr r7, =gUnknown_02022C98
	lsls r3, r1, 1
	ldr r6, =gUnknown_082F7B50
_08027D8A:
	ldr r2, [r7]
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r3, r0
	adds r1, r2, 0
	adds r1, 0x4A
	adds r1, r0
	lsls r0, r4, 3
	adds r0, r3, r0
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r2, 0x24
	ldrb r2, [r2]
	cmp r4, r2
	bcc _08027D8A
_08027DB2:
	lsls r0, r5, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _08027D74
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8027D38

	thumb_func_start sub_8027DD0
sub_8027DD0: @ 8027DD0
	push {lr}
	sub sp, 0x8
	ldr r3, =0xffffff00
	ldr r1, [sp]
	ands r1, r3
	movs r2, 0x1
	orrs r1, r2
	str r1, [sp]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp, 0x4]
	ands r1, r3
	orrs r1, r0
	str r1, [sp, 0x4]
	mov r0, sp
	bl sub_800FE50
	add sp, 0x8
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8027DD0

	thumb_func_start sub_8027DFC
sub_8027DFC: @ 8027DFC
	push {lr}
	adds r2, r0, 0
	ldr r3, =gUnknown_03003090
	ldrh r0, [r3]
	movs r1, 0xFF
	lsls r1, 8
	ands r1, r0
	movs r0, 0xBC
	lsls r0, 6
	cmp r1, r0
	bne _08027E1E
	lsls r0, r2, 4
	adds r1, r3, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0x1
	beq _08027E28
_08027E1E:
	movs r0, 0
	b _08027E2A
	.pool
_08027E28:
	ldrb r0, [r1, 0x4]
_08027E2A:
	pop {r1}
	bx r1
	thumb_func_end sub_8027DFC

	thumb_func_start sub_8027E30
sub_8027E30: @ 8027E30
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	ldr r4, [sp, 0x48]
	lsls r4, 24
	str r4, [sp, 0x1C]
	movs r4, 0x14
	adds r4, r0
	mov r9, r4
	mov r5, sp
	movs r4, 0x2
	strb r4, [r5]
	mov r10, sp
	mov r5, r9
	ldrb r4, [r5, 0xB]
	movs r7, 0xF
	adds r5, r7, 0
	ands r5, r4
	mov r6, r10
	ldrb r6, [r6, 0x1]
	mov r8, r6
	movs r4, 0x10
	negs r4, r4
	mov r6, r8
	ands r4, r6
	orrs r4, r5
	mov r5, r10
	strb r4, [r5, 0x1]
	mov r8, sp
	mov r6, r9
	ldrb r5, [r6, 0xC]
	lsls r5, 4
	ands r4, r7
	orrs r4, r5
	mov r5, r8
	strb r4, [r5, 0x1]
	ldrb r5, [r6, 0xD]
	movs r6, 0xF
	ands r5, r6
	mov r4, r10
	ldrb r4, [r4, 0x2]
	mov r8, r4
	movs r4, 0x10
	negs r4, r4
	mov r6, r8
	ands r4, r6
	orrs r4, r5
	mov r5, r10
	strb r4, [r5, 0x2]
	mov r8, sp
	mov r6, r9
	ldrb r5, [r6, 0xE]
	lsls r5, 4
	ands r4, r7
	orrs r4, r5
	mov r5, r8
	strb r4, [r5, 0x2]
	ldrb r5, [r6, 0xF]
	movs r6, 0xF
	ands r5, r6
	mov r4, r10
	ldrb r4, [r4, 0x3]
	mov r8, r4
	movs r4, 0x10
	negs r4, r4
	mov r6, r8
	ands r4, r6
	orrs r4, r5
	mov r5, r10
	strb r4, [r5, 0x3]
	mov r8, sp
	mov r6, r9
	ldrb r5, [r6, 0x10]
	lsls r5, 4
	ands r4, r7
	orrs r4, r5
	mov r5, r8
	strb r4, [r5, 0x3]
	ldrb r5, [r6, 0x11]
	movs r6, 0xF
	ands r5, r6
	mov r4, r10
	ldrb r4, [r4, 0x4]
	mov r8, r4
	movs r4, 0x10
	negs r4, r4
	mov r6, r8
	ands r4, r6
	orrs r4, r5
	mov r5, r10
	strb r4, [r5, 0x4]
	mov r8, sp
	mov r6, r9
	ldrb r5, [r6, 0x12]
	lsls r5, 4
	ands r4, r7
	orrs r4, r5
	mov r5, r8
	strb r4, [r5, 0x4]
	ldrb r4, [r6, 0x13]
	movs r6, 0xF
	ands r4, r6
	mov r6, r8
	ldrb r5, [r6, 0x5]
	movs r6, 0x10
	negs r6, r6
	ands r6, r5
	orrs r6, r4
	str r6, [sp, 0xC]
	mov r4, r8
	strb r6, [r4, 0x5]
	mov r5, sp
	mov r6, r9
	ldrb r4, [r6, 0x14]
	lsls r4, 4
	ldr r6, [sp, 0xC]
	ands r6, r7
	orrs r6, r4
	strb r6, [r5, 0x5]
	mov r7, sp
	movs r4, 0x3
	mov r8, r4
	ldrb r0, [r0, 0x14]
	mov r5, r8
	ands r0, r5
	ldrb r5, [r7, 0x6]
	movs r6, 0x4
	negs r6, r6
	mov r10, r6
	mov r4, r10
	ands r4, r5
	orrs r4, r0
	strb r4, [r7, 0x6]
	mov r5, r9
	ldrb r0, [r5, 0x1]
	mov r6, r8
	ands r0, r6
	lsls r0, 2
	movs r5, 0xD
	negs r5, r5
	ands r5, r4
	orrs r5, r0
	strb r5, [r7, 0x6]
	mov r0, r9
	ldrb r4, [r0, 0x2]
	ands r4, r6
	lsls r4, 4
	movs r0, 0x31
	negs r0, r0
	ands r0, r5
	orrs r0, r4
	strb r0, [r7, 0x6]
	mov r5, sp
	mov r6, r9
	ldrb r4, [r6, 0x3]
	lsls r4, 6
	movs r6, 0x3F
	ands r0, r6
	orrs r0, r4
	strb r0, [r5, 0x6]
	mov r4, r9
	ldrb r0, [r4, 0x4]
	mov r5, r8
	ands r0, r5
	ldrb r5, [r7, 0x7]
	mov r4, r10
	ands r4, r5
	orrs r4, r0
	strb r4, [r7, 0x7]
	mov r6, r9
	ldrb r0, [r6, 0x5]
	mov r5, r8
	ands r0, r5
	lsls r0, 2
	movs r5, 0xD
	negs r5, r5
	ands r5, r4
	orrs r5, r0
	strb r5, [r7, 0x7]
	ldrb r4, [r6, 0x6]
	mov r6, r8
	ands r4, r6
	lsls r4, 4
	movs r0, 0x31
	negs r0, r0
	ands r0, r5
	orrs r0, r4
	strb r0, [r7, 0x7]
	mov r5, sp
	mov r6, r9
	ldrb r4, [r6, 0x7]
	lsls r4, 6
	movs r6, 0x3F
	ands r0, r6
	orrs r0, r4
	strb r0, [r5, 0x7]
	mov r8, sp
	mov r0, r9
	ldrb r4, [r0, 0x8]
	movs r7, 0x3
	adds r0, r7, 0
	ands r0, r4
	mov r4, r8
	ldrb r5, [r4, 0x8]
	mov r4, r10
	ands r4, r5
	orrs r4, r0
	mov r5, r8
	strb r4, [r5, 0x8]
	mov r6, r9
	ldrb r5, [r6, 0x9]
	adds r0, r7, 0
	ands r0, r5
	lsls r0, 2
	movs r5, 0xD
	negs r5, r5
	ands r5, r4
	orrs r5, r0
	mov r0, r8
	strb r5, [r0, 0x8]
	ldrb r0, [r1]
	adds r4, r7, 0
	ands r4, r0
	lsls r4, 4
	movs r0, 0x31
	negs r0, r0
	ands r0, r5
	orrs r0, r4
	mov r4, r8
	strb r0, [r4, 0x8]
	mov r5, sp
	ldrb r4, [r2]
	lsls r4, 6
	movs r6, 0x3F
	ands r0, r6
	orrs r0, r4
	strb r0, [r5, 0x8]
	ldrb r4, [r3]
	adds r0, r7, 0
	ands r0, r4
	ldrb r4, [r5, 0x9]
	mov r6, r10
	ands r6, r4
	orrs r6, r0
	mov r10, r6
	strb r6, [r5, 0x9]
	ldr r0, [sp, 0x40]
	ldrb r4, [r0]
	adds r0, r7, 0
	ands r0, r4
	lsls r0, 2
	movs r4, 0xD
	negs r4, r4
	ands r6, r4
	orrs r6, r0
	str r6, [sp, 0x10]
	strb r6, [r5, 0x9]
	mov r4, sp
	ldr r5, [sp, 0x44]
	ldrb r0, [r5]
	adds r6, r7, 0
	ands r6, r0
	lsls r0, r6, 4
	subs r7, 0x34
	ldr r5, [sp, 0x10]
	ands r7, r5
	orrs r7, r0
	strb r7, [r4, 0x9]
	mov r5, sp
	ldrb r0, [r1, 0x4]
	movs r6, 0x1
	mov r12, r6
	mov r4, r12
	ands r4, r0
	lsls r4, 6
	movs r0, 0x41
	negs r0, r0
	mov r10, r0
	ands r0, r7
	orrs r0, r4
	strb r0, [r5, 0x9]
	ldrb r4, [r2, 0x4]
	lsls r4, 7
	movs r5, 0x7F
	ands r0, r5
	orrs r0, r4
	mov r4, r8
	strb r0, [r4, 0x9]
	ldrb r4, [r3, 0x4]
	mov r0, r12
	ands r0, r4
	mov r5, r8
	ldrb r4, [r5, 0xA]
	movs r7, 0x2
	negs r7, r7
	adds r5, r7, 0
	ands r5, r4
	orrs r5, r0
	mov r6, r8
	strb r5, [r6, 0xA]
	mov r9, sp
	ldr r4, [sp, 0x40]
	ldrb r0, [r4, 0x4]
	mov r4, r12
	ands r4, r0
	lsls r4, 1
	movs r6, 0x3
	negs r6, r6
	mov r8, r6
	mov r0, r8
	ands r0, r5
	orrs r0, r4
	mov r4, r9
	strb r0, [r4, 0xA]
	ldr r6, [sp, 0x44]
	ldrb r5, [r6, 0x4]
	mov r4, r12
	ands r4, r5
	lsls r4, 2
	movs r5, 0x5
	negs r5, r5
	ands r0, r5
	orrs r0, r4
	mov r4, r9
	strb r0, [r4, 0xA]
	mov r4, sp
	ldrb r1, [r1, 0x8]
	mov r0, r12
	ands r0, r1
	lsls r0, 2
	ldrb r1, [r4, 0xB]
	ands r5, r1
	orrs r5, r0
	strb r5, [r4, 0xB]
	ldrb r1, [r2, 0x8]
	mov r0, r12
	ands r0, r1
	lsls r0, 3
	movs r1, 0x9
	negs r1, r1
	ands r1, r5
	orrs r1, r0
	strb r1, [r4, 0xB]
	ldrb r2, [r3, 0x8]
	mov r0, r12
	ands r0, r2
	lsls r0, 4
	movs r2, 0x11
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r4, 0xB]
	mov r3, sp
	ldr r5, [sp, 0x40]
	ldrb r0, [r5, 0x8]
	mov r1, r12
	ands r1, r0
	lsls r1, 5
	movs r0, 0x21
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0xB]
	mov r2, sp
	ldrb r1, [r6, 0x8]
	mov r6, r12
	ands r6, r1
	lsls r1, r6, 6
	mov r3, r10
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0xB]
	ldr r4, [sp, 0x1C]
	lsrs r3, r4, 21
	ldrb r1, [r2, 0xA]
	movs r0, 0x7
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, 0xA]
	mov r1, sp
	ldr r5, [sp, 0x4C]
	movs r6, 0x1
	ands r5, r6
	lsls r2, r5, 1
	ldrb r0, [r1, 0xB]
	mov r3, r8
	ands r3, r0
	orrs r3, r2
	mov r8, r3
	strb r3, [r1, 0xB]
	mov r0, sp
	ldr r4, [sp, 0x50]
	ands r4, r6
	mov r5, r8
	ands r5, r7
	orrs r5, r4
	strb r5, [r0, 0xB]
	bl sub_800FE50
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8027E30

	thumb_func_start sub_8028164
sub_8028164: @ 8028164
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r0, [sp, 0x1C]
	mov r12, r0
	ldr r1, [sp, 0x20]
	mov r8, r1
	ldr r0, [sp, 0x24]
	mov r9, r0
	adds r2, r7, 0
	adds r2, 0x14
	ldr r4, =gUnknown_03003090
	ldrh r0, [r4]
	movs r1, 0xFF
	lsls r1, 8
	ands r1, r0
	movs r0, 0xBC
	lsls r0, 6
	cmp r1, r0
	bne _0802819C
	adds r3, r4, 0x2
	ldrb r0, [r4, 0x2]
	cmp r0, 0x2
	beq _080281A4
_0802819C:
	movs r0, 0
	b _080282DE
	.pool
_080281A4:
	ldrb r0, [r3, 0x1]
	lsls r0, 28
	lsrs r0, 28
	strb r0, [r2, 0xB]
	ldrb r0, [r3, 0x1]
	lsrs r0, 4
	strb r0, [r2, 0xC]
	ldrb r0, [r3, 0x2]
	lsls r0, 28
	lsrs r0, 28
	strb r0, [r2, 0xD]
	ldrb r0, [r3, 0x2]
	lsrs r0, 4
	strb r0, [r2, 0xE]
	ldrb r0, [r3, 0x3]
	lsls r0, 28
	lsrs r0, 28
	strb r0, [r2, 0xF]
	ldrb r0, [r3, 0x3]
	lsrs r0, 4
	strb r0, [r2, 0x10]
	ldrb r0, [r3, 0x4]
	lsls r0, 28
	lsrs r0, 28
	strb r0, [r2, 0x11]
	ldrb r0, [r3, 0x4]
	lsrs r0, 4
	strb r0, [r2, 0x12]
	ldrb r0, [r3, 0x5]
	lsls r0, 28
	lsrs r0, 28
	strb r0, [r2, 0x13]
	ldrb r0, [r3, 0x5]
	lsrs r0, 4
	strb r0, [r2, 0x14]
	ldrb r0, [r3, 0x1]
	lsls r0, 28
	lsrs r0, 28
	strb r0, [r2, 0x15]
	ldrb r0, [r3, 0x6]
	lsls r0, 30
	lsrs r0, 30
	strb r0, [r7, 0x14]
	ldrb r0, [r3, 0x6]
	lsls r0, 28
	lsrs r0, 30
	strb r0, [r2, 0x1]
	ldrb r0, [r3, 0x6]
	lsls r0, 26
	lsrs r0, 30
	strb r0, [r2, 0x2]
	ldrb r0, [r3, 0x6]
	lsrs r0, 6
	strb r0, [r2, 0x3]
	ldrb r0, [r3, 0x7]
	lsls r0, 30
	lsrs r0, 30
	strb r0, [r2, 0x4]
	ldrb r0, [r3, 0x7]
	lsls r0, 28
	lsrs r0, 30
	strb r0, [r2, 0x5]
	ldrb r0, [r3, 0x7]
	lsls r0, 26
	lsrs r0, 30
	strb r0, [r2, 0x6]
	ldrb r0, [r3, 0x7]
	lsrs r0, 6
	strb r0, [r2, 0x7]
	ldrb r0, [r3, 0x8]
	lsls r0, 30
	lsrs r0, 30
	strb r0, [r2, 0x8]
	ldrb r0, [r3, 0x8]
	lsls r0, 28
	lsrs r0, 30
	strb r0, [r2, 0x9]
	ldrb r0, [r3, 0x6]
	lsls r0, 30
	lsrs r0, 30
	strb r0, [r2, 0xA]
	ldrb r0, [r3, 0x8]
	lsls r0, 26
	lsrs r0, 30
	strb r0, [r5]
	ldrb r0, [r3, 0x9]
	lsls r0, 25
	lsrs r0, 31
	strb r0, [r5, 0x4]
	ldrb r0, [r3, 0xB]
	lsls r0, 29
	lsrs r0, 31
	strb r0, [r5, 0x8]
	ldrb r0, [r3, 0x8]
	lsrs r0, 6
	strb r0, [r6]
	ldrb r0, [r3, 0x9]
	lsrs r0, 7
	strb r0, [r6, 0x4]
	ldrb r0, [r3, 0xB]
	lsls r0, 28
	lsrs r0, 31
	strb r0, [r6, 0x8]
	ldrb r0, [r3, 0x9]
	lsls r0, 30
	lsrs r0, 30
	mov r1, r12
	strb r0, [r1]
	ldrb r0, [r3, 0xA]
	lsls r0, 31
	lsrs r0, 31
	strb r0, [r1, 0x4]
	ldrb r0, [r3, 0xB]
	lsls r0, 27
	lsrs r0, 31
	strb r0, [r1, 0x8]
	ldrb r0, [r3, 0x9]
	lsls r0, 28
	lsrs r0, 30
	mov r1, r8
	strb r0, [r1]
	ldrb r0, [r3, 0xA]
	lsls r0, 30
	lsrs r0, 31
	strb r0, [r1, 0x4]
	ldrb r0, [r3, 0xB]
	lsls r0, 26
	lsrs r0, 31
	strb r0, [r1, 0x8]
	ldrb r0, [r3, 0x9]
	lsls r0, 26
	lsrs r0, 30
	mov r1, r9
	strb r0, [r1]
	ldrb r0, [r3, 0xA]
	lsls r0, 29
	lsrs r0, 31
	strb r0, [r1, 0x4]
	ldrb r0, [r3, 0xB]
	lsls r0, 25
	lsrs r0, 31
	strb r0, [r1, 0x8]
	ldrb r0, [r3, 0xA]
	lsrs r0, 3
	ldr r1, [sp, 0x28]
	strb r0, [r1]
	ldrb r0, [r3, 0xB]
	lsls r0, 30
	lsrs r0, 31
	ldr r1, [sp, 0x2C]
	str r0, [r1]
	ldrb r0, [r3, 0xB]
	lsls r0, 31
	lsrs r0, 31
	ldr r1, [sp, 0x30]
	str r0, [r1]
	movs r0, 0x1
_080282DE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8028164

	thumb_func_start sub_80282EC
sub_80282EC: @ 80282EC
	push {lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	ldr r3, =0xffffff00
	ldr r1, [sp]
	ands r1, r3
	movs r2, 0x3
	orrs r1, r2
	str r1, [sp]
	ldr r1, [sp, 0x4]
	ands r1, r3
	orrs r1, r0
	str r1, [sp, 0x4]
	mov r0, sp
	bl sub_800FE50
	add sp, 0x8
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80282EC

	thumb_func_start sub_8028318
sub_8028318: @ 8028318
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	ldr r3, =gUnknown_03003090
	ldrh r0, [r3]
	movs r1, 0xFF
	lsls r1, 8
	ands r1, r0
	movs r0, 0xBC
	lsls r0, 6
	cmp r1, r0
	bne _0802833C
	lsls r0, r2, 4
	adds r1, r3, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0x3
	beq _08028344
_0802833C:
	movs r0, 0
	b _0802834A
	.pool
_08028344:
	ldrb r0, [r1, 0x4]
	strb r0, [r4]
	movs r0, 0x1
_0802834A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8028318

	thumb_func_start sub_8028350
sub_8028350: @ 8028350
	push {lr}
	sub sp, 0x8
	ldr r2, =0xffffff00
	ldr r1, [sp]
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	str r1, [sp]
	str r0, [sp, 0x4]
	mov r0, sp
	bl sub_800FE50
	add sp, 0x8
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8028350

	thumb_func_start sub_8028374
sub_8028374: @ 8028374
	push {lr}
	adds r2, r0, 0
	ldr r3, =gUnknown_03003090
	ldrh r0, [r3]
	movs r1, 0xFF
	lsls r1, 8
	ands r1, r0
	movs r0, 0xBC
	lsls r0, 6
	cmp r1, r0
	bne _08028396
	lsls r0, r2, 4
	adds r1, r3, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0x4
	beq _080283A0
_08028396:
	movs r0, 0
	b _080283A2
	.pool
_080283A0:
	ldr r0, [r1, 0x4]
_080283A2:
	pop {r1}
	bx r1
	thumb_func_end sub_8028374

	thumb_func_start sub_80283A8
sub_80283A8: @ 80283A8
	push {r4,r5,lr}
	sub sp, 0x18
	movs r5, 0xC0
	lsls r5, 6
	adds r0, r5, 0
	bl AllocZeroed
	adds r4, r0, 0
	ldr r0, =gUnknown_082FB2D8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	ldr r0, =gUnknown_082FB2E0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x10]
	str r1, [sp, 0x14]
	ldr r0, =gUnknown_082F98BC
	adds r1, r4, 0
	bl LZ77UnCompWram
	cmp r4, 0
	beq _080283E8
	str r4, [sp]
	str r5, [sp, 0x4]
	mov r0, sp
	bl LoadObjectPic
	adds r0, r4, 0
	bl Free
_080283E8:
	add r0, sp, 0x8
	bl LoadTaggedObjectPalette
	add r0, sp, 0x10
	bl LoadTaggedObjectPalette
	add sp, 0x18
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80283A8

	thumb_func_start sub_8028408
sub_8028408: @ 8028408
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x30
	adds r6, r1, 0
	mov r8, r2
	adds r5, r3, 0
	lsls r6, 24
	lsrs r6, 24
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r5, 24
	lsrs r5, 24
	add r1, sp, 0x18
	movs r3, 0
	strh r3, [r1]
	ldrb r2, [r0]
	mov r0, sp
	adds r0, 0x1A
	strh r2, [r0]
	ldr r0, =gUnknown_082FB1E0
	str r0, [sp, 0x1C]
	ldr r0, =gUnknown_082FB228
	str r0, [sp, 0x20]
	str r3, [sp, 0x24]
	ldr r0, =gDummyObjectRotScalAnimTable
	str r0, [sp, 0x28]
	ldr r0, =sub_80284A8
	str r0, [sp, 0x2C]
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	movs r0, 0x4
	bl AllocZeroed
	ldr r1, =gUnknown_02022C9C
	mov r2, r8
	lsls r4, r2, 2
	adds r4, r1
	str r0, [r4]
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8028F14
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	mov r0, sp
	movs r2, 0x88
	movs r3, 0x3
	bl AddObjectToFront
	ldr r1, [r4]
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	movs r0, 0x1
	mov r1, r8
	bl sub_8028654
	add sp, 0x30
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8028408

	thumb_func_start sub_80284A8
sub_80284A8: @ 80284A8
	push {lr}
	movs r2, 0x2E
	ldrsh r1, [r0, r2]
	cmp r1, 0x1
	beq _080284BC
	cmp r1, 0x1
	ble _080284C6
	cmp r1, 0x2
	beq _080284C2
	b _080284C6
_080284BC:
	bl sub_802853C
	b _080284C6
_080284C2:
	bl sub_80285AC
_080284C6:
	pop {r0}
	bx r0
	thumb_func_end sub_80284A8

	thumb_func_start sub_80284CC
sub_80284CC: @ 80284CC
	push {lr}
	bl link_get_multiplayer_id
	ldr r1, =gUnknown_02022C9C
	lsls r0, 24
	lsrs r0, 22
	adds r0, r1
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, =gUnknown_02020630
	adds r0, r1
	movs r2, 0
	movs r1, 0x1
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	strh r2, [r0, 0x32]
	strh r2, [r0, 0x34]
	strh r2, [r0, 0x36]
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80284CC

	thumb_func_start sub_8028504
sub_8028504: @ 8028504
	push {lr}
	bl link_get_multiplayer_id
	ldr r1, =gUnknown_02022C9C
	lsls r0, 24
	lsrs r0, 22
	adds r0, r1
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, =gUnknown_02020630
	adds r0, r1
	movs r2, 0
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	strh r2, [r0, 0x32]
	strh r2, [r0, 0x34]
	strh r2, [r0, 0x36]
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8028504

	thumb_func_start sub_802853C
sub_802853C: @ 802853C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r2, r0, 16
	lsrs r0, 31
	adds r0, r2, r0
	asrs r1, r0, 1
	adds r0, r1, 0
	cmp r1, 0
	bge _08028558
	adds r0, r1, 0x3
_08028558:
	asrs r0, 2
	lsls r0, 2
	subs r0, r1, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r2, 0x2
	ble _080285A2
	cmp r0, 0x2
	bgt _0802856E
	cmp r0, 0x1
	bge _08028572
_0802856E:
	movs r0, 0x1
	b _08028574
_08028572:
	movs r0, 0xFF
_08028574:
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x27
	ble _080285A2
	movs r0, 0
	strh r0, [r4, 0x2E]
	bl sub_8027650
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_8028F14
	strh r0, [r4, 0x20]
_080285A2:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_802853C

	thumb_func_start sub_80285AC
sub_80285AC: @ 80285AC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0xD
	bl __divsi3
	lsls r0, 16
	asrs r1, r0, 16
	adds r0, r1, 0
	cmp r1, 0
	bge _080285CC
	adds r0, r1, 0x3
_080285CC:
	asrs r0, 2
	lsls r0, 2
	subs r0, r1, r0
	lsls r0, 24
	lsrs r4, r0, 24
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	movs r1, 0xD
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _080285F0
	cmp r4, 0
	beq _080285F0
	movs r0, 0xD4
	bl audio_play
_080285F0:
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0x67
	ble _080285FE
	movs r0, 0
	strh r0, [r5, 0x2E]
	movs r4, 0
_080285FE:
	bl link_get_multiplayer_id
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl sub_80286B4
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80285AC

	thumb_func_start sub_8028614
sub_8028614: @ 8028614
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	cmp r4, r5
	bcs _08028646
	ldr r6, =gUnknown_02022C9C
_08028622:
	lsls r0, r4, 2
	adds r0, r6
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, =gUnknown_02020630
	adds r0, r1
	cmp r0, 0
	beq _0802863C
	bl RemoveObjectAndFreeResources
_0802863C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08028622
_08028646:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8028614

	thumb_func_start sub_8028654
sub_8028654: @ 8028654
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, =gUnknown_02020630
	ldr r2, =gUnknown_02022C9C
	lsrs r1, 22
	adds r1, r2
	ldr r1, [r1]
	ldrh r1, [r1]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	adds r2, 0x3E
	movs r1, 0x1
	ands r0, r1
	lsls r0, 2
	ldrb r3, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
	bx lr
	.pool
	thumb_func_end sub_8028654

	thumb_func_start sub_802868C
sub_802868C: @ 802868C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r4, 0
	cmp r4, r5
	bcs _080286AE
_0802869C:
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_8028654
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _0802869C
_080286AE:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_802868C

	thumb_func_start sub_80286B4
sub_80286B4: @ 80286B4
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, =gUnknown_02022C9C
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ldrh r2, [r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r2, =gUnknown_02020630
	adds r0, r2
	bl StartObjectImageAnim
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80286B4

	thumb_func_start nullsub_15
nullsub_15: @ 80286E0
	bx lr
	thumb_func_end nullsub_15

	thumb_func_start sub_80286E4
sub_80286E4: @ 80286E4
	push {r4-r7,lr}
	movs r4, 0
	ldr r0, =gUnknown_02020630
	mov r12, r0
	movs r6, 0
	ldr r5, =gUnknown_02022CF4
_080286F0:
	ldr r3, [r5]
	lsls r1, r4, 1
	adds r0, r3, 0
	adds r0, 0x2A
	adds r0, r1
	ldrh r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r12
	lsls r0, r4, 4
	adds r0, 0x30
	strh r0, [r1, 0x20]
	lsls r2, r4, 3
	movs r7, 0x8
	negs r7, r7
	adds r0, r7, 0
	subs r0, r2
	strh r0, [r1, 0x22]
	adds r3, 0xC
	adds r3, r4
	strb r6, [r3]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _080286F0
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80286E4

	thumb_func_start sub_8028734
sub_8028734: @ 8028734
	push {r4-r6,lr}
	sub sp, 0x28
	movs r4, 0xC0
	lsls r4, 1
	adds r0, r4, 0
	bl AllocZeroed
	adds r6, r0, 0
	ldr r0, =gUnknown_082FB2E8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	ldr r0, =gUnknown_082F96E0
	adds r1, r6, 0
	bl LZ77UnCompWram
	cmp r6, 0
	beq _080287C4
	str r6, [sp, 0x18]
	add r5, sp, 0x18
	movs r0, 0x80
	lsls r0, 9
	orrs r0, r4
	str r0, [r5, 0x4]
	mov r1, sp
	ldr r0, =gUnknown_082FB2F0
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldr r4, =gUnknown_02022CF4
	movs r0, 0x40
	bl AllocZeroed
	str r0, [r4]
	adds r0, r5, 0
	bl LoadObjectPic
	add r0, sp, 0x20
	bl LoadTaggedObjectPalette
	movs r4, 0
_0802878A:
	lsls r1, r4, 20
	movs r0, 0xC0
	lsls r0, 14
	adds r1, r0
	asrs r1, 16
	lsls r0, r4, 3
	movs r3, 0x8
	negs r3, r3
	adds r2, r3, 0
	subs r2, r0
	lsls r2, 16
	asrs r2, 16
	mov r0, sp
	movs r3, 0
	bl AddObjectToFront
	ldr r1, =gUnknown_02022CF4
	ldr r1, [r1]
	lsls r2, r4, 1
	adds r1, 0x2A
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _0802878A
_080287C4:
	adds r0, r6, 0
	bl Free
	add sp, 0x28
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8028734

	thumb_func_start sub_80287E4
sub_80287E4: @ 80287E4
	push {r4,r5,lr}
	movs r4, 0
_080287E8:
	ldr r5, =gUnknown_02022CF4
	ldr r0, [r5]
	lsls r1, r4, 1
	adds r0, 0x2A
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, =gUnknown_02020630
	adds r0, r1
	cmp r0, 0
	beq _08028806
	bl RemoveObjectAndFreeResources
_08028806:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _080287E8
	ldr r0, [r5]
	bl Free
	movs r0, 0
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80287E4

	thumb_func_start sub_8028828
sub_8028828: @ 8028828
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r3, 0
	movs r6, 0
	ldr r0, =gUnknown_02022CF4
	mov r9, r0
_0802883A:
	mov r7, r9
	ldr r2, [r7]
	lsls r5, r6, 1
	adds r0, r2, 0
	adds r0, 0x2A
	adds r0, r5
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, =gUnknown_02020630
	adds r4, r0, r1
	adds r0, r2, 0
	adds r0, 0x16
	adds r0, r5
	movs r1, 0x2
	strh r1, [r0]
	adds r0, r2, 0
	adds r0, 0xC
	adds r2, r0, r6
	ldrb r1, [r2]
	cmp r1, 0
	beq _08028870
	movs r7, 0x22
	ldrsh r0, [r4, r7]
	cmp r0, 0x8
	beq _080288A6
_08028870:
	movs r3, 0x1
	movs r7, 0x22
	ldrsh r0, [r4, r7]
	cmp r0, 0x8
	bne _08028896
	cmp r1, 0
	bne _080288A6
	strb r3, [r2]
	mov r1, r9
	ldr r0, [r1]
	adds r0, 0x16
	adds r0, r5
	ldr r1, =0x0000fff0
	strh r1, [r0]
	movs r0, 0x24
	str r3, [sp]
	bl audio_play
	ldr r3, [sp]
_08028896:
	mov r7, r9
	ldr r0, [r7]
	adds r0, 0x16
	adds r0, r5
	ldrh r0, [r0]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_080288A6:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x9
	bls _0802883A
	cmp r3, 0
	bne _080288C4
	movs r0, 0x1
	b _080288C6
	.pool
_080288C4:
	movs r0, 0
_080288C6:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8028828

	thumb_func_start sub_80288D4
sub_80288D4: @ 80288D4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xA
	bls _08028910
	movs r4, 0
_080288E0:
	ldr r0, =gUnknown_02022CF4
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x2A
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, =gUnknown_02020630
	adds r0, r1
	movs r1, 0x1
	bl StartObjectImageAnim
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _080288E0
	b _080289DA
	.pool
_08028910:
	movs r4, 0
	movs r0, 0xA
	subs r0, r5
	cmp r4, r0
	bge _080289D6
	ldr r6, =gUnknown_02020630
_0802891C:
	cmp r5, 0x6
	bls _08028984
	ldr r0, =gUnknown_02022CF4
	ldr r2, [r0]
	ldr r1, =0x0000fffa
	adds r0, r1, 0
	ldrh r1, [r2, 0x3E]
	adds r0, r1
	adds r0, r5
	movs r1, 0
	strh r0, [r2, 0x3E]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1E
	bls _0802894C
	strh r1, [r2, 0x3E]
	b _0802899E
	.pool
_0802894C:
	cmp r0, 0xA
	bls _0802896A
	lsls r1, r4, 1
	adds r0, r2, 0
	adds r0, 0x2A
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x2
	bl StartObjectImageAnim
	b _0802899E
_0802896A:
	lsls r1, r4, 1
	adds r0, r2, 0
	adds r0, 0x2A
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0
	bl StartObjectImageAnim
	b _0802899E
_08028984:
	ldr r0, =gUnknown_02022CF4
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x2A
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0
	bl StartObjectImageAnim
_0802899E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0xA
	subs r0, r5
	cmp r4, r0
	blt _0802891C
	b _080289D6
	.pool
_080289B4:
	ldr r0, =gUnknown_02022CF4
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x2A
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, =gUnknown_02020630
	adds r0, r1
	movs r1, 0x1
	bl StartObjectImageAnim
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080289D6:
	cmp r4, 0x9
	bls _080289B4
_080289DA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80288D4

	thumb_func_start sub_80289E8
sub_80289E8: @ 80289E8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	ldr r7, =gUnknown_02020630
	movs r1, 0x1
	ands r0, r1
	lsls r4, r0, 2
	movs r6, 0x5
	negs r6, r6
	ldr r5, =gUnknown_02022CF4
_080289FE:
	ldr r0, [r5]
	lsls r1, r3, 1
	adds r0, 0x2A
	adds r0, r1
	ldrh r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x9
	bls _080289FE
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80289E8

	thumb_func_start sub_8028A34
sub_8028A34: @ 8028A34
	push {r4,r5,lr}
	sub sp, 0x10
	movs r5, 0x90
	lsls r5, 3
	adds r0, r5, 0
	bl AllocZeroed
	adds r4, r0, 0
	ldr r0, =gUnknown_082FB314
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	ldr r0, =gUnknown_082F7EB0
	adds r1, r4, 0
	bl LZ77UnCompWram
	cmp r4, 0
	beq _08028A6A
	str r4, [sp]
	movs r0, 0x80
	lsls r0, 10
	orrs r0, r5
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadObjectPic
_08028A6A:
	add r0, sp, 0x8
	bl LoadTaggedObjectPalette
	adds r0, r4, 0
	bl Free
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8028A34

	thumb_func_start sub_8028A88
sub_8028A88: @ 8028A88
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x30
	mov r1, sp
	ldr r0, =gUnknown_082FB324
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	add r2, sp, 0x18
	adds r1, r2, 0
	ldr r0, =gUnknown_082FB33C
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	movs r5, 0
	mov r9, r2
_08028AB0:
	movs r0, 0x4
	bl AllocZeroed
	ldr r1, =gUnknown_02022CB8
	lsls r4, r5, 2
	adds r4, r1
	str r0, [r4]
	lsls r0, r5, 3
	lsls r1, r5, 4
	adds r1, r0
	mov r0, sp
	movs r2, 0x8
	movs r3, 0x1
	bl AddObjectToFront
	ldr r1, [r4]
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8028BF8
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xA
	bls _08028AB0
	movs r5, 0
	ldr r7, =gUnknown_02022CE4
	ldr r4, =gUnknown_082FB31C
	mov r8, r4
_08028AF0:
	movs r0, 0x4
	bl AllocZeroed
	lsls r1, r5, 2
	adds r4, r1, r7
	str r0, [r4]
	adds r6, r1, 0
	cmp r5, 0x3
	bne _08028B2C
	mov r0, r8
	movs r2, 0x6
	ldrsh r1, [r0, r2]
	mov r0, r9
	movs r2, 0x31
	movs r3, 0
	bl AddObjectToFront
	ldr r1, [r7, 0xC]
	b _08028B40
	.pool
_08028B2C:
	lsls r0, r5, 1
	add r0, r8
	movs r3, 0
	ldrsh r1, [r0, r3]
	mov r0, r9
	movs r2, 0x34
	movs r3, 0
	bl AddObjectToFront
	ldr r1, [r4]
_08028B40:
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	adds r0, r6, r7
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, =gUnknown_02020630
	adds r0, r1
	adds r1, r5, 0
	bl StartObjectImageAnim
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _08028AF0
	movs r0, 0x1
	bl sub_8028C30
	add sp, 0x30
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8028A88

	thumb_func_start sub_8028B80
sub_8028B80: @ 8028B80
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, =gUnknown_02022CB8
_08028B86:
	lsls r0, r5, 2
	adds r4, r0, r6
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, =gUnknown_02020630
	adds r0, r1
	cmp r0, 0
	beq _08028BA0
	bl RemoveObjectAndFreeTiles
_08028BA0:
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xA
	bls _08028B86
	movs r5, 0
	ldr r6, =gUnknown_02022CE4
_08028BB8:
	lsls r0, r5, 2
	adds r4, r0, r6
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, =gUnknown_02020630
	adds r0, r1
	cmp r0, 0
	beq _08028BD2
	bl RemoveObjectAndFreeTiles
_08028BD2:
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _08028BB8
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8028B80

	thumb_func_start sub_8028BF8
sub_8028BF8: @ 8028BF8
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, =gUnknown_02020630
	ldr r2, =gUnknown_02022CB8
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	adds r2, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.pool
	thumb_func_end sub_8028BF8

	thumb_func_start sub_8028C30
sub_8028C30: @ 8028C30
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	ldr r7, =gUnknown_02020630
	ldr r6, =gUnknown_02022CE4
	movs r1, 0x1
	ands r0, r1
	lsls r4, r0, 2
	movs r5, 0x5
	negs r5, r5
_08028C46:
	lsls r0, r3, 2
	adds r0, r6
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _08028C46
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8028C30

	thumb_func_start sub_8028C7C
sub_8028C7C: @ 8028C7C
	lsls r0, 24
	lsls r1, 24
	ldr r3, =gUnknown_02020630
	ldr r2, =gUnknown_02022CB8
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ldrh r2, [r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	lsrs r1, 21
	strh r1, [r0, 0x22]
	bx lr
	.pool
	thumb_func_end sub_8028C7C

	thumb_func_start sub_8028CA4
sub_8028CA4: @ 8028CA4
	push {lr}
	lsls r0, 16
	lsls r1, 24
	lsrs r1, 24
	ldr r2, =gUnknown_02022CB8
	lsrs r0, 14
	adds r0, r2
	ldr r0, [r0]
	ldrh r2, [r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r2, =gUnknown_02020630
	adds r0, r2
	bl StartObjectImageAnim
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8028CA4

	thumb_func_start sub_8028CD0
sub_8028CD0: @ 8028CD0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, =gUnknown_02020630
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, 0x32
	strh r1, [r2, 0x20]
	movs r0, 0x32
	strh r0, [r2, 0x22]
	bx lr
	.pool
	thumb_func_end sub_8028CD0

	thumb_func_start sub_8028CF4
sub_8028CF4: @ 8028CF4
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r0, 0x42
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _08028D36
	movs r3, 0
	ldr r7, =gUnknown_082FB354
	ldr r6, =gUnknown_02022CB0
	movs r5, 0
_08028D0A:
	lsls r0, r3, 2
	adds r2, r0, r6
	ldr r1, [r2]
	ldrh r0, [r1, 0x2]
	adds r0, 0x1
	strh r0, [r1, 0x2]
	adds r1, r3, r7
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1]
	cmp r0, r1
	bls _08028D2C
	ldrh r0, [r4, 0x20]
	subs r0, 0x1
	strh r0, [r4, 0x20]
	ldr r0, [r2]
	strh r5, [r0, 0x2]
_08028D2C:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	bls _08028D0A
_08028D36:
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8028CF4

	thumb_func_start sub_8028D44
sub_8028D44: @ 8028D44
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x28
	movs r4, 0x80
	lsls r4, 3
	adds r0, r4, 0
	bl AllocZeroed
	adds r6, r0, 0
	ldr r0, =gUnknown_082FB360
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	ldr r0, =gUnknown_082F9774
	adds r1, r6, 0
	bl LZ77UnCompWram
	cmp r6, 0
	beq _08028DD2
	str r6, [sp, 0x18]
	add r0, sp, 0x18
	movs r1, 0xA0
	lsls r1, 11
	orrs r1, r4
	str r1, [r0, 0x4]
	mov r2, sp
	ldr r1, =gUnknown_082FB368
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	bl LoadObjectPic
	add r0, sp, 0x20
	bl LoadTaggedObjectPalette
	movs r5, 0
	ldr r7, =gUnknown_082FB356
	adds r0, r7, 0x2
	mov r9, r0
	ldr r1, =gUnknown_02022CB0
	mov r8, r1
_08028D9E:
	movs r0, 0x4
	bl AllocZeroed
	lsls r2, r5, 2
	mov r3, r8
	adds r4, r2, r3
	str r0, [r4]
	adds r0, r2, r7
	movs r3, 0
	ldrsh r1, [r0, r3]
	add r2, r9
	movs r0, 0
	ldrsh r2, [r2, r0]
	mov r0, sp
	movs r3, 0x4
	bl AddObjectToFront
	ldr r1, [r4]
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _08028D9E
_08028DD2:
	adds r0, r6, 0
	bl Free
	add sp, 0x28
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8028D44

	thumb_func_start sub_8028DFC
sub_8028DFC: @ 8028DFC
	push {r4-r7,lr}
	movs r3, 0
	ldr r0, =gUnknown_02022CB0
	mov r12, r0
	ldr r4, =gUnknown_082FB356
	adds r7, r4, 0x2
	ldr r6, =gUnknown_02020630
	movs r5, 0x1
_08028E0C:
	lsls r2, r3, 2
	mov r1, r12
	adds r0, r2, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r0, r1, 0
	adds r0, 0x42
	strh r5, [r0]
	adds r0, r2, r4
	ldrh r0, [r0]
	strh r0, [r1, 0x20]
	adds r2, r7
	ldrh r0, [r2]
	strh r0, [r1, 0x22]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	bls _08028E0C
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8028DFC

	thumb_func_start sub_8028E4C
sub_8028E4C: @ 8028E4C
	push {r4,r5,lr}
	movs r2, 0
	ldr r5, =gUnknown_02022CB0
	ldr r4, =gUnknown_02020630
	movs r3, 0
_08028E56:
	lsls r0, r2, 2
	adds r0, r5
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x42
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1
	bls _08028E56
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8028E4C

	thumb_func_start sub_8028E84
sub_8028E84: @ 8028E84
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, =gUnknown_02022CB0
_08028E8A:
	lsls r0, r5, 2
	adds r4, r0, r6
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, =gUnknown_02020630
	adds r0, r1
	cmp r0, 0
	beq _08028EA4
	bl RemoveObjectAndFreeTiles
_08028EA4:
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _08028E8A
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8028E84

	thumb_func_start sub_8028EC8
sub_8028EC8: @ 8028EC8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	ldr r7, =gUnknown_02020630
	ldr r6, =gUnknown_02022CB0
	movs r1, 0x1
	ands r0, r1
	lsls r4, r0, 2
	movs r5, 0x5
	negs r5, r5
_08028EDE:
	lsls r0, r3, 2
	adds r0, r6
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	bls _08028EDE
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8028EC8

	thumb_func_start sub_8028F14
sub_8028F14: @ 8028F14
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0
	subs r0, r1, 0x1
	cmp r0, 0x4
	bhi _08028FC6
	lsls r0, 2
	ldr r1, =_08028F34
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08028F34:
	.4byte _08028FB4
	.4byte _08028F48
	.4byte _08028F52
	.4byte _08028F66
	.4byte _08028F8E
_08028F48:
	cmp r2, 0
	beq _08028F7E
	cmp r2, 0x1
	bne _08028FC6
	b _08028F82
_08028F52:
	cmp r2, 0x1
	beq _08028FB8
	cmp r2, 0x1
	bgt _08028F60
	cmp r2, 0
	beq _08028FB4
	b _08028FC6
_08028F60:
	cmp r2, 0x2
	bne _08028FC6
	b _08028FC4
_08028F66:
	cmp r2, 0x1
	beq _08028F82
	cmp r2, 0x1
	bgt _08028F74
	cmp r2, 0
	beq _08028F7E
	b _08028FC6
_08028F74:
	cmp r2, 0x2
	beq _08028F86
	cmp r2, 0x3
	beq _08028F8A
	b _08028FC6
_08028F7E:
	movs r3, 0xC
	b _08028FC6
_08028F82:
	movs r3, 0x12
	b _08028FC6
_08028F86:
	movs r3, 0x18
	b _08028FC6
_08028F8A:
	movs r3, 0x6
	b _08028FC6
_08028F8E:
	cmp r2, 0x4
	bhi _08028FC6
	lsls r0, r2, 2
	ldr r1, =_08028FA0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08028FA0:
	.4byte _08028FB4
	.4byte _08028FB8
	.4byte _08028FBC
	.4byte _08028FC0
	.4byte _08028FC4
_08028FB4:
	movs r3, 0xF
	b _08028FC6
_08028FB8:
	movs r3, 0x15
	b _08028FC6
_08028FBC:
	movs r3, 0x1B
	b _08028FC6
_08028FC0:
	movs r3, 0x3
	b _08028FC6
_08028FC4:
	movs r3, 0x9
_08028FC6:
	lsls r0, r3, 3
	pop {r1}
	bx r1
	thumb_func_end sub_8028F14

	thumb_func_start sub_8028FCC
sub_8028FCC: @ 8028FCC
	push {r4,lr}
	movs r4, 0
_08028FD0:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8028BF8
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8028C7C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xA
	bls _08028FD0
	movs r0, 0
	bl sub_80289E8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8028FCC

	thumb_func_start sub_8028FF8
sub_8028FF8: @ 8028FF8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8098758
	ldr r1, [r0]
	movs r2, 0x90
	lsls r2, 1
	movs r0, 0
	movs r3, 0x1
	bl LoadBgTiles
	adds r0, r4, 0
	bl sub_8098758
	ldr r0, [r0, 0x4]
	movs r1, 0xA0
	movs r2, 0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8028FF8

	thumb_func_start sub_802902C
sub_802902C: @ 802902C
	push {lr}
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xB0
	bl box_border_load_tiles_and_pal
	pop {r0}
	bx r0
	thumb_func_end sub_802902C

	thumb_func_start sub_802903C
sub_802903C: @ 802903C
	ldr r3, =gUnknown_02022CF8
	ldr r0, [r3]
	movs r2, 0xC0
	lsls r2, 6
	adds r1, r0, r2
	movs r2, 0
	str r2, [r1]
	ldr r1, =0x00003014
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r3]
	adds r1, 0x4
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r3]
	adds r1, 0x8
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r3]
	adds r1, 0x4
	adds r0, r1
	strb r2, [r0]
	bx lr
	.pool
	thumb_func_end sub_802903C

	thumb_func_start sub_8029074
sub_8029074: @ 8029074
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	movs r6, 0xA
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r5, 0x1
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x1
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	ldrb r3, [r4, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4, 0x3]
	str r0, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	str r5, [sp]
	ldrb r0, [r4, 0x4]
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x4
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	str r5, [sp]
	ldrb r0, [r4, 0x4]
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x6
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x4]
	ldrb r0, [r4, 0x2]
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x7
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	ldrb r3, [r4, 0x4]
	ldrb r0, [r4, 0x2]
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4, 0x3]
	str r0, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x8
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x4]
	ldrb r4, [r4, 0x2]
	adds r3, r4
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x9
	bl FillBgTilemapBufferRect
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8029074

	thumb_func_start sub_8029174
sub_8029174: @ 8029174
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	movs r6, 0xB
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r5, 0x1
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0xA
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	ldrb r3, [r4, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4, 0x3]
	str r0, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0xB
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0xC
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	str r5, [sp]
	ldrb r0, [r4, 0x4]
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0xD
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	str r5, [sp]
	ldrb r0, [r4, 0x4]
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0xF
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x4]
	ldrb r0, [r4, 0x2]
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x10
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	ldrb r3, [r4, 0x4]
	ldrb r0, [r4, 0x2]
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4, 0x3]
	str r0, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x11
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x4]
	ldrb r4, [r4, 0x2]
	adds r3, r4
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x12
	bl FillBgTilemapBufferRect
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8029174

	thumb_func_start sub_8029274
sub_8029274: @ 8029274
	push {r4,lr}
	ldr r4, =gUnknown_02022CF8
	str r0, [r4]
	movs r2, 0xC0
	lsls r2, 6
	adds r1, r0, r2
	movs r2, 0
	str r2, [r1]
	ldr r3, =0x00003014
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, =0x00003018
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r4]
	adds r3, 0xC
	adds r0, r3
	strb r2, [r0]
	ldr r0, [r4]
	adds r1, 0xC
	adds r0, r1
	strb r2, [r0]
	ldr r0, =sub_8029314
	movs r1, 0x3
	bl CreateTask
	ldr r1, [r4]
	ldr r2, =0x00003004
	adds r1, r2
	strb r0, [r1]
	ldr r0, =sub_8029338
	bl sub_802A72C
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8029274

	thumb_func_start sub_80292D4
sub_80292D4: @ 80292D4
	push {lr}
	bl FreeAllWindowBuffers
	pop {r0}
	bx r0
	thumb_func_end sub_80292D4

	thumb_func_start sub_80292E0
sub_80292E0: @ 80292E0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r5, =gUnknown_082FB40C
	adds r7, r5, 0x4
_080292EC:
	lsls r1, r4, 3
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, r6
	bne _080292FE
	adds r0, r1, r7
	ldr r0, [r0]
	bl sub_802A72C
_080292FE:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _080292EC
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80292E0

	thumb_func_start sub_8029314
sub_8029314: @ 8029314
	push {lr}
	ldr r0, =gUnknown_02022CF8
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bne _0802932E
	bl sub_802A75C
	bl _call_via_r0
_0802932E:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8029314

	thumb_func_start sub_8029338
sub_8029338: @ 8029338
	push {lr}
	ldr r0, =gUnknown_02022CF8
	ldr r1, [r0]
	ldr r2, =0x00003014
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _08029430
	lsls r0, 2
	ldr r1, =_08029360
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08029360:
	.4byte _08029374
	.4byte _0802937A
	.4byte _08029394
	.4byte _080293D8
	.4byte _08029404
_08029374:
	bl sub_802A7A8
	b _08029414
_0802937A:
	bl sub_802A8E8
	cmp r0, 0x1
	bne _0802943A
	ldr r0, =gUnknown_02022CF8
	ldr r1, [r0]
	ldr r2, =0x00003014
	adds r1, r2
	b _0802941C
	.pool
_08029394:
	ldr r1, =gUnknown_082FAAD8
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r1, =gUnknown_082FAF94
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r1, =gUnknown_082FAD44
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	b _08029414
	.pool
_080293D8:
	movs r0, 0
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	ldr r0, =gUnknown_02022CF8
	ldr r1, [r0]
	ldr r2, =0x00003014
	adds r1, r2
	b _0802941C
	.pool
_08029404:
	ldr r0, =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x14]
	lsrs r0, 3
	bl sub_8028FF8
	bl sub_802902C
_08029414:
	ldr r0, =gUnknown_02022CF8
	ldr r1, [r0]
	ldr r0, =0x00003014
	adds r1, r0
_0802941C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0802943A
	.pool
_08029430:
	movs r2, 0xC0
	lsls r2, 6
	adds r1, r2
	movs r0, 0x1
	str r0, [r1]
_0802943A:
	pop {r0}
	bx r0
	thumb_func_end sub_8029338

	thumb_func_start sub_8029440
sub_8029440: @ 8029440
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r4, =gUnknown_02022CF8
	ldr r0, [r4]
	ldr r2, =0x00003014
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _08029488
	cmp r0, 0x1
	bne _08029460
	b _080295EC
_08029460:
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB4
	bhi _0802946E
	b _0802968E
_0802946E:
	bl sub_8027650
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	cmp r6, r7
	bcc _0802947E
	b _08029666
_0802947E:
	b _08029640
	.pool
_08029488:
	bl sub_8027650
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, =gUnknown_082FB3C8
	subs r0, r7, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r5, [r0]
	ldr r2, =0xffffff00
	ldr r0, [sp, 0xC]
	ands r0, r2
	ldr r1, =0x00ffffff
	ands r0, r1
	movs r1, 0xE0
	lsls r1, 19
	orrs r0, r1
	str r0, [sp, 0xC]
	ldr r0, [sp, 0x10]
	ands r0, r2
	movs r1, 0x2
	orrs r0, r1
	ldr r1, =0xffff00ff
	ands r0, r1
	movs r1, 0xD0
	lsls r1, 4
	orrs r0, r1
	ldr r1, =0x0000ffff
	ands r0, r1
	movs r1, 0x98
	lsls r1, 13
	orrs r0, r1
	str r0, [sp, 0x10]
	movs r6, 0
	cmp r6, r7
	bcs _080295B8
	mov r3, sp
	adds r3, 0xC
	str r3, [sp, 0x18]
	mov r10, r4
	ldr r0, =0x00003008
	mov r9, r0
_080294DC:
	movs r1, 0
	mov r8, r1
	adds r0, r6, 0
	bl sub_8027A48
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	bl sub_8027660
	adds r1, r0, 0
	movs r0, 0x1
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	movs r1, 0x38
	subs r1, r0
	lsrs r1, 1
	str r1, [sp, 0x14]
	ldrb r0, [r5]
	lsls r0, 8
	ldr r2, =0xffff00ff
	ldr r1, [sp, 0xC]
	ands r1, r2
	orrs r1, r0
	str r1, [sp, 0xC]
	ldrb r2, [r5, 0x1]
	lsls r2, 16
	ldr r0, =0xff00ffff
	ands r0, r1
	orrs r0, r2
	str r0, [sp, 0xC]
	add r0, sp, 0xC
	bl AddWindow
	mov r2, r10
	ldr r1, [r2]
	add r1, r9
	adds r1, r6
	strb r0, [r1]
	ldr r0, [r2]
	add r0, r9
	adds r0, r6
	ldrb r0, [r0]
	bl ClearWindowTilemap
	mov r3, r10
	ldr r0, [r3]
	add r0, r9
	adds r0, r6
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	bl link_get_multiplayer_id
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _0802955A
	movs r0, 0x2
	mov r8, r0
_0802955A:
	adds r0, r4, 0
	bl sub_8027660
	adds r4, r0, 0
	mov r1, r10
	ldr r0, [r1]
	add r0, r9
	adds r0, r6
	ldrb r0, [r0]
	ldr r3, [sp, 0x14]
	lsls r2, r3, 24
	lsrs r2, 24
	mov r3, r8
	lsls r1, r3, 1
	add r1, r8
	ldr r3, =gUnknown_082FB380
	adds r1, r3
	str r1, [sp]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0x1
	bl box_print
	mov r2, r10
	ldr r0, [r2]
	add r0, r9
	adds r0, r6
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r3, [sp, 0x18]
	ldrh r0, [r3, 0x6]
	adds r0, 0xE
	strh r0, [r3, 0x6]
	add r0, sp, 0xC
	bl sub_8029174
	adds r5, 0x4
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r7
	bcc _080294DC
_080295B8:
	ldr r0, =gUnknown_02022CF8
	ldr r1, [r0]
	ldr r0, =0x00003014
	adds r1, r0
	b _0802962A
	.pool
_080295EC:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0802968E
	bl sub_8027650
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	cmp r6, r7
	bcs _0802961C
_08029604:
	ldr r0, [r4]
	ldr r1, =0x00003008
	adds r0, r1
	adds r0, r6
	ldrb r0, [r0]
	bl PutWindowTilemap
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r7
	bcc _08029604
_0802961C:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, =gUnknown_02022CF8
	ldr r1, [r0]
	ldr r2, =0x00003014
	adds r1, r2
_0802962A:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0802968E
	.pool
_08029640:
	ldr r5, =gUnknown_02022CF8
	ldr r0, [r5]
	ldr r4, =0x00003008
	adds r0, r4
	adds r0, r6
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r5]
	adds r0, r4
	adds r0, r6
	ldrb r0, [r0]
	bl RemoveWindow
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r7
	bcc _08029640
_08029666:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, =gUnknown_02022CF8
	ldr r0, [r0]
	movs r3, 0xC0
	lsls r3, 6
	adds r0, r3
	movs r1, 0x1
	str r1, [r0]
_0802968E:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8029440

	thumb_func_start sub_80296A8
sub_80296A8: @ 80296A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x6C
	lsls r0, 24
	movs r1, 0
	mov r8, r1
	movs r6, 0
	lsrs r7, r0, 24
	add r4, sp, 0x2C
	ldr r1, =gUnknown_082FB45C
	adds r0, r4, 0
	movs r2, 0x5
	bl memcpy
	movs r5, 0
	cmp r5, r7
	bcs _080296F8
	add r4, sp, 0x34
_080296D2:
	mov r0, sp
	adds r0, r5
	adds r0, 0x2C
	strb r5, [r0]
	add r0, sp, 0x5C
	adds r1, r5, 0
	bl sub_802793C
	lsls r2, r5, 3
	adds r2, r4, r2
	ldr r0, [sp, 0x5C]
	ldr r1, [sp, 0x60]
	str r0, [r2]
	str r1, [r2, 0x4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _080296D2
_080296F8:
	bl sub_8027748
	cmp r0, 0
	beq _0802972E
_08029700:
	movs r5, 0
	cmp r5, r7
	bcs _08029728
	add r2, sp, 0x34
	add r1, sp, 0x2C
_0802970A:
	lsls r0, r5, 3
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, r8
	bne _0802971E
	adds r0, r1, r6
	strb r5, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0802971E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _0802970A
_08029728:
	mov r8, r6
	cmp r6, r7
	bcc _08029700
_0802972E:
	movs r5, 0
	ldr r4, =gUnknown_085EDE5D
	cmp r5, r7
	bcs _08029754
	add r1, sp, 0x34
	add r6, sp, 0x38
	subs r3, r7, 0x1
_0802973C:
	lsls r2, r5, 3
	adds r0, r6, r2
	ldr r0, [r0]
	cmp r0, 0
	bne _0802974A
	adds r0, r1, r2
	strb r3, [r0]
_0802974A:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _0802973C
_08029754:
	movs r0, 0x1
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	movs r1, 0xD8
	subs r1, r0
	str r1, [sp, 0x64]
	movs r5, 0
	cmp r5, r7
	bcs _08029860
	mov r2, sp
	adds r2, 0x34
	str r2, [sp, 0x68]
	ldr r3, =0x00003009
	mov r10, r3
_08029774:
	movs r0, 0
	mov r8, r0
	mov r0, sp
	adds r0, r5
	adds r0, 0x2C
	ldrb r0, [r0]
	adds r4, r0, 0
	lsls r1, r4, 3
	add r0, sp, 0x38
	adds r0, r1
	ldr r0, [r0]
	mov r9, r0
	ldr r2, =gUnknown_02022CF8
	ldr r0, [r2]
	add r0, r10
	ldrb r0, [r0]
	ldr r2, =gUnknown_082FB3DC
	ldr r3, [sp, 0x68]
	adds r1, r3, r1
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r2, [r1]
	ldr r3, =gUnknown_082FB402
	lsls r1, r5, 1
	adds r1, r3
	ldrb r6, [r1]
	str r6, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	mov r3, r8
	str r3, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0x8
	bl Print
	bl link_get_multiplayer_id
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _080297CC
	movs r0, 0x2
	mov r8, r0
_080297CC:
	adds r0, r4, 0
	bl sub_8027660
	adds r3, r0, 0
	ldr r1, =gUnknown_02022CF8
	ldr r0, [r1]
	add r0, r10
	ldrb r0, [r0]
	mov r2, r8
	lsls r1, r2, 1
	add r1, r8
	ldr r2, =gUnknown_082FB380
	adds r1, r2
	str r1, [sp]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0x4]
	str r3, [sp, 0x8]
	movs r1, 0x1
	movs r2, 0x1C
	adds r3, r6, 0
	bl box_print
	add r0, sp, 0xC
	mov r1, r9
	movs r2, 0
	movs r3, 0x7
	bl ConvertIntToDecimalStringN
	movs r0, 0x1
	add r1, sp, 0xC
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	adds r3, r0, 0
	ldr r2, =gUnknown_02022CF8
	ldr r0, [r2]
	add r0, r10
	ldrb r0, [r0]
	ldr r1, [sp, 0x64]
	subs r3, r1, r3
	lsls r3, 24
	lsrs r3, 24
	str r6, [sp]
	movs r2, 0xFF
	str r2, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x1
	add r2, sp, 0xC
	bl Print
	ldr r2, =gUnknown_02022CF8
	ldr r0, [r2]
	add r0, r10
	ldrb r0, [r0]
	ldr r1, [sp, 0x64]
	lsls r3, r1, 24
	str r6, [sp]
	movs r2, 0xFF
	str r2, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x1
	ldr r2, =gUnknown_085EDE5D
	lsrs r3, 24
	bl Print
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _08029774
_08029860:
	add sp, 0x6C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80296A8

	thumb_func_start sub_802988C
sub_802988C: @ 802988C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	bl sub_8027650
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	ldr r6, =gUnknown_02022CF8
	ldr r1, [r6]
	ldr r2, =0x00003014
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0xB
	bls _080298B2
	b _08029FA8
_080298B2:
	lsls r0, 2
	ldr r1, =_080298C8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_080298C8:
	.4byte _080298F8
	.4byte _08029914
	.4byte _0802996C
	.4byte _08029B6C
	.4byte _08029BB8
	.4byte _08029BFC
	.4byte _08029C60
	.4byte _08029C9C
	.4byte _08029CE0
	.4byte _08029DA0
	.4byte _08029F08
	.4byte _08029F5C
_080298F8:
	bl sub_802784C
	ldr r0, =gUnknown_02022CF8
	ldr r1, [r0]
	ldr r0, =0x0000301c
	adds r2, r1, r0
	movs r0, 0
	strh r0, [r2]
	b _08029F8A
	.pool
_08029914:
	ldr r6, =gUnknown_082F7BBC
	adds r0, r6, 0
	bl AddWindow
	ldr r4, =gUnknown_02022CF8
	ldr r1, [r4]
	ldr r2, =0x00003008
	mov r8, r2
	add r1, r8
	strb r0, [r1]
	movs r0, 0x8
	adds r0, r6
	mov r9, r0
	bl AddWindow
	ldr r1, [r4]
	ldr r5, =0x00003009
	adds r1, r5
	strb r0, [r1]
	ldr r0, [r4]
	add r0, r8
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r6, 0
	bl sub_8029174
	mov r0, r9
	bl sub_8029174
	b _08029F88
	.pool
_0802996C:
	ldr r4, =gUnknown_02022CF8
	ldr r0, [r4]
	ldr r5, =0x00003008
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	ldr r1, =0x00003009
	mov r9, r1
	add r0, r9
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, =gUnknown_085EDD49
	mov r8, r2
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x1
	mov r1, r8
	bl GetStringWidth
	adds r1, r0, 0
	movs r0, 0xE0
	subs r0, r1
	lsrs r3, r0, 1
	ldr r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0x1
	str r1, [sp]
	movs r6, 0xFF
	str r6, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	mov r2, r8
	bl Print
	ldr r0, [r4]
	add r0, r9
	ldrb r0, [r0]
	ldr r2, =gUnknown_085EDD6B
	movs r1, 0x11
	str r1, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0x44
	bl Print
	mov r9, r5
	ldr r0, [sp, 0xC]
	cmp r9, r0
	bcc _080299E2
	b _08029B2A
_080299E2:
	movs r4, 0
	bl link_get_multiplayer_id
	lsls r0, 24
	lsrs r0, 24
	cmp r9, r0
	bne _080299F2
	movs r4, 0x2
_080299F2:
	mov r0, r9
	bl sub_8027660
	adds r6, r0, 0
	ldr r0, =gUnknown_02022CF8
	ldr r0, [r0]
	ldr r1, =0x00003009
	adds r0, r1
	ldrb r0, [r0]
	mov r2, r9
	lsls r5, r2, 1
	ldr r2, =gUnknown_082FB3F8
	adds r1, r5, r2
	ldrb r3, [r1]
	lsls r1, r4, 1
	adds r1, r4
	ldr r2, =gUnknown_082FB380
	adds r1, r2
	str r1, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r1, 0x1
	movs r2, 0
	bl box_print
	movs r7, 0
	mov r8, r5
	mov r0, r9
	adds r0, 0x1
	str r0, [sp, 0x10]
	ldr r1, =gStringVar4
	mov r10, r1
_08029A36:
	mov r0, r9
	adds r1, r7, 0
	bl sub_80276A0
	lsls r0, 16
	lsrs r0, 16
	ldr r1, =0x0000270f
	bl sub_8027A38
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	bl sub_802778C
	ldr r1, =0x0000270f
	bl sub_8027A38
	lsls r0, 16
	lsrs r6, r0, 16
	mov r0, r10
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	movs r0, 0x1
	mov r1, r10
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	adds r5, r0, 0
	cmp r6, r4
	bne _08029AE0
	cmp r6, 0
	beq _08029AE0
	ldr r0, =gUnknown_02022CF8
	ldr r0, [r0]
	ldr r2, =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	lsls r1, r7, 1
	ldr r2, =gUnknown_082FB3F0
	adds r1, r2
	ldrb r2, [r1]
	subs r2, r5
	lsls r2, 24
	lsrs r2, 24
	ldr r1, =gUnknown_082FB3F8
	add r1, r8
	ldrb r3, [r1]
	ldr r1, =gUnknown_082FB383
	str r1, [sp]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0x4]
	mov r1, r10
	str r1, [sp, 0x8]
	movs r1, 0x1
	bl box_print
	b _08029B10
	.pool
_08029AE0:
	ldr r0, =gUnknown_02022CF8
	ldr r0, [r0]
	ldr r2, =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	lsls r1, r7, 1
	ldr r2, =gUnknown_082FB3F0
	adds r1, r2
	ldrb r3, [r1]
	subs r3, r5
	lsls r3, 24
	lsrs r3, 24
	ldr r1, =gUnknown_082FB3F8
	add r1, r8
	ldrb r1, [r1]
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x1
	ldr r2, =gStringVar4
	bl Print
_08029B10:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bls _08029A36
	ldr r1, [sp, 0x10]
	lsls r0, r1, 24
	lsrs r0, 24
	mov r9, r0
	ldr r2, [sp, 0xC]
	cmp r9, r2
	bcs _08029B2A
	b _080299E2
_08029B2A:
	ldr r4, =gUnknown_02022CF8
	ldr r0, [r4]
	ldr r1, =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r4]
	ldr r0, =0x00003014
	adds r1, r0
	b _08029F8E
	.pool
_08029B6C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08029B90
	ldr r4, =gUnknown_02022CF8
	ldr r0, [r4]
	ldr r1, =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldr r2, =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	bl PutWindowTilemap
_08029B90:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl sub_8028C30
	ldr r0, =gUnknown_02022CF8
	ldr r1, [r0]
	ldr r0, =0x00003014
	adds r1, r0
	b _08029F8E
	.pool
_08029BB8:
	ldr r4, =gUnknown_02022CF8
	ldr r0, [r4]
	ldr r1, =0x0000301c
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1D
	bhi _08029BD0
	b _08029FF8
_08029BD0:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08029BDE
	b _08029FF8
_08029BDE:
	movs r0, 0
	strh r0, [r2]
	movs r0, 0x5
	bl audio_play
	movs r0, 0x1
	bl sub_8028C30
	b _08029F88
	.pool
_08029BFC:
	ldr r4, =gUnknown_02022CF8
	ldr r0, [r4]
	ldr r5, =0x00003008
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	ldr r1, =0x00003009
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r6, =gUnknown_085EDD86
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x1
	adds r1, r6, 0
	bl GetStringWidth
	adds r1, r0, 0
	movs r0, 0xE0
	subs r0, r1
	lsrs r3, r0, 1
	ldr r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x1
	adds r2, r6, 0
	bl Print
	b _08029F88
	.pool
_08029C60:
	ldr r0, [sp, 0xC]
	bl sub_80296A8
	ldr r4, =gUnknown_02022CF8
	ldr r0, [r4]
	ldr r1, =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r4]
	ldr r0, =0x00003014
	adds r1, r0
	b _08029F8E
	.pool
_08029C9C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08029CC0
	ldr r4, =gUnknown_02022CF8
	ldr r0, [r4]
	ldr r1, =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldr r2, =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	bl PutWindowTilemap
_08029CC0:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, =gUnknown_02022CF8
	ldr r1, [r0]
	ldr r0, =0x00003014
	adds r1, r0
	b _08029F8E
	.pool
_08029CE0:
	ldr r4, =gUnknown_02022CF8
	ldr r0, [r4]
	ldr r1, =0x0000301c
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1D
	bhi _08029CF8
	b _08029FF8
_08029CF8:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08029D06
	b _08029FF8
_08029D06:
	movs r0, 0
	strh r0, [r2]
	movs r0, 0x5
	bl audio_play
	bl sub_8027748
	ldr r1, =0x00000bb7
	cmp r0, r1
	bhi _08029D3C
	ldr r0, [r4]
	ldr r2, =0x00003014
	adds r0, r2
	movs r1, 0x7F
	strb r1, [r0]
	b _08029D4C
	.pool
_08029D3C:
	bl sub_80A2F30
	ldr r1, [r4]
	ldr r0, =0x00003014
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08029D4C:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0xF
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x5
	bl FillBgTilemapBufferRect_Palette0
	ldr r5, =gUnknown_02022CF8
	ldr r0, [r5]
	ldr r4, =0x00003009
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r6, =gUnknown_082F7BCC
	adds r0, r6, 0
	bl AddWindow
	ldr r1, [r5]
	adds r1, r4
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r6, 0
	bl sub_8029174
	b _08029FF8
	.pool
_08029DA0:
	ldr r0, =0x0000016f
	bl current_map_music_set
	ldr r4, =gUnknown_02022CF8
	ldr r0, [r4]
	ldr r6, =0x00003008
	adds r0, r6
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	ldr r1, =0x00003009
	mov r10, r1
	add r0, r10
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r5, =gUnknown_085EDD9B
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x1
	adds r1, r5, 0
	bl GetStringWidth
	adds r1, r0, 0
	movs r0, 0xE0
	subs r0, r1
	lsrs r3, r0, 1
	ldr r0, [r4]
	adds r0, r6
	ldrb r0, [r0]
	lsls r3, 24
	lsrs r3, 24
	movs r2, 0x1
	mov r9, r2
	str r2, [sp]
	movs r1, 0xFF
	mov r8, r1
	str r1, [sp, 0x4]
	movs r6, 0
	str r6, [sp, 0x8]
	movs r1, 0x1
	adds r2, r5, 0
	bl Print
	bl sub_81AFBF0
	bl sub_802762C
	lsls r0, 16
	lsrs r0, 16
	ldr r5, =gStringVar1
	adds r1, r5, 0
	bl itemid_get_name
	movs r0, 0
	adds r1, r5, 0
	bl sub_81AFC0C
	ldr r7, =gStringVar4
	ldr r1, =gUnknown_085EDDBD
	adds r0, r7, 0
	bl sub_81AFC28
	ldr r0, [r4]
	add r0, r10
	ldrb r0, [r0]
	mov r2, r9
	str r2, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r1, 0x1
	adds r2, r7, 0
	movs r3, 0
	bl Print
	bl sub_80279C8
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	cmp r4, 0
	beq _08029EC8
	cmp r4, 0x3
	beq _08029EC8
	bl sub_81AFBF0
	bl sub_802762C
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	bl itemid_get_name
	movs r0, 0
	adds r1, r5, 0
	bl sub_81AFC0C
	cmp r4, 0x2
	bne _08029E9C
	ldr r1, =gUnknown_085EDDE2
	adds r0, r7, 0
	bl sub_81AFC28
	b _08029EA8
	.pool
_08029E9C:
	cmp r6, 0x1
	bne _08029EA8
	ldr r1, =gUnknown_085EDDFB
	adds r0, r7, 0
	bl sub_81AFC28
_08029EA8:
	ldr r0, =gUnknown_02022CF8
	ldr r0, [r0]
	ldr r2, =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	ldr r2, =gStringVar4
	movs r1, 0x29
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0
	bl Print
_08029EC8:
	ldr r4, =gUnknown_02022CF8
	ldr r0, [r4]
	ldr r1, =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r4]
	ldr r0, =0x00003014
	adds r1, r0
	b _08029F8E
	.pool
_08029F08:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08029F2C
	ldr r4, =gUnknown_02022CF8
	ldr r0, [r4]
	ldr r1, =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldr r2, =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	bl PutWindowTilemap
_08029F2C:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, =0x0000020b
	movs r1, 0x14
	movs r2, 0xA
	bl sub_80A2FBC
	ldr r0, =gUnknown_02022CF8
	ldr r1, [r0]
	ldr r0, =0x00003014
	adds r1, r0
	b _08029F8E
	.pool
_08029F5C:
	ldr r4, =gUnknown_02022CF8
	ldr r0, [r4]
	ldr r1, =0x0000301c
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1D
	bls _08029FF8
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08029FF8
	movs r0, 0
	strh r0, [r2]
	movs r0, 0x5
	bl audio_play
_08029F88:
	ldr r1, [r4]
_08029F8A:
	ldr r2, =0x00003014
	adds r1, r2
_08029F8E:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08029FF8
	.pool
_08029FA8:
	ldr r5, =0x00003008
	adds r0, r1, r5
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r6]
	ldr r4, =0x00003009
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r6]
	adds r0, r5
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, [r6]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
_08029FF8:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_802988C

	thumb_func_start sub_802A010
sub_802A010: @ 802A010
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r1, =gUnknown_02022CF8
	ldr r2, [r1]
	ldr r3, =0x00003014
	adds r0, r2, r3
	ldrb r6, [r0]
	adds r7, r1, 0
	cmp r6, 0x1
	beq _0802A0CC
	cmp r6, 0x1
	bgt _0802A040
	cmp r6, 0
	beq _0802A04E
	b _0802A2FC
	.pool
_0802A040:
	cmp r6, 0x2
	bne _0802A046
	b _0802A194
_0802A046:
	cmp r6, 0x3
	bne _0802A04C
	b _0802A1D0
_0802A04C:
	b _0802A2FC
_0802A04E:
	ldr r0, =gUnknown_082F7BD4
	mov r9, r0
	bl AddWindow
	ldr r1, [r7]
	ldr r4, =0x00003008
	adds r1, r4
	strb r0, [r1]
	movs r1, 0x8
	add r1, r9
	mov r8, r1
	mov r0, r8
	bl AddWindow
	ldr r1, [r7]
	ldr r2, =0x00003009
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r7]
	ldr r3, =0x00003009
	adds r0, r3
	ldrb r0, [r0]
	bl ClearWindowTilemap
	mov r0, r9
	bl sub_8029174
	mov r0, r8
	bl sub_8029074
	ldr r1, [r7]
	ldr r0, =0x00003014
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r7]
	ldr r1, =0x00003020
	adds r0, r1
	strb r6, [r0]
	ldr r0, [r7]
	ldr r2, =0x00003024
	adds r0, r2
	strb r6, [r0]
	b _0802A35E
	.pool
_0802A0CC:
	ldr r3, =0x00003008
	mov r8, r3
	adds r0, r2, r3
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r7]
	ldr r1, =0x00003009
	mov r10, r1
	add r0, r10
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r7]
	add r0, r8
	ldrb r0, [r0]
	ldr r2, =gUnknown_085EDE18
	movs r1, 0x5
	str r1, [sp]
	movs r3, 0xFF
	mov r9, r3
	str r3, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0
	bl Print
	ldr r0, [r7]
	add r0, r10
	ldrb r0, [r0]
	ldr r2, =gUnknown_085EAE62
	str r6, [sp]
	mov r3, r9
	str r3, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0x8
	bl Print
	ldr r0, [r7]
	add r0, r10
	ldrb r0, [r0]
	ldr r2, =gUnknown_085EAE66
	movs r1, 0x11
	str r1, [sp]
	mov r3, r9
	str r3, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0x8
	bl Print
	ldr r0, [r7]
	add r0, r10
	ldrb r0, [r0]
	ldr r2, =gUnknown_085E8D60
	str r6, [sp]
	mov r3, r9
	str r3, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0
	bl Print
	ldr r0, [r7]
	add r0, r8
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r7]
	add r0, r10
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r7]
	ldr r2, =0x00003014
	adds r1, r2
	b _0802A2EA
	.pool
_0802A194:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0802A1B6
	ldr r0, [r7]
	ldr r3, =0x00003008
	adds r0, r3
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r7]
	ldr r1, =0x00003009
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
_0802A1B6:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r1, [r7]
	ldr r2, =0x00003014
	adds r1, r2
	b _0802A2EA
	.pool
_0802A1D0:
	ldr r3, =0x00003020
	adds r0, r2, r3
	ldrb r5, [r0]
	cmp r5, 0
	bne _0802A1DC
	movs r5, 0x1
_0802A1DC:
	ldr r0, =0x00003009
	mov r8, r0
	adds r0, r2, r0
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r7]
	add r0, r8
	ldrb r0, [r0]
	ldr r2, =gUnknown_085EAE62
	movs r1, 0x1
	str r1, [sp]
	movs r3, 0xFF
	mov r10, r3
	str r3, [sp, 0x4]
	movs r1, 0
	mov r9, r1
	str r1, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0x8
	bl Print
	ldr r0, [r7]
	add r0, r8
	ldrb r0, [r0]
	ldr r2, =gUnknown_085EAE66
	movs r1, 0x11
	str r1, [sp]
	mov r3, r10
	str r3, [sp, 0x4]
	mov r1, r9
	str r1, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0x8
	bl Print
	ldr r0, [r7]
	add r0, r8
	ldrb r0, [r0]
	ldr r2, =gUnknown_085E8D60
	subs r1, r5, 0x1
	lsls r1, 4
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	mov r3, r10
	str r3, [sp, 0x4]
	mov r1, r9
	str r1, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0
	bl Print
	ldr r0, [r7]
	add r0, r8
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r5, 0x1
	movs r2, 0x1
	ands r2, r1
	cmp r2, 0
	beq _0802A294
	movs r0, 0x5
	bl audio_play
	ldr r0, [r7]
	ldr r3, =0x00003020
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, 0
	bne _0802A2E4
	strb r5, [r1]
	b _0802A2E4
	.pool
_0802A294:
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _0802A2CC
	movs r0, 0x5
	bl audio_play
	ldr r0, [r7]
	ldr r2, =0x00003020
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0x1
	beq _0802A2C2
	cmp r0, 0x1
	bgt _0802A2BC
	cmp r0, 0
	beq _0802A2C2
	b _0802A35E
	.pool
_0802A2BC:
	cmp r0, 0x2
	beq _0802A2C8
	b _0802A35E
_0802A2C2:
	movs r0, 0x2
	strb r0, [r1]
	b _0802A35E
_0802A2C8:
	strb r5, [r1]
	b _0802A35E
_0802A2CC:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802A35E
	movs r0, 0x5
	bl audio_play
	ldr r0, [r7]
	ldr r3, =0x00003020
	adds r0, r3
	movs r1, 0x2
	strb r1, [r0]
_0802A2E4:
	ldr r1, [r7]
	ldr r0, =0x00003014
	adds r1, r0
_0802A2EA:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0802A35E
	.pool
_0802A2FC:
	ldr r0, [r7]
	ldr r2, =0x00003020
	adds r1, r0, r2
	ldrb r1, [r1]
	ldr r3, =0x00003024
	adds r0, r3
	strb r1, [r0]
	ldr r0, [r7]
	ldr r6, =0x00003008
	adds r0, r6
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r7]
	ldr r1, =0x00003009
	adds r0, r1
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r7]
	adds r0, r6
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r0, [r7]
	ldr r2, =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	bl RemoveWindow
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, [r7]
	movs r3, 0xC0
	lsls r3, 6
	adds r0, r3
	movs r1, 0x1
	str r1, [r0]
_0802A35E:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_802A010

	thumb_func_start sub_802A380
sub_802A380: @ 802A380
	push {r4-r6,lr}
	sub sp, 0x10
	ldr r5, =gUnknown_02022CF8
	ldr r0, [r5]
	ldr r6, =0x00003014
	adds r0, r6
	ldrb r4, [r0]
	cmp r4, 0x1
	beq _0802A3D8
	cmp r4, 0x1
	bgt _0802A3A4
	cmp r4, 0
	beq _0802A3AE
	b _0802A420
	.pool
_0802A3A4:
	cmp r4, 0x2
	beq _0802A3EC
	cmp r4, 0x3
	beq _0802A404
	b _0802A420
_0802A3AE:
	movs r0, 0
	movs r1, 0
	bl sub_81973C4
	ldr r2, =gUnknown_082C8959
	str r4, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x1
	movs r3, 0
	bl AddTextPrinterParametrized
	b _0802A410
	.pool
_0802A3D8:
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r1, [r5]
	ldr r0, =0x00003014
	adds r1, r0
	b _0802A414
	.pool
_0802A3EC:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0802A448
	ldr r0, =sub_8153688
	movs r1, 0
	bl CreateTask
	b _0802A410
	.pool
_0802A404:
	ldr r0, =sub_8153688
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _0802A448
_0802A410:
	ldr r1, [r5]
	adds r1, r6
_0802A414:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0802A448
	.pool
_0802A420:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, =gUnknown_02022CF8
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
_0802A448:
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_802A380

	thumb_func_start sub_802A454
sub_802A454: @ 802A454
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r1, =gUnknown_02022CF8
	ldr r2, [r1]
	ldr r6, =0x00003014
	adds r0, r2, r6
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0x1
	beq _0802A4AC
	cmp r0, 0x1
	bgt _0802A47C
	cmp r0, 0
	beq _0802A482
	b _0802A520
	.pool
_0802A47C:
	cmp r0, 0x2
	beq _0802A4F4
	b _0802A520
_0802A482:
	ldr r4, =gUnknown_082F7BEC
	adds r0, r4, 0
	bl AddWindow
	ldr r1, [r5]
	ldr r2, =0x00003008
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r2
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r4, 0
	bl sub_8029174
	b _0802A510
	.pool
_0802A4AC:
	ldr r4, =0x00003008
	adds r0, r2, r4
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	ldr r2, =gUnknown_085EDE65
	movs r1, 0x5
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0
	bl Print
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r5]
	ldr r0, =0x00003014
	adds r1, r0
	b _0802A514
	.pool
_0802A4F4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0802A50A
	ldr r0, [r5]
	ldr r1, =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
_0802A50A:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_0802A510:
	ldr r1, [r5]
	adds r1, r6
_0802A514:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0802A52C
	.pool
_0802A520:
	ldr r0, [r5]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
_0802A52C:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_802A454

	thumb_func_start sub_802A534
sub_802A534: @ 802A534
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r5, =gUnknown_02022CF8
	ldr r0, [r5]
	ldr r4, =0x00003008
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, [r5]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_802A534

	thumb_func_start sub_802A588
sub_802A588: @ 802A588
	push {r4-r7,lr}
	sub sp, 0xC
	ldr r0, =gUnknown_02022CF8
	ldr r1, [r0]
	ldr r7, =0x00003014
	adds r2, r1, r7
	ldrb r5, [r2]
	adds r6, r0, 0
	cmp r5, 0x1
	beq _0802A610
	cmp r5, 0x1
	bgt _0802A5B0
	cmp r5, 0
	beq _0802A5BA
	b _0802A6A4
	.pool
_0802A5B0:
	cmp r5, 0x2
	beq _0802A658
	cmp r5, 0x3
	beq _0802A684
	b _0802A6A4
_0802A5BA:
	ldr r4, =gUnknown_082F7BE4
	adds r0, r4, 0
	bl AddWindow
	ldr r1, [r6]
	ldr r2, =0x00003008
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r2
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r4, 0
	bl sub_8029174
	ldr r1, [r6]
	adds r1, r7
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r6]
	ldr r2, =0x0000301c
	adds r1, r0, r2
	movs r2, 0
	strh r5, [r1]
	ldr r1, =0x00003020
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r6]
	adds r1, 0x4
	adds r0, r1
	strb r2, [r0]
	b _0802A6EA
	.pool
_0802A610:
	ldr r4, =0x00003008
	adds r0, r1, r4
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	ldr r2, =gUnknown_085EDE2C
	movs r1, 0x5
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0
	bl Print
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r6]
	ldr r2, =0x00003014
	adds r1, r2
	b _0802A678
	.pool
_0802A658:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0802A66E
	ldr r0, [r6]
	ldr r1, =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
_0802A66E:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r1, [r6]
	adds r1, r7
_0802A678:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0802A6EA
	.pool
_0802A684:
	ldr r0, =0x0000301c
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x77
	bls _0802A6EA
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	b _0802A6EA
	.pool
_0802A6A4:
	ldr r0, [r6]
	ldr r1, =0x00003024
	adds r0, r1
	movs r1, 0x5
	strb r1, [r0]
	ldr r0, [r6]
	ldr r4, =0x00003008
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	movs r0, 0x1E