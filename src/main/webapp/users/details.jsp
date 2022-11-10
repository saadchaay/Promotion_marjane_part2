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
                                        ${promo.getStatus()}
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
