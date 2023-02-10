package com.example.management.controller;
//小区管理控制层


import com.example.management.common.MessageConstant;
import com.example.management.common.PageResult;
import com.example.management.common.Result;
import com.example.management.common.StatusCode;
import com.example.management.domain.Community;
import com.example.management.service.CommunityService;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("community")
public class CommunityController {

    @Autowired
    private CommunityService communityService;

    @RequestMapping("/find")
    public Result find() {

        List<Community> all = communityService.findAll();

        return new Result(false, 200, "成功",all);
    }



    @RequestMapping("/search")
    public PageResult search(@RequestBody Map searchMap){
        Page<Community> page = communityService.search(searchMap);
        return new PageResult(true, StatusCode.OK, MessageConstant.COMMUNITY_SEARCH_SUCCESS,page.getResult(), page.getTotal());
    }


    @RequestMapping("/add")
    public Result add(@RequestBody Community community){
        //调用
        Boolean add = communityService.add(community);
        return new Result(true,StatusCode.OK,MessageConstant.COMMUNITY_ADD_SUCCESS);
    }

    @RequestMapping("/findById")
    public Result findById(Integer id){
        Community community = communityService.findById(id);
        return new Result(true,StatusCode.OK,MessageConstant.COMMUNITY_FIND_BY_ID_SUCCESS,community);
    }

    @RequestMapping("/update")
    public Result update(@RequestBody Community community){
        //调用
        Boolean add = communityService.update(community);
        return new Result(true,StatusCode.OK,MessageConstant.COMMUNITY_UPDATE_SUCCESS);
    }

    @RequestMapping("/updateStatus/{status}/{id}")
    public Result updateStatus(@PathVariable("status") String status,@PathVariable("id") Integer id){
        Boolean flag = communityService.updateStatus(status,id);
        return new Result(true,StatusCode.OK,MessageConstant.COMMUNITY_UPDATE_SUCCESS);
    }


}
