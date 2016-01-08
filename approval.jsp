<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<bundle:layout page="layouts/layout.jsp">
    <bundle:variable name="head">
        <title>${text.escape(form.name)}</title>
    </bundle:variable>
    <div class='container'>
      <section class="page">
        <div class="page-header">
          <h1>${text.escape(form.name)}</h1>
          <c:if test="${not empty form.getAttribute('uses_requested_for') && form.getAttributeValue('uses_requested_for') == 'true'}">
            <div class="requestedForButton">Requested For:
              <button id="requestedForButton" data-question="Requested For" data-divid="requestedForButton" class="btn btn-default personSearchButton" type="button">
                <c:if test="${not empty submission}">${submission.getValue("Requested For")}</c:if>
                <c:if test="${empty submission}">${identity.user.displayName}</c:if>
              </button>
            </div>
          </c:if>
        </div>
        <div class="errors"></div>
        <app:bodyContent/>

        <%-- Review Request Work Around for Approvals  --%>
        <div id="reviewRequest" style="display:none;">
          <%--  Check to see if the Submission has a Parent Instance ID value set as one of it's questions --%>
          <c:if test="${not empty submission.valuesMap['Parent Instance ID']}">
            <%--  Lookup the Parent Submission and set it as a variable for use latr  --%>
            <c:set var="parentSubmission" value="${Submissions.retrieve(submission.getValue('Parent Instance ID'))}"/>
            <%--  Build up the Page Tabs if more than one page  --%>
            <c:if test="${fn:length(parentSubmission.form.pages) gt 2 }">
              <ul class="nav nav-tabs">
                <%-- Loop over each page and create an LI if it's not a confirmation page --%>
                <c:forEach var="parentPage" varStatus="stat1" items="${parentSubmission.form.pages}">
                  <c:if test="${parentPage.type ne 'confirmation'}">
                    <li class="${stat1.first ? 'active' : ''}"><a data-toggle="tab" href="#${fn:replace(parentPage.name,' ', '')}">${parentPage.name}</a></li>
                  </c:if>
                </c:forEach>
              </ul>
            </c:if>
            <%-- Build the content of each page by looping over each page and getting it's fields  --%>
            <div class="tab-content">
              <c:forEach var="parentPage" varStatus="stat2" items="${parentSubmission.form.pages}">
                <c:if test="${parentPage.type ne 'confirmation'}">
                  <div id="${fn:replace(parentPage.name,' ', '')}" class="tab-pane fade ${stat2.first ? ' in active' : ''}">
                    <h3>${parentPage.name}</h3>
                    <c:forEach var="parentField" items="${parentPage.fields}">
                      <%--  Only Show the parent submission's question/answer if it has a value  --%>
                      <c:if test="${not empty parentSubmission.valuesMap[parentField.name]}">
                        <div class="form-group" data-element-type="wrapper">
                          <%--  Build the HTML for the question and answer --%>
                          <c:if test="${parentSubmission.valuesMap[parentField.name] ne ''}">
                            <label class="field-label">${parentField.name}</label>
                            <input data-element-type="field" sytle="background-color:lightgray;" disabled="disabled" type="text" value="${parentSubmission.valuesMap[parentField.name]}">
                          </c:if> 
                        </div>
                      </c:if> <%--  End Question/Answer HTML  --%>
                    </c:forEach> <%--  End Loop over each Pages Fields  --%>
                  </div>
                </c:if>
              </c:forEach> <%--  End Loop over each page  --%>
            </div>
          </c:if>
        </div>
      </section>
    </div>
</bundle:layout>