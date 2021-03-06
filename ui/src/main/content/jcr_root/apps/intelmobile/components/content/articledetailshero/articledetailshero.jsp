<%--
  Article Details Hero Component.
--%>

<%@page import="com.day.cq.wcm.api.WCMMode,com.intel.mobile.util.IntelUtil,java.util.List,com.intel.mobile.util.HeroImageUtil"%>
<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false"%>
<%
 if(WCMMode.fromRequest(request) == WCMMode.EDIT) {
    %>       
        <br/><div style="color:#FFFFFF"> Right click to Edit Article Details Hero Component </div><br/>                 
   <%    
 }
    
    pageContext.setAttribute("componentId",IntelUtil.getComponentId(resource));
    pageContext.setAttribute("componentName",component.getName() );
    List articleImageList = HeroImageUtil.getArticleImage(currentPage); 
    pageContext.setAttribute("articleImages",articleImageList);
 %> 
 
<c:choose>
	<c:when	test="${fn:length(articleImages)>0 }">
		<c:set var="style" value="" />
	</c:when>
	<c:otherwise>
		<c:set var="style" value="margin: 0px 10px 5px" />
	</c:otherwise>
</c:choose> 
 
    <div class="component" data-component="<c:out value="${pageScope.componentName}"/>" data-component-id="<c:out value="${pageScope.componentId}"/>">
         <div id="prod_2" class="hero">
           <div data-count="1" class="carousel">
                <ul class="carousel-content">
                   <c:forEach var="articleImage" items="${articleImages}" > 
                   <li>
				       <img src="<c:out value="${articleImage}"/>" alt="<c:out value="${properties.alttext}" escapeXml="false"/>"/>
                       <div class="pagination-container"><div class="pagination"></div></div>
                        <div class="" style="height:20px">
                        </div>
                   </li>
                </c:forEach>
             </ul>
           </div>
           </div>
           <div id="prod_2" class="hero">                   
            <div class="content" style="<c:out value="${style}" />">
                <c:if test="${properties.sectiontitle ne '' && not empty properties.sectiontitle }">
                    <h3><c:out value="${properties.sectiontitle}" escapeXml="false"/></h3>
                </c:if> 
                <c:if test="${properties.description ne '' && not empty properties.description }">
                    <p>
                       <div class="rte_text">
                             <c:out value="${properties.description}" escapeXml="false"/>
                       </div>
                    </p>
                </c:if> 
                <c:if test="${properties.linkurl ne '' && not empty properties.linkurl}">
                      <c:set var="window" value="" />
                      <c:set var="url" value="${properties.linkurl}" />
                          <c:if test="${fn:startsWith(url,'/content/intelmobile')}">
                          <c:set var="url" value="${url}.html" />
                      </c:if>
                      <c:if test="${properties.newwindow eq 'yes'}">
                          <c:set var="window" value="_blank" />
                      </c:if>
                      <a href="${url}" target="${window}"><c:out value="${properties.linklabel}" escapeXml="false"/></a>
                </c:if>                
                <c:if test="${properties.downloadURL ne '' && not empty properties.downloadURL }">
                      <p><a href="${properties.downloadURL}" target="_blank"><c:out value="${properties.downloadtitle}" escapeXml="false"/></a></p>
                </c:if> 
                <c:if test="${properties.displaysocial ne '' && not empty properties.displaysocial}">
                     <c:if test="${properties.displaysocial eq 'yes'}">
                        <cq:include script="/apps/intelmobile/components/content/socialmedia/socialmedia.jsp"/>
                     </c:if>             
                </c:if>                                 
               </div> 
          </div>
        </div>       
   