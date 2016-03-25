<%@include file="bundle/initialization.jspf" %>
<bundle:layout page="layouts/layout.jsp">
    <bundle:variable name="head">
        <title>${test.escape(kapp.name)} Login</title>
    </bundle:variable>
    <div class="container">
        <form action="<c:url value="/${space.slug}/app/login.do"/>" method="post">
            <!-- CSRF Token field -->
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <!-- Username field -->
            <div class="form-group">
              <label for="j_username">${resourceBundle.getString('auth.login.username')}</label>
              <input type="text" name="j_username" id="j_username" class="form-control" autofocus/>
            </div>

            <!-- Password field -->
            <div class="form-group">
              <label for="j_password">${resourceBundle.getString('auth.login.password')}</label>
              <input type="password" name="j_password" id="j_password" class="form-control" autocomplete="off"/>
            </div>

            <div class="form-group">
              <button id="submit" type="submit" class="btn btn-default">Login</button>
            </div>
        </form>
    </div>
</bundle:layout>
