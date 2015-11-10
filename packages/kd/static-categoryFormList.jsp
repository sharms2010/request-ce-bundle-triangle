<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="package/initialization.jspf" %>
<bundle:layout page="views/layouts/packageLayout.jsp">

    <bundle:variable name="head">
        <title>Kinetic Data ${app:escape(kapp.name)}</title>
    </bundle:variable>
        
    <div class="row">
        <div class="col-xs-12">
            <div class="row">
                <div class="col-md-8">
                    <h1>Services for ${app:escape(param.category)}</h1>
                    <ul>
                        <c:import url="views/partials/static/categoryFormList.jsp" charEncoding="UTF-8"/>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h3>Other Stuff</h3>
                    <div style="border:1px solid #777; padding:15px;">TODO</div>
                </div>
            </div>
        </div>
    </div>
                
    <app:bodyContent/>
</bundle:layout>