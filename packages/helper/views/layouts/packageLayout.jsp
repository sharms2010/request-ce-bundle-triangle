<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../package/initialization.jspf" %>
<%@include file="../../package/partials.jspf" %>

<bundle:layout>

    <bundle:variable name="head">

        <bundle:stylepack>
            <bundle:style src="${bundle.packagePath}/css/helper.css "/>
        </bundle:stylepack>
        <bundle:scriptpack>
            <bundle:script src="${bundle.packagePath}/libraries/jquery-datatables/jquery.dataTables.js" />
        </bundle:scriptpack>

        <script>
            var bundle = {
                'spacePath': "${app:escapeJs(bundle.spacePath)}"
            };
        </script>

        <bundle:yield name="head"/>

    </bundle:variable>

    <div class="">
        <c:import url="${bundle.packagePath}/views/partials/shared/navbar.jsp" charEncoding="UTF-8"/>

        <bundle:yield/>

    </div>

    <c:import url="${bundle.packagePath}/views/partials/shared/footer.jsp" charEncoding="UTF-8"/>

</bundle:layout>
