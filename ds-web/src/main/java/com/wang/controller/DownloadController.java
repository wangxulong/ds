package com.wang.controller;

import com.wang.entity.TAttachment;
import com.wang.service.TAttachmentService;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * Created by wxl on 2016/5/12.
 */
@Controller
public class DownloadController  {
    @Resource
    private TAttachmentService attachmentService;
    /**
     * 下载文件
     */
    @RequestMapping(value = "/front/download/{id}")
    public ResponseEntity<byte[]> frontDownload(@PathVariable Integer id,HttpServletRequest request) throws IOException {
        return download(id,request);
    }
    @RequestMapping(value = "/download/{id}")
    public ResponseEntity<byte[]> backDownload(@PathVariable Integer id,HttpServletRequest request) throws IOException {
        return download(id,request);
    }


    private ResponseEntity<byte[]> download(Integer id,HttpServletRequest request) throws IOException {
        TAttachment attachment =  attachmentService.getOneAttachment(id);
        if(null == attachment){
            throw  new RuntimeException("文件不存在");
        }
        String realPath = request.getServletContext().getRealPath("/");
        String path  = realPath + "/" +attachment.getPath();
        File file = new File(path);
        if(!file.exists()){
            throw  new RuntimeException("文件不存在");
        }

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", attachment.getName());
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.CREATED);
    }
}
