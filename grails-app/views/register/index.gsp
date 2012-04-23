<html>

<head>
	<meta name='layout' content='register'/>
	<title><g:message code='spring.security.ui.register.title'/></title>
</head>

<body>

<p/>

<s2ui:form width='650' height='300' elementId='loginFormContainer'
           titleCode='spring.security.ui.register.description' center='true'>

<g:form action='register' name='registerForm'>

	<g:if test='${emailSent}'>
	<br/>
	<g:message code='spring.security.ui.register.sent'/>
	</g:if>
	<g:else>

	<br/>

	<table>
	<tbody>

		<s2ui:textFieldRow name='username' labelCode='user.username.label' bean="${command}"
                         size='40' labelCodeDefault='Username' value="${command.username}"/>

		<s2ui:textFieldRow name='email' bean="${command}" value="${command.email}"
		                   size='40' labelCode='user.email.label' labelCodeDefault='E-mail'/>
		
		<s2ui:textFieldRow name='tutorId' bean="${tutor}" value="${tutor?.tutorId}"
		                   size='40' labelCode='tutor.tutorId.label' labelCodeDefault='Tutor Id'/>
		
		<s2ui:textFieldRow name='familyName' bean="${tutor}" value="${tutor?.familyName}"
		                   size='40' labelCode='tutor.familyName.label' labelCodeDefault='Family Name'/>
		
		<s2ui:textFieldRow name='givenName' bean="${tutor}" value="${tutor?.givenName}"
		                   size='40' labelCode='tutor.givenName.label' labelCodeDefault='Given Name'/>
		
		<tr class="prop">
			<td valign="top" class="name">
				<label for="course">Course</label>
			</td>
			<td valign="top" class="value">
				<g:select optionKey="courseId" optionValue="courseTitle" name="course" from="${courseList}"/>
			</td>
		</tr>
		<s2ui:passwordFieldRow name='password' labelCode='user.password.label' bean="${command}"
                             size='40' labelCodeDefault='Password' value="${command.password}"/>

		<s2ui:passwordFieldRow name='password2' labelCode='user.password2.label' bean="${command}"
                             size='40' labelCodeDefault='Password (again)' value="${command.password2}"/>

	</tbody>
	</table>

	<s2ui:submitButton elementId='create' form='registerForm' messageCode='spring.security.ui.register.submit'/>

	</g:else>

</g:form>

</s2ui:form>

<script>
$(document).ready(function() {
	$('#username').focus();
});
</script>

</body>
</html>
