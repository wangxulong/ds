package com.wang.service;

import com.wang.dao.THomeworkDao;
import com.wang.entity.TAttachment;
import com.wang.entity.THomework;
import com.wang.form.HomeworkFormBean;
import com.wang.util.UpFilesUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/5/10 0010.
 */
@Service
@Transactional
public class THomeworkService {
    @Resource
    private THomeworkDao tHomeworkDao;
    @Resource
    private TAttachmentService tAttachmentService;
    /*获取所有的作业*/
    public List<THomework> getAllTHomeWork(){
        List<THomework> list = new ArrayList<THomework>();
        list = tHomeworkDao.findAll();
        return list;
    }
    /*获取某一次作业*/
    public THomework getOneTHomeWork(int id){
       THomework homework = new THomework();
        homework = tHomeworkDao.findOne(id);
        return homework;
    }
    /*删除某一次作业*/
    public  void deleteOneHomeWork(int id){
        tHomeworkDao.delete(id);
    }
    /*删除多次作业*/
    public void deleteSomeHomeWork(int[] arrayId){
        for (int i=0;i<arrayId.length;i++){
            deleteOneHomeWork(arrayId[i]);
        }

    }
    /*保存并更新*/
    public void updateOneHomeWork(THomework homework){
        tHomeworkDao.saveAndFlush(homework);
    }

    /*添加作业*/
    public void addOneHomeWork(HomeworkFormBean homework){

        THomework  homeworkTemp = new THomework();
        homeworkTemp.setTopic(homework.getTopic());
        homeworkTemp.setFinshTime(homework.getFinshTime());
        homeworkTemp.setDesc(homework.getDesc());

        if (homework.getPic()==null){  //没有附件

            tHomeworkDao.save(homeworkTemp);
        }else {                         //有附件
            //获取上传的文件
            MultipartFile file = homework.getPic();
            //存储文件到指定的位置
            UpFilesUtil upFilesUtil = new UpFilesUtil();
            upFilesUtil.saveFile(file);
            //保存附件基本信息到数据库
            TAttachment attachment = new TAttachment();
            attachment.setName(file.getName());
            attachment.setFormat(file.getContentType());
            attachment.setPath(upFilesUtil.filePath);
            tAttachmentService.addAttachment(attachment);
            homeworkTemp.setAttachmentId(attachment.getId());
            tHomeworkDao.save(homeworkTemp);

        }








    }
}
