<%--
  Created by IntelliJ IDEA.
  User: ssaad_chaay
  Date: 10/28/2022
  Time: 5:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Dashboard general admin</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
    </head>
    <body>
            <div class="min-h-full">
                <jsp:include page="/components/header.jsp" />

                <main class="-mt-32">
                    <div class="max-w-7xl mx-auto pb-12 px-4 sm:px-6 lg:px-8">
                        <!-- Replace with your content -->
                        <dl class="mt-5 grid grid-cols-1 rounded-lg bg-white overflow-hidden shadow divide-y divide-gray-200 md:grid-cols-3 md:divide-y-0 md:divide-x">
                                <div class="px-4 py-5 sm:p-6">
                                    <dt class="text-base font-normal text-gray-900">Total Applied Promotion</dt>
                                    <dd class="mt-1 flex justify-between items-baseline md:block lg:flex">
                                        <div class="flex items-baseline text-2xl font-semibold text-indigo-600">
                                            71
                                        </div>

                                        <div class="inline-flex items-baseline px-2.5 py-0.5 rounded-full text-sm font-medium bg-green-100 text-green-800 md:mt-2 lg:mt-0">
                                            <!-- Heroicon name: solid/arrow-sm-up -->
                                            applied
                                        </div>
                                    </dd>
                                </div>

                                <div class="px-4 py-5 sm:p-6">
                                    <dt class="text-base font-normal text-gray-900">Total Pending Promotion</dt>
                                    <dd class="mt-1 flex justify-between items-baseline md:block lg:flex">
                                        <div class="flex items-baseline text-2xl font-semibold text-indigo-600">
                                            58
                                        </div>

                                        <div class="inline-flex items-baseline px-2.5 py-0.5 rounded-full text-sm font-medium bg-amber-200 text-amber-600 md:mt-2 lg:mt-0">
                                            <!-- Heroicon name: solid/arrow-sm-up -->
                                            pending
                                        </div>
                                    </dd>
                                </div>

                                <div class="px-4 py-5 sm:p-6">
                                    <dt class="text-base font-normal text-gray-900">Total Rejected Promotion</dt>
                                    <dd class="mt-1 flex justify-between items-baseline md:block lg:flex">
                                        <div class="flex items-baseline text-2xl font-semibold text-indigo-600">
                                            24
                                        </div>

                                        <div class="inline-flex items-baseline px-2.5 py-0.5 rounded-full text-sm font-medium bg-red-100 text-red-800 md:mt-2 lg:mt-0">
                                            <!-- Heroicon name: solid/arrow-sm-down -->
                                            rejected
                                        </div>
                                    </dd>
                                </div>
                            </dl>
                        <!-- /End replace -->
                    </div>
                </main>

                <main class="-mt-30 pb-8">
                    <div class="max-w-3xl mx-auto px-4 sm:px-6 lg:max-w-7xl lg:px-8">
                        <h1 class="sr-only">Page title</h1>
                        <!-- Main 3 column grid -->
                        <div class="grid grid-cols-1 gap-4 items-start lg:grid-cols-3 lg:gap-8">
                            <!-- Left column -->
                            <div class="grid grid-cols-1 gap-4 lg:col-span-2" x-data="{open: false, alert: true}">
                                <section aria-labelledby="section-1-title">
                                    <h2 class="sr-only" id="section-1-title">Section title</h2>
                                    <div class="rounded-lg bg-white overflow-hidden shadow">
                                        <div class="p-6" x-show="!open">
                                            <div class="mx-8 mb-8 flex justify-between w-auto">
                                                <h1 class="text-xl text-gray-600">All administrators</h1>
                                                <button x-on:click="open = !open" title="add new admin" type="button" class="inline-flex items-center p-1.5 border border-transparent rounded-lg shadow-sm text-white bg-cyan-700 hover:bg-cyan-900 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-cyan-600">
                                                    <!-- Heroicon name: solid/plus-sm -->
                                                    <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                        <path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd"></path>
                                                    </svg>
                                                </button>
                                            </div>
                                            <c:if test="${ feedback == 'success' }" >
                                                <div class="mb-4 rounded-md bg-green-50 p-4" x-show="alert">
                                                    <div class="flex">
                                                        <div class="flex-shrink-0">
                                                            <!-- Heroicon name: solid/check-circle -->
                                                            <svg class="h-5 w-5 text-green-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                                                            </svg>
                                                        </div>
                                                        <div class="ml-3">
                                                            <p class="text-sm font-medium text-green-800">Add new administrator has been successfully</p>
                                                        </div>
                                                        <div class="ml-auto pl-3">
                                                            <div class="-mx-1.5 -my-1.5">
                                                                <button x-on:click="alert = !alert" type="button" class="inline-flex bg-green-50 rounded-md p-1.5 text-green-500 hover:bg-green-100 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-green-50 focus:ring-green-600">
                                                                    <span class="sr-only">Dismiss</span>
                                                                    <!-- Heroicon name: solid/x -->
                                                                    <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                                                    </svg>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${ feedback == 'error' }" >
                                                <div class="mb-4 rounded-md bg-red-50 p-4" x-show="alert">
                                                    <div class="flex">
                                                        <div class="flex-shrink-0">
                                                            <!-- Heroicon name: solid/check-circle -->
                                                            <svg class="h-5 w-5 text-red-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path>
                                                            </svg>
                                                        </div>
                                                        <div class="ml-3">
                                                            <p class="text-sm font-medium text-red-800">The email already exists, or the store has reserved to another admin.</p>
                                                        </div>
                                                        <div class="ml-auto pl-3">
                                                            <div class="-mx-1.5 -my-1.5">
                                                                <button x-on:click="alert = !alert " type="button" class="inline-flex bg-red-50 rounded-md p-1.5 text-red-500 hover:bg-red-100 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-red-50 focus:ring-red-600">
                                                                    <span class="sr-only">Dismiss</span>
                                                                    <!-- Heroicon name: solid/x -->
                                                                    <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                                                    </svg>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <div class="bg-white shadow overflow-hidden sm:rounded-md">
                                                <ul role="list" class="divide-y divide-gray-200">
                                                    <c:forEach var="admin" items="${admins}">
                                                        <li>
                                                            <a href="#" class="block hover:bg-gray-50">
                                                                <div class="flex items-center px-4 py-4 sm:px-6">
                                                                    <div class="min-w-0 flex-1 flex items-center">
                                                                        <div class="flex-shrink-0">
                                                                            <img class="h-12 w-12 rounded-full" src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="">
                                                                        </div>
                                                                        <div class="min-w-0 flex-1 px-4 md:grid md:grid-cols-2 md:gap-4">
                                                                            <div>
                                                                                <p class="text-sm font-medium text-indigo-600 truncate">${admin.getName()}</p>
                                                                                <p class="mt-2 flex items-center text-sm text-gray-500">
                                                                                    <!-- Heroicon name: solid/mail -->
                                                                                    <svg class="flex-shrink-0 mr-1.5 h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                                        <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"></path>
                                                                                        <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"></path>
                                                                                    </svg>
                                                                                    <span class="truncate">${admin.getEmail()}</span>
                                                                                </p>
                                                                            </div>
                                                                            <div class="hidden md:block">
                                                                                <div>
                                                                                    <p class="text-sm text-gray-900">
                                                                                        Applied on
                                                                                        <time datetime="2020-01-07">January 7, 2020</time>
                                                                                    </p>
                                                                                    <p class="mt-2 flex items-center text-sm text-gray-500">
                                                                                        <!-- Heroicon name: solid/check-circle -->
                                                                                        <svg class="flex-shrink-0 mr-1.5 h-5 w-5 text-green-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                                                                                        </svg>
                                                                                        ${admin.getStoresByStoreId().getName()}
                                                                                    </p>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div>
                                                                        <!-- Heroicon name: solid/chevron-right -->
                                                                        <svg class="h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                            <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                                                                        </svg>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="p-6" x-show="open">
                                            <div class="mx-8 mb-8 flex justify-between w-auto">
                                                <h1 class="text-xl text-gray-600">Add new admin</h1>
                                                <button x-on:click="open = !open" title="cancel" class="inline-flex items-center p-1.5 border border-transparent rounded-lg shadow-sm text-white bg-gray-600 hover:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-600">
                                                    <!-- Heroicon name: solid/plus-sm -->
                                                    Cancel
                                                </button>
                                            </div>

                                            <form action="${pageContext.request.contextPath}/general/dashboard" method="POST">
                                                <div class="shadow overflow-hidden sm:rounded-md">
                                                    <div class="px-4 py-5 bg-white sm:p-6">
                                                        <div class="grid grid-cols-6 gap-6">
                                                            <div class="col-span-6 sm:col-span-3">
                                                                <label for="name" class="block text-sm font-medium text-gray-700">Full name</label>
                                                                <input type="text" name="name" id="name" autocomplete="name" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                                            </div>

                                                            <div class="col-span-6 sm:col-span-3">
                                                                <label for="store" class="block text-sm font-medium text-gray-700">Store</label>
                                                                <select id="store" name="store" autocomplete="store" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                                                    <c:forEach items="${stores}" var="store">
                                                                        <option value="${store.getId()}">${store.getName()}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>

                                                            <div class="col-span-6 sm:col-span-3">
                                                                <label for="email-address" class="block text-sm font-medium text-gray-700">Email address</label>
                                                                <input type="text" name="email" id="email-address" autocomplete="email" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                                            </div>

                                                            <div class="col-span-6 sm:col-span-3">
                                                                <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                                                                <input type="password" name="password" id="password" autocomplete="password" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="px-4 py-3 bg-gray-50 text-right sm:px-6">
                                                        <button type="submit" class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-cyan-700 hover:bg-cyan-900 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-cyan-500">Save</button>
                                                    </div>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
                                </section>
                            </div>

                            <!-- Right column -->
                            <div class="grid grid-cols-1 gap-4">
                                <section aria-labelledby="section-2-title">
                                    <h2 class="sr-only" id="section-2-title">Section title</h2>
                                    <div class="rounded-lg bg-white overflow-hidden shadow">
                                        <div class="p-6">
                                            <h1 class="ml-4 mb-8 text-xl text-gray-600">All store</h1>
                                            <div class="bg-white shadow overflow-hidden sm:rounded-md">
                                                <ul role="list" class="divide-y divide-gray-200">
                                                    <%--<c:forEach items="${stores}" var="store" >
                                                        <li>
                                                            <a href="#" class="block hover:bg-gray-50">
                                                                <div class="px-4 py-4 sm:px-6">
                                                                    <div class="flex items-center justify-between">
                                                                        <p class="text-sm font-medium text-indigo-600 truncate">
                                                                            ${store.getName()}</p>
                                                                    </div>
                                                                    <div class="mt-2 sm:flex sm:justify-between">
                                                                        <div class="sm:flex">
                                                                            <p class="flex items-center text-sm text-gray-500">
                                                                                <!-- Heroicon name: solid/users -->
                                                                                <svg class="flex-shrink-0 mr-1.5 h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                                    <path d="M9 6a3 3 0 11-6 0 3 3 0 016 0zM17 6a3 3 0 11-6 0 3 3 0 016 0zM12.93 17c.046-.327.07-.66.07-1a6.97 6.97 0 00-1.5-4.33A5 5 0 0119 16v1h-6.07zM6 11a5 5 0 015 5v1H1v-1a5 5 0 015-5z"></path>
                                                                                </svg>
                                                                                <c:forEach items="${admins}" var="admin" >
                                                                                    <c:if test="${ admin.getStoreId() == store.getId() }" >
                                                                                        ${admin.getName()}
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                            </p>
                                                                            <p class="mt-2 flex items-center text-sm text-gray-500 sm:mt-0 sm:ml-6">
                                                                                <!-- Heroicon name: solid/location-marker -->
                                                                                <svg class="flex-shrink-0 mr-1.5 h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                                    <path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd"></path>
                                                                                </svg>
                                                                                ${store.getCity()}
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </li>
                                                    </c:forEach>--%>
                                                    <c:forEach items="${admins}" var="admin" >
                                                        <li>
                                                            <a href="#" class="block hover:bg-gray-50">
                                                                <div class="px-4 py-4 sm:px-6">
                                                                    <div class="flex items-center justify-between">
                                                                        <p class="text-sm font-medium text-indigo-600 truncate">
                                                                            ${admin.getStoresByStoreId().getName()}</p>
                                                                    </div>
                                                                    <div class="mt-2 sm:flex sm:justify-between">
                                                                        <div class="sm:flex">
                                                                            <p class="flex items-center text-sm text-gray-500">
                                                                                <!-- Heroicon name: solid/users -->
                                                                                <svg class="flex-shrink-0 mr-1.5 h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                                    <path d="M9 6a3 3 0 11-6 0 3 3 0 016 0zM17 6a3 3 0 11-6 0 3 3 0 016 0zM12.93 17c.046-.327.07-.66.07-1a6.97 6.97 0 00-1.5-4.33A5 5 0 0119 16v1h-6.07zM6 11a5 5 0 015 5v1H1v-1a5 5 0 015-5z"></path>
                                                                                </svg>
<%--                                                                                <c:forEach items="${admins}" var="admin" >--%>
<%--                                                                                    <c:if test="${ admin.getStoreId() == store.getId() }" >--%>
<%--                                                                                        ${admin.getName()}--%>
<%--                                                                                    </c:if>--%>
<%--                                                                                </c:forEach>--%>
                                                                                ${admin.getName()}
                                                                            </p>
                                                                            <p class="mt-2 flex items-center text-sm text-gray-500 sm:mt-0 sm:ml-6">
                                                                                <!-- Heroicon name: solid/location-marker -->
                                                                                <svg class="flex-shrink-0 mr-1.5 h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                                    <path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd"></path>
                                                                                </svg>
                                                                                ${admin.getStoresByStoreId().getCity()}
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </main>

            </div>

    </body>
</html>
