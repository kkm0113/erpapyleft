<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


     				<!-- tbody 제거 , comnGrpList.jsp 참고  -->
							<c:if test="${totalcnt eq 0 }">
								<tr>
									<td colspan="7">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
				
							<c:if test="${totalcnt > 0 }">
								<c:set var="nRow" value="${pageSize*(cpage-1)}" />
		
								<c:forEach items="${listEmployeeModel}" var="list"  >
									<tr>
										 <!-- 날짜 누르면 readonly  -->
										   <c:if test="${list.reg_yn eq 'Y'}">
										   		<td>
										   			<a  href="javascript:estOne('${list.sp_code}','${list.est_code}')" >
										   				<strong >${list.sp_date}</strong>
										   			</a>
										   		</td>
										   </c:if>
										   <c:if test="${list.reg_yn ne 'Y'}">
										   		<td>
										   			<a>
										   				${list.sp_date}
										   			</a>
										   		</td>
										   </c:if>
						                  <td> ${list.biz_name} </td>
						                  <td> ${list.pb_name} </td>
			                              <td> ${list.ps_name}</td>
			                              <td> ${list.prd_name}</td>
			                              <td> ${list.sp_gcnt}</td>
			                              <c:if test="${list.reg_yn eq 'Y'}">
				                              <td>
				                              	 <a>${list.est_code}</a>
											  </td>
			                              </c:if>
			                              <c:if test="${list.reg_yn ne 'Y'}">
				                              <td>
				                              	 <a  href="javascript:insertModal('${list.sp_code}', '${list.est_code}', '${list.biz_name}', '${list.biz_code}', '${list.ps_name}', '${list.ps_code}', '${list.pb_name}', '${list.pb_code}', '${list.prd_name} ', '${list.prd_code} ')" >
													 <strong >${list.loginID} </strong>
												 </a>
											  </td>			                              
			                              </c:if>
									</tr>
									<c:set var="nRow" value="${nRow + 1}" /> <!-- 페이징 네비게이션 -->
								</c:forEach>
							</c:if>

							<!-- 단건조회시 카운트와 연관 깊음 --> 			
							<input type="hidden"  id="totalcnt"  name="totalcnt"  value="${totalcnt}"/>