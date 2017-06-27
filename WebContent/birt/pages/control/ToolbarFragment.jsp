<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" buffer="none" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.eclipse.birt.report.presentation.aggregation.IFragment,
				 org.eclipse.birt.report.resource.BirtResources,
				 org.eclipse.birt.report.utility.ParameterAccessor,
				 org.eclipse.birt.report.servlet.ViewerServlet" %>
<jsp:useBean id="fragment" type="org.eclipse.birt.report.presentation.aggregation.IFragment" scope="request" />
<jsp:useBean id="attributeBean" type="org.eclipse.birt.report.context.BaseAttributeBean" scope="request" />

<c:if test="${attributeBean.isShowToolbar()}">
		<ul id="toolbar"  class="nav navbar-nav navbar-left">
			<li>
				<a href="#" id="toc" title="${BirtResources.getHtmlMessage('birt.viewer.toolbar.toc')}">
					<i class="glyphicon glyphicon-th-list"></i>
				</a>
			</li>
			<li>
				<a href="#" id="parameter" title="${BirtResources.getHtmlMessage('birt.viewer.toolbar.parameter')}">
					<i class="glyphicon glyphicon-glass"></i>
				</a>
			</li>
			<li>
				<a href="#" id="export" title="${BirtResources.getHtmlMessage('birt.viewer.toolbar.export')}">
					<i class="glyphicon glyphicon-euro"></i>
				</a>
			</li>
			<li>
				<a href="#" id="exportReport" title="${BirtResources.getHtmlMessage('birt.viewer.toolbar.exportreport')}">
					<i class="glyphicon glyphicon-floppy-save"></i>
				</a>
			</li>
			<li>
				<a href="#" id="print" title="${BirtResources.getHtmlMessage('birt.viewer.toolbar.print')}">
					<i class="glyphicon glyphicon-print"></i>
				</a>
			</li>
		</ul>
</c:if>
		<div class="navbar-form navbar-right">
			<div class="form-group" style="margin-right:15px;color:#FFF;">
				第<span id='pageNumber'><%= ""+attributeBean.getReportPage() %></span>页，
				共<span id='totalPage'></span>页
			</div>
	    	<div class="form-group">
	          	<div class="input-group">
			      <input type="number" style="width:120px;" class="form-control" maxlength="4" id="gotoPage" placeholder="跳转到……">
			      <span class="input-group-btn">
			        <button class="btn btn-primary" type="button" name="goto" id="btnGoto">
			        	<span class="glyphicon glyphicon-play"></span>
			        </button>
			      </span>
			    </div>
	        </div>
	    </div>
		<ul class="nav navbar-nav navbar-right" id="navigationBar">
	       	<li>
	       		<a href="#" title="${BirtResources.getHtmlMessage('birt.viewer.navbar.first')}" id="first">
	       			<i class="glyphicon glyphicon-fast-backward"></i>
	       		</a>
	       	</li>
	       	<li>
	       		<a href="#" title="${BirtResources.getHtmlMessage('birt.viewer.navbar.previous')}" id="previous">
	       			<i class="glyphicon glyphicon-backward"></i>
	       		</a>
	       	</li>
	       	<li>
	       		<a href="#" title="${BirtResources.getHtmlMessage('birt.viewer.navbar.next')}" id="next">
	       			<i class="glyphicon glyphicon-forward"></i>
	       		</a>
	       	</li>
	       	<li>
	       		<a href="#" title="${BirtResources.getHtmlMessage('birt.viewer.navbar.last')}" id="last">
	       			<i class="glyphicon glyphicon-fast-forward"></i>
	       		</a>
	       	</li>
	    </ul>
	</div>
</nav>
