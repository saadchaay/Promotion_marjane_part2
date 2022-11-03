<%--
  Created by IntelliJ IDEA.
  User: ssaad_chaay
  Date: 11/2/2022
  Time: 12:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Promotion</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
    </head>
    <body>
        <jsp:include page="/components/header.jsp" />

        <main class="-mt-32">
            <div class="max-w-7xl mx-auto pb-12 px-4 sm:px-6 lg:px-8">
                <!-- Replace with your content -->
                <div class="bg-white rounded-lg shadow px-5 py-6 sm:px-6">
                    <table class="min-w-full divide-y divide-gray-200 text-sm">
                        <thead class="bg-gray-100">
                        <tr>
                            <th
                                    class="whitespace-nowrap px-4 py-2 text-left font-medium text-gray-900"
                            >
                                <div class="flex items-center gap-2">
                                    ID
                                </div>
                            </th>
                            <th
                                    class="whitespace-nowrap px-4 py-2 text-left font-medium text-gray-900"
                            >
                                <div class="flex items-center gap-2">
                                    End date promo
                                </div>
                            </th>
                            <th
                                    class="whitespace-nowrap px-4 py-2 text-left font-medium text-gray-900"
                            >
                                <div class="flex items-center gap-2">
                                    Value
                                </div>
                            </th>
                            <th
                                    class="whitespace-nowrap px-4 py-2 text-left font-medium text-gray-900"
                            >
                                <div class="flex items-center gap-2">
                                    Store
                                </div>
                            </th>
                            <th
                                    class="whitespace-nowrap px-4 py-2 text-left font-medium text-gray-900"
                            >
                                <div class="flex items-center gap-2">
                                    Category
                                </div>
                            </th>
                            <th
                                    class="whitespace-nowrap px-4 py-2 text-left font-medium text-gray-900"
                            >
                                Status
                            </th>
                        </tr>
                        </thead>

                        <tbody class="divide-y divide-gray-200">
                            <c:forEach items="${promotions}" var="promo" >
                                <tr>
                                    <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                                        #000${promo.getId()}
                                    </td>
                                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                                            ${promo.getEndDate()}
                                    </td>
                                    <td class="whitespace-nowrap px-4 py-2 text-gray-700">${promo.getValue()} %</td>
                                    <td class="whitespace-nowrap px-4 py-2 text-gray-700"> ${promo.getStoresByStoreId().getName()} </td>
                                    <td class="whitespace-nowrap px-4 py-2 text-gray-700"> ${promo.getCategoriesByCategoryId().getName()} </td>
                                    <td class="whitespace-nowrap px-4 py-2">
                                        <c:if test="${ promo.getStatus() == 'REJECTED' }" >
                                            <strong
                                                    class="rounded bg-red-100 px-3 py-1.5 text-xs font-medium text-red-700"
                                            >
                                                Rejected
                                            </strong>
                                        </c:if>
                                        <c:if test="${ promo.getStatus() == 'ACCEPTED' }" >
                                            <strong
                                                    class="rounded bg-green-100 px-3 py-1.5 text-xs font-medium text-green-700"
                                            >
                                                Accepted
                                            </strong>
                                        </c:if>
                                        <c:if test="${ promo.getStatus() == 'PENDING' }" >
                                            <strong
                                                    class="rounded bg-amber-100 px-3 py-1.5 text-xs font-medium text-amber-700"
                                            >
                                                Pending
                                            </strong>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>


                        </tbody>
                    </table>
                </div>
                <!-- /End replace -->
            </div>
        </main>

    </body>
</html>
