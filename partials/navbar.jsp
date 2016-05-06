<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<header class="header clearfix">
    <nav class="header__overlay m-b-0">
        <div class="container">
            <!-- logo -->
            <c:if test="${kapp != null}">
                <a href="${bundle.kappLocation}" class="navbar-brand p-a-0">
                     <!-- if the kapp has an attribute with the name Logo Url and there is a value associated to that value then the image will display
                          if Logo Url is false then a attribute with the name Company Name is looked for if true then the string is displayed
                          if Logo Url is false and Company Name is false then the kapp mane is displayed. -->
                    <c:choose>   
                        <c:when test="${kapp.hasAttribute('Logo Url') && not empty kapp.getAttributeValue('Logo Url')}">
                            <img class="header__image" src="${kapp.getAttributeValue('Logo Url')}" alt="logo">
                        </c:when>
                        <c:when test="${kapp.hasAttribute('Company Name') && not empty kapp.getAttributeValue('Company Name')}">
                            <h1 class="p-l-1 font-thin white line-height-70 font-size-50">${kapp.getAttributeValue("Company Name")}</h1>
                        </c:when>
                        <c:otherwise>
                            <h1 class="p-l-1 font-thin white line-height-70 font-size-50">${kapp.name}</h1>
                        </c:otherwise>
                    </c:choose>
                </a>
            </c:if>
            <!-- categories -->
            <div class="dropdown pull-right border-none m-a-0">
                <a id="categories" href="#" class="dropdown-toggle p-a-0" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                    <i class="fa fa-bars fa-3x icon__pad--y p-l-1"></i>
                </a>
                <ul class="dropdown-menu dropdown-menu-right">
                    <c:forEach var="kapps" items="${space.kapps}">
                    <li>
                        <a href="/kinetic/${space.slug}/${kapps.slug}">
                            <i class="fa ${kapps.getAttributeValue("Icon")} fa-fw fa-1x icon-black"></i>
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
                    <c:choose>
                        <c:when test="${identity.anonymous}">
                            <div class="navAccount font-medium">
                                <c:if test="${kapp == null}">
                                    <a href="${bundle.spaceLocation}/app/login">Login</a>
                                </c:if>
                                <c:if test="${kapp != null}">
                                    <a href="${bundle.spaceLocation}/app/login?kapp=${kapp.slug}">Login</a>
                                </c:if>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <p class="font-medium m-b-0">${identity.username}</p>
                            <div class="navAccount font-medium">
                                <%-- if kapp null--%>
                                <c:if test="${kapp == null}">
                                    <a href="${bundle.spaceLocation}?page=profile">Your Account</a>
                                </c:if>
                                <c:if test="${kapp != null}">
                                    <a href="${bundle.spaceLocation}/${kapp.slug}?page=profile">Your Account</a>
                                </c:if>
                            </div>
                            <div class="navAccount font-medium">

                                <c:choose>
                                    <c:when test='${kapp != null}'>
                                        <a href='${bundle.spaceLocation}/app/logout?kapp=${kapp.slug}' role='menuitem' tabindex='-1'>Logout</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href='${bundle.spaceLocation}/app/logout' role='menuitem' tabindex='-1'>Logout</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>
</header>