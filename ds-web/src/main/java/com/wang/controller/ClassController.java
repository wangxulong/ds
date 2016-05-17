package com.wang.controller;

import com.wang.entity.TMaterial;
import com.wang.form.MaterialFormBean;
import com.wang.service.CourseService;
import com.wang.service.MaterialService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**课堂教学（周冀超）
 * Created by Administrator on 2016/5/9 0009.
 */
@Controller
@RequestMapping("/class/")
public class ClassController {

    @Resource
    private CourseService courseService;

    @Resource
    private MaterialService materialService;

    @RequestMapping("index")
    public void index(Model model){
    }

    @RequestMapping("material/index")
    public void materialIndex(Model model){
        model.addAttribute("courseList",courseService.getAllCourse());
    }

    @RequestMapping("material/edit")
    public void materialEdit(@RequestParam("id") Integer id , Model model){
        TMaterial command = new MaterialFormBean();
        model.addAttribute("course",courseService.getCourseById(id));
        model.addAttribute("command", command);
    }

    @RequestMapping(value="uploadFile",method= RequestMethod.POST)
    public void uploadFile(@RequestParam("id") Integer id ,HttpServletResponse response, HttpServletRequest request, @RequestParam(value="file", required=false) MultipartFile file) throws IOException {
        System.out.println(id);
        byte[] bytes = file.getBytes();
        System.out.println(file.getOriginalFilename());
        String uploadDir = request.getServletContext().getRealPath(File.separator)+"\\upload";
        System.out.println("uploadDir="+uploadDir);
        File dirPath = new File(uploadDir);
        if (!dirPath.exists()) {
            dirPath.mkdirs();
        }
        String sep = System.getProperty("file.separator");
        File uploadedFile = new File(uploadDir + sep
                + file.getOriginalFilename());
        System.out.println(uploadDir + sep
                + file.getOriginalFilename());
        FileCopyUtils.copy(bytes, uploadedFile);
        String msg = "true";
        response.getWriter().write(msg);
    }

    @ResponseBody
    @RequestMapping("makedir")
    public Map<String, Object> makeDir(@RequestParam("pid") Integer pid ,@RequestParam("name") String name ,@RequestParam("cid") Integer cid ,Model model){
        TMaterial materail = new TMaterial();
        materail.setPid(pid);
        materail.setName(name);
        materail.setCourseId(cid);
        materail.setParent(true);
        int id = materialService.save(materail);
        Map<String, Object> map = new HashMap<String,Object>();
        map.put("id",id);
        map.put("status",100);
        return map;
    }
    @ResponseBody
    @RequestMapping("getNode")
    public List<Map<String, Object>> getNode(@RequestParam("cid") Integer cid ,Model model){
        List<TMaterial> materials = materialService.getAllByCourse(cid);
        System.out.println(materials.toString());
        System.out.println(materials.toString());
        List<Map<String, Object>> res = new ArrayList<Map<String, Object>>();
        for(TMaterial material:materials){
            Map<String,Object> map = new HashMap<String, Object>();
            map.put("id",material.getId());
            map.put("pId",material.getPid());
            map.put("name",material.getName());
            map.put("isParent",material.isParent());
            res.add(map);
        }
        return  res;
    }

    @ResponseBody
    @RequestMapping("material/edit/list")
    public List<TMaterial> materialList(Integer id,Model model){
        return  materialService.findAll();
    }

    @RequestMapping("request/index")
    public void requestIndex(Model model){
    }

    @RequestMapping("seminar/index")
    public void seminarIndex(Model model){
    }
}
