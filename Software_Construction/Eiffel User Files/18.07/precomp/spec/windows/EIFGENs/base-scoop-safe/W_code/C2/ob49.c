/*
 * Code for class OBJECT_GRAPH_TRAVERSABLE
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern EIF_TYPED_VALUE F49_1161(EIF_REFERENCE);
extern EIF_TYPED_VALUE F49_1162(EIF_REFERENCE);
extern EIF_TYPED_VALUE F49_1163(EIF_REFERENCE);
extern EIF_TYPED_VALUE F49_1164(EIF_REFERENCE);
extern EIF_TYPED_VALUE F49_1165(EIF_REFERENCE);
extern EIF_TYPED_VALUE F49_1166(EIF_REFERENCE);
extern EIF_TYPED_VALUE F49_1167(EIF_REFERENCE);
extern EIF_TYPED_VALUE F49_1168(EIF_REFERENCE);
extern EIF_TYPED_VALUE F49_1169(EIF_REFERENCE);
extern EIF_TYPED_VALUE F49_1170(EIF_REFERENCE);
extern EIF_TYPED_VALUE F49_1171(EIF_REFERENCE);
extern EIF_TYPED_VALUE F49_1172(EIF_REFERENCE);
extern EIF_TYPED_VALUE F49_1173(EIF_REFERENCE);
extern EIF_TYPED_VALUE F49_1174(EIF_REFERENCE);
extern void F49_1175(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F49_1176(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F49_1177(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F49_1178(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F49_1179(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F49_1180(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F49_1181(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F49_1182(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F49_1183(EIF_REFERENCE);
extern void F49_1184(EIF_REFERENCE);
extern EIF_TYPED_VALUE F49_1186(EIF_REFERENCE);
extern void F49_1187(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F49_1188(EIF_REFERENCE);
extern void EIF_Minit49(void);

#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif

/* {OBJECT_GRAPH_TRAVERSABLE}.root_object */
EIF_TYPED_VALUE F49_1161 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(1088,Dtype(Current)));
	return r;
}


/* {OBJECT_GRAPH_TRAVERSABLE}.on_processing_object_action */
EIF_TYPED_VALUE F49_1162 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(1089,Dtype(Current)));
	return r;
}


/* {OBJECT_GRAPH_TRAVERSABLE}.on_processing_reference_action */
EIF_TYPED_VALUE F49_1163 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(1090,Dtype(Current)));
	return r;
}


/* {OBJECT_GRAPH_TRAVERSABLE}.object_action */
EIF_TYPED_VALUE F49_1164 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(1091,Dtype(Current)));
	return r;
}


/* {OBJECT_GRAPH_TRAVERSABLE}.visited_objects */
EIF_TYPED_VALUE F49_1165 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(1092,Dtype(Current)));
	return r;
}


/* {OBJECT_GRAPH_TRAVERSABLE}.visited_types */
EIF_TYPED_VALUE F49_1166 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(1093,Dtype(Current)));
	return r;
}


/* {OBJECT_GRAPH_TRAVERSABLE}.has_failed */
EIF_TYPED_VALUE F49_1167 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_BOOL;
	r.it_b = *(EIF_BOOLEAN *)(Current + RTWA(1094,Dtype(Current)));
	return r;
}


/* {OBJECT_GRAPH_TRAVERSABLE}.is_root_object_set */
EIF_TYPED_VALUE F49_1168 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "is_root_object_set";
	RTEX;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_REFERENCE tr1 = NULL;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(2);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLIU(2);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 48, Current, 0, 0, 1112);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(48, Current, 1112);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1088, Dtype(Current)))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tr1 != NULL);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef up1
}

/* {OBJECT_GRAPH_TRAVERSABLE}.is_object_action_set */
EIF_TYPED_VALUE F49_1169 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "is_object_action_set";
	RTEX;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_REFERENCE tr1 = NULL;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(2);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLIU(2);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 48, Current, 0, 0, 1113);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(48, Current, 1113);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1091, Dtype(Current)))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tr1 != NULL);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef up1
}

/* {OBJECT_GRAPH_TRAVERSABLE}.has_reference_with_copy_semantics */
EIF_TYPED_VALUE F49_1170 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_BOOL;
	r.it_b = *(EIF_BOOLEAN *)(Current + RTWA(1097,Dtype(Current)));
	return r;
}


/* {OBJECT_GRAPH_TRAVERSABLE}.is_skip_transient */
EIF_TYPED_VALUE F49_1171 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_BOOL;
	r.it_b = *(EIF_BOOLEAN *)(Current + RTWA(1098,Dtype(Current)));
	return r;
}


/* {OBJECT_GRAPH_TRAVERSABLE}.is_skip_copy_semantics_reference */
EIF_TYPED_VALUE F49_1172 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_BOOL;
	r.it_b = *(EIF_BOOLEAN *)(Current + RTWA(1099,Dtype(Current)));
	return r;
}


/* {OBJECT_GRAPH_TRAVERSABLE}.is_exception_on_copy_suppressed */
EIF_TYPED_VALUE F49_1173 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_BOOL;
	r.it_b = *(EIF_BOOLEAN *)(Current + RTWA(1100,Dtype(Current)));
	return r;
}


/* {OBJECT_GRAPH_TRAVERSABLE}.is_exception_propagated */
EIF_TYPED_VALUE F49_1174 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_BOOL;
	r.it_b = *(EIF_BOOLEAN *)(Current + RTWA(1101,Dtype(Current)));
	return r;
}


/* {OBJECT_GRAPH_TRAVERSABLE}.set_root_object */
void F49_1175 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "set_root_object";
	RTEX;
#define arg1 arg1x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_REFERENCE tr1 = NULL;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(3);
	RTLR(0,arg1);
	RTLR(1,Current);
	RTLR(2,tr1);
	RTLIU(3);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 48, Current, 0, 1, 1119);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(48, Current, 1119);
	RTCC(arg1, 48, l_feature_name, 1, RTWCT(1088, dtype, Dftype(Current)), 0x00);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("an_object_not_void", EX_PRE);
		RTTE((EIF_BOOLEAN)(arg1 != NULL), label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	RTDBGAA(Current, dtype, 1088, 0xF8000000, 0); /* root_object */
	tr1 = RTCCL(arg1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(1088, dtype)) = (EIF_REFERENCE) tr1;
	if (RTAL & CK_ENSURE) {
		RTHOOK(3);
		RTCT("root_object_set", EX_POST);
		tb1 = '\0';
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1088, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		if (RTCEQ(tr1, arg1)) {
			tb2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1095, dtype))(Current)).it_b);
			tb1 = tb2;
		}
		if (tb1) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(4);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef up1
#undef arg1
}

/* {OBJECT_GRAPH_TRAVERSABLE}.set_on_processing_object_action */
void F49_1176 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "set_on_processing_object_action";
	RTEX;
#define arg1 arg1x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_REFERENCE tr1 = NULL;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(3);
	RTLR(0,arg1);
	RTLR(1,Current);
	RTLR(2,tr1);
	RTLIU(3);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 48, Current, 0, 1, 1120);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(48, Current, 1120);
	RTCC(arg1, 48, l_feature_name, 1, RTWCT(1089, dtype, Dftype(Current)), 0x00);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("an_action_not_void", EX_PRE);
		RTTE((EIF_BOOLEAN)(arg1 != NULL), label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	RTDBGAA(Current, dtype, 1089, 0xF800010B, 0); /* on_processing_object_action */
	tr1 = RTCCL(arg1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(1089, dtype)) = (EIF_REFERENCE) tr1;
	if (RTAL & CK_ENSURE) {
		RTHOOK(3);
		RTCT("on_processing_object_action_set", EX_POST);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1089, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		if (RTCEQ(tr1, arg1)) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(4);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef up1
#undef arg1
}

/* {OBJECT_GRAPH_TRAVERSABLE}.set_on_processing_reference_action */
void F49_1177 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "set_on_processing_reference_action";
	RTEX;
#define arg1 arg1x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_REFERENCE tr1 = NULL;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(3);
	RTLR(0,arg1);
	RTLR(1,Current);
	RTLR(2,tr1);
	RTLIU(3);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 48, Current, 0, 1, 1121);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(48, Current, 1121);
	RTCC(arg1, 48, l_feature_name, 1, RTWCT(1090, dtype, Dftype(Current)), 0x00);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("an_action_not_void", EX_PRE);
		RTTE((EIF_BOOLEAN)(arg1 != NULL), label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	RTDBGAA(Current, dtype, 1090, 0xF800010B, 0); /* on_processing_reference_action */
	tr1 = RTCCL(arg1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(1090, dtype)) = (EIF_REFERENCE) tr1;
	if (RTAL & CK_ENSURE) {
		RTHOOK(3);
		RTCT("on_processing_reference_action_set", EX_POST);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1090, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		if (RTCEQ(tr1, arg1)) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(4);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef up1
#undef arg1
}

/* {OBJECT_GRAPH_TRAVERSABLE}.set_object_action */
void F49_1178 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "set_object_action";
	RTEX;
#define arg1 arg1x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_REFERENCE tr1 = NULL;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(3);
	RTLR(0,arg1);
	RTLR(1,Current);
	RTLR(2,tr1);
	RTLIU(3);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 48, Current, 0, 1, 1122);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(48, Current, 1122);
	RTCC(arg1, 48, l_feature_name, 1, RTWCT(1091, dtype, Dftype(Current)), 0x00);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("an_object_action_not_void", EX_PRE);
		RTTE((EIF_BOOLEAN)(arg1 != NULL), label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	RTDBGAA(Current, dtype, 1091, 0xF800010B, 0); /* object_action */
	tr1 = RTCCL(arg1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(1091, dtype)) = (EIF_REFERENCE) tr1;
	if (RTAL & CK_ENSURE) {
		RTHOOK(3);
		RTCT("an_object_action_set", EX_POST);
		tb1 = '\0';
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1091, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		if (RTCEQ(tr1, arg1)) {
			tb2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1096, dtype))(Current)).it_b);
			tb1 = tb2;
		}
		if (tb1) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(4);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef up1
#undef arg1
}

/* {OBJECT_GRAPH_TRAVERSABLE}.set_is_skip_transient */
void F49_1179 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "set_is_skip_transient";
	RTEX;
#define arg1 arg1x.it_b
	EIF_BOOLEAN tb1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_b = * (EIF_BOOLEAN *) arg1x.it_r;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU(SK_BOOL,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 48, Current, 0, 1, 1123);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(48, Current, 1123);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 1098, 0x04000000, 1); /* is_skip_transient */
	*(EIF_BOOLEAN *)(Current + RTWA(1098, dtype)) = (EIF_BOOLEAN) arg1;
	if (RTAL & CK_ENSURE) {
		RTHOOK(2);
		RTCT("is_skip_transient_set", EX_POST);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1098, dtype));
		if ((EIF_BOOLEAN)(tb1 == arg1)) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef arg1
}

/* {OBJECT_GRAPH_TRAVERSABLE}.set_is_skip_copy_semantics_reference */
void F49_1180 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "set_is_skip_copy_semantics_reference";
	RTEX;
#define arg1 arg1x.it_b
	EIF_BOOLEAN tb1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_b = * (EIF_BOOLEAN *) arg1x.it_r;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU(SK_BOOL,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 48, Current, 0, 1, 1124);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(48, Current, 1124);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 1099, 0x04000000, 1); /* is_skip_copy_semantics_reference */
	*(EIF_BOOLEAN *)(Current + RTWA(1099, dtype)) = (EIF_BOOLEAN) arg1;
	if (RTAL & CK_ENSURE) {
		RTHOOK(2);
		RTCT("is_skip_copy_semantics_reference_set", EX_POST);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1099, dtype));
		if ((EIF_BOOLEAN)(tb1 == arg1)) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef arg1
}

/* {OBJECT_GRAPH_TRAVERSABLE}.set_is_exception_on_copy_suppressed */
void F49_1181 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "set_is_exception_on_copy_suppressed";
	RTEX;
#define arg1 arg1x.it_b
	EIF_BOOLEAN tb1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_b = * (EIF_BOOLEAN *) arg1x.it_r;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU(SK_BOOL,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 48, Current, 0, 1, 1125);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(48, Current, 1125);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 1100, 0x04000000, 1); /* is_exception_on_copy_suppressed */
	*(EIF_BOOLEAN *)(Current + RTWA(1100, dtype)) = (EIF_BOOLEAN) arg1;
	if (RTAL & CK_ENSURE) {
		RTHOOK(2);
		RTCT("is_exception_on_copy_suppressed_set", EX_POST);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1100, dtype));
		if ((EIF_BOOLEAN)(tb1 == arg1)) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef arg1
}

/* {OBJECT_GRAPH_TRAVERSABLE}.set_is_exception_propagated */
void F49_1182 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "set_is_exception_propagated";
	RTEX;
#define arg1 arg1x.it_b
	EIF_BOOLEAN tb1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_b = * (EIF_BOOLEAN *) arg1x.it_r;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU(SK_BOOL,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 48, Current, 0, 1, 1126);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(48, Current, 1126);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 1101, 0x04000000, 1); /* is_exception_propagated */
	*(EIF_BOOLEAN *)(Current + RTWA(1101, dtype)) = (EIF_BOOLEAN) arg1;
	if (RTAL & CK_ENSURE) {
		RTHOOK(2);
		RTCT("is_exception_propagated_set", EX_POST);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1101, dtype));
		if ((EIF_BOOLEAN)(tb1 == arg1)) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef arg1
}

/* {OBJECT_GRAPH_TRAVERSABLE}.traverse */
#undef EIF_VOLATILE
#define EIF_VOLATILE volatile
void F49_1183 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "traverse";
	RTEX;
	RTED;
	EIF_REFERENCE EIF_VOLATILE loc1 = (EIF_REFERENCE) 0;
	EIF_BOOLEAN EIF_VOLATILE loc2 = (EIF_BOOLEAN) 0;
	EIF_BOOLEAN EIF_VOLATILE loc3 = (EIF_BOOLEAN) 0;
	EIF_REFERENCE EIF_VOLATILE loc4 = (EIF_REFERENCE) 0;
	EIF_REFERENCE EIF_VOLATILE saved_except = (EIF_REFERENCE) 0;
	RTS_SDX;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_REFERENCE  EIF_VOLATILE tr1 = NULL;
	EIF_BOOLEAN  EIF_VOLATILE tb1;
	RTCDT;
	RTSN;
	RTDA;
	RTDT;
	RTLD;
	RTXD;
	RTLXD;
	
	RTLI(6);
	RTLR(0,Current);
	RTLR(1,loc4);
	RTLR(2,tr1);
	RTLR(3,loc1);
	RTLR(4,ur1);
	RTLR(5,saved_except);
	RTLIU(6);
	RTXSLS;
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	RTLU(SK_REF, &loc1);
	RTLU(SK_BOOL, &loc2);
	RTLU(SK_BOOL, &loc3);
	RTLU(SK_REF, &loc4);
	RTLXL;
	
	RTEAA(l_feature_name, 48, Current, 4, 0, 1127);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(48, Current, 1127);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("root_object_available", EX_PRE);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1095, dtype))(Current)).it_b);
		RTTE(tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTE_T
	RTHOOK(2);
	tb1 = '\0';
	if ((EIF_BOOLEAN) !loc3) {
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1088, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		loc4 = RTCCL(tr1);
		tb1 = EIF_TEST(loc4);
	}
	if (tb1) {
		RTHOOK(3);
		RTDBGAL(Current, 1, 0xF8000025, 0, 0); /* loc1 */
		tr1 = RTLN(eif_new_type(37, 0x01).id);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
		RTNHOOK(3,1);
		loc1 = (EIF_REFERENCE) RTCCL(tr1);
		RTHOOK(4);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(969, "lock_marking", loc1))(loc1);
		RTHOOK(5);
		RTDBGAL(Current, 2, 0x04000000, 1, 0); /* loc2 */
		loc2 = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
		RTHOOK(6);
		ur1 = RTCCL(loc4);
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(1114, dtype))(Current, ur1x);
		RTHOOK(7);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(970, "unlock_marking", loc1))(loc1);
		RTHOOK(8);
		RTDBGAA(Current, dtype, 1094, 0x04000000, 1); /* has_failed */
		*(EIF_BOOLEAN *)(Current + RTWA(1094, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 0;
	}
	RTVI(Current, RTAL);
	RTRS;
	RTE_E
	RTLXE;
	RTXSC;
	RTS_SRR
	RTHOOK(9);
	RTDBGAL(Current, 3, 0x04000000, 1, 0); /* loc3 */
	loc3 = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	RTHOOK(10);
	RTDBGAA(Current, dtype, 1094, 0x04000000, 1); /* has_failed */
	*(EIF_BOOLEAN *)(Current + RTWA(1094, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	RTHOOK(11);
	if ((EIF_BOOLEAN) (loc2 && (EIF_BOOLEAN)(loc1 != NULL))) {
		RTHOOK(12);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(970, "unlock_marking", loc1))(loc1);
	}
	RTHOOK(13);
	tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1101, dtype));
	if ((EIF_BOOLEAN) !tb1) {
		RTHOOK(14);
		RTTS;
		RTPS;
		RTER;
	}
	RTMD(0);
	/* NOTREACHED */
	RTE_EE
	RTHOOK(15);
	RTDBGLE;
	RTMD(0);
	RTEOK;
	RTLE;
	RTLO(6);
#undef up1
#undef ur1
}
#undef EIF_VOLATILE
#define EIF_VOLATILE

/* {OBJECT_GRAPH_TRAVERSABLE}.wipe_out */
void F49_1184 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "wipe_out";
	RTEX;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_REFERENCE tr1 = NULL;
	EIF_BOOLEAN tb1;
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
	
	RTEAA(l_feature_name, 48, Current, 0, 0, 1128);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(48, Current, 1128);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 1092, 0xF80000FE, 0); /* visited_objects */
	*(EIF_REFERENCE *)(Current + RTWA(1092, dtype)) = (EIF_REFERENCE) NULL;
	RTHOOK(2);
	RTDBGAA(Current, dtype, 1093, 0xF800023E, 0); /* visited_types */
	*(EIF_REFERENCE *)(Current + RTWA(1093, dtype)) = (EIF_REFERENCE) NULL;
	RTHOOK(3);
	RTDBGAA(Current, dtype, 1091, 0xF800010B, 0); /* object_action */
	*(EIF_REFERENCE *)(Current + RTWA(1091, dtype)) = (EIF_REFERENCE) NULL;
	RTHOOK(4);
	RTDBGAA(Current, dtype, 1088, 0xF8000000, 0); /* root_object */
	*(EIF_REFERENCE *)(Current + RTWA(1088, dtype)) = (EIF_REFERENCE) NULL;
	if (RTAL & CK_ENSURE) {
		RTHOOK(5);
		RTCT("visited_objects_reset", EX_POST);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1092, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		if ((EIF_BOOLEAN)(tr1 == NULL)) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(6);
		RTCT("object_action_not_set", EX_POST);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1096, dtype))(Current)).it_b);
		if ((EIF_BOOLEAN) !tb1) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(7);
		RTCT("root_object_not_set", EX_POST);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1095, dtype))(Current)).it_b);
		if ((EIF_BOOLEAN) !tb1) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(8);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
#undef up1
}

/* {OBJECT_GRAPH_TRAVERSABLE}.default_size */
EIF_TYPED_VALUE F49_1186 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 200L);
	return r;
}

/* {OBJECT_GRAPH_TRAVERSABLE}.internal_traverse */
void F49_1187 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "internal_traverse";
	RTEX;
	EIF_INTEGER_32 loc1 = (EIF_INTEGER_32) 0;
	EIF_INTEGER_32 loc2 = (EIF_INTEGER_32) 0;
	EIF_REFERENCE loc3 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc4 = (EIF_REFERENCE) 0;
	EIF_INTEGER_32 loc5 = (EIF_INTEGER_32) 0;
	EIF_REFERENCE loc6 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc7 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc8 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc9 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc10 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc11 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc12 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc13 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc14 = (EIF_REFERENCE) 0;
	EIF_BOOLEAN loc15 = (EIF_BOOLEAN) 0;
	EIF_REFERENCE loc16 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc17 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc18 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc19 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc20 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc21 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc22 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc23 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc24 = (EIF_REFERENCE) 0;
#define arg1 arg1x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_TYPED_VALUE ui4_2x = {{0}, SK_INT32};
#define ui4_2 ui4_2x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_INTEGER_32 ti4_2;
	EIF_INTEGER_32 ti4_3;
	EIF_INTEGER_32 ti4_4;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	EIF_BOOLEAN tb3;
	RTCFDT;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(24);
	RTLR(0,loc6);
	RTLR(1,tr1);
	RTLR(2,loc13);
	RTLR(3,arg1);
	RTLR(4,ur1);
	RTLR(5,loc8);
	RTLR(6,Current);
	RTLR(7,loc9);
	RTLR(8,loc7);
	RTLR(9,loc10);
	RTLR(10,loc11);
	RTLR(11,loc16);
	RTLR(12,loc17);
	RTLR(13,loc3);
	RTLR(14,loc19);
	RTLR(15,loc20);
	RTLR(16,loc21);
	RTLR(17,loc14);
	RTLR(18,loc22);
	RTLR(19,loc18);
	RTLR(20,loc4);
	RTLR(21,loc23);
	RTLR(22,loc24);
	RTLR(23,loc12);
	RTLIU(24);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	RTLU(SK_INT32, &loc1);
	RTLU(SK_INT32, &loc2);
	RTLU(SK_REF, &loc3);
	RTLU(SK_REF, &loc4);
	RTLU(SK_INT32, &loc5);
	RTLU(SK_REF, &loc6);
	RTLU(SK_REF, &loc7);
	RTLU(SK_REF, &loc8);
	RTLU(SK_REF, &loc9);
	RTLU(SK_REF, &loc10);
	RTLU(SK_REF, &loc11);
	RTLU(SK_REF, &loc12);
	RTLU(SK_REF, &loc13);
	RTLU(SK_REF, &loc14);
	RTLU(SK_BOOL, &loc15);
	RTLU(SK_REF, &loc16);
	RTLU(SK_REF, &loc17);
	RTLU(SK_REF, &loc18);
	RTLU(SK_REF, &loc19);
	RTLU(SK_REF, &loc20);
	RTLU(SK_REF, &loc21);
	RTLU(SK_REF, &loc22);
	RTLU(SK_REF, &loc23);
	RTLU(SK_REF, &loc24);
	
	RTEAA(l_feature_name, 48, Current, 24, 1, 1130);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(48, Current, 1130);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 6, 0xF8000025, 0, 0); /* loc6 */
	tr1 = RTLN(eif_new_type(37, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
	RTNHOOK(1,1);
	loc6 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	RTDBGAL(Current, 13, 0xF800008C, 0, 0); /* loc13 */
	tr1 = RTLN(eif_new_type(140, 0x01).id);
	ur1 = RTCCL(arg1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(2388, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(2,1);
	loc13 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(3);
	ur1 = RTCCL(arg1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(967, "mark", loc6))(loc6, ur1x);
	RTHOOK(4);
	RTDBGAL(Current, 8, 0xF80000FE, 0, 0); /* loc8 */
	tr1 = RTLNSMART(RTWCT(1092, dtype, dftype).id);
	ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1113, dtype))(Current)).it_i4);
	ui4_1 = ti4_1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3146, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(4,1);
	loc8 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(5);
	RTDBGAL(Current, 9, 0xF800023E, 0, 0); /* loc9 */
	tr1 = RTLNSMART(RTWCT(1093, dtype, dftype).id);
	ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1113, dtype))(Current)).it_i4);
	ui4_1 = ti4_1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3037, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(5,1);
	loc9 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(6);
	RTDBGAL(Current, 7, 0xF8000231, 0, 0); /* loc7 */
	loc7 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1112, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTHOOK(7);
	ur1 = RTCCL(arg1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1734, "put", loc7))(loc7, ur1x);
	RTHOOK(8);
	RTDBGAL(Current, 10, 0xF800010B, 0, 0); /* loc10 */
	loc10 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1091, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTHOOK(9);
	RTDBGAL(Current, 11, 0xF800010B, 0, 0); /* loc11 */
	loc11 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1089, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTHOOK(10);
	RTDBGAL(Current, 16, 0xF800010B, 0, 0); /* loc16 */
	loc16 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1090, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTHOOK(11);
	RTDBGAL(Current, 17, 0xF800008C, 0, 0); /* loc17 */
	tr1 = RTLN(eif_new_type(140, 0x01).id);
	ur1 = RTCCL(arg1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(2388, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(11,1);
	loc17 = (EIF_REFERENCE) RTCCL(tr1);
	for (;;) {
		RTHOOK(12);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1723, "is_empty", loc7))(loc7)).it_b);
		if (tb1) break;
		RTHOOK(13);
		RTDBGAL(Current, 3, 0xF8000000, 0, 0); /* loc3 */
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1771, "item", loc7))(loc7)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		loc3 = (EIF_REFERENCE) RTCCL(tr1);
		RTHOOK(14);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1776, "remove", loc7))(loc7);
		RTHOOK(15);
		loc19 = RTCCL(loc3);
		loc19 = RTRV(eif_new_type(136, 0x01),loc19);
		if ((loc19) && RTS_OS (Current, loc19)) loc19 = (EIF_REFERENCE) 0;
		if (EIF_TEST(loc19)) {
			if (RTAL & CK_CHECK) {
				RTHOOK(16);
				RTCT("embedded_or_copy_semantics", EX_CHECK);
				tb2 = '\01';
				loc20 = RTCCL(loc19);
				loc20 = RTRV(eif_new_type(139, 0x01),loc20);
				if (!(EIF_TEST(loc20))) {
					tb3 = '\0';
					loc21 = RTCCL(loc19);
					loc21 = RTRV(eif_new_type(140, 0x01),loc21);
					if (EIF_TEST(loc21)) {
						ti4_1 = *(EIF_INTEGER_32 *)(loc21 + RTVA(2392, "physical_offset", loc21));
						tb3 = (EIF_BOOLEAN)(ti4_1 != ((EIF_INTEGER_32) 0L));
					}
					tb2 = tb3;
				}
				if (tb2) {
					RTCK;
				} else {
					RTCF;
				}
			}
			RTHOOK(17);
			RTDBGAL(Current, 15, 0x04000000, 1, 0); /* loc15 */
			loc15 = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
			RTHOOK(18);
			RTDBGAL(Current, 14, 0xF8000088, 0, 0); /* loc14 */
			loc14 = (EIF_REFERENCE) RTCCL(loc19);
			RTHOOK(19);
			tb2 = *(EIF_BOOLEAN *)(Current + RTWA(1099, dtype));
			if ((EIF_BOOLEAN) !tb2) {
				RTHOOK(20);
				tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2222, "object", loc19))(loc19)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
				ur1 = RTCCL(tr1);
				(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1735, "extend", loc8))(loc8, ur1x);
			}
		} else {
			RTHOOK(21);
			ur1 = RTCCL(loc3);
			(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2393, "set_object", loc13))(loc13, ur1x);
			RTHOOK(22);
			RTDBGAL(Current, 14, 0xF8000088, 0, 0); /* loc14 */
			loc14 = (EIF_REFERENCE) RTCCL(loc13);
			RTHOOK(23);
			tb2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2234, "is_expanded", loc13))(loc13)).it_b);
			if (tb2) {
				RTHOOK(24);
				RTDBGAL(Current, 15, 0x04000000, 1, 0); /* loc15 */
				loc15 = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
				RTHOOK(25);
				tb2 = *(EIF_BOOLEAN *)(Current + RTWA(1099, dtype));
				if ((EIF_BOOLEAN) !tb2) {
					RTHOOK(26);
					ur1 = RTCCL(loc3);
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1735, "extend", loc8))(loc8, ur1x);
				}
			} else {
				RTHOOK(27);
				ur1 = RTCCL(loc3);
				(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1735, "extend", loc8))(loc8, ur1x);
			}
		}
		RTHOOK(28);
		ti4_1 = *(EIF_INTEGER_32 *)(loc14 + RTVA(2225, "dynamic_type", loc14));
		ui4_1 = ti4_1;
		ti4_2 = *(EIF_INTEGER_32 *)(loc14 + RTVA(2225, "dynamic_type", loc14));
		ui4_2 = ti4_2;
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(1768, "put", loc9))(loc9, ui4_1x, ui4_2x);
		RTHOOK(29);
		if ((EIF_BOOLEAN) ((EIF_BOOLEAN)(loc10 != NULL) || (EIF_BOOLEAN)(loc11 != NULL))) {
			RTHOOK(30);
			tb2 = '\0';
			tb3 = *(EIF_BOOLEAN *)(Current + RTWA(1100, dtype));
			if ((EIF_BOOLEAN) !tb3) {
				tb3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2234, "is_expanded", loc14))(loc14)).it_b);
				tb2 = tb3;
			}
			if (tb2) {
				RTHOOK(31);
				(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWF(1115, dtype))(Current);
			} else {
				RTHOOK(32);
				if ((EIF_BOOLEAN)(loc10 != NULL)) {
					RTHOOK(33);
					{
						static EIF_TYPE_INDEX typarr0[] = {0xFF01,0xFFF9,1,185,0xFF05,0,0xFFFF};
						EIF_TYPE typres0;
						static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
						
						typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
						tr1 = RTLNTS(typres0.id, 2, 0);
					}
					((EIF_TYPED_VALUE *)tr1+1)->it_r = loc3;
					RTAR(tr1,loc3);
					ur1 = RTCCL(tr1);
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(4550, "call", loc10))(loc10, ur1x);
				}
				RTHOOK(34);
				if ((EIF_BOOLEAN)(loc11 != NULL)) {
					RTHOOK(35);
					{
						static EIF_TYPE_INDEX typarr0[] = {0xFF01,0xFFF9,1,185,0xFF01,136,0xFFFF};
						EIF_TYPE typres0;
						static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
						
						typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
						tr1 = RTLNTS(typres0.id, 2, 0);
					}
					((EIF_TYPED_VALUE *)tr1+1)->it_r = loc14;
					RTAR(tr1,loc14);
					ur1 = RTCCL(tr1);
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(4550, "call", loc11))(loc11, ur1x);
				}
			}
		}
		RTHOOK(36);
		tb2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2231, "is_special", loc14))(loc14)).it_b);
		if (tb2) {
			RTHOOK(37);
			tb2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2233, "is_special_of_reference", loc14))(loc14)).it_b);
			if (tb2) {
				RTHOOK(38);
				loc22 = RTCCL(loc3);
				{
					static EIF_TYPE_INDEX typarr0[] = {0xFF01,277,0,0xFFFF};
					EIF_TYPE typres0;
					static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
					
					typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
					loc22 = RTRV(typres0,loc22);
				}
				if ((loc22) && RTS_OS (Current, loc22)) loc22 = (EIF_REFERENCE) 0;
				if (EIF_TEST(loc22)) {
					RTHOOK(39);
					RTDBGAL(Current, 1, 0x10000000, 1, 0); /* loc1 */
					loc1 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 0L);
					RTHOOK(40);
					RTDBGAL(Current, 2, 0x10000000, 1, 0); /* loc2 */
					ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2450, "count", loc22))(loc22)).it_i4);
					loc2 = (EIF_INTEGER_32) ti4_1;
					for (;;) {
						RTHOOK(41);
						if ((EIF_BOOLEAN)(loc1 == loc2)) break;
						RTHOOK(42);
						ui4_1 = loc1;
						tb2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2239, "is_special_copy_semantics_item", loc14))(loc14, ui4_1x)).it_b);
						if (tb2) {
							RTHOOK(43);
							RTDBGAL(Current, 18, 0xF8000088, 0, 0); /* loc18 */
							ui4_1 = loc1;
							tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2247, "special_copy_semantics_item", loc14))(loc14, ui4_1x)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
							loc18 = (EIF_REFERENCE) RTCCL(tr1);
							RTHOOK(44);
							RTDBGAL(Current, 4, 0xF8000000, 0, 0); /* loc4 */
							loc4 = (EIF_REFERENCE) RTCCL(loc18);
							RTHOOK(45);
							ur1 = RTCCL(loc4);
							(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1734, "put", loc7))(loc7, ur1x);
							RTHOOK(46);
							if ((EIF_BOOLEAN)(loc16 != NULL)) {
								RTHOOK(47);
								{
									static EIF_TYPE_INDEX typarr0[] = {0xFF01,0xFFF9,2,185,0xFF01,136,0xFF01,136,0xFFFF};
									EIF_TYPE typres0;
									static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
									
									typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
									tr1 = RTLNTS(typres0.id, 3, 0);
								}
								((EIF_TYPED_VALUE *)tr1+1)->it_r = loc14;
								RTAR(tr1,loc14);
								((EIF_TYPED_VALUE *)tr1+2)->it_r = loc18;
								RTAR(tr1,loc18);
								ur1 = RTCCL(tr1);
								(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(4550, "call", loc16))(loc16, ur1x);
							}
						} else {
							RTHOOK(48);
							RTDBGAL(Current, 4, 0xF8000000, 0, 0); /* loc4 */
							ui4_1 = loc1;
							tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2621, "item", loc22))(loc22, ui4_1x)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
							loc4 = (EIF_REFERENCE) RTCCL(tr1);
							RTHOOK(49);
							tb2 = '\0';
							if ((EIF_BOOLEAN)(loc4 != NULL)) {
								ur1 = RTCCL(loc4);
								tb3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(966, "is_marked", loc6))(loc6, ur1x)).it_b);
								tb2 = (EIF_BOOLEAN) !tb3;
							}
							if (tb2) {
								RTHOOK(50);
								ur1 = RTCCL(loc4);
								(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(967, "mark", loc6))(loc6, ur1x);
								RTHOOK(51);
								ur1 = RTCCL(loc4);
								(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1734, "put", loc7))(loc7, ur1x);
							}
							RTHOOK(52);
							if ((EIF_BOOLEAN) ((EIF_BOOLEAN)(loc16 != NULL) && (EIF_BOOLEAN)(loc4 != NULL))) {
								RTHOOK(53);
								ur1 = RTCCL(loc4);
								(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2393, "set_object", loc17))(loc17, ur1x);
								RTHOOK(54);
								RTDBGAL(Current, 18, 0xF8000088, 0, 0); /* loc18 */
								loc18 = (EIF_REFERENCE) RTCCL(loc17);
								RTHOOK(55);
								{
									static EIF_TYPE_INDEX typarr0[] = {0xFF01,0xFFF9,2,185,0xFF01,136,0xFF01,136,0xFFFF};
									EIF_TYPE typres0;
									static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
									
									typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
									tr1 = RTLNTS(typres0.id, 3, 0);
								}
								((EIF_TYPED_VALUE *)tr1+1)->it_r = loc14;
								RTAR(tr1,loc14);
								((EIF_TYPED_VALUE *)tr1+2)->it_r = loc18;
								RTAR(tr1,loc18);
								ur1 = RTCCL(tr1);
								(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(4550, "call", loc16))(loc16, ur1x);
							}
						}
						RTHOOK(56);
						RTDBGAL(Current, 1, 0x10000000, 1, 0); /* loc1 */
						loc1++;
					}
				}
			} else {
				RTHOOK(57);
				tb2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2232, "is_special_of_expanded", loc14))(loc14)).it_b);
				if (tb2) {
					RTHOOK(58);
					loc23 = RTCCL(loc3);
					{
						static EIF_TYPE_INDEX typarr0[] = {0xFF01,277,0xFF01,0,0xFFFF};
						EIF_TYPE typres0;
						static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
						
						typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
						loc23 = RTRV(typres0,loc23);
					}
					if ((loc23) && RTS_OS (Current, loc23)) loc23 = (EIF_REFERENCE) 0;
					if (EIF_TEST(loc23)) {
						RTHOOK(59);
						RTDBGAL(Current, 1, 0x10000000, 1, 0); /* loc1 */
						loc1 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 0L);
						RTHOOK(60);
						RTDBGAL(Current, 2, 0x10000000, 1, 0); /* loc2 */
						ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2450, "count", loc23))(loc23)).it_i4);
						loc2 = (EIF_INTEGER_32) ti4_1;
						for (;;) {
							RTHOOK(61);
							if ((EIF_BOOLEAN)(loc1 == loc2)) break;
							RTHOOK(62);
							RTDBGAL(Current, 4, 0xF8000000, 0, 0); /* loc4 */
							ui4_1 = loc1;
							tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2621, "item", loc23))(loc23, ui4_1x)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
							loc4 = (EIF_REFERENCE) RTCCL(tr1);
							RTHOOK(63);
							ur1 = RTCCL(loc4);
							(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1734, "put", loc7))(loc7, ur1x);
							RTHOOK(64);
							if ((EIF_BOOLEAN)(loc16 != NULL)) {
								RTHOOK(65);
								tb2 = *(EIF_BOOLEAN *)(Current + RTWA(1100, dtype));
								if (tb2) {
									RTHOOK(66);
									ur1 = RTCCL(loc4);
									(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2393, "set_object", loc17))(loc17, ur1x);
									RTHOOK(67);
									RTDBGAL(Current, 18, 0xF8000088, 0, 0); /* loc18 */
									loc18 = (EIF_REFERENCE) RTCCL(loc17);
									RTHOOK(68);
									{
										static EIF_TYPE_INDEX typarr0[] = {0xFF01,0xFFF9,2,185,0xFF01,136,0xFF01,136,0xFFFF};
										EIF_TYPE typres0;
										static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
										
										typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
										tr1 = RTLNTS(typres0.id, 3, 0);
									}
									((EIF_TYPED_VALUE *)tr1+1)->it_r = loc14;
									RTAR(tr1,loc14);
									((EIF_TYPED_VALUE *)tr1+2)->it_r = loc18;
									RTAR(tr1,loc18);
									ur1 = RTCCL(tr1);
									(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(4550, "call", loc16))(loc16, ur1x);
								} else {
									RTHOOK(69);
									(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWF(1115, dtype))(Current);
								}
							}
							RTHOOK(70);
							RTDBGAL(Current, 1, 0x10000000, 1, 0); /* loc1 */
							loc1++;
						}
					}
				}
			}
		} else {
			RTHOOK(71);
			tb2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2235, "is_tuple", loc14))(loc14)).it_b);
			if (tb2) {
				RTHOOK(72);
				loc24 = RTCCL(loc3);
				{
					static EIF_TYPE_INDEX typarr0[] = {0xFF01,0xFFF9,0,185,0xFFFF};
					EIF_TYPE typres0;
					static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
					
					typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
					loc24 = RTRV(typres0,loc24);
				}
				if ((loc24) && RTS_OS (Current, loc24)) loc24 = (EIF_REFERENCE) 0;
				if (EIF_TEST(loc24)) {
					RTHOOK(73);
					RTDBGAL(Current, 1, 0x10000000, 1, 0); /* loc1 */
					loc1 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 1L);
					RTHOOK(74);
					RTDBGAL(Current, 2, 0x10000000, 1, 0); /* loc2 */
					ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2623, "count", loc24))(loc24)).it_i4);
					loc2 = (EIF_INTEGER_32) (EIF_INTEGER_32) (ti4_1 + ((EIF_INTEGER_32) 1L));
					for (;;) {
						RTHOOK(75);
						if ((EIF_BOOLEAN)(loc1 == loc2)) break;
						RTHOOK(76);
						ui4_1 = loc1;
						tb2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(3917, "is_reference_item", loc24))(loc24, ui4_1x)).it_b);
						if (tb2) {
							RTHOOK(77);
							RTDBGAL(Current, 4, 0xF8000000, 0, 0); /* loc4 */
							ui4_1 = loc1;
							tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(3853, "reference_item", loc24))(loc24, ui4_1x)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
							loc4 = (EIF_REFERENCE) RTCCL(tr1);
							RTHOOK(78);
							tb2 = '\0';
							if ((EIF_BOOLEAN)(loc4 != NULL)) {
								ur1 = RTCCL(loc4);
								tb3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(966, "is_marked", loc6))(loc6, ur1x)).it_b);
								tb2 = (EIF_BOOLEAN) !tb3;
							}
							if (tb2) {
								RTHOOK(79);
								ur1 = RTCCL(loc4);
								(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(967, "mark", loc6))(loc6, ur1x);
								RTHOOK(80);
								ur1 = RTCCL(loc4);
								(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1734, "put", loc7))(loc7, ur1x);
							}
							RTHOOK(81);
							if ((EIF_BOOLEAN) ((EIF_BOOLEAN)(loc16 != NULL) && (EIF_BOOLEAN)(loc4 != NULL))) {
								RTHOOK(82);
								tb2 = *(EIF_BOOLEAN *)(Current + RTWA(1100, dtype));
								if (tb2) {
									RTHOOK(83);
									ur1 = RTCCL(loc4);
									(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2393, "set_object", loc17))(loc17, ur1x);
									RTHOOK(84);
									RTDBGAL(Current, 18, 0xF8000088, 0, 0); /* loc18 */
									loc18 = (EIF_REFERENCE) RTCCL(loc17);
									RTHOOK(85);
									{
										static EIF_TYPE_INDEX typarr0[] = {0xFF01,0xFFF9,2,185,0xFF01,136,0xFF01,136,0xFFFF};
										EIF_TYPE typres0;
										static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
										
										typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
										tr1 = RTLNTS(typres0.id, 3, 0);
									}
									((EIF_TYPED_VALUE *)tr1+1)->it_r = loc14;
									RTAR(tr1,loc14);
									((EIF_TYPED_VALUE *)tr1+2)->it_r = loc18;
									RTAR(tr1,loc18);
									ur1 = RTCCL(tr1);
									(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(4550, "call", loc16))(loc16, ur1x);
								} else {
									RTHOOK(86);
									(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWF(1115, dtype))(Current);
								}
							}
						}
						RTHOOK(87);
						RTDBGAL(Current, 1, 0x10000000, 1, 0); /* loc1 */
						loc1++;
					}
				}
			} else {
				RTHOOK(88);
				RTDBGAL(Current, 1, 0x10000000, 1, 0); /* loc1 */
				loc1 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 1L);
				RTHOOK(89);
				RTDBGAL(Current, 2, 0x10000000, 1, 0); /* loc2 */
				ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2282, "field_count", loc14))(loc14)).it_i4);
				loc2 = (EIF_INTEGER_32) (EIF_INTEGER_32) (ti4_1 + ((EIF_INTEGER_32) 1L));
				if (RTAL & CK_LOOP) {
					RTHOOK(90);
					RTCT(NULL, EX_VAR);
					ti4_2 = (EIF_INTEGER_32) (loc2 - loc1);
					if (ti4_2 >= 0) {
						RTCK;
					} else {
						RTCF;
					}
				}
				for (;;) {
					RTHOOK(91);
					if ((EIF_BOOLEAN)(loc1 == loc2)) break;
					RTHOOK(92);
					RTDBGAL(Current, 5, 0x10000000, 1, 0); /* loc5 */
					ui4_1 = loc1;
					ti4_3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2244, "field_type", loc14))(loc14, ui4_1x)).it_i4);
					loc5 = (EIF_INTEGER_32) ti4_3;
					RTHOOK(93);
					ti4_3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(2105, 132))(Current)).it_i4);
					ti4_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(2115, 132))(Current)).it_i4);
					if ((EIF_BOOLEAN) ((EIF_BOOLEAN)(loc5 == ti4_3) || (EIF_BOOLEAN)(loc5 == ti4_4))) {
						RTHOOK(94);
						tb2 = '\01';
						tb3 = *(EIF_BOOLEAN *)(Current + RTWA(1098, dtype));
						if (!(EIF_BOOLEAN) !tb3) {
							ui4_1 = loc1;
							tb3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2236, "is_field_transient", loc14))(loc14, ui4_1x)).it_b);
							tb2 = (EIF_BOOLEAN) !tb3;
						}
						if (tb2) {
							RTHOOK(95);
							ti4_3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(2115, 132))(Current)).it_i4);
							if ((EIF_BOOLEAN)(loc5 == ti4_3)) {
								RTHOOK(96);
								RTDBGAL(Current, 18, 0xF8000088, 0, 0); /* loc18 */
								ui4_1 = loc1;
								tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2248, "expanded_field", loc14))(loc14, ui4_1x)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
								loc18 = (EIF_REFERENCE) RTCCL(tr1);
								RTHOOK(97);
								ur1 = RTCCL(loc18);
								(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1734, "put", loc7))(loc7, ur1x);
								RTHOOK(98);
								if ((EIF_BOOLEAN)(loc16 != NULL)) {
									RTHOOK(99);
									{
										static EIF_TYPE_INDEX typarr0[] = {0xFF01,0xFFF9,2,185,0xFF01,136,0xFF01,136,0xFFFF};
										EIF_TYPE typres0;
										static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
										
										typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
										tr1 = RTLNTS(typres0.id, 3, 0);
									}
									((EIF_TYPED_VALUE *)tr1+1)->it_r = loc14;
									RTAR(tr1,loc14);
									((EIF_TYPED_VALUE *)tr1+2)->it_r = loc18;
									RTAR(tr1,loc18);
									ur1 = RTCCL(tr1);
									(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(4550, "call", loc16))(loc16, ur1x);
								}
							} else {
								RTHOOK(100);
								ui4_1 = loc1;
								tb2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2238, "is_copy_semantics_field", loc14))(loc14, ui4_1x)).it_b);
								if (tb2) {
									RTHOOK(101);
									RTDBGAL(Current, 18, 0xF8000088, 0, 0); /* loc18 */
									ui4_1 = loc1;
									tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2246, "copy_semantics_field", loc14))(loc14, ui4_1x)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
									loc18 = (EIF_REFERENCE) RTCCL(tr1);
									RTHOOK(102);
									ur1 = RTCCL(loc18);
									(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1734, "put", loc7))(loc7, ur1x);
									RTHOOK(103);
									if ((EIF_BOOLEAN)(loc16 != NULL)) {
										RTHOOK(104);
										{
											static EIF_TYPE_INDEX typarr0[] = {0xFF01,0xFFF9,2,185,0xFF01,136,0xFF01,136,0xFFFF};
											EIF_TYPE typres0;
											static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
											
											typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
											tr1 = RTLNTS(typres0.id, 3, 0);
										}
										((EIF_TYPED_VALUE *)tr1+1)->it_r = loc14;
										RTAR(tr1,loc14);
										((EIF_TYPED_VALUE *)tr1+2)->it_r = loc18;
										RTAR(tr1,loc18);
										ur1 = RTCCL(tr1);
										(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(4550, "call", loc16))(loc16, ur1x);
									}
								} else {
									RTHOOK(105);
									RTDBGAL(Current, 4, 0xF8000000, 0, 0); /* loc4 */
									ui4_1 = loc1;
									tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2229, "reference_field", loc14))(loc14, ui4_1x)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
									loc4 = (EIF_REFERENCE) RTCCL(tr1);
									RTHOOK(106);
									if ((EIF_BOOLEAN)(loc4 != NULL)) {
										RTHOOK(107);
										ur1 = RTCCL(loc4);
										tb2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(966, "is_marked", loc6))(loc6, ur1x)).it_b);
										if ((EIF_BOOLEAN) !tb2) {
											RTHOOK(108);
											ur1 = RTCCL(loc4);
											(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(967, "mark", loc6))(loc6, ur1x);
											RTHOOK(109);
											ur1 = RTCCL(loc4);
											(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1734, "put", loc7))(loc7, ur1x);
										}
										RTHOOK(110);
										if ((EIF_BOOLEAN)(loc16 != NULL)) {
											RTHOOK(111);
											ur1 = RTCCL(loc4);
											(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2393, "set_object", loc17))(loc17, ur1x);
											RTHOOK(112);
											RTDBGAL(Current, 18, 0xF8000088, 0, 0); /* loc18 */
											loc18 = (EIF_REFERENCE) RTCCL(loc17);
											RTHOOK(113);
											{
												static EIF_TYPE_INDEX typarr0[] = {0xFF01,0xFFF9,2,185,0xFF01,136,0xFF01,136,0xFFFF};
												EIF_TYPE typres0;
												static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
												
												typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
												tr1 = RTLNTS(typres0.id, 3, 0);
											}
											((EIF_TYPED_VALUE *)tr1+1)->it_r = loc14;
											RTAR(tr1,loc14);
											((EIF_TYPED_VALUE *)tr1+2)->it_r = loc18;
											RTAR(tr1,loc18);
											ur1 = RTCCL(tr1);
											(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(4550, "call", loc16))(loc16, ur1x);
										}
									}
								}
							}
						}
					}
					RTHOOK(114);
					RTDBGAL(Current, 1, 0x10000000, 1, 0); /* loc1 */
					loc1++;
					if (RTAL & CK_LOOP) {
						RTHOOK(90);
						RTCT(NULL, EX_VAR);
						ti4_1 = (EIF_INTEGER_32) (loc2 - loc1);
						if ((ti4_2 > ti4_1) && ti4_1 >= 0) {
							RTCK;
							ti4_2 = ti4_1;
						} else {
							RTCF;
						}
					}
				}
			}
		}
	}
	RTHOOK(115);
	RTDBGAL(Current, 1, 0x10000000, 1, 0); /* loc1 */
	loc1 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 0L);
	RTHOOK(116);
	RTDBGAL(Current, 2, 0x10000000, 1, 0); /* loc2 */
	ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1782, "count", loc8))(loc8)).it_i4);
	loc2 = (EIF_INTEGER_32) ti4_1;
	RTHOOK(117);
	RTDBGAL(Current, 12, 0xF8000115, 0, 0); /* loc12 */
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(3149, "area", loc8))(loc8)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	loc12 = (EIF_REFERENCE) tr1;
	for (;;) {
		RTHOOK(118);
		if ((EIF_BOOLEAN)(loc1 == loc2)) break;
		RTHOOK(119);
		ui4_1 = loc1;
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2621, "item", loc12))(loc12, ui4_1x)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		ur1 = RTCCL(tr1);
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(968, "unmark", loc6))(loc6, ur1x);
		RTHOOK(120);
		RTDBGAL(Current, 1, 0x10000000, 1, 0); /* loc1 */
		loc1++;
	}
	RTHOOK(121);
	RTDBGAA(Current, dtype, 1092, 0xF80000FE, 0); /* visited_objects */
	tr1 = RTCCL(loc8);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(1092, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(122);
	RTDBGAA(Current, dtype, 1093, 0xF800023E, 0); /* visited_types */
	tr1 = RTCCL(loc9);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(1093, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(123);
	RTDBGAA(Current, dtype, 1097, 0x04000000, 1); /* has_reference_with_copy_semantics */
	*(EIF_BOOLEAN *)(Current + RTWA(1097, dtype)) = (EIF_BOOLEAN) loc15;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(124);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(27);
	RTEE;
#undef up1
#undef ur1
#undef ui4_1
#undef ui4_2
#undef arg1
}

/* {OBJECT_GRAPH_TRAVERSABLE}.raise_unwanted_copy_exception */
void F49_1188 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "raise_unwanted_copy_exception";
	RTEX;
	EIF_REFERENCE loc1 = (EIF_REFERENCE) 0;
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_REFERENCE tr1 = NULL;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(4);
	RTLR(0,loc1);
	RTLR(1,tr1);
	RTLR(2,ur1);
	RTLR(3,Current);
	RTLIU(4);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	RTLU(SK_REF, &loc1);
	
	RTEAA(l_feature_name, 48, Current, 1, 0, 1131);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(48, Current, 1131);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 1, 0xF8000041, 0, 0); /* loc1 */
	tr1 = RTLN(eif_new_type(65, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
	RTNHOOK(1,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	tr1 = RTMS_EX_H("An agent has been invoked on a copy of an object during object graph traversal.\012This happens in TUPLE containing objects with copy-semantics or in SPECIAL[XX],\012where XX is a user-defined expanded type.",201,185385518);
	ur1 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1304, "set_description", loc1))(loc1, ur1x);
	RTHOOK(3);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1289, "raise", loc1))(loc1);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(4);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef ur1
}

void EIF_Minit49 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
