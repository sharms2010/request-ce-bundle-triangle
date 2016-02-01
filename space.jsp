<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<bundle:layout page="layouts/layout.jsp">
	<bundle:variable name="head">
		<title>${text.escape(space.name)} Kapps</title>
	</bundle:variable>
	<div class="container">
		<div class="page-header">
			<h1>${text.escape(space.name)} &nbsp;<small>Kapps</small></h1>
		</div>
		<c:forEach var="kapp" items="${space.kapps}">
			<div class="col-sm-6 col-md-4 kapps" style="display:none;">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">${text.escape(kapp.name)}</h3>
					</div>
					<div class="panel-body" style="text-align:center">
						<div class="row" style="padding-bottom:20px;">
							<c:choose>
								<c:when test="${not empty kapp.getAttributeValue('fa-logo')}">
									<i class="fa fa-5x ${kapp.getAttributeValue('fa-logo')}"></i>
								</c:when>
								<c:otherwise>
									<i class="fa fa-play-circle fa-5x"></i>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="row">
							<p>
								<a href="${text.escape(kapp.slug)}" class="btn btn-warning" role="button">Open KAPP</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</bundle:layout>
<script>
	$(function (){
		$('.kapps').fadeIn();
	});
</script>