<%@include file="package/initialization.jspf" %>
<bundle:layout>
    <bundle:variable name="head">
        <title>${app:escape(form.name)}</title>
        <app:headContent/>
    </bundle:variable>
    <h1>Submission Confirmed!</h1>
    <div>
        Submission ${submission.id} status is ${fn:toLowerCase(submission.coreState)}.
        <hr/>
        <a href="<c:url value="${bundle.kappPath}"/>">Back to ${app:escape(kapp.name)}</a> or 
        <a href="<c:url value="${bundle.kappPath}/${form.slug}"/>">Submit Another ${app:escape(form.name)}</a>.
    </div>
    <div>
        <app:bodyContent/>
    </div>
</bundle:layout>