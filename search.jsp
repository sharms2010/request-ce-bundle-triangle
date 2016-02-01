<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<bundle:layout page="layouts/layout.jsp">

    <bundle:variable name="head">
        <title>${text.escape(space.name)} Search</title>
    </bundle:variable>


	<div class="container">
	    <div class="page-header">
			<h1>Search Results</h1>
			<form action="${bundle.kappLocation}/search" method="GET" role="form"> 
		      <div class="form-group has-feedback">
		        <input type="text" class="states form-control predictiveText x" name="q" value="${param['q']}"/>
		        <i class="form-control-feedback fa fa-search search-catalog-icon"></i>
		      </div>
		    </form>  
		</div>
		<div class="search-results">
		    <c:if test="${text.isNotBlank(param['q'])}">
		    	<ul>
		    		<c:forEach items="${kapp.forms}" var="form">
		    			<c:if test="${text.equals(form.type.name, 'Service') || text.equals(form.type.name, 'Template')}">
			    			<c:if test="${text.contains(text.downcase(form.name), text.downcase(param['q'])) || text.contains(text.downcase(form.description), text.downcase(param['q']))}">
			    				<li>
			    					<div class="panel">
			    						<div class="panel-heading">
			    							<h3><a href="${bundle.kappLocation}/${form.slug}">
		    									<i class="fa ${text.defaultIfBlank(form.getAttributeValue('FA logo'), 'hide')}"></i>
		    									${form.name}
			    							</a></h3>
			    						</div>
			    						<div class="panel-body">${form.description}</div>
			    					</div>
			    				</li>
			    			</c:if>
		    			</c:if>
		    		</c:forEach>
		    	</ul>
		    </c:if>
		</div>
    </div>
</bundle:layout>


<script>
	$('button').on('click', function(e){
	});
</script>