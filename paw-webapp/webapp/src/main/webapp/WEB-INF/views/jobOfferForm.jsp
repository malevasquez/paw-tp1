<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
    <%@include file="../components/imports.jsp"%>
    <!-- Script -->
    <script src="<c:url value="/assets/js/steps.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/assets/css/steps.css"/>"/>
    <title><spring:message code="jobOfferForm_pagetitle"/></title>
    <link rel="icon" type="image/x-icon" href="<c:url value="/assets/images/tabLogo.png"/>">
</head>
    <body>
        <jsp:include page="../components/navbarEmpty.jsp">
            <jsp:param name="id" value="${enterprise.id}"/>
        </jsp:include>
        <div class="d-flex justify-content-between mt-2">
            <div class="container-fluid">
                <div class="row justify-content-center mt-0">
                    <div class="col-11 col-sm-9 col-md-7 col-lg-6 text-center p-0 mt-3 mb-2">
                        <div class="card px-0 pt-4 pb-0 mt-3 mb-3"  style="background: #F2F2F2">
                            <h2><strong></strong></h2>
                            <spring:message code="jobOfferForm_position" var="positionPlaceholder"/>
                            <spring:message code="jobOfferForm_description" var="descriptionPlaceholder"/>
                            <spring:message code="jobOfferForm_salary" var="salaryPlaceholder"/>
                            <div class="row">
                                <div class="col-md-12 mx-0">
                                    <div id="msform">
                                        <c:url value="/createJobOffer/${enterprise.id}" var="postPath"/>
                                        <form:form modelAttribute="jobOfferForm" action="${postPath}" method="post">
                                            <fieldset>
                                                <div class="form-card">
                                                    <h2 class="fs-title"><spring:message code="jobOfferForm_title"/></h2>
                                                        <form:input type="text" path="jobPosition" placeholder="${positionPlaceholder}"/>
                                                        <form:errors path="jobPosition" cssClass="formError" element="p"/>
                                                        <div class="d-flex">
                                                            <label class="area" style="margin-top: 1.2rem; margin-left: 10px"><spring:message code="jobOfferForm_mode"/></label>
                                                            <div style="margin-left: 15px; margin-top: 1.2rem;">
                                                            <form:select path="mode" cssClass="list-dt ml-auto">
                                                                <form:option value="NONE"><spring:message code="select_none"/></form:option>
                                                                <form:option value="virtual"><spring:message code="select_mode1"/></form:option>
                                                                <form:option value="presencial"><spring:message code="select_mode1"/></form:option>
                                                            </form:select>
                                                            </div>
                                                        </div>
                                                        <form:input type="text" path="jobDescription" placeholder="${descriptionPlaceholder}"/>
                                                        <form:errors path="jobDescription" cssClass="formError" element="p"/>
                                                        <form:input type="text" path="salary" placeholder="${salaryPlaceholder}"/>
                                                        <form:errors path="salary" cssClass="formError" element="p"/>
                                                        <div class="d-flex">
                                                            <label class="area" style="margin-top: 1.2rem; margin-left: 10px"><spring:message code="register_category"/></label>
                                                            <div style="margin-left: 15px; margin-top: 1.2rem;">
                                                                <form:select path="category" cssClass="list-dt ml-auto">
                                                                    <form:option value="NONE"><spring:message code="select_none"/></form:option>
                                                                    <c:forEach items="${categories}" var="category">
                                                                        <form:option value="${category.name}">${category.name}</form:option>
                                                                    </c:forEach>
                                                                </form:select>
                                                            </div>
                                                        </div>
                                                </div>
                                                <p><spring:message code="register_requiredmsg"/></p>
                                                <a href="<c:url value="/profileEnterprise/${enterprise.id}"/>">
                                                    <button type="button" name="end" class="btn next action-button"><spring:message code="return_buttonmsg"/></button>
                                                </a>
                                                <button type="submit" name="end" class="btn next action-button">
                                                    <spring:message code="skillsform_buttonmsg"/>
                                                </button>
                                            </fieldset>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
