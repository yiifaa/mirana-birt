/**
 *	BirtNavigationBar
 *	...
 */
BirtNavigationBar = Class.create();
BirtNavigationBar.prototype = Object.extend(new AbstractUIComponent(),
{
	_IMAGE_PATH : "birt/images/",
	_IMAGE_EXTENSION : ".gif",
	_IMAGE_FIRST_PAGE : !rtl?"FirstPage":"LastPage",
	_IMAGE_LAST_PAGE : !rtl?"LastPage":"FirstPage",
	_IMAGE_PREVIOUS_PAGE : !rtl?"PreviousPage":"NextPage",
	_IMAGE_NEXT_PAGE : !rtl?"NextPage":"PreviousPage",
	_IMAGE_DISABLED_SUFFIX : "_disabled",
	
	/**
	 *	Total number of pages.
	 */
	__oTotalPage : null,
	
	/**
	 *	Current page number.
	 */
	__oPageNumber : null,
	
	/**
	 *	Initialization routine required by "ProtoType" lib.
	 *	@return, void
	 */
	initialize : function(id)
	{
		this.__initBase(id);
		this.__oPageNumber = $('pageNumber');
		this.__oTotalPage = $('totalPage');
		this.__cb_installEventHandlers();
	},

	/**
	 *	Binding data to the navigation bar UI. Data includes page number, total
	 *	page number (optional).
	 *
	 *	@data, data DOM tree (Schema TBD)
	 *	@return, void
	 */
	__cb_bind : function(data)
	{
		if (!data) {
			return;
		}
		//	解析获取的数据
		var oPageNumbers = data.getElementsByTagName('PageNumber'),
			oTotalPages = data.getElementsByTagName('TotalPage');
		if (!oPageNumbers && !oPageNumbers[0]) {
			return;
		}
		//	设置页面内容
		this.__oPageNumber.innerHTML = oPageNumbers[0].firstChild.data;
		this.__oTotalPage.innerHTML = (oTotalPages && oTotalPages[0])? oTotalPages[0].firstChild.data : '+';
		//	反过来从页面解析内容？
		var pageNumber = parseInt(this.__oPageNumber.firstChild.data);
		var totalPage = (this.__oTotalPage.firstChild.data == '+')? '+' : parseInt(this.__oTotalPage.firstChild.data);
		//	设置分页信息
		var oImgs = this.__instance.querySelectorAll('a');
		var isFirstPage = !(pageNumber > 1);
		var isLastPage = !(totalPage == '+' || pageNumber < totalPage);
		//	设置分页按钮状态
		if(!isFirstPage) {
			oImgs[0].removeAttribute('disabled')
			oImgs[1].removeAttribute('disabled')
		} else {
			oImgs[0].setAttribute('disabled', 'disabled')
			oImgs[1].setAttribute('disabled', 'disabled')
		}
		
		//	设置分页按钮状态
		if(!isLastPage) {
			oImgs[2].removeAttribute('disabled')
			oImgs[3].removeAttribute('disabled')
		} else {
			oImgs[2].setAttribute('disabled', 'disabled')
			oImgs[3].setAttribute('disabled', 'disabled')
		}
		
		/**
		oImgs[0].style.cursor = (!isFirstPage)? "pointer" : "default";
		oImgs[1].style.cursor = (!isFirstPage)? "pointer" : "default";
		oImgs[2].style.cursor = (!isLastPage)? "pointer" : "default";
		oImgs[3].style.cursor = (!isLastPage)? "pointer" : "default";
		
		oImgs[0].src = this._getImageFileName(this._IMAGE_FIRST_PAGE, isFirstPage);
		oImgs[1].src = this._getImageFileName(this._IMAGE_PREVIOUS_PAGE, isFirstPage);
		oImgs[2].src = this._getImageFileName(this._IMAGE_NEXT_PAGE, isLastPage);
		oImgs[3].src = this._getImageFileName(this._IMAGE_LAST_PAGE, isLastPage);
		**/		
	},
	
	_getImageFileName : function(base, disabled)
	{
		return this._IMAGE_PATH + base + (disabled?this._IMAGE_DISABLED_SUFFIX:"") + this._IMAGE_EXTENSION;
	},
	
	/**
	 *	Install native/birt event handlers.
	 *
	 *	@id, navigation bar id (optional since there is only one nav bar)
	 *	@return, void
	 */
	__cb_installEventHandlers : function()
	{
		var oImgs = this.__instance.querySelectorAll('a');		
		if (oImgs)
		{
			for (var i = 0; i < oImgs.length; i++)
			{
				Event.observe(oImgs[i], 'click', this.__neh_click.bindAsEventListener(this), false);
			}
		}
		
		// Observe "keydown" event
		this.keydown_closure = this.__neh_keydown.bindAsEventListener(this);
		Event.observe($('gotoPage'), 'keydown', this.keydown_closure, false);
		//	注册分页按钮
		var _this = this;
		jQuery('#btnGoto').on('click', function() {
			_this.__gotoGage();
		});
	},

	/**
	 *	Handle press "Enter" key.
	 *
	 *	@event, incoming browser native event
	 *	@return, void
	 */
	__neh_keydown: function(event)
	{
		// If press 'Enter' key
		if(event.keyCode == 13)
		{
			this.__gotoGage();
			Event.stop(event);
		}
	},	

	/**
	 *	Handle clicking 'Goto' event.
	 *
	 *	@return, void
	 */	
	__gotoGage : function()
	{
		var iPageNo = -1;
		var totalPage = (this.__oTotalPage.firstChild.data == '+')? '+' : parseInt(this.__oTotalPage.firstChild.data);
		
		var oGotoPage = $('gotoPage');
		var pageNo = oGotoPage.value;
		if (pageNo != null && birtUtility.trim(pageNo).length > 0)
		{
			iPageNo = parseInt(pageNo);
		}
		if (iPageNo > 0 && iPageNo <= totalPage)
		{
			birtEventDispatcher.broadcastEvent(birtEvent.__E_GETPAGE, { name : Constants.PARAM_PAGE, value : oGotoPage.value });
		}
		else
		{			
			alert(Constants.error.invalidPageNumber);
			oGotoPage.focus();
		}
	},
	
	/**
	 *	Handle native event 'click'.
	 *
	 *	@event, incoming browser native event
	 *	@return, void
	 */
	__neh_click : function(event)
	{
		var pageNumber = parseInt(this.__oPageNumber.firstChild.data);
		var totalPage = (this.__oTotalPage.firstChild.data == '+')? '+' : parseInt(this.__oTotalPage.firstChild.data);
		
		var oBtn = Event.element(event);
		//	获取到A元素，如果点击到子元素
		if(oBtn.tagName.toUpperCase() === 'I') {
			oBtn = oBtn.parentNode;
		}
		if (oBtn)
		{
			switch (oBtn.id)
			{
   				case 'first':
 				{
 					if (pageNumber > 1)
 					{
						birtEventDispatcher.broadcastEvent(birtEvent.__E_GETPAGE, { name : Constants.PARAM_PAGE, value : 1 });
					}
 					break;
 				}
   				case 'previous':
 				{
 					if (pageNumber > 1)
 					{
						birtEventDispatcher.broadcastEvent(birtEvent.__E_GETPAGE, { name : Constants.PARAM_PAGE, value : pageNumber - 1 });
					}
 					break;
 				}
   				case 'next':
 				{
 					if (totalPage == '+' || pageNumber < totalPage)
 					{
	 					birtEventDispatcher.broadcastEvent(birtEvent.__E_GETPAGE, { name : Constants.PARAM_PAGE, value : pageNumber + 1 });
 					}
 					break;
 				}
   				case 'last':
 				{
 					if (totalPage == '+' || pageNumber < totalPage)
 					{
 						birtEventDispatcher.broadcastEvent(birtEvent.__E_GETPAGE, { name : Constants.PARAM_PAGE, value : totalPage });
 					}
 					break;
 				}
   				case 'goto':
   				{
   					this.__gotoGage();
   					break;
   				}
				default:
				{
					break;
				}	
			}
		}
	},
	
	__get_current_page : function()
	{
		return this.__oPageNumber.innerHTML;
	},
	
	/**
	 * Load current page. Triggered by init.
	 */
	__init_page : function()
	{
		if(birtParameterDialog.collect_parameter())
		{			
			if (this.__oPageNumber.firstChild)
			{
				var pageNumber = parseInt(this.__oPageNumber.firstChild.data);
				birtEventDispatcher.broadcastEvent(birtEvent.__E_GETPAGE_INIT, { name : Constants.PARAM_PAGE, value : pageNumber });
			}
			else
			{
				birtEventDispatcher.broadcastEvent(birtEvent.__E_GETPAGE_INIT);
			}
		}
	}
}
);