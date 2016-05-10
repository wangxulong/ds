package com.wang.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * Created by Administrator on 2016/5/10 0010.
 */
public class UpFilesUtils {

    public static final String picPath="/upload/files/";
    public  String filePath ="";

    public void saveFile(MultipartFile file) {
        if (null != file) {
            String realName = file.getOriginalFilename();
            String prefix = realName.substring(realName.lastIndexOf("."));
            Long fileName = new Date().getTime();
            filePath = this.getClass().getResource("/").getPath() + picPath + fileName + prefix;
            // 转存文件
            try {
                file.transferTo(new File(filePath));
            } catch (IOException e) {
                throw new RuntimeException("保存文件失败");
            }
        }
    }
    public void test(){
        int i;
    }

}

