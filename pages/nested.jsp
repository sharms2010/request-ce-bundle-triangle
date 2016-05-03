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
        <ul>
            <c:forEach var="category" items="${CategoryHelper.getCategories(kapp)}">
                <li>
                    ${text.escape(category.getName())}
                    <ul>
                        <%-- Recursive Subcatgegories --%>
                        <c:set scope="request" var="currentCat" value="${category}"/>
                        <c:import url="${bundle.path}/partials/subCategory.jsp" charEncoding="UTF-8" />
                    </ul>
                </li>
            </c:forEach>
        </ul>
    </div>
</bundle:layout>