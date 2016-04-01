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
                <bundle:style src="${bundle.location}/libraries/jquery-datatables/media/css/jquery.dataTables.css" />
                <bundle:style src="${bundle.location}/libraries/jquery-datatables/extensions/Responsive/css/responsive.dataTables.css" />
                <bundle:style src="${bundle.location}/css/master.css "/>
                <bundle:style src="${bundle.location}/css/temp.css"/>
                <bundle:style src="${bundle.location}/libraries/font-awesome/css/font-awesome.css"/>
            </bundle:stylepack>

          <%--  <link href="${bundle.location}/libraries/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
           --%>
            <bundle:scriptpack>
                <bundle:script src="${bundle.location}/libraries/moment/moment.js" />
                <bundle:script src="${bundle.location}/libraries/moment/moment-timezone.js" />
                <bundle:script src="${bundle.location}/libraries/jquery-datatables/media/js/jquery.dataTables.js" />
                <bundle:script src="${bundle.location}/libraries/jquery-datatables/extensions/Responsive/js/dataTables.responsive.js" />
                <bundle:script src="${bundle.location}/libraries/kd-search/search.js" />
                <bundle:script src="${bundle.location}/js/searchConfig.js" />
                <bundle:script src="${bundle.location}/libraries/jquery/jquery.min.js" />
                <bundle:script src="${bundle.location}/libraries/bootstrap/bootstrap.min.js" />
                <bundle:script src="${bundle.location}/libraries/notifie/jquery.notifie.js" />
                <bundle:script src="${bundle.location}/js/common.js" />
            </bundle:scriptpack>

            <script src="${bundle.location}/libraries/typeahead/typeahead.js/bloodhound.js"></script>
            <script src="${bundle.location}/libraries/typeahead/typeahead.js/typeahead.jquery.js"></script>
            <script src="${bundle.location}/libraries/typeahead/typeahead.js/typeahead.bundle.js"></script>
            <script src="${bundle.location}/libraries/typeahead/typeahead-front.js"></script>

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
               <c:import url="${bundle.path}/login.jsp" charEncoding="UTF-8"/>
            </c:if>
        </div>
        <c:import url="${bundle.path}/partials/footer.jsp" charEncoding="UTF-8"/>
    </body>
</html>