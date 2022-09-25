<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
    <head>
        <%@include file="../components/imports.jsp"%>
        <!-- CSS -->
        <link rel="stylesheet" href="<c:url value="/assets/css/style.css"/>">
        <title><c:out value="${user.name}"/> | ClonedIn</title>
    </head>
    <body style="background: #F2F2F2" >
    <jsp:include page="../components/navbar.jsp">
        <jsp:param name="id" value="${loggedUserID}" />
    </jsp:include>
    <div class="d-flex justify-content-between mt-2">
<%--        <div class="card w-100 mt-2 mr-2 ml-2" style="background: #F2F2F2">--%>
           <div class="container">
                <div class="row">
                    <div class="col-3">
                        <div class="card ml-2 mt-2 mb-2 h-70">
                            <img class="card-img-top small" src="<c:url value="/assets/images/default_profile_picture.png"/>" alt="Card image cap"/>
                            <div class="card-body pb-0">
                                <div class="d-flex justify-content-between">
                                    <h5 class="card-title" style="padding-top: 5px">
                                        <c:out value="${user.name}"/>
                                    </h5>
                                    <sec:authorize access="hasRole('ENTERPRISE')">
                                        <a href="<c:url value="/contact/${user.id}"/>">
                                            <button type="button" class="btn btn-outline-dark" style="margin-bottom: 1rem">
                                                <spring:message code="profile_contactbutton"/>
                                            </button>
                                        </a>
                                    </sec:authorize>
                                    <sec:authorize access="hasRole('USER')">
                                            <button type="button" class="btn btn-outline-dark" style="margin-bottom: 1rem"><i class="bi bi-pencil-square"></i></button>
                                    </sec:authorize>
                                </div>
                            </div>
                            <div class="card-footer bg-white">
                                <c:if test="${user.currentPosition != null}">
                                    <p class="card-text"><spring:message code="register_position"/>: <c:out value="${user.currentPosition}"/></p>
                                </c:if>
                                <c:if test="${category.present}">
                                    <p class="card-text"><spring:message code="register_category"/>: <span class="badge badge-pill badge-success"><c:out value="${category.get().name}"/></span></p>
                                </c:if>
                                <c:if test="${user.location != null}">
                                    <p class="card-text"><spring:message code="register_location"/>: <c:out value="${user.location}"/></p>
                                </c:if>
                                <c:if test="${user.description != null}">
                                    <h6 class="card-text"><b><spring:message code="register_description"/></b></h6>
                                    <p class="card-text"><c:out value="${user.description}"/></p>
                                </c:if>

                            </div>
                        </div>
                    </div>
                    <div class="col-9">
                        <div class="row mr-2">
                        <div class="card mt-2">
                            <div class="card-body pb-0">
                                <div class="d-flex justify-content-between">
                                    <h5 class="card-title"><spring:message code="profile_experience"/></h5>
                                    <sec:authorize access="hasRole('USER')">
                                    <a href="<c:url value="/createExperience/${user.id}"/>">
                                        <button type="button" class="btn waves-effect" style="background-color: #459F78; color: white; margin-bottom: 0.75rem; width: 200px">
                                            <i class="bi bi-plus-square pr-2"></i><spring:message code="profile_experiencebutton"/>
                                        </button>
                                    </a>
                                    </sec:authorize>
                                </div>
                            </div>
                            <div class="card-footer bg-white text-left">
                                    <c:choose>
                                        <c:when test="${experiences.size() > 0}">
                                            <c:forEach items="${experiences}" var="experience">
                                <h6><b> <c:out value="${experience.enterpriseName}"/> - <c:out value="${experience.position}"/> </b></h6>
                                <p style="font-size: 9pt"> <c:out value="${experience.from}"/> - <c:out value="${experience.to}"/></p>
                                                <p><c:out value="${experience.description}"/></p>
                                                <hr style="border: 1px solid grey">
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                             <p class="card-text"><b><spring:message code="profile_noexperience"/></b></p>
                                        </c:otherwise>
                                    </c:choose>
                            </div>
                        </div>
                        </div>
                        <div class="row mr-2">
                        <div class="card mt-2">
                            <div class="card-body pb-0">
                                <div class="d-flex justify-content-between">
                                    <h5 class="card-title"><spring:message code="profile_education"/></h5>
                                    <sec:authorize access="hasRole('USER')">
                                    <a href="<c:url value="/createEducation/${user.id}"/>">
                                        <button type="button" class="btn waves-effect" style="background-color: #459F78; color: white; margin-bottom: 0.75rem; width: 200px">
                                        <i class="bi bi-plus-square pr-2"></i><spring:message code="profile_educationbutton"/>
                                        </button>
                                    </a>
                                    </sec:authorize>
                                </div>
                            </div>
                            <div class="card-footer bg-white text-left">
                                   <c:choose>
                                       <c:when test="${educations.size() > 0}">
                                           <c:forEach items="${educations}" var="education">
                                               <h6><b><c:out value="${education.institutionName}"/> - <c:out value="${education.title}"/></b></h6>
                                               <p style="font-size: 9pt"><c:out value="${education.dateFrom}"/> - <c:out value="${education.dateTo}"/></p>
                                               <p><c:out value="${education.description}"/></p>
                                               <hr style="border: 1px solid grey">
                                           </c:forEach>
                                       </c:when>
                                       <c:otherwise>
                                           <p class="card-text"><b><spring:message code="profile_noeducation"/></b></p>
                                       </c:otherwise>
                                   </c:choose>
                            </div>
                        </div>
                        </div>
                        <div class="row mr-2">
                        <div class="card mt-2">
                            <div class="card-body pb-0">
                                <div class="d-flex justify-content-between">
                                    <h5 class="card-title"><spring:message code="profile_skills"/></h5>
                                    <sec:authorize access="hasRole('USER')">
                                    <a href="<c:url value="/createSkill/${user.id}"/>">
                                        <button type="button" class="btn waves-effect" style="background-color: #459F78; color: white; margin-bottom: 0.75rem; width: 200px">
                                            <i class="bi bi-plus-square pr-2"></i><spring:message code="profile_skillsbutton"/>
                                        </button>
                                    </a>
                                    </sec:authorize>
                                </div>
                            </div>
                            <div class="card-footer bg-white text-left">
                                <c:choose>
                                    <c:when test="${skills.size() > 0}">
                                        <c:forEach items="${skills}" var="skill">
                                            <span class="badge badge-pill badge-success"><c:out value="${skill.description}"/></span>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="card-text"><b><spring:message code="profile_noskills"/></b></p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
<%--        </div>--%>
    </div>
    </body>
</html>
