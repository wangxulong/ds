package com.wang.service;

import com.wang.dao.THomeworkDao;
import com.wang.entity.TAttachment;
import com.wang.entity.THomework;
import com.wang.form.HomeworkFormBean;
import com.wang.util.UpFilesUtils;
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
        homeworkTemp.setDescription(homework.getDescription());

        if (homework.getPic().isEmpty()){  //没有附件

            tHomeworkDao.save(homeworkTemp);

        }else {                         //有附件
            //获取上传的文件
            MultipartFile file = homework.getPic();
            //存储文件到指定的位置
            UpFilesUtils.saveFile(file);

            //保存附件基本信息到数据库
            TAttachment attachment = new TAttachment();
            attachment.setName(UpFilesUtils.realName);
            attachment.setFormat(UpFilesUtils.prefix);
            attachment.setPath(UpFilesUtils.savePath);
            tAttachmentService.addAttachment(attachment);

            homeworkTemp.setAttachmentId(attachment.getId());
            tHomeworkDao.save(homeworkTemp);

        }








    }
}
