<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="package/initialization.jspf" %>

<%
  String category = request.getParameter("category");
  request.setAttribute("category", category); 
%>



<bundle:layout page="views/layouts/packageLayout.jsp">
    <bundle:variable name="head">
        <title>Kinetic Data ${app:escape(kapp.name)}</title>
    </bundle:variable>

<div class="container requests">
    <div class="row margin-bottom-40">
      <div class="hidden-xs hidden-sm col-md-4">
        <h1>${kapp.getCategory(category).name}</h1>
        
      </div>
    </div>
    <div class="grid">
      <c:forEach items="${kapp.getCategory(category).forms}" var="form">
          <div class="col-sm-3 rightside">
            <div class="panel panel-default">
              <div class="panel-heading">
              </div>
              <div class="panel-body text-center">
                <span class="fa-stack fa-4x center-block hidden-sm hidden-xs">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa ${form.getAttributeValue("Form FA logo")} fa-stack-1x fa-inverse"></i>
                </span>
                <span class="fa-stack fa-3x center-block visible-sm-inline-block">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa ${form.getAttributeValue("Form FA logo")} fa-stack-1x fa-inverse"></i>
                </span>
                <span class="fa-stack fa-2x center-block visible-xs-inline-block">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa ${form.getAttributeValue("Form FA logo")} fa-stack-1x fa-inverse"></i>
                </span>
                <h3><a href="${bundle.spaceLocation}/${kapp.slug}/${form.slug}">${form.name}</a></h3>
                <button class="btn btn-primary">START
                  <i class="icon-control-feedback fa fa-play"></i>
                </button>
              </div>
            </div>
          </div>
      </c:forEach>
  </div>
</div>

</bundle:layout>