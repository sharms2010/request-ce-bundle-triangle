<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<header class="header clearfix">
    <nav class="header__overlay m-b-0">
        <div class="container">
            <!-- logo -->
            <a href="${bundle.spaceLocation}/${kapp.slug}" class="navbar-brand p-a-0">
                <c:choose>
                    <c:when test="${not empty kapp.getAttributeValue('Company Name')}">
                        <h1 class="p-l-1 font-thin white line-height-70 font-size-50">${kapp.getAttributeValue("Company Name")}</h1>
                    </c:when>
                    <c:otherwise>
                        <h1 class="p-l-1 font-thin white line-height-70 font-size-50">${kapp.name}</h1>
                    </c:otherwise>
                </c:choose>
            </a>
            <!-- categories -->
            <div class="dropdown pull-right border-none m-a-0">
                <a id="categories" href="#" class="dropdown-toggle p-a-0" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                    <i class="fa fa-bars fa-3x icon__pad--y p-l-1"></i>
                </a>
                <ul class="dropdown-menu dropdown-menu-right">
                    <c:forEach var="kapps" items="${space.kapps}">
                    <li>
                        <a href="/kinetic/${space.slug}/${kapps.slug}">
                            <i class="fa ${kapps.getAttributeValue("fa-logo")} fa-fw fa-1x icon-black"></i>
                            <span>${kapps.name}</span>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            <!-- Profile -->
            <div class="dropdown pull-right border-none m-a-0 p-a-1">
                <a id="profile" href="#" class="dropdown-toggle p-a-0" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                    <div class="avatar line-height-50">
                        <bundle:gravatar email="${identity.username}" sz="48" >
                        </bundle:gravatar>
                    </div>
                </a>
                <div class="dropdown-menu dropdown-menu-right p-a-1">
                    <p class="font-medium m-b-0">${identity.username}</p>
                    <div class="navAccount font-medium">
                        <a href="${bundle.spaceLocation}/${kapp.slug}?page=profile">Your Account</a>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>