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
        <bundle:stylepack>
            <bundle:style src="${bundle.location}/libraries/bootstrap/bootstrap.min.css" />
            <bundle:style src="${bundle.location}/css/bundle.css" />
        </bundle:stylepack>

        <link href="${bundle.location}/libraries/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

        <bundle:scriptpack>
            <bundle:script src="${bundle.location}/libraries/jquery/jquery.min.js" />
            <bundle:script src="${bundle.location}/libraries/bootstrap/bootstrap.min.js" />
            
        </bundle:scriptpack>

        <bundle:stylepack>
            <bundle:style src="${bundle.location}/css/common.css "/>
        </bundle:stylepack>
        <bundle:scriptpack>
            <bundle:script src="${bundle.location}/libraries/jquery-datatables/jquery.dataTables.js" />
            <bundle:script src="${bundle.location}/js/common.js" />
            <bundle:script src="${bundle.location}/libraries/typeahead/typeahead.js/bloodhound.min.js" />
            <bundle:script src="${bundle.location}/libraries/typeahead/typeahead.js/typeahead.jquery.min.js" />
            <bundle:script src="${bundle.location}/libraries/typeahead/typeahead.js/typeahead.bundle.min.js" />
            <bundle:script src="${bundle.location}/libraries/typeahead/typeahead-front.js" />
        </bundle:scriptpack>

        <bundle:yield name="head"/>
    </head>
    <body>
    <div class="">
    <c:import url="${bundle.path}/partials/shared/navbar.jsp" charEncoding="UTF-8"/>

        <bundle:yield/>

    </div>

    <c:import url="${bundle.path}/partials/shared/footer.jsp" charEncoding="UTF-8"/>
    </body>
</html>
