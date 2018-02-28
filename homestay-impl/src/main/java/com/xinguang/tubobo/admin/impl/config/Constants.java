package com.xinguang.tubobo.admin.impl.config;

public class Constants {

	public static final Boolean OVERTIMETYPE_TRUE = true;
	public static final Boolean OVERTIMETYPE_FALSE = false;

	public static final String Yes = "0";
	public static final String NO = "1";

	public static final String DEL_FLAG_NORMAL = "0";

	/** app类型 **/
	public static String APP_TYPE_ANDROID = "android";
	public static String APP_TYPE_IOS = "ios";

	public static String GEO_REGISTER_TYPE_STORE= "store";

	public static  String TBB_RATE_PALTFORM_DELIVERY = "DELIVERY";
	public static String TBB_RATE_SCORES_KEY_DELIVERY = "DELIVERY_SERVICE";

	public static final String  PATTERN_PHONE= "^1\\d{10}?$";
	public static final String  PATTERN_ID_CARD= "^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";

    public static int TOKEN_EXPIRED_SECONDS = 60*60*2;
    public static int REFRESH_TOKEN_EXPIRED_SECONDS = 60*60*24;
}
