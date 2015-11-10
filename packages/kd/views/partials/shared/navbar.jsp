<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../../package/initialization.jspf" %>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">

        <div class="navbar-header">
            <%-- Set a request attribute to pass to the JSP partial --%>
            <c:set  scope="request" var="target" value="#navbar-collapse-1"/>
            <c:import url="${bundle.path}/packages/catalog/views/partials/shared/navbar/navbarToggleNav.jsp" charEncoding="UTF-8"/>
            <%-- Remove the request attribute so it isn't used somewhere by accident --%>
            <c:remove scope="request" var="target"/>
            <a class="navbar-brand" href="${bundle.kappLocation}"><i class="fa ${app:escape(kapp.getAttributeValue('Image Class'))}"></i> ${app:escape(kapp.name)}</a>
        </div>

        <div class="collapse navbar-collapse" id="navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a class="btn btn-link dropdown-toggle" data-toggle="dropdown" href="#">
                      <span class="fa fa-3 fa-fw fa-th"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <c:forEach items="${space.kapps}" var="spaceKapp">
                            <li><a href="${bundle.spaceLocation}/${spaceKapp.slug}"><i class="fa ${app:escape(spaceKapp.getAttributeValue('Image Class'))} fa-fw"></i> ${app:escape(spaceKapp.name)}</a></li>
                        </c:forEach>
                    </ul>
                </li>
                <li>
                    <%-- <span class="btn btn-default" href="#"><i class="fa fa-user fa-fw"></i> ${app:escape(user.username)}</span> --%>
                    <a class="btn btn-link dropdown-toggle" data-toggle="dropdown" href="#">
                        <bundle:gravatar email="${app:escape(user.username)}" sz="24"></bundle:gravatar>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><i class="fa fa-pencil fa-fw"></i> Edit Profile</a></li>
                        <li class="divider"></li>
                        <li><a href="${bundle.spaceLocation}/app/"><i class="fa fa-dashboard fa-fw"></i> Management Console</a></li>
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/${space.slug}/app/logout?kapp=${kapp.slug}"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>

    </div>
</nav>
