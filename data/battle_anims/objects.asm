DEF ABSOLUTE_X EQU $00
DEF RELATIVE_X EQU $01

MACRO battleanimobj
	db \1 ; flags
	; bit 7: priority
	; bit 6: y flip (for enemy)
	; bit 5: x flip (for enemy)
	; bit 0: enable enemy animation coord fixing (x = $b4 - x; see below for y)
	db \2 ; enemy animation y fix param
	; if $FF: y = y + 5 tiles
	; else:   y = -y - (1 tile) * (is_softboiled_animation)
	db \3 ; video sequence
	db \4 ; callback
	db \5 ; palette
	db \6 ; tile offset
ENDM

BattleAnimObjects:
; entries correspond to ANIM_OBJ_* constants
	table_width BATTLEANIMOBJ_LENGTH, BattleAnimObjects
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_00, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_HIT_BIG_YFIX
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_01, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_HIT_YFIX
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_02, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_HIT_SMALL_YFIX
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_00, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_HIT_BIG
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_01, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_HIT
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_02, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_HIT_SMALL
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_03, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_PUNCH
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_04, BATTLEANIMFUNC_KICK, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_KICK
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_05, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_PALM
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_06, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_FANG
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_07, BATTLEANIMFUNC_SHAKE, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_PUNCH_SHAKE
	battleanimobj RELATIVE_X, $aa, BATTLEANIMFRAMESET_10, BATTLEANIMFUNC_EMBER, PAL_BATTLE_OB_RED, ANIM_GFX_FIRE ; ANIM_OBJ_EMBER
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_0E, BATTLEANIMFUNC_WAVE_TO_TARGET, PAL_BATTLE_OB_RED, ANIM_GFX_FIRE ; ANIM_OBJ_DRAGON_RAGE
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_0F, BATTLEANIMFUNC_MOVE_IN_CIRCLE, PAL_BATTLE_OB_RED, ANIM_GFX_FIRE ; ANIM_OBJ_FLAMETHROWER
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_10, BATTLEANIMFUNC_USER_TO_TARGET_SPIN, PAL_BATTLE_OB_RED, ANIM_GFX_FIRE ; ANIM_OBJ_FIRE_SPIN
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_0F, BATTLEANIMFUNC_FIRE_BLAST, PAL_BATTLE_OB_RED, ANIM_GFX_FIRE ; ANIM_OBJ_FIRE_BLAST
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_11, BATTLEANIMFUNC_MOVE_IN_CIRCLE, PAL_BATTLE_OB_RED, ANIM_GFX_FIRE ; ANIM_OBJ_BURNED
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_12, BATTLEANIMFUNC_USER_TO_TARGET_SPIN, PAL_BATTLE_OB_BLUE, ANIM_GFX_ICE ; ANIM_OBJ_BLIZZARD
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_13, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_BLUE, ANIM_GFX_ICE ; ANIM_OBJ_ICE
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_14, BATTLEANIMFUNC_USER_TO_TARGET, PAL_BATTLE_OB_BLUE, ANIM_GFX_ICE ; ANIM_OBJ_ICE_BEAM
	battleanimobj RELATIVE_X | X_FLIP, $78, BATTLEANIMFRAMESET_16, BATTLEANIMFUNC_RAZOR_LEAF, PAL_BATTLE_OB_GREEN, ANIM_GFX_PLANT ; ANIM_OBJ_RAZOR_LEAF
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_09, BATTLEANIMFUNC_POKEBALL, PAL_BATTLE_OB_RED, ANIM_GFX_POKE_BALL ; ANIM_OBJ_POKE_BALL
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_09, BATTLEANIMFUNC_POKEBALL_BLOCKED, PAL_BATTLE_OB_RED, ANIM_GFX_POKE_BALL ; ANIM_OBJ_POKE_BALL_BLOCKED
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_18, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_RED, ANIM_GFX_EXPLOSION ; ANIM_OBJ_EXPLOSION1
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_18, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_RED, ANIM_GFX_EXPLOSION ; ANIM_OBJ_EXPLOSION2
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_1D, BATTLEANIMFUNC_THROW_TO_TARGET_DISAPPEAR, PAL_BATTLE_OB_GRAY, ANIM_GFX_POISON ; ANIM_OBJ_ACID
	battleanimobj RELATIVE_X, $b4, BATTLEANIMFRAMESET_1F, BATTLEANIMFUNC_SLUDGE, PAL_BATTLE_OB_GRAY, ANIM_GFX_POISON ; ANIM_OBJ_SLUDGE
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_BALL_POOF, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_SMOKE ; ANIM_OBJ_BALL_POOF_YFIX
	battleanimobj RELATIVE_X, $a0, BATTLEANIMFRAMESET_BALL_POOF, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_SMOKE ; ANIM_OBJ_BALL_POOF
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_BIG_ROCK_STAR_HEART, BATTLEANIMFUNC_DROP, PAL_BATTLE_OB_BROWN, ANIM_GFX_ROCKS ; ANIM_OBJ_BIG_ROCK
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_SMALL_ROCK_STAR_HEART, BATTLEANIMFUNC_DROP, PAL_BATTLE_OB_BROWN, ANIM_GFX_ROCKS ; ANIM_OBJ_SMALL_ROCK
	battleanimobj RELATIVE_X, $b0, BATTLEANIMFRAMESET_1B, BATTLEANIMFUNC_STRENGTH_SEISMIC_TOSS, PAL_BATTLE_OB_BROWN, ANIM_GFX_ROCKS ; ANIM_OBJ_STRENGTH
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_84, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_BLUE, ANIM_GFX_GLOBE ; ANIM_OBJ_SEISMIC_TOSS
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_21, BATTLEANIMFUNC_BUBBLE, PAL_BATTLE_OB_BLUE, ANIM_GFX_BUBBLE ; ANIM_OBJ_BUBBLE
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_23, BATTLEANIMFUNC_SURF, PAL_BATTLE_OB_BLUE, ANIM_GFX_BUBBLE ; ANIM_OBJ_SURF
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_SING, PAL_BATTLE_OB_GRAY, ANIM_GFX_NOISE ; ANIM_OBJ_SING
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $80, BATTLEANIMFRAMESET_27, BATTLEANIMFUNC_WATER_GUN, PAL_BATTLE_OB_BLUE, ANIM_GFX_WATER ; ANIM_OBJ_WATER_GUN
	battleanimobj RELATIVE_X, $b4, BATTLEANIMFRAMESET_2A, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_BLUE, ANIM_GFX_WATER ; ANIM_OBJ_HYDRO_PUMP
	battleanimobj RELATIVE_X, $40, BATTLEANIMFRAMESET_POWDER, BATTLEANIMFUNC_POWDER, PAL_BATTLE_OB_GRAY, ANIM_GFX_POWDER ; ANIM_OBJ_POWDER
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $98, BATTLEANIMFRAMESET_2C, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_YELLOW, ANIM_GFX_BEAM ; ANIM_OBJ_BEAM
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $98, BATTLEANIMFRAMESET_2D, BATTLEANIMFUNC_SHAKE, PAL_BATTLE_OB_YELLOW, ANIM_GFX_BEAM ; ANIM_OBJ_BEAM_TIP
	battleanimobj RELATIVE_X, $b8, BATTLEANIMFRAMESET_2E, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_BLUE, ANIM_GFX_ICE ; ANIM_OBJ_ICE_BUILDUP
	battleanimobj RELATIVE_X, $b8, BATTLEANIMFRAMESET_2F, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_BLUE, ANIM_GFX_ICE ; ANIM_OBJ_FROZEN
	battleanimobj RELATIVE_X, $b8, BATTLEANIMFRAMESET_30, BATTLEANIMFUNC_RECOVER, PAL_BATTLE_OB_BROWN, ANIM_GFX_SPEED ; ANIM_OBJ_MASTER_BALL_SPARKLE
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_21, BATTLEANIMFUNC_RECOVER, PAL_BATTLE_OB_YELLOW, ANIM_GFX_BUBBLE ; ANIM_OBJ_RECOVER
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_31, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_YELLOW, ANIM_GFX_LIGHTNING ; ANIM_OBJ_THUNDER1
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_32, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_YELLOW, ANIM_GFX_LIGHTNING ; ANIM_OBJ_THUNDER2
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_33, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_YELLOW, ANIM_GFX_LIGHTNING ; ANIM_OBJ_THUNDER3
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_34, BATTLEANIMFUNC_THUNDER_WAVE, PAL_BATTLE_OB_YELLOW, ANIM_GFX_LIGHTNING ; ANIM_OBJ_THUNDER_WAVE
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_36, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_YELLOW, ANIM_GFX_LIGHTNING ; ANIM_OBJ_SPARKS_CIRCLE_BIG
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_37, BATTLEANIMFUNC_MOVE_IN_CIRCLE, PAL_BATTLE_OB_GRAY, ANIM_GFX_EXPLOSION ; ANIM_OBJ_THUNDERBOLT_BALL
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_38, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_YELLOW, ANIM_GFX_LIGHTNING ; ANIM_OBJ_SPARKS_CIRCLE
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_39, BATTLEANIMFUNC_MOVE_IN_CIRCLE, PAL_BATTLE_OB_GRAY, ANIM_GFX_EXPLOSION ; ANIM_OBJ_THUNDERSHOCK_BALL
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_3A, BATTLEANIMFUNC_CLAMP_ENCORE, PAL_BATTLE_OB_GRAY, ANIM_GFX_CUT ; ANIM_OBJ_CLAMP
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_3C, BATTLEANIMFUNC_BITE, PAL_BATTLE_OB_GRAY, ANIM_GFX_CUT ; ANIM_OBJ_BITE
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_3E, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_CUT ; ANIM_OBJ_CUT_DOWN_LEFT
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_3F, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_CUT ; ANIM_OBJ_CUT_DOWN_RIGHT
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_40, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_CUT ; ANIM_OBJ_CUT_UP_RIGHT
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_41, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_CUT ; ANIM_OBJ_CUT_LONG_DOWN_LEFT
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_42, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_CUT ; ANIM_OBJ_CUT_LONG_DOWN_RIGHT
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_43, BATTLEANIMFUNC_SOLAR_BEAM, PAL_BATTLE_OB_YELLOW, ANIM_GFX_CHARGE ; ANIM_OBJ_SOLAR_BEAM_CHARGE
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_44, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_YELLOW, ANIM_GFX_CHARGE ; ANIM_OBJ_ABSORB_CENTER
	battleanimobj RELATIVE_X | X_FLIP, $b8, BATTLEANIMFRAMESET_45, BATTLEANIMFUNC_GUST, PAL_BATTLE_OB_GRAY, ANIM_GFX_WIND ; ANIM_OBJ_GUST
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_46, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GREEN, ANIM_GFX_WHIP ; ANIM_OBJ_VINE_WHIP1
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_47, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GREEN, ANIM_GFX_WHIP ; ANIM_OBJ_VINE_WHIP2
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_RAZOR_WIND_1, BATTLEANIMFUNC_RAZOR_WIND, PAL_BATTLE_OB_GRAY, ANIM_GFX_WHIP ; ANIM_OBJ_RAZOR_WIND1
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_RAZOR_WIND_2, BATTLEANIMFUNC_RAZOR_WIND, PAL_BATTLE_OB_GRAY, ANIM_GFX_WHIP ; ANIM_OBJ_RAZOR_WIND2
	battleanimobj RELATIVE_X | X_FLIP, $98, BATTLEANIMFRAMESET_4A, BATTLEANIMFUNC_USER_TO_TARGET, PAL_BATTLE_OB_GRAY, ANIM_GFX_WHIP ; ANIM_OBJ_SONICBOOM_JP
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_4B, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_YELLOW, ANIM_GFX_SPEED ; ANIM_OBJ_WARP
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_4C, BATTLEANIMFUNC_ABSORB, PAL_BATTLE_OB_GREEN, ANIM_GFX_CHARGE ; ANIM_OBJ_ABSORB
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_4D, BATTLEANIMFUNC_EGG, PAL_BATTLE_OB_GRAY, ANIM_GFX_EGG ; ANIM_OBJ_EGG
	battleanimobj RELATIVE_X, $b0, BATTLEANIMFRAMESET_51, BATTLEANIMFUNC_MOVE_UP, PAL_BATTLE_OB_YELLOW, ANIM_GFX_SPEED ; ANIM_OBJ_FOCUS
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_52, BATTLEANIMFUNC_WRAP, PAL_BATTLE_OB_GREEN, ANIM_GFX_ROPE ; ANIM_OBJ_BIND1
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_54, BATTLEANIMFUNC_WRAP, PAL_BATTLE_OB_GREEN, ANIM_GFX_ROPE ; ANIM_OBJ_BIND2
	battleanimobj RELATIVE_X | X_FLIP, $68, BATTLEANIMFRAMESET_56, BATTLEANIMFUNC_LEECH_SEED, PAL_BATTLE_OB_GREEN, ANIM_GFX_PLANT ; ANIM_OBJ_LEECH_SEED
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_59, BATTLEANIMFUNC_SOUND, PAL_BATTLE_OB_GRAY, ANIM_GFX_NOISE ; ANIM_OBJ_SOUND
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_5C, BATTLEANIMFUNC_USER_TO_TARGET_DISAPPEAR, PAL_BATTLE_OB_GRAY, ANIM_GFX_PSYCHIC ; ANIM_OBJ_WAVE
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_5D, BATTLEANIMFUNC_CONFUSE_RAY, PAL_BATTLE_OB_YELLOW, ANIM_GFX_SPEED ; ANIM_OBJ_CONFUSE_RAY
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $88, BATTLEANIMFRAMESET_5F, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_YELLOW, ANIM_GFX_BEAM ; ANIM_OBJ_LEER
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $88, BATTLEANIMFRAMESET_2D, BATTLEANIMFUNC_SHAKE, PAL_BATTLE_OB_YELLOW, ANIM_GFX_BEAM ; ANIM_OBJ_LEER_TIP
	battleanimobj RELATIVE_X | X_FLIP, $88, BATTLEANIMFRAMESET_60, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_YELLOW, ANIM_GFX_REFLECT ; ANIM_OBJ_SCREEN
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_60, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_REFLECT ; ANIM_OBJ_HARDEN
	battleanimobj RELATIVE_X | X_FLIP, $50, BATTLEANIMFRAMESET_61, BATTLEANIMFUNC_DIZZY, PAL_BATTLE_OB_YELLOW, ANIM_GFX_STATUS ; ANIM_OBJ_CHICK
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_63, BATTLEANIMFUNC_AMNESIA, PAL_BATTLE_OB_GRAY, ANIM_GFX_STATUS ; ANIM_OBJ_AMNESIA
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_66, BATTLEANIMFUNC_FLOAT_UP, PAL_BATTLE_OB_GRAY, ANIM_GFX_STATUS ; ANIM_OBJ_ASLEEP
	battleanimobj RELATIVE_X, $50, BATTLEANIMFRAMESET_1C, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_POISON ; ANIM_OBJ_SKULL
	battleanimobj RELATIVE_X | X_FLIP, $a8, BATTLEANIMFRAMESET_67, BATTLEANIMFUNC_DIG, PAL_BATTLE_OB_BROWN, ANIM_GFX_SAND ; ANIM_OBJ_DIG_SAND
	battleanimobj RELATIVE_X | X_FLIP, $a8, BATTLEANIMFRAMESET_68, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_BROWN, ANIM_GFX_SAND ; ANIM_OBJ_DIG_PILE
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_69, BATTLEANIMFUNC_USER_TO_TARGET, PAL_BATTLE_OB_GRAY, ANIM_GFX_SAND ; ANIM_OBJ_SAND
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_6D, BATTLEANIMFUNC_PARALYZED, PAL_BATTLE_OB_YELLOW, ANIM_GFX_STATUS ; ANIM_OBJ_PARALYZED
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_6A, BATTLEANIMFUNC_STRING, PAL_BATTLE_OB_GRAY, ANIM_GFX_WEB ; ANIM_OBJ_STRING_SHOT
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_SPIRAL_DESCENT, PAL_BATTLE_OB_GRAY, ANIM_GFX_HAZE ; ANIM_OBJ_HAZE
	battleanimobj RELATIVE_X | X_FLIP, $48, BATTLEANIMFRAMESET_70, BATTLEANIMFUNC_SPIRAL_DESCENT, PAL_BATTLE_OB_GRAY, ANIM_GFX_HAZE ; ANIM_OBJ_MIST
	battleanimobj RELATIVE_X | X_FLIP, $48, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_SPIRAL_DESCENT, PAL_BATTLE_OB_GRAY, ANIM_GFX_HAZE ; ANIM_OBJ_SMOG
	battleanimobj RELATIVE_X | X_FLIP, $78, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_POISON_GAS, PAL_BATTLE_OB_GRAY, ANIM_GFX_HAZE ; ANIM_OBJ_POISON_GAS
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $90, BATTLEANIMFRAMESET_71, BATTLEANIMFUNC_HORN, PAL_BATTLE_OB_BLUE, ANIM_GFX_HORN ; ANIM_OBJ_HORN
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $90, BATTLEANIMFRAMESET_72, BATTLEANIMFUNC_NEEDLE, PAL_BATTLE_OB_BLUE, ANIM_GFX_HORN ; ANIM_OBJ_HORN_SMALLER
	battleanimobj RELATIVE_X, $48, BATTLEANIMFRAMESET_73, BATTLEANIMFUNC_PETAL_DANCE, PAL_BATTLE_OB_RED, ANIM_GFX_FLOWER ; ANIM_OBJ_PETAL_DANCE
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_THROW_TO_TARGET_DISAPPEAR, PAL_BATTLE_OB_GRAY, ANIM_GFX_EGG ; ANIM_OBJ_SLUDGE_BOMB
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_75, BATTLEANIMFUNC_THIEF_PAYDAY, PAL_BATTLE_OB_BROWN, ANIM_GFX_STATUS ; ANIM_OBJ_PAY_DAY
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_4A, BATTLEANIMFUNC_USER_TO_TARGET_DISAPPEAR, PAL_BATTLE_OB_GRAY, ANIM_GFX_WHIP ; ANIM_OBJ_SONICBOOM_JP_UNUSED
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_30, BATTLEANIMFUNC_ABSORB_CIRCLE, PAL_BATTLE_OB_GRAY, ANIM_GFX_SPEED ; ANIM_OBJ_MIMIC
	battleanimobj RELATIVE_X, $78, BATTLEANIMFRAMESET_76, BATTLEANIMFUNC_POISON_GAS, PAL_BATTLE_OB_RED, ANIM_GFX_OBJECTS ; ANIM_OBJ_ATTRACT
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_77, BATTLEANIMFUNC_BONEMERANG, PAL_BATTLE_OB_GRAY, ANIM_GFX_MISC ; ANIM_OBJ_BONEMERANG
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_77, BATTLEANIMFUNC_USER_TO_TARGET_DISAPPEAR, PAL_BATTLE_OB_GRAY, ANIM_GFX_MISC ; ANIM_OBJ_BONE_CLUB
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_77, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_MISC ; ANIM_OBJ_BONE_RUSH
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_78, BATTLEANIMFUNC_USER_TO_TARGET_SPIN, PAL_BATTLE_OB_YELLOW, ANIM_GFX_OBJECTS ; ANIM_OBJ_SWIFT
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_79, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_MISC ; ANIM_OBJ_KINESIS
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_7A, BATTLEANIMFUNC_SHINY, PAL_BATTLE_OB_YELLOW, ANIM_GFX_SPEED ; ANIM_OBJ_FLASH
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_7A, BATTLEANIMFUNC_SHINY, PAL_BATTLE_OB_YELLOW, ANIM_GFX_SPEED ; ANIM_OBJ_SHINY
	battleanimobj RELATIVE_X | X_FLIP, $88, BATTLEANIMFRAMESET_7B, BATTLEANIMFUNC_SKY_ATTACK, PAL_BATTLE_OB_GRAY, ANIM_GFX_SKY_ATTACK ; ANIM_OBJ_SKY_ATTACK
	battleanimobj RELATIVE_X | X_FLIP, $98, BATTLEANIMFRAMESET_7C, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_WATER ; ANIM_OBJ_LICK
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_7D, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_REFLECT ; ANIM_OBJ_WITHDRAW
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_21, BATTLEANIMFUNC_ABSORB_CIRCLE, PAL_BATTLE_OB_BLUE, ANIM_GFX_BUBBLE ; ANIM_OBJ_DRAIN
	battleanimobj RELATIVE_X, $b0, BATTLEANIMFRAMESET_7E, BATTLEANIMFUNC_GROWTH_SWORDS_DANCE, PAL_BATTLE_OB_YELLOW, ANIM_GFX_CHARGE ; ANIM_OBJ_GROWTH
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_7F, BATTLEANIMFUNC_ABSORB_CIRCLE, PAL_BATTLE_OB_GRAY, ANIM_GFX_EXPLOSION ; ANIM_OBJ_CONVERSION2
	battleanimobj RELATIVE_X | X_FLIP, $a0, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_SMOKE_FLAME_WHEEL, PAL_BATTLE_OB_GRAY, ANIM_GFX_HAZE ; ANIM_OBJ_SMOKE
	battleanimobj RELATIVE_X | X_FLIP, $a0, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_PRESENT_SMOKESCREEN, PAL_BATTLE_OB_GRAY, ANIM_GFX_EGG ; ANIM_OBJ_SMOKESCREEN
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_80, BATTLEANIMFUNC_GROWTH_SWORDS_DANCE, PAL_BATTLE_OB_GRAY, ANIM_GFX_WHIP ; ANIM_OBJ_SWORDS_DANCE
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_81, BATTLEANIMFUNC_SPEED_LINE, PAL_BATTLE_OB_GRAY, ANIM_GFX_SPEED ; ANIM_OBJ_SPEED_LINE
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_85, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_SHAPES ; ANIM_OBJ_SHARPEN
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_86, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_SHAPES ; ANIM_OBJ_DEFENSE_CURL
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_87, BATTLEANIMFUNC_METRONOME_HAND, PAL_BATTLE_OB_GRAY, ANIM_GFX_MISC ; ANIM_OBJ_METRONOME_HAND
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_30, BATTLEANIMFUNC_METRONOME_SPARKLE_SKETCH, PAL_BATTLE_OB_YELLOW, ANIM_GFX_SPEED ; ANIM_OBJ_METRONOME_SPARKLE
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_34, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_YELLOW, ANIM_GFX_LIGHTNING ; ANIM_OBJ_DISABLE
	battleanimobj RELATIVE_X | X_FLIP | PRIORITY, $88, BATTLEANIMFRAMESET_AGILITY, BATTLEANIMFUNC_AGILITY, PAL_BATTLE_OB_BLUE, ANIM_GFX_WIND_BG ; ANIM_OBJ_AGILITY
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_76, BATTLEANIMFUNC_FLOAT_UP, PAL_BATTLE_OB_RED, ANIM_GFX_OBJECTS ; ANIM_OBJ_HEART
	battleanimobj RELATIVE_X, $98, BATTLEANIMFRAMESET_10, BATTLEANIMFUNC_SMOKE_FLAME_WHEEL, PAL_BATTLE_OB_RED, ANIM_GFX_FIRE ; ANIM_OBJ_FLAME_WHEEL
	battleanimobj RELATIVE_X, $a8, BATTLEANIMFRAMESET_0F, BATTLEANIMFUNC_SACRED_FIRE, PAL_BATTLE_OB_YELLOW, ANIM_GFX_FIRE ; ANIM_OBJ_SACRED_FIRE
	battleanimobj RELATIVE_X | X_FLIP, $68, BATTLEANIMFRAMESET_COTTON, BATTLEANIMFUNC_SPIRAL_DESCENT, PAL_BATTLE_OB_GRAY, ANIM_GFX_MISC ; ANIM_OBJ_COTTON_SPORE
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_8A, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_MISC ; ANIM_OBJ_MILK_DRINK
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_8C, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_MISC ; ANIM_OBJ_ANGER
	battleanimobj RELATIVE_X | X_FLIP, $50, BATTLEANIMFRAMESET_8D, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_YELLOW, ANIM_GFX_MISC ; ANIM_OBJ_HEAL_BELL
	battleanimobj RELATIVE_X, $40, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_HEAL_BELL_NOTES, PAL_BATTLE_OB_GRAY, ANIM_GFX_NOISE ; ANIM_OBJ_HEAL_BELL_NOTE
	battleanimobj RELATIVE_X | X_FLIP, $a8, BATTLEANIMFRAMESET_8E, BATTLEANIMFUNC_BATON_PASS, PAL_BATTLE_OB_RED, ANIM_GFX_MISC ; ANIM_OBJ_BATON_PASS
	battleanimobj RELATIVE_X | X_FLIP, $88, BATTLEANIMFRAMESET_8F, BATTLEANIMFUNC_LOCK_ON_MIND_READER, PAL_BATTLE_OB_GRAY, ANIM_GFX_MISC ; ANIM_OBJ_LOCK_ON
	battleanimobj RELATIVE_X | X_FLIP, $88, BATTLEANIMFRAMESET_93, BATTLEANIMFUNC_LOCK_ON_MIND_READER, PAL_BATTLE_OB_GRAY, ANIM_GFX_MISC ; ANIM_OBJ_MIND_READER
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_97, BATTLEANIMFUNC_SAFEGUARD_PROTECT, PAL_BATTLE_OB_GRAY, ANIM_GFX_MISC ; ANIM_OBJ_SAFEGUARD
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_78, BATTLEANIMFUNC_SAFEGUARD_PROTECT, PAL_BATTLE_OB_YELLOW, ANIM_GFX_OBJECTS ; ANIM_OBJ_PROTECT
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_99, BATTLEANIMFUNC_THIEF_PAYDAY, PAL_BATTLE_OB_GRAY, ANIM_GFX_STATUS ; ANIM_OBJ_THIEF
	battleanimobj RELATIVE_X | X_FLIP, $a0, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_USER_TO_TARGET_DISAPPEAR, PAL_BATTLE_OB_GRAY, ANIM_GFX_EGG ; ANIM_OBJ_OCTAZOOKA
	battleanimobj RELATIVE_X | X_FLIP, $a0, BATTLEANIMFRAMESET_99, BATTLEANIMFUNC_PRESENT_SMOKESCREEN, PAL_BATTLE_OB_RED, ANIM_GFX_STATUS ; ANIM_OBJ_PRESENT
	battleanimobj RELATIVE_X | X_FLIP, $70, BATTLEANIMFRAMESET_8B, BATTLEANIMFUNC_SPIKES, PAL_BATTLE_OB_GRAY, ANIM_GFX_MISC ; ANIM_OBJ_SPIKES
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_15, BATTLEANIMFUNC_USER_TO_TARGET_SPIN, PAL_BATTLE_OB_GRAY, ANIM_GFX_ICE ; ANIM_OBJ_POWDER_SNOW
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_11, BATTLEANIMFUNC_USER_TO_TARGET_DISAPPEAR, PAL_BATTLE_OB_RED, ANIM_GFX_FIRE ; ANIM_OBJ_DRAGONBREATH
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_7F, BATTLEANIMFUNC_CONVERSION, PAL_BATTLE_OB_GRAY, ANIM_GFX_EXPLOSION ; ANIM_OBJ_CONVERSION
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_9A, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_WEB ; ANIM_OBJ_SPIDER_WEB
	battleanimobj RELATIVE_X | X_FLIP, $a0, BATTLEANIMFRAMESET_9B, BATTLEANIMFUNC_PRESENT_SMOKESCREEN, PAL_BATTLE_OB_RED, ANIM_GFX_OBJECTS ; ANIM_OBJ_CAKE_UNUSED
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_9C, BATTLEANIMFUNC_DIZZY, PAL_BATTLE_OB_GRAY, ANIM_GFX_ANGELS ; ANIM_OBJ_NIGHTMARE
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_9D, BATTLEANIMFUNC_FLOAT_UP, PAL_BATTLE_OB_GRAY, ANIM_GFX_ANGELS ; ANIM_OBJ_IN_NIGHTMARE
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_9C, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_ANGELS ; ANIM_OBJ_LOVELY_KISS
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_9E, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_BLUE, ANIM_GFX_ANGELS ; ANIM_OBJ_SWEET_KISS
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $80, BATTLEANIMFRAMESET_9F, BATTLEANIMFUNC_METRONOME_SPARKLE_SKETCH, PAL_BATTLE_OB_GREEN, ANIM_GFX_OBJECTS ; ANIM_OBJ_SKETCH
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_A0, BATTLEANIMFUNC_CLAMP_ENCORE, PAL_BATTLE_OB_GRAY, ANIM_GFX_OBJECTS ; ANIM_OBJ_ENCORE_HAND
	battleanimobj RELATIVE_X | X_FLIP, $70, BATTLEANIMFRAMESET_78, BATTLEANIMFUNC_ENCORE_BELLY_DRUM, PAL_BATTLE_OB_YELLOW, ANIM_GFX_OBJECTS ; ANIM_OBJ_ENCORE_STAR
	battleanimobj RELATIVE_X | X_FLIP, $c0, BATTLEANIMFRAMESET_A2, BATTLEANIMFUNC_USER_TO_TARGET, PAL_BATTLE_OB_GRAY, ANIM_GFX_ANGELS ; ANIM_OBJ_DESTINY_BOND
	battleanimobj RELATIVE_X | X_FLIP, $40, BATTLEANIMFRAMESET_A3, BATTLEANIMFUNC_SWAGGER_MORNING_SUN, PAL_BATTLE_OB_YELLOW, ANIM_GFX_SHINE ; ANIM_OBJ_MORNING_SUN
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_GLIMMER, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_SHINE ; ANIM_OBJ_GLIMMER
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_A5, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_YELLOW, ANIM_GFX_SHINE ; ANIM_OBJ_MOONLIGHT
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_43, BATTLEANIMFUNC_HIDDEN_POWER, PAL_BATTLE_OB_RED, ANIM_GFX_CHARGE ; ANIM_OBJ_HIDDEN_POWER
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_A6, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_CUT ; ANIM_OBJ_CROSS_CHOP1
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_A7, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_CUT ; ANIM_OBJ_CROSS_CHOP2
	battleanimobj RELATIVE_X | X_FLIP, $00, BATTLEANIMFRAMESET_B4, BATTLEANIMFUNC_RAIN_SANDSTORM, PAL_BATTLE_OB_BROWN, ANIM_GFX_POWDER ; ANIM_OBJ_SANDSTORM
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_A8, BATTLEANIMFUNC_USER_TO_TARGET_DISAPPEAR, PAL_BATTLE_OB_YELLOW, ANIM_GFX_LIGHTNING ; ANIM_OBJ_ZAP_CANNON
	battleanimobj RELATIVE_X | X_FLIP, $40, BATTLEANIMFRAMESET_9C, BATTLEANIMFUNC_POWDER, PAL_BATTLE_OB_GRAY, ANIM_GFX_ANGELS ; ANIM_OBJ_SPITE
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $90, BATTLEANIMFRAMESET_A9, BATTLEANIMFUNC_CURSE, PAL_BATTLE_OB_GRAY, ANIM_GFX_OBJECTS ; ANIM_OBJ_CURSE
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_PERISH_SONG, PAL_BATTLE_OB_GRAY, ANIM_GFX_NOISE ; ANIM_OBJ_PERISH_SONG
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_AA, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_SHINE ; ANIM_OBJ_FORESIGHT
	battleanimobj RELATIVE_X | X_FLIP, $b8, BATTLEANIMFRAMESET_AB, BATTLEANIMFUNC_RAPID_SPIN, PAL_BATTLE_OB_GRAY, ANIM_GFX_WIND ; ANIM_OBJ_RAPID_SPIN
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_AC, BATTLEANIMFUNC_SWAGGER_MORNING_SUN, PAL_BATTLE_OB_GRAY, ANIM_GFX_WIND ; ANIM_OBJ_SWAGGER
	battleanimobj RELATIVE_X, $a8, BATTLEANIMFRAMESET_05, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_BELLY_DRUM_HAND
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_ENCORE_BELLY_DRUM, PAL_BATTLE_OB_GRAY, ANIM_GFX_NOISE ; ANIM_OBJ_BELLY_DRUM_NOTE
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_AD, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_BLUE, ANIM_GFX_PSYCHIC ; ANIM_OBJ_MEAN_LOOK
	battleanimobj RELATIVE_X, $a8, BATTLEANIMFRAMESET_AE, BATTLEANIMFUNC_PURSUIT, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_PURSUIT
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_AF, BATTLEANIMFUNC_USER_TO_TARGET, PAL_BATTLE_OB_YELLOW, ANIM_GFX_SPEED ; ANIM_OBJ_SHOOTING_SPARKLE
	battleanimobj RELATIVE_X | X_FLIP, $00, BATTLEANIMFRAMESET_B0, BATTLEANIMFUNC_RAIN_SANDSTORM, PAL_BATTLE_OB_GRAY, ANIM_GFX_WATER ; ANIM_OBJ_RAIN
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_70, BATTLEANIMFUNC_ANIM_OBJ_B0, PAL_BATTLE_OB_RED, ANIM_GFX_HAZE ; ANIM_OBJ_B0
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_B1, BATTLEANIMFUNC_PSYCH_UP, PAL_BATTLE_OB_GRAY, ANIM_GFX_STATUS ; ANIM_OBJ_PSYCH_UP
	battleanimobj RELATIVE_X, $b8, BATTLEANIMFRAMESET_BIG_ROCK_STAR_HEART, BATTLEANIMFUNC_ANCIENT_POWER, PAL_BATTLE_OB_BROWN, ANIM_GFX_ROCKS ; ANIM_OBJ_ANCIENTPOWER
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $98, BATTLEANIMFRAMESET_B3, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_YELLOW, ANIM_GFX_AEROBLAST ; ANIM_OBJ_AEROBLAST
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $98, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_WAVE_TO_TARGET, PAL_BATTLE_OB_BLUE, ANIM_GFX_EGG ; ANIM_OBJ_SHADOW_BALL
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_BIG_ROCK_STAR_HEART, BATTLEANIMFUNC_ROCK_SMASH, PAL_BATTLE_OB_BROWN, ANIM_GFX_ROCKS ; ANIM_OBJ_ROCK_SMASH
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_73, BATTLEANIMFUNC_USER_TO_TARGET_SPIN, PAL_BATTLE_OB_RED, ANIM_GFX_FLOWER ; ANIM_OBJ_FLOWER
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_COTTON, BATTLEANIMFUNC_COTTON, PAL_BATTLE_OB_RED, ANIM_GFX_MISC ; ANIM_OBJ_COTTON
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_B5, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_ENEMY, ANIM_GFX_PLAYERHEAD ; ANIM_OBJ_ENEMYFEET_1ROW
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_B6, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_PLAYER, ANIM_GFX_ENEMYFEET ; ANIM_OBJ_PLAYERHEAD_1ROW
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_B7, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_ENEMY, ANIM_GFX_PLAYERHEAD ; ANIM_OBJ_ENEMYFEET_2ROW
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_B8, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_PLAYER, ANIM_GFX_ENEMYFEET ; ANIM_OBJ_PLAYERHEAD_2ROW
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $98, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_WAVE_TO_TARGET, PAL_BATTLE_OB_GREEN, ANIM_GFX_EGG ; ANIM_OBJ_ENERGY_BALL
	battleanimobj RELATIVE_X | X_FLIP, $20, BATTLEANIMFRAMESET_10, BATTLEANIMFUNC_RAIN_SANDSTORM, PAL_BATTLE_OB_GRAY, ANIM_GFX_ICE ; ANIM_OBJ_HAIL
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_14, BATTLEANIMFUNC_USER_TO_TARGET, PAL_BATTLE_OB_YELLOW, ANIM_GFX_ICE ; ANIM_OBJ_GEM
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $90, BATTLEANIMFRAMESET_FOCUS_BLAST, BATTLEANIMFUNC_USER_TO_TARGET_DISAPPEAR, PAL_BATTLE_OB_YELLOW, ANIM_GFX_FOCUS_BLAST ; ANIM_OBJ_FOCUS_BLAST
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $90, BATTLEANIMFRAMESET_71, BATTLEANIMFUNC_HORN, PAL_BATTLE_OB_BLUE, ANIM_GFX_HORN ; ANIM_OBJ_ICICLE
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_BIG_ROCK_STAR_HEART, BATTLEANIMFUNC_DROP, PAL_BATTLE_OB_BLUE, ANIM_GFX_ROCKS ; ANIM_OBJ_BIG_ICE_CHUNK
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_SMALL_ROCK_STAR_HEART, BATTLEANIMFUNC_DROP, PAL_BATTLE_OB_BLUE, ANIM_GFX_ROCKS ; ANIM_OBJ_SMALL_ICE_CHUNK
	battleanimobj RELATIVE_X| X_FLIP, $80, BATTLEANIMFRAMESET_3E, BATTLEANIMFUNC_MOVE_UP, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_HONE_CLAWS_LEFT
	battleanimobj RELATIVE_X| X_FLIP, $80, BATTLEANIMFRAMESET_3F, BATTLEANIMFUNC_MOVE_UP, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_HONE_CLAWS_RIGHT
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_BIG_ROCK_STAR_HEART, BATTLEANIMFUNC_USER_TO_TARGET_DISAPPEAR, PAL_BATTLE_OB_BROWN, ANIM_GFX_EGG ; ANIM_OBJ_ROCK_BLAST
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_43, BATTLEANIMFUNC_ABSORB, PAL_BATTLE_OB_YELLOW, ANIM_GFX_CHARGE ; ANIM_OBJ_SKILL_SWAP_FROM
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_43, BATTLEANIMFUNC_USER_TO_TARGET_DISAPPEAR, PAL_BATTLE_OB_YELLOW, ANIM_GFX_CHARGE ; ANIM_OBJ_SKILL_SWAP_TO
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_STONE_EDGE, BATTLEANIMFUNC_MOVE_UP, PAL_BATTLE_OB_BROWN, ANIM_GFX_ROCKS ; ANIM_OBJ_STONE_EDGE
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_STONE_EDGE, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_BROWN, ANIM_GFX_ROCKS ; ANIM_OBJ_STONE_EDGE_STILL
	battleanimobj RELATIVE_X | X_FLIP, $a0, BATTLEANIMFRAMESET_99, BATTLEANIMFUNC_ABSORB, PAL_BATTLE_OB_YELLOW, ANIM_GFX_STATUS ; ANIM_OBJ_TRICK_FROM
	battleanimobj RELATIVE_X | X_FLIP, $a0, BATTLEANIMFRAMESET_99, BATTLEANIMFUNC_USER_TO_TARGET_DISAPPEAR, PAL_BATTLE_OB_YELLOW, ANIM_GFX_STATUS ; ANIM_OBJ_TRICK_TO
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $90, BATTLEANIMFRAMESET_9E, BATTLEANIMFUNC_USER_TO_TARGET_DISAPPEAR, PAL_BATTLE_OB_BLUE, ANIM_GFX_U_TURN ; ANIM_OBJ_U_TURN_LAUNCH
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_9C, BATTLEANIMFUNC_RADIAL_MOVE_OUT, PAL_BATTLE_OB_BLUE, ANIM_GFX_U_TURN ; ANIM_OBJ_U_TURN_RISE
	battleanimobj RELATIVE_X, $f0, BATTLEANIMFRAMESET_U_TURN_FALL, BATTLEANIMFUNC_RADIAL_MOVE_OUT, PAL_BATTLE_OB_BLUE, ANIM_GFX_U_TURN; ANIM_OBJ_U_TURN_FALL
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_43, BATTLEANIMFUNC_RECOVER, PAL_BATTLE_OB_YELLOW, ANIM_GFX_CHARGE ; ANIM_OBJ_CHARGE
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_7A, BATTLEANIMFUNC_HIDDEN_POWER, PAL_BATTLE_OB_YELLOW, ANIM_GFX_SPEED ; ANIM_OBJ_DAZZLE
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_7F, BATTLEANIMFUNC_PERISH_SONG, PAL_BATTLE_OB_GRAY, ANIM_GFX_WHIP ; ANIM_OBJ_TRICK_ROOM
	battleanimobj RELATIVE_X | X_FLIP, $a8, BATTLEANIMFRAMESET_67, BATTLEANIMFUNC_DIG, PAL_BATTLE_OB_BLUE, ANIM_GFX_SAND ; ANIM_OBJ_SWEAT
	battleanimobj RELATIVE_X | X_FLIP, $a0, BATTLEANIMFRAMESET_1D, BATTLEANIMFUNC_USER_TO_TARGET_DISAPPEAR, PAL_BATTLE_OB_GRAY, ANIM_GFX_EGG ; ANIM_OBJ_GUNKSHOT
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_69, BATTLEANIMFUNC_USER_TO_TARGET, PAL_BATTLE_OB_BLUE, ANIM_GFX_SAND ; ANIM_OBJ_SPLASH
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_B9, BATTLEANIMFUNC_POWER_GEM, PAL_BATTLE_OB_GRAY, ANIM_GFX_CHARGE ; ANIM_OBJ_POWER_GEM
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_01, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_MINIMIZE
	battleanimobj RELATIVE_X | X_FLIP, $ab, BATTLEANIMFRAMESET_STAT_UP, BATTLEANIMFUNC_RADIAL_MOVE_OUT_STATS, PAL_BATTLE_OB_GRAY, ANIM_GFX_SPEED ; ANIM_OBJ_STAT_UP
	battleanimobj RELATIVE_X | X_FLIP, $45, BATTLEANIMFRAMESET_STAT_DOWN, BATTLEANIMFUNC_RADIAL_MOVE_OUT_STATS, PAL_BATTLE_OB_GRAY, ANIM_GFX_SPEED ; ANIM_OBJ_STAT_DOWN
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_09, BATTLEANIMFUNC_POKE_BALL_BG, PAL_BATTLE_OB_GREEN, ANIM_GFX_POKE_BALL_BG ; ANIM_OBJ_POKE_BALL_BG
	battleanimobj RELATIVE_X, $b0, BATTLEANIMFRAMESET_10, BATTLEANIMFUNC_MOVE_UP, PAL_BATTLE_OB_RED, ANIM_GFX_FIRE ; ANIM_OBJ_FLARE_BLITZ
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_0F, BATTLEANIMFUNC_RADIAL_MOVE_OUT, PAL_BATTLE_OB_RED, ANIM_GFX_FIRE ; ANIM_OBJ_LAVA_PLUME
	battleanimobj RELATIVE_X | X_FLIP, $88, BATTLEANIMFRAMESET_7B, BATTLEANIMFUNC_PAUSE_THEN_RUSH, PAL_BATTLE_OB_GRAY, ANIM_GFX_SKY_ATTACK ; ANIM_OBJ_BRAVE_BIRD
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_BRICK_BREAK, BATTLEANIMFUNC_52, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_VERTICAL_CHOP
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_BRICK_BREAK, BATTLEANIMFUNC_SHAKE, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_VERTICAL_CHOP_STILL
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_RAZOR_WIND_2, BATTLEANIMFUNC_RADIAL_MOVE_OUT_SLOW, PAL_BATTLE_OB_GRAY, ANIM_GFX_WHIP ; ANIM_OBJ_AIR_SLASH
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_BUG_BUZZ_L, BATTLEANIMFUNC_RADIAL_MOVE_OUT_SLOW, PAL_BATTLE_OB_GREEN, ANIM_GFX_BUG_BUZZ ; ANIM_OBJ_BUG_BUZZ_L
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_BUG_BUZZ_R, BATTLEANIMFUNC_RADIAL_MOVE_OUT_SLOW, PAL_BATTLE_OB_GREEN, ANIM_GFX_BUG_BUZZ ; ANIM_OBJ_BUG_BUZZ_R
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_DRAGON_PULSE, BATTLEANIMFUNC_USER_TO_TARGET_DISAPPEAR, PAL_BATTLE_OB_BLUE, ANIM_GFX_CHARGE ; ANIM_OBJ_DRAGON_PULSE
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_HYPER_VOICE, BATTLEANIMFUNC_USER_TO_TARGET_DISAPPEAR, PAL_BATTLE_OB_GRAY, ANIM_GFX_PSYCHIC ; ANIM_OBJ_HYPER_VOICE
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_BULLET_PUNCH, BATTLEANIMFUNC_SHAKE, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_BULLET_PUNCH
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_LONG_PUNCH, BATTLEANIMFUNC_SHAKE, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_LONG_PUNCH
	battleanimobj RELATIVE_X | X_FLIP, $94, BATTLEANIMFRAMESET_VORTEX, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_VORTEX
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_BIG_ROCK_STAR_HEART, BATTLEANIMFUNC_ROCK_SMASH, PAL_BATTLE_OB_YELLOW, ANIM_GFX_STARS ; ANIM_OBJ_STAR_BURST
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_BIG_ROCK_STAR_HEART, BATTLEANIMFUNC_ROCK_SMASH, PAL_BATTLE_OB_RED, ANIM_GFX_HEARTS ; ANIM_OBJ_HEART_BURST
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_OCTAZOOKA_SMOKE, BATTLEANIMFUNC_RADIAL_MOVE_OUT, PAL_BATTLE_OB_YELLOW, ANIM_GFX_SMOKE_PUFF ; ANIM_OBJ_SNOW_FALL
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_SMALL_ROCK_STAR_HEART, BATTLEANIMFUNC_RADIAL_MOVE_OUT, PAL_BATTLE_OB_BROWN, ANIM_GFX_ROCKS ; ANIM_OBJ_AVALANCHE_SMALL
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_BIG_ROCK_STAR_HEART, BATTLEANIMFUNC_RADIAL_MOVE_OUT, PAL_BATTLE_OB_BROWN, ANIM_GFX_ROCKS ; ANIM_OBJ_AVALANCHE_BIG
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_RED_STAR, BATTLEANIMFUNC_54, PAL_BATTLE_OB_RED, ANIM_GFX_SPEED ; ANIM_OBJ_RED_STAR
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_9E, BATTLEANIMFUNC_RADIAL_MOVE_OUT, PAL_BATTLE_OB_BLUE, ANIM_GFX_GLOBE ; ANIM_OBJ_SEISMIC_TOSS_UP
	battleanimobj RELATIVE_X, $08, BATTLEANIMFRAMESET_9E, BATTLEANIMFUNC_RADIAL_MOVE_OUT, PAL_BATTLE_OB_BLUE, ANIM_GFX_GLOBE ; ANIM_OBJ_SEISMIC_TOSS_DOWN
	battleanimobj RELATIVE_X | X_FLIP, $a8, BATTLEANIMFRAMESET_BIG_ROCK_STAR_HEART, BATTLEANIMFUNC_ROCK_SMASH, PAL_BATTLE_OB_GRAY, ANIM_GFX_ROCKS ; ANIM_OBJ_SHELL_SMASH
	battleanimobj RELATIVE_X | X_FLIP, $a8, BATTLEANIMFRAMESET_7D, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_REFLECT ; ANIM_OBJ_SHELL_SMASH_SHELL
	battleanimobj RELATIVE_X, $a8, BATTLEANIMFRAMESET_00, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_SHELL_SMASH_HIT
	battleanimobj RELATIVE_X, $6e, BATTLEANIMFRAMESET_POISON_DROPLET, BATTLEANIMFUNC_RADIAL_MOVE_OUT_SLOW, PAL_BATTLE_OB_GRAY, ANIM_GFX_POISON ; ANIM_OBJ_POISON_DROPLET
	battleanimobj RELATIVE_X | X_FLIP, $a8, BATTLEANIMFRAMESET_BERRY, BATTLEANIMFUNC_BATON_PASS, PAL_BATTLE_OB_BROWN, ANIM_GFX_BERRY ; ANIM_OBJ_BERRY
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_SMALL_GLOW, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_YELLOW, ANIM_GFX_GLOW ; ANIM_OBJ_SMALL_GLOW
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_BIG_GLOW_CLEAR, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_YELLOW, ANIM_GFX_BIG_GLOW_CLEAR ; ANIM_OBJ_BIG_GLOW_CLEAR
	battleanimobj RELATIVE_X | X_FLIP, $94, BATTLEANIMFRAMESET_SWIRL_SHORT, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_SWIRL ; ANIM_OBJ_SWIRL_SHORT
	battleanimobj ABSOLUTE_X, $ff, BATTLEANIMFRAMESET_84, BATTLEANIMFUNC_RADIAL_MOVE_OUT_VERY_SLOW, PAL_BATTLE_OB_RED, ANIM_GFX_MOON ; ANIM_OBJ_RISING_MOON
	battleanimobj RELATIVE_X, $b0, BATTLEANIMFRAMESET_SPARKLE_LONG, BATTLEANIMFUNC_MOVE_UP, PAL_BATTLE_OB_YELLOW, ANIM_GFX_SPEED ; ANIM_OBJ_RISING_SPARKLE
	battleanimobj RELATIVE_X, $94, BATTLEANIMFRAMESET_FLASH_CANNON_CHARGE_ORB, BATTLEANIMFUNC_LAST_RESORT, PAL_BATTLE_OB_GRAY, ANIM_GFX_CHARGE ; ANIM_OBJ_FLASH_CANNON_CHARGE
	battleanimobj RELATIVE_X, $94, BATTLEANIMFRAMESET_FLASH_CANNON_SPARKS, BATTLEANIMFUNC_RADIAL_MOVE_OUT_SLOW, PAL_BATTLE_OB_GRAY, ANIM_GFX_GLOW ; ANIM_OBJ_FLASH_CANNON_SPARKS_WHITE
	battleanimobj RELATIVE_X, $94, BATTLEANIMFRAMESET_FLASH_CANNON_SPARKS, BATTLEANIMFUNC_RADIAL_MOVE_OUT_SLOW, PAL_BATTLE_OB_YELLOW, ANIM_GFX_GLOW ; ANIM_OBJ_FLASH_CANNON_SPARKS_RED
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_TINY_GLOW, BATTLEANIMFUNC_USER_TO_TARGET_DISAPPEAR, PAL_BATTLE_OB_GRAY, ANIM_GFX_GLOW ; ANIM_OBJ_FLASH_CANNON
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_PULSING_SPARKLE, BATTLEANIMFUNC_USER_TO_TARGET, PAL_BATTLE_OB_YELLOW, ANIM_GFX_SPEED ; ANIM_OBJ_PULSING_SPARKLE
	battleanimobj RELATIVE_X | X_FLIP, $88, BATTLEANIMFRAMESET_PULSING_SPARKLE, BATTLEANIMFUNC_USER_TO_TARGET, PAL_BATTLE_OB_YELLOW, ANIM_GFX_SPEED ; ANIM_OBJ_PULSING_SPARKLE_YFIX
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_GLIMMER, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_GRAY, ANIM_GFX_SHINE ; ANIM_OBJ_GLIMMER_YFIX
	battleanimobj RELATIVE_X, $94, BATTLEANIMFRAMESET_COTTON, BATTLEANIMFUNC_USER_TO_TARGET_DISAPPEAR, PAL_BATTLE_OB_BLUE, ANIM_GFX_MISC ; ANIM_OBJ_SCALD
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_OCTAZOOKA_SMOKE, BATTLEANIMFUNC_RADIAL_MOVE_OUT_SLOW, PAL_BATTLE_OB_YELLOW, ANIM_GFX_SMOKE_PUFF ; ANIM_OBJ_SCALD_STEAM
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_BOUNCING_MUSHROOM, BATTLEANIMFUNC_NULL, PAL_BATTLE_OB_RED, ANIM_GFX_MUSHROOM ; ANIM_OBJ_MUSHROOM
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_POWDER, BATTLEANIMFUNC_RADIAL_MOVE_OUT_SLOW, PAL_BATTLE_OB_YELLOW, ANIM_GFX_POWDER ; ANIM_OBJ_POWDER_SHOOT
	assert_table_length NUM_ANIM_OBJS
