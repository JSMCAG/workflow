<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic"%>
<%@ taglib uri="http://fenix-ashes.ist.utl.pt/fenix-renderers" prefix="fr"%>

<bean:define id="process" name="information" property="process" toScope="request"/>
<bean:define id="processId" name="process" property="externalId"  type="java.lang.String"/>
<bean:define id="name" name="information" property="activityName"/>
<bean:define id="activityInformationClass" name="information" property="class.simpleName"/>
<bean:define id="inputInterface" name="inputInterface" type="java.lang.String"/>

<jsp:include page='${context.workflowHead}'/>
<h3><fr:view name="information" property="localizedName" layout="html"/></h3>
<jsp:include page='${context.workflowShortBody}'/>

<logic:messagesPresent property="message" message="true">
	<div class="error1">
		<html:messages id="errorMessage" property="message" message="true"> 
			<span><fr:view name="errorMessage"/></span>
		</html:messages>
	</div>
</logic:messagesPresent>

<p>
	<jsp:include page='<%= "/" + inputInterface %>'/>
</p>
