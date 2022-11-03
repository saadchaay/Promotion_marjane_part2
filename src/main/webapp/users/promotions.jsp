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
        <div x-data="{modal: false, id: 0}">
            <jsp:include page="/components/header.jsp" />
            <!-- This example requires Tailwind CSS v2.0+ -->
            <div @click.outside="modal = false" class="fixed z-10 inset-0 overflow-y-auto" aria-labelledby="modal-title" role="dialog" aria-modal="true" x-show="modal">
                <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
                    <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity" aria-hidden="true"></div>
                    <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>
                    <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
                        <form>
                            <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                                <div class="w-full">
                                    <div class="mt-3 text-left sm:mt-0 sm:ml-4 sm:text-left">
                                        <div class="flex justify-start items-center">
                                            <span class="mr-3 bg-green-200 text-green-600 py-1 px-3 rounded-full text-xs">accepted</span>
                                            <h3 class="text-lg leading-6 font-medium text-gray-900" id="modal-title">
                                                Add comment
                                            </h3>
                                        </div>
                                        <div class="mt-6">
                                            <label for="comment">
                                                <textarea rows="4" name="comment" id="comment" class="border shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"></textarea>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                                <button class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-red-600 text-base font-medium text-white hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 sm:ml-3 sm:w-auto sm:text-sm">Deactivate</button>
                                <button x-bind:name="id" type="submit" class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <main class="-mt-32">
                <div class="max-w-7xl mx-auto pb-12 px-4 sm:px-6 lg:px-8">
                    <!-- component -->
                    <div class="overflow-x-auto">
                        <div class="rounded-xl bg-white flex items-center justify-center bg-white font-sans overflow-hidden">
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
                                                            <div class="w-4 mr-2 transform hover:text-red-600 hover:scale-110 hover:cursor-pointer">
                                                                <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path></svg>
                                                            </div>
                                                            <a x-on:click="id = ${promo.getId()}, modal = true" class="w-4 mr-2 transform hover:text-green-600 hover:scale-110 hover:cursor-pointer">
                                                                <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6.267 3.455a3.066 3.066 0 001.745-.723 3.066 3.066 0 013.976 0 3.066 3.066 0 001.745.723 3.066 3.066 0 012.812 2.812c.051.643.304 1.254.723 1.745a3.066 3.066 0 010 3.976 3.066 3.066 0 00-.723 1.745 3.066 3.066 0 01-2.812 2.812 3.066 3.066 0 00-1.745.723 3.066 3.066 0 01-3.976 0 3.066 3.066 0 00-1.745-.723 3.066 3.066 0 01-2.812-2.812 3.066 3.066 0 00-.723-1.745 3.066 3.066 0 010-3.976 3.066 3.066 0 00.723-1.745 3.066 3.066 0 012.812-2.812zm7.44 5.252a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                                <%--                                        <tr class="border-b border-gray-200 hover:bg-gray-100">--%>
        <%--                                            <td class="py-3 px-6 text-left">--%>
        <%--                                                <div class="flex items-center">--%>
        <%--                                                    <div class="mr-2">--%>
        <%--                                                        <img class="w-6 h-6" src="https://img.icons8.com/color/100/000000/angularjs.png"/>--%>
        <%--                                                    </div>--%>
        <%--                                                    <span class="font-medium">Angular Project</span>--%>
        <%--                                                </div>--%>
        <%--                                            </td>--%>
        <%--                                            <td class="py-3 px-6 text-left">--%>
        <%--                                                <div class="flex items-center">--%>
        <%--                                                    <div class="mr-2">--%>
        <%--                                                        <img class="w-6 h-6 rounded-full" src="https://randomuser.me/api/portraits/men/3.jpg"/>--%>
        <%--                                                    </div>--%>
        <%--                                                    <span>Taylan Bush</span>--%>
        <%--                                                </div>--%>
        <%--                                            </td>--%>
        <%--                                            <td class="py-3 px-6 text-center">--%>
        <%--                                                <div class="flex items-center justify-center">--%>
        <%--                                                    <img class="w-6 h-6 rounded-full border-gray-200 border transform hover:scale-125" src="https://randomuser.me/api/portraits/men/1.jpg"/>--%>
        <%--                                                    <img class="w-6 h-6 rounded-full border-gray-200 border -m-1 transform hover:scale-125" src="https://randomuser.me/api/portraits/women/2.jpg"/>--%>
        <%--                                                    <img class="w-6 h-6 rounded-full border-gray-200 border -m-1 transform hover:scale-125" src="https://randomuser.me/api/portraits/men/3.jpg"/>--%>
        <%--                                                </div>--%>
        <%--                                            </td>--%>
        <%--                                            <td class="py-3 px-6 text-center">--%>
        <%--                                                <span class="bg-yellow-200 text-yellow-600 py-1 px-3 rounded-full text-xs">Scheduled</span>--%>
        <%--                                            </td>--%>
        <%--                                            <td class="py-3 px-6 text-center">--%>
        <%--                                                <div class="flex item-center justify-center">--%>
        <%--                                                    <div class="w-4 mr-2 transform hover:text-purple-500 hover:scale-110">--%>
        <%--                                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">--%>
        <%--                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />--%>
        <%--                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />--%>
        <%--                                                        </svg>--%>
        <%--                                                    </div>--%>
        <%--                                                    <div class="w-4 mr-2 transform hover:text-purple-500 hover:scale-110">--%>
        <%--                                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">--%>
        <%--                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />--%>
        <%--                                                        </svg>--%>
        <%--                                                    </div>--%>
        <%--                                                    <div class="w-4 mr-2 transform hover:text-purple-500 hover:scale-110">--%>
        <%--                                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">--%>
        <%--                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />--%>
        <%--                                                        </svg>--%>
        <%--                                                    </div>--%>
        <%--                                                </div>--%>
        <%--                                            </td>--%>
        <%--                                        </tr>--%>
        <%--                                        <tr class="border-b border-gray-200 bg-gray-50 hover:bg-gray-100">--%>
        <%--                                            <td class="py-3 px-6 text-left">--%>
        <%--                                                <div class="flex items-center">--%>
        <%--                                                    <div class="mr-2">--%>
        <%--                                                        <img class="w-6 h-6" src="https://cdn3.iconfinder.com/data/icons/popular-services-brands/512/laravel-64.png"/>--%>
        <%--                                                    </div>--%>
        <%--                                                    <span class="font-medium">Laravel Project</span>--%>
        <%--                                                </div>--%>
        <%--                                            </td>--%>
        <%--                                            <td class="py-3 px-6 text-left">--%>
        <%--                                                <div class="flex items-center">--%>
        <%--                                                    <div class="mr-2">--%>
        <%--                                                        <img class="w-6 h-6 rounded-full" src="https://randomuser.me/api/portraits/men/4.jpg"/>--%>
        <%--                                                    </div>--%>
        <%--                                                    <span>Tarik Novak</span>--%>
        <%--                                                </div>--%>
        <%--                                            </td>--%>
        <%--                                            <td class="py-3 px-6 text-center">--%>
        <%--                                                <div class="flex items-center justify-center">--%>
        <%--                                                    <img class="w-6 h-6 rounded-full border-gray-200 border transform hover:scale-125" src="https://randomuser.me/api/portraits/men/1.jpg"/>--%>
        <%--                                                    <img class="w-6 h-6 rounded-full border-gray-200 border -m-1 transform hover:scale-125" src="https://randomuser.me/api/portraits/women/2.jpg"/>--%>
        <%--                                                    <img class="w-6 h-6 rounded-full border-gray-200 border -m-1 transform hover:scale-125" src="https://randomuser.me/api/portraits/men/3.jpg"/>--%>
        <%--                                                </div>--%>
        <%--                                            </td>--%>
        <%--                                            <td class="py-3 px-6 text-center">--%>
        <%--                                                <span class="bg-red-200 text-red-600 py-1 px-3 rounded-full text-xs">Pending</span>--%>
        <%--                                            </td>--%>
        <%--                                            <td class="py-3 px-6 text-center">--%>
        <%--                                                <div class="flex item-center justify-center">--%>
        <%--                                                    <div class="w-4 mr-2 transform hover:text-purple-500 hover:scale-110">--%>
        <%--                                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">--%>
        <%--                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />--%>
        <%--                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />--%>
        <%--                                                        </svg>--%>
        <%--                                                    </div>--%>
        <%--                                                    <div class="w-4 mr-2 transform hover:text-purple-500 hover:scale-110">--%>
        <%--                                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">--%>
        <%--                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />--%>
        <%--                                                        </svg>--%>
        <%--                                                    </div>--%>
        <%--                                                    <div class="w-4 mr-2 transform hover:text-purple-500 hover:scale-110">--%>
        <%--                                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">--%>
        <%--                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />--%>
        <%--                                                        </svg>--%>
        <%--                                                    </div>--%>
        <%--                                                </div>--%>
        <%--                                            </td>--%>
        <%--                                        </tr>--%>
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
