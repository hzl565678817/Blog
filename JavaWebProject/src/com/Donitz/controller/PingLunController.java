package com.Donitz.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Donitz.entity.Blog;
import com.Donitz.entity.PingLun;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.Donitz.utils.ExportExcelUtil;
import com.Donitz.service.CommentService;
import com.Donitz.service.BlogService;
import com.Donitz.service.UserInfoService;
import com.Donitz.entity.UserInfo;

//Comment管理控制层
@Controller
@RequestMapping("/Comment")
public class PingLunController extends BasicController {

    /*业务层对象*/
    @Resource
    CommentService commentService;
    @Resource
    BlogService blogService;
    @Resource
    UserInfoService userInfoService;

    @InitBinder("blogObj")
    public void initBinderblogObj(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("blogObj.");
    }

    @InitBinder("userObj")
    public void initBinderuserObj(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("userObj.");
    }

    @InitBinder("pingLun")
    public void initBinderComment(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("pingLun.");
    }

    /*跳转到添加Comment视图*/
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model, HttpServletRequest request) throws Exception {
        model.addAttribute(new PingLun());
        /*查询所有的Blog信息*/
        List<Blog> blogList = blogService.queryAllBlog();
        request.setAttribute("blogList", blogList);
        /*查询所有的UserInfo信息*/
        List<UserInfo> userInfoList = userInfoService.queryAllUserInfo();
        request.setAttribute("userInfoList", userInfoList);
        return "Comment_add";
    }

    /*客户端ajax方式提交添加博客评论信息*/
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public void add(@Validated PingLun pingLun, BindingResult br,
                    Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String message = "";
        boolean success = false;
        if (br.hasErrors()) {
            message = "输入信息不符合要求！";
            writeJsonResponse(response, success, message);
            return;
        }
        commentService.addComment(pingLun);
        message = "博客评论添加成功!";
        success = true;
        writeJsonResponse(response, success, message);
    }

    /*ajax方式按照查询条件分页查询博客评论信息*/
    @RequestMapping(value = {"/list"}, method = {RequestMethod.GET, RequestMethod.POST})
    public void list(@ModelAttribute("blogObj") Blog blogObj, @ModelAttribute("userObj") UserInfo userObj, String commentTime, Integer page, Integer rows, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (page == null || page == 0) page = 1;
        if (commentTime == null) commentTime = "";
        if (rows != 0) commentService.setRows(rows);
        List<PingLun> pingLunList = commentService.queryComment(blogObj, userObj, commentTime, page);
        /*计算总的页数和总的记录数*/
        commentService.queryTotalPageAndRecordNumber(blogObj, userObj, commentTime);
        /*获取到总的页码数目*/
        int totalPage = commentService.getTotalPage();
        /*当前查询条件下总记录数*/
        int recordNumber = commentService.getRecordNumber();
        response.setContentType("text/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //将要被返回到客户端的对象
        JSONObject jsonObj = new JSONObject();
        jsonObj.accumulate("total", recordNumber);
        JSONArray jsonArray = new JSONArray();
        for (PingLun pingLun : pingLunList) {
            JSONObject jsonComment = pingLun.getJsonObject();
            jsonArray.put(jsonComment);
        }
        jsonObj.accumulate("rows", jsonArray);
        out.println(jsonObj.toString());
        out.flush();
        out.close();
    }

    /*ajax方式按照查询条件分页查询博客评论信息*/
    @RequestMapping(value = {"/listAll"}, method = {RequestMethod.GET, RequestMethod.POST})
    public void listAll(HttpServletResponse response) throws Exception {
        List<PingLun> pingLunList = commentService.queryAllComment();
        response.setContentType("text/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        JSONArray jsonArray = new JSONArray();
        for (PingLun pingLun : pingLunList) {
            JSONObject jsonComment = new JSONObject();
            jsonComment.accumulate("commentId", pingLun.getCommentId());
            jsonArray.put(jsonComment);
        }
        out.println(jsonArray.toString());
        out.flush();
        out.close();
    }

    /*前台按照查询条件分页查询博客评论信息*/
    @RequestMapping(value = {"/frontlist"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String frontlist(@ModelAttribute("blogObj") Blog blogObj, @ModelAttribute("userObj") UserInfo userObj, String commentTime, Integer currentPage, Model model, HttpServletRequest request) throws Exception {
        if (currentPage == null || currentPage == 0) currentPage = 1;
        if (commentTime == null) commentTime = "";
        List<PingLun> pingLunList = commentService.queryComment(blogObj, userObj, commentTime, currentPage);
        /*计算总的页数和总的记录数*/
        commentService.queryTotalPageAndRecordNumber(blogObj, userObj, commentTime);
        /*获取到总的页码数目*/
        int totalPage = commentService.getTotalPage();
        /*当前查询条件下总记录数*/
        int recordNumber = commentService.getRecordNumber();
        request.setAttribute("pingLunList", pingLunList);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("recordNumber", recordNumber);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("blogObj", blogObj);
        request.setAttribute("userObj", userObj);
        request.setAttribute("commentTime", commentTime);
        List<Blog> blogList = blogService.queryAllBlog();
        request.setAttribute("blogList", blogList);
        List<UserInfo> userInfoList = userInfoService.queryAllUserInfo();
        request.setAttribute("userInfoList", userInfoList);
        return "PingLun/comment_frontquery_result";
    }

    /*前台查询Comment信息*/
    @RequestMapping(value = "/{commentId}/frontshow", method = RequestMethod.GET)
    public String frontshow(@PathVariable Integer commentId, Model model, HttpServletRequest request) throws Exception {
        /*根据主键commentId获取Comment对象*/
        PingLun pingLun = commentService.getComment(commentId);

        List<Blog> blogList = blogService.queryAllBlog();
        request.setAttribute("blogList", blogList);
        List<UserInfo> userInfoList = userInfoService.queryAllUserInfo();
        request.setAttribute("userInfoList", userInfoList);
        request.setAttribute("pingLun", pingLun);
        return "PingLun/comment_frontshow";
    }

    /*ajax方式显示博客评论修改jsp视图页*/
    @RequestMapping(value = "/{commentId}/update", method = RequestMethod.GET)
    public void update(@PathVariable Integer commentId, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        /*根据主键commentId获取Comment对象*/
        PingLun pingLun = commentService.getComment(commentId);

        response.setContentType("text/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //将要被返回到客户端的对象
        JSONObject jsonComment = pingLun.getJsonObject();
        out.println(jsonComment.toString());
        out.flush();
        out.close();
    }

    /*ajax方式更新博客评论信息*/
    @RequestMapping(value = "/{commentId}/update", method = RequestMethod.POST)
    public void update(@Validated PingLun pingLun, BindingResult br,
                       Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String message = "";
        boolean success = false;
        if (br.hasErrors()) {
            message = "输入的信息有错误！";
            writeJsonResponse(response, success, message);
            return;
        }
        try {
            commentService.updateComment(pingLun);
            message = "博客评论更新成功!";
            success = true;
            writeJsonResponse(response, success, message);
        } catch (Exception e) {
            e.printStackTrace();
            message = "博客评论更新失败!";
            writeJsonResponse(response, success, message);
        }
    }

    /*删除博客评论信息*/
    @RequestMapping(value = "/{commentId}/delete", method = RequestMethod.GET)
    public String delete(@PathVariable Integer commentId, HttpServletRequest request) throws UnsupportedEncodingException {
        try {
            commentService.deleteComment(commentId);
            request.setAttribute("message", "博客评论删除成功!");
            return "message";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "博客评论删除失败!");
            return "error";

        }

    }

    /*ajax方式删除多条博客评论记录*/
    @RequestMapping(value = "/deletes", method = RequestMethod.POST)
    public void delete(String commentIds, HttpServletRequest request, HttpServletResponse response) throws IOException, JSONException {
        String message = "";
        boolean success = false;
        try {
            int count = commentService.deleteComments(commentIds);
            success = true;
            message = count + "条记录删除成功";
            writeJsonResponse(response, success, message);
        } catch (Exception e) {
            //e.printStackTrace();
            message = "有记录存在外键约束,删除失败";
            writeJsonResponse(response, success, message);
        }
    }

    /*按照查询条件导出博客评论信息到Excel*/
    @RequestMapping(value = {"/OutToExcel"}, method = {RequestMethod.GET, RequestMethod.POST})
    public void OutToExcel(@ModelAttribute("blogObj") Blog blogObj, @ModelAttribute("userObj") UserInfo userObj, String commentTime, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (commentTime == null) commentTime = "";
        List<PingLun> pingLunList = commentService.queryComment(blogObj, userObj, commentTime);
        ExportExcelUtil ex = new ExportExcelUtil();
        String _title = "Comment信息记录";
        String[] headers = {"回复id", "被评博客", "评论内容", "评论人", "评论时间"};
        List<String[]> dataset = new ArrayList<String[]>();
        for (int i = 0; i < pingLunList.size(); i++) {
            PingLun pingLun = pingLunList.get(i);
            dataset.add(new String[]{pingLun.getCommentId() + "", pingLun.getBlogObj().getTitle(), pingLun.getContent(), pingLun.getUserObj().getName(), pingLun.getCommentTime()});
        }
        /*
        OutputStream out = null;
		try {
			out = new FileOutputStream("C://output.xls");
			ex.exportExcel(title,headers, dataset, out);
		    out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		*/
        OutputStream out = null;//创建一个输出流对象
        try {
            out = response.getOutputStream();//
            response.setHeader("Content-disposition", "attachment; filename=" + "PingLun.xls");//filename是下载的xls的名，建议最好用英文
            response.setContentType("application/msexcel;charset=UTF-8");//设置类型
            response.setHeader("Pragma", "No-cache");//设置头
            response.setHeader("Cache-Control", "no-cache");//设置头
            response.setDateHeader("Expires", 0);//设置日期头
            String rootPath = request.getSession().getServletContext().getRealPath("/");
            ex.exportExcel(rootPath, _title, headers, dataset, out);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
