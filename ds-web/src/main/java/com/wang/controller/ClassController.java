package com.wang.controller;

import com.alibaba.fastjson.JSONArray;
import com.sun.corba.se.impl.orbutil.threadpool.ThreadPoolManagerImpl;
import com.wang.entity.*;
import com.wang.entity.enums.NoteState;
import com.wang.form.MaterialFormBean;
import com.wang.service.*;
import org.springframework.core.env.SystemEnvironmentPropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
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

    @Resource
    private NoteService noteService;

    @Resource
    private SeminarService seminarService;

    @Resource
    private SeminarTopicService seminarTopicService;

    @RequestMapping("index")
    public void index(Model model){
        model.addAttribute("courseList",courseService.getAllCourse());
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

    @ResponseBody
    @RequestMapping(value="uploadFile",method= RequestMethod.POST)
    public Map<String,Object> uploadFile(@ModelAttribute TMaterial material, HttpServletResponse response, HttpServletRequest request, @RequestParam(value="file", required=false) MultipartFile file) throws IOException {
System.out.println("zjc"+file.isEmpty());
        byte[] bytes = file.getBytes();
        String uploadDir = request.getServletContext().getRealPath(File.separator)+"\\upload\\material";
        String newDir = uploadDir+File.separator+material.getCourseId()+getParentPath(material.getPid());
        File dirPath = new File(newDir);
        if (!dirPath.exists()) {
            dirPath.mkdirs();
        }
        String sep = System.getProperty("file.separator");
        File uploadedFile = new File(newDir + sep
                + file.getOriginalFilename());
        FileCopyUtils.copy(bytes, uploadedFile);
        String path = request.getContextPath()+"/upload/material/"+material.getCourseId()+getWebParentPath(material.getPid())+"/"+file.getOriginalFilename();
        material.setPath(path);

        int newId = materialService.save(material);

        int status = 100;
        String newName = material.getName();
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("status",100);
        map.put("name",newName);
        map.put("id",newId);
        return map;
    }



    private String getWebParentPath(int id){
        if(id==0) return "";
        TMaterial material = materialService.findOne(id);
        return "/"+getParentPath(material.getPid())+"/"+material.getName();
    }
    private String getParentPath(int id){
        if(id==0) return "";
        TMaterial material = materialService.findOne(id);
        return File.separator+getParentPath(material.getPid())+File.separator+material.getName();
    }

    @ResponseBody
    @RequestMapping("makedir")
    public Map<String, Object> makeDir(HttpServletRequest request,@RequestParam("pid") Integer pid ,@RequestParam("name") String name ,@RequestParam("cid") Integer cid ,Model model){
        TMaterial materail = new TMaterial();
        String uploadDir = request.getServletContext().getRealPath(File.separator)+"\\upload\\material";
        String newDir = uploadDir+File.separator+cid+getParentPath(pid)+File.separator+name;
        File dirPath = new File(newDir);
        Map<String, Object> map = new HashMap<String,Object>();
        if (dirPath.exists()) {
            map.put("status",101);
            return map;
        }
        dirPath.mkdirs();
        materail.setPid(pid);
        materail.setName(name);
        materail.setCourseId(cid);
        materail.setParent(true);
        int id = materialService.save(materail);

        map.put("id",id);
        map.put("status",100);
        return map;
    }
    @ResponseBody
    @RequestMapping("getNode")
    public List<Map<String, Object>> getNode(@RequestParam("cid") Integer cid ,Model model){
        List<TMaterial> materials = materialService.getAllByCourse(cid);
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

    @ResponseBody
    @RequestMapping("material/edit/getOneNode")
    public TMaterial getNodeById(Integer id,Model model){
        return  materialService.findOne(id);
    }

    @RequestMapping("request/index")
    public void requestIndex(Model model){
    }


    @ResponseBody
    @RequestMapping("material/edit/delete")
    public Map<String,Object> materialDelete(@RequestParam("id") Integer id,Model model){
        materialService.materialDeleteFunc(id);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("status",100);
        return map;
    }



    @RequestMapping("note/index")
    public void noteIndex(@RequestParam(value="type", defaultValue="-1") Integer type,@RequestParam("cid") Integer cid,Model model){
        TCourse course = courseService.getCourseById(cid);
        List<TNote> notes = noteService.findByType(type,cid);
        model.addAttribute("type",type);
        model.addAttribute("notes",notes);
        model.addAttribute("course",course);
    }

    @ResponseBody
    @RequestMapping("note/get")
    public TNote getOne(@RequestParam("id") Integer id){
        return noteService.findOne(id);
    }

    @ResponseBody
    @RequestMapping("note/approve")
    public Map<String,Object> noteApprove(@RequestParam("id") Integer id){
        noteService.appoveNote(id);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("status",100);
        return map;
    }

    @ResponseBody
    @RequestMapping("note/dismiss")
    public Map<String,Object>  noteDismiss(@RequestParam("id") Integer id){
        noteService.dismissNote(id);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("status",100);
        return map;
    }


    @RequestMapping("seminar/index")
    public void  seminarIndex(@RequestParam("cid") Integer cid,Model model){
        TCourse course = courseService.getCourseById(cid);
        List<TSeminar> seminars =  seminarService.findByCourse(cid);

        model.addAttribute("seminars",seminars);
        model.addAttribute("course",course);

    }


    @RequestMapping("seminar/add")
    public void seminarAdd(Integer cid,Model model){
        TSeminar command = new TSeminar();
        model.addAttribute("command",command);
        model.addAttribute("cid",cid);
    }

    @RequestMapping("seminar/update")
    public String  seminarUpdate(Integer sid,Integer cid,Model model){
        TSeminar command = seminarService.findById(sid);
        model.addAttribute("command",command);
        model.addAttribute("cid",cid);
        return "/class/seminar/add";
    }

    @RequestMapping("seminar/save")
    public String  seminarSave(TSeminar seminar){
     //  System.out.println("name="+seminar.getName()+" desc="+seminar.getDesc()+" start_time="+seminar.getStartTime()+" end_time="+seminar.getEndTime());
        seminarService.save(seminar);
        return "redirect:/class/seminar/index?cid="+seminar.getCourseId();
    }

    @RequestMapping("seminar/delete")
    public String  seminarDelete(Integer sid,Integer cid){
        seminarService.delete(sid);
        return "redirect:/class/seminar/index?cid="+cid;
    }

    @RequestMapping("seminarTopic/index")
    public void  seminarTopicIndex(@RequestParam("sid") Integer sid,Model model){
        TSeminar seminar = seminarService.findById(sid);
        model.addAttribute("seminar",seminar);

    }

    @RequestMapping("seminarTopic/add")
    public void  seminarTopicAdd(Integer sid,Model model){
        TSeminarTopic command = new TSeminarTopic();
        model.addAttribute("command",command);
        model.addAttribute("sid",sid);
    }

    @RequestMapping("seminarTopic/save")
    public String  seminarTopicSave(TSeminarTopic seminarTopic){
        seminarTopicService.save(seminarTopic);
        return "redirect:/class/seminarTopic/index?sid="+seminarTopic.getSeminarId();
    }

    @RequestMapping("seminarTopic/delete")
    public String  seminarTopicDelete(Integer sid,Integer stid){
        seminarTopicService.delete(stid);
        return "redirect:/class/seminarTopic/index?sid="+sid;
    }

    @RequestMapping("seminarTopic/update")
    public String  seminarTopicUpdate(Integer sid,Integer stid,Model model){
        TSeminarTopic command = seminarTopicService.findById(stid);
        model.addAttribute("command",command);
        model.addAttribute("sid",sid);
        return "/class/seminarTopic/add";
    }
}
