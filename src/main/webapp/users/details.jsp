<%--
  Created by IntelliJ IDEA.
  User: ssaad_chaay
  Date: 11/2/2022
  Time: 9:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Promotion details</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
    </head>
    <body>
        <jsp:include page="/components/header.jsp" />
        <main class="-mt-32">
            <div class="max-w-7xl mx-auto pb-12 px-4 sm:px-6 lg:px-8">
                <!-- Replace with your content -->
                <div class="bg-white rounded-lg shadow px-5 py-6 sm:px-6">
                    <div class="bg-white shadow overflow-hidden sm:rounded-lg">
                        <div class="px-4 py-5 sm:px-6">
                            <h3 class="text-lg leading-6 font-medium text-gray-900">Promotion details</h3>
                            <p class="mt-1 max-w-2xl text-sm text-gray-500">#00${promo.getId()}</p>
                        </div>
                        <div class="border-t border-gray-200 px-4 py-5 sm:px-6">
                            <dl class="grid grid-cols-1 gap-x-4 gap-y-8 sm:grid-cols-2">
                                <div class="sm:col-span-1">
                                    <dt class="text-sm font-medium text-gray-500">Start from:</dt>
                                    <dd class="mt-1 text-sm text-gray-900">${promo.getStartDate()}</dd>
                                </div>
                                <div class="sm:col-span-1">
                                    <dt class="text-sm font-medium text-gray-500">End date Promotion:</dt>
                                    <dd class="mt-1 text-sm text-gray-900">${promo.getEndDate()}</dd>
                                </div>
                                <div class="sm:col-span-1">
                                    <dt class="text-sm font-medium text-gray-500">Promotion percentage:</dt>
                                    <dd class="mt-1 text-sm text-gray-900">${promo.getValue()} %</dd>
                                </div>
                                <div class="sm:col-span-1">
                                    <dt class="text-sm font-medium text-gray-500">Loyalty Value:</dt>
                                    <dd class="mt-1 text-sm text-gray-900">${promo.getLoyaltyValue()} DH</dd>
                                </div>
                                <div class="sm:col-span-2">
                                    <dt class="text-sm font-medium text-gray-500">Status</dt>
                                    <dd class="mt-1 text-sm text-gray-900">
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
                                        <c:if test="${ promo.getStatus() == 'EXPIRED' }" >
                                            <strong
                                                    class="rounded bg-gray-100 px-3 py-1.5 text-xs font-medium text-gray-700"
                                            >
                                                Expired
                                            </strong>
                                        </c:if>
                                    </dd>
                                </div>
                                <div class="sm:col-span-2">
                                    <dt class="text-sm font-medium text-gray-500">Comment</dt>
                                    <dd class="mt-1 text-sm text-gray-900">
                                        <ul role="list" class="border border-gray-200 rounded-md divide-y divide-gray-200">
                                            <li class="pl-3 pr-4 py-3 flex items-center justify-between text-sm">
                                                <div class="w-0 flex-1 flex items-center">
                                                    <!-- Heroicon name: solid/paper-clip -->
                                                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M18 10c0 3.866-3.582 7-8 7a8.841 8.841 0 01-4.083-.98L2 17l1.338-3.123C2.493 12.767 2 11.434 2 10c0-3.866 3.582-7 8-7s8 3.134 8 7zM7 9H5v2h2V9zm8 0h-2v2h2V9zM9 9h2v2H9V9z" clip-rule="evenodd"></path></svg>
                                                    <span class="ml-2 flex-1 w-0 truncate">
                                                        <c:if test="${comment != null }" >
                                                            ${comment.getComment()}
                                                        </c:if>
                                                        <c:if test="${comment == null }" >
                                                            NAN
                                                        </c:if>
                                                    </span>
                                                </div>
                                            </li>
                                        </ul>
                                    </dd>
                                </div>
                            </dl>
                        </div>
                    </div>
                </div>
                <!-- /End replace -->
            </div>
        </main>
    </body>
</html>
