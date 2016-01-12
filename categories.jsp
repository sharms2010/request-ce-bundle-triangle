<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>

<%
  String category = request.getParameter("category");
  request.setAttribute("category", category); 
%>

<bundle:layout page="layouts/layout.jsp">
  <c:import url="${bundle.path}/partials/shared/categoryNav.jsp" charEncoding="UTF-8"/>
    <bundle:variable name="head">
        <title>Kinetic Data ${text.escape(kapp.name)}</title>
    </bundle:variable>
    <bundle:scriptpack>
        <bundle:script src="${bundle.location}/js/categories.js" />
    </bundle:scriptpack>

<div class="container requests m-t-4 m-b-4">
    <div class="row m-b-4">
      <div class="hidden-xs hidden-sm col-md-4">
        <h1>${kapp.getCategory(category).name}</h1>
      </div>
    </div>
    <div class="grid">
      <c:forEach var="form" items="${kapp.getCategory(category).forms}">
          <div class="col-sm-3 rightside">
            <div class="panel panel-default">
              <div class="panel-heading  background-tertiary p-t-1">
              </div>
              <div class="panel-body text-center">
                <span class="fa-stack fa-4x center-block hidden-sm hidden-xs">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa ${form.getAttributeValue("fa-logo")} fa-stack-1x fa-inverse"></i>
                </span>
                <span class="fa-stack fa-3x center-block visible-sm-inline-block">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa ${form.getAttributeValue("fa-logo")} fa-stack-1x fa-inverse"></i>
                </span>
                <span class="fa-stack fa-2x center-block visible-xs-inline-block">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa ${form.getAttributeValue("fa-logo")} fa-stack-1x fa-inverse"></i>
                </span>
                <h3 class="font-light">${form.name}</h3>
                <a href="${bundle.spaceLocation}/${kapp.slug}/${form.slug}">
                  <button class="btn btn-primary m-t-1">START
                    <i class="icon-control-feedback fa fa-play"></i>
                  </button>
                </a>
              </div>
            </div>
          </div>
      </c:forEach>
  </div>
</div>

</bundle:layout>