package com.Donitz.mapper;


import com.Donitz.entity.Admin;
import com.Donitz.entity.Logs;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {

    public Admin findAdminByUserName(String username) throws Exception;

    public void changePassword(Admin admin) throws Exception;

    public void insertLogin(@Param("username")String username) throws Exception;
    public List<Logs> selectLog() throws Exception;
}
