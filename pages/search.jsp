<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<bundle:layout page="${bundle.path}/layouts/layout.jsp">

    <bundle:variable name="head">
        <title>${text.escape(space.name)} Search</title>
    </bundle:variable>

    <div class="container input-field">
        <div class="page-header">
            <h1>Search Results</h1>
            <form action="${bundle.kappLocation}" method="GET" role="form">
                <div class="input-group">
                    <input id="search" autocomplete="off" type="text" class="form-control" name="q">
                    <input type="hidden" value="search" name="page">
                    <span class="input-group-btn">
                        <button id="search-button" class="btn btn-default" type="button">
                            <i id="search-icon" class="fa fa-search"></i>
                        </button>
                    </span>
                </div><!-- /input-group -->
            </form>  
        </div>
                
        <div class="search-results">
            <c:if test="${text.isNotBlank(param['q'])}">
                <c:set scope="request" var="formsMatchSearch" value="${SearchHelper.filter(kapp.forms,param['q'])}"/>
                <ul class="list-unstyled">
                    <c:forEach var="form" items="${formsMatchSearch}">
                        <c:if test="${text.equals(form.type.name, 'Service') || text.equals(form.type.name, 'Template')}">
                            <li>
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3><a href="${bundle.kappLocation}/${form.slug}">${form.name}</a></h3>
                                    </div>
                                    <div class="panel-body">${form.description}</div>
                                </div>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </c:if>
        </div>
    </div>
</bundle:layout>

