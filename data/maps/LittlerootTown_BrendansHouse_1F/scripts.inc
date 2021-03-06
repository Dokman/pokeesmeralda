.set LOCALID_MOM, 1
.set LOCALID_RIVAL_MOM, 4
.set LOCALID_RIVAL, 7

LittlerootTown_BrendansHouse_1F_MapScripts:: @ 81F7755
	map_script MAP_SCRIPT_ON_LOAD, LittlerootTown_BrendansHouse_1F_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, LittlerootTown_BrendansHouse_1F_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, LittlerootTown_BrendansHouse_1F_OnFrame
	.byte 0

LittlerootTown_BrendansHouse_1F_OnLoad: @ 81F7765
	compare VAR_LITTLEROOT_INTRO_STATE, 6
	call_if_lt LittlerootTown_BrendansHouse_1F_EventScript_SetMovingBoxes
	call_if_set FLAG_RECEIVED_RUNNING_SHOES, LittlerootTown_BrendansHouse_1F_EventScript_CheckShowShoesManual
	end

LittlerootTown_BrendansHouse_1F_EventScript_SetMovingBoxes:: @ 81F777A
	setmetatile 5, 4, METATILE_BrendansMaysHouse_MovingBox_Open, 1
	setmetatile 5, 2, METATILE_BrendansMaysHouse_MovingBox_Closed, 1
	return

LittlerootTown_BrendansHouse_1F_EventScript_CheckShowShoesManual:: @ 81F778D
	checkplayergender
	compare VAR_RESULT, MALE
	goto_if_eq LittlerootTown_BrendansHouse_1F_EventScript_ShowRunningShoesManual
	return

LittlerootTown_BrendansHouse_1F_EventScript_ShowRunningShoesManual:: @ 81F779A
	setmetatile 3, 7, METATILE_BrendansMaysHouse_BookOnTable, 1
	return

LittlerootTown_BrendansHouse_1F_OnTransition: @ 81F77A4
	compare VAR_LITTLEROOT_INTRO_STATE, 3
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_MoveMomToDoor
	compare VAR_LITTLEROOT_INTRO_STATE, 5
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_MoveMomToStairs
	compare VAR_LITTLEROOT_INTRO_STATE, 6
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_MoveMomToTV
	end

LittlerootTown_BrendansHouse_1F_EventScript_MoveMomToStairs:: @ 81F77C6
	setobjectxyperm LOCALID_MOM, 8, 4
	setobjectmovementtype LOCALID_MOM, MOVEMENT_TYPE_FACE_UP
	return

LittlerootTown_BrendansHouse_1F_EventScript_MoveMomToTV:: @ 81F77D2
	setobjectxyperm LOCALID_MOM, 4, 5
	setobjectmovementtype LOCALID_MOM, MOVEMENT_TYPE_FACE_UP
	return

LittlerootTown_BrendansHouse_1F_EventScript_MoveMomToDoor:: @ 81F77DE
	setobjectxyperm LOCALID_MOM, 9, 8
	setobjectmovementtype LOCALID_MOM, MOVEMENT_TYPE_FACE_UP
	return

@ Many of the below scripts have no gender check because they assume youre in the correct house
@ The below SS Ticket script uses Mays house state by accident(?), but theyre both set identically after the intro
LittlerootTown_BrendansHouse_1F_OnFrame: @ 81F77EA
	map_script_2 VAR_LITTLEROOT_INTRO_STATE, 3, LittlerootTown_BrendansHouse_1F_EventScript_EnterHouseMovingIn
	map_script_2 VAR_LITTLEROOT_INTRO_STATE, 5, LittlerootTown_BrendansHouse_1F_EventScript_GoUpstairsToSetClock
	map_script_2 VAR_LITTLEROOT_INTRO_STATE, 6, LittlerootTown_BrendansHouse_1F_EventScript_PetalburgGymReport
	map_script_2 VAR_LITTLEROOT_HOUSES_STATE_MAY, 1, LittlerootTown_BrendansHouse_1F_EventScript_YoureNewNeighbor
	map_script_2 VAR_LITTLEROOT_HOUSES_STATE_MAY, 3, PlayersHouse_1F_EventScript_GetSSTicketAndSeeLatiTV
	.2byte 0

LittlerootTown_BrendansHouse_1F_EventScript_GoUpstairsToSetClock:: @ 81F7814
	lockall
	msgbox PlayersHouse_1F_Text_GoSetTheClock, MSGBOX_DEFAULT
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, LittlerootTown_BrendansHouse_1F_Movement_PushTowardStairs
	applymovement LOCALID_MOM, LittlerootTown_BrendansHouse_1F_Movement_PushTowardStairs
	waitmovement 0
	warp MAP_LITTLEROOT_TOWN_BRENDANS_HOUSE_2F, 255, 7, 1
	waitstate
	releaseall
	end

LittlerootTown_BrendansHouse_1F_Movement_PushTowardStairs: @ 81F783A
	walk_up
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_EnterHouseMovingIn:: @ 81F783C
	lockall
	setvar VAR_0x8004, LOCALID_MOM
	setvar VAR_0x8005, MALE
	goto PlayersHouse_1F_EventScript_EnterHouseMovingIn
	end

LittlerootTown_BrendansHouse_1F_EventScript_PetalburgGymReport:: @ 81F784D
	lockall
	setvar VAR_0x8004, MALE
	setvar VAR_0x8005, LOCALID_MOM
	goto PlayersHouse_1F_EventScript_PetalburgGymReportMale
	end

LittlerootTown_BrendansHouse_1F_EventScript_YoureNewNeighbor:: @ 81F785E
	lockall
	playse SE_PIN
	applymovement LOCALID_RIVAL_MOM, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement LOCALID_RIVAL_MOM, Common_Movement_Delay48
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	applymovement LOCALID_RIVAL_MOM, LittlerootTown_BrendansHouse_1F_Movement_RivalMomApproach
	waitmovement 0
	special GetRivalSonDaughterString
	msgbox RivalsHouse_1F_Text_OhYoureTheNewNeighbor, MSGBOX_DEFAULT
	setflag FLAG_MET_RIVAL_MOM
	setvar VAR_LITTLEROOT_HOUSES_STATE_MAY, 2
	releaseall
	end

LittlerootTown_BrendansHouse_1F_Movement_RivalMomApproach: @ 81F789C
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_GoSeeRoom:: @ 81F78A3
	lockall
	setvar VAR_0x8004, LOCALID_MOM
	setvar VAR_0x8005, MALE
	applymovement VAR_0x8004, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	goto PlayersHouse_1F_EventScript_MomGoSeeRoom
	end

LittlerootTown_BrendansHouse_1F_EventScript_MeetRival0:: @ 81F78BE
	lockall
	setvar VAR_0x8008, 0
	goto LittlerootTown_BrendansHouse_1F_EventScript_MeetRival
	end

LittlerootTown_BrendansHouse_1F_EventScript_MeetRival1:: @ 81F78CA
	lockall
	setvar VAR_0x8008, 1
	goto LittlerootTown_BrendansHouse_1F_EventScript_MeetRival
	end

LittlerootTown_BrendansHouse_1F_EventScript_MeetRival2:: @ 81F78D6
	lockall
	setvar VAR_0x8008, 2
	goto LittlerootTown_BrendansHouse_1F_EventScript_MeetRival
	end

LittlerootTown_BrendansHouse_1F_EventScript_MeetRival:: @ 81F78E2
	playse SE_EXIT
	delay 10
	addobject LOCALID_RIVAL
	delay 30
	playse SE_PIN
	applymovement LOCALID_RIVAL, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement LOCALID_RIVAL, Common_Movement_Delay48
	waitmovement 0
	compare VAR_0x8008, 1
	call_if_ne LittlerootTown_BrendansHouse_1F_EventScript_PlayerFaceBrendan
	playbgm MUS_ENCOUNTER_BRENDAN, 1
	compare VAR_0x8008, 0
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_BrendanApproachPlayer0
	compare VAR_0x8008, 1
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_BrendanApproachPlayer1
	compare VAR_0x8008, 2
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_BrendanApproachPlayer2
	msgbox RivalsHouse_1F_Text_BrendanWhoAreYou, MSGBOX_DEFAULT
	closemessage
	compare VAR_0x8008, 0
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_BrendanGoUpstairs0
	compare VAR_0x8008, 1
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_BrendanGoUpstairs1
	compare VAR_0x8008, 2
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_BrendanGoUpstairs2
	playse SE_EXIT
	removeobject LOCALID_RIVAL
	setflag FLAG_HIDE_LITTLEROOT_TOWN_BRENDANS_HOUSE_BRENDAN
	setflag FLAG_HIDE_LITTLEROOT_TOWN_BRENDANS_HOUSE_2F_POKE_BALL
	clearflag FLAG_HIDE_LITTLEROOT_TOWN_BRENDANS_HOUSE_RIVAL_BEDROOM
	delay 30
	setvar VAR_LITTLEROOT_RIVAL_STATE, 3
	setvar VAR_LITTLEROOT_TOWN_STATE, 1
	savebgm MUS_DUMMY
	fadedefaultbgm
	releaseall
	end

LittlerootTown_BrendansHouse_1F_EventScript_PlayerFaceBrendan:: @ 81F7981
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_BrendanApproachPlayer0:: @ 81F798C
	applymovement LOCALID_RIVAL, LittlerootTown_BrendansHouse_1F_Movement_BrendanApproachPlayer0
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_BrendanApproachPlayer1:: @ 81F7997
	applymovement LOCALID_RIVAL, LittlerootTown_BrendansHouse_1F_Movement_BrendanApproachPlayer1
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_BrendanApproachPlayer2:: @ 81F79A2
	applymovement LOCALID_RIVAL, LittlerootTown_BrendansHouse_1F_Movement_BrendanApproachPlayer2
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_Movement_BrendanApproachPlayer0: @ 81F79AD
	walk_in_place_fastest_left
	walk_left
	walk_in_place_fastest_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end

LittlerootTown_BrendansHouse_1F_Movement_BrendanApproachPlayer1: @ 81F79B5
	walk_up
	walk_up
	walk_up
	step_end

LittlerootTown_BrendansHouse_1F_Movement_BrendanApproachPlayer2: @ 81F79B9
	walk_in_place_fastest_right
	walk_right
	walk_in_place_fastest_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_BrendanGoUpstairs0:: @ 81F79C1
	applymovement OBJ_EVENT_ID_PLAYER, LittlerootTown_BrendansHouse_1F_Movement_PlayerWatchBrendanExit0
	applymovement LOCALID_RIVAL, LittlerootTown_BrendansHouse_1F_Movement_BrendanGoUpstairs0
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_BrendanGoUpstairs1:: @ 81F79D3
	applymovement OBJ_EVENT_ID_PLAYER, LittlerootTown_BrendansHouse_1F_Movement_PlayerWatchBrendanExit1
	applymovement LOCALID_RIVAL, LittlerootTown_BrendansHouse_1F_Movement_BrendanGoUpstairs1
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_BrendanGoUpstairs2:: @ 81F79E5
	applymovement OBJ_EVENT_ID_PLAYER, LittlerootTown_BrendansHouse_1F_Movement_PlayerWatchBrendanExit2
	applymovement LOCALID_RIVAL, LittlerootTown_BrendansHouse_1F_Movement_BrendanGoUpstairs2
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_Movement_PlayerWatchBrendanExit0: @ 81F79F7
	delay_16
	delay_8
	walk_in_place_fastest_right
	step_end

LittlerootTown_BrendansHouse_1F_Movement_PlayerWatchBrendanExit1: @ 81F79FB
	delay_16
	delay_8
	walk_in_place_fastest_right
	delay_16
	delay_16
	walk_in_place_fastest_up
	step_end

LittlerootTown_BrendansHouse_1F_Movement_PlayerWatchBrendanExit2: @ 81F7A02
	delay_16
	delay_8
	walk_in_place_fastest_left
	step_end

LittlerootTown_BrendansHouse_1F_Movement_BrendanGoUpstairs0: @ 81F7A06
	walk_in_place_fastest_right
	walk_right
	walk_in_place_fastest_up
	walk_up
	walk_up
	step_end

LittlerootTown_BrendansHouse_1F_Movement_BrendanGoUpstairs1: @ 81F7A0C
	walk_in_place_fastest_right
	walk_right
	walk_in_place_fastest_up
	walk_up
	walk_up
	walk_in_place_fastest_left
	walk_left
	walk_in_place_fastest_up
	walk_up
	step_end

LittlerootTown_BrendansHouse_1F_Movement_BrendanGoUpstairs2: @ 81F7A16
	walk_in_place_fastest_left
	walk_left
	walk_in_place_fastest_up
	walk_up
	walk_up
	step_end

PlayersHouse_1F_Text_IsntItNiceInHere: @ 81F7A1C
	.string "MAMÁ: ¿Ves, {PLAYER}?\n"
	.string "¿A que esto es muy bonito?$"

PlayersHouse_1F_Text_MoversPokemonGoSetClock: @ 81F7A46
	.string "Los POKéMON del servicio de mudanzas\n"
	.string "hacen todo el trabajo duro y además\l"
	.string "recogen lo que ensucian. ¡Es perfecto!\p"
	.string "{PLAYER}, tu cuarto está arriba.\n"
	.string "¡Ve a verlo, cariño!\p"
	.string "PAPÁ te ha comprado un nuevo\n"
	.string "reloj para que recuerdes este día.\l"
	.string "No olvides ponerlo en hora.$"

PlayersHouse_1F_Text_ArentYouInterestedInRoom: @ 81F7B24
	.string "MAMÁ: ¿Y bien, {PLAYER}?\n"
	.string "¿No quieres ver tu cuarto?$"

PlayersHouse_1F_Text_GoSetTheClock: @ 81F7B67
	.string "MAMÁ: {PLAYER}, cielo…\p"
	.string "Pon en hora el reloj de tu cuarto.$"

PlayersHouse_1F_Text_OhComeQuickly: @ 81F7B96
	.string "MAMÁ: ¡{PLAYER}, {PLAYER}\n"
	.string "¡Ven! ¡Ven rápido!$"

PlayersHouse_1F_Text_MaybeDadWillBeOn: @ 81F7BBC
	.string "MAMÁ: ¡Mira! ¡El GIMNASIO de PETALIA!\n"
	.string "¡A ver si sale tu padre!$"

PlayersHouse_1F_Text_ItsOverWeMissedHim: @ 81F7BF1
	.string "MAMÁ: Pues no… Qué lástima…\p"
	.string "Creo que estaba hace nada y se\n"
	.string "acaba de ir. Mala suerte.$"

PlayersHouse_1F_Text_GoIntroduceYourselfNextDoor: @ 81F7C35
	.string "Ah, sí, una cosa.\n"
	.string "Uno de los amigos de tu padre vive aquí.\p"
	.string "Se llama PROF. ABEDUL.\p"
	.string "Vive aquí al lado. Creo que deberías\n"
	.string "ir a verlo y presentarte, cariño.$"

PlayersHouse_1F_Text_SeeYouHoney: @ 81F7CC3
	.string "MAMÁ: ¡Hasta luego, cielo!$"

PlayersHouse_1F_Text_DidYouMeetProfBirch: @ 81F7CD8
	.string "MAMÁ: ¿Has ido a presentarte\n"
	.string "al PROF. ABEDUL?$"

PlayersHouse_1F_Text_YouShouldRestABit: @ 81F7D08
	.string "MAMÁ: ¿Cómo estás, {PLAYER}?\n"
	.string "No pareces muy en forma.\p"
	.string "Creo que deberías descansar un poco.$"

PlayersHouse_1F_Text_TakeCareHoney: @ 81F7D5C
	.string "MAMÁ: ¡Cuídate, cielo!$"

PlayersHouse_1F_Text_GotDadsBadgeHeresSomethingFromMom: @ 81F7D73
	.string "MAMÁ: ¡Mira por dónde! ¿Tu padre\n"
	.string "te ha dado esa MEDALLA?\p"
	.string "¡Pues yo también quiero darte algo!$"

PlayersHouse_1F_Text_DontPushYourselfTooHard: @ 81F7DBE
	.string "No te esfuerces demasiado, cielo.\n"
	.string "Tienes que saber cuándo hay que parar.\p"
	.string "¡Buena suerte y ven a verme\n"
	.string "de vez en cuando!$"

PlayersHouse_1F_Text_IsThatAPokenav: @ 81F7E0E
	.string "MAMÁ: ¿Qué es eso, cariño? ¿Un POKéNAV?\n"
	.string "¿Te lo dio alguien de DEVON?\p"
	.string "Entonces, cielo, tendrás que apuntarme\n"
	.string "en él, ¿no?\p"
	.string "Mmm…$"

PlayersHouse_1F_Text_RegisteredMom: @ 81F7E89
	.string "Acabas de registrar a MAMÁ\n"
	.string "en el POKéNAV.$"

PlayersHouse_1F_Text_Vigoroth1: @ 81F7EA8
	.string "¡Vigoró, vigoró!$"

PlayersHouse_1F_Text_Vigoroth2: @ 81F7EB3
	.string "Goro, goro-goro…$"

PlayersHouse_1F_Text_ReportFromPetalburgGym: @ 81F7EC6
	.string "ENTREVISTADOR: Y, desde el GIMNASIO\n"
	.string "de PETALIA, nos despedimos de todos.$"

PlayersHouse_1F_Text_TheresAMovieOnTV: @ 81F7F0F
	.string "Hay una peli en la tele.\p"
	.string "Dos hombres están bailando sobre\n"
	.string "el teclado de un piano de cola.\p"
	.string "Bueno, mejor dejo de ver la tele.$"

PlayersHouse_1F_Text_RunningShoesManual: @ 81F7F66
	.string "Son las instrucciones de las \n"
	.string "DEPORTIVAS.\p"
	.string "“Pulsa el Botón B cuando lleves las\n"
	.string "DEPORTIVAS para salir pitando.\p"
	.string "Ponte las DEPORTIVAS y empieza\n"
	.string "a correr por todas partes.”$"

PlayersHouse_1F_Text_TicketFromBrineyCameForYou: @ 81F800E
	.string "PAPÁ: ¿Eh?\p"
	.string "¡Pero si es mi {PLAYER}!\p"
	.string "Hace un siglo que no te veo…\n"
	.string "¡Si pareces mucho más fuerte!\p"
	.string "Ésa es la impresión que das, ¡pero\n"
	.string "tu padre aún puede dar guerra!\p"
	.string "Ah, sí, tengo algo para ti.\n"
	.string "Te lo envía un tal SR. ARENQUE.$"

PlayersHouse_1F_Text_PortsInSlateportLilycove: @ 81F80FE
	.string "PAPÁ: ¿Un TICKET para el ferry?\p"
	.string "Si recuerdo bien, los puertos donde\n"
	.string "atraca son CIUDAD PORTUAL y CALAGUA.$"

PlayersHouse_1F_Text_BetterGetBackToGym: @ 81F815B
	.string "Mejor vuelvo al GIMNASIO de PETALIA.\p"
	.string "Cariño, gracias por ocuparte\n"
	.string "de la casa mientras yo estoy fuera.$"

PlayersHouse_1F_Text_DadShouldStayLonger: @ 81F81B9
	.string "MAMÁ: Este padre tuyo…\p"
	.string "Cuando por fin viene un poco a casa,\n"
	.string "sólo se le ocurre hablar de POKéMON.\p"
	.string "Debería relajarse un poco y quedarse\n"
	.string "más tiempo aquí tranquilito…$"

PlayersHouse_1F_Text_IsThatABreakingStory: @ 81F824B
	.string "MAMÁ: ¿Un especial informativo?$"

PlayersHouse_1F_Text_LatiEmergencyNewsFlash: @ 81F826F
	.string "¡Interrumpimos la programación para\n"
	.string "traerles las últimas noticias!\p"
	.string "Hay noticias confusas sobre supuestos\n"
	.string "avistamientos de un POKéMON azzzrt…\l"
	.string "volando en distintos puntos de HOENN.\p"
	.string "Actualmente se desconoce la identidad\n"
	.string "del POKéMON.\p"
	.string "Y ahora les dejamos con la programación\n"
	.string "habitual.$"

PlayersHouse_1F_Text_WhatColorDidTheySay: @ 81F8351
	.string "MAMÁ: {PLAYER}, ¿has oído eso?\p"
	.string "¿De qué color ha dicho el de\n"
	.string "la tele que era ese POKéMON?$"

PlayersHouse_1F_Text_StillUnknownPokemon: @ 81F83A1
	.string "MAMÁ: ¡Ver para creer!\n"
	.string "¡Aún hay POKéMON desconocidos!$"
