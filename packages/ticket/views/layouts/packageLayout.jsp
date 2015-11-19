<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../package/initialization.jspf" %>
<bundle:layout>

    <bundle:variable name="head">

        <bundle:stylepack>
            <bundle:style src="${bundle.packagePath}/css/common.css "/>
        </bundle:stylepack>
        <bundle:scriptpack>
            <bundle:script src="${bundle.packagePath}/libraries/jquery-datatables/jquery.dataTables.js" />
        </bundle:scriptpack>

        <bundle:yield name="head"/>

        <script>
            var bundle = {
                'kappLocation' : "${app:escapeJs(bundle.kappLocation)}",
                'kappPath' : "${app:escapeJs(bundle.kappPath)}",
                'location': "${app:escapeJs(bundle.location)}",
                'packageLocation': "${app:escapeJs(bundle.packageLocation)}",
                'packagePath' : "${app:escapeJs(bundle.packagePath)}",
                'path': "${app:escapeJs(bundle.path)}",
                'spaceLocation' : "${app:escapeJs(bundle.spaceLocation)}",
                'spacePath': "${app:escapeJs(bundle.spacePath)}"
            };
        </script>

    </bundle:variable>

    <div>
        <c:import url="${bundle.packagePath}/views/partials/shared/navbar.jsp" charEncoding="UTF-8"/>

        <bundle:yield/>

    </div>

    <c:import url="${bundle.packagePath}/views/partials/shared/footer.jsp" charEncoding="UTF-8"/>

</bundle:layout>
