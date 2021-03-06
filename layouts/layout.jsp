<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" sizes="76x76" href="${bundle.location}/images/apple-touch-icon.png">
        <link rel="icon" type="image/png" href="${bundle.location}/images/android-chrome-96x96.png" sizes="96x96">
        <link rel="icon" type="image/png" href="${bundle.location}/images/favicon-32x32.png" sizes="32x32">
        <link rel="icon" type="image/png" href="${bundle.location}/images/favicon-96x96.png" sizes="96x96">
        <link rel="icon" type="image/png" href="${bundle.location}/images/favicon-16x16.png" sizes="16x16">
        <link rel="shortcut icon" href="${bundle.location}/images/favicon.ico" type="image/x-icon"/>
        <app:headContent/>

            <%-- Bundle stylepack and scriptpack create a minified and single file of referanced stylesheet and javascript
            Add ?debugjs to the end of your URL to view individual files --%>

            <bundle:stylepack>
                <bundle:style src="${bundle.location}/libraries/bootstrap/bootstrap.min.css" />
                <bundle:style src="${bundle.location}/libraries/notifie/jquery.notifie.css" />
                <bundle:style src="${bundle.location}/libraries/dataTables/media/css/jquery.dataTables.min.css" />
                <bundle:style src="${bundle.location}/css/master.css "/>
            </bundle:stylepack>

            <!-- DataTables CSS-->
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.0.0/css/responsive.dataTables.min.css">
            <!-- DataTables JS-->
            <script type='text/javascript' src='https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js'></script>
            <script type='text/javascript' src='https://cdn.datatables.net/responsive/2.0.0/js/dataTables.responsive.min.js'></script>

            <link href="${bundle.location}/libraries/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
            <link rel="stylesheet" type="text/css" href="${bundle.location}/css/temp.css"/>
            <bundle:scriptpack>
                <bundle:script src="${bundle.location}/libraries/moment/moment.js" />
                <bundle:script src="${bundle.location}/libraries/moment/moment-timezone.js" />
                <bundle:script src="${bundle.location}/libraries/kd-search/search.js" />
                <bundle:script src="${bundle.location}/libraries/jquery/jquery.min.js" />
                <bundle:script src="${bundle.location}/libraries/bootstrap/bootstrap.min.js" />
                <bundle:script src="${bundle.location}/libraries/notifie/jquery.notifie.js" />
                <bundle:script src="${bundle.location}/libraries/jquery-datatables/jquery.dataTables.js" />
                <bundle:script src="${bundle.location}/js/common.js" />
                <bundle:script src="${bundle.location}/js/searchConfig.js" />
            </bundle:scriptpack>

            <script src="${bundle.location}/libraries/typeahead/typeahead.js/bloodhound.js"></script>
            <script src="${bundle.location}/libraries/typeahead/typeahead.js/typeahead.jquery.js"></script>
            <script src="${bundle.location}/libraries/typeahead/typeahead.js/typeahead.bundle.js"></script>
            <script src="${bundle.location}/libraries/typeahead/typeahead-front.js"></script>
            <%--
            <script src="${bundle.location}/libraries/dataTables/media/js/jquery.dataTables.js" ></script>
            <script src="${bundle.location}/libraries/dataTables/media/js/dataTables.bootstrap.js" ></script>
            <script src="${bundle.location}/libraries/dataTables/media/js/dataTables.foundation.js" ></script>
            <script src="${bundle.location}/libraries/dataTables/media/js/dataTables.jqueryui.js" ></script>
            <script src="${bundle.location}/libraries/dataTables/extensions/Responsive/js/dataTables.responsive.js" ></script>
            <script src="${bundle.location}/libraries/dataTables/extensions/Responsive/js/responsive.bootstrap.js" ></script>
            <script src="${bundle.location}/libraries/dataTables/extensions/Responsive/js/responsive.foundation.js" ></script>
            <script src="${bundle.location}/libraries/dataTables/extensions/Responsive/js/responsive.jqueryui.js" ></script>
            --%>
            <bundle:yield name="head"/>
    </head>
    <body>
        <%--This is a work around to get localization--%>
        <c:if test="${empty sessionScope.timezone}">
            <script>
            $(document).ready(function() {
                $.ajax({
                    type : "get",
                    url : "?partial=setlocale",
                    data: {"timezone":moment.tz.guess()}
                });
            });
            </script>
        </c:if>
            
        <c:import url="${bundle.path}/partials/navbar.jsp" charEncoding="UTF-8"/>
        <div class="temp">
            <c:if test="${identity.anonymous != 'true'}">
                <bundle:yield/>
            </c:if>
            <c:if test="${identity.anonymous}">
                <%-- this is a work around for login redirect--%>
                <div class="container">
                    <form action="<c:url value="/${space.slug}/app/login.do"/>" method="POST">
                        <!-- CSRF Token field -->
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

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
                </div>

                <script>        
                $.fn.serializeObject = function()
                    {
                    var obj = {};
                    var arr = this.serializeArray();
                    $.each(arr, function() {
                        if (obj[this.name] !== undefined) {
                            if (!obj[this.name].push) {
                                obj[this.name] = [obj[this.name]];
                            }
                            obj[this.name].push(this.value || '');
                        } else {
                            obj[this.name] = this.value || '';
                        }
                    });
                    return obj;
                };

                $(function() {
                    $('#submit').click(function() {
                        var data = JSON.stringify($('form').serializeObject());
                         $.ajax({
                            method: 'post',
                            dataType: 'json',
                            contentType: 'application/json',
                            url: '/kinetic/${space.slug}/app/login.do',
                            data: data,
                            success: function(data, textStatus, jqXHR){
                               window.location = "${kapp.slug}"
                               console.log('success')
                            },
                            error: function(jqXHR, textStatus, errorThrown){
                                console.log('error')
                            },
                        });

                    });
                });
                </script>
            </c:if>
        </div>
        <c:import url="${bundle.path}/partials/footer.jsp" charEncoding="UTF-8"/>
    </body>
</html>