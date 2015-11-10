<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../package/initialization.jspf" %>
<bundle:layout>

    <bundle:variable name="head">

        <bundle:stylepack prefix="package">
            <bundle:style src="${bundle.packagePath}/css/catalog.css"/>
        </bundle:stylepack>
        <bundle:scriptpack minify="false" prefix="package-thirdparty">
            <bundle:script src="${bundle.packagePath}/libraries/jquery-datatables/jquery.dataTables.js"/>
        </bundle:scriptpack>
        <bundle:scriptpack prefix="package">
            <bundle:script src="${bundle.packagePath}/js/catalog.js"/>
        </bundle:scriptpack>

        <bundle:yield name="head"/>

    </bundle:variable>

    <div class="container">
        <c:import url="${bundle.packagePath}/views/partials/shared/navbar.jsp" charEncoding="UTF-8"/>

        <section class="configbar">
          <div class="container">
            <ul class="nav nav-tabs">
                <c:set var="pageHome" value="${kapp.getForm('home')}" scope="page"/>
                <li role="presentation" class="${pageHome.name eq form.name ? 'active' : ''}">
                    <a href="${bundle.kappLocation}"><i class="fa ${pageHome.getAttributeValue('Image Class')}"></i> Home</a>
                </li>
                <c:set var="pageRequests" value="${kapp.getForm('my-requests')}" scope="page"/>
                <li role="presentation" class="${pageRequests.name eq form.name ? 'active' : ''}">
                    <a href="${bundle.kappLocation}/my-requests"><i class="fa ${pageRequests.getAttributeValue('Image Class')}"></i> My Requests</a>
                </li>
                <c:set var="pageApprovals" value="${kapp.getForm('my-approvals')}" scope="page"/>
                <li role="presentation" class="${pageApprovals.name eq form.name ? 'active' : ''}">
                    <a href="${bundle.kappLocation}/my-approvals"><i class="fa ${pageApprovals.getAttributeValue('Image Class')}"></i> My Approvals</a>
                </li>
            </ul>
          </div>
        </section>

        <bundle:yield/>

    </div>

    <c:import url="${bundle.packagePath}/views/partials/shared/footer.jsp" charEncoding="UTF-8"/>

</bundle:layout>
