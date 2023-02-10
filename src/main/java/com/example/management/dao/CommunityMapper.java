package com.example.management.dao;

import com.example.management.domain.Community;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

@Repository
public interface CommunityMapper extends Mapper<Community> {
}
