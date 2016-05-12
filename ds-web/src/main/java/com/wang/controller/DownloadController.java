package com.wang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wxl on 2016/5/12.
 */
@Controller
public class DownloadController {

    @RequestMapping(value = "/download/{id}")
    public void download(@PathVariable Integer id){

    }
}
