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
          <jsp:include page="/components/header.jsp" />
          <main class="-mt-32">
              <div class="max-w-7xl mx-auto pb-12 px-4 sm:px-6 lg:px-8">
                  <h1 class="sr-only">Page title</h1>
                  <!-- Main 3 column grid -->
                  <div class="grid grid-cols-1 gap-4 items-start lg:grid-cols-3 lg:gap-8">
                      <!-- Left column -->
                      <div class="grid grid-cols-1 gap-4 lg:col-span-2" x-data="{open: false}">
                          <section aria-labelledby="section-1-title">
                              <h2 class="sr-only" id="section-1-title">Section title</h2>
                              <div class="rounded-lg bg-white overflow-hidden shadow">
                                  <div class="bg-white rounded-lg shadow px-5 py-6 sm:px-6" x-show="!open">
                                      <div class="flex justify-between mb-6 mt-2">
                                          <h1 class="text-xl font-medium text-gray-900" id="promo-table">Promotions</h1>
                                          <button x-on:click="open = !open" class="py-2 px-3 text-white bg-cyan-700 hover:bg-cyan-900 hover:cursor-pointer rounded-md">Add Promotion</button>
                                      </div>
                                      <c:if test="${success}" >
                                          <div class="mb-4 rounded-md bg-green-50 p-4">
                                              <div class="flex">
                                                  <div class="flex-shrink-0">
                                                      <!-- Heroicon name: solid/check-circle -->
                                                      <svg class="h-5 w-5 text-green-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                          <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                                                      </svg>
                                                  </div>
                                                  <div class="ml-3">
                                                      <p class="text-sm font-medium text-green-800">Add new promotion has been successfully</p>
                                                  </div>
                                                  <div class="ml-auto pl-3">
                                                      <div class="-mx-1.5 -my-1.5">
                                                          <a href="${pageContext.request.contextPath}/admin/" type="button" class="inline-flex bg-green-50 rounded-md p-1.5 text-green-500 hover:bg-green-100 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-green-50 focus:ring-green-600">
                                                              <span class="sr-only">Dismiss</span>
                                                              <!-- Heroicon name: solid/x -->
                                                              <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                  <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                                              </svg>
                                                          </a>
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>
                                      </c:if>
                                      <c:if test="${error}" >
                                          <div class="mb-4 rounded-md bg-red-50 p-4">
                                              <div class="flex">
                                                  <div class="flex-shrink-0">
                                                      <!-- Heroicon name: solid/check-circle -->
                                                      <svg class="h-5 w-5 text-red-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                          <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path>
                                                      </svg>
                                                  </div>
                                                  <div class="ml-3">
                                                      <p class="text-sm font-medium text-red-800">Failed to add new promotion, try again.</p>
                                                  </div>
                                                  <div class="ml-auto pl-3">
                                                      <div class="-mx-1.5 -my-1.5">
                                                          <a href="${pageContext.request.contextPath}/admin/" type="button" class="inline-flex bg-red-50 rounded-md p-1.5 text-red-500 hover:bg-red-100 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-red-50 focus:ring-red-600">
                                                              <span class="sr-only">Dismiss</span>
                                                              <!-- Heroicon name: solid/x -->
                                                              <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                  <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                                              </svg>
                                                          </a>
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>
                                      </c:if>
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
                                                          Category
                                                      </div>
                                                  </th>
                                                  <th
                                                          class="whitespace-nowrap px-4 py-2 text-left font-medium text-gray-900"
                                                  >
                                                      Status
                                                  </th>
                                                  <th class="px-4 py-2"></th>
                                              </tr>
                                          </thead>
                                          <tbody class="divide-y divide-gray-200">
                                              <c:forEach items="${promotions}" var="promo">
                                                  <tr>
                                                      <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                                                          #000${promo.getId()}
                                                      </td>
                                                      <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                                                              ${promo.getEndDate()}
                                                      </td>
                                                      <td class="whitespace-nowrap px-4 py-2 text-gray-700">${promo.getValue()} %</td>
<%--                                                      <td class="whitespace-nowrap px-4 py-2 text-gray-700"> ${promo.getCategoriesByCategoryId().getName()} </td>--%>
                                                      <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                                                          <c:forEach items="${categories}" var="category" >
                                                              <c:if test="${ category.getId() == promo.getCategoryId()}" >
                                                                  ${category.getName()}
                                                              </c:if>
                                                          </c:forEach>
                                                      </td>
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
                                                      <td class="flex justify-center items-center">
                                                          <form action="${pageContext.request.contextPath}/admin/?action=delete&promo=${promo.getId()}" method="post">
                                                              <button  class="text-sm font-medium text-blue-600 hover:underline">
                                                                  <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                                                              </button>
                                                          </form>
                                                          <a href="${pageContext.request.contextPath}/admin/promo/${promo.getId()}" class="inline-flex items-center shadow-sm px-2.5 py-0.5 border border-gray-300 text-sm leading-5 font-medium rounded-full text-gray-700 bg-white hover:bg-gray-50"> View </a>
                                                      </td>
                                                  </tr>
                                              </c:forEach>
                                          </tbody>
                                      </table>
                                  </div>

                                  <div class="bg-white rounded-lg shadow px-5 py-6 sm:px-6" x-show="open">
                                      <div class="flex justify-between mb-6 mt-2">
                                          <h1 class="text-xl font-medium text-gray-900" id="add-promo-form">Add promotion</h1>
                                          <button x-on:click="open = !open" class="py-2 px-3 text-white bg-cyan-700 hover:bg-cyan-900 hover:cursor-pointer rounded-md">Close</button>
                                      </div>
                                      <!-- component -->
                                      <div class="flex items-center justify-center py-6">
                                          <!-- Author: FormBold Team -->
                                          <!-- Learn More: https://formbold.com -->
                                          <div class="mx-auto w-full max-w-[550px]" x-data="{type: 'category', subCat: false}">
                                              <form action="${pageContext.request.contextPath}/admin/?action=promo" method="post">
                                                  <div class="-mx-3 flex flex-wrap">
                                                      <div class="w-full px-3 sm:w-1/2">
                                                          <div class="mb-5">
                                                              <label for="startDate" class="mb-3 block text-base font-medium text-[#07074D]">
                                                                  Start from:
                                                              </label>
                                                              <input type="date" name="startDate" id="startDate" class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"/>
                                                          </div>
                                                      </div>
                                                      <div class="w-full px-3 sm:w-1/2">
                                                          <div class="mb-5">
                                                              <label for="endDate" class="mb-3 block text-base font-medium text-[#07074D]">
                                                                  End promotion:
                                                              </label>
                                                              <input type="date" name="endDate" id="endDate" class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"/>
                                                          </div>
                                                      </div>
                                                  </div>
                                                  <div class="-mx-3 flex flex-wrap">
                                                      <div class="w-full px-3 sm:w-1/2">
                                                          <div class="mb-5">
                                                              <label for="promoValue" class="mb-3 block text-base font-medium text-[#07074D]">
                                                                  Promotion Value
                                                              </label>
<%--                                                              <input type="text" name="promoValue" id="promoValue" placeholder="Promo Value" class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"/>--%>
                                                              <div class="relative">
                                                                  <input
                                                                          type="text"
                                                                          id="promoValue"
                                                                          placeholder="0"
                                                                          name="promoValue"
                                                                          class="w-full py-3 px-6 rounded-md border-gray-200 pr-10 shadow-sm sm:text-sm rounded-md border border-[#e0e0e0] text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-m"
                                                                  />
                                                                  <span class="pointer-events-none absolute inset-y-0 right-0 grid w-10 place-content-center text-gray-500">
                                                                    <svg class="w-6 h-5" xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><path fill="currentColor" d="M7.05 17.7a.74.74 0 0 1-.53-.22a.75.75 0 0 1 0-1.06l9.9-9.9a.75.75 0 1 1 1.06 1.06l-9.9 9.9a.74.74 0 0 1-.53.22Zm1.45-6.95a2.25 2.25 0 1 1 2.25-2.25a2.25 2.25 0 0 1-2.25 2.25Zm0-3a.75.75 0 1 0 .75.75a.76.76 0 0 0-.75-.75Zm7 10a2.25 2.25 0 1 1 2.25-2.25a2.25 2.25 0 0 1-2.25 2.25Zm0-3a.75.75 0 1 0 .75.75a.76.76 0 0 0-.75-.75Z"></path></svg>
                                                                  </span>
                                                              </div>
                                                          </div>
                                                      </div>
                                                      <div class="w-full px-3 sm:w-1/2">
                                                          <div class="mb-5">
                                                              <label class="mb-3 block text-base font-medium text-[#07074D]">
                                                                  Type:
                                                              </label>
                                                              <div class="flex justify-evenly">
                                                                  <div>
                                                                      <input x-on:click="type = 'category'" type="radio" name="typeCategory" value="CATEGORY" id="catChoice" class="peer hidden [&:checked_+_label_svg]:block" checked />

                                                                      <label for="catChoice" class="flex cursor-pointer items-center justify-center gap-2 rounded-md border border-gray-100 py-2 px-3 text-gray-900 hover:border-gray-200 peer-checked:border-blue-500 peer-checked:bg-blue-500 peer-checked:text-white">
                                                                          <svg class="hidden h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" >
                                                                              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                                                                          </svg>
                                                                          <p class="text-sm font-medium">Category</p>
                                                                      </label>
                                                                  </div>

                                                                  <div>
                                                                      <input x-on:click="type = 'subCategory'" type="radio" name="typeCategory" value="SUB_CATEGORY" id="subCatChoice" class="peer hidden [&:checked_+_label_svg]:block" />
                                                                      <label for="subCatChoice" class="flex cursor-pointer items-center justify-center gap-2 rounded-md border border-gray-100 py-2 px-3 text-gray-900 hover:border-gray-200 peer-checked:border-blue-500 peer-checked:bg-blue-500 peer-checked:text-white" >
                                                                          <svg class="hidden h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                                                              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                                                                          </svg>
                                                                          <p class="text-sm font-medium">Sub Category</p>
                                                                      </label>
                                                                  </div>
                                                              </div>
                                                          </div>

                                                      </div>
                                                  </div>

                                                  <div class="-mx-3 flex flex-wrap">
                                                      <div class="w-full px-3 sm:w-1/2">
                                                          <div class="mb-5">
                                                              <label
                                                                      for="category"
                                                                      class="mb-3 block text-base font-medium text-[#07074D]"
                                                                      x-text="type == 'category' ? 'Categories':'Sub Categories'"
                                                              >
                                                              </label>
                                                              <select name="category"
                                                                      id="category"
                                                                      class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"
                                                                      x-show="type == 'category'"
                                                              >
                                                                      <c:forEach items="${categories}" var="category">
                                                                          <option value="${category.getId()}" >${category.getName()}</option>
                                                                      </c:forEach>
                                                              </select>
                                                              <select name="category"
                                                                      class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"
                                                                      x-show="type != 'category'"
                                                              >
                                                                <c:forEach items="${subCategories}" var="category">
                                                                    <option value="${category.getId()}" >${category.getName()}</option>
                                                                </c:forEach>
                                                              </select>
                                                          </div>
                                                      </div>
                                                  </div>

                                                  <div>
                                                      <button type="submit" class="hover:shadow-form rounded-md bg-cyan-700 hover:bg-cyan-900 py-3 px-8 text-center text-base font-semibold text-white outline-none">
                                                          Submit
                                                      </button>
                                                  </div>
                                              </form>
                                          </div>
                                      </div>
                                  </div>

                              </div>
                          </section>
                      </div>

                      <!-- Right column -->
                      <div class="grid grid-cols-1 gap-4">
                          <section aria-labelledby="section-2-title" x-data="{open: false}">
                              <h2 class="sr-only" id="section-2-title">Section title</h2>
                              <div class="rounded-lg bg-white overflow-hidden shadow">
                                  <div class="p-6">
                                      <!-- All managers -->
                                      <div class="p-6" x-show="!open">
                                          <h2 class="text-base font-medium text-gray-900" id="recent-hires-title">All managers</h2>
                                          <div class="flow-root mt-6">
                                              <ul role="list" class="-my-5 divide-y divide-gray-200">
                                                  <c:forEach items="${managers}" var="manager" >
                                                      <li class="py-4">
                                                          <div class="flex items-center space-x-4">
                                                              <div class="flex-shrink-0">
                                                                  <img class="h-8 w-8 rounded-full" src="https://images.unsplash.com/photo-1519345182560-3f2917c472ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="">
                                                              </div>
                                                              <div class="flex-1 min-w-0">
                                                                  <p class="text-sm font-medium text-gray-900 truncate"> ${manager.getName()} </p>
                                                                  <p class="text-sm text-gray-500 truncate"> ${manager.getEmail()} </p>
                                                              </div>
                                                              <div>
                                                                  <a href="#" class="inline-flex items-center shadow-sm px-2.5 py-0.5 border border-gray-300 text-sm leading-5 font-medium rounded-full text-gray-700 bg-white hover:bg-gray-50"> View </a>
                                                              </div>
                                                          </div>
                                                      </li>
                                                  </c:forEach>
                                              </ul>
                                          </div>
                                          <div class="mt-6">
                                              <button x-on:click="open = !open" class="w-full flex justify-center items-center px-4 py-2 border border-gray-300 shadow-sm text-sm font-medium rounded-md text-white bg-cyan-700 hover:bg-cyan-900"> Add new manager </button>
                                          </div>
                                      </div>
                                      <div class="p-6" x-show="open">
                                          <form action="${pageContext.request.contextPath}/admin/?action=manager" method="post">
                                              <div class="flex justify-between">
                                                  <h2 class="text-base font-medium text-gray-900" id="add-manager">Add manager</h2>
                                                  <svg x-on:click="open = !open" class="w-6 h-6 text-cyan-800 hover:cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                              </div>
                                              <div class="flow-root mt-6">

                                                  <div>
                                                      <label for="name" class="block text-sm font-medium text-gray-700"> Full name </label>
                                                      <div class="mt-1">
                                                          <input id="name" name="name" type="text" autocomplete="name" required class="appearance-none block w-full px-3 py-2 border border-gray-300 shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                                      </div>
                                                  </div>

                                                  <div class="mt-3">
                                                      <label for="email" class="block text-sm font-medium text-gray-700"> Email address </label>
                                                      <div class="mt-1">
                                                          <input id="email" name="email" type="email" autocomplete="email" required class="appearance-none block w-full px-3 py-2 border border-gray-300 shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                                      </div>
                                                  </div>

                                                  <div class="mt-3">
                                                      <label for="password" class="block text-sm font-medium text-gray-700"> Password </label>
                                                      <div class="mt-1">
                                                          <input id="password" name="password" type="password" autocomplete="current-password" required class="appearance-none block w-full px-3 py-2 border border-gray-300 shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                                      </div>
                                                  </div>
                                              </div>
                                              <div class="mt-6">
                                                  <button type="submit" x-on:click="open = !open" class="w-full flex justify-center items-center px-4 py-2 border border-gray-300 shadow-sm text-sm font-medium rounded-md text-white bg-cyan-700 hover:bg-cyan-900"> Save </button>
                                              </div>
                                          </form>
                                      </div>
                                  </div>
                              </div>
                          </section>
                      </div>
                  </div>
              </div>
          </main>
    </body>
</html>
