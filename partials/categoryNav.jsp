<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<div class="nav">
    <div class="container">
        <div class="row">
            <ul>
                <c:forEach items="${kapp.categories}" var="category">
                    <c:if test="${fn:toLowerCase(category.getAttribute('Hidden').value) ne 'true' && not empty category.forms}">
                        <li class="col-sm-odd col-xs-odd">
                            <span class="fa-stack fa-2x center-block hidden-xs">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa ${category.getAttributeValue("fa-logo")} fa-stack-1x fa-inverse"></i>
                            </span>
                            <a class="hidden-xs" href="${bundle.spaceLocation}/${kapp.slug}?page=categories&category=${category.name}">${category.name} </a>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>