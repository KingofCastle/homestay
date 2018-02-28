package com.xinguang.tubobo.admin.impl.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lvhantai on 2017/10/19.
 */
public class AreaUtil {
    public List<AreaHelper> getAllArea(){
        AreaHelper areaHelper1 = new AreaHelper();
        AreaHelper areaHelper2 = new AreaHelper();
        AreaHelper areaHelper3 = new AreaHelper();
        AreaHelper areaHelper4 = new AreaHelper();
        areaHelper1.setId(1);
        areaHelper1.setName("杭州");
        areaHelper1.setCode("330100");
        areaHelper2.setId(2);
        areaHelper2.setName("金华");
        areaHelper2.setCode("330700");
        areaHelper3.setId(3);
        areaHelper3.setName("宁波");
        areaHelper3.setCode("330200");
        areaHelper4.setId(4);
        areaHelper4.setName("西安");
        areaHelper4.setCode("610100");
        List<AreaHelper> list = new ArrayList<>();
        list.add(areaHelper1);
        list.add(areaHelper2);
        list.add(areaHelper3);
        list.add(areaHelper4);
        return list;
    }
}
