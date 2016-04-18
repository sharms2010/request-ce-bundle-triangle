<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <c:import url="${bundle.path}/partials/categoryNav.jsp" charEncoding="UTF-8"/>
    <bundle:variable name="head">
        <title>Kinetic Data ${text.escape(kapp.name)}</title>
    </bundle:variable>
    <bundle:scriptpack>
        <bundle:script src="${bundle.location}/js/categories.js" />
    </bundle:scriptpack>
    <div class="container m-y-4">
        <div class="row m-b-4">
            <div class="hidden-xs hidden-sm col-md-4">
                <h1>All Categories</h1>
            </div>
        </div>
        <div class="grid">
            <c:forEach var="category" items="${kapp.categories}">
                <div class="col-sm-3 rightside">
                    <div class="panel panel-default">
                        <div class="panel-heading  background-tertiary p-t-1">
                        </div>
                        <div class="panel-body text-center">
                            <span class="fa-stack center-block icon--size">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa ${category.getAttributeValue("Icon")} fa-stack-1x fa-inverse"></i>
                            </span>
                            <h3 class="font-light max-min-height">${category.name}</h3>
                            <a href="${bundle.spaceLocation}/${kapp.slug}?page=category&category=${category.slug}">
                                <button class="btn btn-primary m-t-1">Find a Form
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