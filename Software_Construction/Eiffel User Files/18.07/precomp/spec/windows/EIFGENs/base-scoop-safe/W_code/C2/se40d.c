/*
 * Class SED_BINARY_READER_WRITER
 */

#include "eif_macros.h"


#ifdef __cplusplus
extern "C" {
#endif

static const EIF_TYPE_INDEX egt_0_40 [] = {0xFF01,231,0xFFFF};
static const EIF_TYPE_INDEX egt_1_40 [] = {0xFF01,246,39,0xFFFF};
static const EIF_TYPE_INDEX egt_2_40 [] = {0xFF01,39,0xFFFF};
static const EIF_TYPE_INDEX egt_3_40 [] = {0,0xFFFF};
static const EIF_TYPE_INDEX egt_4_40 [] = {0,0xFFFF};
static const EIF_TYPE_INDEX egt_5_40 [] = {0xFF01,39,0xFFFF};
static const EIF_TYPE_INDEX egt_6_40 [] = {0xFF01,39,0xFFFF};
static const EIF_TYPE_INDEX egt_7_40 [] = {0,0xFFFF};
static const EIF_TYPE_INDEX egt_8_40 [] = {0xFF01,14,0xFFFF};
static const EIF_TYPE_INDEX egt_9_40 [] = {0xFF01,231,0xFFFF};
static const EIF_TYPE_INDEX egt_10_40 [] = {0xFF01,231,0xFFFF};
static const EIF_TYPE_INDEX egt_11_40 [] = {0xFF01,15,0xFFFF};
static const EIF_TYPE_INDEX egt_12_40 [] = {0xFF01,39,0xFFFF};
static const EIF_TYPE_INDEX egt_13_40 [] = {0xFF01,231,0xFFFF};
static const EIF_TYPE_INDEX egt_14_40 [] = {0xFF01,239,0xFFFF};
static const EIF_TYPE_INDEX egt_15_40 [] = {0xFF01,237,0xFFFF};
static const EIF_TYPE_INDEX egt_16_40 [] = {0xFF01,240,0xFFFF};
static const EIF_TYPE_INDEX egt_17_40 [] = {0xFF01,170,0xFFFF};


static const struct desc_info desc_40[] = {
	{EIF_GENERIC(NULL), 1044, 0xFFFFFFFF},
	{EIF_GENERIC(egt_0_40), 0, 0xFFFFFFFF},
	{EIF_GENERIC(egt_1_40), 1, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0195 /*202*/), 2, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0195 /*202*/), 3, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0195 /*202*/), 4, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0195 /*202*/), 5, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0195 /*202*/), 6, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0195 /*202*/), 7, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0195 /*202*/), 8, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0195 /*202*/), 9, 0xFFFFFFFF},
	{EIF_GENERIC(egt_2_40), 10, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 11, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 12, 0xFFFFFFFF},
	{EIF_GENERIC(egt_3_40), 13, 0xFFFFFFFF},
	{EIF_GENERIC(egt_4_40), 14, 0xFFFFFFFF},
	{EIF_GENERIC(egt_5_40), 15, 0xFFFFFFFF},
	{EIF_GENERIC(egt_6_40), 16, 0xFFFFFFFF},
	{EIF_GENERIC(egt_7_40), 17, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 18, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 19, 0xFFFFFFFF},
	{EIF_GENERIC(egt_8_40), 20, 0xFFFFFFFF},
	{EIF_GENERIC(egt_9_40), 21, 0xFFFFFFFF},
	{EIF_GENERIC(egt_10_40), 22, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 23, 0xFFFFFFFF},
	{EIF_GENERIC(egt_11_40), 24, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 25, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 26, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 27, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x4F /*39*/), 28, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01C5 /*226*/), 29, 0xFFFFFFFF},
	{EIF_GENERIC(egt_12_40), 30, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1000, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 987, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 986, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 999, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0195 /*202*/), 1010, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0195 /*202*/), 1011, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0195 /*202*/), 988, 8},
	{EIF_GENERIC(NULL), 989, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0189 /*196*/), 990, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0183 /*193*/), 991, 0xFFFFFFFF},
	{EIF_GENERIC(egt_13_40), 992, 0xFFFFFFFF},
	{EIF_GENERIC(egt_14_40), 993, 0xFFFFFFFF},
	{EIF_GENERIC(egt_15_40), 994, 0xFFFFFFFF},
	{EIF_GENERIC(egt_16_40), 995, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0195 /*202*/), 996, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01A1 /*208*/), 1015, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01AD /*214*/), 1016, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01A7 /*211*/), 1017, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BF /*223*/), 1018, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0177 /*187*/), 1019, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01B9 /*220*/), 1020, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01B3 /*217*/), 1021, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x018F /*199*/), 1022, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x017D /*190*/), 1023, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x019B /*205*/), 1024, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01C5 /*226*/), 1025, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01B3 /*217*/), 1001, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01A7 /*211*/), 1002, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1003, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1004, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1005, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1006, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1007, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1008, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1009, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1026, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1027, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1028, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1029, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1030, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1031, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1032, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1033, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1034, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1035, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1036, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 997, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 998, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0195 /*202*/), 1012, 9},
	{EIF_GENERIC(NULL), 1013, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 1014, 0xFFFFFFFF},
	{EIF_GENERIC(egt_17_40), 1037, 0},
	{EIF_NON_GENERIC(0x01 /*0*/), 1038, 4},
	{EIF_NON_GENERIC(0x01B3 /*217*/), 1039, 12},
	{EIF_NON_GENERIC(0x01B3 /*217*/), 1040, 16},
	{EIF_NON_GENERIC(0x01B3 /*217*/), 1041, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0195 /*202*/), 1042, 10},
	{EIF_NON_GENERIC(0x01B3 /*217*/), 1043, 20},
	{EIF_GENERIC(NULL), 0x00, 0xFFFFFFFF},
};
void Init40(void)
{
	IDSC(desc_40, 0, 39);
	IDSC(desc_40 + 1, 1, 39);
	IDSC(desc_40 + 32, 68, 39);
	IDSC(desc_40 + 80, 278, 39);
}


#ifdef __cplusplus
}
#endif
