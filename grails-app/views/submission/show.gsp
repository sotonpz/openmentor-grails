
<%@ page import="uk.org.openmentor.data.Assignment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
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
</html>