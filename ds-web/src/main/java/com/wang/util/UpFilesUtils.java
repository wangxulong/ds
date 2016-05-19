package com.wang.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * Created by Administrator on 2016/5/10 0010.
 */
public class UpFilesUtils {
    //所有文件存储的位置
    public static String filePath ="";
    //具体文件存储位置
    public static String savePath="";
    //真实文件名
    public static String realName="";
    //具体文件的后缀名
    public static String prefix="";
    //文件存储的文件名
    public static Long fileName;

    public static String getPath(){
        return filePath = UpFilesUtils.class.getClassLoader().getResource("/").getPath();
    }
    public static String getRealPath(){
        return filePath = UpFilesUtils.class.getClassLoader().getResource("/").getPath()+"/upload/";
    }
//    public static String getRealPaths(){
//        return  filePath = this.getServletContext().getRealPath("/WEB-INF/upload");
//    }
    //存储上传文件到类路径下
    public static void saveFile(MultipartFile file) {
        if (null != file) {
            realName = file.getOriginalFilename();
            prefix = realName.substring(realName.lastIndexOf("."));
            fileName = new Date().getTime();
            savePath = getPath()+ fileName + prefix;
            // 转存文件
            try {
                file.transferTo(new File(savePath));
            } catch (IOException e) {
                throw new RuntimeException("保存文件失败");
            }
        }
    }

    public static String saveUploadFile(MultipartFile file,String path) {

            realName = file.getOriginalFilename();
            prefix = realName.substring(realName.lastIndexOf("."));
            fileName = new Date().getTime();
            savePath =path+"/"+ fileName + prefix;
            // 转存文件
            try {
                file.transferTo(new File(savePath));
            } catch (IOException e) {
                throw new RuntimeException("保存文件失败");
            }
            return fileName + prefix;
    }




}

