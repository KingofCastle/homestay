package com.xinguang.tubobo.admin.impl.utils;

import com.hzmux.hzcms.common.config.Global;

/**
 * Created by ou_young on 2017/8/11.
 */
public class AliSmsUtils {

    private static String ALISMS_URL;
    private static String ALISMS_APIKEY;
    private static String ALISMS_SECRET;

    static {
        ALISMS_URL = Global.getConfig("alisms_url");
        ALISMS_APIKEY = Global.getConfig("alisms_apikey");
        ALISMS_SECRET = Global.getConfig("alisms_secret");

    }

    public static String getAlismsUrl() {
        return ALISMS_URL;
    }

    public static String getAlismsApikey() {
        return ALISMS_APIKEY;
    }

    public static String getAlismsSecret() {
        return ALISMS_SECRET;
    }
}
