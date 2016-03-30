package com.wang.auth.sys.service;

import com.google.common.base.Strings;
import com.wang.auth.sys.dao.SysResourceDao;
import com.wang.auth.sys.dao.SysRoleDao;
import com.wang.auth.sys.entity.SysResource;
import com.wang.auth.sys.entity.SysRole;
import com.wang.auth.sys.entity.SysUser;
import com.wang.auth.sys.enumeration.SysResourceType;
import com.wang.dto.ResourceDto;
import com.wang.dto.TreeDto;
import com.wang.util.CommonUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by wxl on 2015/10/12.
 */
@Service
@Transactional
public class SysResourceService {
	Logger log=Logger.getLogger(SysResourceService.class);
    @Resource
    private SysResourceDao sysResourceDao;
    @Resource
    private SysUserService sysUserService;
    @Resource
    private SysRoleDao sysRoleDao;


    public List<SysResource> getAllFolder(){
        return sysResourceDao.findByParentId(0L);
    }
    //只有二级菜单
    public List<ResourceDto> getMenuList(){
        List<SysResource> folders = getAllFolder();
        List<ResourceDto> resourceDtos = new ArrayList<ResourceDto>();
        for(SysResource folder:folders){
            ResourceDto resourceDto = new ResourceDto();
            resourceDto.setParent(folder);
            resourceDto.setChildren(sysResourceDao.findByParentId(folder.getId()));
            resourceDtos.add(resourceDto);
        }

        return resourceDtos;
    }

    public  ResourceDto getButtonByMenu(Long parentId){
        SysResource menu = sysResourceDao.findOne(parentId);
        List<SysResource> buttons = sysResourceDao.findByTypeAndParentId(SysResourceType.BUTTON,parentId);
        return new ResourceDto(menu,buttons);
    }

    public void addSysRes(SysResource resource){
        resource.setAvailable(true);
        //设置parentIds
        SysResource parent = sysResourceDao.findOne(resource.getParentId());
        //folder
        if(null == parent&&resource.getType().equals(SysResourceType.FOLDER)){
            resource.setParentIds("0");
            sysResourceDao.save(resource);
            return;
        }
        if(resource.getType().equals(SysResourceType.MENU)){
            resource.setUrl(resource.getResourceCode());
            resource.setParentIds(parent.getId()+"");
            resource.setResourceCode(null);
        }else{
            resource.setParentIds(parent.getParentIds()+"-"+parent.getId());
        }

//        if(parent.getResourceCode().equals("0")){
//            resource.setParentIds("1");
//        }



        sysResourceDao.save(resource);
    }

    public void deleteRes(Long... ids){
        for(Long id:ids){
            sysResourceDao.delete(id);
        }
    }


    public List<TreeDto>  getTreeData(Long parentId){
        List<SysResource> roots = sysResourceDao.findByParentId(parentId);
        List<TreeDto> trees = new ArrayList<TreeDto>();
        for(SysResource root:roots){
            List<SysResource> children = sysResourceDao.findByParentId(root.getId());
            TreeDto tree = new TreeDto();
            tree.setParentId(parentId);
            tree.setId(root.getId());
            tree.setText(root.getName());
            tree.setChildren(true);
            tree.setType("folder");
            tree.setParentIds(root.getParentIds());
            if(children.isEmpty()){
                tree.setChildren(false);
                tree.setType("item");
            }
            trees.add(tree);
        }
        return trees;
    }
    public  List<TreeDto> getRoleResTree(Long parentId,Long roleId){
        List<TreeDto> results = getTreeData(parentId);
        SysRole role = sysRoleDao.findOne(roleId);
        List<Long> resIds = CommonUtil.convertStringToLongArray(role.getResourceIds());
        if(null!=resIds){
            for(TreeDto result:results){
                if(resIds.contains(result.getId())){
                    result.setChecked(true);
                }
            }
        }
        return results;
    }

    /**
     * 
     * @param parentId 父类id
     * @return
     */
    public List<TreeDto> getMyResTree(Long parentId,Long userId){
		//1.获取用户角色2.获取角色中的资源
    	log.info("父类："+parentId+",用户："+userId+"得到子类节点开始");
        List<SysRole> myRoles = sysUserService.getMyRole(userId);
        List<TreeDto> results = getTreeData(parentId);
        if(null!=myRoles){
            String allRoles = "";
            for(SysRole myRole:myRoles){
                if(!Strings.isNullOrEmpty(myRole.getResourceIds()))
                    allRoles+=myRole.getResourceIds()+",";
            }
            if(!Strings.isNullOrEmpty(allRoles)){
                List<Long> myResourceIds = CommonUtil.convertStringToLongArray(allRoles.substring(0,allRoles.length()-1));
                if(null!=myResourceIds){
                    for(TreeDto result:results){
                        if(myResourceIds.contains(result.getId())){
                            result.setChecked(true);
                        }
                    }
                }
            }

        }
        log.info("父类："+parentId+",用户："+userId+"得到子类节点结束");
        return results;
    }

    public List<SysResource> getMyResourcesByRoles(List<SysRole> myRoles){
        List<Long> myResIds = getResIdsMyRoleList(myRoles);
        if(null!=myResIds){
            List<SysResource> myResources = sysResourceDao.findByIdIn(myResIds);
            return myResources;
        }
        return null;
    }

    public List<SysResource> getMyResources(Long userId){
        List<SysRole> myRoles = sysUserService.getMyRole(userId);
        return getMyResourcesByRoles(myRoles);
    }
    private List<Long> getResIdsMyRoleList(List<SysRole> roles){
        String resStr = "";
        for(SysRole role:roles){
            resStr+=role.getResourceIds()+",";
        }
        if(!Strings.isNullOrEmpty(resStr)){
            List<Long> myResourceIds = CommonUtil.convertStringToLongArray(resStr.substring(0,resStr.length()-1));
            return myResourceIds;
        }
        return null;
    }
    public List<Long> getMyResourceIds(Long userId){
        List<SysRole> myRoles = sysUserService.getMyRole(userId);
        if(null==myRoles) return null;
        return getResIdsMyRoleList(myRoles);
    }

    /**
     * 获取用户的菜单
     */
    public List<ResourceDto> getMyMenus(){
        SysUser sysUser =  sysUserService.getCurrentUser();
        List<Long> resIds =  getMyResourceIds(sysUser.getId());
        List<ResourceDto> resourceDtos = new ArrayList<ResourceDto>();
        if(null!=resIds){
            List<SysResource> myFolders = sysResourceDao.findByTypeAndIdIn(SysResourceType.FOLDER,resIds);
            List<SysResource> myMenus = sysResourceDao.findByTypeAndIdIn(SysResourceType.MENU,resIds);
            for(SysResource myFolder:myFolders){
                ResourceDto resourceDto = new ResourceDto();
                resourceDto.setParent(myFolder);
                List<SysResource> children = new ArrayList<SysResource>();
                for(SysResource myMenu:myMenus){
                    if(myMenu.getParentId().equals(myFolder.getId())){
                        children.add(myMenu);
                    }
                }
                resourceDto.setChildren(children);
                resourceDtos.add(resourceDto);
            }
        }
        return resourceDtos;
    }
    /**
     * 
     * @Title: iocSysUserService
     * @Description:互相注入
     * @author:sunwei
     * @createTime:2015年10月26日下午1:05:25
     */
    public void iocSysUserService(){
    	System.out.println("我要注入："+sysUserService);
    	sysUserService.addUser("孙伟", "admin");
    }
}
