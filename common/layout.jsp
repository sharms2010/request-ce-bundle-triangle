<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../triangle/bundle/initialization.jspf" %>
<bundle:layout>

    <bundle:variable name="head">

        <bundle:stylepack>
            <bundle:style src="${bundle.bundlePath}/css/common.css "/>
        </bundle:stylepack>
        <bundle:scriptpack>
            <bundle:script src="${bundle.packagePath}/libraries/jquery-datatables/jquery.dataTables.js" />
            <bundle:script src="${bundle.packagePath}/js/common.js" />
        </bundle:scriptpack>

        <bundle:yield name="head"/>

    </bundle:variable>

    <div class="">
        <c:import url="${bundle.packagePath}/partials/shared/navbar.jsp" charEncoding="UTF-8"/>

        <bundle:yield/>

    </div>

    <c:import url="${bundle.packagePath}/partials/shared/footer.jsp" charEncoding="UTF-8"/>

</bundle:layout>
