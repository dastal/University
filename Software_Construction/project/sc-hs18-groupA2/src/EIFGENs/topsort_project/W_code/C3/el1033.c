/*
 * Code for class ELEMENT_LIBRARY [INTEGER_32]
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern void F1033_7209(EIF_REFERENCE);
extern void F1033_7210(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE);
extern void F1033_7211(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F1033_7212(EIF_REFERENCE, EIF_TYPED_VALUE);
extern EIF_TYPED_VALUE F1033_7213(EIF_REFERENCE);
extern void F1033_7214(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F1033_7215(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE);
extern EIF_TYPED_VALUE F1033_7216(EIF_REFERENCE);
extern void F1033_7217(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F1033_7218(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE);
extern void F1033_7219(EIF_REFERENCE);
extern void F1033_7220(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F1033_7221(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F1033_7222(EIF_REFERENCE, EIF_TYPED_VALUE);
extern EIF_TYPED_VALUE F1033_7223(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1033_7224(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1033_7225(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1033_7226(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1033_7227(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1033_7228(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1033_7229(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1033_7230(EIF_REFERENCE, EIF_TYPED_VALUE);
extern EIF_TYPED_VALUE F1033_7231(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void EIF_Minit1033(void);

#ifdef __cplusplus
}
#endif

#include "eif_out.h"

#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif

/* {ELEMENT_LIBRARY}.ele_lib */
void F1033_7209 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "ele_lib";
	RTEX;
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_REFERENCE tr1 = NULL;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(2);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLIU(2);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1032, Current, 0, 0, 13505);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1032, Current, 13505);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 5056, 0xF8000353, 0); /* all_elements */
	tr1 = RTLNSMART(RTWCT(5056, dtype, Dftype(Current)).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2777, Dtype(tr1)))(tr1);
	RTNHOOK(1,1);
	tr1 = RTCCL(tr1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(5056, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(2);
	RTDBGAA(Current, dtype, 5057, 0xF8000353, 0); /* all_constraints */
	tr1 = RTLNSMART(RTWCT(5057, dtype, Dftype(Current)).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2777, Dtype(tr1)))(tr1);
	RTNHOOK(2,1);
	tr1 = RTCCL(tr1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(5057, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(3);
	RTDBGAA(Current, dtype, 5060, 0xF80000FE, 0); /* input_element */
	tr1 = RTLNSMART(RTWCT(5060, dtype, Dftype(Current)).id);
	ui4_1 = ((EIF_INTEGER_32) 50L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3146, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(3,1);
	tr1 = RTCCL(tr1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(5060, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(4);
	RTDBGAA(Current, dtype, 5061, 0xF80000FE, 0); /* input_constraint_first */
	tr1 = RTLNSMART(RTWCT(5061, dtype, Dftype(Current)).id);
	ui4_1 = ((EIF_INTEGER_32) 50L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3146, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(4,1);
	tr1 = RTCCL(tr1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(5061, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(5);
	RTDBGAA(Current, dtype, 5062, 0xF80000FE, 0); /* input_constraint_second */
	tr1 = RTLNSMART(RTWCT(5062, dtype, Dftype(Current)).id);
	ui4_1 = ((EIF_INTEGER_32) 50L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3146, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(5,1);
	tr1 = RTCCL(tr1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(5062, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(6);
	RTDBGAA(Current, dtype, 5058, 0xF8000353, 0); /* constraints_found */
	tr1 = RTLNSMART(RTWCT(5058, dtype, Dftype(Current)).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2777, Dtype(tr1)))(tr1);
	RTNHOOK(6,1);
	tr1 = RTCCL(tr1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(5058, dtype)) = (EIF_REFERENCE) tr1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(7);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
#undef ui4_1
}

/* {ELEMENT_LIBRARY}.transfer */
void F1033_7210 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x, EIF_TYPED_VALUE arg2x, EIF_TYPED_VALUE arg3x)
{
	GTCX
	char *l_feature_name = "transfer";
	RTEX;
	EIF_REFERENCE loc1 = (EIF_REFERENCE) 0;
#define arg1 arg1x.it_r
#define arg2 arg2x.it_r
#define arg3 arg3x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE up2x = {{0}, SK_POINTER};
#define up2 up2x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ur2x = {{0}, SK_REF};
#define ur2 ur2x.it_r
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE tr3 = NULL;
	EIF_BOOLEAN tb1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(10);
	RTLR(0,arg1);
	RTLR(1,arg2);
	RTLR(2,arg3);
	RTLR(3,Current);
	RTLR(4,tr1);
	RTLR(5,ur1);
	RTLR(6,tr2);
	RTLR(7,ur2);
	RTLR(8,loc1);
	RTLR(9,tr3);
	RTLIU(10);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU(SK_REF,&arg2);
	RTLU(SK_REF,&arg3);
	RTLU (SK_REF, &Current);
	RTLU(SK_REF, &loc1);
	
	RTEAA(l_feature_name, 1032, Current, 1, 3, 13506);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1032, Current, 13506);
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,254,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(Dftype(Current), typarr0)));
		RTCC(arg1, 1032, l_feature_name, 1, typres0, 0x01);
	}
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,254,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(Dftype(Current), typarr0)));
		RTCC(arg2, 1032, l_feature_name, 2, typres0, 0x01);
	}
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,254,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(Dftype(Current), typarr0)));
		RTCC(arg3, 1032, l_feature_name, 3, typres0, 0x01);
	}
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("element_list_not_empty", EX_PRE);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1723, "is_empty", arg1))(arg1)).it_b);
		RTTE((EIF_BOOLEAN) !tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	RTDBGAA(Current, dtype, 5060, 0xF80000FE, 0); /* input_element */
	tr1 = RTCCL(arg1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(5060, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(3);
	RTDBGAA(Current, dtype, 5061, 0xF80000FE, 0); /* input_constraint_first */
	tr1 = RTCCL(arg2);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(5061, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(4);
	RTDBGAA(Current, dtype, 5062, 0xF80000FE, 0); /* input_constraint_second */
	tr1 = RTCCL(arg3);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(5062, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(5);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5060, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5047, dtype))(Current, ur1x);
	RTHOOK(6);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5061, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = ((up2x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5062, dtype))(Current)), (((up2x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up2x.it_r = RTBU(up2x))), (up2x.type = SK_POINTER), up2x.it_r);
	ur2 = RTCCL(tr2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWF(5048, dtype))(Current, ur1x, ur2x);
	RTHOOK(7);
	RTDBGAL(Current, 1, 0xF8000409, 0, 0); /* loc1 */
	{
		EIF_TYPE_INDEX typarr0[] = {0xFF01,1033,0,0,0xFFFF};
		EIF_TYPE typres0;
		{
			EIF_TYPE l_type;
			l_type = RTWCT(5065, dtype, Dftype(Current));
			typarr0[2] = l_type.annotations | 0xFF00;
			typarr0[3] = l_type.id;
		}
		
		typres0 = eif_compound_id(Dftype(Current), typarr0);
		tr1 = RTLN(typres0.id);
	}
	tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr2);
	tr3 = ((up2x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5057, dtype))(Current)), (((up2x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up2x.it_r = RTBU(up2x))), (up2x.type = SK_POINTER), up2x.it_r);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5009, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(7,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	if (RTAL & CK_ENSURE) {
		RTHOOK(8);
		RTCT("elment_list_is_equal", EX_POST);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5060, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		if (RTCEQ(tr1, arg1)) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(9);
		RTCT("constraint_list_first_element_is_equal", EX_POST);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5061, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		if (RTCEQ(tr1, arg2)) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(10);
		RTCT("constraint_list_second_element_is_equal", EX_POST);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5062, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		if (RTCEQ(tr1, arg3)) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(11);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(6);
	RTEE;
#undef up1
#undef up2
#undef ur1
#undef ur2
#undef arg3
#undef arg2
#undef arg1
}

/* {ELEMENT_LIBRARY}.add_element */
void F1033_7211 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "add_element";
	RTEX;
#define arg1 arg1x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE up2x = {{0}, SK_POINTER};
#define up2 up2x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE tr3 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_INTEGER_32 ti4_2;
	EIF_BOOLEAN tb1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(6);
	RTLR(0,arg1);
	RTLR(1,ur1);
	RTLR(2,Current);
	RTLR(3,tr1);
	RTLR(4,tr2);
	RTLR(5,tr3);
	RTLIU(6);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1032, Current, 0, 1, 13507);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1032, Current, 13507);
	RTCC(arg1, 1032, l_feature_name, 1, eif_new_type(962, 0x01), 0x01);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("element_not_in_list", EX_PRE);
		ur1 = RTCCL(arg1);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5063, dtype))(Current, ur1x)).it_b);
		RTTE((EIF_BOOLEAN) !tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	if (RTAL & CK_ENSURE) {
		in_assertion = ~0;
		RTE_OT
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(1,1);
		ti4_2 = *(EIF_INTEGER_32 *)(tr1 + RTVA(2788, "count", tr1));
		ti4_1 = ti4_2;
		tr1 = NULL;
		RTE_O
		tr1 = RTLA;
		RTE_OE
		in_assertion = 0;
	}
	RTHOOK(2);
	tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(2,1);
	ur1 = RTCCL(arg1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1735, "extend", tr2))(tr2, ur1x);
	if (RTAL & CK_ENSURE) {
		RTHOOK(3);
		RTCT("one_element_more", EX_POST);
		tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(3,1);
		ti4_2 = *(EIF_INTEGER_32 *)(tr2 + RTVA(2788, "count", tr2));
		RTCO(tr1);
		if ((EIF_BOOLEAN)(ti4_2 == (EIF_INTEGER_32) (ti4_1 + ((EIF_INTEGER_32) 1L)))) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(4);
		RTCT("element_added", EX_POST);
		tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(4,1);
		tr3 = ((up2x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2693, "last", tr2))(tr2)), (((up2x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up2x.it_r = RTBU(up2x))), (up2x.type = SK_POINTER), up2x.it_r);
		if (RTCEQ(tr3, arg1)) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(5);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef up1
#undef up2
#undef ur1
#undef arg1
}

/* {ELEMENT_LIBRARY}.add_constraint */
void F1033_7212 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "add_constraint";
	RTEX;
#define arg1 arg1x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE tr3 = NULL;
	EIF_BOOLEAN tb1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(6);
	RTLR(0,arg1);
	RTLR(1,tr1);
	RTLR(2,ur1);
	RTLR(3,Current);
	RTLR(4,tr2);
	RTLR(5,tr3);
	RTLIU(6);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1032, Current, 0, 1, 13508);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1032, Current, 13508);
	RTCC(arg1, 1032, l_feature_name, 1, eif_new_type(961, 0x01), 0x01);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("element_1_exists", EX_PRE);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5013, "el_1", arg1))(arg1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		ur1 = RTCCL(tr1);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5063, dtype))(Current, ur1x)).it_b);
		RTTE(tb1, label_1);
		RTCK;
		RTHOOK(2);
		RTCT("element_2_exists", EX_PRE);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5014, "el_2", arg1))(arg1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		ur1 = RTCCL(tr1);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5063, dtype))(Current, ur1x)).it_b);
		RTTE(tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(3);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5013, "el_1", arg1))(arg1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(3,1);
	tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5016, "name", tr1))(tr1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(3,2);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5014, "el_2", arg1))(arg1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(3,3);
	tr3 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5016, "name", tr1))(tr1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr3);
	tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(11, "is_equal", tr2))(tr2, ur1x)).it_b);
	if (tb1) {
	} else {
		RTHOOK(4);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5057, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(4,1);
		ur1 = RTCCL(arg1);
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1735, "extend", tr1))(tr1, ur1x);
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(5);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef up1
#undef ur1
#undef arg1
}

/* {ELEMENT_LIBRARY}.list_index */
EIF_TYPED_VALUE F1033_7213 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = *(EIF_INTEGER_32 *)(Current + RTWA(5046,Dtype(Current)));
	return r;
}


/* {ELEMENT_LIBRARY}.add_elements_input */
void F1033_7214 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "add_elements_input";
	RTEX;
	EIF_REFERENCE loc1 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc2 = (EIF_REFERENCE) 0;
#define arg1 arg1x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE tr3 = NULL;
	EIF_REFERENCE tr4 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_INTEGER_32 ti4_2;
	EIF_INTEGER_32 ti4_3;
	EIF_INTEGER_32 ti4_4;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(9);
	RTLR(0,arg1);
	RTLR(1,Current);
	RTLR(2,tr1);
	RTLR(3,tr2);
	RTLR(4,loc2);
	RTLR(5,tr3);
	RTLR(6,loc1);
	RTLR(7,tr4);
	RTLR(8,ur1);
	RTLIU(9);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	RTLU(SK_REF, &loc1);
	RTLU(SK_REF, &loc2);
	
	RTEAA(l_feature_name, 1032, Current, 2, 1, 13510);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1032, Current, 13510);
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,254,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(Dftype(Current), typarr0)));
		RTCC(arg1, 1032, l_feature_name, 1, typres0, 0x01);
	}
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("input_list_not_empty", EX_PRE);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1723, "is_empty", arg1))(arg1)).it_b);
		RTTE((EIF_BOOLEAN) !tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	if (RTAL & CK_ENSURE) {
		in_assertion = ~0;
		RTE_OT
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(1,1);
		ti4_2 = *(EIF_INTEGER_32 *)(tr1 + RTVA(2788, "count", tr1));
		ti4_1 = ti4_2;
		tr1 = NULL;
		RTE_O
		tr1 = RTLA;
		RTE_OE
		RTE_OT
		tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(1,2);
		ti4_3 = *(EIF_INTEGER_32 *)(tr2 + RTVA(2788, "count", tr2));
		ti4_2 = ti4_3;
		tr2 = NULL;
		RTE_O
		tr2 = RTLA;
		RTE_OE
		in_assertion = 0;
	}
	RTHOOK(2);
	RTDBGAL(Current, 1, 0xF8000120, 0, 0); /* loc2 */
	tr3 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2525, "new_cursor", arg1))(arg1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	loc2 = (EIF_REFERENCE) RTCCL(tr3);
	for (;;) {
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1701, "after", loc2))(loc2)).it_b);
		if (tb1) break;
		RTHOOK(3);
		RTDBGAL(Current, 1, 0xF80003C2, 0, 0); /* loc1 */
		tr3 = RTLN(eif_new_type(962, 0x01).id);
		tr4 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1700, "item", loc2))(loc2)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		ur1 = RTCCL(tr4);
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr3)))(tr3, ur1x);
		RTNHOOK(3,1);
		loc1 = (EIF_REFERENCE) RTCCL(tr3);
		RTHOOK(4);
		ur1 = RTCCL(loc1);
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5044, dtype))(Current, ur1x);
		RTHOOK(5);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1702, "forth", loc2))(loc2);
	}
	if (RTAL & CK_ENSURE) {
		RTHOOK(6);
		RTCT("equal_or_more_elements", EX_POST);
		tb2 = '\0';
		tr3 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(6,1);
		ti4_3 = *(EIF_INTEGER_32 *)(tr3 + RTVA(2788, "count", tr3));
		RTCO(tr1);
		if ((EIF_BOOLEAN) (ti4_3 >= ti4_1)) {
			tr3 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
			RTNHOOK(6,2);
			ti4_3 = *(EIF_INTEGER_32 *)(tr3 + RTVA(2788, "count", tr3));
			RTCO(tr2);
			ti4_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1782, "count", arg1))(arg1)).it_i4);
			tb2 = (EIF_BOOLEAN) (ti4_3 <= (EIF_INTEGER_32) (ti4_2 + ti4_4));
		}
		if (tb2) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(7);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(5);
	RTEE;
#undef up1
#undef ur1
#undef arg1
}

/* {ELEMENT_LIBRARY}.add_constraints_input */
void F1033_7215 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x, EIF_TYPED_VALUE arg2x)
{
	GTCX
	char *l_feature_name = "add_constraints_input";
	RTEX;
	EIF_REFERENCE loc1 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc2 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc3 = (EIF_REFERENCE) 0;
#define arg1 arg1x.it_r
#define arg2 arg2x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ur2x = {{0}, SK_REF};
#define ur2 ur2x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE tr3 = NULL;
	EIF_REFERENCE tr4 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_INTEGER_32 ti4_2;
	EIF_INTEGER_32 ti4_3;
	EIF_INTEGER_32 ti4_4;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(12);
	RTLR(0,arg1);
	RTLR(1,arg2);
	RTLR(2,Current);
	RTLR(3,tr1);
	RTLR(4,tr2);
	RTLR(5,loc2);
	RTLR(6,tr3);
	RTLR(7,tr4);
	RTLR(8,ur1);
	RTLR(9,loc3);
	RTLR(10,loc1);
	RTLR(11,ur2);
	RTLIU(12);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU(SK_REF,&arg2);
	RTLU (SK_REF, &Current);
	RTLU(SK_REF, &loc1);
	RTLU(SK_REF, &loc2);
	RTLU(SK_REF, &loc3);
	
	RTEAA(l_feature_name, 1032, Current, 3, 2, 13511);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1032, Current, 13511);
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,254,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(Dftype(Current), typarr0)));
		RTCC(arg1, 1032, l_feature_name, 1, typres0, 0x01);
	}
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,254,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(Dftype(Current), typarr0)));
		RTCC(arg2, 1032, l_feature_name, 2, typres0, 0x01);
	}
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("input_list1_not_empty", EX_PRE);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1723, "is_empty", arg1))(arg1)).it_b);
		RTTE((EIF_BOOLEAN) !tb1, label_1);
		RTCK;
		RTHOOK(2);
		RTCT("input_list2_not_empty", EX_PRE);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1723, "is_empty", arg2))(arg2)).it_b);
		RTTE((EIF_BOOLEAN) !tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	if (RTAL & CK_ENSURE) {
		in_assertion = ~0;
		RTE_OT
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5057, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(2,1);
		ti4_2 = *(EIF_INTEGER_32 *)(tr1 + RTVA(2788, "count", tr1));
		ti4_1 = ti4_2;
		tr1 = NULL;
		RTE_O
		tr1 = RTLA;
		RTE_OE
		RTE_OT
		tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5057, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(2,2);
		ti4_3 = *(EIF_INTEGER_32 *)(tr2 + RTVA(2788, "count", tr2));
		ti4_2 = ti4_3;
		tr2 = NULL;
		RTE_O
		tr2 = RTLA;
		RTE_OE
		in_assertion = 0;
	}
	RTHOOK(3);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1804, "start", arg1))(arg1);
	for (;;) {
		RTHOOK(4);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1818, "after", arg1))(arg1)).it_b);
		if (tb1) break;
		RTHOOK(5);
		RTDBGAA(Current, dtype, 5046, 0x10000000, 1); /* list_index */
		ti4_3 = *(EIF_INTEGER_32 *)(arg1 + RTVA(3159, "index", arg1));
		*(EIF_INTEGER_32 *)(Current + RTWA(5046, dtype)) = (EIF_INTEGER_32) ti4_3;
		RTHOOK(6);
		RTDBGAL(Current, 2, 0xF80003C2, 0, 0); /* loc2 */
		tr3 = RTLN(eif_new_type(962, 0x01).id);
		tr4 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1771, "item", arg1))(arg1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		ur1 = RTCCL(tr4);
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr3)))(tr3, ur1x);
		RTNHOOK(6,1);
		loc2 = (EIF_REFERENCE) RTCCL(tr3);
		RTHOOK(7);
		RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
		tr3 = RTLN(eif_new_type(962, 0x01).id);
		ti4_3 = *(EIF_INTEGER_32 *)(Current + RTWA(5046, dtype));
		ui4_1 = ti4_3;
		tr4 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1765, "i_th", arg2))(arg2, ui4_1x)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		ur1 = RTCCL(tr4);
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr3)))(tr3, ur1x);
		RTNHOOK(7,1);
		loc3 = (EIF_REFERENCE) RTCCL(tr3);
		RTHOOK(8);
		RTDBGAL(Current, 1, 0xF80003C1, 0, 0); /* loc1 */
		tr3 = RTLN(eif_new_type(961, 0x01).id);
		ur1 = RTCCL(loc2);
		ur2 = RTCCL(loc3);
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr3)))(tr3, ur1x, ur2x);
		RTNHOOK(8,1);
		loc1 = (EIF_REFERENCE) RTCCL(tr3);
		RTHOOK(9);
		ur1 = RTCCL(loc1);
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
		RTHOOK(10);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1820, "forth", arg1))(arg1);
	}
	if (RTAL & CK_ENSURE) {
		RTHOOK(11);
		RTCT("equal_or_more_constraints", EX_POST);
		tb2 = '\0';
		tr3 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5057, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(11,1);
		ti4_3 = *(EIF_INTEGER_32 *)(tr3 + RTVA(2788, "count", tr3));
		RTCO(tr1);
		if ((EIF_BOOLEAN) (ti4_3 >= ti4_1)) {
			tr3 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5057, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
			RTNHOOK(11,2);
			ti4_3 = *(EIF_INTEGER_32 *)(tr3 + RTVA(2788, "count", tr3));
			RTCO(tr2);
			ti4_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1782, "count", arg1))(arg1)).it_i4);
			tb2 = (EIF_BOOLEAN) (ti4_3 <= (EIF_INTEGER_32) (ti4_2 + ti4_4));
		}
		if (tb2) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(12);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(7);
	RTEE;
#undef up1
#undef ur1
#undef ur2
#undef ui4_1
#undef arg2
#undef arg1
}

/* {ELEMENT_LIBRARY}.i */
EIF_TYPED_VALUE F1033_7216 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = *(EIF_INTEGER_32 *)(Current + RTWA(5049,Dtype(Current)));
	return r;
}


/* {ELEMENT_LIBRARY}.loop_elements */
void F1033_7217 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "loop_elements";
	RTEX;
	EIF_REFERENCE loc1 = (EIF_REFERENCE) 0;
#define arg1 arg1x.it_i4
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_INTEGER_32 ti4_2;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_i4 = * (EIF_INTEGER_32 *) arg1x.it_r;
	
	RTLI(5);
	RTLR(0,Current);
	RTLR(1,loc1);
	RTLR(2,tr1);
	RTLR(3,tr2);
	RTLR(4,ur1);
	RTLIU(5);
	RTLU (SK_VOID, NULL);
	RTLU(SK_INT32,&arg1);
	RTLU (SK_REF, &Current);
	RTLU(SK_REF, &loc1);
	
	RTEAA(l_feature_name, 1032, Current, 1, 1, 13513);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1032, Current, 13513);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 5049, 0x10000000, 1); /* i */
	*(EIF_INTEGER_32 *)(Current + RTWA(5049, dtype)) = (EIF_INTEGER_32) ((EIF_INTEGER_32) 0L);
	for (;;) {
		RTHOOK(2);
		ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(5049, dtype));
		if ((EIF_BOOLEAN)(ti4_1 == arg1)) break;
		RTHOOK(3);
		RTDBGAL(Current, 1, 0xF80003C2, 0, 0); /* loc1 */
		tr1 = RTLN(eif_new_type(962, 0x01).id);
		ti4_2 = *(EIF_INTEGER_32 *)(Current + RTWA(5049, dtype));
		tr2 = c_outi(ti4_2);
		ur1 = RTCCL(tr2);
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
		RTNHOOK(3,1);
		loc1 = (EIF_REFERENCE) RTCCL(tr1);
		RTHOOK(4);
		ur1 = RTCCL(loc1);
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5044, dtype))(Current, ur1x);
		RTHOOK(5);
		RTDBGAA(Current, dtype, 5049, 0x10000000, 1); /* i */
		(*(EIF_INTEGER_32 *)(Current + RTWA(5049, dtype)))++;
	}
	if (RTAL & CK_ENSURE) {
		RTHOOK(6);
		RTCT("correct_amount", EX_POST);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(6,1);
		ti4_2 = *(EIF_INTEGER_32 *)(tr1 + RTVA(2788, "count", tr1));
		if ((EIF_BOOLEAN)(ti4_2 == arg1)) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(7);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(4);
	RTEE;
#undef up1
#undef ur1
#undef arg1
}

/* {ELEMENT_LIBRARY}.loop_constraints */
void F1033_7218 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x, EIF_TYPED_VALUE arg2x)
{
	GTCX
	char *l_feature_name = "loop_constraints";
	RTEX;
	EIF_INTEGER_32 loc1 = (EIF_INTEGER_32) 0;
	EIF_REFERENCE loc2 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc3 = (EIF_REFERENCE) 0;
	EIF_INTEGER_32 loc4 = (EIF_INTEGER_32) 0;
	EIF_INTEGER_32 loc5 = (EIF_INTEGER_32) 0;
	EIF_REFERENCE loc6 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc7 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc8 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc9 = (EIF_REFERENCE) 0;
#define arg1 arg1x.it_i4
#define arg2 arg2x.it_i4
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE up2x = {{0}, SK_POINTER};
#define up2 up2x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ur2x = {{0}, SK_REF};
#define ur2 ur2x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_BOOLEAN tb1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg2x.type & SK_HEAD) == SK_REF) arg2x.it_i4 = * (EIF_INTEGER_32 *) arg2x.it_r;
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_i4 = * (EIF_INTEGER_32 *) arg1x.it_r;
	
	RTLI(11);
	RTLR(0,loc2);
	RTLR(1,tr1);
	RTLR(2,loc3);
	RTLR(3,loc9);
	RTLR(4,tr2);
	RTLR(5,loc6);
	RTLR(6,Current);
	RTLR(7,loc7);
	RTLR(8,loc8);
	RTLR(9,ur1);
	RTLR(10,ur2);
	RTLIU(11);
	RTLU (SK_VOID, NULL);
	RTLU(SK_INT32,&arg1);
	RTLU(SK_INT32,&arg2);
	RTLU (SK_REF, &Current);
	RTLU(SK_INT32, &loc1);
	RTLU(SK_REF, &loc2);
	RTLU(SK_REF, &loc3);
	RTLU(SK_INT32, &loc4);
	RTLU(SK_INT32, &loc5);
	RTLU(SK_REF, &loc6);
	RTLU(SK_REF, &loc7);
	RTLU(SK_REF, &loc8);
	RTLU(SK_REF, &loc9);
	
	RTEAA(l_feature_name, 1032, Current, 9, 2, 13514);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1032, Current, 13514);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 2, 0xF8000081, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(129, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 1L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(1890, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(1,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1804, "start", loc2))(loc2);
	RTHOOK(3);
	RTDBGAL(Current, 3, 0xF8000081, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(129, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 1L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(1890, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(3,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(4);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1804, "start", loc3))(loc3);
	RTHOOK(5);
	RTDBGAL(Current, 1, 0xF8000124, 0, 0); /* loc9 */
	ui4_1 = arg1;
	tr1 = RTLN(eif_new_type(217, 0x00).id);
	*(EIF_INTEGER_32 *)tr1 = ((EIF_INTEGER_32) 1L);
	tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(4374, "interval", tr1))(tr1, ui4_1x)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2525, "new_cursor", tr2))(tr2)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	loc9 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(6);
	RTDBGAL(Current, 1, 0x10000000, 1, 0); /* loc1 */
	loc1 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 1L);
	for (;;) {
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1701, "after", loc9))(loc9)).it_b);
		if (tb1) break;
		RTHOOK(7);
		if ((EIF_BOOLEAN) (loc1 > arg1)) break;
		RTHOOK(8);
		RTDBGAL(Current, 4, 0x10000000, 1, 0); /* loc4 */
		ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1771, "item", loc2))(loc2)).it_i4);
		loc4 = (EIF_INTEGER_32) (EIF_INTEGER_32) (ti4_1 % arg2);
		RTHOOK(9);
		RTDBGAL(Current, 5, 0x10000000, 1, 0); /* loc5 */
		ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1771, "item", loc3))(loc3)).it_i4);
		loc5 = (EIF_INTEGER_32) (EIF_INTEGER_32) (ti4_1 % arg2);
		RTHOOK(10);
		if ((EIF_BOOLEAN)(loc4 == ((EIF_INTEGER_32) 0L))) {
			RTHOOK(11);
			RTDBGAL(Current, 4, 0x10000000, 1, 0); /* loc4 */
			loc4++;
		}
		RTHOOK(12);
		if ((EIF_BOOLEAN) (loc4 > (EIF_INTEGER_32) (arg2 - ((EIF_INTEGER_32) 2L)))) {
			RTHOOK(13);
			RTDBGAL(Current, 4, 0x10000000, 1, 0); /* loc4 */
			loc4--;
		}
		RTHOOK(14);
		if ((EIF_BOOLEAN)(loc5 == ((EIF_INTEGER_32) 0L))) {
			RTHOOK(15);
			RTDBGAL(Current, 5, 0x10000000, 1, 0); /* loc5 */
			loc5++;
		}
		RTHOOK(16);
		if ((EIF_BOOLEAN) (loc4 > (EIF_INTEGER_32) (arg2 - ((EIF_INTEGER_32) 2L)))) {
			RTHOOK(17);
			RTDBGAL(Current, 4, 0x10000000, 1, 0); /* loc4 */
			loc4--;
		}
		RTHOOK(18);
		RTDBGAL(Current, 6, 0xF80003C2, 0, 0); /* loc6 */
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(18,1);
		ui4_1 = loc4;
		tr2 = ((up2x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1765, "i_th", tr1))(tr1, ui4_1x)), (((up2x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up2x.it_r = RTBU(up2x))), (up2x.type = SK_POINTER), up2x.it_r);
		loc6 = (EIF_REFERENCE) RTCCL(tr2);
		RTHOOK(19);
		RTDBGAL(Current, 7, 0xF80003C2, 0, 0); /* loc7 */
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(19,1);
		ui4_1 = loc5;
		tr2 = ((up2x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1765, "i_th", tr1))(tr1, ui4_1x)), (((up2x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up2x.it_r = RTBU(up2x))), (up2x.type = SK_POINTER), up2x.it_r);
		loc7 = (EIF_REFERENCE) RTCCL(tr2);
		RTHOOK(20);
		RTDBGAL(Current, 8, 0xF80003C1, 0, 0); /* loc8 */
		tr1 = RTLN(eif_new_type(961, 0x01).id);
		ur1 = RTCCL(loc6);
		ur2 = RTCCL(loc7);
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
		RTNHOOK(20,1);
		loc8 = (EIF_REFERENCE) RTCCL(tr1);
		RTHOOK(21);
		ur1 = RTCCL(loc8);
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
		RTHOOK(22);
		RTDBGAA(Current, dtype, 5049, 0x10000000, 1); /* i */
		(*(EIF_INTEGER_32 *)(Current + RTWA(5049, dtype)))++;
		RTHOOK(23);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1820, "forth", loc2))(loc2);
		RTHOOK(24);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1820, "forth", loc3))(loc3);
		RTHOOK(25);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1702, "forth", loc9))(loc9);
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(26);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(13);
	RTEE;
#undef up1
#undef up2
#undef ur1
#undef ur2
#undef ui4_1
#undef arg2
#undef arg1
}

/* {ELEMENT_LIBRARY}.example_1 */
void F1033_7219 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "example_1";
	RTEX;
	EIF_REFERENCE loc1 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc2 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc3 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc4 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc5 = (EIF_REFERENCE) 0;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE up2x = {{0}, SK_POINTER};
#define up2 up2x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ur2x = {{0}, SK_REF};
#define ur2 ur2x.it_r
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE tr3 = NULL;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(11);
	RTLR(0,loc1);
	RTLR(1,tr1);
	RTLR(2,tr2);
	RTLR(3,ur1);
	RTLR(4,Current);
	RTLR(5,loc3);
	RTLR(6,loc4);
	RTLR(7,loc2);
	RTLR(8,ur2);
	RTLR(9,loc5);
	RTLR(10,tr3);
	RTLIU(11);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	RTLU(SK_REF, &loc1);
	RTLU(SK_REF, &loc2);
	RTLU(SK_REF, &loc3);
	RTLU(SK_REF, &loc4);
	RTLU(SK_REF, &loc5);
	
	RTEAA(l_feature_name, 1032, Current, 5, 0, 13515);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1032, Current, 13515);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 1, 0xF80003C2, 0, 0); /* loc1 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("des_system_lib",14,861989474);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(1,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	ur1 = RTCCL(loc1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5044, dtype))(Current, ur1x);
	RTHOOK(3);
	RTDBGAL(Current, 1, 0xF80003C2, 0, 0); /* loc1 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("std",3,7566436);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(3,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(4);
	ur1 = RTCCL(loc1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5044, dtype))(Current, ur1x);
	RTHOOK(5);
	RTDBGAL(Current, 1, 0xF80003C2, 0, 0); /* loc1 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("synopsys",8,754612851);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(5,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(6);
	ur1 = RTCCL(loc1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5044, dtype))(Current, ur1x);
	RTHOOK(7);
	RTDBGAL(Current, 1, 0xF80003C2, 0, 0); /* loc1 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("std_cell_lib",12,844878946);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(7,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(8);
	ur1 = RTCCL(loc1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5044, dtype))(Current, ur1x);
	RTHOOK(9);
	RTDBGAL(Current, 1, 0xF80003C2, 0, 0); /* loc1 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("ieee",4,1768252773);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(9,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(10);
	ur1 = RTCCL(loc1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5044, dtype))(Current, ur1x);
	RTHOOK(11);
	RTDBGAL(Current, 1, 0xF80003C2, 0, 0); /* loc1 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw01",4,1685532721);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(11,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(12);
	ur1 = RTCCL(loc1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5044, dtype))(Current, ur1x);
	RTHOOK(13);
	RTDBGAL(Current, 1, 0xF80003C2, 0, 0); /* loc1 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw02",4,1685532722);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(13,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(14);
	ur1 = RTCCL(loc1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5044, dtype))(Current, ur1x);
	RTHOOK(15);
	RTDBGAL(Current, 1, 0xF80003C2, 0, 0); /* loc1 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw03",4,1685532723);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(15,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(16);
	ur1 = RTCCL(loc1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5044, dtype))(Current, ur1x);
	RTHOOK(17);
	RTDBGAL(Current, 1, 0xF80003C2, 0, 0); /* loc1 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw04",4,1685532724);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(17,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(18);
	ur1 = RTCCL(loc1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5044, dtype))(Current, ur1x);
	RTHOOK(19);
	RTDBGAL(Current, 1, 0xF80003C2, 0, 0); /* loc1 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw05",4,1685532725);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(19,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(20);
	ur1 = RTCCL(loc1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5044, dtype))(Current, ur1x);
	RTHOOK(21);
	RTDBGAL(Current, 1, 0xF80003C2, 0, 0); /* loc1 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw06",4,1685532726);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(21,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(22);
	ur1 = RTCCL(loc1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5044, dtype))(Current, ur1x);
	RTHOOK(23);
	RTDBGAL(Current, 1, 0xF80003C2, 0, 0); /* loc1 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw07",4,1685532727);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(23,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(24);
	ur1 = RTCCL(loc1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5044, dtype))(Current, ur1x);
	RTHOOK(25);
	RTDBGAL(Current, 1, 0xF80003C2, 0, 0); /* loc1 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dware",5,2003642981);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(25,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(26);
	ur1 = RTCCL(loc1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5044, dtype))(Current, ur1x);
	RTHOOK(27);
	RTDBGAL(Current, 1, 0xF80003C2, 0, 0); /* loc1 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("gtech",5,1953592680);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(27,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(28);
	ur1 = RTCCL(loc1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5044, dtype))(Current, ur1x);
	RTHOOK(29);
	RTDBGAL(Current, 1, 0xF80003C2, 0, 0); /* loc1 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("ramlib",6,2060699490);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(29,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(30);
	ur1 = RTCCL(loc1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5044, dtype))(Current, ur1x);
	RTHOOK(31);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("des_system_lib",14,861989474);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(31,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(32);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("std",3,7566436);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(32,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(33);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(33,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(34);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(35);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("des_system_lib",14,861989474);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(35,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(36);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("synopsys",8,754612851);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(36,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(37);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(37,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(38);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(39);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("des_system_lib",14,861989474);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(39,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(40);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("std_cell_lib",12,844878946);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(40,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(41);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(41,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(42);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(43);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("des_system_lib",14,861989474);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(43,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(44);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("des_system_lib",14,861989474);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(44,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(45);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(45,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(46);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(47);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("des_system_lib",14,861989474);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(47,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(48);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw02",4,1685532722);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(48,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(49);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(49,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(50);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(51);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("des_system_lib",14,861989474);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(51,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(52);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw01",4,1685532721);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(52,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(53);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(53,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(54);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(55);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("des_system_lib",14,861989474);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(55,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(56);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("ramlib",6,2060699490);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(56,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(57);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(57,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(58);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(59);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw01",4,1685532721);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(59,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(60);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("ieee",4,1768252773);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(60,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(61);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(61,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(62);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(63);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw01",4,1685532721);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(63,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(64);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw01",4,1685532721);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(64,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(65);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(65,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(66);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(67);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw01",4,1685532721);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(67,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(68);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dware",5,2003642981);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(68,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(69);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(69,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(70);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(71);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw01",4,1685532721);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(71,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(72);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("gtech",5,1953592680);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(72,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(73);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(73,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(74);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(75);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw02",4,1685532722);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(75,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(76);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("ieee",4,1768252773);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(76,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(77);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(77,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(78);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(79);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw02",4,1685532722);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(79,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(80);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw02",4,1685532722);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(80,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(81);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(81,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(82);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(83);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw02",4,1685532722);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(83,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(84);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dware",5,2003642981);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(84,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(85);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(85,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(86);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(87);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw03",4,1685532723);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(87,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(88);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("std",3,7566436);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(88,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(89);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(89,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(90);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(91);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw03",4,1685532723);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(91,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(92);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("synopsys",8,754612851);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(92,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(93);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(93,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(94);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(95);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw03",4,1685532723);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(95,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(96);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dware",5,2003642981);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(96,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(97);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(97,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(98);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(99);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw03",4,1685532723);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(99,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(100);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw03",4,1685532723);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(100,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(101);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(101,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(102);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(103);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw03",4,1685532723);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(103,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(104);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw02",4,1685532722);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(104,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(105);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(105,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(106);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(107);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw03",4,1685532723);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(107,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(108);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw01",4,1685532721);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(108,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(109);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(109,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(110);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(111);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw03",4,1685532723);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(111,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(112);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("ieee",4,1768252773);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(112,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(113);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(113,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(114);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(115);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw03",4,1685532723);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(115,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(116);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("gtech",5,1953592680);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(116,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(117);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(117,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(118);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(119);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw04",4,1685532724);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(119,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(120);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw04",4,1685532724);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(120,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(121);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(121,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(122);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(123);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw04",4,1685532724);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(123,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(124);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("ieee",4,1768252773);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(124,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(125);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(125,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(126);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(127);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw04",4,1685532724);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(127,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(128);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw01",4,1685532721);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(128,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(129);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(129,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(130);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(131);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw04",4,1685532724);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(131,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(132);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dware",5,2003642981);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(132,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(133);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(133,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(134);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(135);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw04",4,1685532724);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(135,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(136);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("gtech",5,1953592680);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(136,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(137);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(137,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(138);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(139);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw05",4,1685532725);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(139,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(140);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw05",4,1685532725);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(140,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(141);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(141,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(142);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(143);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw05",4,1685532725);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(143,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(144);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("ieee",4,1768252773);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(144,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(145);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(145,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(146);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(147);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw05",4,1685532725);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(147,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(148);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dware",5,2003642981);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(148,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(149);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(149,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(150);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(151);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw06",4,1685532726);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(151,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(152);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw06",4,1685532726);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(152,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(153);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(153,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(154);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(155);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw06",4,1685532726);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(155,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(156);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("ieee",4,1768252773);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(156,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(157);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(157,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(158);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(159);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw06",4,1685532726);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(159,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(160);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dware",5,2003642981);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(160,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(161);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(161,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(162);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(163);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw07",4,1685532727);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(163,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(164);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("ieee",4,1768252773);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(164,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(165);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(165,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(166);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(167);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dw07",4,1685532727);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(167,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(168);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dware",5,2003642981);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(168,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(169);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(169,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(170);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(171);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dware",5,2003642981);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(171,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(172);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("ieee",4,1768252773);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(172,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(173);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(173,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(174);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(175);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dware",5,2003642981);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(175,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(176);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("dware",5,2003642981);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(176,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(177);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(177,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(178);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(179);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("gtech",5,1953592680);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(179,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(180);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("ieee",4,1768252773);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(180,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(181);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(181,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(182);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(183);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("gtech",5,1953592680);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(183,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(184);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("gtech",5,1953592680);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(184,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(185);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(185,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(186);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(187);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("ramlib",6,2060699490);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(187,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(188);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("std",3,7566436);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(188,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(189);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(189,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(190);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(191);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("ramlib",6,2060699490);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(191,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(192);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("ieee",4,1768252773);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(192,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(193);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(193,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(194);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(195);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("std_cell_lib",12,844878946);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(195,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(196);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("ieee",4,1768252773);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(196,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(197);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(197,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(198);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(199);
	RTDBGAL(Current, 3, 0xF80003C2, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("std_cell_lib",12,844878946);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(199,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(200);
	RTDBGAL(Current, 4, 0xF80003C2, 0, 0); /* loc4 */
	tr1 = RTLN(eif_new_type(962, 0x01).id);
	tr2 = RTMS_EX_H("std_cell_lib",12,844878946);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(5015, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(200,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(201);
	RTDBGAL(Current, 2, 0xF80003C1, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(961, 0x01).id);
	ur1 = RTCCL(loc3);
	ur2 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5012, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(201,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(202);
	ur1 = RTCCL(loc2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5045, dtype))(Current, ur1x);
	RTHOOK(203);
	RTDBGAL(Current, 5, 0xF8000409, 0, 0); /* loc5 */
	{
		EIF_TYPE_INDEX typarr0[] = {0xFF01,1033,0,0,0xFFFF};
		EIF_TYPE typres0;
		{
			EIF_TYPE l_type;
			l_type = RTWCT(5065, dtype, Dftype(Current));
			typarr0[2] = l_type.annotations | 0xFF00;
			typarr0[3] = l_type.id;
		}
		
		typres0 = eif_compound_id(Dftype(Current), typarr0);
		tr1 = RTLN(typres0.id);
	}
	tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr2);
	tr3 = ((up2x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5057, dtype))(Current)), (((up2x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up2x.it_r = RTBU(up2x))), (up2x.type = SK_POINTER), up2x.it_r);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5009, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(203,1);
	loc5 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(204);
	tr1 = RTMS_EX_H("Ex1 completed\012",14,214185994);
	ur1 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(30, dtype))(Current, ur1x);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(205);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(7);
	RTEE;
#undef up1
#undef up2
#undef ur1
#undef ur2
}

/* {ELEMENT_LIBRARY}.example_2 */
void F1033_7220 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "example_2";
	RTEX;
	EIF_REFERENCE loc1 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc2 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc3 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc4 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc5 = (EIF_REFERENCE) 0;
	EIF_BOOLEAN loc6 = (EIF_BOOLEAN) 0;
	EIF_REFERENCE loc7 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc8 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc9 = (EIF_REFERENCE) 0;
#define arg1 arg1x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_TYPED_VALUE uc1x = {{0}, SK_CHAR8};
#define uc1 uc1x.it_c1
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	EIF_BOOLEAN tb3;
	EIF_BOOLEAN tb4;
	EIF_CHARACTER_8 tc1;
	RTCFDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(13);
	RTLR(0,arg1);
	RTLR(1,loc1);
	RTLR(2,tr1);
	RTLR(3,ur1);
	RTLR(4,loc2);
	RTLR(5,loc3);
	RTLR(6,loc5);
	RTLR(7,Current);
	RTLR(8,loc4);
	RTLR(9,loc7);
	RTLR(10,loc8);
	RTLR(11,tr2);
	RTLR(12,loc9);
	RTLIU(13);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	RTLU(SK_REF, &loc1);
	RTLU(SK_REF, &loc2);
	RTLU(SK_REF, &loc3);
	RTLU(SK_REF, &loc4);
	RTLU(SK_REF, &loc5);
	RTLU(SK_BOOL, &loc6);
	RTLU(SK_REF, &loc7);
	RTLU(SK_REF, &loc8);
	RTLU(SK_REF, &loc9);
	
	RTEAA(l_feature_name, 1032, Current, 9, 1, 13516);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(1032, Current, 13516);
	RTCC(arg1, 1032, l_feature_name, 1, eif_new_type(231, 0x01), 0x01);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 1, 0xF80000B6, 0, 0); /* loc1 */
	tr1 = RTLN(eif_new_type(182, 0x01).id);
	ur1 = RTCCL(arg1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3591, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(1,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	RTDBGAL(Current, 2, 0xF80000E7, 0, 0); /* loc2 */
	tr1 = RTLN(eif_new_type(231, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 1024L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(4581, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(2,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(3);
	RTDBGAL(Current, 3, 0xF80000E7, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(231, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 1024L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(4581, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(3,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(4);
	RTDBGAL(Current, 5, 0xF8000353, 0, 0); /* loc5 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,851,0xFF01,851,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2777, Dtype(tr1)))(tr1);
	RTNHOOK(4,1);
	loc5 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(5);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1739, "wipe_out", loc5))(loc5);
	for (;;) {
		RTHOOK(6);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1817, "exhausted", loc1))(loc1)).it_b);
		if (tb1) break;
		RTHOOK(7);
		RTDBGAL(Current, 4, 0xF8000353, 0, 0); /* loc4 */
		{
			static EIF_TYPE_INDEX typarr0[] = {0xFF01,851,0xFF01,231,0xFFFF};
			EIF_TYPE typres0;
			static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
			
			typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
			tr1 = RTLN(typres0.id);
		}
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2777, Dtype(tr1)))(tr1);
		RTNHOOK(7,1);
		loc4 = (EIF_REFERENCE) RTCCL(tr1);
		RTHOOK(8);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(3562, "read_line", loc1))(loc1);
		RTHOOK(9);
		RTDBGAL(Current, 6, 0x04000000, 1, 0); /* loc6 */
		loc6 = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
		RTHOOK(10);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(4740, "wipe_out", loc2))(loc2);
		RTHOOK(11);
		loc7 = RTCCL(loc4);
		if (EIF_TEST(loc7)) {
			RTHOOK(12);
			(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1739, "wipe_out", loc4))(loc4);
		}
		RTHOOK(13);
		RTDBGAL(Current, 2, 0xF800009A, 0, 0); /* loc8 */
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(3493, "last_string", loc1))(loc1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2525, "new_cursor", tr1))(tr1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		loc8 = (EIF_REFERENCE) RTCCL(tr2);
		for (;;) {
			tb2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1701, "after", loc8))(loc8)).it_b);
			if (tb2) break;
			RTHOOK(14);
			tc1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1700, "item", loc8))(loc8)).it_c1);
			RTNHOOK(14,1);
			tr1 = c_outc(tc1);
			RTNHOOK(14,2);
			tr2 = RTMS_EX_H(" ",1,32);
			ur1 = tr2;
			tb3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(11, "is_equal", tr1))(tr1, ur1x)).it_b);
			if ((EIF_BOOLEAN)(tb3 == (EIF_BOOLEAN) 0)) {
				RTHOOK(15);
				if ((EIF_BOOLEAN)(loc6 == (EIF_BOOLEAN) 1)) {
					RTHOOK(16);
					tc1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1700, "item", loc8))(loc8)).it_c1);
					RTNHOOK(16,1);
					tr1 = c_outc(tc1);
					RTNHOOK(16,2);
					tr2 = RTMS_EX_H(":",1,58);
					ur1 = tr2;
					tb3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(11, "is_equal", tr1))(tr1, ur1x)).it_b);
					if ((EIF_BOOLEAN)(tb3 == (EIF_BOOLEAN) 0)) {
						RTHOOK(17);
						tc1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1700, "item", loc8))(loc8)).it_c1);
						uc1 = tc1;
						(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1735, "extend", loc2))(loc2, uc1x);
					}
				}
			}
			RTHOOK(18);
			tc1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1700, "item", loc8))(loc8)).it_c1);
			RTNHOOK(18,1);
			tr1 = c_outc(tc1);
			RTNHOOK(18,2);
			tr2 = RTMS_EX_H(":",1,58);
			ur1 = tr2;
			tb3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(11, "is_equal", tr1))(tr1, ur1x)).it_b);
			if (tb3) {
				RTHOOK(19);
				RTDBGAL(Current, 6, 0x04000000, 1, 0); /* loc6 */
				loc6 = (EIF_BOOLEAN) (EIF_BOOLEAN) 0;
				RTHOOK(20);
				tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(17, "twin", loc2))(loc2)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
				ur1 = RTCCL(tr1);
				(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1735, "extend", loc4))(loc4, ur1x);
			}
			RTHOOK(21);
			tc1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1700, "item", loc8))(loc8)).it_c1);
			RTNHOOK(21,1);
			tr1 = c_outc(tc1);
			RTNHOOK(21,2);
			tr2 = RTMS_EX_H(":",1,58);
			ur1 = tr2;
			tb3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(11, "is_equal", tr1))(tr1, ur1x)).it_b);
			if ((EIF_BOOLEAN)(tb3 == (EIF_BOOLEAN) 0)) {
				RTHOOK(22);
				if ((EIF_BOOLEAN)(loc6 == (EIF_BOOLEAN) 0)) {
					RTHOOK(23);
					tc1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1700, "item", loc8))(loc8)).it_c1);
					RTNHOOK(23,1);
					tr1 = c_outc(tc1);
					RTNHOOK(23,2);
					tr2 = RTMS_EX_H(" ",1,32);
					ur1 = tr2;
					tb3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(11, "is_equal", tr1))(tr1, ur1x)).it_b);
					if ((EIF_BOOLEAN)(tb3 == (EIF_BOOLEAN) 0)) {
						RTHOOK(24);
						tc1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1700, "item", loc8))(loc8)).it_c1);
						uc1 = tc1;
						(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1735, "extend", loc3))(loc3, uc1x);
					}
				}
			}
			RTHOOK(25);
			tb3 = '\01';
			tc1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1700, "item", loc8))(loc8)).it_c1);
			RTNHOOK(25,1);
			tr1 = c_outc(tc1);
			RTNHOOK(25,2);
			tr2 = RTMS_EX_H(" ",1,32);
			ur1 = tr2;
			tb4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(11, "is_equal", tr1))(tr1, ur1x)).it_b);
			if (!tb4) {
				tb4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2590, "is_last", loc8))(loc8)).it_b);
				tb3 = tb4;
			}
			if (tb3) {
				RTHOOK(26);
				tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(28, "out", loc3))(loc3)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
				RTNHOOK(26,1);
				tb3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(4598, "is_empty", tr1))(tr1)).it_b);
				if ((EIF_BOOLEAN)(tb3 == (EIF_BOOLEAN) 0)) {
					RTHOOK(27);
					tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(17, "twin", loc3))(loc3)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
					ur1 = RTCCL(tr1);
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1735, "extend", loc4))(loc4, ur1x);
					RTHOOK(28);
					loc9 = RTCCL(loc5);
					if (EIF_TEST(loc9)) {
						RTHOOK(29);
						tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(17, "twin", loc4))(loc4)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
						ur1 = RTCCL(tr1);
						(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1735, "extend", loc9))(loc9, ur1x);
					}
					RTHOOK(30);
					(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(4740, "wipe_out", loc3))(loc3);
					RTHOOK(31);
					(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1739, "wipe_out", loc4))(loc4);
					RTHOOK(32);
					tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(17, "twin", loc2))(loc2)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
					ur1 = RTCCL(tr1);
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1735, "extend", loc4))(loc4, ur1x);
				}
			}
			RTHOOK(33);
			(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1702, "forth", loc8))(loc8);
		}
	}
	RTHOOK(34);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(3517, "close", loc1))(loc1);
	RTHOOK(35);
	ur1 = RTCCL(loc5);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5054, Dtype(Current)))(Current, ur1x);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(36);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(12);
	RTEE;
#undef up1
#undef ur1
#undef ui4_1
#undef uc1
#undef arg1
}

/* {ELEMENT_LIBRARY}.print_copys */
void F1033_7221 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "print_copys";
	RTEX;
	EIF_REFERENCE loc1 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc2 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc3 = (EIF_REFERENCE) 0;
#define arg1 arg1x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	RTCFDT;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(8);
	RTLR(0,arg1);
	RTLR(1,tr1);
	RTLR(2,ur1);
	RTLR(3,Current);
	RTLR(4,loc1);
	RTLR(5,loc2);
	RTLR(6,loc3);
	RTLR(7,tr2);
	RTLIU(8);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	RTLU(SK_REF, &loc1);
	RTLU(SK_REF, &loc2);
	RTLU(SK_REF, &loc3);
	
	RTEAA(l_feature_name, 1032, Current, 3, 1, 13517);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1032, Current, 13517);
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,851,0xFF01,851,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		RTCC(arg1, 1032, l_feature_name, 1, typres0, 0x01);
	}
	RTIV(Current, RTAL);
	RTHOOK(1);
	tr1 = RTMS_EX_H("constraints:\012",13,428237834);
	ur1 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(30, dtype))(Current, ur1x);
	RTHOOK(2);
	loc1 = RTCCL(arg1);
	if (EIF_TEST(loc1)) {
		RTHOOK(3);
		RTDBGAL(Current, 2, 0xF8000356, 0, 0); /* loc2 */
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2525, "new_cursor", loc1))(loc1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		loc2 = (EIF_REFERENCE) RTCCL(tr1);
		for (;;) {
			tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1701, "after", loc2))(loc2)).it_b);
			if (tb1) break;
			RTHOOK(4);
			tr1 = RTMS_EX_H("[ ",2,23328);
			ur1 = tr1;
			(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(30, dtype))(Current, ur1x);
			RTHOOK(5);
			RTDBGAL(Current, 3, 0xF8000356, 0, 0); /* loc3 */
			tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1700, "item", loc2))(loc2)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
			tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2525, "new_cursor", tr1))(tr1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
			loc3 = (EIF_REFERENCE) RTCCL(tr2);
			for (;;) {
				tb2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1701, "after", loc3))(loc3)).it_b);
				if (tb2) break;
				RTHOOK(6);
				tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1700, "item", loc3))(loc3)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
				RTNHOOK(6,1);
				tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(28, "out", tr1))(tr1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
				tr1 = RTMS_EX_H(" ",1,32);
				ur1 = tr1;
				tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(4660, "plus", tr2))(tr2, ur1x)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
				ur1 = RTCCL(tr1);
				(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(30, dtype))(Current, ur1x);
				RTHOOK(7);
				(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1702, "forth", loc3))(loc3);
			}
			RTHOOK(8);
			tr1 = RTMS_EX_H("]\012",2,23818);
			ur1 = tr1;
			(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(30, dtype))(Current, ur1x);
			RTHOOK(9);
			(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1702, "forth", loc2))(loc2);
		}
	}
	RTHOOK(10);
	tr1 = RTMS_EX_H("Ex2 completed\012",14,1983657994);
	ur1 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(30, dtype))(Current, ur1x);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(11);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(6);
	RTEE;
#undef up1
#undef ur1
#undef arg1
}

/* {ELEMENT_LIBRARY}.run_example */
void F1033_7222 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "run_example";
	RTEX;
	EIF_REFERENCE loc1 = (EIF_REFERENCE) 0;
#define arg1 arg1x.it_i4
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE up2x = {{0}, SK_POINTER};
#define up2 up2x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ur2x = {{0}, SK_REF};
#define ur2 ur2x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_TYPED_VALUE ui4_2x = {{0}, SK_INT32};
#define ui4_2 ui4_2x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE tr3 = NULL;
	RTCFDT;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_i4 = * (EIF_INTEGER_32 *) arg1x.it_r;
	
	RTLI(7);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,ur1);
	RTLR(3,loc1);
	RTLR(4,tr2);
	RTLR(5,tr3);
	RTLR(6,ur2);
	RTLIU(7);
	RTLU (SK_VOID, NULL);
	RTLU(SK_INT32,&arg1);
	RTLU (SK_REF, &Current);
	RTLU(SK_REF, &loc1);
	
	RTEAA(l_feature_name, 1032, Current, 1, 1, 13518);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1032, Current, 13518);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT(NULL, EX_PRE);
		RTTE((EIF_BOOLEAN) ((EIF_BOOLEAN) (arg1 >= ((EIF_INTEGER_32) 1L)) && (EIF_BOOLEAN) (arg1 <= ((EIF_INTEGER_32) 5L))), label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	if ((EIF_BOOLEAN)(arg1 == ((EIF_INTEGER_32) 1L))) {
		RTHOOK(3);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWF(5052, dtype))(Current);
	} else {
		RTHOOK(4);
		if ((EIF_BOOLEAN)(arg1 == ((EIF_INTEGER_32) 2L))) {
			RTHOOK(5);
			tr1 = RTMS_EX_H("Example_2.txt",13,1117230452);
			ur1 = tr1;
			(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5053, dtype))(Current, ur1x);
		} else {
			RTHOOK(6);
			if ((EIF_BOOLEAN)(arg1 == ((EIF_INTEGER_32) 3L))) {
				RTHOOK(7);
				ui4_1 = ((EIF_INTEGER_32) 4L);
				(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5050, dtype))(Current, ui4_1x);
				RTHOOK(8);
				ui4_1 = ((EIF_INTEGER_32) 10L);
				ui4_2 = ((EIF_INTEGER_32) 4L);
				(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWF(5051, dtype))(Current, ui4_1x, ui4_2x);
				RTHOOK(9);
				RTDBGAL(Current, 1, 0xF8000409, 0, 0); /* loc1 */
				{
					EIF_TYPE_INDEX typarr0[] = {0xFF01,1033,0,0,0xFFFF};
					EIF_TYPE typres0;
					{
						EIF_TYPE l_type;
						l_type = RTWCT(5065, dtype, dftype);
						typarr0[2] = l_type.annotations | 0xFF00;
						typarr0[3] = l_type.id;
					}
					
					typres0 = eif_compound_id(dftype, typarr0);
					tr1 = RTLN(typres0.id);
				}
				tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
				ur1 = RTCCL(tr2);
				tr3 = ((up2x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5057, dtype))(Current)), (((up2x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up2x.it_r = RTBU(up2x))), (up2x.type = SK_POINTER), up2x.it_r);
				ur2 = RTCCL(tr3);
				(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5009, Dtype(tr1)))(tr1, ur1x, ur2x);
				RTNHOOK(9,1);
				loc1 = (EIF_REFERENCE) RTCCL(tr1);
			} else {
				RTHOOK(10);
				if ((EIF_BOOLEAN)(arg1 == ((EIF_INTEGER_32) 4L))) {
					RTHOOK(11);
					ui4_1 = ((EIF_INTEGER_32) 200L);
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5050, dtype))(Current, ui4_1x);
					RTHOOK(12);
					ui4_1 = ((EIF_INTEGER_32) 1000L);
					ui4_2 = ((EIF_INTEGER_32) 200L);
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWF(5051, dtype))(Current, ui4_1x, ui4_2x);
					RTHOOK(13);
					RTDBGAL(Current, 1, 0xF8000409, 0, 0); /* loc1 */
					{
						EIF_TYPE_INDEX typarr0[] = {0xFF01,1033,0,0,0xFFFF};
						EIF_TYPE typres0;
						{
							EIF_TYPE l_type;
							l_type = RTWCT(5065, dtype, dftype);
							typarr0[2] = l_type.annotations | 0xFF00;
							typarr0[3] = l_type.id;
						}
						
						typres0 = eif_compound_id(dftype, typarr0);
						tr1 = RTLN(typres0.id);
					}
					tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
					ur1 = RTCCL(tr2);
					tr3 = ((up2x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5057, dtype))(Current)), (((up2x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up2x.it_r = RTBU(up2x))), (up2x.type = SK_POINTER), up2x.it_r);
					ur2 = RTCCL(tr3);
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5009, Dtype(tr1)))(tr1, ur1x, ur2x);
					RTNHOOK(13,1);
					loc1 = (EIF_REFERENCE) RTCCL(tr1);
				} else {
					RTHOOK(14);
					ui4_1 = ((EIF_INTEGER_32) 2000L);
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(5050, dtype))(Current, ui4_1x);
					RTHOOK(15);
					ui4_1 = ((EIF_INTEGER_32) 100000L);
					ui4_2 = ((EIF_INTEGER_32) 2000L);
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWF(5051, dtype))(Current, ui4_1x, ui4_2x);
					RTHOOK(16);
					RTDBGAL(Current, 1, 0xF8000409, 0, 0); /* loc1 */
					{
						EIF_TYPE_INDEX typarr0[] = {0xFF01,1033,0,0,0xFFFF};
						EIF_TYPE typres0;
						{
							EIF_TYPE l_type;
							l_type = RTWCT(5065, dtype, dftype);
							typarr0[2] = l_type.annotations | 0xFF00;
							typarr0[3] = l_type.id;
						}
						
						typres0 = eif_compound_id(dftype, typarr0);
						tr1 = RTLN(typres0.id);
					}
					tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
					ur1 = RTCCL(tr2);
					tr3 = ((up2x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5057, dtype))(Current)), (((up2x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up2x.it_r = RTBU(up2x))), (up2x.type = SK_POINTER), up2x.it_r);
					ur2 = RTCCL(tr3);
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(5009, Dtype(tr1)))(tr1, ur1x, ur2x);
					RTNHOOK(16,1);
					loc1 = (EIF_REFERENCE) RTCCL(tr1);
				}
			}
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(17);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(4);
	RTEE;
#undef up1
#undef up2
#undef ur1
#undef ur2
#undef ui4_1
#undef ui4_2
#undef arg1
}

/* {ELEMENT_LIBRARY}.all_elements */
EIF_TYPED_VALUE F1033_7223 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(5056,Dtype(Current)));
	return r;
}


/* {ELEMENT_LIBRARY}.all_constraints */
EIF_TYPED_VALUE F1033_7224 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(5057,Dtype(Current)));
	return r;
}


/* {ELEMENT_LIBRARY}.constraints_found */
EIF_TYPED_VALUE F1033_7225 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(5058,Dtype(Current)));
	return r;
}


/* {ELEMENT_LIBRARY}.amount_found */
EIF_TYPED_VALUE F1033_7226 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = *(EIF_INTEGER_32 *)(Current + RTWA(5059,Dtype(Current)));
	return r;
}


/* {ELEMENT_LIBRARY}.input_element */
EIF_TYPED_VALUE F1033_7227 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(5060,Dtype(Current)));
	return r;
}


/* {ELEMENT_LIBRARY}.input_constraint_first */
EIF_TYPED_VALUE F1033_7228 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(5061,Dtype(Current)));
	return r;
}


/* {ELEMENT_LIBRARY}.input_constraint_second */
EIF_TYPED_VALUE F1033_7229 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(5062,Dtype(Current)));
	return r;
}


/* {ELEMENT_LIBRARY}.element_in_list */
EIF_TYPED_VALUE F1033_7230 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "element_in_list";
	RTEX;
	EIF_BOOLEAN loc1 = (EIF_BOOLEAN) 0;
#define arg1 arg1x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE up2x = {{0}, SK_POINTER};
#define up2 up2x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(5);
	RTLR(0,arg1);
	RTLR(1,Current);
	RTLR(2,tr1);
	RTLR(3,tr2);
	RTLR(4,ur1);
	RTLIU(5);
	RTLU (SK_BOOL, &Result);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	RTLU(SK_BOOL, &loc1);
	
	RTEAA(l_feature_name, 1032, Current, 1, 1, 13503);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1032, Current, 13503);
	RTCC(arg1, 1032, l_feature_name, 1, eif_new_type(962, 0x01), 0x01);
	RTIV(Current, RTAL);
	RTHOOK(1);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(1,1);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1804, "start", tr1))(tr1);
	for (;;) {
		RTHOOK(2);
		tb1 = '\01';
		if (!(EIF_BOOLEAN)(loc1 == (EIF_BOOLEAN) 1)) {
			tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
			RTNHOOK(2,1);
			tb2 = *(EIF_BOOLEAN *)(tr1 + RTVA(2787, "after", tr1));
			tb1 = tb2;
		}
		if (tb1) break;
		RTHOOK(3);
		RTDBGAL(Current, 1, 0x04000000, 1, 0); /* loc1 */
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(3,1);
		tr2 = ((up2x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1771, "item", tr1))(tr1)), (((up2x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up2x.it_r = RTBU(up2x))), (up2x.type = SK_POINTER), up2x.it_r);
		RTNHOOK(3,2);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5016, "name", tr2))(tr2)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(3,3);
		tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5016, "name", arg1))(arg1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		ur1 = RTCCL(tr2);
		tb2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(11, "is_equal", tr1))(tr1, ur1x)).it_b);
		loc1 = (EIF_BOOLEAN) tb2;
		RTHOOK(4);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5056, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(4,1);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1820, "forth", tr1))(tr1);
	}
	RTHOOK(5);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	Result = (EIF_BOOLEAN) loc1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(6);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(4);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef up1
#undef up2
#undef ur1
#undef arg1
}

/* {ELEMENT_LIBRARY}.constraint_in_list */
EIF_TYPED_VALUE F1033_7231 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "constraint_in_list";
	RTEX;
	EIF_BOOLEAN loc1 = (EIF_BOOLEAN) 0;
#define arg1 arg1x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE up2x = {{0}, SK_POINTER};
#define up2 up2x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE tr3 = NULL;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	EIF_BOOLEAN tb3;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(6);
	RTLR(0,arg1);
	RTLR(1,Current);
	RTLR(2,tr1);
	RTLR(3,tr2);
	RTLR(4,tr3);
	RTLR(5,ur1);
	RTLIU(6);
	RTLU (SK_BOOL, &Result);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	RTLU(SK_BOOL, &loc1);
	
	RTEAA(l_feature_name, 1032, Current, 1, 1, 13504);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1032, Current, 13504);
	RTCC(arg1, 1032, l_feature_name, 1, eif_new_type(961, 0x01), 0x01);
	RTIV(Current, RTAL);
	RTHOOK(1);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5057, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(1,1);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1804, "start", tr1))(tr1);
	for (;;) {
		RTHOOK(2);
		tb1 = '\01';
		if (!(EIF_BOOLEAN)(loc1 == (EIF_BOOLEAN) 1)) {
			tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5057, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
			RTNHOOK(2,1);
			tb2 = *(EIF_BOOLEAN *)(tr1 + RTVA(2787, "after", tr1));
			tb1 = tb2;
		}
		if (tb1) break;
		RTHOOK(3);
		RTDBGAL(Current, 1, 0x04000000, 1, 0); /* loc1 */
		tb2 = '\0';
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5057, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(3,1);
		tr2 = ((up2x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1771, "item", tr1))(tr1)), (((up2x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up2x.it_r = RTBU(up2x))), (up2x.type = SK_POINTER), up2x.it_r);
		RTNHOOK(3,2);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5013, "el_1", tr2))(tr2)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(3,3);
		tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5016, "name", tr1))(tr1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(3,4);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5013, "el_1", arg1))(arg1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(3,5);
		tr3 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5016, "name", tr1))(tr1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		ur1 = RTCCL(tr3);
		tb3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(11, "is_equal", tr2))(tr2, ur1x)).it_b);
		if (tb3) {
			tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5057, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
			RTNHOOK(3,6);
			tr2 = ((up2x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1771, "item", tr1))(tr1)), (((up2x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up2x.it_r = RTBU(up2x))), (up2x.type = SK_POINTER), up2x.it_r);
			RTNHOOK(3,7);
			tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5014, "el_2", tr2))(tr2)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
			RTNHOOK(3,8);
			tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5016, "name", tr1))(tr1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
			RTNHOOK(3,9);
			tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5014, "el_2", arg1))(arg1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
			RTNHOOK(3,10);
			tr3 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5016, "name", tr1))(tr1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
			ur1 = RTCCL(tr3);
			tb3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(11, "is_equal", tr2))(tr2, ur1x)).it_b);
			tb2 = tb3;
		}
		loc1 = (EIF_BOOLEAN) tb2;
	}
	RTHOOK(4);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	Result = (EIF_BOOLEAN) loc1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(5);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(4);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef up1
#undef up2
#undef ur1
#undef arg1
}

void EIF_Minit1033 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
