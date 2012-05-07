<%@ page import="uk.org.openmentor.data.Assignment" %>
<%@ page import="uk.org.openmentor.data.Submission" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
<<<<<<< HEAD
        <title><g:message code="assignment.show.label" /></title>
    </head>
    <body>
        <div id="page">
        <div class="body">
            <h1><g:message code="assignment.show.label" /></h1>
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <span>Total comments: ${book.getProperty("CommentCount")}</span>
            <div class="list">
                <table>
                    <thead>
                        <tr>         
                            <th>Band</th>
		            		<th>Actual</th>
		            		<th>Ideal</th>
		            		<th>Comments</th>
						</tr>
                    </thead>
                    <tbody>
                    <g:each in="${book.getDataPoints()}" status="i" var="point">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>
                            	${point}
                            </td>
                            <td>
                            	${book.getDataSeries("ActualCounts").get(i)}
                            </td>
                            <td>${book.getDataSeries("IdealCounts").get(i)}</td>
                            <td>
                            	<g:each var="comment" in="${book.getDataSeries("ActualComments").get(i)}">
									<span>${comment}</span><br/>
								</g:each>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
		</div>
		</div>
	</body>
=======
        <g:set var="entityName" value="${message(code: 'submission.label', default: 'Submission')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
	<body>
        <div id="page">
        <div class="body">
            <h1><g:message code="submission.show.label" args="${[submissionInstance.filename]}" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

			<table>
				<thead>
					<tr>
						<th><g:message code="databook.category.label"/></th>
						<th><g:message code="databook.actual.label"/></th>
						<th><g:message code="databook.ideal.label"/></th>
						<th><g:message code="databook.commentText.label"/></th>
					</tr>
				</thead>

				<tbody>
					<g:each var="band" in="${book.getDataPoints()}" status="bandIndex">
						<tr>
							<td>
								<p>
									<em>${band}</em>
								</p>
							</td>
							<td class="number"><p>${book.getDataSeries("ActualCounts")[bandIndex]}</p></td>
							<td class="number"><p>${book.getDataSeries("IdealCounts")[bandIndex]}</p></td>
							<td>
								<g:set var="limit" value="3"/>
								<g:each var="comment" in="${categorization.getBandComments(band)}" status="commentIndex">
									<p>
										<g:if test="${commentIndex <= limit}">
											${comment}
										</g:if>
									</p>
								</g:each>
								<g:if test="${commentIndex > (limit + 1)}">
									<p>
										<i>...(and ${commentIndex - limit - 1} more)
										</i>
									</p>
								</g:if></td>
						</tr>
					</g:each>
				</tbody>
			</table>

		</div>
    </div>
>>>>>>> 52fe28f374d46582ff12542d69d0ca9e07dc0ac5
</html>