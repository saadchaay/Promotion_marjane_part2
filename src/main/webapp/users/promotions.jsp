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
    <title>Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
</head>
    <body>
        <div x-data="{accept: false, reject: false, id: 0}">
            <jsp:include page="/components/header.jsp" />
            <!-- This example requires Tailwind CSS v2.0+ -->
            <%--  Accept promo modal  --%>
            <div @click.outside="accept = false" class="fixed z-10 inset-0 overflow-y-auto" aria-labelledby="modal-title" role="dialog" aria-modal="true" x-show="accept">
                <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
                    <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity" aria-hidden="true"></div>
                    <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>
                    <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
                        <form action="${pageContext.request.contextPath}/user/welcome?action=accept" method="post">
                            <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                                <div class="w-full">
                                    <div class="mt-3 text-left sm:mt-0 sm:ml-4 sm:text-left">
                                        <div class="flex justify-start items-center">
                                            <span class="mr-3 bg-green-200 text-green-600 py-1 px-3 rounded-full text-xs">accepted</span>
                                            <h3 class="text-lg leading-6 font-medium text-gray-900">
                                                Add comment
                                            </h3>
                                        </div>
                                        <div class="mt-6">
                                            <label for="comment">
                                                <textarea rows="4" name="comment" id="comment" class="px-2 py-1 border shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"></textarea>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                                <button x-bind:value="id" name="promo" type="submit" class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-blue-600 text-base font-medium text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm">Submit</button>
                                <button type="button" x-on:click="accept = false" class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <%--  Refuse promo modal  --%>
            <div @click.outside="reject = false" class="fixed z-10 inset-0 overflow-y-auto" aria-labelledby="modal-title" role="dialog" aria-modal="true" x-show="reject">
                <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
                    <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity" aria-hidden="true"></div>
                    <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>
                    <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
                        <form action="${pageContext.request.contextPath}/user/welcome?action=reject" method="post">
                            <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                                <div class="w-full">
                                    <div class="mt-3 text-left sm:mt-0 sm:ml-4 sm:text-left">
                                        <div class="flex justify-start items-center">
                                            <span class="mr-3 bg-red-200 text-red-600 py-1 px-3 rounded-full text-xs">rejected</span>
                                            <h3 class="text-lg leading-6 font-medium text-gray-900" id="modal-title">
                                                Confirmation
                                            </h3>
                                        </div>
                                        <div class="mt-6">
                                            <p>Are you sure you want to reject this promotion? </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                                <button x-bind:value="id" name="promo" type="submit" class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-blue-600 text-base font-medium text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm">Confirm</button>
                                <button type="button" x-on:click="reject = false" class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


            <main class="-mt-32">
                <div class="max-w-7xl mx-auto pb-12 px-4 sm:px-6 lg:px-8">
                    <!-- component -->
                    <div class="overflow-x-auto">
                        <div class="rounded-xl bg-white flex flex-column items-center justify-center bg-white font-sans overflow-hidden" x-data="{alert: true}">

                            <c:if test="${accept}" >
                                 <div class="mb-4 rounded-md bg-green-50 p-4" x-show="alert">
                                    <div class="flex">
                                        <div class="flex-shrink-0">
                                            <!-- Heroicon name: solid/check-circle -->
                                            <svg class="h-5 w-5 text-green-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                                            </svg>
                                        </div>
                                        <div class="ml-3">
                                            <p class="text-sm font-medium text-green-800">Accept the promotion has been successfully.</p>
                                        </div>
                                        <div class="ml-auto pl-3">
                                            <div class="-mx-1.5 -my-1.5">
                                                <div x-on:click="alert = false" type="button" class="inline-flex bg-green-50 rounded-md p-1.5 text-green-500 hover:bg-green-100 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-green-50 focus:ring-green-600">
                                                    <span class="sr-only">Dismiss</span>
                                                    <!-- Heroicon name: solid/x -->
                                                    <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                                    </svg>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${reject}" >
                                <div class="mb-4 rounded-md bg-red-50 p-4" x-show="alert">
                                    <div class="flex">
                                        <div class="flex-shrink-0">
                                            <!-- Heroicon name: solid/check-circle -->
                                            <svg class="h-5 w-5 text-red-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                                            </svg>
                                        </div>
                                        <div class="ml-3">
                                            <p class="text-sm font-medium text-red-800">Reject the promotion has been successfully.</p>
                                        </div>
                                        <div class="ml-auto pl-3">
                                            <div class="-mx-1.5 -my-1.5">
                                                <div x-on:click="alert = !alert" type="button" class="inline-flex bg-red-50 rounded-md p-1.5 text-red-500 hover:bg-red-100 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-green-50 focus:ring-green-600">
                                                    <span class="sr-only">Dismiss</span>
                                                    <!-- Heroicon name: solid/x -->
                                                    <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                                    </svg>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <div class="w-full lg:w-full mx-6">
                                <div class="bg-white shadow-md rounded my-6">
                                    <table class="min-w-max w-full table-auto">
                                        <thead>
                                        <tr class="bg-gray-200 text-gray-600 uppercase text-sm leading-normal">
                                            <th class="py-3 px-6 text-left">ID</th>
                                            <th class="py-3 px-6 text-left">End date</th>
                                            <th class="py-3 px-6 text-left">Value</th>
                                            <th class="py-3 px-6 text-center">Category</th>
                                            <th class="py-3 px-6 text-center">Status</th>
                                            <th class="py-3 px-6 text-center">Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody class="text-gray-600 text-sm font-light">
                                            <c:if test="${emptyListPromo}" >
                                            <tr class="border-b border-gray-200 bg-gray-50 hover:bg-gray-100">
                                                <td colspan="6" class="py-3 px-6 text-center text-lg text-bold">
                                                    All promotion are disabled for now, try later.
                                                </td>
                                            </tr>
                                            </c:if>
                                            <c:forEach items="${promotions}" var="promo" >
                                                <tr class="border-b border-gray-200 bg-gray-50 hover:bg-gray-100">
                                                    <td class="py-3 px-6 text-left">
                                                        <div class="flex items-center">
                                                            <span class="font-medium">#00${promo.getId()}</span>
                                                        </div>
                                                    </td>
                                                    <td class="py-3 px-6 text-left">
                                                        <div class="flex items-center">
                                                            <span class="font-medium">${promo.getEndDate()}</span>
                                                        </div>
                                                    </td>
                                                    <td class="py-3 px-6 text-left">
                                                        <div class="flex items-center">
                                                            <span>${promo.getValue()} %</span>
                                                        </div>
                                                    </td>
                                                    <td class="py-3 px-6 text-center">
                                                        <div class="flex items-center justify-center">
                                                            <span>${promo.getCategoriesByCategoryId().getName()}</span>
                                                        </div>
                                                    </td>
                                                    <td class="py-3 px-6 text-center">
                                                      <span class="bg-yellow-200 text-yellow-600 py-1 px-3 rounded-full text-xs">Pending</span>
                                                    </td>
                                                   <td class="py-3 px-6 text-center">
                                                        <div class="flex item-center justify-center">
                                                            <a x-on:click="id = ${promo.getId()}, reject = true" class="w-4 mr-2 transform hover:text-red-600 hover:scale-110 hover:cursor-pointer">
                                                                <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path></svg>
                                                            </a>
                                                            <a x-on:click="id = ${promo.getId()}, accept = true" class="w-4 mr-2 transform hover:text-green-600 hover:scale-110 hover:cursor-pointer">
                                                                <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6.267 3.455a3.066 3.066 0 001.745-.723 3.066 3.066 0 013.976 0 3.066 3.066 0 001.745.723 3.066 3.066 0 012.812 2.812c.051.643.304 1.254.723 1.745a3.066 3.066 0 010 3.976 3.066 3.066 0 00-.723 1.745 3.066 3.066 0 01-2.812 2.812 3.066 3.066 0 00-1.745.723 3.066 3.066 0 01-3.976 0 3.066 3.066 0 00-1.745-.723 3.066 3.066 0 01-2.812-2.812 3.066 3.066 0 00-.723-1.745 3.066 3.066 0 010-3.976 3.066 3.066 0 00.723-1.745 3.066 3.066 0 012.812-2.812zm7.44 5.252a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>
