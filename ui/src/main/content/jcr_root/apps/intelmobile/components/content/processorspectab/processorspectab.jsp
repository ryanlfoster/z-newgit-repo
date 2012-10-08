<%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %>
<%@page import="com.intel.mobile.util.ProductUtil, java.util.Map ,com.intel.mobile.util.IntelUtil, com.intel.mobile.util.ConfigUtil" %>
<%

    Map specs = ProductUtil.getProcessorSpec(currentPage);
    String heading = currentStyle.get("heading","Processor Specs");
    String comparePath = currentStyle.get("comparePath", "");
    
    if(comparePath.length()>0) {
    	comparePath = comparePath + ".html";
    }
    pageContext.setAttribute("componentId",IntelUtil.getComponentId(resource));
    pageContext.setAttribute("componentName",component.getName() );
    pageContext.setAttribute("specs",specs);
    pageContext.setAttribute("heading",heading);
    pageContext.setAttribute("comparePath",comparePath);
    
    String pagepath = currentPage.getPath();
    String compareProcessorSpecLabel = "" ;
    String fullProcessorSpecLabel = "" ;
    
 	compareProcessorSpecLabel = ConfigUtil.getConfigValues(resourceResolver,pagepath,compareProcessorSpecLabel);
 	fullProcessorSpecLabel = ConfigUtil.getConfigValues(resourceResolver,pagepath,fullProcessorSpecLabel);
 	
 	if(compareProcessorSpecLabel == null || compareProcessorSpecLabel.equalsIgnoreCase("")){
 		compareProcessorSpecLabel = "Compare Processor Specifications" ;
 	}
 	if(fullProcessorSpecLabel == null || fullProcessorSpecLabel.equalsIgnoreCase("")){
 		fullProcessorSpecLabel = "See Full Processor Specifications" ;
 	}
 	
%>
 <div class="component" data-component="<c:out value="${pageScope.componentName}"/>" data-component-id="<c:out value="${pageScope.componentId}"/>">
<li>
    <h5><a href="#"><c:out value="${heading}" /></a></h5>   
	    <ul class="specs content">
	        <c:forEach var="entry" items="${specs}">
				<c:if test="${entry.key ne 'linkURL'}">
		            <li>
		                <strong>${entry.key}:</strong>
		                ${entry.value}
		            </li>
		        </c:if>
		        <c:if test="${entry.key eq 'linkURL'}">
		        	<c:set var="linkURL" value="${entry.value}" />
		        </c:if>
	        </c:forEach>    
		    <li>
		    <c:if test="${linkURL ne null &&  linkURL ne ''}">
					<a href="${specs.linkURL}" target="_blank"><%=fullProcessorSpecLabel %></a>
			</c:if>
			
			<c:if test="${comparePath ne ''}">
				<a href="${comparePath}" target="_blank"><%=compareProcessorSpecLabel %></a>
			</c:if>		
			</li>
	    </ul>
</li>
</div>