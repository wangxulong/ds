package com.wang.util;

import com.google.common.base.Strings;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wxl on 2015/10/23.
 */
public class CommonUtil {
    public static List<Long> convertStringToLongArray(String str){
        if(!Strings.isNullOrEmpty(str)){
            String[] strs = str.split(",");
            List<Long> results = new ArrayList<Long>();
            for(String s:strs){
                results.add(Long.parseLong(s));
            }
            return results;
        }
        return null;

    }
}
