package com.xinguang.tubobo.admin.impl.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * com.xinguang.tubobo.impl.utils
 *
 * @Author : Gaohf
 * @Description :
 * @Date : 2017/10/31
 */
public class RuleTypeUtil {

    public List<RuleType> getInitRuleType(){
         List<RuleType> list=new ArrayList<>(2);
         RuleType r1=new RuleType("0","日阶梯奖励");
         RuleType r2=new RuleType("1","周阶梯奖励");
         list.add(r1);
         list.add(r2);
         return list;
    }

    class RuleType{
        private String value;
        private String label;

        public RuleType(){
            super();
        }

        public RuleType(String v1,String v2){
            this.value=v1;
            this.label=v2;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }

        public String getLabel() {
            return label;
        }

        public void setLabel(String label) {
            this.label = label;
        }
    }
}
