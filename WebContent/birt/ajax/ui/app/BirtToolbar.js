/**
 *	BirtToolbar
 *	...
 */
BirtToolbar = Class.create( );

BirtToolbar.prototype = Object.extend( new AbstractBaseToolbar( ),
{
	/**
	 *	Initialization routine required by "ProtoType" lib.
	 *	@return, void
	 */
	initialize : function( id )
	{
		this.__initBase( id );
		this.__neh_click_closure = this.__neh_click.bindAsEventListener( this );
		this.__cb_installEventHandlers( );
	},

	/**
	 *	Binding data to the toolbar UI. Data includes zoom scaling factor.
	 *
	 *	@data, data DOM tree (schema TBD)
	 *	@return, void
	 */
	__cb_bind : function(data) {
	},

	/**
	 *	Install native/birt event handlers.
	 *  注册事件
	 *	@id, toolbar id (optional since there is only one toolbar)
	 *	@return, void
	 */
	__cb_installEventHandlers : function( )
	{
		var actions = this.__instance.querySelectorAll('.navbar-nav a'),
			len = actions.length
		//var oImgs = this.__instance.getElementsByTagName('INPUT');
		if(len > 0) {
			for(var i = 0; i < len; i++) {
				var item = actions.item(i);
				Event.observe(item, 'click', this.__neh_click_closure, false);
			}
		}
		/**
		if ( oImgs )
		{
			for ( var i = 0; i < oImgs.length; i++ )
			{
				if ( oImgs[i].type == 'image' )
				{
					Event.observe( oImgs[i], 'click', this.__neh_click_closure, false );
				}
			}
		}
		**/
	},
	
	/**
	 *	Handle native event 'click'.
	 *
	 *	@event, incoming browser native event
	 *	@return, void
	 */
	__neh_click : function(event)
	{
		var oBtn = Event.element(event);
		//	获取到A元素
		if(oBtn.tagName.toUpperCase() === 'I') {
			oBtn = oBtn.parentNode;
		}
		if (oBtn) {
			switch (oBtn.id)	{
				case 'print':
				{
					birtEventDispatcher.broadcastEvent( birtEvent.__E_PRINT );
					break;
				}				
				case 'printServer':
				{
					birtEventDispatcher.broadcastEvent( birtEvent.__E_PRINT_SERVER );
					break;
				}
				case 'exportReport':
				{
					birtEventDispatcher.broadcastEvent( birtEvent.__E_EXPORT_REPORT );
					break;
				}
				case 'export':
				{
					birtEventDispatcher.fireEvent( birtEvent.__E_QUERY_EXPORT );
					break;
				}
				case 'toc':
				{
					birtEventDispatcher.broadcastEvent( birtEvent.__E_TOC );
					break;
				}
				case 'parameter':
				{
					birtEventDispatcher.broadcastEvent( birtEvent.__E_PARAMETER );
					break;
				}
				default:
				{
					alert( oBtn.name );
					break;
				}	
			}
		}
	}
}
);