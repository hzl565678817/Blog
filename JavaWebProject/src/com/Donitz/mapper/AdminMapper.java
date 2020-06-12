package com.Donitz.mapper;


import com.Donitz.entity.Admin;

public interface AdminMapper {

    public Admin findAdminByUserName(String username) throws Exception;

    public void changePassword(Admin admin) throws Exception;


}
