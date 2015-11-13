<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="package/initialization.jspf" %>

<bundle:layout page="views/layouts/packageLayout.jsp">
	<c:import url="${bundle.packagePath}/views/partials/shared/categoryNav.jsp" charEncoding="UTF-8"/>
    <bundle:scriptpack>
        <bundle:script src="${bundle.packagePath}/js/requestDetails.js" />
    </bundle:scriptpack>
    <bundle:stylepack>
        <bundle:style src="${bundle.packagePath}/css/requestDetails.css "/>
    </bundle:stylepack>
    <bundle:variable name="head">
        <title>Kinetic Data ${app:escape(kapp.name)}</title>
    </bundle:variable>

        <div class ="container-fluid details splitBackgound">
        <div class="container">
        <div id="leftDetails" class="col-md-4 padding-bottom-40 padding-top-40 padding-bottom-40">
          <h1>Equipment Move Request</h1>
          <h4>Request ID:</h4>
          <h4>#KR0000000000788923</h4>
         
          <h4>Request Date:</h4>
          <h4>October 27, 2015</h4>
          
          <h4>Status:</h4>
          <h4>In progress</h4>
        
          <p>This could be instructions. This could be a brief description. This could also be a status update. Esto podría ser instrucciones. Esto podría ser una breve descripción. Esto también podría ser una actualización de estado. Kini mahimong mga panudlo. Kini mahimo nga usa ka mubo nga paghulagway. Kini mahimo usab nga usa ka status update.</p>

          <button class="btn btn-primary">BUTTON HERE
            <i class="icon-control-feedback fa fa-play"></i>
          </button>
        </div>
        <div id="rightDetails" class="col-md-8 padding-bottom-40 padding-bottom-40 padding-top-40">
          <ul>
            <li class="panel panel-default arrow_box">
              <div class="panel-body">
                <h4>Request Submitted</h4>
                <h4>October 23, 2015</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam at posuere massa, a dictum lorem. Mauris eget diam ut sapien.</p>
              </div>
            </li>
             <li class="panel panel-default arrow_box">
              <div class="panel-body">
                <h4>Request Submitted</h4>
                <h4>October 23, 2015</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam at posuere massa, a dictum lorem. Mauris eget diam ut sapien. This is a sentance to increase the amount of text in the panel so that we can see if the arrow works that same with other size boxes.</p>
              </div>
            </li>
            <li class="panel panel-default arrow_box">
              <div class="panel-body">
                <h4>Request Submitted</h4>
                <h4>October 23, 2015</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam at posuere massa, a dictum lorem. Mauris eget diam ut sapien. This is a sentance to increase the amount of text in the panel so that we can see if the arrow works that same with other size boxes.</p>
              </div>
            </li>
            <li class="panel panel-default arrow_box">
              <div class="panel-body">
                <h4>Request Submitted</h4>
                <h4>October 23, 2015</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam at posuere massa, a dictum lorem. Mauris eget diam ut sapien. This is a sentance to increase the amount of text in the panel so that we can see if the arrow works that same with other size boxes.</p>
              </div>
            </li>
          </ul>
        </div>
        </div>
        </div>
    <app:bodyContent/>
</bundle:layout>
