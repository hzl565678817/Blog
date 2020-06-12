package com.Donitz.service;

import java.util.ArrayList;
import javax.annotation.Resource;

import com.Donitz.entity.PingLun;
import org.springframework.stereotype.Service;
import com.Donitz.entity.Blog;
import com.Donitz.entity.UserInfo;

import com.Donitz.mapper.CommentMapper;

@Service
public class CommentService {

    @Resource
    CommentMapper commentMapper;
    /*每页显示记录数目*/
    private int rows = 10;
    ;

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    /*保存查询后总的页数*/
    private int totalPage;

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    /*保存查询到的总记录数*/
    private int recordNumber;

    public void setRecordNumber(int recordNumber) {
        this.recordNumber = recordNumber;
    }

    public int getRecordNumber() {
        return recordNumber;
    }

    /*添加博客评论记录*/
    public void addComment(PingLun pingLun) throws Exception {
        commentMapper.addComment(pingLun);
    }

    /*按照查询条件分页查询博客评论记录*/
    public ArrayList<PingLun> queryComment(Blog blogObj, UserInfo userObj, String commentTime, int currentPage) throws Exception {
        String where = "where 1=1";
        if (null != blogObj && blogObj.getBlogId() != null && blogObj.getBlogId() != 0)
            where += " and t_comment.blogObj=" + blogObj.getBlogId();
        if (null != userObj && userObj.getUser_name() != null && !userObj.getUser_name().equals(""))
            where += " and t_comment.userObj='" + userObj.getUser_name() + "'";
        if (!commentTime.equals("")) where = where + " and t_comment.commentTime like '%" + commentTime + "%'";
        int startIndex = (currentPage - 1) * this.rows;
        return commentMapper.queryComment(where, startIndex, this.rows);
    }

    /*按照查询条件查询所有记录*/
    public ArrayList<PingLun> queryComment(Blog blogObj, UserInfo userObj, String commentTime) throws Exception {
        String where = "where 1=1";
        if (null != blogObj && blogObj.getBlogId() != null && blogObj.getBlogId() != 0)
            where += " and t_comment.blogObj=" + blogObj.getBlogId();
        if (null != userObj && userObj.getUser_name() != null && !userObj.getUser_name().equals(""))
            where += " and t_comment.userObj='" + userObj.getUser_name() + "'";
        if (!commentTime.equals("")) where = where + " and t_comment.commentTime like '%" + commentTime + "%'";
        return commentMapper.queryCommentList(where);
    }

    /*查询所有博客评论记录*/
    public ArrayList<PingLun> queryAllComment() throws Exception {
        return commentMapper.queryCommentList("where 1=1");
    }

    /*当前查询条件下计算总的页数和记录数*/
    public void queryTotalPageAndRecordNumber(Blog blogObj, UserInfo userObj, String commentTime) throws Exception {
        String where = "where 1=1";
        if (null != blogObj && blogObj.getBlogId() != null && blogObj.getBlogId() != 0)
            where += " and t_comment.blogObj=" + blogObj.getBlogId();
        if (null != userObj && userObj.getUser_name() != null && !userObj.getUser_name().equals(""))
            where += " and t_comment.userObj='" + userObj.getUser_name() + "'";
        if (!commentTime.equals("")) where = where + " and t_comment.commentTime like '%" + commentTime + "%'";
        recordNumber = commentMapper.queryCommentCount(where);
        int mod = recordNumber % this.rows;
        totalPage = recordNumber / this.rows;
        if (mod != 0) totalPage++;
    }

    /*根据主键获取博客评论记录*/
    public PingLun getComment(int commentId) throws Exception {
        PingLun pingLun = commentMapper.getComment(commentId);
        return pingLun;
    }

    /*更新博客评论记录*/
    public void updateComment(PingLun pingLun) throws Exception {
        commentMapper.updateComment(pingLun);
    }

    /*删除一条博客评论记录*/
    public void deleteComment(int commentId) throws Exception {
        commentMapper.deleteComment(commentId);
    }

    /*删除多条博客评论信息*/
    public int deleteComments(String commentIds) throws Exception {
        String _commentIds[] = commentIds.split(",");
        for (String _commentId : _commentIds) {
            commentMapper.deleteComment(Integer.parseInt(_commentId));
        }
        return _commentIds.length;
    }
}
