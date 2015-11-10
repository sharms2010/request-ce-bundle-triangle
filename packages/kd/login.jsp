<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="package/initialization.jspf" %>
<bundle:layout page="views/layouts/packageLayout.jsp">
    <bundle:variable name="head">
        <title>Kapp&nbsp;${app:escape(kapp.title)}&npsp;${resourceBundle.getString("auth.login.title")}</title>
    </bundle:variable>
        
    <div class="row">
        <div class="col-md-offset-2 col-xs-12 col-md-8"><h1>${app:escape(kapp.title)}&nbsp;${resourceBundle.getString("auth.login.title")}</h1></div>
    </div>
    <div class="row">
        <div class="col-md-offset-2 col-xs-12 col-md-8">
            <c:if test="${param.authentication_error != null}">
            <div class="alert alert-danger">${resourceBundle.getString("auth.login.messages.authentication_failed")}</div>
            </c:if>

            <c:if test="${not empty authorization_error}">
            <div class="alert alert-danger">${resourceBundle.getString("auth.login.messages.authorization_failed")}</div>
            </c:if>
        </div>
    </div>

    <div class="row">
        <div class="col-md-offset-2 col-xs-12 col-md-8">
            <p>
                Custom Kapp Login Form
            </p>
            <form action="<c:url value="/${space.slug}/app/login.do"/>" method="POST">
                <!-- CSRF Token field -->
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <!-- Kapp to login to -->
                <input type="hidden" name="j_kapp" value="${kapp.slug}"/>

                <!-- Username field -->
                <div class="form-group">
                    <label for="j_username">${resourceBundle.getString("auth.login.username")} asdf</label>
                    <input type="text" name="j_username" id="j_username" class="form-control" autofocus/>
                </div>

                <!-- Password field -->
                <div class="form-group">
                    <label for="j_password">${resourceBundle.getString("auth.login.password")}</label>
                    <input type="password" name="j_password" id="j_password" class="form-control" autocomplete="off"/>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-default">${resourceBundle.getString("auth.login.submit")}</button>
                </div>
            </form>
        </div>
    </div>
                
    <app:bodyContent/>
</bundle:layout>