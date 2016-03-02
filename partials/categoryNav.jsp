<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<div class="nav">
    <div class="container">
        <div class="row ">
            <ul class="nav__list">
                <c:forEach end="4" var="category"  items="${kapp.categories}">
                    <c:if test="${fn:toLowerCase(category.getAttribute('Hidden').value) ne 'true' && not empty category.forms}">
                        <li>
                            <span class="fa-stack fa-2x center-block">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa ${category.getAttributeValue("Icon")} fa-stack-1x fa-inverse"></i>
                            </span>
                            <a href="${bundle.spaceLocation}/${kapp.slug}?page=category&category=${category.name}">${category.name} </a>
                        </li>
                    </c:if>
                </c:forEach>
                <li >
                    <span class="fa-stack fa-2x center-block">
                        <i class="fa fa-circle fa-stack-2x"></i>
                        <i class="fa fa-ellipsis-h fa-stack-1x fa-inverse"></i>
                    </span>
                   <a href="${bundle.spaceLocation}/${kapp.slug}?page=categories">view all</a>
                </li>
            </ul>
        </div>
    </div>
</div>