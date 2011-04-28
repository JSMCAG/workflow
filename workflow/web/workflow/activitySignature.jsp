<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr"%>
<%@page import="module.workflow.presentationTier.WorkflowLayoutContext"%>
<%@page import="myorg.presentationTier.actions.ContextBaseAction"%>

<bean:define id="process" name="information" property="process" toScope="request"/>
<bean:define id="processId" name="process" property="externalId"  type="java.lang.String"/>
<bean:define id="name" name="information" property="activityName"/>
<bean:define id="activityInformationClass" name="information" property="activityClass.simpleName"/>


<h2><fr:view name="information" property="localizedName" layout="html"/></h2>

<%
	final WorkflowLayoutContext layoutContext = (WorkflowLayoutContext) ContextBaseAction.getContext(request);
%>

<jsp:include page='<%= layoutContext.getWorkflowShortBody() %>'/>

<fr:view name="signIntention" />

<html:link action="<%= "/workflowProcessManagement.do?method=viewProcess&processId=" + processId  %>">
Finish?
</html:link>