<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<bundle:layout page="layouts/layout.jsp">
    <bundle:variable name="head">
        <title>${test.escape(kapp.name)} Login</title>
    </bundle:variable>
    <div class="container m-y-4">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <h1>Login</h1>
                <form action="<c:url value="${bundle.spacePath}/app/login.do"/>" method="POST">
                    <!-- CSRF Token field -->
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <!-- Space to login to -->
                    <input type="hidden" name="j_space" value="${space.slug}"/>
                    <!-- Kapp to login to -->
                    <input type="hidden" name="j_kapp" value="${kapp.slug}"/>
                    <!-- Username field -->
                    <div class="form-group">
                        <label for="j_username">Username</label>
                        <input type="text" name="j_username" id="j_username" class="form-control" autofocus/>
                    </div>
                    <!-- Password field -->
                    <div class="form-group">
                        <label for="j_password">Password</label>
                        <input type="password" name="j_password" id="j_password" class="form-control" autocomplete="off"/>
                    </div>
                    <div class="form-group">
                        <button id="submit" type="submit" class="btn btn-default">Login</button>
                    </div>
                </form>
                <%--
                    Display error message if authentication error is found in 
                    URL.  This happens if login credentials are invalid.
                --%>
                <c:if test="${param.authentication_error != null}">
                    <script>
                        $('form').notifie({
                            type:'alert',
                            severity:'info',
                            message:'Invalid username or password.'
                        });
                    </script>
                </c:if>
            </div>
        </div>
    </div>
</bundle:layout>
