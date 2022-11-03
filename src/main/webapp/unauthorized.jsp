<%--
  Created by IntelliJ IDEA.
  User: ssaad_chaay
  Date: 10/31/2022
  Time: 11:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <!-- This example requires Tailwind CSS v2.0+ -->
        <!--
          This example requires updating your template:

          ```
          <html class="h-full">
          <body class="h-full">
          ```
        -->
        <div class="bg-white min-h-full px-4 py-16 sm:px-6 sm:py-24 md:grid md:place-items-center lg:px-8">
            <div class="max-w-max mx-auto">
                <main class="sm:flex">
                    <p class="text-4xl font-extrabold text-indigo-600 sm:text-5xl">403</p>
                    <div class="sm:ml-6">
                        <div class="sm:border-l sm:border-gray-200 sm:pl-6">
                            <h1 class="text-4xl font-extrabold text-gray-900 tracking-tight sm:text-5xl">Unauthorized</h1>
                            <p class="mt-1 text-base text-gray-500">You don't have permission to access this resource.</p>
                        </div>
                        <div class="mt-10 flex space-x-3 sm:border-l sm:border-transparent sm:pl-6">
                            <a href="${pageContext.request.contextPath}/" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"> Go back home </a>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>
