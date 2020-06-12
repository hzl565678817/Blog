
$(function () {
	
	$('#nav').tree({
		//url : 'Nav/Nav_queryNavById.action', 
		lines : true,
		onLoadSuccess : function (node, data) {
			if (data) {
				$(data).each(function (index, value) {
					if (this.state == 'closed') {
						$('#nav').tree('expandAll');
					}
				});
			}
		},
		
		data: 
			[{
		       text: "博客分类管理",
			       state: "closed",
			       iconCls: "icon-system",
			       children:
			    	   [{
			    		    text: "添加博客分类",
			    		    state: "open",
			    		    iconCls: "icon-add-new",
			    		    url: "BlogClass/blogClass_add.jsp"
			    	   	}
			    	   ]
			},{
		       text: "博客管理",
			       state: "closed",
			       iconCls: "icon-system",
			       children:
			    	   [{
			    		    text: "添加博客",
			    		    state: "open",
			    		    iconCls: "icon-add-new",
			    		    url: "Blog/blog_add.jsp"
			    	   	}
			    	   ]
			},{
		       text: "博客评论管理",
			       state: "closed",
			       iconCls: "icon-system",
			       children:
			    	   [{
			    		    text: "添加博客评论",
			    		    state: "open",
			    		    iconCls: "icon-add-new",
			    		    url: "Comment/comment_add.jsp"
			    	   	}
			    	   ]
			},{
			       text: "系统管理",
			       state: "closed",
			       iconCls: "icon-system",
			       children:
			    	   [{
			    		    text: "修改密码",
			    		    state: "open",
			    		    iconCls: "icon-edit",
			    		    url: "password_modify.jsp"
			    	   	}
			    	   ]
			}],
		onClick : function (node) {
			if (node.url) {
				if ($('#tabs').tabs('exists', node.text)) {
					$('#tabs').tabs('select', node.text);
				} else {
					$('#tabs').tabs('add', {
						title : node.text,
						iconCls : node.iconCls,
						closable : true,
						href : node.url,
						//content: '<iframe name="mainFrame" scrolling="auto" frameborder="0"  src="' + node.url + '" style="width:100%;height:100%;"></iframe>'
					});
				} 
			}
		}
	});
	
	$('#tabs').tabs({
		fit : true,
		border : false, 
		//width: $("#tabs").parent().width()-100,  
	});


	$(window).resize(function () {
		$('#tabs').tabs({ 
			height: "auto"
		});  
	});
});
