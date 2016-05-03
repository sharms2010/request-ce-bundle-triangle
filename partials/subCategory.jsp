<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<c:forEach var="subcategory" items="${currentCat.getSubcategories()}">
    <li>
        ${text.escape(subcategory.getName())}
        <ul>
            <c:set var="currentCat" value="${subcategory}" scope="request"/>
            <jsp:include page="subCategory.jsp"/>
        </ul>
    </li>
</c:forEach>