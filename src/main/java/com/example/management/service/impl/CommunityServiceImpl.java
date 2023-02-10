package com.example.management.service.impl;

import com.example.management.dao.CommunityMapper;
import com.example.management.domain.Community;
import com.example.management.service.CommunityService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.util.StringUtil;

import java.util.List;
import java.util.Map;

@Service
public class CommunityServiceImpl implements CommunityService {

    @Autowired
    private CommunityMapper communityMapper;

    @Override
    public List<Community> findAll() {
        List<Community> communities = communityMapper.selectAll();

        return communities;
    }

    @Override
    public Page<Community> search(Map searchMap) {

        Example example = new Example(Community.class); // implement the class
        //General Mapper multi-condition search, standard mehtod
        //1. Initialize pagination condition
        int pageNum = 1;
        int pageSize = 2;
        if (searchMap != null) {

            Example.Criteria criteria = example.createCriteria();// Create search criteria

            // time
            if (StringUtil.isNotEmpty((String) searchMap.get("startTime"))) {
                criteria.andGreaterThanOrEqualTo("createTime", searchMap.get("startTime"));
            }

            if (StringUtil.isNotEmpty((String) searchMap.get("endTime"))) {
                criteria.andLessThanOrEqualTo("createTime", searchMap.get("endTime"));
            }

            // Fuzzy name
            if (StringUtil.isNotEmpty((String) searchMap.get("name"))) {
                criteria.andLike("name", "%" + (String) searchMap.get("name") + "%");
            }

            // pagination
            if ((Integer) searchMap.get("pageNum") != null) {
                pageNum = (Integer) searchMap.get("pageNum");
            }
            if ((Integer) searchMap.get("pageSize") != null) {
                pageSize = (Integer) searchMap.get("pageSize");
            }


        }
        PageHelper.startPage(pageNum, pageSize);
        Page<Community> communities = (Page<Community>) communityMapper.selectByExample(example);
        return communities;
    }

    @Override
    public Boolean add(Community community) {
        int row = communityMapper.insert(community);
        if (row > 0) {
            return true;
        } else {
            return false;
        }


    }

    @Override
    public Community findById(Integer id) {
        return communityMapper.selectByPrimaryKey(id);
    }

    @Override
    public Boolean update(Community community) {
        int row = communityMapper.updateByPrimaryKeySelective(community);
        if (row > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Boolean updateStatus(String status, Integer id) {
        Community community = new Community();
        community.setId(id);
        community.setStatus(status);
        int row = communityMapper.updateByPrimaryKeySelective(community);
        if (row > 0) {
            return true;
        } else {
            return false;
        }
    }
}
