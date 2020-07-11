package com.ncs.service;

import com.ncs.mapper.CommonMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommonServiceImpl implements  CommonService {

    @Autowired
    CommonMapper commonMapper;

    @Override
    public int dobe(String userid) {
        return commonMapper.dobe(userid);
    }
}
